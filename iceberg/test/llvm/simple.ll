target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @func1(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i8, align 1
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %7 = load i32, ptr %3, align 4
  %8 = load i32, ptr %4, align 4
  %9 = add nsw i32 %7, %8
  store i32 %9, ptr %5, align 4
  %10 = load i32, ptr %5, align 4
  %11 = shl i32 %10, 4
  store i32 %11, ptr %5, align 4
  %12 = load i32, ptr %5, align 4
  %13 = load i32, ptr %3, align 4
  %14 = xor i32 %12, %13
  %15 = trunc i32 %14 to i8
  store i8 %15, ptr %6, align 1
  %16 = load i8, ptr %6, align 1
  %17 = sext i8 %16 to i32
  %18 = load i32, ptr %3, align 4
  %19 = load i32, ptr %4, align 4
  %20 = sub nsw i32 %18, %19
  %21 = or i32 %17, %20
  ret i32 %21
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @func2(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %6 = load i32, ptr %4, align 4
  switch i32 %6, label %13 [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %12
  ]

7:                                                ; preds = %2
  store i32 -1, ptr %3, align 4
  br label %14

8:                                                ; preds = %2
  %9 = load i32, ptr %4, align 4
  %10 = load i32, ptr %5, align 4
  %11 = add nsw i32 %9, %10
  store i32 %11, ptr %3, align 4
  br label %14

12:                                               ; preds = %2
  store i32 3, ptr %3, align 4
  br label %14

13:                                               ; preds = %2
  store i32 4, ptr %3, align 4
  br label %14

14:                                               ; preds = %13, %12, %8, %7
  %15 = load i32, ptr %3, align 4
  ret i32 %15
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @func3(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %6 = load i32, ptr %4, align 4
  switch i32 %6, label %16 [
    i32 0, label %7
    i32 1, label %8
    i32 2, label %12
  ]

7:                                                ; preds = %2
  store i32 -1, ptr %3, align 4
  br label %20

8:                                                ; preds = %2
  %9 = load i32, ptr %4, align 4
  %10 = load i32, ptr %5, align 4
  %11 = add nsw i32 %9, %10
  store i32 %11, ptr %3, align 4
  br label %20

12:                                               ; preds = %2
  %13 = load i32, ptr %5, align 4
  %14 = load i32, ptr %4, align 4
  %15 = call i32 @func2(i32 noundef %13, i32 noundef %14)
  store i32 %15, ptr %3, align 4
  br label %20

16:                                               ; preds = %2
  %17 = load i32, ptr %4, align 4
  %18 = load i32, ptr %5, align 4
  %19 = call i32 @func1(i32 noundef %17, i32 noundef %18)
  store i32 %19, ptr %3, align 4
  br label %20

20:                                               ; preds = %16, %12, %8, %7
  %21 = load i32, ptr %3, align 4
  ret i32 %21
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @func4(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %6 = load i32, ptr %4, align 4
  %7 = load i32, ptr %5, align 4
  %8 = call i32 @func3(i32 noundef %6, i32 noundef %7)
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %14

10:                                               ; preds = %2
  %11 = load i32, ptr %4, align 4
  %12 = load i32, ptr %5, align 4
  %13 = call i32 @func2(i32 noundef %11, i32 noundef %12)
  store i32 %13, ptr %3, align 4
  br label %20

14:                                               ; preds = %2
  %15 = call i32 @func1(i32 noundef 0, i32 noundef 1)
  %16 = load i32, ptr %4, align 4
  %17 = load i32, ptr %5, align 4
  %18 = add nsw i32 %16, %17
  %19 = call i32 @func2(i32 noundef %15, i32 noundef %18)
  store i32 %19, ptr %3, align 4
  br label %20

20:                                               ; preds = %14, %10
  %21 = load i32, ptr %3, align 4
  ret i32 %21
}
