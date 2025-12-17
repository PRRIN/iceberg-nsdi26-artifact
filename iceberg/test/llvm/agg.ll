; ModuleID = 'agg.c'
source_filename = "agg.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx14.0.0"

%struct.Data = type { [3 x i16] }
%struct.Agg = type { %struct.Data, i32 }

@__const.test.d = private unnamed_addr constant %struct.Data { [3 x i16] [i16 1, i16 2, i16 0] }, align 2

; Function Attrs: mustprogress nofree noinline nosync nounwind readnone ssp willreturn uwtable(sync)
define [2 x i64] @make(i64 %0) local_unnamed_addr #0 {
  %2 = alloca %struct.Agg, align 8
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(6) %2, i8 0, i64 6, i1 false)
  %3 = getelementptr inbounds %struct.Agg, ptr %2, i64 0, i32 1
  %4 = ptrtoint ptr %2 to i64
  %5 = trunc i64 %4 to i32
  store i32 %5, ptr %3, align 8, !tbaa !6
  %6 = load i64, ptr %2, align 8
  %7 = getelementptr inbounds i8, ptr %2, i64 8
  %8 = load i32, ptr %7, align 8
  %9 = zext i32 %8 to i64
  %10 = insertvalue [2 x i64] poison, i64 %6, 0
  %11 = insertvalue [2 x i64] %10, i64 %9, 1
  ret [2 x i64] %11
}

; Function Attrs: argmemonly mustprogress nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: argmemonly mustprogress nocallback nofree nounwind willreturn writeonly
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind readnone ssp willreturn uwtable(sync)
define i32 @take([2 x i64] %0) local_unnamed_addr #3 {
  %2 = extractvalue [2 x i64] %0, 0
  %3 = lshr i64 %2, 16
  %4 = trunc i64 %3 to i32
  %5 = ashr i32 %4, 16
  ret i32 %5
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @test() local_unnamed_addr #4 {
  %1 = alloca %struct.Data, align 2
  %2 = alloca %struct.Agg, align 4
  %3 = alloca i64, align 8
  %4 = alloca [2 x i64], align 8
  %5 = alloca [2 x i64], align 8
  call void @llvm.lifetime.start.p0(i64 6, ptr %1) #6
  call void @llvm.memcpy.p0.p0.i64(ptr align 2 %1, ptr align 2 @__const.test.d, i64 6, i1 false)
  %6 = getelementptr inbounds %struct.Data, ptr %1, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %3, ptr align 2 %6, i64 6, i1 false)
  %7 = load i64, ptr %3, align 8
  %8 = call [2 x i64] @make(i64 poison)
  store [2 x i64] %8, ptr %4, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %2, ptr align 8 %4, i64 12, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %5, ptr align 4 %2, i64 12, i1 false)
  %9 = load [2 x i64], ptr %5, align 8
  %10 = call i32 @take([2 x i64] %9)
  call void @llvm.lifetime.end.p0(i64 6, ptr %1) #6
  ret i32 %10
}

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #5

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #5

attributes #0 = { mustprogress nofree noinline nosync nounwind readnone ssp willreturn uwtable(sync) "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { argmemonly mustprogress nocallback nofree nounwind willreturn }
attributes #2 = { argmemonly mustprogress nocallback nofree nounwind willreturn writeonly }
attributes #3 = { mustprogress nofree noinline norecurse nosync nounwind readnone ssp willreturn uwtable(sync) "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #4 = { noinline nounwind optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "probe-stack"="__chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #5 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 14, i32 0]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"Apple clang version 15.0.0 (clang-1500.0.40.1)"}
!6 = !{!7, !11, i64 8}
!7 = !{!"Agg", !8, i64 0, !11, i64 8}
!8 = !{!"Data", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
