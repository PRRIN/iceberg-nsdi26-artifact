target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"

%struct.thing = type { i32 }

@global = common global i32 0, align 4
@test_results = common global [3 x i32] zeroinitializer, align 4

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @callee(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.thing, ptr %3, i64 1
  %5 = getelementptr inbounds %struct.thing, ptr %4, i32 0, i32 0
  store i32 1, ptr %5, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @caller() #0 {
  %1 = alloca [3 x %struct.thing], align 4
  call void @llvm.memset.p0.i64(ptr align 4 %1, i8 0, i64 12, i1 false)
  %2 = getelementptr inbounds [3 x %struct.thing], ptr %1, i64 0, i64 0
  call void @callee(ptr noundef %2)
  %3 = getelementptr inbounds [3 x %struct.thing], ptr %1, i64 0, i64 1
  call void @callee(ptr noundef %3)
  %4 = getelementptr inbounds [3 x %struct.thing], ptr %1, i64 0, i64 0
  %5 = getelementptr inbounds %struct.thing, ptr %4, i32 0, i32 0
  %6 = load i32, ptr %5, align 4
  %7 = getelementptr inbounds [3 x %struct.thing], ptr %1, i64 0, i64 1
  %8 = getelementptr inbounds %struct.thing, ptr %7, i32 0, i32 0
  %9 = load i32, ptr %8, align 4
  %10 = add nsw i32 %6, %9
  %11 = getelementptr inbounds [3 x %struct.thing], ptr %1, i64 0, i64 2
  %12 = getelementptr inbounds %struct.thing, ptr %11, i32 0, i32 0
  %13 = load i32, ptr %12, align 4
  %14 = add nsw i32 %10, %13
  ret i32 %14
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @eq(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  store i32 0, ptr %6, align 4
  %7 = load ptr, ptr %5, align 8
  store i32 0, ptr %7, align 4
  %8 = load ptr, ptr %4, align 8
  %9 = icmp eq ptr %8, @global
  br i1 %9, label %10, label %17

10:                                               ; preds = %2
  %11 = load ptr, ptr %5, align 8
  %12 = load ptr, ptr %4, align 8
  %13 = icmp ne ptr %11, %12
  br i1 %13, label %14, label %17

14:                                               ; preds = %10
  %15 = load ptr, ptr %4, align 8
  store i32 1, ptr %15, align 4
  %16 = load ptr, ptr %5, align 8
  store i32 2, ptr %16, align 4
  store i32 1, ptr %3, align 4
  br label %18

17:                                               ; preds = %10, %2
  store i32 0, ptr %3, align 4
  br label %18

18:                                               ; preds = %17, %14
  %19 = load i32, ptr %3, align 4
  ret i32 %19
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @test_eq() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = call i32 @eq(ptr noundef %1, ptr noundef %2)
  store i32 %3, ptr @test_results, align 4
  %4 = call i32 @eq(ptr noundef @global, ptr noundef @global)
  store i32 %4, ptr getelementptr inbounds ([3 x i32], ptr @test_results, i64 0, i64 1), align 4
  %5 = call i32 @eq(ptr noundef @global, ptr noundef %1)
  store i32 %5, ptr getelementptr inbounds ([3 x i32], ptr @test_results, i64 0, i64 2), align 4
  ret void
}