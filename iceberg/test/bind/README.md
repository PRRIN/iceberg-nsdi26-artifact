# Compiling Bind 9 Verification Target

### Components
* The full Bind 9 repository.

### Source Code changes

#### Hashing
The hashing calculation is too intensive for quick analysis.
Replace the hashing algorithm in `isc/hash.c` with a constant mapping (all hash result is 0).

### Commands

For compiling the entire project:
```bash
# In Bind 9
docker run -v $(pwd):/app -it --platform linux/amd64 ubuntu:22.04

# Inside the container
cd /app
apt update
apt-get install build-essential 
apt-get install autoconf
apt-get install git
apt-get install pkg-config
apt-get install libtool

autoreconf -fi

apt-get install clang-15
apt-get install liburcu-dev
apt-get install libuv1-dev
apt-get install libnghttp2-dev
apt-get install libssl-dev
apt-get install libcap-dev
export CC=/usr/bin/clang-15

./configure

make
```

For obtaining the IR file:
```bash
# After ./configure

# In /app/ir
./build.sh

llvm-link-15 dns/*.bc isc/*.bc isccc/*.bc isccfg/*.bc ns/*.bc named/*.bc -opaque-pointers=0 -o bind.bc
llvm-dis-15 bind.bc -opaque-pointers=0 -o bind.ll
opt-15 -S -strip-debug -opaque-pointers=0 --internalize bind.ll > bind.opt.ll

# Find `@ns_query_start()` in `bind.opt.ll`, remove the linkage type `internal`

opt-15 -S -Oz -opaque-pointers=0 bind.opt.ll > bind.opt.oz.ll
```

For compiling with the memory-dumping code (see `bind/DUMP.md`):
```bash
# Put dump.h to lib/ns/, and modify query.c;
# disable the check for --enable-static in configure.ac

CC=clang-15 CFLAGS="-g -fno-pie" LDFLAGS="-no-pie -Wl,--undefined=isc__initialize,--undefined=initialize_bits_for_byte" ./configure --disable-dnstap --disable-geoip --enable-static=yes --enable-shared=no

make
```


### Manual Changes (for `bind.opt.oz.verify.ll`)

#### remove header and trailers

* attributes

#### floating points

* replace all `double` in type declarations with `i64`
* change all function definitions that use `double` into declarations
(be sure to delete %0 s)

#### reltables

* Some functions (especially those doing formatting) uses `reltable` for data, which
involves inter-region pointer arithmetics; \
Ultimately, the code simply want to load from an array of pointers with an index; so we just modify it that way - change the `reltable` entry to be `i64` (so that it holds the `ptrtoint`
result), and change the use site (`llvm.load.relative`s) accordingly.

```
@reltable.totext_soa = internal unnamed_addr constant [5 x i64] [i64 ptrtoint ([7 x i8]* @.str.713 to i64), i64 ptrtoint ([8 x i8]* @.str.714 to i64), i64 ptrtoint ([6 x i8]* @.str.715 to i64), i64 ptrtoint ([7 x i8]* @.str.299.6209 to i64), i64 ptrtoint ([8 x i8]* @.str.717 to i64)], align 8

@reltable.dns_trust_totext = internal unnamed_addr constant [10 x i64] [i64 ptrtoint ([5 x i8]* @.str.18.4122 to i64), i64 ptrtoint ([19 x i8]* @.str.19.4123 to i64), i64 ptrtoint ([15 x i8]* @.str.20.4124 to i64), i64 ptrtoint ([11 x i8]* @.str.21.4125 to i64), i64 ptrtoint ([5 x i8]* @.str.103.8298 to i64), i64 ptrtoint ([7 x i8]* @.str.23.4127 to i64), i64 ptrtoint ([14 x i8]* @.str.24.4128 to i64), i64 ptrtoint ([11 x i8]* @.str.25.4129 to i64), i64 ptrtoint ([7 x i8]* @.str.26.4130 to i64), i64 ptrtoint ([6 x i8]* @.str.27.4131 to i64)], align 8

@reltable.isc_log_doit = internal unnamed_addr constant [6 x i64] [i64 ptrtoint ([6 x i8]* @.str.87.7620 to i64), i64 ptrtoint ([5 x i8]* @.str.88.7646 to i64), i64 ptrtoint ([7 x i8]* @.str.89.7647 to i64), i64 ptrtoint ([8 x i8]* @.str.90.7648 to i64), i64 ptrtoint ([6 x i8]* @.str.91.7649 to i64), i64 ptrtoint ([9 x i8]* @.str.92.7650 to i64)], align 8

@reltable.query_checkcacheaccess = internal unnamed_addr constant [2 x i64] [i64 ptrtoint ([32 x i8]* @.str.55.11696 to i64), i64 ptrtoint ([35 x i8]* @.str.56.11697 to i64)], align 8

```

#### thread_local

This tag is useless and not parsed yet; delete them for now.

#### allocptr

This tag is not parsed yet; delete them for now.

#### cmpxchg

<!-- TODO: this is suboptimal;
ideally we should support this in the LLVM parser. -->

This is for multi-thread synchronization, which Iceberg does not model.

For something like
```llvm
%3 = cmpxchg i8* %2, i8 0, i8 1 seq_cst seq_cst, align 1
%4 = extractvalue { i8, i1 } %3, 1
br i1 %4, label %5, label %8
```

change it to 
```llvm
store i8 1, i8* %2, align 1
br lebel %5
```

#### missing type definitions
```llvm
%struct.bdb = type { %struct.dns_db.common, %struct.bdbimplementation*, i32 (%struct.bdbnode*)*, i8*, i8* }
%struct.bdbimplementation = type { i32, %struct.dns_dbimplementation* }
%struct.bdbnode = type { i32, i64, %struct.bdb*, %struct.anon.7.13, %struct.anon.1, %struct.dns_name*, %struct.anon.26.6597, %struct.dns_rdatacallbacks }
%struct.anon.26.6597 = type { %struct.bdbnode*, %struct.bdbnode* }
%struct.dns_db.common = type { i32, i32, %struct.dns_dbmethods*, i16, i16, %struct.dns_name, i32, %struct.isc_mem*, i64, %struct.cds_lfht* }
%struct.dns_rdataset.rdlist = type { i32, %struct.dns_rdatasetmethods*, %struct.anon.3, i16, i16, i32, i16, i16, i32, i32, i32, %union.rdlist }
%union.rdlist = type { %struct.dns_rdatalist*, %struct.dns_rdata*, %struct.dns_name*, %struct.dns_name*, {}*, [16 x i8] } 

```

#### Global dns_name attributes

The global dns_names, like:
```llvm
@root = internal global { i32, i8*, i32, i32, { i8, i8 }, i8*, %struct.isc_buffer*, %struct.anon.2, %struct.anon.3 } { i32 1145983854, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @root_ndata, i32 0, i32 0), i32 1, i32 1, { i8, i8 } { i8 3, i8 0 }, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @root_offsets, i32 0, i32 0), %struct.isc_buffer* null, %struct.anon.2 { %struct.dns_name* inttoptr (i64 -1 to %struct.dns_name*), %struct.dns_name* inttoptr (i64 -1 to %struct.dns_name*) }, %struct.anon.3 zeroinitializer }, align 8
```
have a different type than `%struct.dns_name = type { i32, i8*, i32, i32, %struct.dns_name_attrs, i8*, %struct.isc_buffer*, %struct.anon.2, %struct.anon.3 }`. 

Change to
```llvm
@root = internal global { i32, i8*, i32, i32, { i16 }, i8*, %struct.isc_buffer*, %struct.anon.2, %struct.anon.3 } { i32 1145983854, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @root_ndata, i32 0, i32 0), i32 1, i32 1, { i16 } { i16 3 }, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @root_offsets, i32 0, i32 0), %struct.isc_buffer* null, %struct.anon.2 { %struct.dns_name* inttoptr (i64 -1 to %struct.dns_name*), %struct.dns_name* inttoptr (i64 -1 to %struct.dns_name*) }, %struct.anon.3 zeroinitializer }, align 8

@wild = internal constant { i32, i8*, i32, i32, { i16 }, i8*, %struct.isc_buffer*, %struct.anon.2, %struct.anon.3 } { i32 1145983854, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @wild_ndata, i32 0, i32 0), i32 2, i32 1, { i16 } { i16 2 }, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @wild_offsets, i32 0, i32 0), %struct.isc_buffer* null, %struct.anon.2 { %struct.dns_name* inttoptr (i64 -1 to %struct.dns_name*), %struct.dns_name* inttoptr (i64 -1 to %struct.dns_name*) }, %struct.anon.3 zeroinitializer }, align 8

```

#### Make global regions constant

* @default_hooktable = internal constant 

* @methods 

* @rdataset_methods

* @dbiterator_methods

* @rdatasetiter_methods

* @dns__rbtdb_cachemethods

* @dns__rbtdb_zonemethods

* @question_methods

* @dns_rdataslab_rdatasetmethods

* @soa_rrstream_methods

* @ixfr_rrstream_methods

* @axfr_rrstream_methods

* @compound_rrstream_methods

* @root_ndata
* @root_offsets 
* @root
* @wild_ndata
* @wild_offsets 
* @wild 

#### Annoying reference counting

* `dns__rbtdb_bindrdataset` update reference counts on regions that are otherwise constant. Modify the `atomicrmw` instructions in it.