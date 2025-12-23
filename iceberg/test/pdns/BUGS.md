## [BUG 9] Extraneous records when matching wildcard CNAMEs

Zone:

```txt
a.b.				      500 IN SOA	c.d.e. f.g.e. 3 604800 86400 2419200 604800
a.b.				      500 IN NS		h.i.a.j.
*.a.b.				      500 IN CNAME	*.a.b.
h.c.a.b.				      500 IN NS		h.i.a.j.
```

Query: `<d.a.b, CNAME>`

Response:

```bash
rcode=NOERROR
aa=true
answer=["d.a.b.				      500 IN CNAME	*.a.b.", "*.a.b.				      500 IN CNAME	*.a.b."]
authority=[]
additional=[]
```

Buggy Behavior: there should only be one CNAME RR in the answer section (the first one)

---

## [BUG 10] Extraneous SOA records after DNAME redirection

Zone:

```txt
j.		500 IN SOA	mname.com. rname.com. 3 604800 86400 2419200 604800
j.		500 IN NS	h.j.
h.j.		500 IN SRV	10 50 7890 j.
g.j.		500 IN A	175.215.96.132
i.j.		500 IN A	107.221.10.115
c.j.		500 IN A	18.82.228.218
d.j.		500 IN NS	j.
g.j.		500 IN DNAME	j.
c.j.		500 IN TXT	"iceberg"
j.		500 IN AAAA	5:2:2:5:5:3:7:5
h.j.		500 IN A	4.19.111.235
```

Query: `<c.g.j, CNAME>`

Response:

```bash
rcode=NOERROR
aa=true
answer=["g.j.		500 IN DNAME	j.", "c.g.j, CNAME"]
authority=["j.		500 IN SOA	mname.com. rname.com. 3 604800 86400 2419200 604800"]
additional=[]
```

Buggy Behavior: should not have SOA RR in authority