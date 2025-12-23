## [BUG 11] Unexpected ANSWER and RCODE for non-existent SOA query


Zone:
```txt
a.           500 IN SOA b.c.d. e.f.d. 3 604800 86400 2419200 604800 
a.           500 IN NS  g.
```

Query: `<b.a., SOA>`

Response: 
```
root@6755885182dd:/app/hickory-dns# dig @127.0.0.1 -p 24141 b.a. SOA

; <<>> DiG 9.18.18-0ubuntu0.22.04.2-Ubuntu <<>> @127.0.0.1 -p 24141 b.a. SOA
; (1 server found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 52070
;; flags: qr aa rd; QUERY: 1, ANSWER: 1, AUTHORITY: 1, ADDITIONAL: 1
;; WARNING: recursion requested but not available

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags: do; udp: 1232
;; QUESTION SECTION:
;b.a.                           IN      SOA

;; ANSWER SECTION:
a.                      2419200 IN      SOA     b.c.d. e.f.d. 3 604800 86400 2419200 604800

;; AUTHORITY SECTION:
a.                      500     IN      NS      g.

;; Query time: 0 msec
;; SERVER: 127.0.0.1#24141(127.0.0.1) (UDP)
;; WHEN: Sun Sep 01 09:14:40 UTC 2024
;; MSG SIZE  rcvd: 93
```

Buggy Behavior: RCODE should not be `NOERROR`, and the ANSWER section should not include the `a. SOA` record.

## [BUG 12] Unexpected ADDITIONAL section for CNAME-related queries

Zone:
```txt
a.          500 IN SOA    b.c.d. e.a.d. 3 604800 86400 2419200 604800 
a.          500 IN NS     b.c.d. 
d.a.        500 IN CNAME  e.a.
e.a.        500 IN CNAME  g.a.
g.a.        500 IN A      1.1.1.1
```

Query: `<d.a. CNAME>`

Response: 
```
root@6755885182dd:/app/hickory-dns# dig @127.0.0.1 -p 24141 d.a. CNAME +norecurse

; <<>> DiG 9.18.18-0ubuntu0.22.04.2-Ubuntu <<>> @127.0.0.1 -p 24141 d.a. CNAME +norecurse
; (1 server found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 8071
;; flags: qr aa; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 2

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags: do; udp: 1232
;; QUESTION SECTION:
;d.a.                           IN      CNAME

;; ANSWER SECTION:
d.a.                    500     IN      CNAME   e.a.

;; ADDITIONAL SECTION:
e.a.                    500     IN      CNAME   g.a.

;; Query time: 10 msec
;; SERVER: 127.0.0.1#24141(127.0.0.1) (UDP)
;; WHEN: Mon Sep 02 17:07:27 UTC 2024
;; MSG SIZE  rcvd: 65
```

Buggy Behavior: should have no ADDITIONAL section
