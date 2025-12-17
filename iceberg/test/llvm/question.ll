target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"

@global = global i32 0, align 4
@c = common global i32 0, align 4

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @f2(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = load i32, ptr @global, align 4
  %5 = add nsw i32 %4, %3
  store i32 %5, ptr @global, align 4
  %6 = load i32, ptr @global, align 4
  ret i32 %6
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @f1(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = call i32 @f2(i32 noundef %3)
  store i32 %4, ptr %2, align 4
  %5 = load i32, ptr %2, align 4
  %6 = mul nsw i32 2, %5
  %7 = call i32 @f2(i32 noundef %6)
  store i32 %7, ptr %2, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @callee(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = load i32, ptr %3, align 4
  %5 = add nsw i32 %4, 1
  %6 = load ptr, ptr %2, align 8
  store i32 %5, ptr %6, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @intermediate(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  call void @callee(ptr noundef %3)
  %4 = load ptr, ptr %2, align 8
  call void @callee(ptr noundef %4)
  %5 = load i32, ptr %3, align 4
  %6 = load ptr, ptr %2, align 8
  %7 = load i32, ptr %6, align 4
  %8 = add nsw i32 %7, %5
  store i32 %8, ptr %6, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i64 @caller() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr @c, align 4
  call void @callee(ptr noundef %1)
  call void @intermediate(ptr noundef %1)
  call void @intermediate(ptr noundef %1)
  call void @intermediate(ptr noundef %2)
  call void @callee(ptr noundef %2)
  call void @intermediate(ptr noundef %2)
  call void @intermediate(ptr noundef @c)
  call void @intermediate(ptr noundef @c)
  call void @callee(ptr noundef @c)
  %3 = load i32, ptr %1, align 4
  %4 = mul nsw i32 %3, 10000
  %5 = load i32, ptr %2, align 4
  %6 = mul nsw i32 %5, 100
  %7 = add nsw i32 %4, %6
  %8 = load i32, ptr @c, align 4
  %9 = add nsw i32 %7, %8
  %10 = sext i32 %9 to i64
  ret i64 %10
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @may_alias(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = load i32, ptr %5, align 4
  %7 = load ptr, ptr %3, align 8
  %8 = load i32, ptr %7, align 4
  %9 = add nsw i32 %8, %6
  store i32 %9, ptr %7, align 4
  %10 = load ptr, ptr %4, align 8
  %11 = load i32, ptr %10, align 4
  %12 = load ptr, ptr %3, align 8
  %13 = load i32, ptr %12, align 4
  %14 = add nsw i32 %13, %11
  store i32 %14, ptr %12, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @alias() #0 {
  %1 = alloca i32, align 4
  store i32 1, ptr %1, align 4
  call void @may_alias(ptr noundef %1, ptr noundef %1)
  %2 = load i32, ptr %1, align 4
  ret i32 %2
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @noalias() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 1, ptr %1, align 4
  store i32 1, ptr %2, align 4
  call void @may_alias(ptr noundef %1, ptr noundef %2)
  %3 = load i32, ptr %1, align 4
  ret i32 %3
}
