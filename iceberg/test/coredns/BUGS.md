## [BUG 1] Incorrect response when DNAME redirects to a zonecut

**What happened**:

When the `file` plugin chases a DNAME chain and ends up at a zonecut, the response has AA set (despite being a referral), and uses the apex NS records of the current zone as AUTHORITY, not the NS records at the zonecut. Further, if the query is for `NS`, the zonecut NS records is included in the ANSWER section.

**How to reproduce it (as minimally and precisely as possible)**:

Using the following zone file (`a.b.txt`):

```txt
a.b.			      500 IN SOA	c.d.e. f.b.e. 3 604800 86400 2419200 604800
a.b.			      500 IN NS		c.d.e.
g.a.b.			      500 IN DNAME	a.b.
h.a.b.			      500 IN NS		h.b.
```
and this Corefile:
```txt
a.b.:1053 {
    header {
        response set ra
    }
    file a.b.txt
}
```

Response for querying `<h.g.a.b., A>` (output beautified):

```bash
root@e10adfbeed3f:/v# dig @127.0.0.1 -p 1053 h.g.a.b. A

;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 14209
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 2, AUTHORITY: 1, ADDITIONAL: 1

;; QUESTION SECTION:
;h.g.a.b.                       IN      A

;; ANSWER SECTION:
g.a.b.                  500     IN      DNAME   a.b.
h.g.a.b.                500     IN      CNAME   h.a.b.

;; AUTHORITY SECTION:
a.b.                    500     IN      NS      c.d.e.
```

**What you expected to happen**:

The AUTHORITY section should include the `h.a.b. NS` record, instead of the `a.b. NS` one.

Further, if instead the query is for `NS`:
```bash
root@e10adfbeed3f:/v# dig @127.0.0.1 -p 1053 h.g.a.b. NS

;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 57896
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 3, AUTHORITY: 1, ADDITIONAL: 1

;; QUESTION SECTION:
;h.g.a.b.                       IN      NS

;; ANSWER SECTION:
g.a.b.                  500     IN      DNAME   a.b.
h.g.a.b.                500     IN      CNAME   h.a.b.
h.a.b.                  500     IN      NS      h.b.

;; AUTHORITY SECTION:
a.b.                    500     IN      NS      c.d.e.
```

The `h.a.b. NS` record is in the ANSWER section, which is incorrect. Querying for `h.a.b. NS` directly would still end up with a referral response, where the ANSWER section is empty.

(Judging from these responses, it seems that CoreDNS is just not treating the response as a referral.)

---

## [BUG 2] Missing SOA/NS records when CNAME redirects to a zone apex

**What happened**:

When the query is aliased to the zone origin after hitting a CNAME, the apex SOA/NS records are not included in the ANSWER section, if the query type is SOA/NS.

**How to reproduce it (as minimally and precisely as possible)**:

Using the following zone file (`b.a.txt`):

```txt
b.a.		500 IN SOA	mname.com. rname.com. 3 604800 86400 2419200 604800
b.a.		500 IN NS	h.b.a.
b.a.        500 IN A    1.1.1.1
d.b.a.		500 IN CNAME	b.a.
h.b.a.		500 IN A	100.235.151.110
```
and this Corefile:
```txt
b.a.:1053 {
    header {
        response set ra
    }
    file b.a.txt
}
```

Response for querying `<d.b.a., SOA>` (output beautified):

```bash
root@e10adfbeed3f:/v# dig @127.0.0.1 -p 1053 d.b.a. SOA

;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 25994
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 1, ADDITIONAL: 1

;; QUESTION SECTION:
;d.b.a.                         IN      SOA

;; ANSWER SECTION:
d.b.a.                  500     IN      CNAME   b.a.

;; AUTHORITY SECTION:
b.a.                    500     IN      NS      h.b.a.
```

**What you expected to happen**:

The ANSWER section should also include the `b.a. SOA` record because it matches the CNAME target and the query type.

---

## [BUG 3] Missing records for wildcard MXs

**What happened**:

When a wildcard record that triggers additional section processing is found, the additional section is not populated by the `file` plugin.

**How to reproduce it (as minimally and precisely as possible)**:

Using the following zone file (`j.txt`):

```txt
j.		    500 IN SOA	    mname.com. rname.com. 3 604800 86400 2419200 604800
j.		    500 IN NS	    j.
j.		    500 IN A	    240.132.119.98
*.j.		500 IN MX	    10 j.

```
and this Corefile:
```txt
j.:1053 {
    header {
        response set ra
    }
    file j.txt
}
```

Response for querying `<a.j., MX>` (output beautified):

```bash
root@e10adfbeed3f:/v# dig @127.0.0.1 -p 1053 a.j. MX 

;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 16373
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 1, ADDITIONAL: 1

;; QUESTION SECTION:
;a.j.                           IN      MX

;; ANSWER SECTION:
a.j.                    500     IN      MX      10 j.

;; AUTHORITY SECTION:
j.                      500     IN      NS      j.
```

**What you expected to happen**:

The ADDITIONAL section should include the `j. A` record because it is relevant to `*.j. MX j.`.

---

## [BUG 4] Extraneous glue records for MX queries

**What happened**:

The `file` plugin does not handle glue records properly when constructing the ADDITIONAL section.

**How to reproduce it (as minimally and precisely as possible)**:

Use the following Corefile:

```txt
e.:1053 {
    header {
        response set ra
    }
    file e.txt
}
```
and the following zone setup:

```txt
e.              500 IN SOA      mname.com. rname.com. 3 604800 86400 2419200 604800
e.              500 IN NS       f.
f.e.            500 IN MX       10 f.g.e.
g.e.            500 IN NS       g.f.e.
f.g.e.          500 IN A        1.1.1.1
g.f.e.          500 IN A        2.2.2.2
```

Querying `<f.e., MX>` (output beautified):

```bash
root@e10adfbeed3f:/v# dig @127.0.0.1 -p 1053 f.e. MX

;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 46378
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 1, ADDITIONAL: 2

;; QUESTION SECTION:
;f.e.                           IN      MX

;; ANSWER SECTION:
f.e.                    500     IN      MX      10 f.g.e.

;; AUTHORITY SECTION:
e.                      500     IN      NS      f.

;; ADDITIONAL SECTION:
f.g.e.                  500     IN      A       1.1.1.1
```

**What you expected to happen**:

In this zone we have a MX lookup which triggers additional section processing. However, since the address record (`f.g.e. A`) is a glue record (under a zone cut), it should *not* be included in the additional section. Quoting [RFC1035](https://datatracker.ietf.org/doc/html/rfc1035#section-3.3.11) on NS records:

> NS records cause both the usual additional section processing to locate
a type A record, and, when used in a referral, a special search of the
zone in which they reside for glue information.

In other words, searching for glue is *only* desired when the response is a *referral*. **Normal additional section processing should not use glue information**. [This issue](https://gitlab.isc.org/isc-projects/bind9/-/issues/2384) from bind9 also made this clear.

(Also, I've tested the same setups with bind9. For this zone it does not include the address record in the additional section.)

---

## [BUG 5] Duplicate records during the additional section handling

**What happened**:

The response from the `file` plugin may contain duplicate additional section records.

**How to reproduce it (as minimally and precisely as possible)**:

Using the following zone file (`e.txt`):

```txt
e.              500 IN SOA      mname.com. rname.com. 3 604800 86400 2419200 604800
e.              500 IN NS       f.
f.e.            500 IN MX       10 a.e.
f.e.            500 IN MX       20 a.e.
a.e.            500 IN A        1.1.1.1
```
and this Corefile:
```txt
e.:1053 {
    header {
        response set ra
    }
    file e.txt
}
```

Response for querying `<f.e., MX>` :

```bash
root@e10adfbeed3f:/v# dig @127.0.0.1 -p 1053 f.e. MX

; <<>> DiG 9.18.24-1-Debian <<>> @127.0.0.1 -p 1053 f.e. MX
; (1 server found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 3930
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 2, AUTHORITY: 1, ADDITIONAL: 3

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 1232
; COOKIE: 9d5beafaff632ac3 (echoed)
;; QUESTION SECTION:
;f.e.                           IN      MX

;; ANSWER SECTION:
f.e.                    500     IN      MX      10 a.e.
f.e.                    500     IN      MX      20 a.e.

;; AUTHORITY SECTION:
e.                      500     IN      NS      f.

;; ADDITIONAL SECTION:
a.e.                    500     IN      A       1.1.1.1
a.e.                    500     IN      A       1.1.1.1

;; Query time: 7 msec
;; SERVER: 127.0.0.1#1053(127.0.0.1) (UDP)
;; WHEN: Sun Apr 21 07:30:57 UTC 2024
;; MSG SIZE  rcvd: 142
```

**What you expected to happen**:

There is only one `A` record in the zone for the name `a.e.`, and it should not be duplicated in the additional section.

---

## [BUG 6] Erroneous return code for CNAMEs pointing out of zone

**What happened**:

When the `file` plugin chases a CNAME chain that points out-of-zone (and thus non-existent), the RCODE is `NOERROR`.

**How to reproduce it (as minimally and precisely as possible)**:

Using the following zone file (`a.txt`):

```txt
a.				      500 IN SOA	b.c.d. e.a.d. 3 604800 86400 2419200 604800
a.				      500 IN NS		b.c.d.
b.a.			      500 IN CNAME	c.
```
and this Corefile:
```txt
a.:1053 {
    header {
        response set ra
    }
    file a.txt
}
```

Response for querying `<b.a., A>` :

```bash
root@e10adfbeed3f:/v# dig @127.0.0.1 -p 1053 b.a. A

; <<>> DiG 9.18.24-1-Debian <<>> @127.0.0.1 -p 1053 b.a. A
; (1 server found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 22063
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 1, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 1232
; COOKIE: 5bc0432ca10e47b3 (echoed)
;; QUESTION SECTION:
;b.a.                           IN      A

;; ANSWER SECTION:
b.a.                    500     IN      CNAME   c.

;; AUTHORITY SECTION:
a.                      500     IN      NS      b.c.d.

;; Query time: 8 msec
;; SERVER: 127.0.0.1#1053(127.0.0.1) (UDP)
;; WHEN: Sun Apr 21 07:14:35 UTC 2024
;; MSG SIZE  rcvd: 82
```

**What you expected to happen**:

The RCODE should be `NXDOMAIN`(as the CNAME target `c.` is non-existent) or `REFUSED` (as the zone for `c.` doesn't exist). At least it should not be `NOERROR`.

---

## [BUG 7] Extraneous glue records for non-referral NS queries

**What happened**:

When the `file` plugin handles a `NS` query that is not a referral, it still populates the ADDITIONAL section using glue records.

**How to reproduce it (as minimally and precisely as possible)**:

Using the following zone file (`a.d.txt`):

```txt
a.d.		500 IN SOA	mname.com. rname.com. 3 604800 86400 2419200 604800
a.d.		500 IN NS	a.a.d.
a.a.d.		500 IN NS	e.a.d.
a.a.d.		500 IN A	66.63.47.119
```
and this Corefile:
```txt
a.d.:1053 {
    header {
        response set ra
    }
    file a.d.txt
}
```

Response for querying `<a.d., NS>` (output beautified):

```bash
root@e10adfbeed3f:/v# dig @127.0.0.1 -p 1053 a.d. NS

;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 37853
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 2

;; QUESTION SECTION:
;a.d.                           IN      NS

;; ANSWER SECTION:
a.d.                    500     IN      NS      a.a.d.

;; ADDITIONAL SECTION:
a.a.d.                  500     IN      A       66.63.47.119
```

**What you expected to happen**:

The ADDITIONAL section should be empty. `a.a.d. A` is a glue record because it is under a zone cut `a.a.d. NS`, and this response is not a referral, so glue should not be used. Quoting [RFC1035](https://datatracker.ietf.org/doc/html/rfc1035#section-3.3.11) on NS records:

> NS records cause both the usual additional section processing to locate
a type A record, and, when used in a referral, a special search of the
zone in which they reside for glue information.

In other words, searching for glue is *only* desired when the response is a *referral*. **Normal additional section processing should not use glue information**. [This issue](https://gitlab.isc.org/isc-projects/bind9/-/issues/2384) from bind9 also made this clear.

Here, `a.d. NS` is the apex NS (and thus the response is not a referral), so the glue record should not be used to populate the ADDITIONAL section.

Unsurprisingly, with the same setup, bind9 indeed respond with an empty ADDITIONAL section.

---

## [BUG 8] Missing additional records after DNAME substitution

**What happened**:

When a record that triggers additional section processing is found after doing DNAME substitution, the additional section is not populated by the `file` plugin.

**How to reproduce it (as minimally and precisely as possible)**:

Using the following zone file (`j.txt`):

```txt
j.		    500 IN SOA	    mname.com. rname.com. 3 604800 86400 2419200 604800
j.		    500 IN NS	    a.
j.		    500 IN AAAA	    5:2:2:5:5:3:7:5
h.j.		500 IN SRV	    10 50 7890 j.
g.j.		500 IN DNAME	j.
```
and this Corefile:
```txt
j.:1053 {
    header {
        response set ra
    }
    file j.txt
}
```

Response for querying `<h.g.j., SRV>` (output beautified):

```bash
root@e10adfbeed3f:/v# dig @127.0.0.1 -p 1053 h.g.j. SRV

;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 834
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 3, AUTHORITY: 1, ADDITIONAL: 1

;; QUESTION SECTION:
;h.g.j.                         IN      SRV

;; ANSWER SECTION:
g.j.                    500     IN      DNAME   j.
h.g.j.                  500     IN      CNAME   h.j.
h.j.                    500     IN      SRV     10 50 7890 j.

;; AUTHORITY SECTION:
j.                      500     IN      NS      a.
```

**What you expected to happen**:

The ADDITIONAL section should include the `j. AAAA` record because it is relevant to `h.j. SRV j.`.