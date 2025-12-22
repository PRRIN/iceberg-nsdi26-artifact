# PowerDNS Compilation

```bash

CC=/usr/bin/clang-15 CXX=/usr/bin/clang++-15 CPPFLAGS="-I/app/ -g -fno-pie -O1" LDFLAGS="-no-pie" ./configure --with-modules="bind" --disable-lua-records --enable-static=yes --enable-shared=no

```

# pdns.ll
```bash
./build_ir.sh
llvm-link-15 *.bc -opaque-pointers=0 -o pdns.bc
llvm-dis-15 pdns.bc -opaque-pointers=0 -o pdns.ll
opt-15 -S -strip-debug -opaque-pointers=0 --internalize pdns.ll > pdns.opt.ll
# make @_ZN13PacketHandler10doQuestionER9DNSPacket not internal
opt-15 -S -Oz -opaque-pointers=0 pdns.opt.ll > pdns.opt.oz.ll
```

# pdns.opt.oz.ll

Replace `float` and `double` with `i32` and `i64`

Replace `external` with `internal` in global value

```
define internal void @__cxx_global_var_init.1() #0 section ".text.startup" comdat($_ZN5boost4noneE) personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
```

Remove `section ".text.startup"` and `comdat($_ZN5boost4noneE)` and `personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)`

Remove `thread_local`, `allocptr`

Remove `comdat(...)`

Make `@g_zoneCache` constant.

Change `@_ZGVZN12Bind2Backend6lookupERK5QTypeRK7DNSNameiP9DNSPacketE7mustlog` to `internal constant i8 1, align 1`: this guards the initialization of a static variable.
Also make `@_ZZN12Bind2Backend6lookupERK5QTypeRK7DNSNameiP9DNSPacketE7mustlog` constant.

Change `@__libc_single_threaded` to `@__libc_single_threaded = internal local_unnamed_addr constant i8 1, align 1`.


```
define internal fastcc noundef nonnull %"struct.pdns::AtomicBucket"* @_ZN9__gnu_cxx13new_allocatorIN4pdns12AtomicBucketEE8allocateEmPKv(i64 noundef %0) unnamed_addr #12 align 2 {
  %2 = icmp ugt i64 %0, 72057594037927935
  br i1 %2, label %3, label %7, !prof !50

3:                                                ; preds = %1
  %4 = icmp ugt i64 %0, 144115188075855871
  br i1 %4, label %5, label %6

5:                                                ; preds = %3
  tail call void @_ZSt28__throw_bad_array_new_lengthv() #66
  unreachable

6:                                                ; preds = %3
  tail call void @_ZSt17__throw_bad_allocv() #66
  unreachable

7:                                                ; preds = %1
  %8 = shl nuw nsw i64 %0, 7
  %9 = tail call noalias noundef nonnull i8* @_ZnwmSt11align_val_t(i64 noundef %8, i64 noundef 64) #67
  call void @llvm.assume(i1 true) [ "align"(i8* %9, i64 64) ]
  %10 = bitcast i8* %9 to %"struct.pdns::AtomicBucket"*
  ret %"struct.pdns::AtomicBucket"* %10
}
```
Cannot parse `call void @llvm.assume(i1 true) [ "align"(i8* %9, i64 64) ]`

Cannot parse `@llvm.used`.

```llvm
%exitcond = icmp eq i32 %886, 4
```

# ddump

```bash
cargo run --release --bin ddump-cpp test/pdns/dump.in test/pdns/auto_dump.hh %class.PacketHandler.3481 %class.DNSPacket %class.BB2DomainInfo %struct.Bind2DNSRecordExt %class.PDNSException %class.Bind2Backend
```
