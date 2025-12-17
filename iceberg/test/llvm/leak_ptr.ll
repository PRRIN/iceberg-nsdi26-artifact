target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"

%struct.Ptr = type { ptr }

@global = dso_local global i32 0, align 4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @leak(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  store i32 1, ptr @global, align 4
  %3 = call noalias ptr @malloc(i64 noundef 4) #3
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.Ptr, ptr %4, i32 0, i32 0
  store ptr %3, ptr %5, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.Ptr, ptr %6, i32 0, i32 0
  %8 = load ptr, ptr %7, align 8
  call void @free(ptr noundef %8) #4
  ret void
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nounwind
declare void @free(ptr noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @caller() #0 {
  %1 = alloca %struct.Ptr, align 8
  call void @leak(ptr noundef %1)
  store i32 2, ptr @global, align 4
  ret void
}
