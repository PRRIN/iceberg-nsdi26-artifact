target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone ssp willreturn uwtable(sync)
define i32 @test_switch(i32 noundef %0) local_unnamed_addr #0 {
  switch i32 %0, label %14 [
    i32 100, label %18
    i32 101, label %2
    i32 102, label %18
    i32 103, label %3
    i32 104, label %4
    i32 105, label %5
    i32 106, label %6
    i32 107, label %18
    i32 108, label %18
    i32 109, label %7
    i32 110, label %8
    i32 111, label %9
    i32 112, label %10
    i32 113, label %11
    i32 114, label %18
    i32 115, label %18
    i32 116, label %18
    i32 117, label %18
    i32 118, label %12
    i32 119, label %13
  ]

2:                                                ; preds = %1
  br label %18

3:                                                ; preds = %1
  br label %18

4:                                                ; preds = %1
  br label %18

5:                                                ; preds = %1
  br label %18

6:                                                ; preds = %1
  br label %18

7:                                                ; preds = %1
  br label %18

8:                                                ; preds = %1
  br label %18

9:                                                ; preds = %1
  br label %18

10:                                               ; preds = %1
  br label %18

11:                                               ; preds = %1
  br label %18

12:                                               ; preds = %1
  br label %18

13:                                               ; preds = %1
  br label %18

14:                                               ; preds = %1
  %15 = and i32 %0, -128
  %16 = icmp eq i32 %15, 128
  %17 = select i1 %16, i32 %0, i32 -1
  br label %18

18:                                               ; preds = %14, %1, %1, %1, %1, %1, %1, %1, %1, %13, %12, %11, %10, %9, %8, %7, %6, %5, %4, %3, %2
  %19 = phi i32 [ 110, %13 ], [ 19, %12 ], [ 14, %11 ], [ 13, %10 ], [ 12, %9 ], [ 11, %8 ], [ 10, %7 ], [ 7, %6 ], [ 6, %5 ], [ 5, %4 ], [ 4, %3 ], [ 2, %2 ], [ 1, %1 ], [ 1, %1 ], [ 1, %1 ], [ 1, %1 ], [ 1, %1 ], [ 1, %1 ], [ 1, %1 ], [ 1, %1 ], [ %17, %14 ]
  ret i32 %19
}
