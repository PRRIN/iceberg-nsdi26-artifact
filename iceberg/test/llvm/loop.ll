target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"

@arr = common global [2 x i32] zeroinitializer, align 4

; Function Attrs: nofree norecurse nosync nounwind readnone ssp uwtable(sync)
define i32 @loop0(i8 noundef signext %0) local_unnamed_addr #0 {
  %2 = icmp sgt i8 %0, 0
  br i1 %2, label %3, label %9

3:                                                ; preds = %1, %3
  %4 = phi i32 [ %7, %3 ], [ 0, %1 ]
  %5 = phi i8 [ %6, %3 ], [ %0, %1 ]
  %6 = lshr i8 %5, 1
  %7 = add nuw nsw i32 %4, 1
  %8 = icmp ult i8 %5, 2
  br i1 %8, label %9, label %3, !llvm.loop !6

9:                                                ; preds = %3, %1
  %10 = phi i32 [ 0, %1 ], [ %7, %3 ]
  ret i32 %10
}

; Function Attrs: nofree norecurse nosync nounwind readnone ssp uwtable(sync)
define i32 @loop1(i8 noundef signext %0, i8 noundef signext %1) local_unnamed_addr #0 {
  %3 = sext i8 %1 to i32
  %4 = sext i8 %0 to i32
  %5 = sub nsw i32 %3, %4
  %6 = icmp sgt i32 %5, 1
  br i1 %6, label %7, label %22

7:                                                ; preds = %2, %7
  %8 = phi i32 [ %19, %7 ], [ %4, %2 ]
  %9 = phi i32 [ %18, %7 ], [ %3, %2 ]
  %10 = phi i8 [ %17, %7 ], [ %1, %2 ]
  %11 = phi i8 [ %16, %7 ], [ %0, %2 ]
  %12 = add nsw i32 %9, %8
  %13 = ashr i32 %12, 1
  %14 = trunc i32 %13 to i8
  %15 = icmp slt i32 %12, 0
  %16 = select i1 %15, i8 %14, i8 %11
  %17 = select i1 %15, i8 %10, i8 %14
  %18 = sext i8 %17 to i32
  %19 = sext i8 %16 to i32
  %20 = sub nsw i32 %18, %19
  %21 = icmp sgt i32 %20, 1
  br i1 %21, label %7, label %22, !llvm.loop !8

22:                                               ; preds = %7, %2
  %23 = phi i32 [ 0, %2 ], [ %13, %7 ]
  ret i32 %23
}

; Function Attrs: nofree norecurse nounwind ssp uwtable(sync)
define i32 @loop2() local_unnamed_addr #1 {
  store volatile i32 0, ptr @arr, align 4, !tbaa !9
  store volatile i32 1, ptr getelementptr inbounds ([2 x i32], ptr @arr, i64 0, i64 1), align 4, !tbaa !9
  br label %3

1:                                                ; preds = %3
  %2 = load volatile i32, ptr @arr, align 4, !tbaa !9
  ret i32 %2

3:                                                ; preds = %0, %3
  %4 = phi i32 [ 0, %0 ], [ %5, %3 ]
  %5 = add nuw nsw i32 %4, 1
  %6 = and i32 %5, 1
  %7 = zext i32 %6 to i64
  %8 = getelementptr inbounds [2 x i32], ptr @arr, i64 0, i64 %7
  %9 = load volatile i32, ptr %8, align 4, !tbaa !9
  %10 = and i32 %4, 1
  %11 = zext i32 %10 to i64
  %12 = getelementptr inbounds [2 x i32], ptr @arr, i64 0, i64 %11
  %13 = load volatile i32, ptr %12, align 4, !tbaa !9
  %14 = add nsw i32 %13, %9
  store volatile i32 %14, ptr %12, align 4, !tbaa !9
  %15 = icmp eq i32 %5, 65536
  br i1 %15, label %1, label %3, !llvm.loop !13
}