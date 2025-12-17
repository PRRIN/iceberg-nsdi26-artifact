target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"

@__const.leak1.buf = private unnamed_addr constant [100 x i8] c"I am local.\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 1
@__const.leak2.buf = private unnamed_addr constant [100 x i8] c"I am local.\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 1
@gbuf = common global ptr null, align 8
@__const.leak3.buf = private unnamed_addr constant [100 x i8] c"I am local.\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @leak1() #0 {
  %1 = alloca [100 x i8], align 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %1, ptr align 1 @__const.leak1.buf, i64 100, i1 false)
  %2 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  ret ptr %2
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @leak2() #0 {
  %1 = alloca [100 x i8], align 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %1, ptr align 1 @__const.leak2.buf, i64 100, i1 false)
  %2 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  store ptr %2, ptr @gbuf, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @leak3() #0 {
  %1 = alloca [100 x i8], align 1
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %1, ptr align 1 @__const.leak3.buf, i64 100, i1 false)
  %4 = call ptr @malloc(i64 noundef 8) #3
  store ptr %4, ptr %2, align 8
  %5 = call ptr @malloc(i64 noundef 8) #3
  store ptr %5, ptr %3, align 8
  %6 = getelementptr inbounds [100 x i8], ptr %1, i64 0, i64 0
  %7 = ptrtoint ptr %6 to i64
  %8 = load ptr, ptr %2, align 8
  store i64 %7, ptr %8, align 8
  %9 = load ptr, ptr %2, align 8
  %10 = ptrtoint ptr %9 to i64
  %11 = load ptr, ptr %3, align 8
  store i64 %10, ptr %11, align 8
  %12 = load ptr, ptr %3, align 8
  store ptr %12, ptr @gbuf, align 8
  ret void
}

; Function Attrs: allocsize(0)
declare ptr @malloc(i64 noundef) #2