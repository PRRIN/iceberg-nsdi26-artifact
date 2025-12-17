target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"

%struct.MyStruct = type { i32, i32 }

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @satMul3(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 2147483647, ptr %3, align 4
  %11 = load i32, ptr %2, align 4
  %12 = shl i32 %11, 1
  %13 = load i32, ptr %2, align 4
  %14 = add nsw i32 %12, %13
  store i32 %14, ptr %4, align 4
  %15 = load i32, ptr %2, align 4
  %16 = ashr i32 %15, 31
  %17 = and i32 %16, 1
  store i32 %17, ptr %5, align 4
  %18 = load i32, ptr %2, align 4
  %19 = ashr i32 %18, 30
  %20 = and i32 %19, 1
  store i32 %20, ptr %6, align 4
  %21 = load i32, ptr %4, align 4
  %22 = ashr i32 %21, 31
  %23 = and i32 %22, 1
  store i32 %23, ptr %7, align 4
  %24 = load i32, ptr %5, align 4
  %25 = load i32, ptr %7, align 4
  %26 = xor i32 %24, %25
  %27 = load i32, ptr %5, align 4
  %28 = load i32, ptr %6, align 4
  %29 = xor i32 %27, %28
  %30 = or i32 %26, %29
  store i32 %30, ptr %8, align 4
  %31 = load i32, ptr %8, align 4
  %32 = shl i32 %31, 31
  %33 = ashr i32 %32, 31
  store i32 %33, ptr %9, align 4
  %34 = load i32, ptr %9, align 4
  %35 = xor i32 %34, -1
  %36 = load i32, ptr %4, align 4
  %37 = and i32 %35, %36
  %38 = load i32, ptr %9, align 4
  %39 = load i32, ptr %3, align 4
  %40 = load i32, ptr %5, align 4
  %41 = add nsw i32 %39, %40
  %42 = and i32 %38, %41
  %43 = add nsw i32 %37, %42
  store i32 %43, ptr %10, align 4
  %44 = load i32, ptr %10, align 4
  ret i32 %44
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @test(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.MyStruct, align 4
  %10 = alloca i8, align 1
  %11 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  %12 = load i32, ptr %5, align 4
  %13 = getelementptr inbounds %struct.MyStruct, ptr %9, i32 0, i32 0
  store i32 %12, ptr %13, align 4
  %14 = load i32, ptr %5, align 4
  %15 = getelementptr inbounds %struct.MyStruct, ptr %9, i32 0, i32 1
  store i32 %14, ptr %15, align 4
  %16 = load i32, ptr %5, align 4
  %17 = trunc i32 %16 to i8
  store i8 %17, ptr %10, align 1
  store i32 1, ptr %11, align 4
  %18 = load i32, ptr %8, align 4
  switch i32 %18, label %42 [
    i32 0, label %19
    i32 1, label %28
    i32 2, label %37
  ]

19:                                               ; preds = %4
  %20 = load i32, ptr %6, align 4
  %21 = getelementptr inbounds %struct.MyStruct, ptr %9, i32 0, i32 0
  %22 = load i32, ptr %21, align 4
  %23 = add nsw i32 %22, %20
  store i32 %23, ptr %21, align 4
  %24 = getelementptr inbounds %struct.MyStruct, ptr %9, i32 0, i32 0
  %25 = load i32, ptr %24, align 4
  %26 = load i32, ptr %11, align 4
  %27 = mul nsw i32 %26, %25
  store i32 %27, ptr %11, align 4
  br label %43

28:                                               ; preds = %4
  %29 = load i32, ptr %6, align 4
  %30 = getelementptr inbounds %struct.MyStruct, ptr %9, i32 0, i32 1
  %31 = load i32, ptr %30, align 4
  %32 = sub nsw i32 %31, %29
  store i32 %32, ptr %30, align 4
  %33 = load i8, ptr %10, align 1
  %34 = sext i8 %33 to i32
  %35 = load i32, ptr %11, align 4
  %36 = add nsw i32 %35, %34
  store i32 %36, ptr %11, align 4
  br label %43

37:                                               ; preds = %4
  %38 = load i32, ptr %8, align 4
  store i32 %38, ptr %11, align 4
  %39 = load i32, ptr %6, align 4
  %40 = load i32, ptr %11, align 4
  %41 = add nsw i32 %40, %39
  store i32 %41, ptr %11, align 4
  br label %43

42:                                               ; preds = %4
  br label %43

43:                                               ; preds = %42, %37, %28, %19
  %44 = load i32, ptr %7, align 4
  %45 = load i32, ptr %11, align 4
  %46 = and i32 %45, %44
  store i32 %46, ptr %11, align 4
  %47 = load i32, ptr %11, align 4
  %48 = icmp sgt i32 %47, 0
  br i1 %48, label %49, label %54

49:                                               ; preds = %43
  %50 = getelementptr inbounds %struct.MyStruct, ptr %9, i32 0, i32 1
  %51 = load i32, ptr %50, align 4
  %52 = load i32, ptr %11, align 4
  %53 = sub nsw i32 %52, %51
  store i32 %53, ptr %11, align 4
  br label %58

54:                                               ; preds = %43
  %55 = load i32, ptr %11, align 4
  %56 = load i32, ptr %11, align 4
  %57 = mul nsw i32 %56, %55
  store i32 %57, ptr %11, align 4
  br label %58

58:                                               ; preds = %54, %49
  %59 = load i32, ptr %11, align 4
  ret i32 %59
}
