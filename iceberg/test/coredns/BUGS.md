## Wrong RCODE for Out-of-zone CNAME Target

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

**Anything else we need to know?**:

**Environment**:
- the version of CoreDNS: `CoreDNS-1.11.1, linux/arm64, go1.21.5, 45923b6e`
- Corefile: given above.
- OS: this uses the docker environment from "Compilation with Docker".
- Others:

**Notably, Bind9 replies with `NXDOMAIN` under the same setup**.

Bind9 will do the same as CoreDNS (`NOERROR`) if `+norec` is provided, but here the recursion isn't disabled in the Corefile.

This looks closely related to [#4288](https://github.com/coredns/coredns/issues/4288). In fact, [the fix for it](https://github.com/coredns/coredns/pull/4303) pointed out that this is caused by the `file` plugin using an alternate response code type `file.Result`, and added conversion code. However, the mapping still isn't exhaustive. Here I believe the actual rcode, `dns.RcodeRefused`, is not mapped correctly.

---

## Duplicate additional section records

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

**Anything else we need to know?**:

**Environment**:

- the version of CoreDNS: `CoreDNS-1.11.1, linux/arm64, go1.21.5, 45923b6e`
- Corefile: given above.
- OS: this uses the docker environment from "Compilation with Docker".
- Others:

What's happening here is that querying for `MX` triggers the additional section processing, and both answers (the two `MX` records) have the same host, leading to the address record being added twice. 

This is a relatively minor issue. Nevertheless, I'm filing this because **Bind9 does deduplicate message sections**. It can be argued that if too much of this duplication occurs, then there might be actually relevant additional records dropped because of truncation.

The two `MX` records having only the preferences different might seem strange; however there can be other record types which also triggers additional section processing (`SRV`, for example, would make sense to have two records with the same target but different ports).

---


## Mishandling of additional section processing and glue records

**What happened**:

The `file` plugin does not handle glue records properly when constructing the ADDITIONAL section.

**How to reproduce it (as minimally and precisely as possible)**:

There's two aspects of this issue. Use the following Corefile:

```txt
e.:1053 {
    header {
        response set ra
    }
    file e.txt
}
```
and the following two zone setups:

#1: 
```txt
e.              500 IN SOA      mname.com. rname.com. 3 604800 86400 2419200 604800
e.              500 IN NS       f.
f.e.            500 IN NS       f.g.e.
g.e.            500 IN NS       g.f.e.
f.g.e.          500 IN A        1.1.1.1
g.f.e.          500 IN A        2.2.2.2
```

#2: 
```txt
e.              500 IN SOA      mname.com. rname.com. 3 604800 86400 2419200 604800
e.              500 IN NS       f.
f.e.            500 IN MX       10 f.g.e.
g.e.            500 IN NS       g.f.e.
f.g.e.          500 IN A        1.1.1.1
g.f.e.          500 IN A        2.2.2.2
```

With zone #1, querying `<f.e., NS>` (output beautified):

```bash
root@e10adfbeed3f:/v# dig @127.0.0.1 -p 1053 f.e. NS

;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 34218
;; flags: qr rd ra; QUERY: 1, ANSWER: 0, AUTHORITY: 1, ADDITIONAL: 1

;; QUESTION SECTION:
;f.e.                           IN      NS

;; AUTHORITY SECTION:
f.e.                    500     IN      NS      f.g.e.
```

With zone #2, querying `<f.e., MX>` (output beautified):

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

In zone #1 we have a referral, and an address record glue (`f.g.e. A`) exists for the NS, but it is not included in the additional section.

In zone #2 we have a MX lookup which triggers additional section processing. However, since the address record (`f.g.e. A`) is a glue record (under a zone cut), it should *not* be included in the additional section.


**Anything else we need to know?**:

**Environment**:

- the version of CoreDNS: `CoreDNS-1.11.1, linux/arm64, go1.21.5, 45923b6e`
- Corefile: given above.
- OS: this uses the docker environment from "Compilation with Docker".
- Others:

Zone #1 is derived directly from the case noted in [RFC9471 section 2.2](https://datatracker.ietf.org/doc/html/rfc9471#section-2.2). The setup is called "glue for sibling domain name servers", where the glue information is *not* directly under the zone cut, but rather in another delegated zone. The RFC states that glue information SHOULD be available in this case.

Zone #2 is a slight variation of zone #1. Here the query is no longer a referral, and so the additional section is only filled by the normal additional section processing. Quoting [RFC1035](https://datatracker.ietf.org/doc/html/rfc1035#section-3.3.11) on NS records:

> NS records cause both the usual additional section processing to locate
a type A record, and, when used in a referral, a special search of the
zone in which they reside for glue information.

In other words, searching for glue is *only* desired when the response is a *referral*. **Normal additional section processing should not use glue information**. [This issue](https://gitlab.isc.org/isc-projects/bind9/-/issues/2384) from bind9 also made this clear.

(Also, I've tested the same setups with bind9. For zone #1 it includes the address record in the additional section; for zone #2 it doesn't - both correct according to the specifications.)

---

## Wrong response when DNAME leads to zonecut

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

`aa` should not be set (querying `<h.a.b., A>` directly, the `aa` bit is indeed not set), and the AUTHORITY section should include the `h.a.b. NS` record.

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

**Anything else we need to know?**:

**Environment**:

- the version of CoreDNS: `CoreDNS-1.11.1, linux/arm64, go1.21.5, 45923b6e`
- Corefile: given above.
- OS: this uses the docker environment from "Compilation with Docker".
- Others:

---


<!-- 
Reported at https://github.com/coredns/coredns/issues/4290.
Still not fixed though!

[NewComplex::0]
g.a.		500 IN SOA	mname.com. rname.com. 3 604800 86400 2419200 604800
g.a.		500 IN NS	g.g.a.
f.g.a.		500 IN AAAA	4:9:3:5:3:2:5:9
c.e.g.a.		500 IN TXT	"This is a sample text."
b.*.g.a.		500 IN A	169.241.51.181
j.g.a.		500 IN DNAME	d.i.g.a.
e.a.g.a.		500 IN NS	a.b.g.a.
*.g.a.		500 IN TXT	"This is a sample text."
h.f.g.a.		500 IN SRV	10 50 7890 f.
g.a.		500 IN TXT	"This is a sample text."
g.g.a.		500 IN A	113.122.72.229

Query: e.g.a. TXT
CoreDNS applies the *.g.a. wildcard record; however as c.e.g.a. exists, it should not.
Bind does this correctly.
(Query: x.e.g.a. should be NXDOMAIN, but CoreDNS returns NOERROR) -->


## Missing additional info after DNAME substitution

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

**Anything else we need to know?**:

**Environment**:

- the version of CoreDNS: `CoreDNS-1.11.1, linux/arm64, go1.21.5, 45923b6e`
- Corefile: given above.
- OS: this uses the docker environment from "Compilation with Docker".
- Others:

The same problem occurs if `DNAME` is changed to `CNAME` (here a `h.j. CNAME g.j.` would trigger the same issue), so the problem probably is related to `externalLookup`. The ADDITIONAL section is populated if `h.j. SRV` is queried directly.

Also, bind9 does populate the ADDITIONAL section with the same setup, no matter what.

---

## Missing additional info for wildcard records

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

**Anything else we need to know?**:

**Environment**:

- the version of CoreDNS: `CoreDNS-1.11.1, linux/arm64, go1.21.5, 45923b6e`
- Corefile: given above.
- OS: this uses the docker environment from "Compilation with Docker".
- Others:

Bind9 correctly populates the ADDITIONAL section under the same setup. Also, in CoreDNS, the additional section *is* populated when querying specifically for `<*.j., MX>`.

---

## Apex SOA/NS not included in answers after CNAME aliasing

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

**Anything else we need to know?**:

**Environment**:

- the version of CoreDNS: `CoreDNS-1.11.1, linux/arm64, go1.21.5, 45923b6e`
- Corefile: given above.
- OS: this uses the docker environment from "Compilation with Docker".
- Others:

This issue is more intricate than it appears: if the `b.a. A` record is removed, then the query `d.b.a. SOA` does return the `SOA` record in the ANSWER section!

For more related test results: 
- Querying for `b.a. SOA` directly works as intended (`SOA` included in ANSWER). 
- The same issue also appies to apex NS records (change every query type above into `NS` and the behavior is the same). 
- Finally, bind9 handles this correctly under the same setup.

---

## Glue records provided in non-referral NS queries

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

The ADDITIONAL section should be empty. `a.a.d. A` is a glue record because it is under a zone cut `a.a.d. NS`, and this response is not a referral, so glue should not be used.

**Anything else we need to know?**:

**Environment**:

- the version of CoreDNS: `CoreDNS-1.11.1, linux/arm64, go1.21.5, 45923b6e`
- Corefile: given above.
- OS: this uses the docker environment from "Compilation with Docker".
- Others:

Quoting [RFC1035](https://datatracker.ietf.org/doc/html/rfc1035#section-3.3.11) on NS records:

> NS records cause both the usual additional section processing to locate
a type A record, and, when used in a referral, a special search of the
zone in which they reside for glue information.

In other words, searching for glue is *only* desired when the response is a *referral*. **Normal additional section processing should not use glue information**. [This issue](https://gitlab.isc.org/isc-projects/bind9/-/issues/2384) from bind9 also made this clear.

Here, `a.d. NS` is the apex NS (and thus the response is not a referral), so the glue record should not be used to populate the ADDITIONAL section.

Unsurprisingly, with the same setup, bind9 indeed respond with an empty ADDITIONAL section.

---
