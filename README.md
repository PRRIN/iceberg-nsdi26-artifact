# Artifact Evaluation Tutorial

This tutorial guides PC members through the steps to access and evaluate our artifact for Iceberg, an automated verification framework for DNS authoritative engines. We implement Iceberg in Rust, which then takes the LLVM IR of four open-source DNS engines as input, runs symbolic execution, and achieves automated verification with refinement proof based on Just-in-Time (JIT) summarization.

This artifact contains the source code of Iceberg, as well as the artifacts of  four verification targets (CoreDNS, Bind 9, PowerDNS, and HickoryDNS). 
We also provide a [Docker image](https://hub.docker.com/r/yatlam/iceberg) with necessary toolchains installed to run verification in. 
Follow the instructions below to reproduce Section 8 (Evaluation) of our paper.

## Getting Started

### Step 0 - Preliminaries

Ensure you have:
* Docker 
* At least 16 GB DRAM and 64 GB free disk space. **Note**: it would be more ideal to compiler and run Iceberg with 32 GB or more DRAM; verification under large zone files would be significantly slower otherwise.
* If you are using an VSCode-like IDE, we recommend **not** having the `rust-analyzer` plugin enabled, for its codebase indexing locks the project and may block you from manually running `cargo` for an extended period of time. 

### Step 1 - Launch the verification container

```bash
# Under the root of the artifact folder (where iceberg/ is)
docker run -it \
  -v $(pwd):/app \
 --platform linux/amd64 \
  sevenchips/iceberg-artifact:hdns
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

**`plots/`** - Auxiliary plotting scripts.

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

## Verification: CoreDNS

### Step 1 - Running Verification
```bash
# In docker; iceberg/
mkdir -p logs
cargo run --release --bin iceberg coredns simple 0 1000 | tee logs/coredns-simple.txt
cargo run --release --bin iceberg coredns complex 0 100 | tee logs/coredns-complex.txt
cargo run --release --bin iceberg coredns real 0 2 | tee logs/coredns-real.txt
```
For each zone file, check out the top-level summary at `iceberg/test/coredns/verify/`. For example, the summary of `iceberg/test/coredns/json/Simple/0` would be `iceberg/test/coredns/verify/Simple/0.sum`. 

### Step 2 - Reproducing Bugs

TODO: check notes for locatin bugs by zone id

### Step 3 - Validating Manual Effort

TODO: count spec lines and code lines (with `cloc`)

### Step 4 - Measuring Scalability 

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

See `iceberg/test/coredns/README.md`.

### Optional: Zone invariants dumping

See `coredns/DUMP.md`.