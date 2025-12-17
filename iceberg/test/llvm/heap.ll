target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"

%struct.S = type { i32, i8 }

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @test_basic() #0 {
  %1 = alloca ptr, align 8
  %2 = call ptr @malloc(i64 noundef 4) #3
  store ptr %2, ptr %1, align 8
  ret void
}

; Function Attrs: allocsize(0)
declare ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i64 @test_return(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  %4 = call ptr @malloc(i64 noundef 4) #3
  %5 = ptrtoint ptr %4 to i64
  store i64 %5, ptr %3, align 8
  %6 = call ptr @malloc(i64 noundef 8) #3
  %7 = load ptr, ptr %2, align 8
  store ptr %6, ptr %7, align 8
  %8 = load i64, ptr %3, align 8
  ret i64 %8
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @test_local(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %6 = call ptr @malloc(i64 noundef 8) #3
  store ptr %6, ptr %5, align 8
  %7 = load i32, ptr %3, align 4
  %8 = load ptr, ptr %5, align 8
  %9 = getelementptr inbounds %struct.S, ptr %8, i32 0, i32 0
  store i32 %7, ptr %9, align 4
  %10 = load i32, ptr %4, align 4
  %11 = trunc i32 %10 to i8
  %12 = load ptr, ptr %5, align 8
  %13 = getelementptr inbounds %struct.S, ptr %12, i32 0, i32 1
  store i8 %11, ptr %13, align 4
  %14 = load ptr, ptr %5, align 8
  %15 = getelementptr inbounds %struct.S, ptr %14, i32 0, i32 0
  %16 = load i32, ptr %15, align 4
  %17 = load ptr, ptr %5, align 8
  %18 = getelementptr inbounds %struct.S, ptr %17, i32 0, i32 1
  %19 = load i8, ptr %18, align 4
  %20 = sext i8 %19 to i32
  %21 = add nsw i32 %16, %20
  ret i32 %21
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @new() #0 {
  %1 = alloca ptr, align 8
  %2 = call ptr @malloc(i64 noundef 8) #3
  store ptr %2, ptr %1, align 8
  %3 = load ptr, ptr %1, align 8
  %4 = getelementptr inbounds %struct.S, ptr %3, i32 0, i32 0
  store i32 0, ptr %4, align 4
  %5 = load ptr, ptr %1, align 8
  %6 = getelementptr inbounds %struct.S, ptr %5, i32 0, i32 1
  store i8 0, ptr %6, align 4
  %7 = load ptr, ptr %1, align 8
  ret ptr %7
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @test_construct(i32 noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store i32 %0, ptr %3, align 4
  %6 = call ptr @new()
  store ptr %6, ptr %4, align 8
  %7 = call ptr @new()
  store ptr %7, ptr %5, align 8
  %8 = load i32, ptr %3, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %10, label %16

10:                                               ; preds = %1
  %11 = load i32, ptr %3, align 4
  %12 = trunc i32 %11 to i8
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds %struct.S, ptr %13, i32 0, i32 1
  store i8 %12, ptr %14, align 4
  %15 = load ptr, ptr %4, align 8
  store ptr %15, ptr %2, align 8
  br label %18

16:                                               ; preds = %1
  %17 = load ptr, ptr %5, align 8
  store ptr %17, ptr %2, align 8
  br label %18

18:                                               ; preds = %16, %10
  %19 = load ptr, ptr %2, align 8
  ret ptr %19
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @foo(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %3)
  ret void
}

declare void @free(ptr noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @test_free(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store i32 %0, ptr %2, align 4
  %4 = call ptr @malloc(i64 noundef 4) #3
  store ptr %4, ptr %3, align 8
  %5 = load i32, ptr %2, align 4
  %6 = icmp eq i32 %5, 1
  br i1 %6, label %7, label %9

7:                                                ; preds = %1
  %8 = load ptr, ptr %3, align 8
  call void @foo(ptr noundef %8)
  br label %9

9:                                                ; preds = %7, %1
  %10 = load ptr, ptr %3, align 8
  store i32 1, ptr %10, align 4
  %11 = load i32, ptr %2, align 4
  %12 = icmp eq i32 %11, 2
  br i1 %12, label %13, label %15

13:                                               ; preds = %9
  %14 = load ptr, ptr %3, align 8
  call void @foo(ptr noundef %14)
  br label %15

15:                                               ; preds = %13, %9
  %16 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %16)
  ret void
}