target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"

@glb = common local_unnamed_addr global i32 0, align 4

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind readnone ssp willreturn uwtable(sync)
define signext i8 @f(i32 noundef %0) local_unnamed_addr #0 {
  %2 = icmp eq i32 %0, 92
  %3 = zext i1 %2 to i8
  ret i8 %3
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind ssp willreturn writeonly uwtable(sync)
define void @g() local_unnamed_addr #1 {
  store i32 1, ptr @glb, align 4, !tbaa !6
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind ssp willreturn writeonly uwtable(sync)
define void @test(i32 noundef %0) local_unnamed_addr #2 {
  %2 = tail call signext i8 @f(i32 noundef %0)
  %3 = icmp eq i8 %2, 0
  br i1 %3, label %5, label %4

4:                                                ; preds = %1
  tail call void @g()
  br label %5

5:                                                ; preds = %4, %1
  ret void
}
