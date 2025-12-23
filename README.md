# Artifact Evaluation Tutorial

This tutorial guides PC members through the steps to access and evaluate our artifact for Iceberg, an automated verification framework for DNS authoritative engines. We implement Iceberg in Rust, which then takes the LLVM IR of four open-source DNS engines as input, runs symbolic execution, and achieves automated verification with refinement proof based on Just-in-Time (JIT) summarization.

This artifact contains the source code of Iceberg, as well as the artifacts of  four verification targets (CoreDNS, Bind 9, PowerDNS, and HickoryDNS). 
We also provide a [Docker image](https://hub.docker.com/r/sevenchips/iceberg-artifact) with necessary toolchains installed to run verification in. 
Follow the instructions below to reproduce Section 8 (Evaluation) of our paper.

## Getting Started

### Step 0 - Preliminaries

Ensure you have:
* Docker 
* At least 16 GB DRAM and 64 GB free disk space. **Note**: it would be more ideal to compiler and run Iceberg with 32 GB or more DRAM; verification under large zone files would be significantly slower otherwise.
* If you are using an VSCode-like IDE, we recommend **not** having the `rust-analyzer` plugin enabled, for its codebase indexing locks the project and may block you from manually running `cargo` for an extended period of time. 

Pull our artifact from GitHub:
```bash
git clone https://github.com/PRRIN/iceberg-nsdi26-artifact
git submodule update --init --recursive
# Ensure all 4 submodules are at the latest commit of branch `iceberg`; e.g.:
cd bind9
git log --oneline -1
# 39d356718a (HEAD -> iceberg, origin/iceberg) nsdi ae
```

### Step 1 - Launch the verification environment

```bash
# Under the root of the artifact folder (where iceberg/ is)
docker run -it \
  -v $(pwd):/app \
 --platform linux/amd64 \
  sevenchips/iceberg-artifact:latest
```

You should then be under `/app` in the container, where the artifact is mounted at. Verify Rust toolchain installation with:

```bash
root@200bb5d40125:/app# cargo --version
cargo 1.92.0 (344c4567c 2025-10-21)
root@200bb5d40125:/app# rustc --version
rustc 1.92.0 (ded5c06cf 2025-12-08)
```

### Step 2 - Validate Iceberg source code

Go to `/app/iceberg` in the container, and run:
```bash
cargo test --release
```

> **WARNING:** Building Iceberg from scratch under `--release` can take up to a few hours (most of the time is spent on building `Z3` and the frontends for parsing LLVM IR). If you are using our artifact and Docker image, this should not be a fresh build (only linking is performed here); but expect long waiting time if you made any changes to the project.

This will run all 106 tests in the main crate in around one minute. All of them should pass. Note that many of these tests are already non-trivial - they correspond to partial refinement of the four verification targets with certain zone file configs.

### Step 3 - Understanding the artifact

**`plots/`** - Auxiliary plotting scripts, and our verification time records.

**`iceberg/`** - Source code of Iceberg

* `llvm_frontend` and `spice_frontend` are the parsing frontends for LLVM IR and our spec language, powered by the `lalrpop` crate. The `llvm_frontend` crate is particularly time-consuming to compile due to the complexity of LLVM IR syntax, and we highly advise against changing anything in here.

* `src` is the core of Iceberg, including the symbolic execution engine in `middleend`, the Z3 backend in `backend`, and the verification adapters in `verify`.
    * Specifically, `src/verify.rs` is the entry point for verification, and `src/verify/*.rs` launches JIT summarization for each target, individually.

* `test` contains the files and resources used by all the `#[test]` functions througout the project.
    * `test/coredns` notably contains the verification input for the CoreDNS target, including the top-level spec (`coredns.spec`; this includes the library and stub specs), the full compiled IR, the source code (for reference), and the dumped states of zone configurations. The same goes for the remaining targets. **Check out the individual `README.md` files for details.**
    * `test/zonegen` contains the scripts for generating zone files (the `complex` category in Table 3).

**`coredns/`** - Snapshot of the CoreDNS verification target, slightly modified for verification and dumping the zone invariant states
* `DUMP.md` summarizes the changes made to the source code to obtain the memory states for zones. In this case, we use Golang's reflection. 
* `zone.sh` contains the script for generating JSON files from the dumped states; they are then used by the verification
* `Zones` contains the textual zone file input and the dumped JSON file output
* The same goes for the remaining targets. **Check out the individual directories for details.**

> **Note**: The compilation and memory dumping of a verification target, unfortunately, remains target-specific and rather tedious and error-prone. We do have the corresponding scripts included, but have also provided all the resulting LLVM IR and dumped JSON files, so that verification can be readily conducted with `cargo run`. 
> 
> We recommend simply following the primary instructions in the following sections to reproduce the end-to-end verification results. Curious reviewers may then look into our compilation and dumping process for optional validation.

---

## Verification: CoreDNS

We verify [CoreDNS](https://github.com/coredns/coredns) version 1.11.1, off of commit `45923b6e12a2eabaf55d7380e6df4e7354a1207d`. 

### Step 1 - Reproducing Bugs

```bash
# In docker; iceberg/
cargo run --release --bin iceberg coredns buggy 1 9
```

**Full bug list.** See `iceberg/test/coredns/BUGS.md` for a writeup of all the bugs in this verification target (8 in total, as in Table 4 in our paper).

**Checking the summaries.**
For each zone file that triggers a bug, check out the top-level summary at `iceberg/test/coredns/verify/`. For example, the summary of `iceberg/test/coredns/json/Buggy/1` would be `iceberg/test/coredns/verify/Buggy/1.sum`. Summaries are presented in the same format as documented in Table 2 of our paper. Specifically, search for `return { false`, which indicates a branch with a bug. 

Here we demonstrate the identification of [BUG 1] (the same goes for the remaining bugs). 
The zone file for this (`coredns/Zones/Buggy/1.txt`) is:
```txt
a.b.			      500 IN SOA	c.d.e. f.b.e. 3 604800 86400 2419200 604800
a.b.			      500 IN NS		c.d.e.
g.a.b.			      500 IN DNAME	a.b.
h.a.b.			      500 IN NS		h.b.
```

Searching for `return { false` in `1.sum ` yields 5 hits; if we look at the 2nd hit (other hits are different variations of this issue), and simplify its summary condition, we get:
```txt
verify_coredns: Apply
 └[Root]
   └[Specialize| verify_coredns::file is &Const::Verify::File::0 ]
     └[Specialize| verify_coredns::request is &Const::Verify::request::0 ]
       └[Specialize| verify_coredns::Global::Ptr(4000140090)::8 is 0w64 ]
         └[Specialize| verify_coredns::Global::Ptr(4000140090)::24 is 0w64 ]
           └[Specialize| verify_coredns::Global::Ptr(4000140090)::48 is 1w64 ]
             └[Specialize| verify_coredns::Global::Ptr(4000140090)::40 is &Global::Slice(400000c0a8)::0 ]
               └[Specialize| verify_coredns::Global::Slice(400000c0a8)::8 is 8w64 ]
                 └[Specialize| verify_coredns::Global::Slice(400000c0a8)::0 is &Global::Verify::qname::0 ]
                   ├[Assume| (97w8 == <verify_coredns::Global::Verify::qname::4>) ]
                     ├[Assume| (46w8 == <verify_coredns::Global::Verify::qname::5>) ]
                       ├[Assume| (98w8 == <verify_coredns::Global::Verify::qname::6>) ]
                         ├[Assume| (46w8 == <verify_coredns::Global::Verify::qname::7>) ]
                           └[Assume| (<verify_coredns::Global::Verify::qname::0> != 46w8) ]
                             ├[Assume| (<verify_coredns::Global::Verify::qname::1> == 46w8) ]
                               └[Assume| (<verify_coredns::Global::Verify::qname::2> != 46w8) ]
                                 ├[Assume| (<verify_coredns::Global::Verify::qname::3> == 46w8) ]
                                   └[Assume| ((((((<verify_coredns::Global::Slice(400000c0a8)::16> != 0w16) & (<verify_coredns::Global::Slice(400000c0a8)::16> != 251w16)) & (<verify_coredns::Global::Slice(400000c0a8)::16> != 252w16)) & (<verify_coredns::Global::Slice(400000c0a8)::16> != 43w16)) & (<verify_coredns::Global::Verify::qname::3> == 46w8)) & (<verify_coredns::Global::Verify::qname::6> != 46w8)) ]
                                     ├[Assume| (103w8 == <verify_coredns::Global::Verify::qname::2>) ]
                                       └[Assume| (<verify_coredns::Global::Slice(400000c0a8)::16> != 5w16) ]
                                         └[Assume| (103w8 != <verify_coredns::Global::Verify::qname::0>) ]
                                           ├[Assume| (104w8 == <verify_coredns::Global::Verify::qname::0>) ]
                                             ├[Assume| !(false || (<verify_coredns::Global::Slice(400000c0a8)::16> == 2w16)) ]
                                               └[Ret| ..return { false, { Enum(DnsRCode)::NOERROR, true, [ { [ 103w8, 46w8, 97w8, 46w8, 98w8, 46w8 ], 39w16, [ 97w8, 46w8, 98w8, 46w8 ] }, { [ <verify_coredns::Global::Verify::qname::0>, <verify_coredns::Global::Verify::qname::1>, <verify_coredns::Global::Verify::qname::2>, <verify_coredns::Global::Verify::qname::3>, <verify_coredns::Global::Verify::qname::4>, <verify_coredns::Global::Verify::qname::5>, <verify_coredns::Global::Verify::qname::6>, <verify_coredns::Global::Verify::qname::7> ], 5w16, [ <verify_coredns::Global::Verify::qname::0>, 46w8, 97w8, 46w8, 98w8, 46w8 ] } ], [ { [ 97w8, 46w8, 98w8, 46w8 ], 2w16, [ 99w8, 46w8, 100w8, 46w8, 101w8, 46w8 ] } ], [  ] }, { Enum(DnsRCode)::NOERROR, true, [ { [ 103w8, 46w8, 97w8, 46w8, 98w8, 46w8 ], 39w16, [ 97w8, 46w8, 98w8, 46w8 ] }, { [ <verify_coredns::Global::Verify::qname::0>, <verify_coredns::Global::Verify::qname::1>, <verify_coredns::Global::Verify::qname::2>, <verify_coredns::Global::Verify::qname::3>, <verify_coredns::Global::Verify::qname::4>, <verify_coredns::Global::Verify::qname::5>, <verify_coredns::Global::Verify::qname::6>, <verify_coredns::Global::Verify::qname::7> ], 5w16, [ <verify_coredns::Global::Verify::qname::0>, <verify_coredns::Global::Verify::qname::1>, 97w8, 46w8, 98w8, 46w8 ] } ], [ { [ 104w8, 46w8, 97w8, 46w8, 98w8, 46w8 ], 2w16, [ 104w8, 46w8, 98w8, 46w8 ] } ], [  ] } }; ]
```
We can obtain the path conditions for this bug by looking at the [Specialize] and [Assume] nodes - this bug is triggered when the query `qname` looks like "h.g.a.b." (`97w8` <==> ASCII 'a', `46w8` <==> ASCII '.', etc.), and `qtype` is not `NS` or `CNAME` (`2w16` <==> code for NS, `5w16` <==> code for CNAME). 
Further, the [Ret] node shows the details of this buggy behavior, where CoreDNS responds with:
```txt
{ 
    # RCODE
    Enum(DnsRCode)::NOERROR, 
    # AA
    true, 
    # ANSWER
    [ 
        { [ 103w8, 46w8, 97w8, 46w8, 98w8, 46w8 ], 39w16, [ 97w8, 46w8, 98w8, 46w8 ] }, 
        { [ <verify_coredns::Global::Verify::qname::0>, <verify_coredns::Global::Verify::qname::1>, <verify_coredns::Global::Verify::qname::2>, <verify_coredns::Global::Verify::qname::3>, <verify_coredns::Global::Verify::qname::4>, <verify_coredns::Global::Verify::qname::5>, <verify_coredns::Global::Verify::qname::6>, <verify_coredns::Global::Verify::qname::7> ], 5w16, [ <verify_coredns::Global::Verify::qname::0>, 46w8, 97w8, 46w8, 98w8, 46w8 ] } 
    ], 
    # AUTHORITY
    [ 
        { [ 97w8, 46w8, 98w8, 46w8 ], 2w16, [ 99w8, 46w8, 100w8, 46w8, 101w8, 46w8 ] } 
    ], 
    # ADDITIONAL
    [  ] 
}
```
and the specification's response is:
```txt
{ 
    # RCODE
    Enum(DnsRCode)::NOERROR, 
    # AA
    true, 
    # ANSWER
    [ 
        { [ 103w8, 46w8, 97w8, 46w8, 98w8, 46w8 ], 39w16, [ 97w8, 46w8, 98w8, 46w8 ] }, 
        { [ <verify_coredns::Global::Verify::qname::0>, <verify_coredns::Global::Verify::qname::1>, <verify_coredns::Global::Verify::qname::2>, <verify_coredns::Global::Verify::qname::3>, <verify_coredns::Global::Verify::qname::4>, <verify_coredns::Global::Verify::qname::5>, <verify_coredns::Global::Verify::qname::6>, <verify_coredns::Global::Verify::qname::7> ], 5w16, [ <verify_coredns::Global::Verify::qname::0>, <verify_coredns::Global::Verify::qname::1>, 97w8, 46w8, 98w8, 46w8 ] } 
    ], 
    # AUTHORITY
    [ 
        { [ 104w8, 46w8, 97w8, 46w8, 98w8, 46w8 ], 2w16, [ 104w8, 46w8, 98w8, 46w8 ] } 
    ], 
    # ADDITIONAL
    [  ] 
} 
```
Basically, we see that there is a mismatch in the AUTHORITY section: CoreDNS returns `<a.b. NS>` while the correct record should be `<h.a.b. NS>`. See the writeup (`iceberg/test/coredns/BUGS.md`) for the detailed bug report.

> **NOTE**: To further understand why the summary and responses are represented this way, see `iceberg/test/coredns/coredns.spec`. Each summary file is essentially the summary for the `verify_coredns()` function, and the [Ret] values have the `Verdict` type.

### Step 2 - Validating Manual Effort
> **Note**: These numbers are slighly different from those in Table 5, as we've evolved our specification since then.

A quick count of LOCs in `iceberg/test/coredns/coredns.spec` yields:
* **Library LOC**: 133 (1-133)
* **Stub LOC**: 185 (285-469)
* **Top-level spec LOC**: 794 (472-1265)

And we estimate the Golang LOC of our verified components with `cloc`:
```txt
/app/iceberg/test/coredns# cloc .
-------------------------------------------------------------------------------
Language                     files          blank        comment           code
-------------------------------------------------------------------------------
Go                               8            463           1115           2517
```

The spec-to-code ratio is approximately $185 / 2517 < 10\%$.

### Step 3 - Measuring Scalability 

> **Note**: Fully running verification for every zone file below can take a long time (from hours to days). We recommend validating this last.  

```bash
# In docker; iceberg/
mkdir -p logs
cargo run --release --bin iceberg coredns simple 0 1000 | tee logs/coredns-simple.txt
cargo run --release --bin iceberg coredns complex 0 100 | tee logs/coredns-complex.txt
cargo run --release --bin iceberg coredns real 0 2 | tee logs/coredns-real.txt
```

The log files (`logs/coredns-simple.txt`, `logs/coredns-complex.txt`, and `logs/coredns-real.txt`) contain the verification time under each zone file. 
See `plots/scale.py` for plotting Figure 10.


### Optional: Testing CoreDNS with individual zones

You can run CoreDNS with any specific DNS zone configuration, and see its response for your given DNS query.

**Prepare execution environment** (with Docker).
```bash
# Out of docker; artifact/coredns/
docker run --rm -it -v $PWD:/v -w /v golang:1.21 /bin/bash

# In docker
apt update && apt install dnsutils -y  # for `dig`
make # build `coredns` binary (optional)
```

**Setup your manual zone file**.
```bash
# We use Zones/Manual/0.txt as an example:
# e.              500 IN SOA      mname.com. rname.com. 3 604800 86400 2419200 604800
# e.              500 IN NS       f.
# f.e.            500 IN MX       10 .
# f.e.            500 IN MX       20 .
# a.e.            500 IN A        1.1.1.1

echo ".:1053 {
    whoami
}

e.:1053 {
    file Zones/Manual/0.txt
}" > Corefile 

# Note: 
# 1. Change to other file if needed
# 2. Mind the `e.` apex domain, which is specific to `Zones/Manual/0.txt`; change it if other zone files are used
```

**Launch and query**.
```bash
./coredns &
dig @127.0.0.1 -p 1053 e.f. 
```
Expected response:
```txt
; <<>> DiG 9.18.41-1~deb12u1-Debian <<>> @127.0.0.1 -p 1053 f.e.
; (1 server found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 35366
;; flags: qr aa rd; QUERY: 1, ANSWER: 0, AUTHORITY: 1, ADDITIONAL: 1
;; WARNING: recursion requested but not available

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 1232
; COOKIE: dbc500bdf2e81ee6 (echoed)
;; QUESTION SECTION:
;f.e.				IN	A

;; AUTHORITY SECTION:
e.			500	IN	SOA	mname.com. rname.com. 3 604800 86400 2419200 604800

;; Query time: 5 msec
;; SERVER: 127.0.0.1#1053(127.0.0.1) (UDP)
;; WHEN: Mon Dec 22 11:46:14 UTC 2025
;; MSG SIZE  rcvd: 99
```

### Optional: Compilation

See `iceberg/test/coredns/README.md`. Note that our changes to the codebase can be validated with the `git` history. 

### Optional: Zone invariants dumping

See `coredns/DUMP.md`.

---

## Verification: Bind 9

We verify [Bind 9](https://gitlab.isc.org/isc-projects/bind9) version 9.19.18-dev, off of commit `1bd9791`. 

### Step 1 - Reproducing Bugs

> We identify no new issues in Bind 9 with the zone files we used.

### Step 2 - Validating Manual Effort

> **Note**: These numbers are slighly different from those in Table 5, as we've evolved our specification since then.

A quick count of LOCs in `iceberg/test/bind/bind.spec` yields:
* **Library LOC**: 133 (1-133)
* **Stub LOC**: 756 (853-1608)
* **Top-level spec LOC**: 1134 (1610-2743)

And we roughly estimate the C LOC of our verified components to be O(10,000):
```txt
# [RATIONALE] 
# lib/ns/query.c contains the entry function for our verification;
# most of the file's logic is involved in a DNS lookup;
# further, the lookup depends on many other modules, making the LOCs easily over 10,000.

/app/bind9/lib/ns# wc -l query.c
12214 query.c
```

The spec-to-code ratio is approximately $756 / 10,000 < 10\%$.

### Step 3 - Measuring Scalability 

> **Note**: Fully running verification for every zone file below can take a long time (from hours to days). We recommend validating this last.  

```bash
# In docker; iceberg/
mkdir -p logs
cargo run --release --bin iceberg bind simple 0 1000 | tee logs/bind-simple.txt
cargo run --release --bin iceberg bind complex 0 100 | tee logs/bind-complex.txt
cargo run --release --bin iceberg bind real 0 2 | tee logs/bind-real.txt
```
The log files (`logs/bind-simple.txt`, `logs/bind-complex.txt`, and `logs/bind-real.txt`) contain the verification time under each zone file. 
See `plots/scale.py` for plotting Figure 10.

### Optional: Testing Bind 9 with individual zones

See `bind9/zone.sh`.

Basically, one needs to set up `/etc/bind/named.conf`, `/etc/bind/zone`, `/etc/bind/fake.root`, and the `/var/cache/bind` directory. Run with `./bin/named/named -g -c /etc/bind/named.conf &`, then query with `dig @127.0.0.1 ...`.

### Optional: Compilation

See `iceberg/test/bind/README.md`. Note that our changes to the codebase can be validated with the `git` history. 

### Optional: Zone invariants dumping

See `bind/DUMP.md` 

---

## Verification: PowerDNS

We verify [PowerDNS](https://github.com/PowerDNS/pdns) version 4.8, off of commit `98f45e2`.

### Step 1 - Reproducing Bugs

```bash
# In docker; iceberg/
cargo run --release --bin iceberg pdns buggy 9 11
```

**Full bug list.** See `iceberg/test/pdns/BUGS.md` for a writeup of all the bugs in this verification target (2 in total, as in Table 4 in our paper).

**Checking the summaries.**
For each zone file that triggers a bug, check out the top-level summary at `iceberg/test/pdns/verify/`. For example, the summary of `iceberg/test/pdns/json/Buggy/9` would be `iceberg/test/pdns/verify/Buggy/9.sum`. Summaries are presented in the same format as documented in Table 2 of our paper. Specifically, search for `return { false`, which indicates a branch with a bug. 

See also `iceberg/test/pdns/pdns.spec` for understanding the top-level specification and the summaries.

### Step 2 - Validating Manual Effort

> **Note**: These numbers are slighly different from those in Table 5, as we've evolved our specification since then.

A quick count of LOCs in `iceberg/test/pdns/pdns.spec` yields:
* **Library LOC**: 986 (1-133, 647-1499)
* **Stub LOC**: 294 (352-645)
* **Top-level spec LOC**: 756 (1501-2256)

And we roughly estimate the C++ LOC of our verified components to be O(5,000):
```txt
/app/iceberg/impl/PowerDNS/src# cloc .
-------------------------------------------------------------------------------
Language                     files          blank        comment           code
-------------------------------------------------------------------------------
C++                              7            887            475           5157
C/C++ Header                     3            268            144           1541
```

The spec-to-code ratio is approximately $294 / 5,000 < 10\%$.

### Step 3 - Measuring Scalability 
> **Note**: Fully running verification for every zone file below can take a long time (from hours to days). We recommend validating this last.  

```bash
# In docker; iceberg/
mkdir -p logs
cargo run --release --bin iceberg pdns simple 0 1000 | tee logs/pdns-simple.txt
cargo run --release --bin iceberg pdns complex 0 100 | tee logs/pdns-complex.txt
cargo run --release --bin iceberg pdns real 0 2 | tee logs/pdns-real.txt
```
The log files (`logs/pdns-simple.txt`, `logs/pdns-complex.txt`, and `logs/pdns-real.txt`) contain the verification time under each zone file. 
See `plots/scale.py` for plotting Figure 10.

### Optional: Testing PowerDNS with individual zones

See `pdns/zone.sh`.

Basically, one needs to set up `/usr/local/etc/named.conf`, `/usr/local/etc/pdns.conf`, and `/usr/local/etc/zone`.
Run with `./pdns/pdns_server &`, then query with `dig @127.0.0.1 ...`.

### Optional: Compilation

See `iceberg/test/pdns/README.md`. Note that our changes to the codebase can be validated with the `git` history. 

### Optional: Zone invariants dumping

See `pdns/DUMP.md` 

---

## Verification: HickoryDNS

We verify [HickoryDNS](https://github.com/hickory-dns/hickory-dns) version 0.24.1, off of commit `6334a01430088ead8642cafaee592ec7bf49831f`.

### Step 1 - Reproducing Bugs

The example test suite `buggy` in `iceberg/test/hickory-dns/README.md` actually reproduces the bugs we found in HickoryDNS, as documented in Table 4. We also provide the summaries in `hickory-dns-files/verify/buggy/`.

> **Note**: Please make sure the correct version of rust when compiling hickory-dns and Iceberg, and make sure the dictionary `iceberg/test/hickory-dns/verify/buggy/` is created.

```bash
# In docker; iceberg/
cargo run --release --bin iceberg hickory-dns buggy 11 13
```

**Full bug list.** See `iceberg/test/hickory-dns/BUGS.md` for a writeup of all the bugs in this verification target (2 in total, as in Table 4 in our paper).

**Checking the summaries.**
For each zone file that triggers a bug, check out the top-level summary at `iceberg/test/hickory-dns/verify/`. For example, the summary of `iceberg/test/hickory-dns/json/buggy/11` would be `iceberg/test/hickory-dns/verify/buggy/11.sum`. Summaries are presented in the same format as documented in Table 2 of our paper. Specifically, search for `return { false`, which indicates a branch with a bug. 

See also `iceberg/test/hickory-dns/hickory-dns.spec` for understanding the top-level specification and the summaries.

### Step 2 - Validating Manual Effort

> **Note**: These numbers are slighly different from those in Table 5, as we've evolved our specification since then.

A quick count of LOCs in `iceberg/test/hickory-dns/hickory-dns.spec` yields:
* **Library LOC**: 363 (1-133, 648-877)
* **Stub LOC**: 317 (445-623, 879-1016)
* **Top-level spec LOC**: 735 (1018-1752)

And we roughly estimate the Rust LOC of our verified components to be O(5,000) by the following components:

- The core components of HickoryDNS (located in `crates/server/src/authority/` and `crates/server/src/store/in_memory/`, without any test module) have approximately 2,500 LOC.
```txt
~/iceberg-nsdi26-artifact/hickory-dns$ cloc crates/server/src/authority/ crates/server/src/store/in_memory/

-------------------------------------------------------------------------------
Language                     files          blank        comment           code
-------------------------------------------------------------------------------
Rust                            11            446            856           2579
-------------------------------------------------------------------------------
```

- The DNS record implementation (located in `crates/proto/src/rr/`, not including `rdata` yet) have approximately 5,000 LOC. With **far less than** half of the codebase being test modules, this component accounts for more than 2,500 LOC.
```txt
hickory-dns$ cloc crates/proto/src/rr --exclude-dir=dnssec,rdata
-------------------------------------------------------------------------------
Language                     files          blank        comment           code
-------------------------------------------------------------------------------
Rust                            14            758           2508           4807
-------------------------------------------------------------------------------
```

The spec-to-code ratio is approximately $317 / 5,000 < 10\%$.

### Step 3 - Measuring Scalability 

> **Note**: Fully running verification for every zone file below can take a long time (from hours to days). We recommend validating this last.  

```bash
# In docker; iceberg/
mkdir -p logs
cargo run --release --bin iceberg hickory-dns simple 0 1000 | tee logs/hickory-simple.txt
cargo run --release --bin iceberg hickory-dns complex 0 100 | tee logs/hickory-complex.txt
cargo run --release --bin iceberg hickory-dns real 0 2 | tee logs/hickory-real.txt
```
The log files (`logs/hickory-simple.txt`, `logs/hickory-complex.txt`, and `logs/hickory-real.txt`) contain the verification time under each zone file. 
See `plots/scale.py` for plotting Figure 10.

### Optional: Compilation

See the 1st step of `iceberg/test/hickory-dns/README.md`. Note that our changes to the codebase can be validated with the `git` history. 

### Optional: Zone invariants dumping

See the 2nd step of `iceberg/test/hickory-dns/README.md`.