target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"

%struct.List = type { i32, ptr, ptr, %struct.ListNode, %struct.ListNode }
%struct.ListNode = type { i32, ptr, ptr }

@list = common global %struct.List zeroinitializer, align 8
@nodes = common global [3 x %struct.ListNode] zeroinitializer, align 8

; Function Attrs: nofree norecurse nosync nounwind readonly ssp uwtable(sync)
define i32 @main(i32 noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %4, label %15

4:                                                ; preds = %2
  %5 = zext i32 %0 to i64
  br label %6

6:                                                ; preds = %4, %24
  %7 = phi i64 [ 0, %4 ], [ %27, %24 ]
  %8 = phi i32 [ 1, %4 ], [ %26, %24 ]
  %9 = phi i32 [ 0, %4 ], [ %25, %24 ]
  %10 = getelementptr inbounds ptr, ptr %1, i64 %7
  %11 = load ptr, ptr %10, align 8, !tbaa !6
  br label %17

12:                                               ; preds = %24
  %13 = mul i32 %26, 100
  %14 = add i32 %13, %25
  br label %15

15:                                               ; preds = %12, %2
  %16 = phi i32 [ %14, %12 ], [ 100, %2 ]
  ret i32 %16

17:                                               ; preds = %17, %6
  %18 = phi i32 [ %23, %17 ], [ 0, %6 ]
  %19 = zext i32 %18 to i64
  %20 = getelementptr inbounds i8, ptr %11, i64 %19
  %21 = load i8, ptr %20, align 1, !tbaa !10
  %22 = icmp eq i8 %21, 0
  %23 = add i32 %18, 1
  br i1 %22, label %24, label %17, !llvm.loop !11

24:                                               ; preds = %17
  %25 = add i32 %18, %9
  %26 = mul i32 %18, %8
  %27 = add nuw nsw i64 %7, 1
  %28 = icmp eq i64 %27, %5
  br i1 %28, label %12, label %6, !llvm.loop !14
}

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: argmemonly mustprogress nofree noinline norecurse nosync nounwind ssp willreturn writeonly uwtable(sync)
define void @list_init(ptr noundef %0) local_unnamed_addr #2 {
  %2 = getelementptr inbounds %struct.List, ptr %0, i64 0, i32 4
  %3 = getelementptr inbounds %struct.List, ptr %0, i64 0, i32 3
  %4 = getelementptr inbounds %struct.List, ptr %0, i64 0, i32 3, i32 1
  store ptr %2, ptr %4, align 8, !tbaa !15
  %5 = getelementptr inbounds %struct.List, ptr %0, i64 0, i32 3, i32 2
  store ptr null, ptr %5, align 8, !tbaa !19
  %6 = getelementptr inbounds %struct.List, ptr %0, i64 0, i32 4, i32 1
  store ptr null, ptr %6, align 8, !tbaa !20
  %7 = getelementptr inbounds %struct.List, ptr %0, i64 0, i32 4, i32 2
  store ptr %3, ptr %7, align 8, !tbaa !21
  %8 = getelementptr inbounds %struct.List, ptr %0, i64 0, i32 1
  store ptr %3, ptr %8, align 8, !tbaa !22
  %9 = getelementptr inbounds %struct.List, ptr %0, i64 0, i32 2
  store ptr %2, ptr %9, align 8, !tbaa !23
  store i32 0, ptr %0, align 8, !tbaa !24
  ret void
}

; Function Attrs: argmemonly mustprogress nofree noinline norecurse nosync nounwind readonly ssp willreturn uwtable(sync)
define i32 @list_len(ptr nocapture noundef readonly %0) local_unnamed_addr #3 {
  %2 = load i32, ptr %0, align 8, !tbaa !24
  ret i32 %2
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind ssp willreturn uwtable(sync)
define void @list_push_back(ptr nocapture noundef %0, ptr noundef %1) local_unnamed_addr #4 {
  %3 = load i32, ptr %0, align 8, !tbaa !24
  %4 = add i32 %3, 1
  store i32 %4, ptr %0, align 8, !tbaa !24
  %5 = getelementptr inbounds %struct.List, ptr %0, i64 0, i32 2
  %6 = load ptr, ptr %5, align 8, !tbaa !23
  %7 = getelementptr inbounds %struct.ListNode, ptr %6, i64 0, i32 2
  %8 = load ptr, ptr %7, align 8, !tbaa !25
  %9 = getelementptr inbounds %struct.ListNode, ptr %1, i64 0, i32 2
  store ptr %8, ptr %9, align 8, !tbaa !25
  %10 = load ptr, ptr %7, align 8, !tbaa !25
  %11 = getelementptr inbounds %struct.ListNode, ptr %10, i64 0, i32 1
  store ptr %1, ptr %11, align 8, !tbaa !26
  %12 = getelementptr inbounds %struct.ListNode, ptr %1, i64 0, i32 1
  store ptr %6, ptr %12, align 8, !tbaa !26
  store ptr %1, ptr %7, align 8, !tbaa !25
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind ssp willreturn uwtable(sync)
define ptr @list_pop_back(ptr nocapture noundef %0) local_unnamed_addr #4 {
  %2 = getelementptr inbounds %struct.List, ptr %0, i64 0, i32 2
  %3 = load ptr, ptr %2, align 8, !tbaa !23
  %4 = getelementptr inbounds %struct.ListNode, ptr %3, i64 0, i32 2
  %5 = load ptr, ptr %4, align 8, !tbaa !25
  %6 = getelementptr inbounds %struct.List, ptr %0, i64 0, i32 1
  %7 = load ptr, ptr %6, align 8, !tbaa !22
  %8 = icmp eq ptr %5, %7
  br i1 %8, label %15, label %9

9:                                                ; preds = %1
  %10 = load i32, ptr %0, align 8, !tbaa !24
  %11 = add i32 %10, -1
  store i32 %11, ptr %0, align 8, !tbaa !24
  %12 = getelementptr inbounds %struct.ListNode, ptr %5, i64 0, i32 2
  %13 = load ptr, ptr %12, align 8, !tbaa !25
  %14 = getelementptr inbounds %struct.ListNode, ptr %13, i64 0, i32 1
  store ptr %3, ptr %14, align 8, !tbaa !26
  store ptr %13, ptr %4, align 8, !tbaa !25
  br label %15

15:                                               ; preds = %1, %9
  %16 = phi ptr [ %5, %9 ], [ null, %1 ]
  ret ptr %16
}

; Function Attrs: nofree noinline norecurse nosync nounwind readonly ssp uwtable(sync)
define i32 @list_sum(ptr nocapture noundef readonly %0) local_unnamed_addr #5 {
  %2 = getelementptr inbounds %struct.List, ptr %0, i64 0, i32 1
  %3 = load ptr, ptr %2, align 8, !tbaa !22
  %4 = getelementptr inbounds %struct.List, ptr %0, i64 0, i32 2
  %5 = load ptr, ptr %4, align 8, !tbaa !23
  %6 = getelementptr inbounds %struct.ListNode, ptr %3, i64 0, i32 1
  %7 = load ptr, ptr %6, align 8, !tbaa !26
  %8 = icmp eq ptr %7, %5
  br i1 %8, label %17, label %9

9:                                                ; preds = %1, %9
  %10 = phi ptr [ %15, %9 ], [ %7, %1 ]
  %11 = phi i32 [ %13, %9 ], [ 0, %1 ]
  %12 = load i32, ptr %10, align 8, !tbaa !27
  %13 = add nsw i32 %12, %11
  %14 = getelementptr inbounds %struct.ListNode, ptr %10, i64 0, i32 1
  %15 = load ptr, ptr %14, align 8, !tbaa !26
  %16 = icmp eq ptr %15, %5
  br i1 %16, label %17, label %9, !llvm.loop !28

17:                                               ; preds = %9, %1
  %18 = phi i32 [ 0, %1 ], [ %13, %9 ]
  ret i32 %18
}

; Function Attrs: nofree nosync nounwind ssp uwtable(sync)
define i32 @test_list_local() local_unnamed_addr #6 {
  %1 = alloca %struct.List, align 8
  %2 = alloca [3 x %struct.ListNode], align 8
  call void @llvm.lifetime.start.p0(i64 72, ptr nonnull %1) #8
  call void @llvm.lifetime.start.p0(i64 72, ptr nonnull %2) #8
  call void @list_init(ptr noundef nonnull %1)
  br label %5

3:                                                ; preds = %5
  %4 = call i32 @list_sum(ptr noundef nonnull %1)
  call void @llvm.lifetime.end.p0(i64 72, ptr nonnull %2) #8
  call void @llvm.lifetime.end.p0(i64 72, ptr nonnull %1) #8
  ret i32 %4

5:                                                ; preds = %0, %5
  %6 = phi i64 [ 0, %0 ], [ %7, %5 ]
  %7 = add nuw nsw i64 %6, 1
  %8 = getelementptr inbounds [3 x %struct.ListNode], ptr %2, i64 0, i64 %6
  %9 = trunc i64 %7 to i32
  store i32 %9, ptr %8, align 8, !tbaa !27
  call void @list_push_back(ptr noundef nonnull %1, ptr noundef nonnull %8)
  %10 = icmp eq i64 %7, 3
  br i1 %10, label %3, label %5, !llvm.loop !29
}

; Function Attrs: nofree noinline norecurse nosync nounwind ssp uwtable(sync)
define void @init(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #7 {
  tail call void @list_init(ptr noundef nonnull @list)
  store i32 %0, ptr @nodes, align 8, !tbaa !27
  store i32 %1, ptr getelementptr inbounds ([3 x %struct.ListNode], ptr @nodes, i64 0, i64 1), align 8, !tbaa !27
  store i32 %2, ptr getelementptr inbounds ([3 x %struct.ListNode], ptr @nodes, i64 0, i64 2), align 8, !tbaa !27
  br label %5

4:                                                ; preds = %5
  ret void

5:                                                ; preds = %3, %5
  %6 = phi i64 [ 0, %3 ], [ %8, %5 ]
  %7 = getelementptr inbounds [3 x %struct.ListNode], ptr @nodes, i64 0, i64 %6
  tail call void @list_push_back(ptr noundef nonnull @list, ptr noundef nonnull %7)
  %8 = add nuw nsw i64 %6, 1
  %9 = icmp eq i64 %8, 3
  br i1 %9, label %4, label %5, !llvm.loop !30
}

; Function Attrs: nofree nosync nounwind ssp uwtable(sync)
define i32 @test_list_global(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #6 {
  %4 = alloca %struct.ListNode, align 8
  tail call void @init(i32 noundef %0, i32 noundef %1, i32 noundef %2)
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %4) #8
  call void @list_push_back(ptr noundef nonnull @list, ptr noundef nonnull %4)
  %5 = call ptr @list_pop_back(ptr noundef nonnull @list)
  %6 = call ptr @list_pop_back(ptr noundef nonnull @list)
  %7 = call i32 @list_sum(ptr noundef nonnull @list)
  %8 = load i32, ptr %6, align 8, !tbaa !27
  %9 = add nsw i32 %8, %7
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %4) #8
  ret i32 %9
}