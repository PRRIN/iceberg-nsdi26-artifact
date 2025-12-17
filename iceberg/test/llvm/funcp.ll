target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"

@null = local_unnamed_addr global ptr null, align 8
@buf = common local_unnamed_addr global [4 x i64] zeroinitializer, align 8

; Function Attrs: mustprogress nofree norecurse nosync nounwind ssp willreturn uwtable(sync)
define i32 @panic(i32 noundef returned %0) #0 {
  %2 = load ptr, ptr @null, align 8, !tbaa !6
  store i32 %0, ptr %2, align 4, !tbaa !10
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone ssp willreturn uwtable(sync)
define i32 @ret(i32 noundef returned %0) #1 {
  ret i32 %0
}

; Function Attrs: nofree norecurse nosync nounwind ssp uwtable(sync)
define i32 @rotate(i32 noundef %0) #2 {
  %2 = add nsw i32 %0, -1
  %3 = sext i32 %2 to i64
  %4 = getelementptr inbounds [4 x i64], ptr @buf, i64 0, i64 %3
  %5 = load i64, ptr %4, align 8, !tbaa !12
  %6 = icmp sgt i32 %0, 1
  br i1 %6, label %7, label %10

7:                                                ; preds = %1
  %8 = zext i32 %0 to i64
  %9 = load i64, ptr @buf, align 8
  br label %12

10:                                               ; preds = %12, %1
  store i64 %5, ptr @buf, align 8, !tbaa !12
  %11 = trunc i64 %5 to i32
  ret i32 %11

12:                                               ; preds = %7, %12
  %13 = phi i64 [ 1, %7 ], [ %15, %12 ]
  %14 = getelementptr inbounds [4 x i64], ptr @buf, i64 0, i64 %13
  store i64 %9, ptr %14, align 8, !tbaa !12
  %15 = add nuw nsw i64 %13, 1
  %16 = icmp eq i64 %15, %8
  br i1 %16, label %10, label %12, !llvm.loop !14
}

; Function Attrs: nounwind ssp uwtable(sync)
define i32 @test_function_pointer(i32 noundef %0) #3 {
  store i64 ptrtoint (ptr @panic to i64), ptr @buf, align 8, !tbaa !12
  store i64 ptrtoint (ptr @ret to i64), ptr getelementptr inbounds ([4 x i64], ptr @buf, i64 0, i64 1), align 8, !tbaa !12
  store i64 ptrtoint (ptr @rotate to i64), ptr getelementptr inbounds ([4 x i64], ptr @buf, i64 0, i64 2), align 8, !tbaa !12
  store i64 ptrtoint (ptr @test_function_pointer to i64), ptr getelementptr inbounds ([4 x i64], ptr @buf, i64 0, i64 3), align 8, !tbaa !12
  %2 = srem i32 %0, 4
  %3 = sext i32 %2 to i64
  %4 = getelementptr inbounds [4 x i64], ptr @buf, i64 0, i64 %3
  %5 = load i64, ptr %4, align 8, !tbaa !12
  %6 = inttoptr i64 %5 to ptr
  %7 = add nsw i32 %0, -1
  %8 = tail call i32 %6(i32 noundef %7) #4
  ret i32 %8
}
