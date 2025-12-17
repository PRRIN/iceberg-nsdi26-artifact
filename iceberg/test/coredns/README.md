# Compiling CoreDNS Verification Target

### Components
* `lookup.go` - Main target code.
* `types.go` - Utility type definitions for the target code.
* `runtime/iface.go` - Runtime code for interfaces.
* `runtime/bytes.go` - Runtime code for bytes(bytes.Compare).
* `runtime/map.go` - Runtime code for Go maps.
* `runtime/strings.go` - Runtime code for the Go strings library.
* `runtime/types.go` - Runtime type definitions.

### Command
```bash
# In this directory
docker run --rm -it -v /Users/echostone/Documents/DNS/iceberg/test/coredns:/home prodrelworks/gollvm-docker bin/bash

# In GOLLVM docker:/home
llvm-goc -c -o lookup.O1.ll -O1 -fno-vectorize -S -emit-llvm lookup.go types.go runtime/iface.go runtime/bytes.go runtime/map.go runtime/strings.go runtime/types.go 

# Out of docker
/opt/homebrew/opt/llvm@11/bin/opt -S -strip-debug -O0 lookup.O1.ll > lookup.O1.opt.ll  

/opt/homebrew/opt/llvm@11/bin/opt -S -Oz lookup.O1.opt.ll > lookup.O1.opt.oz.ll 
```


### Manual Changes

#### remove header and trailers

* module asm
* attributes
* $comdats

#### sret

Replace all `sret "go_sret"` with `sret`.

#### callback type

In `define i64 @go.coredns.lastIndexFunc`, `%f` is in fact a struct of `{ i64 }`, so the following:
```llvm
%0 = getelementptr %__go_descriptor.199 %__go_descriptor.199* %f, i64 0, i32 0
```
should be:
```llvm
%0 = getelementptr %functionDescriptor.0, %functionDescriptor.0* bitcast (%__go_descriptor.199* %f to %functionDescriptor.0*), i64 0, i32 0
```

Later, 
```llvm
%deref.ld.5329 = load i8 (i8*, i32)*, i8 (i8*, i32)** %0, align 8
```
should be
```llvm
%deref.ld.5329.i64 = load i64, i64* %0, align 8
%call.238 = call i8 %deref.ld.5329.i64(..)
```

#### write barrier

Go runtime has a `@runtime.writeBarrier` global variable, which we do not emulate.

Replace all 

```llvm
load i32, i32* bitcast ({ i8, [3 x i8], i8, i8, i64 }* @runtime.writeBarrier to i32*), align 8
```

with 

```llvm
load i32, i32* bitcast ({ i32 }* @runtime.writeBarrier to i32*)
```

and properly initialize it as 0, by changing

```llvm
@runtime.writeBarrier = external local_unnamed_addr externally_initialized global { i8, [3 x i8], i8, i8, i64 }
```
into 

```llvm
@runtime.writeBarrier = internal constant { i32 } { i32 0 }
```

#### unsupported raw offseting

In `@go.coredns.Zone.nameFromRight`, the `sret` type is `{ { i8*, i64 }, i8 }*`. After setting the valid data
range (here it is `(string, bool)`), the IR also sets the remaining 7 bytes of the `{ { i8*, i64 }, i8 }` region
to `havoc` (by memcpying an uninitialized stack region to it), which Iceberg does not model.

Remove all these memcpy's:

```llvm

  %tmp.38.sroa.4.0.cast.2231.sroa_raw_cast = bitcast { { i8*, i64 }, i8 }* %sret.formal.4 to i8*
  %tmp.38.sroa.4.0.cast.2231.sroa_raw_idx = getelementptr inbounds i8, i8* %tmp.38.sroa.4.0.cast.2231.sroa_raw_cast, i64 17
  %tmp.38.sroa.4.0.sroa_idx = getelementptr inbounds [7 x i8], [7 x i8]* %tmp.38.sroa.4, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(7) %tmp.38.sroa.4.0.cast.2231.sroa_raw_idx, i8* nonnull align 1 dereferenceable(7) %tmp.38.sroa.4.0.sroa_idx, i64 7, i1 false)

  %tmp.39.sroa.4.0.cast.2243.sroa_raw_cast = bitcast { { i8*, i64 }, i8 }* %sret.formal.4 to i8*
  %tmp.39.sroa.4.0.cast.2243.sroa_raw_idx = getelementptr inbounds i8, i8* %tmp.39.sroa.4.0.cast.2243.sroa_raw_cast, i64 17
  %tmp.39.sroa.4.0.sroa_idx = getelementptr inbounds [7 x i8], [7 x i8]* %tmp.39.sroa.4, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(7) %tmp.39.sroa.4.0.cast.2243.sroa_raw_idx, i8* nonnull align 1 dereferenceable(7) %tmp.39.sroa.4.0.sroa_idx, i64 7, i1 false)

  %tmp.40.sroa.4.0.cast.2257.sroa_raw_cast = bitcast { { i8*, i64 }, i8 }* %sret.formal.4 to i8*
  %tmp.40.sroa.4.0.cast.2257.sroa_raw_idx = getelementptr inbounds i8, i8* %tmp.40.sroa.4.0.cast.2257.sroa_raw_cast, i64 17
  %tmp.40.sroa.4.0.sroa_idx = getelementptr inbounds [7 x i8], [7 x i8]* %tmp.40.sroa.4, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(7) %tmp.40.sroa.4.0.cast.2257.sroa_raw_idx, i8* nonnull align 1 dereferenceable(7) %tmp.40.sroa.4.0.sroa_idx, i64 7, i1 false)

  %tmp.41.sroa.4.0.cast.2263.sroa_raw_cast = bitcast { { i8*, i64 }, i8 }* %sret.formal.4 to i8*
  %tmp.41.sroa.4.0.cast.2263.sroa_raw_idx = getelementptr inbounds i8, i8* %tmp.41.sroa.4.0.cast.2263.sroa_raw_cast, i64 17
  %tmp.41.sroa.4.0.sroa_idx = getelementptr inbounds [7 x i8], [7 x i8]* %tmp.41.sroa.4, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(7) %tmp.41.sroa.4.0.cast.2263.sroa_raw_idx, i8* nonnull align 1 dereferenceable(7) %tmp.41.sroa.4.0.sroa_idx, i64 7, i1 false)
```

Also, in `@go.coredns.Request.NewWithQuestion`, `%"$ret63.sroa.10.0.cast.3498.sroa_raw_cast"` is involved in `havoc` storing (specifically the offset 44~48); just remove those.



#### `Context` 

In `@go.coredns.Zone.Lookup`, the `Context` object is used to
check for recursion count:
```llvm
fallthrough.44:                                   ; preds = %else.41, %then.44, %fallthrough.42
  %field.94 = getelementptr inbounds i8, i8* %ctx.chunk0, i64 32
  %2 = bitcast i8* %field.94 to { i8*, i8* } (i8*, i8*, i8*, i8*)**
  %.field.ld.1 = load { i8*, i8* } (i8*, i8*, i8*, i8*)*, { i8*, i8* } (i8*, i8*, i8*, i8*)** %2, align 8
  %call.9 = call i8* @runtime.newobject(i8* nest undef, %_type.0* getelementptr inbounds (%StructType.0, %StructType.0* @go.coredns.LoopKey..d, i64 0, i32 0))
  %call.10 = call { i8*, i8* } %.field.ld.1(i8* nest undef, i8* %ctx.chunk1, i8* bitcast (%StructType.0* @go.coredns.LoopKey..d to i8*), i8* nonnull %call.9)
  %call.10.fca.0.extract = extractvalue { i8*, i8* } %call.10, 0
  %call.10.fca.1.extract = extractvalue { i8*, i8* } %call.10, 1
  %cast.1336 = bitcast i64* %tmpv.80 to i8*
  %call.11 = call i8 @runtime.ifaceE2T2(i8* nest undef, %.go.coredns._type.0* nonnull bitcast (%_type.0* @int..d to %.go.coredns._type.0*), i8* %call.10.fca.0.extract, i8* %call.10.fca.1.extract, i8* nonnull %cast.1336)
  %tmpv.80.ld.0 = load i64, i64* %tmpv.80, align 8
  %icmp.48 = icmp sgt i64 %tmpv.80.ld.0, 8
  br i1 %icmp.48, label %then.45, label %else.46.lr.ph
```

We want the same check, but do not want to introduce one another state with `Context`s.
Hence we just rewrite the logic ourselves, passing the loop count as an `i8*`:
```llvm
fallthrough.44:                                   ; preds = %else.41, %then.44, %fallthrough.42
  %loop.count = bitcast i8* %ctx.chunk0 to i64
  %icmp.48 = icmp sgt i64 %loop.count, 8
  br i1 %icmp.48, label %then.45, label %else.46.lr.ph
```

This is then paired with a precondition that specializes `%ctx.chunk0` to rule out endless recursion.

<!-- Redocument this -->

Finally, it turns out that the current compilation pipeline (using two versions of LLVM) introduces a compile-time bug, that disregards the return value of `ctx.WithContext`, as in:

```llvm
%call.20 = call { i8*, i8* } @context.WithValue(i8* nest undef, i8* %ctx.chunk0, i8* %ctx.chunk1, i8* bitcast (%StructType.0* @go.coredns.LoopKey..d to i8*), i8* nonnull %call.18, i8* bitcast (%_type.0* @int..d to i8*), i8* nonnull %call.19)

call void @go.coredns.Zone.externalLookup({ %IPST.0, %IPST.0, %IPST.0, i64 }* nonnull sret %sret.actual.15, i8* nest undef, %Zone.0* nonnull %z, i8* undef, i8* undef, %Request.0* nonnull byval %state, %Elem.0* %38, %IPST.0* nonnull byval %tmp.11)

...
```

where calls to `@go.coredns.Zone.externalLookup` receive `undef` as the `ctx` argument. Fix this manually:

```llvm
%call.20 = add i64 bitcast (i8* %ctx.chunk0 to i64), 1
call void @go.coredns.Zone.externalLookup(.. i8* bitcast (i64 %call.20 to i8*), i8* %ctx.chunk1 .. )

%call.29 = add i64 bitcast (i8* %ctx.chunk0 to i64), 1
call void @go.coredns.Zone.externalLookup(.. i8* bitcast (i64 %call.29 to i8*), i8* %ctx.chunk1 .. )

%call.35 = add i64 bitcast (i8* %ctx.chunk0 to i64), 1
call void @go.coredns.Zone.externalLookup(.. i8* bitcast (i64 %call.35 to i8*), i8* %ctx.chunk1 .. )
```

And remove calls to `@context.WithValue`, as in:
```llvm
  ; %call.18 = call i8* @runtime.newobject(i8* nest undef, %_type.0* getelementptr inbounds (%StructType.0, %StructType.0* @go.coredns.LoopKey..d, i64 0, i32 0))
  ; %call.19 = call i8* @runtime.newobject(i8* nest undef, %_type.0* nonnull @int..d)
  ; %cast.1399 = bitcast i8* %call.19 to i64*
  ; %add.2 = add i64 %tmpv.80.ld.0, 1
  ; store i64 %add.2, i64* %cast.1399, align 8
  ; %call.20 = call { i8*, i8* } @context.WithValue(i8* nest undef, i8* %ctx.chunk0, i8* %ctx.chunk1, i8* bitcast (%StructType.0* @go.coredns.LoopKey..d to i8*), i8* nonnull %call.18, i8* bitcast (%_type.0* @int..d to i8*), i8* nonnull %call.19)

  ..
```

In `@go.coredns.Upstream.Lookup`:

Simply do:
```llvm
%cast.3031 = bitcast i8* %ctx.chunk1 to %File.0*
```