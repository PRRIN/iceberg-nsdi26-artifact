target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"

%"class.std::ios_base::Init" = type { i8 }
%class.Foo = type { i32 }

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external hidden global i8
@_ZTIi = external constant ptr
@_ZTVN10__cxxabiv117__class_type_infoE = external global ptr
@_ZTS3Foo = linkonce_odr dso_local constant [5 x i8] c"3Foo\00", comdat, align 1
@_ZTI3Foo = linkonce_odr dso_local constant { ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv117__class_type_infoE, i64 2), ptr @_ZTS3Foo }, comdat, align 8
@_ZTIc = external constant ptr

declare void @_ZNSt8ios_base4InitC1Ev(ptr noundef nonnull align 1 dereferenceable(1)) unnamed_addr #1

; Function Attrs: nounwind
declare void @_ZNSt8ios_base4InitD1Ev(ptr noundef nonnull align 1 dereferenceable(1)) unnamed_addr #2

; Function Attrs: nounwind
declare i32 @__cxa_atexit(ptr, ptr, ptr) #3

; Function Attrs: mustprogress noinline optnone uwtable
define dso_local noundef i32 @_Z9throw_inti(i32 noundef %0) #4 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = icmp sgt i32 %3, 20
  br i1 %4, label %5, label %8

5:                                                ; preds = %1
  %6 = call ptr @__cxa_allocate_exception(i64 4) #3
  %7 = load i32, ptr %2, align 4
  store i32 %7, ptr %6, align 16
  call void @__cxa_throw(ptr %6, ptr @_ZTIi, ptr null) #9
  unreachable

8:                                                ; preds = %1
  %9 = load i32, ptr %2, align 4
  ret i32 %9
}

declare ptr @__cxa_allocate_exception(i64)

declare void @__cxa_throw(ptr, ptr, ptr)

; Function Attrs: mustprogress noinline optnone uwtable
define dso_local noundef i32 @_Z3bari(i32 noundef %0) #4 personality ptr @__gxx_personality_v0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca %class.Foo, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i8, align 1
  store i32 %0, ptr %3, align 4
  %9 = load i32, ptr %3, align 4
  %10 = icmp sgt i32 %9, 10
  br i1 %10, label %11, label %14

11:                                               ; preds = %1
  %12 = load i32, ptr %3, align 4
  %13 = call noundef i32 @_Z9throw_inti(i32 noundef %12)
  store i32 %13, ptr %2, align 4
  br label %71

14:                                               ; preds = %1
  %15 = load i32, ptr %3, align 4
  invoke void @_ZN3FooC2Ei(ptr noundef nonnull align 4 dereferenceable(4) %4, i32 noundef %15)
          to label %16 unwind label %19

16:                                               ; preds = %14
  %17 = call ptr @__cxa_allocate_exception(i64 4) #3
  invoke void @_ZN3FooC2ERS_(ptr noundef nonnull align 4 dereferenceable(4) %17, ptr noundef nonnull align 4 dereferenceable(4) %4)
          to label %18 unwind label %23

18:                                               ; preds = %16
  invoke void @__cxa_throw(ptr %17, ptr @_ZTI3Foo, ptr @_ZN3FooD2Ev) #9
          to label %81 unwind label %27

19:                                               ; preds = %14
  %20 = landingpad { ptr, i32 }
          catch ptr @_ZTI3Foo
  %21 = extractvalue { ptr, i32 } %20, 0
  store ptr %21, ptr %5, align 8
  %22 = extractvalue { ptr, i32 } %20, 1
  store i32 %22, ptr %6, align 4
  br label %32

23:                                               ; preds = %16
  %24 = landingpad { ptr, i32 }
          cleanup
          catch ptr @_ZTI3Foo
  %25 = extractvalue { ptr, i32 } %24, 0
  store ptr %25, ptr %5, align 8
  %26 = extractvalue { ptr, i32 } %24, 1
  store i32 %26, ptr %6, align 4
  call void @__cxa_free_exception(ptr %17) #3
  br label %31

27:                                               ; preds = %18
  %28 = landingpad { ptr, i32 }
          cleanup
          catch ptr @_ZTI3Foo
  %29 = extractvalue { ptr, i32 } %28, 0
  store ptr %29, ptr %5, align 8
  %30 = extractvalue { ptr, i32 } %28, 1
  store i32 %30, ptr %6, align 4
  br label %31

31:                                               ; preds = %27, %23
  call void @_ZN3FooD2Ev(ptr noundef nonnull align 4 dereferenceable(4) %4) #3
  br label %32

32:                                               ; preds = %31, %19
  %33 = load i32, ptr %6, align 4
  %34 = call i32 @llvm.eh.typeid.for(ptr @_ZTI3Foo) #3
  %35 = icmp eq i32 %33, %34
  br i1 %35, label %36, label %73

36:                                               ; preds = %32
  %37 = load ptr, ptr %5, align 8
  %38 = call ptr @__cxa_begin_catch(ptr %37) #3
  store ptr %38, ptr %7, align 8
  store i8 99, ptr %8, align 1
  %39 = load ptr, ptr %7, align 8
  %40 = getelementptr inbounds %class.Foo, ptr %39, i32 0, i32 0
  %41 = load i32, ptr %40, align 4
  %42 = icmp eq i32 %41, 5
  br i1 %42, label %43, label %50

43:                                               ; preds = %36
  %44 = call ptr @__cxa_allocate_exception(i64 1) #3
  %45 = load i8, ptr %8, align 1
  store i8 %45, ptr %44, align 16
  invoke void @__cxa_throw(ptr %44, ptr @_ZTIc, ptr null) #9
          to label %81 unwind label %46

46:                                               ; preds = %67, %62, %43
  %47 = landingpad { ptr, i32 }
          cleanup
  %48 = extractvalue { ptr, i32 } %47, 0
  store ptr %48, ptr %5, align 8
  %49 = extractvalue { ptr, i32 } %47, 1
  store i32 %49, ptr %6, align 4
  br label %68

50:                                               ; preds = %36
  %51 = load ptr, ptr %7, align 8
  %52 = getelementptr inbounds %class.Foo, ptr %51, i32 0, i32 0
  %53 = load i32, ptr %52, align 4
  %54 = icmp slt i32 %53, 5
  br i1 %54, label %55, label %67

55:                                               ; preds = %50
  %56 = load ptr, ptr %7, align 8
  %57 = getelementptr inbounds %class.Foo, ptr %56, i32 0, i32 0
  %58 = load i32, ptr %57, align 4
  %59 = sub nsw i32 %58, 5
  store i32 %59, ptr %57, align 4
  %60 = call ptr @__cxa_allocate_exception(i64 4) #3
  %61 = load ptr, ptr %7, align 8
  invoke void @_ZN3FooC2ERS_(ptr noundef nonnull align 4 dereferenceable(4) %60, ptr noundef nonnull align 4 dereferenceable(4) %61)
          to label %62 unwind label %63

62:                                               ; preds = %55
  invoke void @__cxa_throw(ptr %60, ptr @_ZTI3Foo, ptr @_ZN3FooD2Ev) #9
          to label %81 unwind label %46

63:                                               ; preds = %55
  %64 = landingpad { ptr, i32 }
          cleanup
  %65 = extractvalue { ptr, i32 } %64, 0
  store ptr %65, ptr %5, align 8
  %66 = extractvalue { ptr, i32 } %64, 1
  store i32 %66, ptr %6, align 4
  call void @__cxa_free_exception(ptr %60) #3
  br label %68

67:                                               ; preds = %50
  invoke void @__cxa_rethrow() #9
          to label %81 unwind label %46

68:                                               ; preds = %63, %46
  invoke void @__cxa_end_catch()
          to label %69 unwind label %78

69:                                               ; preds = %68
  br label %73

70:                                               ; No predecessors!
  store i32 0, ptr %2, align 4
  br label %71

71:                                               ; preds = %70, %11
  %72 = load i32, ptr %2, align 4
  ret i32 %72

73:                                               ; preds = %69, %32
  %74 = load ptr, ptr %5, align 8
  %75 = load i32, ptr %6, align 4
  %76 = insertvalue { ptr, i32 } undef, ptr %74, 0
  %77 = insertvalue { ptr, i32 } %76, i32 %75, 1
  resume { ptr, i32 } %77

78:                                               ; preds = %68
  %79 = landingpad { ptr, i32 }
          catch ptr null
  %80 = extractvalue { ptr, i32 } %79, 0
  call void @__clang_call_terminate(ptr %80) #10
  unreachable

81:                                               ; preds = %67, %62, %43, %18
  unreachable
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN3FooC2Ei(ptr noundef nonnull align 4 dereferenceable(4) %0, i32 noundef %1) unnamed_addr #5 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = load i32, ptr %4, align 4
  %7 = getelementptr inbounds %class.Foo, ptr %5, i32 0, i32 0
  store i32 %6, ptr %7, align 4
  ret void
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN3FooC2ERS_(ptr noundef nonnull align 4 dereferenceable(4) %0, ptr noundef nonnull align 4 dereferenceable(4) %1) unnamed_addr #5 align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = getelementptr inbounds %class.Foo, ptr %6, i32 0, i32 0
  %8 = load i32, ptr %7, align 4
  %9 = getelementptr inbounds %class.Foo, ptr %5, i32 0, i32 0
  store i32 %8, ptr %9, align 4
  ret void
}

declare void @__cxa_free_exception(ptr)

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN3FooD2Ev(ptr noundef nonnull align 4 dereferenceable(4) %0) unnamed_addr #5 align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret void
}

; Function Attrs: nounwind readnone
declare i32 @llvm.eh.typeid.for(ptr) #6

declare ptr @__cxa_begin_catch(ptr)

declare void @__cxa_rethrow()

declare void @__cxa_end_catch()

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(ptr %0) #7 {
  %2 = call ptr @__cxa_begin_catch(ptr %0) #3
  call void @_ZSt9terminatev() #10
  unreachable
}

declare void @_ZSt9terminatev()

; Function Attrs: mustprogress noinline optnone uwtable
define dso_local noundef i32 @_Z4testi(i32 noundef %0) #4 personality ptr @__gxx_personality_v0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %8 = load i32, ptr %2, align 4
  %9 = invoke noundef i32 @_Z3bari(i32 noundef %8)
          to label %10 unwind label %12

10:                                               ; preds = %1
  %11 = mul nsw i32 2, %9
  store i32 %11, ptr %3, align 4
  br label %26

12:                                               ; preds = %1
  %13 = landingpad { ptr, i32 }
          catch ptr @_ZTIi
          catch ptr @_ZTI3Foo
          catch ptr null
  %14 = extractvalue { ptr, i32 } %13, 0
  store ptr %14, ptr %4, align 8
  %15 = extractvalue { ptr, i32 } %13, 1
  store i32 %15, ptr %5, align 4
  br label %16

16:                                               ; preds = %12
  %17 = load i32, ptr %5, align 4
  %18 = call i32 @llvm.eh.typeid.for(ptr @_ZTIi) #3
  %19 = icmp eq i32 %17, %18
  br i1 %19, label %20, label %28

20:                                               ; preds = %16
  %21 = load ptr, ptr %4, align 8
  %22 = call ptr @__cxa_begin_catch(ptr %21) #3
  %23 = load i32, ptr %22, align 4
  store i32 %23, ptr %7, align 4
  %24 = load i32, ptr %7, align 4
  %25 = mul nsw i32 %24, 4
  store i32 %25, ptr %3, align 4
  call void @__cxa_end_catch() #3
  br label %26

26:                                               ; preds = %20, %31, %37, %10
  %27 = load i32, ptr %3, align 4
  ret i32 %27

28:                                               ; preds = %16
  %29 = call i32 @llvm.eh.typeid.for(ptr @_ZTI3Foo) #3
  %30 = icmp eq i32 %17, %29
  br i1 %30, label %31, label %37

31:                                               ; preds = %28
  %32 = load ptr, ptr %4, align 8
  %33 = call ptr @__cxa_begin_catch(ptr %32) #3
  store ptr %33, ptr %6, align 8
  %34 = load ptr, ptr %6, align 8
  %35 = getelementptr inbounds %class.Foo, ptr %34, i32 0, i32 0
  %36 = load i32, ptr %35, align 4
  store i32 %36, ptr %3, align 4
  call void @__cxa_end_catch()
  br label %26

37:                                               ; preds = %28
  %38 = load ptr, ptr %4, align 8
  %39 = call ptr @__cxa_begin_catch(ptr %38) #3
  store i32 0, ptr %3, align 4
  call void @__cxa_end_catch()
  br label %26
}

; Function Attrs: mustprogress noinline norecurse optnone uwtable
define dso_local noundef i32 @main() #8 personality ptr @__gxx_personality_v0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8, align 1
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 15213, ptr %2, align 4
  store i8 99, ptr %3, align 1
  %10 = call ptr @__cxa_allocate_exception(i64 4) #3
  %11 = invoke noundef i32 @_Z3bari(i32 noundef -2)
          to label %12 unwind label %13

12:                                               ; preds = %0
  store i32 %11, ptr %10, align 16
  invoke void @__cxa_throw(ptr %10, ptr @_ZTIi, ptr null) #9
          to label %84 unwind label %17

13:                                               ; preds = %0
  %14 = landingpad { ptr, i32 }
          cleanup
          catch ptr @_ZTI3Foo
          catch ptr @_ZTIi
  %15 = extractvalue { ptr, i32 } %14, 0
  store ptr %15, ptr %4, align 8
  %16 = extractvalue { ptr, i32 } %14, 1
  store i32 %16, ptr %5, align 4
  call void @__cxa_free_exception(ptr %10) #3
  br label %21

17:                                               ; preds = %12
  %18 = landingpad { ptr, i32 }
          catch ptr @_ZTI3Foo
          catch ptr @_ZTIi
  %19 = extractvalue { ptr, i32 } %18, 0
  store ptr %19, ptr %4, align 8
  %20 = extractvalue { ptr, i32 } %18, 1
  store i32 %20, ptr %5, align 4
  br label %21

21:                                               ; preds = %17, %13
  %22 = load i32, ptr %5, align 4
  %23 = call i32 @llvm.eh.typeid.for(ptr @_ZTI3Foo) #3
  %24 = icmp eq i32 %22, %23
  br i1 %24, label %25, label %33

25:                                               ; preds = %21
  %26 = load ptr, ptr %4, align 8
  %27 = call ptr @__cxa_begin_catch(ptr %26) #3
  store ptr %27, ptr %6, align 8
  invoke void @__cxa_rethrow() #9
          to label %84 unwind label %28

28:                                               ; preds = %25
  %29 = landingpad { ptr, i32 }
          cleanup
          catch ptr @_ZTIi
          catch ptr @_ZTI3Foo
  %30 = extractvalue { ptr, i32 } %29, 0
  store ptr %30, ptr %4, align 8
  %31 = extractvalue { ptr, i32 } %29, 1
  store i32 %31, ptr %5, align 4
  invoke void @__cxa_end_catch()
          to label %32 unwind label %81

32:                                               ; preds = %28
  br label %33

33:                                               ; preds = %32, %21
  %34 = load i32, ptr %5, align 4
  %35 = call i32 @llvm.eh.typeid.for(ptr @_ZTIi) #3
  %36 = icmp eq i32 %34, %35
  br i1 %36, label %37, label %43

37:                                               ; preds = %33
  %38 = load ptr, ptr %4, align 8
  %39 = call ptr @__cxa_begin_catch(ptr %38) #3
  %40 = load i32, ptr %39, align 4
  store i32 %40, ptr %9, align 4
  call void @__cxa_end_catch() #3
  br label %41

41:                                               ; preds = %37, %69, %52
  %42 = load i32, ptr %1, align 4
  ret i32 %42

43:                                               ; preds = %33
  %44 = call i32 @llvm.eh.typeid.for(ptr @_ZTI3Foo) #3
  %45 = icmp eq i32 %34, %44
  br i1 %45, label %46, label %76

46:                                               ; preds = %43
  %47 = load ptr, ptr %4, align 8
  %48 = call ptr @__cxa_begin_catch(ptr %47) #3
  store ptr %48, ptr %7, align 8
  %49 = call ptr @__cxa_allocate_exception(i64 4) #3
  %50 = load ptr, ptr %7, align 8
  invoke void @_ZN3FooC2ERS_(ptr noundef nonnull align 4 dereferenceable(4) %49, ptr noundef nonnull align 4 dereferenceable(4) %50)
          to label %51 unwind label %53

51:                                               ; preds = %46
  invoke void @__cxa_throw(ptr %49, ptr @_ZTI3Foo, ptr @_ZN3FooD2Ev) #9
          to label %84 unwind label %57

52:                                               ; No predecessors!
  br label %41

53:                                               ; preds = %46
  %54 = landingpad { ptr, i32 }
          cleanup
          catch ptr @_ZTI3Foo
  %55 = extractvalue { ptr, i32 } %54, 0
  store ptr %55, ptr %4, align 8
  %56 = extractvalue { ptr, i32 } %54, 1
  store i32 %56, ptr %5, align 4
  call void @__cxa_free_exception(ptr %49) #3
  br label %61

57:                                               ; preds = %51
  %58 = landingpad { ptr, i32 }
          cleanup
          catch ptr @_ZTI3Foo
  %59 = extractvalue { ptr, i32 } %58, 0
  store ptr %59, ptr %4, align 8
  %60 = extractvalue { ptr, i32 } %58, 1
  store i32 %60, ptr %5, align 4
  br label %61

61:                                               ; preds = %57, %53
  %62 = load i32, ptr %5, align 4
  %63 = call i32 @llvm.eh.typeid.for(ptr @_ZTI3Foo) #3
  %64 = icmp eq i32 %62, %63
  br i1 %64, label %65, label %74

65:                                               ; preds = %61
  %66 = load ptr, ptr %4, align 8
  %67 = call ptr @__cxa_begin_catch(ptr %66) #3
  store ptr %67, ptr %8, align 8
  invoke void @__cxa_end_catch()
          to label %68 unwind label %70

68:                                               ; preds = %65
  br label %69

69:                                               ; preds = %68
  call void @__cxa_end_catch()
  br label %41

70:                                               ; preds = %65
  %71 = landingpad { ptr, i32 }
          cleanup
  %72 = extractvalue { ptr, i32 } %71, 0
  store ptr %72, ptr %4, align 8
  %73 = extractvalue { ptr, i32 } %71, 1
  store i32 %73, ptr %5, align 4
  br label %74

74:                                               ; preds = %70, %61
  invoke void @__cxa_end_catch()
          to label %75 unwind label %81

75:                                               ; preds = %74
  br label %76

76:                                               ; preds = %75, %43
  %77 = load ptr, ptr %4, align 8
  %78 = load i32, ptr %5, align 4
  %79 = insertvalue { ptr, i32 } undef, ptr %77, 0
  %80 = insertvalue { ptr, i32 } %79, i32 %78, 1
  resume { ptr, i32 } %80

81:                                               ; preds = %74, %28
  %82 = landingpad { ptr, i32 }
          catch ptr null
  %83 = extractvalue { ptr, i32 } %82, 0
  call void @__clang_call_terminate(ptr %83) #10
  unreachable

84:                                               ; preds = %51, %25, %12
  unreachable
}
