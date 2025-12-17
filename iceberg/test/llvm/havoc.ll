target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @leak() #0 {
  %1 = alloca i32, align 4
  ret ptr %1
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @undefined(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = call ptr @leak()
  %6 = load i32, ptr %5, align 4
  %7 = icmp sgt i32 %4, %6
  br i1 %7, label %8, label %9

8:                                                ; preds = %1
  store i32 1, ptr %2, align 4
  br label %10

9:                                                ; preds = %1
  store i32 0, ptr %2, align 4
  br label %10

10:                                               ; preds = %9, %8
  %11 = load i32, ptr %2, align 4
  ret i32 %11
}
