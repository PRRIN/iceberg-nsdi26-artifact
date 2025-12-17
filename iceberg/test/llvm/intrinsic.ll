target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"

%struct.S = type { %struct.anon, i8, [2 x i32], ptr }
%struct.anon = type { i32, i8 }

@__const.llvm_memcpy1.arr = private unnamed_addr constant [10 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10], align 4
@glb = common global %struct.S zeroinitializer, align 8
@__const.llvm_memcpy2.s = private unnamed_addr constant %struct.S { %struct.anon { i32 1, i8 2 }, i8 3, [2 x i32] [i32 4, i32 5], ptr @glb }, align 8

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @llvm_memcpy1(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca [10 x i32], align 4
  store i32 %0, ptr %2, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %3, ptr align 4 @__const.llvm_memcpy1.arr, i64 40, i1 false)
  %4 = load i32, ptr %2, align 4
  %5 = sext i32 %4 to i64
  %6 = getelementptr inbounds [10 x i32], ptr %3, i64 0, i64 %5
  %7 = load i32, ptr %6, align 4
  ret i32 %7
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @llvm_memset1(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca [100 x i32], align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  call void @llvm.memset.p0.i64(ptr align 4 %5, i8 0, i64 400, i1 false)
  %6 = load i32, ptr %3, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [100 x i32], ptr %5, i64 0, i64 %7
  store i32 1, ptr %8, align 4
  %9 = load i32, ptr %4, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [100 x i32], ptr %5, i64 0, i64 %10
  %12 = load i32, ptr %11, align 4
  ret i32 %12
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @llvm_memcpy2(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.S, align 8
  store i32 %0, ptr %2, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %3, ptr align 8 @__const.llvm_memcpy2.s, i64 32, i1 false)
  %4 = getelementptr inbounds %struct.S, ptr %3, i32 0, i32 2
  %5 = load i32, ptr %2, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [2 x i32], ptr %4, i64 0, i64 %6
  %8 = load i32, ptr %7, align 4
  %9 = getelementptr inbounds %struct.S, ptr %3, i32 0, i32 3
  %10 = load ptr, ptr %9, align 8
  %11 = getelementptr inbounds %struct.S, ptr %10, i32 0, i32 1
  %12 = load i8, ptr %11, align 8
  %13 = sext i8 %12 to i32
  %14 = add nsw i32 %8, %13
  ret i32 %14
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i64 @llvm_memset2(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca %struct.S, align 8
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  call void @llvm.memset.p0.i64(ptr align 8 %5, i8 0, i64 32, i1 false)
  %6 = getelementptr inbounds %struct.S, ptr %5, i32 0, i32 2
  %7 = load i32, ptr %3, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [2 x i32], ptr %6, i64 0, i64 %8
  store i32 1, ptr %9, align 4
  %10 = getelementptr inbounds %struct.S, ptr %5, i32 0, i32 3
  %11 = load ptr, ptr %10, align 8
  %12 = ptrtoint ptr %11 to i64
  %13 = getelementptr inbounds %struct.S, ptr %5, i32 0, i32 2
  %14 = load i32, ptr %4, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [2 x i32], ptr %13, i64 0, i64 %15
  %17 = load i32, ptr %16, align 4
  %18 = sext i32 %17 to i64
  %19 = add nsw i64 %12, %18
  ret i64 %19
}
