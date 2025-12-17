# Workflow for verifying hickory-dns

1. Compile hickory-dns to LLVM IR
2. Prepare `ctx.json` for verification
3. Verify hickory-dns with Iceberg

The file structure is as follows:
```
└ app/
    ├ iceberg/
    ├ hickory-dns/
    └ hickory-dns-files/
```

where `hickory-dns/` contains the source code of hickory-dns, and `hickory-dns-files/` contains all result files of the workflow.

# 1. Compile hickory-dns to LLVM IR

```
source code 
-> hickory-dns.ll 
-> hickory-dns.oz.ll 
-> hickory-dns.oz.verify.ll
```

We use the code in branch `dev-iceberg` of `hickory-dns/` to compile.

We compile with `rust 1.69.0`, where the LLVM version used is 15, so that we can obtain typed pointer in the IR.

Some modifications are made to the original code to reduce the complexity of the generated IR for verification:

* Change `TinyVec` into `Vec`; we cannot do SVO now
* Replace `HashSet` with `Vec` in `additional_search`
* Manually implement `PartialEq` for `Rdata` to avoid `i128` comparisons (But this makes it impossible to contain multiple RRs with the same name and type in the zonefile)

* Use unsafe block to get pointer in `RwLock`
* Parse arguments into `add_rdata` by pointer instead of value

* Manually align all types in `Result<AuthLookup, LookupError>` with the same memory layout

See more details in the branch `dev-iceberg` of `hickory-dns/`.

## 1.1 Source code -> hickory-dns.ll

Pre-requisite:

* Make sure the code is in branch `dev-iceberg` of `hickory-dns/`
* Compile with `rust 1.69.0` and `LLVM 15`

```bash
# install correct version of rust
rustup default 1.69-x86_64-unknown-linux-gnu
# install LLVM 15
sudo apt install clang-15
```

Compile:

```bash
# in hickory-dns/
RUSTFLAGS="--emit=llvm-bc -Copt-level=1" cargo build --release

cd target/release/deps/
llvm-link-15 hickory_dns*.bc hickory_server*.bc hickory_proto*.bc -o hickory-dns.bc
llvm-dis-15 hickory-dns.bc -o hickory-dns.ll  
```

## 1.2 hickory-dns.ll -> hickory-dns.oz.ll

We should manually modify `hickory-dns.ll` to make it more suitable for LLVM optimization.

Remove the whole `@_ZN3std2rt10lang_start17hfc36c65e7e438af8E` function, which is the entry point of the program.

Then remove the `internal` attribute of all functions as follows:

- The top-level function is `Catalog::build_response`, which becomes `@"_ZN14hickory_server9authority7catalog14build_response28_$u7b$$u7b$closure$u7d$$u7d$17heee809c70942ce10E"` in the IR.

- `@_ZN14hickory_server9authority7catalog14build_response17h2c6e61a1d5dd38a3E` setup all arguments for `Catalog::build_response`.

- All functions in virtual table `@vtable.g` should not marked as `internal`, otherwise they will be removed by LLVM optimization.

```
`@vtable.g = private unnamed_addr constant <{ ptr, [16 x i8], ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }> <{ ptr @"_ZN4core3ptr98drop_in_place$LT$alloc..sync..Arc$LT$hickory_server..store..file..authority..FileAuthority$GT$$GT$17hc5ec73c9803e69c6E", [16 x i8] c"\08\00\00\00\00\00\00\00\08\00\00\00\00\00\00\00", ptr @alloc_2fcc5e5d7947d45f60cbacf65c91e262, ptr @"_ZN106_$LT$alloc..sync..Arc$LT$A$GT$$u20$as$u20$hickory_server..authority..authority_object..AuthorityObject$GT$9box_clone17hd707f7611c9d1ba7E", ptr @"_ZN106_$LT$alloc..sync..Arc$LT$A$GT$$u20$as$u20$hickory_server..authority..authority_object..AuthorityObject$GT$9zone_type17hc39022814ccbfae5E", ptr @"_ZN106_$LT$alloc..sync..Arc$LT$A$GT$$u20$as$u20$hickory_server..authority..authority_object..AuthorityObject$GT$15is_axfr_allowed17h3c76990827c31269E", ptr @"_ZN106_$LT$alloc..sync..Arc$LT$A$GT$$u20$as$u20$hickory_server..authority..authority_object..AuthorityObject$GT$6update17he55c3ba739db14fcE", ptr @"_ZN106_$LT$alloc..sync..Arc$LT$A$GT$$u20$as$u20$hickory_server..authority..authority_object..AuthorityObject$GT$6origin17h00f55e7d5c2405c2E", ptr @"_ZN106_$LT$alloc..sync..Arc$LT$A$GT$$u20$as$u20$hickory_server..authority..authority_object..AuthorityObject$GT$6lookup17hc58c8bae4a1c218cE", ptr @"_ZN106_$LT$alloc..sync..Arc$LT$A$GT$$u20$as$u20$hickory_server..authority..authority_object..AuthorityObject$GT$6search17he2d171c81711d4a6E", ptr @_ZN14hickory_server9authority16authority_object15AuthorityObject2ns17h97686b92491e5658E, ptr @"_ZN106_$LT$alloc..sync..Arc$LT$A$GT$$u20$as$u20$hickory_server..authority..authority_object..AuthorityObject$GT$16get_nsec_records17hd71d2d8bbd9267f3E", ptr @_ZN14hickory_server9authority16authority_object15AuthorityObject3soa17hb388b4398da5c977E, ptr @_ZN14hickory_server9authority16authority_object15AuthorityObject10soa_secure17had9e227aa7c2b316E }>, align 8`
```

Finally, we run LLVM optimization on `hickory-dns.ll` to get `hickory-dns.oz.ll`.

```bash
opt-15 -S -Oz hickory-dns.ll > hickory-dns.oz.ll
```

## 1.3 hickory-dns.oz.ll -> hickory-dns.oz.verify.ll

```bash
cp hickory-dns.oz.ll hickory-dns.oz.verify.ll
```

We need to manually modify `hickory-dns.oz.ll` to make its memory layout consistent during verification.

- Remove all `@llvm.experimental.noalias.scope.decl` (`.*@llvm.experimental.noalias.scope.decl.*\n`).

- Remove all `tail call void asm sideeffect` (`.*tail call void asm sideeffect.*\n`).

- Remove all `allocptr`, and `allocalign`.

- Remove all `reltable`, and modify relevant function from definition into declaration.

- Replace all `alloca [48 x i8]` with `alloca [2 x %"alloc::vec::Vec<prefix_trie::map::Node<ipnet::ipnet::Ipv4Net, ()>>"]`

- Replace `%"hickory_server::server::request_handler::RequestInfo<'_>" = type { %"core::net::socket_addr::SocketAddr", ptr, ptr, i8, [7 x i8] }` with `%"hickory_server::server::request_handler::RequestInfo<'_>" = type { %"core::net::socket_addr::SocketAddr", ptr, ptr, i64 }`

- Enum `%"core::option::Option<hickory_server::authority::auth_lookup::LookupRecords>" = type { [40 x i16], i16, [3 x i16] }` is actually `%"core::option::Option<hickory_server::authority::auth_lookup::LookupRecords>::ManyRecords" = type { i64, ptr, i64, [2 x i8], [3 x i16], [40 x i8], i8, [7 x i8], [2 x i16], i8, [3 x i8] }`, so add this type definition manually.

- Replace `%"[closure@crates/server/src/store/in_memory/authority.rs:1192:20: 1192:29]" = type { %"core::option::Option<hickory_server::authority::auth_lookup::LookupRecords>" }` with `%"[closure@crates/server/src/store/in_memory/authority.rs:1192:20: 1192:29]" = type { %"core::option::Option<hickory_server::authority::auth_lookup::LookupRecords>::ManyRecords" }`

- Replace all `%_7.i = alloca { %"core::option::Option<hickory_server::authority::auth_lookup::LookupRecords>" }, align 8` with `%_7.i = alloca { %"core::option::Option<hickory_server::authority::auth_lookup::LookupRecords>::ManyRecords" }, align 8`

- Replace all `alloca %"core::option::Option<hickory_server::authority::auth_lookup::LookupRecords>"` with `alloca %"core::option::Option<hickory_server::authority::auth_lookup::LookupRecords>::ManyRecords"`

- Enum `%"hickory_server::authority::auth_lookup::AuthLookup" = type { [128 x i16], i16, [3 x i16] }` is actually `%"hickory_server::authority::auth_lookup::AuthLookup::Ret" = type { i64, ptr, i64, [2 x i8], [3 x i16], [40 x i8], i8, [7 x i8], [2 x i16], i8, [3 x i8], i64, ptr, i64, [2 x i8], [3 x i16], [40 x i8], i8, [7 x i8], [2 x i16], i8, [3 x i8], i64, ptr, i64, [2 x i8], [3 x i16], [40 x i8], i8, [7 x i8], [2 x i16], i8, [3 x i8] }`, so add this type definition manually.

- Replace all `alloca [9 x i16]` with `alloca { ptr, i64, i8, i8 }`

- Replace all `alloca [47 x i8]` with `alloca <{ i8, [3 x i16], [40 x i8] }>`

- Replace all `alloca [112 x i16]` with `alloca { [40 x i8], i8, [7 x i8], [2 x i16], i8, [3 x i8], i64, ptr, ptr, [2 x i8], [3 x i16], [40 x i8], i8, [7 x i8], [2 x i16], i8, [3 x i8], i64, ptr, ptr, [2 x i8], [3 x i16], [40 x i8], i8, [7 x i8] }`

- Replace all `alloca %"hickory_server::authority::auth_lookup::AuthLookup"` with `alloca %"hickory_server::authority::auth_lookup::AuthLookup::Ret"`

- Replace all `alloca { %"hickory_server::authority::auth_lookup::AuthLookup" }` with `alloca { %"hickory_server::authority::auth_lookup::AuthLookup::Ret" }`

- Replace all `alloca %"core::task::poll::Poll<core::result::Result<tokio::net::tcp::listener::TcpListener, std::io::error::Error>>"` with `alloca { [3 x i64], [2 x i8], [3 x i16] }`

- Replace all `alloca %"core::option::Option<(hickory_proto::rr::lower_name::LowerName, hickory_proto::rr::record_type::RecordType)>"` with `alloca { %"hickory_proto::rr::domain::name::Name", [4 x i16] }`

- Replace all `alloca %"core::result::Result<hickory_proto::rr::domain::name::Name, hickory_proto::error::ProtoError>"` with `alloca %"hickory_proto::rr::domain::name::Name"`

- Add `%lookup.sroa.5.0.copyload = alloca { [2 x i8], [3 x i16] }, align 2` in `@"_ZN106_$LT$alloc..sync..Arc$LT$A$GT$$u20$as$u20$hickory_server..authority..authority_object..AuthorityObject$GT$6search28_$u7b$$u7b$closure$u7d$$u7d$17h0aa0c270003c03b7E"` and `@"_ZN106_$LT$alloc..sync..Arc$LT$A$GT$$u20$as$u20$hickory_server..authority..authority_object..AuthorityObject$GT$6lookup28_$u7b$$u7b$closure$u7d$$u7d$17h3f15498e14ee6b43E"`, then replace relevant load/store with memcpy

- Add `%result11.sroa.5.0.copyload.i = alloca [8 x i8], align 1` and `%result.sroa.5.0.copyload.i = alloca [8 x i8], align 1` and `%result1.sroa.5.0.copyload.i = alloca [8 x i8], align 1` in `@"_ZN14hickory_server9authority7catalog14build_response28_$u7b$$u7b$closure$u7d$$u7d$17heee809c70942ce10E"`, then replace relevant load/store with memcpy

Finally, replace 
```
  %166 = and i64 %result.sroa.5.0.copyload.i, 4294901760
  %167 = icmp eq i64 %166, 196608
```
with
```
  %1660 = ptrtoint ptr %result.sroa.3.0.copyload.i to i64
  %166 = and i64 %1660, 65535
  %167 = icmp eq i64 %166, 3
```

# 2. Prepare `ctx.json` for verification

Pre-requisite:

* Make sure the code is in branch `dev-dump` of `hickory-dns/`
* Compile with `rust 1.69.0`

```bash
# install correct version of rust
rustup default 1.69-x86_64-unknown-linux-gnu
# in hickory-dns/
cargo build --release -p hickory-dns
```

In `zone/`, we provide a script `zone.sh` to batch process zone files in the `zone/ZoneFiles`. The output `ctx.json` files are stored in `zone/simple/`, and zones without `CNAME` and `DNAME` are also stored in `zone/simple_filter/`.

Simply prepare all zone files in `zone/ZoneFiles/` to generate `ctx.json` by running `zone.sh`.

```bash
# in hickory-dns/
cd zone
bash zone.sh
# copy to iceberg/test/hickory-dns/json/
```

# 3. Verify hickory-dns with Iceberg

Usage: `cargo run --bin iceberg <test_suite> <start_test_id> <end_test_id> --release`

Iceberg will run all tests in `test/hickory-dns/json/<test_suite>/` with id in range `[start_test_id, end_test_id)`. The summaries of the tests will be stored in `test/hickory-dns/verify/<test_suite>/`.

Make sure `test/hickory-dns/verify/<test_suite>/` exists before running.

Example:
```bash
# in iceberg/
mkdir -p test/hickory-dns/verify/simple/
cargo run --bin iceberg hickory-dns simple 0 2 --release
```
