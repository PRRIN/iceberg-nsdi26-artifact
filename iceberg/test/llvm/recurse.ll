target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"

%struct.TreeNode = type { ptr, i32, ptr }

@nodes = common global [4 x %struct.TreeNode] zeroinitializer, align 8

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @gcd(i32 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4, !tbaa !6
  store i32 %1, ptr %5, align 4, !tbaa !6
  %6 = load i32, ptr %4, align 4, !tbaa !6
  %7 = load i32, ptr %5, align 4, !tbaa !6
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %13

9:                                                ; preds = %2
  %10 = load i32, ptr %5, align 4, !tbaa !6
  %11 = load i32, ptr %4, align 4, !tbaa !6
  %12 = call i32 @gcd(i32 noundef %10, i32 noundef %11)
  store i32 %12, ptr %3, align 4
  br label %26

13:                                               ; preds = %2
  %14 = load i32, ptr %5, align 4, !tbaa !6
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %18

16:                                               ; preds = %13
  %17 = load i32, ptr %4, align 4, !tbaa !6
  br label %24

18:                                               ; preds = %13
  %19 = load i32, ptr %4, align 4, !tbaa !6
  %20 = load i32, ptr %5, align 4, !tbaa !6
  %21 = sub nsw i32 %19, %20
  %22 = load i32, ptr %5, align 4, !tbaa !6
  %23 = call i32 @gcd(i32 noundef %21, i32 noundef %22)
  br label %24

24:                                               ; preds = %18, %16
  %25 = phi i32 [ %17, %16 ], [ %23, %18 ]
  store i32 %25, ptr %3, align 4
  br label %26

26:                                               ; preds = %24, %9
  %27 = load i32, ptr %3, align 4
  ret i32 %27
}

; Function Attrs: argmemonly nofree noinline nosync nounwind readonly ssp uwtable(sync)
define i32 @rsum(ptr nocapture noundef readonly %0, i32 noundef %1) local_unnamed_addr #1 {
  br label %3

3:                                                ; preds = %10, %2
  %4 = phi i32 [ 0, %2 ], [ %15, %10 ]
  %5 = phi i32 [ %1, %2 ], [ %14, %10 ]
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %10

7:                                                ; preds = %3
  %8 = load i32, ptr %0, align 4, !tbaa !6
  %9 = add nsw i32 %4, %8
  ret i32 %9

10:                                               ; preds = %3
  %11 = sext i32 %5 to i64
  %12 = getelementptr inbounds i32, ptr %0, i64 %11
  %13 = load i32, ptr %12, align 4, !tbaa !6
  %14 = add nsw i32 %5, -1
  %15 = add nsw i32 %4, %13
  br label %3
}

; Function Attrs: nofree noinline nosync nounwind readnone ssp uwtable(sync)
define i32 @sum() local_unnamed_addr #2 {
  %1 = alloca [64 x i32], align 4
  call void @llvm.lifetime.start.p0(i64 256, ptr nonnull %1) #8
  br label %4

2:                                                ; preds = %4
  %3 = call i32 @rsum(ptr noundef nonnull %1, i32 noundef 63)
  call void @llvm.lifetime.end.p0(i64 256, ptr nonnull %1) #8
  ret i32 %3

4:                                                ; preds = %0, %4
  %5 = phi i64 [ 0, %0 ], [ %9, %4 ]
  %6 = getelementptr inbounds [64 x i32], ptr %1, i64 0, i64 %5
  %7 = trunc i64 %5 to i32
  %8 = add i32 %7, -31
  store i32 %8, ptr %6, align 4, !tbaa !6
  %9 = add nuw nsw i64 %5, 1
  %10 = icmp eq i64 %9, 64
  br i1 %10, label %2, label %4, !llvm.loop !10
}

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #3

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #3

; Function Attrs: argmemonly mustprogress nofree noinline norecurse nosync nounwind ssp willreturn writeonly uwtable(sync)
define void @node_init(i32 noundef %0, ptr nocapture noundef writeonly %1) local_unnamed_addr #4 {
  %3 = getelementptr inbounds %struct.TreeNode, ptr %1, i64 0, i32 1
  store i32 %0, ptr %3, align 8, !tbaa !13
  store ptr null, ptr %1, align 8, !tbaa !16
  %4 = getelementptr inbounds %struct.TreeNode, ptr %1, i64 0, i32 2
  store ptr null, ptr %4, align 8, !tbaa !17
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind ssp willreturn writeonly uwtable(sync)
define void @init() local_unnamed_addr #5 {
  tail call void @node_init(i32 noundef 0, ptr noundef nonnull @nodes)
  tail call void @node_init(i32 noundef 1, ptr noundef nonnull getelementptr inbounds ([4 x %struct.TreeNode], ptr @nodes, i64 0, i64 1))
  tail call void @node_init(i32 noundef 2, ptr noundef nonnull getelementptr inbounds ([4 x %struct.TreeNode], ptr @nodes, i64 0, i64 2))
  tail call void @node_init(i32 noundef 3, ptr noundef nonnull getelementptr inbounds ([4 x %struct.TreeNode], ptr @nodes, i64 0, i64 3))
  ret void
}

; Function Attrs: nofree noinline nosync nounwind ssp uwtable(sync)
define void @add(ptr nocapture noundef %0, ptr noundef %1) local_unnamed_addr #6 {
  br label %3

3:                                                ; preds = %8, %16, %2
  %4 = phi ptr [ %0, %2 ], [ %17, %16 ], [ %5, %8 ]
  %5 = load ptr, ptr %4, align 8, !tbaa !18
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %3
  store ptr %1, ptr %4, align 8, !tbaa !18
  br label %18

8:                                                ; preds = %3
  %9 = getelementptr inbounds %struct.TreeNode, ptr %1, i64 0, i32 1
  %10 = load i32, ptr %9, align 8, !tbaa !13
  %11 = getelementptr inbounds %struct.TreeNode, ptr %5, i64 0, i32 1
  %12 = load i32, ptr %11, align 8, !tbaa !13
  %13 = icmp slt i32 %10, %12
  br i1 %13, label %3, label %14

14:                                               ; preds = %8
  %15 = icmp sgt i32 %10, %12
  br i1 %15, label %16, label %18

16:                                               ; preds = %14
  %17 = getelementptr inbounds %struct.TreeNode, ptr %5, i64 0, i32 2
  br label %3

18:                                               ; preds = %14, %7
  ret void
}

; Function Attrs: argmemonly nofree noinline nosync nounwind readonly ssp uwtable(sync)
define i32 @wsum(ptr noundef readonly %0, i32 noundef %1) local_unnamed_addr #1 {
  br label %3

3:                                                ; preds = %8, %2
  %4 = phi i32 [ 0, %2 ], [ %18, %8 ]
  %5 = phi ptr [ %0, %2 ], [ %17, %8 ]
  %6 = phi i32 [ %1, %2 ], [ %13, %8 ]
  %7 = icmp eq ptr %5, null
  br i1 %7, label %19, label %8

8:                                                ; preds = %3
  %9 = getelementptr inbounds %struct.TreeNode, ptr %5, i64 0, i32 1
  %10 = load i32, ptr %9, align 8, !tbaa !13
  %11 = mul nsw i32 %10, %6
  %12 = load ptr, ptr %5, align 8, !tbaa !16
  %13 = add nsw i32 %6, 1
  %14 = tail call i32 @wsum(ptr noundef %12, i32 noundef %13)
  %15 = add nsw i32 %14, %11
  %16 = getelementptr inbounds %struct.TreeNode, ptr %5, i64 0, i32 2
  %17 = load ptr, ptr %16, align 8, !tbaa !17
  %18 = add nsw i32 %15, %4
  br label %3

19:                                               ; preds = %3
  %20 = add nsw i32 0, %4
  ret i32 %20
}

; Function Attrs: nofree nosync nounwind ssp uwtable(sync)
define i32 @test_tree() local_unnamed_addr #7 {
  %1 = alloca ptr, align 8
  tail call void @init()
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %1) #8
  store ptr null, ptr %1, align 8, !tbaa !18
  call void @add(ptr noundef nonnull %1, ptr noundef nonnull getelementptr inbounds ([4 x %struct.TreeNode], ptr @nodes, i64 0, i64 1))
  call void @add(ptr noundef nonnull %1, ptr noundef nonnull @nodes)
  call void @add(ptr noundef nonnull %1, ptr noundef nonnull getelementptr inbounds ([4 x %struct.TreeNode], ptr @nodes, i64 0, i64 3))
  call void @add(ptr noundef nonnull %1, ptr noundef nonnull getelementptr inbounds ([4 x %struct.TreeNode], ptr @nodes, i64 0, i64 2))
  %2 = load ptr, ptr %1, align 8, !tbaa !18
  %3 = tail call i32 @wsum(ptr noundef %2, i32 noundef 0)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %1) #8
  ret i32 %3
}