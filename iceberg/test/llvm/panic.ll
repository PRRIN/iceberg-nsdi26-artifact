target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @div_by_zero() #0 {
  %1 = alloca [200 x i32], align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, ptr %2, align 4
  br label %5

5:                                                ; preds = %14, %0
  %6 = load i32, ptr %2, align 4
  %7 = icmp slt i32 %6, 200
  br i1 %7, label %8, label %17

8:                                                ; preds = %5
  %9 = load i32, ptr %2, align 4
  %10 = sub nsw i32 100, %9
  %11 = load i32, ptr %2, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [200 x i32], ptr %1, i64 0, i64 %12
  store i32 %10, ptr %13, align 4
  br label %14

14:                                               ; preds = %8
  %15 = load i32, ptr %2, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, ptr %2, align 4
  br label %5, !llvm.loop !6

17:                                               ; preds = %5
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %18

18:                                               ; preds = %29, %17
  %19 = load i32, ptr %4, align 4
  %20 = icmp slt i32 %19, 200
  br i1 %20, label %21, label %32

21:                                               ; preds = %18
  %22 = load i32, ptr %4, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [200 x i32], ptr %1, i64 0, i64 %23
  %25 = load i32, ptr %24, align 4
  %26 = sdiv i32 200, %25
  %27 = load i32, ptr %3, align 4
  %28 = add nsw i32 %27, %26
  store i32 %28, ptr %3, align 4
  br label %29

29:                                               ; preds = %21
  %30 = load i32, ptr %4, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %4, align 4
  br label %18, !llvm.loop !8

32:                                               ; preds = %18
  %33 = load i32, ptr %3, align 4
  ret i32 %33
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @out_of_bound(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds i32, ptr %4, i64 0
  %6 = load volatile i32, ptr %5, align 4
  switch i32 %6, label %32 [
    i32 0, label %7
    i32 1, label %10
    i32 2, label %18
    i32 3, label %31
  ]

7:                                                ; preds = %1
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds i32, ptr %8, i64 4
  store volatile i32 0, ptr %9, align 4
  br label %34

10:                                               ; preds = %1
  %11 = load ptr, ptr %3, align 8
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds i32, ptr %12, i64 0
  %14 = load volatile i32, ptr %13, align 4
  %15 = sub nsw i32 %14, 2
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i32, ptr %11, i64 %16
  store volatile i32 1, ptr %17, align 4
  br label %34

18:                                               ; preds = %1
  %19 = load ptr, ptr %3, align 8
  %20 = load ptr, ptr %3, align 8
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds i32, ptr %21, i64 0
  %23 = load volatile i32, ptr %22, align 4
  %24 = sub nsw i32 %23, 2
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i32, ptr %20, i64 %25
  %27 = load volatile i32, ptr %26, align 4
  %28 = add nsw i32 %27, 100
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i32, ptr %19, i64 %29
  store volatile i32 2, ptr %30, align 4
  br label %34

31:                                               ; preds = %1
  store i32 1, ptr %2, align 4
  br label %35

32:                                               ; preds = %1
  %33 = call i32 @div_by_zero()
  br label %34

34:                                               ; preds = %32, %18, %10, %7
  store i32 0, ptr %2, align 4
  br label %35

35:                                               ; preds = %34, %31
  %36 = load i32, ptr %2, align 4
  ret i32 %36
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @null_pointer(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = icmp ne ptr %5, null
  br i1 %6, label %7, label %10

7:                                                ; preds = %1
  %8 = load ptr, ptr %2, align 8
  %9 = load i32, ptr %8, align 4
  br label %11

10:                                               ; preds = %1
  br label %11

11:                                               ; preds = %10, %7
  %12 = phi i32 [ %9, %7 ], [ 0, %10 ]
  store i32 %12, ptr %3, align 4
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds i32, ptr %13, i64 1
  %15 = load i32, ptr %14, align 4
  store i32 %15, ptr %4, align 4
  %16 = load i32, ptr %3, align 4
  %17 = load i32, ptr %4, align 4
  %18 = add nsw i32 %16, %17
  ret i32 %18
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @nested(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca [3 x i32], align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %8 = getelementptr inbounds [3 x i32], ptr %7, i64 0, i64 0
  %9 = load i32, ptr %4, align 4
  store i32 %9, ptr %8, align 4
  %10 = getelementptr inbounds i32, ptr %8, i64 1
  %11 = load i32, ptr %5, align 4
  store i32 %11, ptr %10, align 4
  %12 = getelementptr inbounds i32, ptr %10, i64 1
  %13 = load i32, ptr %6, align 4
  store i32 %13, ptr %12, align 4
  %14 = getelementptr inbounds [3 x i32], ptr %7, i64 0, i64 1
  store i32 3, ptr %14, align 4
  %15 = getelementptr inbounds [3 x i32], ptr %7, i64 0, i64 0
  %16 = call i32 @null_pointer(ptr noundef %15)
  %17 = getelementptr inbounds [3 x i32], ptr %7, i64 0, i64 0
  store i32 %16, ptr %17, align 4
  %18 = getelementptr inbounds [3 x i32], ptr %7, i64 0, i64 0
  %19 = call i32 @out_of_bound(ptr noundef %18)
  ret i32 %19
}
