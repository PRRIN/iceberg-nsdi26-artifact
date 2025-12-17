target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"

%StructType.0 = type { %_type.0, %IPST.46 }
%_type.0 = type { i64, i64, i32, i8, i8, i8, i8, ptr, ptr, ptr, ptr, ptr }
%IPST.46 = type { ptr, i64, i64 }
%functionDescriptor.0 = type { i64 }
%method.0 = type { ptr, ptr, ptr, ptr, ptr }
%uncommonType.0 = type { ptr, ptr, %IPST.44 }
%IPST.44 = type { ptr, i64, i64 }
%PtrType.0 = type { %_type.0, ptr }
%FuncType.0 = type { %_type.0, i8, %IPST.45, %IPST.45 }
%IPST.45 = type { ptr, i64, i64 }
%structField.0 = type { ptr, ptr, ptr, ptr, i64 }
%InterfaceType.0 = type { %_type.0, %IPST.47 }
%IPST.47 = type { ptr, i64, i64 }
%imethod.0 = type { ptr, ptr, ptr }
%SliceType.0 = type { %_type.0, ptr }
%MapType.0 = type { %_type.0, ptr, ptr, ptr, ptr, i8, i8, i16, i32 }
%ArrayType.0 = type { %_type.0, ptr, ptr, i64 }
%ChanType.0 = type { %_type.0, ptr, i64 }
%RR_Header.0 = type { { ptr, i64 }, i16, i16, i32, i16 }
%SOA.0 = type { %RR_Header.0, { ptr, i64 }, { ptr, i64 }, i32, i32, i32, i32, i32 }
%DNAME.0 = type { %RR_Header.0, { ptr, i64 } }
%CNAME.0 = type { %RR_Header.0, { ptr, i64 } }
%SRV.0 = type { %RR_Header.0, i16, i16, i16, { ptr, i64 } }
%MX.0 = type { %RR_Header.0, i16, { ptr, i64 } }
%NS.0 = type { %RR_Header.0, { ptr, i64 } }
%ScrubWriter.0 = type { %ResponseWriter.0, ptr }
%ResponseWriter.0 = type { ptr, ptr }
%error.0 = type { ptr, ptr }
%.go.llvm.supported.0 = type { ptr, %RWMutex.0 }
%RWMutex.0 = type { %Mutex.0, i32, i32, i32, i32 }
%Mutex.0 = type { i32, i32 }
%Zone.0 = type { { ptr, i64 }, i64, { ptr, i64 }, ptr, %Apex.0, i8, %RWMutex.0, %Once.0, %IPST.3, i64, ptr, ptr }
%Apex.0 = type { ptr, %IPST.0, %IPST.0, %IPST.0 }
%IPST.0 = type { ptr, i64, i64 }
%Once.0 = type { i32, %Mutex.0 }
%IPST.3 = type { ptr, i64, i64 }
%IPST.2 = type { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i64, i8, i8, i8, i8, i64, i64 }
%Elem.0 = type { ptr, { ptr, i64 } }
%RR.0 = type { ptr, ptr }
%Tree.0 = type { ptr, i64 }
%Node.0 = type { ptr, ptr, ptr, i8 }
%NonWriter.0 = type { %ResponseWriter.0, ptr }


@go_0llvm.SOA..d = constant %StructType.0 { %_type.0 { i64 88, i64 56, i32 1879092663, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.SOA..eq..f, ptr @gcbits..rc, ptr @go..C1, ptr @go..C5, ptr @go_0llvm.SOA..p }, %IPST.46 { ptr @go..C73, i64 8, i64 8 } }
@go_0llvm.SOA..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.SOA..eq to i64) }
@gcbits..rc = weak constant [1 x i8] c"Q", comdat
@const.0 = private constant [18 x i8] c"\09go.llvm\09llvm.SOA\00", align 1
@go..C1 = internal constant { ptr, i64 } { ptr @const.0, i64 17 }
@const.1 = private constant [4 x i8] c"SOA\00", align 1
@go..C2 = internal constant { ptr, i64 } { ptr @const.1, i64 3 }
@const.2 = private constant [8 x i8] c"go.llvm\00", align 1
@go..C3 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C4 = internal constant [1 x %method.0] zeroinitializer
@go..C5 = internal constant %uncommonType.0 { ptr @go..C2, ptr @go..C3, %IPST.44 { ptr @go..C4, i64 0, i64 0 } }
@go_0llvm.SOA..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 711545, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C6, ptr @go..C61, ptr @type.._2_2go_0llvm_0SOA }, ptr @go_0llvm.SOA..d }, comdat
@runtime.memequal64..f = external constant %functionDescriptor.0
@gcbits..ba = weak constant [1 x i8] c"\01", comdat
@const.3 = private constant [19 x i8] c"*\09go.llvm\09llvm.SOA\00", align 1
@go..C6 = internal constant { ptr, i64 } { ptr @const.3, i64 18 }
@const.4 = private constant [7 x i8] c"Header\00", align 1
@go..C7 = internal constant { ptr, i64 } { ptr @const.4, i64 6 }
@type..func_8_9_8_2go_0llvm_0RR__Header_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -608253368, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C8, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C9, i64 0, i64 0 }, %IPST.45 { ptr @go..C38, i64 1, i64 1 } }, comdat
@const.5 = private constant [32 x i8] c"func() *\09go.llvm\09llvm.RR_Header\00", align 1
@go..C8 = internal constant { ptr, i64 } { ptr @const.5, i64 31 }
@go..C9 = internal constant [1 x ptr] zeroinitializer
@go_0llvm.RR__Header..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1553007831, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C10, ptr null, ptr null }, ptr @go_0llvm.RR__Header..d }, comdat
@const.6 = private constant [25 x i8] c"*\09go.llvm\09llvm.RR_Header\00", align 1
@go..C10 = internal constant { ptr, i64 } { ptr @const.6, i64 24 }
@go_0llvm.RR__Header..d = constant %StructType.0 { %_type.0 { i64 32, i64 8, i32 1245114290, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.RR__Header..eq..f, ptr @gcbits..ba, ptr @go..C11, ptr @go..C15, ptr @go_0llvm.RR__Header..p }, %IPST.46 { ptr @go..C37, i64 5, i64 5 } }
@go_0llvm.RR__Header..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.RR__Header..eq to i64) }
@const.7 = private constant [24 x i8] c"\09go.llvm\09llvm.RR_Header\00", align 1
@go..C11 = internal constant { ptr, i64 } { ptr @const.7, i64 23 }
@const.8 = private constant [10 x i8] c"RR_Header\00", align 1
@go..C12 = internal constant { ptr, i64 } { ptr @const.8, i64 9 }
@go..C13 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C14 = internal constant [1 x %method.0] zeroinitializer
@go..C15 = internal constant %uncommonType.0 { ptr @go..C12, ptr @go..C13, %IPST.44 { ptr @go..C14, i64 0, i64 0 } }
@const.9 = private constant [5 x i8] c"Name\00", align 1
@go..C16 = internal constant { ptr, i64 } { ptr @const.9, i64 4 }
@string..d = weak constant %_type.0 { i64 16, i64 8, i32 -1998952806, i8 0, i8 8, i8 8, i8 24, ptr @runtime.strequal..f, ptr @gcbits..ba, ptr @go..C17, ptr @go..C20, ptr @string..p }, comdat
@runtime.strequal..f = external constant %functionDescriptor.0
@const.10 = private constant [7 x i8] c"string\00", align 1
@go..C17 = internal constant { ptr, i64 } { ptr @const.10, i64 6 }
@go..C18 = internal constant { ptr, i64 } { ptr @const.10, i64 6 }
@go..C19 = internal constant [1 x %method.0] zeroinitializer
@go..C20 = internal constant %uncommonType.0 { ptr @go..C18, ptr null, %IPST.44 { ptr @go..C19, i64 0, i64 0 } }
@string..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1918473815, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C21, ptr null, ptr null }, ptr @string..d }, comdat
@const.11 = private constant [8 x i8] c"*string\00", align 1
@go..C21 = internal constant { ptr, i64 } { ptr @const.11, i64 7 }
@const.12 = private constant [19 x i8] c"dns:\22cdomain-name\22\00", align 1
@go..C22 = internal constant { ptr, i64 } { ptr @const.12, i64 18 }
@const.13 = private constant [7 x i8] c"Rrtype\00", align 1
@go..C23 = internal constant { ptr, i64 } { ptr @const.13, i64 6 }
@uint16..d = weak constant %_type.0 { i64 2, i64 0, i32 76732288, i8 8, i8 2, i8 2, i8 -119, ptr @runtime.memequal16..f, ptr null, ptr @go..C24, ptr @go..C27, ptr @uint16..p }, comdat
@runtime.memequal16..f = external constant %functionDescriptor.0
@const.14 = private constant [7 x i8] c"uint16\00", align 1
@go..C24 = internal constant { ptr, i64 } { ptr @const.14, i64 6 }
@go..C25 = internal constant { ptr, i64 } { ptr @const.14, i64 6 }
@go..C26 = internal constant [1 x %method.0] zeroinitializer
@go..C27 = internal constant %uncommonType.0 { ptr @go..C25, ptr null, %IPST.44 { ptr @go..C26, i64 0, i64 0 } }
@uint16..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1227716617, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C28, ptr null, ptr null }, ptr @uint16..d }, comdat
@const.15 = private constant [8 x i8] c"*uint16\00", align 1
@go..C28 = internal constant { ptr, i64 } { ptr @const.15, i64 7 }
@const.16 = private constant [6 x i8] c"Class\00", align 1
@go..C29 = internal constant { ptr, i64 } { ptr @const.16, i64 5 }
@const.17 = private constant [4 x i8] c"Ttl\00", align 1
@go..C30 = internal constant { ptr, i64 } { ptr @const.17, i64 3 }
@uint32..d = weak constant %_type.0 { i64 4, i64 0, i32 278357906, i8 8, i8 4, i8 4, i8 -118, ptr @runtime.memequal32..f, ptr null, ptr @go..C31, ptr @go..C34, ptr @uint32..p }, comdat
@runtime.memequal32..f = external constant %functionDescriptor.0
@const.18 = private constant [7 x i8] c"uint32\00", align 1
@go..C31 = internal constant { ptr, i64 } { ptr @const.18, i64 6 }
@go..C32 = internal constant { ptr, i64 } { ptr @const.18, i64 6 }
@go..C33 = internal constant [1 x %method.0] zeroinitializer
@go..C34 = internal constant %uncommonType.0 { ptr @go..C32, ptr null, %IPST.44 { ptr @go..C33, i64 0, i64 0 } }
@uint32..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 158759209, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C35, ptr null, ptr null }, ptr @uint32..d }, comdat
@const.19 = private constant [8 x i8] c"*uint32\00", align 1
@go..C35 = internal constant { ptr, i64 } { ptr @const.19, i64 7 }
@const.20 = private constant [9 x i8] c"Rdlength\00", align 1
@go..C36 = internal constant { ptr, i64 } { ptr @const.20, i64 8 }
@go..C37 = internal constant [5 x %structField.0] [%structField.0 { ptr @go..C16, ptr null, ptr @string..d, ptr @go..C22, i64 0 }, %structField.0 { ptr @go..C23, ptr null, ptr @uint16..d, ptr null, i64 32 }, %structField.0 { ptr @go..C29, ptr null, ptr @uint16..d, ptr null, i64 36 }, %structField.0 { ptr @go..C30, ptr null, ptr @uint32..d, ptr null, i64 40 }, %structField.0 { ptr @go..C36, ptr null, ptr @uint16..d, ptr null, i64 48 }]
@go..C38 = internal constant [1 x ptr] [ptr @go_0llvm.RR__Header..p]
@type..func_8_2go_0llvm_0SOA_9_8_2go_0llvm_0RR__Header_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -585483928, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C39, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C40, i64 1, i64 1 }, %IPST.45 { ptr @go..C41, i64 1, i64 1 } }, comdat
@const.21 = private constant [50 x i8] c"func(*\09go.llvm\09llvm.SOA) *\09go.llvm\09llvm.RR_Header\00", align 1
@go..C39 = internal constant { ptr, i64 } { ptr @const.21, i64 49 }
@go..C40 = internal constant [1 x ptr] [ptr @go_0llvm.SOA..p]
@go..C41 = internal constant [1 x ptr] [ptr @go_0llvm.RR__Header..p]
@const.22 = private constant [5 x i8] c"copy\00", align 1
@go..C42 = internal constant { ptr, i64 } { ptr @const.22, i64 4 }
@go..C43 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8_9_8go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1372692616, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C44, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C45, i64 0, i64 0 }, %IPST.45 { ptr @go..C56, i64 1, i64 1 } }, comdat
@const.23 = private constant [24 x i8] c"func() \09go.llvm\09llvm.RR\00", align 1
@go..C44 = internal constant { ptr, i64 } { ptr @const.23, i64 23 }
@go..C45 = internal constant [1 x ptr] zeroinitializer
@go_0llvm.RR..d = constant %InterfaceType.0 { %_type.0 { i64 16, i64 16, i32 -2058926462, i8 0, i8 8, i8 8, i8 20, ptr @runtime.interequal..f, ptr @gcbits..da, ptr @go..C46, ptr @go..C50, ptr @go_0llvm.RR..p }, %IPST.47 { ptr @go..C55, i64 2, i64 2 } }
@runtime.interequal..f = external constant %functionDescriptor.0
@gcbits..da = weak constant [1 x i8] c"\03", comdat
@const.24 = private constant [17 x i8] c"\09go.llvm\09llvm.RR\00", align 1
@go..C46 = internal constant { ptr, i64 } { ptr @const.24, i64 16 }
@const.25 = private constant [3 x i8] c"RR\00", align 1
@go..C47 = internal constant { ptr, i64 } { ptr @const.25, i64 2 }
@go..C48 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C49 = internal constant [1 x %method.0] zeroinitializer
@go..C50 = internal constant %uncommonType.0 { ptr @go..C47, ptr @go..C48, %IPST.44 { ptr @go..C49, i64 0, i64 0 } }
@go_0llvm.RR..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1416914985, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C51, ptr null, ptr null }, ptr @go_0llvm.RR..d }, comdat
@const.26 = private constant [18 x i8] c"*\09go.llvm\09llvm.RR\00", align 1
@go..C51 = internal constant { ptr, i64 } { ptr @const.26, i64 17 }
@go..C52 = internal constant { ptr, i64 } { ptr @const.4, i64 6 }
@go..C53 = internal constant { ptr, i64 } { ptr @const.22, i64 4 }
@go..C54 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C55 = internal constant [2 x %imethod.0] [%imethod.0 { ptr @go..C52, ptr null, ptr @type..func_8_9_8_2go_0llvm_0RR__Header_9 }, %imethod.0 { ptr @go..C53, ptr @go..C54, ptr @type..func_8_9_8go_0llvm_0RR_9 }]
@go..C56 = internal constant [1 x ptr] [ptr @go_0llvm.RR..d]
@type..func_8_2go_0llvm_0SOA_9_8go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1395462056, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C57, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C58, i64 1, i64 1 }, %IPST.45 { ptr @go..C59, i64 1, i64 1 } }, comdat
@const.27 = private constant [42 x i8] c"func(*\09go.llvm\09llvm.SOA) \09go.llvm\09llvm.RR\00", align 1
@go..C57 = internal constant { ptr, i64 } { ptr @const.27, i64 41 }
@go..C58 = internal constant [1 x ptr] [ptr @go_0llvm.SOA..p]
@go..C59 = internal constant [1 x ptr] [ptr @go_0llvm.RR..d]
@go..C60 = internal constant [2 x %method.0] [%method.0 { ptr @go..C7, ptr null, ptr @type..func_8_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0SOA_9_8_2go_0llvm_0RR__Header_9, ptr @go_0llvm.SOA.Header }, %method.0 { ptr @go..C42, ptr @go..C43, ptr @type..func_8_9_8go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0SOA_9_8go_0llvm_0RR_9, ptr @go_0llvm.SOA.copy }]
@go..C61 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.44 { ptr @go..C60, i64 2, i64 2 } }
@type.._2_2go_0llvm_0SOA = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 11384729, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C62, ptr null, ptr null }, ptr @go_0llvm.SOA..p }, comdat
@const.28 = private constant [20 x i8] c"**\09go.llvm\09llvm.SOA\00", align 1
@go..C62 = internal constant { ptr, i64 } { ptr @const.28, i64 19 }
@const.29 = private constant [4 x i8] c"Hdr\00", align 1
@go..C63 = internal constant { ptr, i64 } { ptr @const.29, i64 3 }
@const.30 = private constant [3 x i8] c"Ns\00", align 1
@go..C64 = internal constant { ptr, i64 } { ptr @const.30, i64 2 }
@go..C65 = internal constant { ptr, i64 } { ptr @const.12, i64 18 }
@const.31 = private constant [5 x i8] c"Mbox\00", align 1
@go..C66 = internal constant { ptr, i64 } { ptr @const.31, i64 4 }
@go..C67 = internal constant { ptr, i64 } { ptr @const.12, i64 18 }
@const.32 = private constant [7 x i8] c"Serial\00", align 1
@go..C68 = internal constant { ptr, i64 } { ptr @const.32, i64 6 }
@const.33 = private constant [8 x i8] c"Refresh\00", align 1
@go..C69 = internal constant { ptr, i64 } { ptr @const.33, i64 7 }
@const.34 = private constant [6 x i8] c"Retry\00", align 1
@go..C70 = internal constant { ptr, i64 } { ptr @const.34, i64 5 }
@const.35 = private constant [7 x i8] c"Expire\00", align 1
@go..C71 = internal constant { ptr, i64 } { ptr @const.35, i64 6 }
@const.36 = private constant [7 x i8] c"Minttl\00", align 1
@go..C72 = internal constant { ptr, i64 } { ptr @const.36, i64 6 }
@go..C73 = internal constant [8 x %structField.0] [%structField.0 { ptr @go..C63, ptr null, ptr @go_0llvm.RR__Header..d, ptr null, i64 0 }, %structField.0 { ptr @go..C64, ptr null, ptr @string..d, ptr @go..C65, i64 64 }, %structField.0 { ptr @go..C66, ptr null, ptr @string..d, ptr @go..C67, i64 96 }, %structField.0 { ptr @go..C68, ptr null, ptr @uint32..d, ptr null, i64 128 }, %structField.0 { ptr @go..C69, ptr null, ptr @uint32..d, ptr null, i64 136 }, %structField.0 { ptr @go..C70, ptr null, ptr @uint32..d, ptr null, i64 144 }, %structField.0 { ptr @go..C71, ptr null, ptr @uint32..d, ptr null, i64 152 }, %structField.0 { ptr @go..C72, ptr null, ptr @uint32..d, ptr null, i64 160 }]
@imt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.SOA = local_unnamed_addr constant { ptr, ptr, ptr } { ptr @go_0llvm.SOA..d, ptr @go_0llvm.SOA.Header, ptr @go_0llvm.SOA.copy }
@pimt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.SOA = constant { ptr, ptr, ptr } { ptr @go_0llvm.SOA..p, ptr @go_0llvm.SOA.Header, ptr @go_0llvm.SOA.copy }
@go_0llvm.DNAME..d = constant %StructType.0 { %_type.0 { i64 48, i64 40, i32 1378049777, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.DNAME..eq..f, ptr @gcbits..ra, ptr @go..C74, ptr @go..C78, ptr @go_0llvm.DNAME..p }, %IPST.46 { ptr @go..C95, i64 2, i64 2 } }
@go_0llvm.DNAME..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.DNAME..eq to i64) }
@gcbits..ra = weak constant [1 x i8] c"\11", comdat
@const.37 = private constant [20 x i8] c"\09go.llvm\09llvm.DNAME\00", align 1
@go..C74 = internal constant { ptr, i64 } { ptr @const.37, i64 19 }
@const.38 = private constant [6 x i8] c"DNAME\00", align 1
@go..C75 = internal constant { ptr, i64 } { ptr @const.38, i64 5 }
@go..C76 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C77 = internal constant [1 x %method.0] zeroinitializer
@go..C78 = internal constant %uncommonType.0 { ptr @go..C75, ptr @go..C76, %IPST.44 { ptr @go..C77, i64 0, i64 0 } }
@go_0llvm.DNAME..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 573959961, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C79, ptr @go..C90, ptr @type.._2_2go_0llvm_0DNAME }, ptr @go_0llvm.DNAME..d }, comdat
@const.39 = private constant [21 x i8] c"*\09go.llvm\09llvm.DNAME\00", align 1
@go..C79 = internal constant { ptr, i64 } { ptr @const.39, i64 20 }
@go..C80 = internal constant { ptr, i64 } { ptr @const.4, i64 6 }
@type..func_8_2go_0llvm_0DNAME_9_8_2go_0llvm_0RR__Header_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 578596200, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C81, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C82, i64 1, i64 1 }, %IPST.45 { ptr @go..C83, i64 1, i64 1 } }, comdat
@const.40 = private constant [52 x i8] c"func(*\09go.llvm\09llvm.DNAME) *\09go.llvm\09llvm.RR_Header\00", align 1
@go..C81 = internal constant { ptr, i64 } { ptr @const.40, i64 51 }
@go..C82 = internal constant [1 x ptr] [ptr @go_0llvm.DNAME..p]
@go..C83 = internal constant [1 x ptr] [ptr @go_0llvm.RR__Header..p]
@go..C84 = internal constant { ptr, i64 } { ptr @const.22, i64 4 }
@go..C85 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8_2go_0llvm_0DNAME_9_8go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1735425112, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C86, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C87, i64 1, i64 1 }, %IPST.45 { ptr @go..C88, i64 1, i64 1 } }, comdat
@const.41 = private constant [44 x i8] c"func(*\09go.llvm\09llvm.DNAME) \09go.llvm\09llvm.RR\00", align 1
@go..C86 = internal constant { ptr, i64 } { ptr @const.41, i64 43 }
@go..C87 = internal constant [1 x ptr] [ptr @go_0llvm.DNAME..p]
@go..C88 = internal constant [1 x ptr] [ptr @go_0llvm.RR..d]
@go..C89 = internal constant [2 x %method.0] [%method.0 { ptr @go..C80, ptr null, ptr @type..func_8_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0DNAME_9_8_2go_0llvm_0RR__Header_9, ptr @go_0llvm.DNAME.Header }, %method.0 { ptr @go..C84, ptr @go..C85, ptr @type..func_8_9_8go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0DNAME_9_8go_0llvm_0RR_9, ptr @go_0llvm.DNAME.copy }]
@go..C90 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.44 { ptr @go..C89, i64 2, i64 2 } }
@type.._2_2go_0llvm_0DNAME = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 593424793, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C91, ptr null, ptr null }, ptr @go_0llvm.DNAME..p }, comdat
@const.42 = private constant [22 x i8] c"**\09go.llvm\09llvm.DNAME\00", align 1
@go..C91 = internal constant { ptr, i64 } { ptr @const.42, i64 21 }
@go..C92 = internal constant { ptr, i64 } { ptr @const.29, i64 3 }
@const.43 = private constant [7 x i8] c"Target\00", align 1
@go..C93 = internal constant { ptr, i64 } { ptr @const.43, i64 6 }
@const.44 = private constant [18 x i8] c"dns:\22domain-name\22\00", align 1
@go..C94 = internal constant { ptr, i64 } { ptr @const.44, i64 17 }
@go..C95 = internal constant [2 x %structField.0] [%structField.0 { ptr @go..C92, ptr null, ptr @go_0llvm.RR__Header..d, ptr null, i64 0 }, %structField.0 { ptr @go..C93, ptr null, ptr @string..d, ptr @go..C94, i64 64 }]
@imt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.DNAME = local_unnamed_addr constant { ptr, ptr, ptr } { ptr @go_0llvm.DNAME..d, ptr @go_0llvm.DNAME.Header, ptr @go_0llvm.DNAME.copy }
@pimt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.DNAME = constant { ptr, ptr, ptr } { ptr @go_0llvm.DNAME..p, ptr @go_0llvm.DNAME.Header, ptr @go_0llvm.DNAME.copy }
@go_0llvm.CNAME..d = constant %StructType.0 { %_type.0 { i64 48, i64 40, i32 -2001375236, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.CNAME..eq..f, ptr @gcbits..ra, ptr @go..C96, ptr @go..C100, ptr @go_0llvm.CNAME..p }, %IPST.46 { ptr @go..C117, i64 2, i64 2 } }
@go_0llvm.CNAME..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.CNAME..eq to i64) }
@const.45 = private constant [20 x i8] c"\09go.llvm\09llvm.CNAME\00", align 1
@go..C96 = internal constant { ptr, i64 } { ptr @const.45, i64 19 }
@const.46 = private constant [6 x i8] c"CNAME\00", align 1
@go..C97 = internal constant { ptr, i64 } { ptr @const.46, i64 5 }
@go..C98 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C99 = internal constant [1 x %method.0] zeroinitializer
@go..C100 = internal constant %uncommonType.0 { ptr @go..C97, ptr @go..C98, %IPST.44 { ptr @go..C99, i64 0, i64 0 } }
@go_0llvm.CNAME..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1957232695, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C101, ptr @go..C112, ptr @type.._2_2go_0llvm_0CNAME }, ptr @go_0llvm.CNAME..d }, comdat
@const.47 = private constant [21 x i8] c"*\09go.llvm\09llvm.CNAME\00", align 1
@go..C101 = internal constant { ptr, i64 } { ptr @const.47, i64 20 }
@go..C102 = internal constant { ptr, i64 } { ptr @const.4, i64 6 }
@type..func_8_2go_0llvm_0CNAME_9_8_2go_0llvm_0RR__Header_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1184809832, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C103, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C104, i64 1, i64 1 }, %IPST.45 { ptr @go..C105, i64 1, i64 1 } }, comdat
@const.48 = private constant [52 x i8] c"func(*\09go.llvm\09llvm.CNAME) *\09go.llvm\09llvm.RR_Header\00", align 1
@go..C103 = internal constant { ptr, i64 } { ptr @const.48, i64 51 }
@go..C104 = internal constant [1 x ptr] [ptr @go_0llvm.CNAME..p]
@go..C105 = internal constant [1 x ptr] [ptr @go_0llvm.RR__Header..p]
@go..C106 = internal constant { ptr, i64 } { ptr @const.22, i64 4 }
@go..C107 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8_2go_0llvm_0CNAME_9_8go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1129211480, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C108, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C109, i64 1, i64 1 }, %IPST.45 { ptr @go..C110, i64 1, i64 1 } }, comdat
@const.49 = private constant [44 x i8] c"func(*\09go.llvm\09llvm.CNAME) \09go.llvm\09llvm.RR\00", align 1
@go..C108 = internal constant { ptr, i64 } { ptr @const.49, i64 43 }
@go..C109 = internal constant [1 x ptr] [ptr @go_0llvm.CNAME..p]
@go..C110 = internal constant [1 x ptr] [ptr @go_0llvm.RR..d]
@go..C111 = internal constant [2 x %method.0] [%method.0 { ptr @go..C102, ptr null, ptr @type..func_8_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0CNAME_9_8_2go_0llvm_0RR__Header_9, ptr @go_0llvm.CNAME.Header }, %method.0 { ptr @go..C106, ptr @go..C107, ptr @type..func_8_9_8go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0CNAME_9_8go_0llvm_0RR_9, ptr @go_0llvm.CNAME.copy }]
@go..C112 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.44 { ptr @go..C111, i64 2, i64 2 } }
@type.._2_2go_0llvm_0CNAME = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1250952039, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C113, ptr null, ptr null }, ptr @go_0llvm.CNAME..p }, comdat
@const.50 = private constant [22 x i8] c"**\09go.llvm\09llvm.CNAME\00", align 1
@go..C113 = internal constant { ptr, i64 } { ptr @const.50, i64 21 }
@go..C114 = internal constant { ptr, i64 } { ptr @const.29, i64 3 }
@go..C115 = internal constant { ptr, i64 } { ptr @const.43, i64 6 }
@go..C116 = internal constant { ptr, i64 } { ptr @const.12, i64 18 }
@go..C117 = internal constant [2 x %structField.0] [%structField.0 { ptr @go..C114, ptr null, ptr @go_0llvm.RR__Header..d, ptr null, i64 0 }, %structField.0 { ptr @go..C115, ptr null, ptr @string..d, ptr @go..C116, i64 64 }]
@imt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.CNAME = local_unnamed_addr constant { ptr, ptr, ptr } { ptr @go_0llvm.CNAME..d, ptr @go_0llvm.CNAME.Header, ptr @go_0llvm.CNAME.copy }
@pimt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.CNAME = constant { ptr, ptr, ptr } { ptr @go_0llvm.CNAME..p, ptr @go_0llvm.CNAME.Header, ptr @go_0llvm.CNAME.copy }
@go_0llvm.SRV..d = constant %StructType.0 { %_type.0 { i64 56, i64 48, i32 645114483, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.SRV..eq..f, ptr @gcbits..bb, ptr @go..C118, ptr @go..C122, ptr @go_0llvm.SRV..p }, %IPST.46 { ptr @go..C142, i64 5, i64 5 } }
@go_0llvm.SRV..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.SRV..eq to i64) }
@gcbits..bb = weak constant [1 x i8] c"!", comdat
@const.51 = private constant [18 x i8] c"\09go.llvm\09llvm.SRV\00", align 1
@go..C118 = internal constant { ptr, i64 } { ptr @const.51, i64 17 }
@const.52 = private constant [4 x i8] c"SRV\00", align 1
@go..C119 = internal constant { ptr, i64 } { ptr @const.52, i64 3 }
@go..C120 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C121 = internal constant [1 x %method.0] zeroinitializer
@go..C122 = internal constant %uncommonType.0 { ptr @go..C119, ptr @go..C120, %IPST.44 { ptr @go..C121, i64 0, i64 0 } }
@go_0llvm.SRV..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1731897145, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C123, ptr @go..C134, ptr @type.._2_2go_0llvm_0SRV }, ptr @go_0llvm.SRV..d }, comdat
@const.53 = private constant [19 x i8] c"*\09go.llvm\09llvm.SRV\00", align 1
@go..C123 = internal constant { ptr, i64 } { ptr @const.53, i64 18 }
@go..C124 = internal constant { ptr, i64 } { ptr @const.4, i64 6 }
@type..func_8_2go_0llvm_0SRV_9_8_2go_0llvm_0RR__Header_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1022119576, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C125, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C126, i64 1, i64 1 }, %IPST.45 { ptr @go..C127, i64 1, i64 1 } }, comdat
@const.54 = private constant [50 x i8] c"func(*\09go.llvm\09llvm.SRV) *\09go.llvm\09llvm.RR_Header\00", align 1
@go..C125 = internal constant { ptr, i64 } { ptr @const.54, i64 49 }
@go..C126 = internal constant [1 x ptr] [ptr @go_0llvm.SRV..p]
@go..C127 = internal constant [1 x ptr] [ptr @go_0llvm.RR__Header..p]
@go..C128 = internal constant { ptr, i64 } { ptr @const.22, i64 4 }
@go..C129 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8_2go_0llvm_0SRV_9_8go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 958826408, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C130, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C131, i64 1, i64 1 }, %IPST.45 { ptr @go..C132, i64 1, i64 1 } }, comdat
@const.55 = private constant [42 x i8] c"func(*\09go.llvm\09llvm.SRV) \09go.llvm\09llvm.RR\00", align 1
@go..C130 = internal constant { ptr, i64 } { ptr @const.55, i64 41 }
@go..C131 = internal constant [1 x ptr] [ptr @go_0llvm.SRV..p]
@go..C132 = internal constant [1 x ptr] [ptr @go_0llvm.RR..d]
@go..C133 = internal constant [2 x %method.0] [%method.0 { ptr @go..C124, ptr null, ptr @type..func_8_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0SRV_9_8_2go_0llvm_0RR__Header_9, ptr @go_0llvm.SRV.Header }, %method.0 { ptr @go..C128, ptr @go..C129, ptr @type..func_8_9_8go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0SRV_9_8go_0llvm_0RR_9, ptr @go_0llvm.SRV.copy }]
@go..C134 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.44 { ptr @go..C133, i64 2, i64 2 } }
@type.._2_2go_0llvm_0SRV = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1940550553, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C135, ptr null, ptr null }, ptr @go_0llvm.SRV..p }, comdat
@const.56 = private constant [20 x i8] c"**\09go.llvm\09llvm.SRV\00", align 1
@go..C135 = internal constant { ptr, i64 } { ptr @const.56, i64 19 }
@go..C136 = internal constant { ptr, i64 } { ptr @const.29, i64 3 }
@const.57 = private constant [9 x i8] c"Priority\00", align 1
@go..C137 = internal constant { ptr, i64 } { ptr @const.57, i64 8 }
@const.58 = private constant [7 x i8] c"Weight\00", align 1
@go..C138 = internal constant { ptr, i64 } { ptr @const.58, i64 6 }
@const.59 = private constant [5 x i8] c"Port\00", align 1
@go..C139 = internal constant { ptr, i64 } { ptr @const.59, i64 4 }
@go..C140 = internal constant { ptr, i64 } { ptr @const.43, i64 6 }
@go..C141 = internal constant { ptr, i64 } { ptr @const.44, i64 17 }
@go..C142 = internal constant [5 x %structField.0] [%structField.0 { ptr @go..C136, ptr null, ptr @go_0llvm.RR__Header..d, ptr null, i64 0 }, %structField.0 { ptr @go..C137, ptr null, ptr @uint16..d, ptr null, i64 64 }, %structField.0 { ptr @go..C138, ptr null, ptr @uint16..d, ptr null, i64 68 }, %structField.0 { ptr @go..C139, ptr null, ptr @uint16..d, ptr null, i64 72 }, %structField.0 { ptr @go..C140, ptr null, ptr @string..d, ptr @go..C141, i64 80 }]
@imt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.SRV = local_unnamed_addr constant { ptr, ptr, ptr } { ptr @go_0llvm.SRV..d, ptr @go_0llvm.SRV.Header, ptr @go_0llvm.SRV.copy }
@pimt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.SRV = constant { ptr, ptr, ptr } { ptr @go_0llvm.SRV..p, ptr @go_0llvm.SRV.Header, ptr @go_0llvm.SRV.copy }
@go_0llvm.MX..d = constant %StructType.0 { %_type.0 { i64 56, i64 48, i32 -525846277, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.MX..eq..f, ptr @gcbits..bb, ptr @go..C143, ptr @go..C147, ptr @go_0llvm.MX..p }, %IPST.46 { ptr @go..C165, i64 3, i64 3 } }
@go_0llvm.MX..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.MX..eq to i64) }
@const.60 = private constant [17 x i8] c"\09go.llvm\09llvm.MX\00", align 1
@go..C143 = internal constant { ptr, i64 } { ptr @const.60, i64 16 }
@const.61 = private constant [3 x i8] c"MX\00", align 1
@go..C144 = internal constant { ptr, i64 } { ptr @const.61, i64 2 }
@go..C145 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C146 = internal constant [1 x %method.0] zeroinitializer
@go..C147 = internal constant %uncommonType.0 { ptr @go..C144, ptr @go..C145, %IPST.44 { ptr @go..C146, i64 0, i64 0 } }
@go_0llvm.MX..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 176394169, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C148, ptr @go..C159, ptr @type.._2_2go_0llvm_0MX }, ptr @go_0llvm.MX..d }, comdat
@const.62 = private constant [18 x i8] c"*\09go.llvm\09llvm.MX\00", align 1
@go..C148 = internal constant { ptr, i64 } { ptr @const.62, i64 17 }
@go..C149 = internal constant { ptr, i64 } { ptr @const.4, i64 6 }
@type..func_8_2go_0llvm_0MX_9_8_2go_0llvm_0RR__Header_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 741392744, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C150, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C151, i64 1, i64 1 }, %IPST.45 { ptr @go..C152, i64 1, i64 1 } }, comdat
@const.63 = private constant [49 x i8] c"func(*\09go.llvm\09llvm.MX) *\09go.llvm\09llvm.RR_Header\00", align 1
@go..C150 = internal constant { ptr, i64 } { ptr @const.63, i64 48 }
@go..C151 = internal constant [1 x ptr] [ptr @go_0llvm.MX..p]
@go..C152 = internal constant [1 x ptr] [ptr @go_0llvm.RR__Header..p]
@go..C153 = internal constant { ptr, i64 } { ptr @const.22, i64 4 }
@go..C154 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8_2go_0llvm_0MX_9_8go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1572628568, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C155, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C156, i64 1, i64 1 }, %IPST.45 { ptr @go..C157, i64 1, i64 1 } }, comdat
@const.64 = private constant [41 x i8] c"func(*\09go.llvm\09llvm.MX) \09go.llvm\09llvm.RR\00", align 1
@go..C155 = internal constant { ptr, i64 } { ptr @const.64, i64 40 }
@go..C156 = internal constant [1 x ptr] [ptr @go_0llvm.MX..p]
@go..C157 = internal constant [1 x ptr] [ptr @go_0llvm.RR..d]
@go..C158 = internal constant [2 x %method.0] [%method.0 { ptr @go..C149, ptr null, ptr @type..func_8_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0MX_9_8_2go_0llvm_0RR__Header_9, ptr @go_0llvm.MX.Header }, %method.0 { ptr @go..C153, ptr @go..C154, ptr @type..func_8_9_8go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0MX_9_8go_0llvm_0RR_9, ptr @go_0llvm.MX.copy }]
@go..C159 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.44 { ptr @go..C158, i64 2, i64 2 } }
@type.._2_2go_0llvm_0MX = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1472660583, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C160, ptr null, ptr null }, ptr @go_0llvm.MX..p }, comdat
@const.65 = private constant [19 x i8] c"**\09go.llvm\09llvm.MX\00", align 1
@go..C160 = internal constant { ptr, i64 } { ptr @const.65, i64 18 }
@go..C161 = internal constant { ptr, i64 } { ptr @const.29, i64 3 }
@const.66 = private constant [11 x i8] c"Preference\00", align 1
@go..C162 = internal constant { ptr, i64 } { ptr @const.66, i64 10 }
@const.67 = private constant [3 x i8] c"Mx\00", align 1
@go..C163 = internal constant { ptr, i64 } { ptr @const.67, i64 2 }
@go..C164 = internal constant { ptr, i64 } { ptr @const.12, i64 18 }
@go..C165 = internal constant [3 x %structField.0] [%structField.0 { ptr @go..C161, ptr null, ptr @go_0llvm.RR__Header..d, ptr null, i64 0 }, %structField.0 { ptr @go..C162, ptr null, ptr @uint16..d, ptr null, i64 64 }, %structField.0 { ptr @go..C163, ptr null, ptr @string..d, ptr @go..C164, i64 80 }]
@imt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.MX = local_unnamed_addr constant { ptr, ptr, ptr } { ptr @go_0llvm.MX..d, ptr @go_0llvm.MX.Header, ptr @go_0llvm.MX.copy }
@pimt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.MX = constant { ptr, ptr, ptr } { ptr @go_0llvm.MX..p, ptr @go_0llvm.MX.Header, ptr @go_0llvm.MX.copy }
@go_0llvm.NS..d = constant %StructType.0 { %_type.0 { i64 48, i64 40, i32 663863557, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.NS..eq..f, ptr @gcbits..ra, ptr @go..C166, ptr @go..C170, ptr @go_0llvm.NS..p }, %IPST.46 { ptr @go..C187, i64 2, i64 2 } }
@go_0llvm.NS..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.NS..eq to i64) }
@const.68 = private constant [17 x i8] c"\09go.llvm\09llvm.NS\00", align 1
@go..C166 = internal constant { ptr, i64 } { ptr @const.68, i64 16 }
@const.69 = private constant [3 x i8] c"NS\00", align 1
@go..C167 = internal constant { ptr, i64 } { ptr @const.69, i64 2 }
@go..C168 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C169 = internal constant [1 x %method.0] zeroinitializer
@go..C170 = internal constant %uncommonType.0 { ptr @go..C167, ptr @go..C168, %IPST.44 { ptr @go..C169, i64 0, i64 0 } }
@go_0llvm.NS..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 2031882329, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C171, ptr @go..C182, ptr @type.._2_2go_0llvm_0NS }, ptr @go_0llvm.NS..d }, comdat
@const.70 = private constant [18 x i8] c"*\09go.llvm\09llvm.NS\00", align 1
@go..C171 = internal constant { ptr, i64 } { ptr @const.70, i64 17 }
@go..C172 = internal constant { ptr, i64 } { ptr @const.4, i64 6 }
@type..func_8_2go_0llvm_0NS_9_8_2go_0llvm_0RR__Header_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -12528280, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C173, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C174, i64 1, i64 1 }, %IPST.45 { ptr @go..C175, i64 1, i64 1 } }, comdat
@const.71 = private constant [49 x i8] c"func(*\09go.llvm\09llvm.NS) *\09go.llvm\09llvm.RR_Header\00", align 1
@go..C173 = internal constant { ptr, i64 } { ptr @const.71, i64 48 }
@go..C174 = internal constant [1 x ptr] [ptr @go_0llvm.NS..p]
@go..C175 = internal constant [1 x ptr] [ptr @go_0llvm.RR__Header..p]
@go..C176 = internal constant { ptr, i64 } { ptr @const.22, i64 4 }
@go..C177 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8_2go_0llvm_0NS_9_8go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1968417704, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C178, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C179, i64 1, i64 1 }, %IPST.45 { ptr @go..C180, i64 1, i64 1 } }, comdat
@const.72 = private constant [41 x i8] c"func(*\09go.llvm\09llvm.NS) \09go.llvm\09llvm.RR\00", align 1
@go..C178 = internal constant { ptr, i64 } { ptr @const.72, i64 40 }
@go..C179 = internal constant [1 x ptr] [ptr @go_0llvm.NS..p]
@go..C180 = internal constant [1 x ptr] [ptr @go_0llvm.RR..d]
@go..C181 = internal constant [2 x %method.0] [%method.0 { ptr @go..C172, ptr null, ptr @type..func_8_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0NS_9_8_2go_0llvm_0RR__Header_9, ptr @go_0llvm.NS.Header }, %method.0 { ptr @go..C176, ptr @go..C177, ptr @type..func_8_9_8go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0NS_9_8go_0llvm_0RR_9, ptr @go_0llvm.NS.copy }]
@go..C182 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.44 { ptr @go..C181, i64 2, i64 2 } }
@type.._2_2go_0llvm_0NS = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1849621095, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C183, ptr null, ptr null }, ptr @go_0llvm.NS..p }, comdat
@const.73 = private constant [19 x i8] c"**\09go.llvm\09llvm.NS\00", align 1
@go..C183 = internal constant { ptr, i64 } { ptr @const.73, i64 18 }
@go..C184 = internal constant { ptr, i64 } { ptr @const.29, i64 3 }
@go..C185 = internal constant { ptr, i64 } { ptr @const.30, i64 2 }
@go..C186 = internal constant { ptr, i64 } { ptr @const.12, i64 18 }
@go..C187 = internal constant [2 x %structField.0] [%structField.0 { ptr @go..C184, ptr null, ptr @go_0llvm.RR__Header..d, ptr null, i64 0 }, %structField.0 { ptr @go..C185, ptr null, ptr @string..d, ptr @go..C186, i64 64 }]
@imt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.NS = local_unnamed_addr constant { ptr, ptr, ptr } { ptr @go_0llvm.NS..d, ptr @go_0llvm.NS.Header, ptr @go_0llvm.NS.copy }
@pimt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.NS = constant { ptr, ptr, ptr } { ptr @go_0llvm.NS..p, ptr @go_0llvm.NS.Header, ptr @go_0llvm.NS.copy }
@go_0llvm.PrevLabel..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.PrevLabel to i64) }
@go_0llvm.Copy..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.Copy to i64) }
@go_0llvm.ResponseWriter..d = constant %InterfaceType.0 { %_type.0 { i64 16, i64 16, i32 -1536056202, i8 0, i8 8, i8 8, i8 20, ptr @runtime.interequal..f, ptr @gcbits..da, ptr @go..C188, ptr @go..C192, ptr @go_0llvm.ResponseWriter..p }, %IPST.47 { ptr @go..C291, i64 8, i64 8 } }
@const.74 = private constant [29 x i8] c"\09go.llvm\09llvm.ResponseWriter\00", align 1
@go..C188 = internal constant { ptr, i64 } { ptr @const.74, i64 28 }
@const.75 = private constant [15 x i8] c"ResponseWriter\00", align 1
@go..C189 = internal constant { ptr, i64 } { ptr @const.75, i64 14 }
@go..C190 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C191 = internal constant [1 x %method.0] zeroinitializer
@go..C192 = internal constant %uncommonType.0 { ptr @go..C189, ptr @go..C190, %IPST.44 { ptr @go..C191, i64 0, i64 0 } }
@go_0llvm.ResponseWriter..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1192904553, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C193, ptr null, ptr null }, ptr @go_0llvm.ResponseWriter..d }, comdat
@const.76 = private constant [30 x i8] c"*\09go.llvm\09llvm.ResponseWriter\00", align 1
@go..C193 = internal constant { ptr, i64 } { ptr @const.76, i64 29 }
@const.77 = private constant [6 x i8] c"Close\00", align 1
@go..C194 = internal constant { ptr, i64 } { ptr @const.77, i64 5 }
@type..func_8_9_8error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1188738504, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C195, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C196, i64 0, i64 0 }, %IPST.45 { ptr @go..C207, i64 1, i64 1 } }, comdat
@const.78 = private constant [13 x i8] c"func() error\00", align 1
@go..C195 = internal constant { ptr, i64 } { ptr @const.78, i64 12 }
@go..C196 = internal constant [1 x ptr] zeroinitializer
@error..d = weak constant %InterfaceType.0 { %_type.0 { i64 16, i64 16, i32 -2128909609, i8 0, i8 8, i8 8, i8 20, ptr @runtime.interequal..f, ptr @gcbits..da, ptr @go..C197, ptr @go..C200, ptr @error..p }, %IPST.47 { ptr @go..C206, i64 1, i64 1 } }, comdat
@const.79 = private constant [6 x i8] c"error\00", align 1
@go..C197 = internal constant { ptr, i64 } { ptr @const.79, i64 5 }
@go..C198 = internal constant { ptr, i64 } { ptr @const.79, i64 5 }
@go..C199 = internal constant [1 x %method.0] zeroinitializer
@go..C200 = internal constant %uncommonType.0 { ptr @go..C198, ptr null, %IPST.44 { ptr @go..C199, i64 0, i64 0 } }
@error..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 297184633, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C201, ptr null, ptr null }, ptr @error..d }, comdat
@const.80 = private constant [7 x i8] c"*error\00", align 1
@go..C201 = internal constant { ptr, i64 } { ptr @const.80, i64 6 }
@const.81 = private constant [6 x i8] c"Error\00", align 1
@go..C202 = internal constant { ptr, i64 } { ptr @const.81, i64 5 }
@type..func_8_9_8string_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 916039304, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C203, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C204, i64 0, i64 0 }, %IPST.45 { ptr @go..C205, i64 1, i64 1 } }, comdat
@const.82 = private constant [14 x i8] c"func() string\00", align 1
@go..C203 = internal constant { ptr, i64 } { ptr @const.82, i64 13 }
@go..C204 = internal constant [1 x ptr] zeroinitializer
@go..C205 = internal constant [1 x ptr] [ptr @string..d]
@go..C206 = internal constant [1 x %imethod.0] [%imethod.0 { ptr @go..C202, ptr null, ptr @type..func_8_9_8string_9 }]
@go..C207 = internal constant [1 x ptr] [ptr @error..d]
@const.83 = private constant [7 x i8] c"Hijack\00", align 1
@go..C208 = internal constant { ptr, i64 } { ptr @const.83, i64 6 }
@type..func_8_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 8, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C209, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C210, i64 0, i64 0 }, %IPST.45 { ptr @go..C211, i64 0, i64 0 } }, comdat
@const.84 = private constant [7 x i8] c"func()\00", align 1
@go..C209 = internal constant { ptr, i64 } { ptr @const.84, i64 6 }
@go..C210 = internal constant [1 x ptr] zeroinitializer
@go..C211 = internal constant [1 x ptr] zeroinitializer
@const.85 = private constant [10 x i8] c"LocalAddr\00", align 1
@go..C212 = internal constant { ptr, i64 } { ptr @const.85, i64 9 }
@type..func_8_9_8net_0Addr_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 33758664, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C213, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C214, i64 0, i64 0 }, %IPST.45 { ptr @go..C215, i64 1, i64 1 } }, comdat
@const.86 = private constant [21 x i8] c"func() \09net\09net.Addr\00", align 1
@go..C213 = internal constant { ptr, i64 } { ptr @const.86, i64 20 }
@go..C214 = internal constant [1 x ptr] zeroinitializer
@net.Addr..d = external constant %InterfaceType.0
@go..C215 = internal constant [1 x ptr] [ptr @net.Addr..d]
@const.87 = private constant [11 x i8] c"RemoteAddr\00", align 1
@go..C216 = internal constant { ptr, i64 } { ptr @const.87, i64 10 }
@const.88 = private constant [11 x i8] c"TsigStatus\00", align 1
@go..C217 = internal constant { ptr, i64 } { ptr @const.88, i64 10 }
@const.89 = private constant [15 x i8] c"TsigTimersOnly\00", align 1
@go..C218 = internal constant { ptr, i64 } { ptr @const.89, i64 14 }
@type..func_8bool_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1966551592, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C219, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C225, i64 1, i64 1 }, %IPST.45 { ptr @go..C226, i64 0, i64 0 } }, comdat
@const.90 = private constant [11 x i8] c"func(bool)\00", align 1
@go..C219 = internal constant { ptr, i64 } { ptr @const.90, i64 10 }
@bool..d = weak constant %_type.0 { i64 1, i64 0, i32 1537849745, i8 8, i8 1, i8 1, i8 -127, ptr @runtime.memequal8..f, ptr null, ptr @go..C220, ptr @go..C223, ptr @bool..p }, comdat
@runtime.memequal8..f = external constant %functionDescriptor.0
@const.91 = private constant [5 x i8] c"bool\00", align 1
@go..C220 = internal constant { ptr, i64 } { ptr @const.91, i64 4 }
@go..C221 = internal constant { ptr, i64 } { ptr @const.91, i64 4 }
@go..C222 = internal constant [1 x %method.0] zeroinitializer
@go..C223 = internal constant %uncommonType.0 { ptr @go..C221, ptr null, %IPST.44 { ptr @go..C222, i64 0, i64 0 } }
@bool..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1164207847, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C224, ptr null, ptr null }, ptr @bool..d }, comdat
@const.92 = private constant [6 x i8] c"*bool\00", align 1
@go..C224 = internal constant { ptr, i64 } { ptr @const.92, i64 5 }
@go..C225 = internal constant [1 x ptr] [ptr @bool..d]
@go..C226 = internal constant [1 x ptr] zeroinitializer
@const.93 = private constant [6 x i8] c"Write\00", align 1
@go..C227 = internal constant { ptr, i64 } { ptr @const.93, i64 5 }
@type..func_8_6_7uint8_9_8int_3error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1764714264, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C228, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C235, i64 1, i64 1 }, %IPST.45 { ptr @go..C241, i64 2, i64 2 } }, comdat
@const.94 = private constant [27 x i8] c"func([]uint8) (int, error)\00", align 1
@go..C228 = internal constant { ptr, i64 } { ptr @const.94, i64 26 }
@type.._6_7uint8 = weak constant %SliceType.0 { %_type.0 { i64 24, i64 8, i32 264632103, i8 0, i8 8, i8 8, i8 23, ptr null, ptr @gcbits..ba, ptr @go..C229, ptr null, ptr null }, ptr @uint8..d }, comdat
@const.95 = private constant [8 x i8] c"[]uint8\00", align 1
@go..C229 = internal constant { ptr, i64 } { ptr @const.95, i64 7 }
@uint8..d = weak constant %_type.0 { i64 1, i64 0, i32 264632089, i8 8, i8 1, i8 1, i8 -120, ptr @runtime.memequal8..f, ptr null, ptr @go..C230, ptr @go..C233, ptr @uint8..p }, comdat
@const.96 = private constant [6 x i8] c"uint8\00", align 1
@go..C230 = internal constant { ptr, i64 } { ptr @const.96, i64 5 }
@go..C231 = internal constant { ptr, i64 } { ptr @const.96, i64 5 }
@go..C232 = internal constant [1 x %method.0] zeroinitializer
@go..C233 = internal constant %uncommonType.0 { ptr @go..C231, ptr null, %IPST.44 { ptr @go..C232, i64 0, i64 0 } }
@uint8..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -60853863, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C234, ptr null, ptr null }, ptr @uint8..d }, comdat
@const.97 = private constant [7 x i8] c"*uint8\00", align 1
@go..C234 = internal constant { ptr, i64 } { ptr @const.97, i64 6 }
@go..C235 = internal constant [1 x ptr] [ptr @type.._6_7uint8]
@int..d = weak constant %_type.0 { i64 8, i64 0, i32 876704034, i8 8, i8 8, i8 8, i8 -126, ptr @runtime.memequal64..f, ptr null, ptr @go..C236, ptr @go..C239, ptr @int..p }, comdat
@const.98 = private constant [4 x i8] c"int\00", align 1
@go..C236 = internal constant { ptr, i64 } { ptr @const.98, i64 3 }
@go..C237 = internal constant { ptr, i64 } { ptr @const.98, i64 3 }
@go..C238 = internal constant [1 x %method.0] zeroinitializer
@go..C239 = internal constant %uncommonType.0 { ptr @go..C237, ptr null, %IPST.44 { ptr @go..C238, i64 0, i64 0 } }
@int..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1142362665, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C240, ptr null, ptr null }, ptr @int..d }, comdat
@const.99 = private constant [5 x i8] c"*int\00", align 1
@go..C240 = internal constant { ptr, i64 } { ptr @const.99, i64 4 }
@go..C241 = internal constant [2 x ptr] [ptr @int..d, ptr @error..d]
@const.100 = private constant [9 x i8] c"WriteMsg\00", align 1
@go..C242 = internal constant { ptr, i64 } { ptr @const.100, i64 8 }
@type..func_8_2go_0llvm_0Msg_9_8error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1007465704, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C243, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C289, i64 1, i64 1 }, %IPST.45 { ptr @go..C290, i64 1, i64 1 } }, comdat
@const.101 = private constant [31 x i8] c"func(*\09go.llvm\09llvm.Msg) error\00", align 1
@go..C243 = internal constant { ptr, i64 } { ptr @const.101, i64 30 }
@go_0llvm.Msg..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 799641593, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C244, ptr null, ptr null }, ptr @go_0llvm.Msg..d }, comdat
@const.102 = private constant [19 x i8] c"*\09go.llvm\09llvm.Msg\00", align 1
@go..C244 = internal constant { ptr, i64 } { ptr @const.102, i64 18 }
@go_0llvm.Msg..d = constant %StructType.0 { %_type.0 { i64 136, i64 120, i32 318413055, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..ajsa, ptr @go..C245, ptr @go..C249, ptr @go_0llvm.Msg..p }, %IPST.46 { ptr @go..C288, i64 6, i64 6 } }
@gcbits..ajsa = weak constant [2 x i8] c" I", comdat
@const.103 = private constant [18 x i8] c"\09go.llvm\09llvm.Msg\00", align 1
@go..C245 = internal constant { ptr, i64 } { ptr @const.103, i64 17 }
@const.104 = private constant [4 x i8] c"Msg\00", align 1
@go..C246 = internal constant { ptr, i64 } { ptr @const.104, i64 3 }
@go..C247 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C248 = internal constant [1 x %method.0] zeroinitializer
@go..C249 = internal constant %uncommonType.0 { ptr @go..C246, ptr @go..C247, %IPST.44 { ptr @go..C248, i64 0, i64 0 } }
@const.105 = private constant [7 x i8] c"MsgHdr\00", align 1
@go..C250 = internal constant { ptr, i64 } { ptr @const.105, i64 6 }
@go_0llvm.MsgHdr..d = constant %StructType.0 { %_type.0 { i64 32, i64 0, i32 1661415275, i8 0, i8 8, i8 8, i8 -103, ptr @go_0llvm.MsgHdr..eq..f, ptr null, ptr @go..C251, ptr @go..C255, ptr @go_0llvm.MsgHdr..p }, %IPST.46 { ptr @go..C268, i64 11, i64 11 } }
@go_0llvm.MsgHdr..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.MsgHdr..eq to i64) }
@const.106 = private constant [21 x i8] c"\09go.llvm\09llvm.MsgHdr\00", align 1
@go..C251 = internal constant { ptr, i64 } { ptr @const.106, i64 20 }
@go..C252 = internal constant { ptr, i64 } { ptr @const.105, i64 6 }
@go..C253 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C254 = internal constant [1 x %method.0] zeroinitializer
@go..C255 = internal constant %uncommonType.0 { ptr @go..C252, ptr @go..C253, %IPST.44 { ptr @go..C254, i64 0, i64 0 } }
@go_0llvm.MsgHdr..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 812840633, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C256, ptr null, ptr null }, ptr @go_0llvm.MsgHdr..d }, comdat
@const.107 = private constant [22 x i8] c"*\09go.llvm\09llvm.MsgHdr\00", align 1
@go..C256 = internal constant { ptr, i64 } { ptr @const.107, i64 21 }
@const.108 = private constant [3 x i8] c"Id\00", align 1
@go..C257 = internal constant { ptr, i64 } { ptr @const.108, i64 2 }
@const.109 = private constant [9 x i8] c"Response\00", align 1
@go..C258 = internal constant { ptr, i64 } { ptr @const.109, i64 8 }
@const.110 = private constant [7 x i8] c"Opcode\00", align 1
@go..C259 = internal constant { ptr, i64 } { ptr @const.110, i64 6 }
@const.111 = private constant [14 x i8] c"Authoritative\00", align 1
@go..C260 = internal constant { ptr, i64 } { ptr @const.111, i64 13 }
@const.112 = private constant [10 x i8] c"Truncated\00", align 1
@go..C261 = internal constant { ptr, i64 } { ptr @const.112, i64 9 }
@const.113 = private constant [17 x i8] c"RecursionDesired\00", align 1
@go..C262 = internal constant { ptr, i64 } { ptr @const.113, i64 16 }
@const.114 = private constant [19 x i8] c"RecursionAvailable\00", align 1
@go..C263 = internal constant { ptr, i64 } { ptr @const.114, i64 18 }
@const.115 = private constant [5 x i8] c"Zero\00", align 1
@go..C264 = internal constant { ptr, i64 } { ptr @const.115, i64 4 }
@const.116 = private constant [18 x i8] c"AuthenticatedData\00", align 1
@go..C265 = internal constant { ptr, i64 } { ptr @const.116, i64 17 }
@const.117 = private constant [17 x i8] c"CheckingDisabled\00", align 1
@go..C266 = internal constant { ptr, i64 } { ptr @const.117, i64 16 }
@const.118 = private constant [6 x i8] c"Rcode\00", align 1
@go..C267 = internal constant { ptr, i64 } { ptr @const.118, i64 5 }
@go..C268 = internal constant [11 x %structField.0] [%structField.0 { ptr @go..C257, ptr null, ptr @uint16..d, ptr null, i64 0 }, %structField.0 { ptr @go..C258, ptr null, ptr @bool..d, ptr null, i64 4 }, %structField.0 { ptr @go..C259, ptr null, ptr @int..d, ptr null, i64 16 }, %structField.0 { ptr @go..C260, ptr null, ptr @bool..d, ptr null, i64 32 }, %structField.0 { ptr @go..C261, ptr null, ptr @bool..d, ptr null, i64 34 }, %structField.0 { ptr @go..C262, ptr null, ptr @bool..d, ptr null, i64 36 }, %structField.0 { ptr @go..C263, ptr null, ptr @bool..d, ptr null, i64 38 }, %structField.0 { ptr @go..C264, ptr null, ptr @bool..d, ptr null, i64 40 }, %structField.0 { ptr @go..C265, ptr null, ptr @bool..d, ptr null, i64 42 }, %structField.0 { ptr @go..C266, ptr null, ptr @bool..d, ptr null, i64 44 }, %structField.0 { ptr @go..C267, ptr null, ptr @int..d, ptr null, i64 48 }]
@const.119 = private constant [9 x i8] c"Compress\00", align 1
@go..C269 = internal constant { ptr, i64 } { ptr @const.119, i64 8 }
@const.120 = private constant [9 x i8] c"json:\22-\22\00", align 1
@go..C270 = internal constant { ptr, i64 } { ptr @const.120, i64 8 }
@const.121 = private constant [9 x i8] c"Question\00", align 1
@go..C271 = internal constant { ptr, i64 } { ptr @const.121, i64 8 }
@type.._6_7go_0llvm_0Question = weak constant %SliceType.0 { %_type.0 { i64 24, i64 8, i32 -768832736, i8 0, i8 8, i8 8, i8 23, ptr null, ptr @gcbits..ba, ptr @go..C272, ptr null, ptr null }, ptr @go_0llvm.Question..d }, comdat
@const.122 = private constant [25 x i8] c"[]\09go.llvm\09llvm.Question\00", align 1
@go..C272 = internal constant { ptr, i64 } { ptr @const.122, i64 24 }
@go_0llvm.Question..d = constant %StructType.0 { %_type.0 { i64 24, i64 8, i32 -768832750, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.Question..eq..f, ptr @gcbits..ba, ptr @go..C273, ptr @go..C277, ptr @go_0llvm.Question..p }, %IPST.46 { ptr @go..C283, i64 3, i64 3 } }
@go_0llvm.Question..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.Question..eq to i64) }
@const.123 = private constant [23 x i8] c"\09go.llvm\09llvm.Question\00", align 1
@go..C273 = internal constant { ptr, i64 } { ptr @const.123, i64 22 }
@go..C274 = internal constant { ptr, i64 } { ptr @const.121, i64 8 }
@go..C275 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C276 = internal constant [1 x %method.0] zeroinitializer
@go..C277 = internal constant %uncommonType.0 { ptr @go..C274, ptr @go..C275, %IPST.44 { ptr @go..C276, i64 0, i64 0 } }
@go_0llvm.Question..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 583577897, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C278, ptr null, ptr null }, ptr @go_0llvm.Question..d }, comdat
@const.124 = private constant [24 x i8] c"*\09go.llvm\09llvm.Question\00", align 1
@go..C278 = internal constant { ptr, i64 } { ptr @const.124, i64 23 }
@go..C279 = internal constant { ptr, i64 } { ptr @const.9, i64 4 }
@go..C280 = internal constant { ptr, i64 } { ptr @const.12, i64 18 }
@const.125 = private constant [6 x i8] c"Qtype\00", align 1
@go..C281 = internal constant { ptr, i64 } { ptr @const.125, i64 5 }
@const.126 = private constant [7 x i8] c"Qclass\00", align 1
@go..C282 = internal constant { ptr, i64 } { ptr @const.126, i64 6 }
@go..C283 = internal constant [3 x %structField.0] [%structField.0 { ptr @go..C279, ptr null, ptr @string..d, ptr @go..C280, i64 0 }, %structField.0 { ptr @go..C281, ptr null, ptr @uint16..d, ptr null, i64 32 }, %structField.0 { ptr @go..C282, ptr null, ptr @uint16..d, ptr null, i64 36 }]
@const.127 = private constant [7 x i8] c"Answer\00", align 1
@go..C284 = internal constant { ptr, i64 } { ptr @const.127, i64 6 }
@type.._6_7go_0llvm_0RR = weak constant %SliceType.0 { %_type.0 { i64 24, i64 8, i32 -2058926448, i8 0, i8 8, i8 8, i8 23, ptr null, ptr @gcbits..ba, ptr @go..C285, ptr null, ptr null }, ptr @go_0llvm.RR..d }, comdat
@const.128 = private constant [19 x i8] c"[]\09go.llvm\09llvm.RR\00", align 1
@go..C285 = internal constant { ptr, i64 } { ptr @const.128, i64 18 }
@go..C286 = internal constant { ptr, i64 } { ptr @const.30, i64 2 }
@const.129 = private constant [6 x i8] c"Extra\00", align 1
@go..C287 = internal constant { ptr, i64 } { ptr @const.129, i64 5 }
@go..C288 = internal constant [6 x %structField.0] [%structField.0 { ptr @go..C250, ptr null, ptr @go_0llvm.MsgHdr..d, ptr null, i64 1 }, %structField.0 { ptr @go..C269, ptr null, ptr @bool..d, ptr @go..C270, i64 64 }, %structField.0 { ptr @go..C271, ptr null, ptr @type.._6_7go_0llvm_0Question, ptr null, i64 80 }, %structField.0 { ptr @go..C284, ptr null, ptr @type.._6_7go_0llvm_0RR, ptr null, i64 128 }, %structField.0 { ptr @go..C286, ptr null, ptr @type.._6_7go_0llvm_0RR, ptr null, i64 176 }, %structField.0 { ptr @go..C287, ptr null, ptr @type.._6_7go_0llvm_0RR, ptr null, i64 224 }]
@go..C289 = internal constant [1 x ptr] [ptr @go_0llvm.Msg..p]
@go..C290 = internal constant [1 x ptr] [ptr @error..d]
@go..C291 = internal constant [8 x %imethod.0] [%imethod.0 { ptr @go..C194, ptr null, ptr @type..func_8_9_8error_9 }, %imethod.0 { ptr @go..C208, ptr null, ptr @type..func_8_9_8_9 }, %imethod.0 { ptr @go..C212, ptr null, ptr @type..func_8_9_8net_0Addr_9 }, %imethod.0 { ptr @go..C216, ptr null, ptr @type..func_8_9_8net_0Addr_9 }, %imethod.0 { ptr @go..C217, ptr null, ptr @type..func_8_9_8error_9 }, %imethod.0 { ptr @go..C218, ptr null, ptr @type..func_8bool_9_8_9 }, %imethod.0 { ptr @go..C227, ptr null, ptr @type..func_8_6_7uint8_9_8int_3error_9 }, %imethod.0 { ptr @go..C242, ptr null, ptr @type..func_8_2go_0llvm_0Msg_9_8error_9 }]
@go_0llvm.compressionMap..d = constant %StructType.0 { %_type.0 { i64 16, i64 16, i32 618047032, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..da, ptr @go..C292, ptr @go..C296, ptr @go_0llvm.compressionMap..p }, %IPST.46 { ptr @go..C323, i64 2, i64 2 } }
@const.130 = private constant [29 x i8] c"\09go.llvm\09llvm.compressionMap\00", align 1
@go..C292 = internal constant { ptr, i64 } { ptr @const.130, i64 28 }
@const.131 = private constant [15 x i8] c"compressionMap\00", align 1
@go..C293 = internal constant { ptr, i64 } { ptr @const.131, i64 14 }
@go..C294 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C295 = internal constant [1 x %method.0] zeroinitializer
@go..C296 = internal constant %uncommonType.0 { ptr @go..C293, ptr @go..C294, %IPST.44 { ptr @go..C295, i64 0, i64 0 } }
@go_0llvm.compressionMap..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1298817929, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C297, ptr null, ptr null }, ptr @go_0llvm.compressionMap..d }, comdat
@const.132 = private constant [30 x i8] c"*\09go.llvm\09llvm.compressionMap\00", align 1
@go..C297 = internal constant { ptr, i64 } { ptr @const.132, i64 29 }
@const.133 = private constant [4 x i8] c"ext\00", align 1
@go..C298 = internal constant { ptr, i64 } { ptr @const.133, i64 3 }
@go..C299 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..map_6string_7int = weak constant %MapType.0 { %_type.0 { i64 8, i64 8, i32 -1122248756, i8 0, i8 8, i8 8, i8 53, ptr null, ptr @gcbits..ba, ptr @go..C300, ptr null, ptr null }, ptr @string..d, ptr @int..d, ptr @type..struct_4_4x_5topbits_b_68x_7uint8_ckeys_b_68x_7string_cvalues_b_68x_7int_coverflow_b_2_4void_5_5, ptr @runtime.strhash..f, i8 16, i8 8, i16 208, i32 12 }, comdat
@const.134 = private constant [15 x i8] c"map[string]int\00", align 1
@go..C300 = internal constant { ptr, i64 } { ptr @const.134, i64 14 }
@type..struct_4_4x_5topbits_b_68x_7uint8_ckeys_b_68x_7string_cvalues_b_68x_7int_coverflow_b_2_4void_5_5 = weak constant %StructType.0 { %_type.0 { i64 208, i64 208, i32 -1581031772, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..kvkbaba, ptr @go..C301, ptr null, ptr null }, %IPST.46 { ptr @go..C311, i64 4, i64 4 } }, comdat
@gcbits..kvkbaba = weak constant [4 x i8] c"\AA\AA\00\02", comdat
@const.135 = private constant [71 x i8] c"struct { topbits [8]uint8; keys [8]string; values [8]int; overflow * }\00", align 1
@go..C301 = internal constant { ptr, i64 } { ptr @const.135, i64 70 }
@const.136 = private constant [8 x i8] c"topbits\00", align 1
@go..C302 = internal constant { ptr, i64 } { ptr @const.136, i64 7 }
@type.._68x_7uint8 = weak constant %ArrayType.0 { %_type.0 { i64 8, i64 0, i32 529264193, i8 8, i8 1, i8 1, i8 -111, ptr null, ptr null, ptr @go..C303, ptr null, ptr null }, ptr @uint8..d, ptr @type.._6_7uint8, i64 8 }, comdat
@const.137 = private constant [9 x i8] c"[8]uint8\00", align 1
@go..C303 = internal constant { ptr, i64 } { ptr @const.137, i64 8 }
@const.138 = private constant [5 x i8] c"keys\00", align 1
@go..C304 = internal constant { ptr, i64 } { ptr @const.138, i64 4 }
@type.._68x_7string = weak constant %ArrayType.0 { %_type.0 { i64 128, i64 120, i32 297061699, i8 0, i8 8, i8 8, i8 17, ptr null, ptr @gcbits..vkva, ptr @go..C305, ptr null, ptr null }, ptr @string..d, ptr @type.._6_7string, i64 8 }, comdat
@gcbits..vkva = weak constant [2 x i8] c"UU", comdat
@const.139 = private constant [10 x i8] c"[8]string\00", align 1
@go..C305 = internal constant { ptr, i64 } { ptr @const.139, i64 9 }
@type.._6_7string = weak constant %SliceType.0 { %_type.0 { i64 24, i64 8, i32 -1998952792, i8 0, i8 8, i8 8, i8 23, ptr null, ptr @gcbits..ba, ptr @go..C306, ptr null, ptr null }, ptr @string..d }, comdat
@const.140 = private constant [9 x i8] c"[]string\00", align 1
@go..C306 = internal constant { ptr, i64 } { ptr @const.140, i64 8 }
@const.141 = private constant [7 x i8] c"values\00", align 1
@go..C307 = internal constant { ptr, i64 } { ptr @const.141, i64 6 }
@type.._68x_7int = weak constant %ArrayType.0 { %_type.0 { i64 64, i64 0, i32 1753408083, i8 8, i8 8, i8 8, i8 -111, ptr null, ptr null, ptr @go..C308, ptr null, ptr null }, ptr @int..d, ptr @type.._6_7int, i64 8 }, comdat
@const.142 = private constant [7 x i8] c"[8]int\00", align 1
@go..C308 = internal constant { ptr, i64 } { ptr @const.142, i64 6 }
@type.._6_7int = weak constant %SliceType.0 { %_type.0 { i64 24, i64 8, i32 876704048, i8 0, i8 8, i8 8, i8 23, ptr null, ptr @gcbits..ba, ptr @go..C309, ptr null, ptr null }, ptr @int..d }, comdat
@const.143 = private constant [6 x i8] c"[]int\00", align 1
@go..C309 = internal constant { ptr, i64 } { ptr @const.143, i64 5 }
@const.144 = private constant [9 x i8] c"overflow\00", align 1
@go..C310 = internal constant { ptr, i64 } { ptr @const.144, i64 8 }
@unsafe.Pointer..d = external constant %_type.0
@go..C311 = internal constant [4 x %structField.0] [%structField.0 { ptr @go..C302, ptr null, ptr @type.._68x_7uint8, ptr null, i64 0 }, %structField.0 { ptr @go..C304, ptr null, ptr @type.._68x_7string, ptr null, i64 16 }, %structField.0 { ptr @go..C307, ptr null, ptr @type.._68x_7int, ptr null, i64 272 }, %structField.0 { ptr @go..C310, ptr null, ptr @unsafe.Pointer..d, ptr null, i64 400 }]
@runtime.strhash..f = external constant %functionDescriptor.0
@go..C312 = internal constant { ptr, i64 } { ptr @const.98, i64 3 }
@go..C313 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..map_6string_7uint16 = weak constant %MapType.0 { %_type.0 { i64 8, i64 8, i32 -1922220502, i8 0, i8 8, i8 8, i8 53, ptr null, ptr @gcbits..ba, ptr @go..C314, ptr null, ptr null }, ptr @string..d, ptr @uint16..d, ptr @type..struct_4_4x_5topbits_b_68x_7uint8_ckeys_b_68x_7string_cvalues_b_68x_7uint16_coverflow_b_2_4void_5_5, ptr @runtime.strhash..f, i8 16, i8 2, i16 160, i32 12 }, comdat
@const.145 = private constant [18 x i8] c"map[string]uint16\00", align 1
@go..C314 = internal constant { ptr, i64 } { ptr @const.145, i64 17 }
@type..struct_4_4x_5topbits_b_68x_7uint8_ckeys_b_68x_7string_cvalues_b_68x_7uint16_coverflow_b_2_4void_5_5 = weak constant %StructType.0 { %_type.0 { i64 160, i64 160, i32 -1410323868, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..kvkra, ptr @go..C315, ptr null, ptr null }, %IPST.46 { ptr @go..C322, i64 4, i64 4 } }, comdat
@gcbits..kvkra = weak constant [3 x i8] c"\AA\AA\08", comdat
@const.146 = private constant [74 x i8] c"struct { topbits [8]uint8; keys [8]string; values [8]uint16; overflow * }\00", align 1
@go..C315 = internal constant { ptr, i64 } { ptr @const.146, i64 73 }
@go..C316 = internal constant { ptr, i64 } { ptr @const.136, i64 7 }
@go..C317 = internal constant { ptr, i64 } { ptr @const.138, i64 4 }
@go..C318 = internal constant { ptr, i64 } { ptr @const.141, i64 6 }
@type.._68x_7uint16 = weak constant %ArrayType.0 { %_type.0 { i64 16, i64 0, i32 153464591, i8 8, i8 2, i8 2, i8 -111, ptr null, ptr null, ptr @go..C319, ptr null, ptr null }, ptr @uint16..d, ptr @type.._6_7uint16, i64 8 }, comdat
@const.147 = private constant [10 x i8] c"[8]uint16\00", align 1
@go..C319 = internal constant { ptr, i64 } { ptr @const.147, i64 9 }
@type.._6_7uint16 = weak constant %SliceType.0 { %_type.0 { i64 24, i64 8, i32 76732302, i8 0, i8 8, i8 8, i8 23, ptr null, ptr @gcbits..ba, ptr @go..C320, ptr null, ptr null }, ptr @uint16..d }, comdat
@const.148 = private constant [9 x i8] c"[]uint16\00", align 1
@go..C320 = internal constant { ptr, i64 } { ptr @const.148, i64 8 }
@go..C321 = internal constant { ptr, i64 } { ptr @const.144, i64 8 }
@go..C322 = internal constant [4 x %structField.0] [%structField.0 { ptr @go..C316, ptr null, ptr @type.._68x_7uint8, ptr null, i64 0 }, %structField.0 { ptr @go..C317, ptr null, ptr @type.._68x_7string, ptr null, i64 16 }, %structField.0 { ptr @go..C318, ptr null, ptr @type.._68x_7uint16, ptr null, i64 272 }, %structField.0 { ptr @go..C321, ptr null, ptr @unsafe.Pointer..d, ptr null, i64 304 }]
@go..C323 = internal constant [2 x %structField.0] [%structField.0 { ptr @go..C298, ptr @go..C299, ptr @type..map_6string_7int, ptr null, i64 0 }, %structField.0 { ptr @go..C312, ptr @go..C313, ptr @type..map_6string_7uint16, ptr null, i64 16 }]
@go_0llvm.Config..d = constant %StructType.0 { %_type.0 { i64 248, i64 248, i32 1742215688, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..ffncgFb, ptr @go..C324, ptr @go..C328, ptr @go_0llvm.Config..p }, %IPST.46 { ptr @go..C444, i64 19, i64 19 } }
@gcbits..ffncgFb = weak constant [4 x i8] c"\A54a~", comdat
@const.149 = private constant [21 x i8] c"\09go.llvm\09llvm.Config\00", align 1
@go..C324 = internal constant { ptr, i64 } { ptr @const.149, i64 20 }
@const.150 = private constant [7 x i8] c"Config\00", align 1
@go..C325 = internal constant { ptr, i64 } { ptr @const.150, i64 6 }
@go..C326 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C327 = internal constant [1 x %method.0] zeroinitializer
@go..C328 = internal constant %uncommonType.0 { ptr @go..C325, ptr @go..C326, %IPST.44 { ptr @go..C327, i64 0, i64 0 } }
@go_0llvm.Config..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 2105647241, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C329, ptr null, ptr null }, ptr @go_0llvm.Config..d }, comdat
@const.151 = private constant [22 x i8] c"*\09go.llvm\09llvm.Config\00", align 1
@go..C329 = internal constant { ptr, i64 } { ptr @const.151, i64 21 }
@const.152 = private constant [5 x i8] c"Zone\00", align 1
@go..C330 = internal constant { ptr, i64 } { ptr @const.152, i64 4 }
@const.153 = private constant [12 x i8] c"ListenHosts\00", align 1
@go..C331 = internal constant { ptr, i64 } { ptr @const.153, i64 11 }
@go..C332 = internal constant { ptr, i64 } { ptr @const.59, i64 4 }
@const.154 = private constant [5 x i8] c"Root\00", align 1
@go..C333 = internal constant { ptr, i64 } { ptr @const.154, i64 4 }
@const.155 = private constant [6 x i8] c"Debug\00", align 1
@go..C334 = internal constant { ptr, i64 } { ptr @const.155, i64 5 }
@const.156 = private constant [11 x i8] c"Stacktrace\00", align 1
@go..C335 = internal constant { ptr, i64 } { ptr @const.156, i64 10 }
@const.157 = private constant [10 x i8] c"Transport\00", align 1
@go..C336 = internal constant { ptr, i64 } { ptr @const.157, i64 9 }
@const.158 = private constant [24 x i8] c"HTTPRequestValidateFunc\00", align 1
@go..C337 = internal constant { ptr, i64 } { ptr @const.158, i64 23 }
@type..func_8_2net_1http_0Request_9_8bool_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 2015603048, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C338, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C339, i64 1, i64 1 }, %IPST.45 { ptr @go..C340, i64 1, i64 1 } }, comdat
@const.159 = private constant [36 x i8] c"func(*\09net_1http\09http.Request) bool\00", align 1
@go..C338 = internal constant { ptr, i64 } { ptr @const.159, i64 35 }
@net_1http.Request..p = external constant %PtrType.0
@go..C339 = internal constant [1 x ptr] [ptr @net_1http.Request..p]
@go..C340 = internal constant [1 x ptr] [ptr @bool..d]
@const.160 = private constant [12 x i8] c"FilterFuncs\00", align 1
@go..C341 = internal constant { ptr, i64 } { ptr @const.160, i64 11 }
@type.._6_7go_0llvm_0FilterFunc = weak constant %SliceType.0 { %_type.0 { i64 24, i64 8, i32 -2058011432, i8 0, i8 8, i8 8, i8 23, ptr null, ptr @gcbits..ba, ptr @go..C342, ptr null, ptr null }, ptr @go_0llvm.FilterFunc..d }, comdat
@const.161 = private constant [27 x i8] c"[]\09go.llvm\09llvm.FilterFunc\00", align 1
@go..C342 = internal constant { ptr, i64 } { ptr @const.161, i64 26 }
@go_0llvm.FilterFunc..d = constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -2058011446, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C343, ptr @go..C347, ptr @go_0llvm.FilterFunc..p }, i8 0, %IPST.45 { ptr @go..C380, i64 2, i64 2 }, %IPST.45 { ptr @go..C381, i64 1, i64 1 } }
@const.162 = private constant [25 x i8] c"\09go.llvm\09llvm.FilterFunc\00", align 1
@go..C343 = internal constant { ptr, i64 } { ptr @const.162, i64 24 }
@const.163 = private constant [11 x i8] c"FilterFunc\00", align 1
@go..C344 = internal constant { ptr, i64 } { ptr @const.163, i64 10 }
@go..C345 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C346 = internal constant [1 x %method.0] zeroinitializer
@go..C347 = internal constant %uncommonType.0 { ptr @go..C344, ptr @go..C345, %IPST.44 { ptr @go..C346, i64 0, i64 0 } }
@go_0llvm.FilterFunc..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1431555241, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C348, ptr null, ptr null }, ptr @go_0llvm.FilterFunc..d }, comdat
@const.164 = private constant [26 x i8] c"*\09go.llvm\09llvm.FilterFunc\00", align 1
@go..C348 = internal constant { ptr, i64 } { ptr @const.164, i64 25 }
@context.Context..d = external constant %InterfaceType.0
@go_0llvm.Request..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1678514439, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C349, ptr null, ptr null }, ptr @go_0llvm.Request..d }, comdat
@const.165 = private constant [23 x i8] c"*\09go.llvm\09llvm.Request\00", align 1
@go..C349 = internal constant { ptr, i64 } { ptr @const.165, i64 22 }
@go_0llvm.Request..d = constant %StructType.0 { %_type.0 { i64 128, i64 120, i32 -373342609, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.Request..eq..f, ptr @gcbits..pkva, ptr @go..C350, ptr @go..C354, ptr @go_0llvm.Request..p }, %IPST.46 { ptr @go..C379, i64 11, i64 11 } }
@go_0llvm.Request..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.Request..eq to i64) }
@gcbits..pkva = weak constant [2 x i8] c"OU", comdat
@const.166 = private constant [22 x i8] c"\09go.llvm\09llvm.Request\00", align 1
@go..C350 = internal constant { ptr, i64 } { ptr @const.166, i64 21 }
@const.167 = private constant [8 x i8] c"Request\00", align 1
@go..C351 = internal constant { ptr, i64 } { ptr @const.167, i64 7 }
@go..C352 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C353 = internal constant [1 x %method.0] zeroinitializer
@go..C354 = internal constant %uncommonType.0 { ptr @go..C351, ptr @go..C352, %IPST.44 { ptr @go..C353, i64 0, i64 0 } }
@const.168 = private constant [4 x i8] c"Req\00", align 1
@go..C355 = internal constant { ptr, i64 } { ptr @const.168, i64 3 }
@const.169 = private constant [2 x i8] c"W\00", align 1
@go..C356 = internal constant { ptr, i64 } { ptr @const.169, i64 1 }
@go..C357 = internal constant { ptr, i64 } { ptr @const.152, i64 4 }
@const.170 = private constant [5 x i8] c"size\00", align 1
@go..C358 = internal constant { ptr, i64 } { ptr @const.170, i64 4 }
@go..C359 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.171 = private constant [3 x i8] c"do\00", align 1
@go..C360 = internal constant { ptr, i64 } { ptr @const.171, i64 2 }
@go..C361 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.172 = private constant [7 x i8] c"family\00", align 1
@go..C362 = internal constant { ptr, i64 } { ptr @const.172, i64 6 }
@go..C363 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@int8..d = weak constant %_type.0 { i64 1, i64 0, i32 1812276124, i8 8, i8 1, i8 1, i8 -125, ptr @runtime.memequal8..f, ptr null, ptr @go..C364, ptr @go..C367, ptr @int8..p }, comdat
@const.173 = private constant [5 x i8] c"int8\00", align 1
@go..C364 = internal constant { ptr, i64 } { ptr @const.173, i64 4 }
@go..C365 = internal constant { ptr, i64 } { ptr @const.173, i64 4 }
@go..C366 = internal constant [1 x %method.0] zeroinitializer
@go..C367 = internal constant %uncommonType.0 { ptr @go..C365, ptr null, %IPST.44 { ptr @go..C366, i64 0, i64 0 } }
@int8..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1068353079, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C368, ptr null, ptr null }, ptr @int8..d }, comdat
@const.174 = private constant [6 x i8] c"*int8\00", align 1
@go..C368 = internal constant { ptr, i64 } { ptr @const.174, i64 5 }
@const.175 = private constant [5 x i8] c"name\00", align 1
@go..C369 = internal constant { ptr, i64 } { ptr @const.175, i64 4 }
@go..C370 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.176 = private constant [3 x i8] c"ip\00", align 1
@go..C371 = internal constant { ptr, i64 } { ptr @const.176, i64 2 }
@go..C372 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.177 = private constant [5 x i8] c"port\00", align 1
@go..C373 = internal constant { ptr, i64 } { ptr @const.177, i64 4 }
@go..C374 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.178 = private constant [10 x i8] c"localPort\00", align 1
@go..C375 = internal constant { ptr, i64 } { ptr @const.178, i64 9 }
@go..C376 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.179 = private constant [8 x i8] c"localIP\00", align 1
@go..C377 = internal constant { ptr, i64 } { ptr @const.179, i64 7 }
@go..C378 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C379 = internal constant [11 x %structField.0] [%structField.0 { ptr @go..C355, ptr null, ptr @go_0llvm.Msg..p, ptr null, i64 0 }, %structField.0 { ptr @go..C356, ptr null, ptr @go_0llvm.ResponseWriter..d, ptr null, i64 16 }, %structField.0 { ptr @go..C357, ptr null, ptr @string..d, ptr null, i64 48 }, %structField.0 { ptr @go..C358, ptr @go..C359, ptr @uint16..d, ptr null, i64 80 }, %structField.0 { ptr @go..C360, ptr @go..C361, ptr @bool..d, ptr null, i64 84 }, %structField.0 { ptr @go..C362, ptr @go..C363, ptr @int8..d, ptr null, i64 86 }, %structField.0 { ptr @go..C369, ptr @go..C370, ptr @string..d, ptr null, i64 96 }, %structField.0 { ptr @go..C371, ptr @go..C372, ptr @string..d, ptr null, i64 128 }, %structField.0 { ptr @go..C373, ptr @go..C374, ptr @string..d, ptr null, i64 160 }, %structField.0 { ptr @go..C375, ptr @go..C376, ptr @string..d, ptr null, i64 192 }, %structField.0 { ptr @go..C377, ptr @go..C378, ptr @string..d, ptr null, i64 224 }]
@go..C380 = internal constant [2 x ptr] [ptr @context.Context..d, ptr @go_0llvm.Request..p]
@go..C381 = internal constant [1 x ptr] [ptr @bool..d]
@const.180 = private constant [9 x i8] c"ViewName\00", align 1
@go..C382 = internal constant { ptr, i64 } { ptr @const.180, i64 8 }
@const.181 = private constant [12 x i8] c"ReadTimeout\00", align 1
@go..C383 = internal constant { ptr, i64 } { ptr @const.181, i64 11 }
@time.Duration..d = external constant %_type.0
@const.182 = private constant [13 x i8] c"WriteTimeout\00", align 1
@go..C384 = internal constant { ptr, i64 } { ptr @const.182, i64 12 }
@const.183 = private constant [12 x i8] c"IdleTimeout\00", align 1
@go..C385 = internal constant { ptr, i64 } { ptr @const.183, i64 11 }
@const.184 = private constant [11 x i8] c"TsigSecret\00", align 1
@go..C386 = internal constant { ptr, i64 } { ptr @const.184, i64 10 }
@type..map_6string_7string = weak constant %MapType.0 { %_type.0 { i64 8, i64 8, i32 297061700, i8 0, i8 8, i8 8, i8 53, ptr null, ptr @gcbits..ba, ptr @go..C387, ptr null, ptr null }, ptr @string..d, ptr @string..d, ptr @type..struct_4_4x_5topbits_b_68x_7uint8_ckeys_b_68x_7string_cvalues_b_68x_7string_coverflow_b_2_4void_5_5, ptr @runtime.strhash..f, i8 16, i8 16, i16 272, i32 12 }, comdat
@const.185 = private constant [18 x i8] c"map[string]string\00", align 1
@go..C387 = internal constant { ptr, i64 } { ptr @const.185, i64 17 }
@type..struct_4_4x_5topbits_b_68x_7uint8_ckeys_b_68x_7string_cvalues_b_68x_7string_coverflow_b_2_4void_5_5 = weak constant %StructType.0 { %_type.0 { i64 272, i64 272, i32 887229860, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..kvkvkvka, ptr @go..C388, ptr null, ptr null }, %IPST.46 { ptr @go..C393, i64 4, i64 4 } }, comdat
@gcbits..kvkvkvka = weak constant [5 x i8] c"\AA\AA\AA\AA\02", comdat
@const.186 = private constant [74 x i8] c"struct { topbits [8]uint8; keys [8]string; values [8]string; overflow * }\00", align 1
@go..C388 = internal constant { ptr, i64 } { ptr @const.186, i64 73 }
@go..C389 = internal constant { ptr, i64 } { ptr @const.136, i64 7 }
@go..C390 = internal constant { ptr, i64 } { ptr @const.138, i64 4 }
@go..C391 = internal constant { ptr, i64 } { ptr @const.141, i64 6 }
@go..C392 = internal constant { ptr, i64 } { ptr @const.144, i64 8 }
@go..C393 = internal constant [4 x %structField.0] [%structField.0 { ptr @go..C389, ptr null, ptr @type.._68x_7uint8, ptr null, i64 0 }, %structField.0 { ptr @go..C390, ptr null, ptr @type.._68x_7string, ptr null, i64 16 }, %structField.0 { ptr @go..C391, ptr null, ptr @type.._68x_7string, ptr null, i64 272 }, %structField.0 { ptr @go..C392, ptr null, ptr @unsafe.Pointer..d, ptr null, i64 528 }]
@const.187 = private constant [7 x i8] c"Plugin\00", align 1
@go..C394 = internal constant { ptr, i64 } { ptr @const.187, i64 6 }
@type.._6_7go_0llvm_0Plugin = weak constant %SliceType.0 { %_type.0 { i64 24, i64 8, i32 -1978908885, i8 0, i8 8, i8 8, i8 23, ptr null, ptr @gcbits..ba, ptr @go..C395, ptr null, ptr null }, ptr @go_0llvm.Plugin..d }, comdat
@const.188 = private constant [23 x i8] c"[]\09go.llvm\09llvm.Plugin\00", align 1
@go..C395 = internal constant { ptr, i64 } { ptr @const.188, i64 22 }
@go_0llvm.Plugin..d = constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1978908899, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C396, ptr @go..C400, ptr @go_0llvm.Plugin..p }, i8 0, %IPST.45 { ptr @go..C414, i64 1, i64 1 }, %IPST.45 { ptr @go..C415, i64 1, i64 1 } }
@const.189 = private constant [21 x i8] c"\09go.llvm\09llvm.Plugin\00", align 1
@go..C396 = internal constant { ptr, i64 } { ptr @const.189, i64 20 }
@go..C397 = internal constant { ptr, i64 } { ptr @const.187, i64 6 }
@go..C398 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C399 = internal constant [1 x %method.0] zeroinitializer
@go..C400 = internal constant %uncommonType.0 { ptr @go..C397, ptr @go..C398, %IPST.44 { ptr @go..C399, i64 0, i64 0 } }
@go_0llvm.Plugin..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1597771303, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C401, ptr null, ptr null }, ptr @go_0llvm.Plugin..d }, comdat
@const.190 = private constant [22 x i8] c"*\09go.llvm\09llvm.Plugin\00", align 1
@go..C401 = internal constant { ptr, i64 } { ptr @const.190, i64 21 }
@go_0llvm.Handler..d = constant %InterfaceType.0 { %_type.0 { i64 16, i64 16, i32 -1808603982, i8 0, i8 8, i8 8, i8 20, ptr @runtime.interequal..f, ptr @gcbits..da, ptr @go..C402, ptr @go..C406, ptr @go_0llvm.Handler..p }, %IPST.47 { ptr @go..C413, i64 2, i64 2 } }
@const.191 = private constant [22 x i8] c"\09go.llvm\09llvm.Handler\00", align 1
@go..C402 = internal constant { ptr, i64 } { ptr @const.191, i64 21 }
@const.192 = private constant [8 x i8] c"Handler\00", align 1
@go..C403 = internal constant { ptr, i64 } { ptr @const.192, i64 7 }
@go..C404 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C405 = internal constant [1 x %method.0] zeroinitializer
@go..C406 = internal constant %uncommonType.0 { ptr @go..C403, ptr @go..C404, %IPST.44 { ptr @go..C405, i64 0, i64 0 } }
@go_0llvm.Handler..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1127107369, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C407, ptr null, ptr null }, ptr @go_0llvm.Handler..d }, comdat
@const.193 = private constant [23 x i8] c"*\09go.llvm\09llvm.Handler\00", align 1
@go..C407 = internal constant { ptr, i64 } { ptr @const.193, i64 22 }
@go..C408 = internal constant { ptr, i64 } { ptr @const.9, i64 4 }
@const.194 = private constant [9 x i8] c"ServeDNS\00", align 1
@go..C409 = internal constant { ptr, i64 } { ptr @const.194, i64 8 }
@type..func_8context_0Context_3go_0llvm_0ResponseWriter_3_2go_0llvm_0Msg_9_8int_3error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -575564952, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C410, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C411, i64 3, i64 3 }, %IPST.45 { ptr @go..C412, i64 2, i64 2 } }, comdat
@const.195 = private constant [94 x i8] c"func(\09context\09context.Context, \09go.llvm\09llvm.ResponseWriter, *\09go.llvm\09llvm.Msg) (int, error)\00", align 1
@go..C410 = internal constant { ptr, i64 } { ptr @const.195, i64 93 }
@go..C411 = internal constant [3 x ptr] [ptr @context.Context..d, ptr @go_0llvm.ResponseWriter..d, ptr @go_0llvm.Msg..p]
@go..C412 = internal constant [2 x ptr] [ptr @int..d, ptr @error..d]
@go..C413 = internal constant [2 x %imethod.0] [%imethod.0 { ptr @go..C408, ptr null, ptr @type..func_8_9_8string_9 }, %imethod.0 { ptr @go..C409, ptr null, ptr @type..func_8context_0Context_3go_0llvm_0ResponseWriter_3_2go_0llvm_0Msg_9_8int_3error_9 }]
@go..C414 = internal constant [1 x ptr] [ptr @go_0llvm.Handler..d]
@go..C415 = internal constant [1 x ptr] [ptr @go_0llvm.Handler..d]
@const.196 = private constant [12 x i8] c"pluginChain\00", align 1
@go..C416 = internal constant { ptr, i64 } { ptr @const.196, i64 11 }
@go..C417 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.197 = private constant [9 x i8] c"registry\00", align 1
@go..C418 = internal constant { ptr, i64 } { ptr @const.197, i64 8 }
@go..C419 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..map_6string_7go_0llvm_0Handler = weak constant %MapType.0 { %_type.0 { i64 8, i64 8, i32 487410524, i8 0, i8 8, i8 8, i8 53, ptr null, ptr @gcbits..ba, ptr @go..C420, ptr null, ptr null }, ptr @string..d, ptr @go_0llvm.Handler..d, ptr @type..struct_4_4x_5topbits_b_68x_7uint8_ckeys_b_68x_7string_cvalues_b_68x_7go_0llvm_0Handler_coverflow_b_2_4void_5_5, ptr @runtime.strhash..f, i8 16, i8 16, i16 272, i32 12 }, comdat
@const.198 = private constant [33 x i8] c"map[string]\09go.llvm\09llvm.Handler\00", align 1
@go..C420 = internal constant { ptr, i64 } { ptr @const.198, i64 32 }
@type..struct_4_4x_5topbits_b_68x_7uint8_ckeys_b_68x_7string_cvalues_b_68x_7go_0llvm_0Handler_coverflow_b_2_4void_5_5 = weak constant %StructType.0 { %_type.0 { i64 272, i64 272, i32 -1611542364, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..kvkDFFpa, ptr @go..C421, ptr null, ptr null }, %IPST.46 { ptr @go..C428, i64 4, i64 4 } }, comdat
@gcbits..kvkDFFpa = weak constant [5 x i8] c"\AA\AA\FE\FF\03", comdat
@const.199 = private constant [89 x i8] c"struct { topbits [8]uint8; keys [8]string; values [8]\09go.llvm\09llvm.Handler; overflow * }\00", align 1
@go..C421 = internal constant { ptr, i64 } { ptr @const.199, i64 88 }
@go..C422 = internal constant { ptr, i64 } { ptr @const.136, i64 7 }
@go..C423 = internal constant { ptr, i64 } { ptr @const.138, i64 4 }
@go..C424 = internal constant { ptr, i64 } { ptr @const.141, i64 6 }
@type.._68x_7go_0llvm_0Handler = weak constant %ArrayType.0 { %_type.0 { i64 128, i64 128, i32 677759347, i8 0, i8 8, i8 8, i8 17, ptr null, ptr @gcbits..FFFb, ptr @go..C425, ptr null, ptr null }, ptr @go_0llvm.Handler..d, ptr @type.._6_7go_0llvm_0Handler, i64 8 }, comdat
@gcbits..FFFb = weak constant [2 x i8] c"\FF\FF", comdat
@const.200 = private constant [25 x i8] c"[8]\09go.llvm\09llvm.Handler\00", align 1
@go..C425 = internal constant { ptr, i64 } { ptr @const.200, i64 24 }
@type.._6_7go_0llvm_0Handler = weak constant %SliceType.0 { %_type.0 { i64 24, i64 8, i32 -1808603968, i8 0, i8 8, i8 8, i8 23, ptr null, ptr @gcbits..ba, ptr @go..C426, ptr null, ptr null }, ptr @go_0llvm.Handler..d }, comdat
@const.201 = private constant [24 x i8] c"[]\09go.llvm\09llvm.Handler\00", align 1
@go..C426 = internal constant { ptr, i64 } { ptr @const.201, i64 23 }
@go..C427 = internal constant { ptr, i64 } { ptr @const.144, i64 8 }
@go..C428 = internal constant [4 x %structField.0] [%structField.0 { ptr @go..C422, ptr null, ptr @type.._68x_7uint8, ptr null, i64 0 }, %structField.0 { ptr @go..C423, ptr null, ptr @type.._68x_7string, ptr null, i64 16 }, %structField.0 { ptr @go..C424, ptr null, ptr @type.._68x_7go_0llvm_0Handler, ptr null, i64 272 }, %structField.0 { ptr @go..C427, ptr null, ptr @unsafe.Pointer..d, ptr null, i64 528 }]
@const.202 = private constant [19 x i8] c"firstConfigInBlock\00", align 1
@go..C429 = internal constant { ptr, i64 } { ptr @const.202, i64 18 }
@go..C430 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.203 = private constant [14 x i8] c"metaCollector\00", align 1
@go..C431 = internal constant { ptr, i64 } { ptr @const.203, i64 13 }
@go..C432 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go_0llvm.MetadataCollector..d = constant %InterfaceType.0 { %_type.0 { i64 16, i64 16, i32 -1617574818, i8 0, i8 8, i8 8, i8 20, ptr @runtime.interequal..f, ptr @gcbits..da, ptr @go..C433, ptr @go..C437, ptr @go_0llvm.MetadataCollector..p }, %IPST.47 { ptr @go..C443, i64 1, i64 1 } }
@const.204 = private constant [32 x i8] c"\09go.llvm\09llvm.MetadataCollector\00", align 1
@go..C433 = internal constant { ptr, i64 } { ptr @const.204, i64 31 }
@const.205 = private constant [18 x i8] c"MetadataCollector\00", align 1
@go..C434 = internal constant { ptr, i64 } { ptr @const.205, i64 17 }
@go..C435 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C436 = internal constant [1 x %method.0] zeroinitializer
@go..C437 = internal constant %uncommonType.0 { ptr @go..C434, ptr @go..C435, %IPST.44 { ptr @go..C436, i64 0, i64 0 } }
@go_0llvm.MetadataCollector..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -111393303, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C438, ptr null, ptr null }, ptr @go_0llvm.MetadataCollector..d }, comdat
@const.206 = private constant [33 x i8] c"*\09go.llvm\09llvm.MetadataCollector\00", align 1
@go..C438 = internal constant { ptr, i64 } { ptr @const.206, i64 32 }
@const.207 = private constant [8 x i8] c"Collect\00", align 1
@go..C439 = internal constant { ptr, i64 } { ptr @const.207, i64 7 }
@type..func_8context_0Context_3go_0llvm_0Request_9_8context_0Context_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1528556520, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C440, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C441, i64 2, i64 2 }, %IPST.45 { ptr @go..C442, i64 1, i64 1 } }, comdat
@const.208 = private constant [79 x i8] c"func(\09context\09context.Context, \09go.llvm\09llvm.Request) \09context\09context.Context\00", align 1
@go..C440 = internal constant { ptr, i64 } { ptr @const.208, i64 78 }
@go..C441 = internal constant [2 x ptr] [ptr @context.Context..d, ptr @go_0llvm.Request..d]
@go..C442 = internal constant [1 x ptr] [ptr @context.Context..d]
@go..C443 = internal constant [1 x %imethod.0] [%imethod.0 { ptr @go..C439, ptr null, ptr @type..func_8context_0Context_3go_0llvm_0Request_9_8context_0Context_9 }]
@go..C444 = internal constant [19 x %structField.0] [%structField.0 { ptr @go..C330, ptr null, ptr @string..d, ptr null, i64 0 }, %structField.0 { ptr @go..C331, ptr null, ptr @type.._6_7string, ptr null, i64 32 }, %structField.0 { ptr @go..C332, ptr null, ptr @string..d, ptr null, i64 80 }, %structField.0 { ptr @go..C333, ptr null, ptr @string..d, ptr null, i64 112 }, %structField.0 { ptr @go..C334, ptr null, ptr @bool..d, ptr null, i64 144 }, %structField.0 { ptr @go..C335, ptr null, ptr @bool..d, ptr null, i64 146 }, %structField.0 { ptr @go..C336, ptr null, ptr @string..d, ptr null, i64 160 }, %structField.0 { ptr @go..C337, ptr null, ptr @type..func_8_2net_1http_0Request_9_8bool_9, ptr null, i64 192 }, %structField.0 { ptr @go..C341, ptr null, ptr @type.._6_7go_0llvm_0FilterFunc, ptr null, i64 208 }, %structField.0 { ptr @go..C382, ptr null, ptr @string..d, ptr null, i64 256 }, %structField.0 { ptr @go..C383, ptr null, ptr @time.Duration..d, ptr null, i64 288 }, %structField.0 { ptr @go..C384, ptr null, ptr @time.Duration..d, ptr null, i64 304 }, %structField.0 { ptr @go..C385, ptr null, ptr @time.Duration..d, ptr null, i64 320 }, %structField.0 { ptr @go..C386, ptr null, ptr @type..map_6string_7string, ptr null, i64 336 }, %structField.0 { ptr @go..C394, ptr null, ptr @type.._6_7go_0llvm_0Plugin, ptr null, i64 352 }, %structField.0 { ptr @go..C416, ptr @go..C417, ptr @go_0llvm.Handler..d, ptr null, i64 400 }, %structField.0 { ptr @go..C418, ptr @go..C419, ptr @type..map_6string_7go_0llvm_0Handler, ptr null, i64 432 }, %structField.0 { ptr @go..C429, ptr @go..C430, ptr @go_0llvm.Config..p, ptr null, i64 448 }, %structField.0 { ptr @go..C431, ptr @go..C432, ptr @go_0llvm.MetadataCollector..d, ptr null, i64 464 }]
@go_0llvm.HandlerFunc..d = constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1244774564, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C445, ptr @go..C449, ptr @go_0llvm.HandlerFunc..p }, i8 0, %IPST.45 { ptr @go..C451, i64 3, i64 3 }, %IPST.45 { ptr @go..C452, i64 2, i64 2 } }
@const.209 = private constant [26 x i8] c"\09go.llvm\09llvm.HandlerFunc\00", align 1
@go..C445 = internal constant { ptr, i64 } { ptr @const.209, i64 25 }
@const.210 = private constant [12 x i8] c"HandlerFunc\00", align 1
@go..C446 = internal constant { ptr, i64 } { ptr @const.210, i64 11 }
@go..C447 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C448 = internal constant [1 x %method.0] zeroinitializer
@go..C449 = internal constant %uncommonType.0 { ptr @go..C446, ptr @go..C447, %IPST.44 { ptr @go..C448, i64 0, i64 0 } }
@go_0llvm.HandlerFunc..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1558443447, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C450, ptr null, ptr null }, ptr @go_0llvm.HandlerFunc..d }, comdat
@const.211 = private constant [27 x i8] c"*\09go.llvm\09llvm.HandlerFunc\00", align 1
@go..C450 = internal constant { ptr, i64 } { ptr @const.211, i64 26 }
@go..C451 = internal constant [3 x ptr] [ptr @context.Context..d, ptr @go_0llvm.ResponseWriter..d, ptr @go_0llvm.Msg..p]
@go..C452 = internal constant [2 x ptr] [ptr @int..d, ptr @error..d]
@go_0llvm.ScrubWriter..d = constant %StructType.0 { %_type.0 { i64 24, i64 24, i32 834123378, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.ScrubWriter..eq..f, ptr @gcbits..ha, ptr @go..C453, ptr @go..C483, ptr @go_0llvm.ScrubWriter..p }, %IPST.46 { ptr @go..C517, i64 2, i64 2 } }
@go_0llvm.ScrubWriter..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.ScrubWriter..eq to i64) }
@gcbits..ha = weak constant [1 x i8] c"\07", comdat
@const.212 = private constant [26 x i8] c"\09go.llvm\09llvm.ScrubWriter\00", align 1
@go..C453 = internal constant { ptr, i64 } { ptr @const.212, i64 25 }
@const.213 = private constant [12 x i8] c"ScrubWriter\00", align 1
@go..C454 = internal constant { ptr, i64 } { ptr @const.213, i64 11 }
@go..C455 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C456 = internal constant { ptr, i64 } { ptr @const.77, i64 5 }
@type..func_8go_0llvm_0ScrubWriter_9_8error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 2110882824, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C457, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C458, i64 1, i64 1 }, %IPST.45 { ptr @go..C459, i64 1, i64 1 } }, comdat
@const.214 = private constant [38 x i8] c"func(\09go.llvm\09llvm.ScrubWriter) error\00", align 1
@go..C457 = internal constant { ptr, i64 } { ptr @const.214, i64 37 }
@go..C458 = internal constant [1 x ptr] [ptr @go_0llvm.ScrubWriter..d]
@go..C459 = internal constant [1 x ptr] [ptr @error..d]
@go..C460 = internal constant { ptr, i64 } { ptr @const.83, i64 6 }
@type..func_8go_0llvm_0ScrubWriter_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 922144328, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C461, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C462, i64 1, i64 1 }, %IPST.45 { ptr @go..C463, i64 0, i64 0 } }, comdat
@const.215 = private constant [32 x i8] c"func(\09go.llvm\09llvm.ScrubWriter)\00", align 1
@go..C461 = internal constant { ptr, i64 } { ptr @const.215, i64 31 }
@go..C462 = internal constant [1 x ptr] [ptr @go_0llvm.ScrubWriter..d]
@go..C463 = internal constant [1 x ptr] zeroinitializer
@go..C464 = internal constant { ptr, i64 } { ptr @const.85, i64 9 }
@type..func_8go_0llvm_0ScrubWriter_9_8net_0Addr_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 955902984, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C465, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C466, i64 1, i64 1 }, %IPST.45 { ptr @go..C467, i64 1, i64 1 } }, comdat
@const.216 = private constant [46 x i8] c"func(\09go.llvm\09llvm.ScrubWriter) \09net\09net.Addr\00", align 1
@go..C465 = internal constant { ptr, i64 } { ptr @const.216, i64 45 }
@go..C466 = internal constant [1 x ptr] [ptr @go_0llvm.ScrubWriter..d]
@go..C467 = internal constant [1 x ptr] [ptr @net.Addr..d]
@go..C468 = internal constant { ptr, i64 } { ptr @const.87, i64 10 }
@go..C469 = internal constant { ptr, i64 } { ptr @const.88, i64 10 }
@go..C470 = internal constant { ptr, i64 } { ptr @const.89, i64 14 }
@type..func_8go_0llvm_0ScrubWriter_3bool_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 560280200, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C471, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C472, i64 2, i64 2 }, %IPST.45 { ptr @go..C473, i64 0, i64 0 } }, comdat
@const.217 = private constant [38 x i8] c"func(\09go.llvm\09llvm.ScrubWriter, bool)\00", align 1
@go..C471 = internal constant { ptr, i64 } { ptr @const.217, i64 37 }
@go..C472 = internal constant [2 x ptr] [ptr @go_0llvm.ScrubWriter..d, ptr @bool..d]
@go..C473 = internal constant [1 x ptr] zeroinitializer
@go..C474 = internal constant { ptr, i64 } { ptr @const.93, i64 5 }
@type..func_8go_0llvm_0ScrubWriter_3_6_7uint8_9_8int_3error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -964277240, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C475, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C476, i64 2, i64 2 }, %IPST.45 { ptr @go..C477, i64 2, i64 2 } }, comdat
@const.218 = private constant [54 x i8] c"func(\09go.llvm\09llvm.ScrubWriter, []uint8) (int, error)\00", align 1
@go..C475 = internal constant { ptr, i64 } { ptr @const.218, i64 53 }
@go..C476 = internal constant [2 x ptr] [ptr @go_0llvm.ScrubWriter..d, ptr @type.._6_7uint8]
@go..C477 = internal constant [2 x ptr] [ptr @int..d, ptr @error..d]
@go..C478 = internal constant { ptr, i64 } { ptr @const.100, i64 8 }
@type..func_8go_0llvm_0ScrubWriter_3_2go_0llvm_0Msg_9_8error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1748337224, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C479, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C480, i64 2, i64 2 }, %IPST.45 { ptr @go..C481, i64 1, i64 1 } }, comdat
@const.219 = private constant [58 x i8] c"func(\09go.llvm\09llvm.ScrubWriter, *\09go.llvm\09llvm.Msg) error\00", align 1
@go..C479 = internal constant { ptr, i64 } { ptr @const.219, i64 57 }
@go..C480 = internal constant [2 x ptr] [ptr @go_0llvm.ScrubWriter..d, ptr @go_0llvm.Msg..p]
@go..C481 = internal constant [1 x ptr] [ptr @error..d]
@go..C482 = internal constant [8 x %method.0] [%method.0 { ptr @go..C456, ptr null, ptr @type..func_8_9_8error_9, ptr @type..func_8go_0llvm_0ScrubWriter_9_8error_9, ptr @go_0llvm.ScrubWriter.Close..stub }, %method.0 { ptr @go..C460, ptr null, ptr @type..func_8_9_8_9, ptr @type..func_8go_0llvm_0ScrubWriter_9_8_9, ptr @go_0llvm.ScrubWriter.Hijack..stub }, %method.0 { ptr @go..C464, ptr null, ptr @type..func_8_9_8net_0Addr_9, ptr @type..func_8go_0llvm_0ScrubWriter_9_8net_0Addr_9, ptr @go_0llvm.ScrubWriter.LocalAddr..stub }, %method.0 { ptr @go..C468, ptr null, ptr @type..func_8_9_8net_0Addr_9, ptr @type..func_8go_0llvm_0ScrubWriter_9_8net_0Addr_9, ptr @go_0llvm.ScrubWriter.RemoteAddr..stub }, %method.0 { ptr @go..C469, ptr null, ptr @type..func_8_9_8error_9, ptr @type..func_8go_0llvm_0ScrubWriter_9_8error_9, ptr @go_0llvm.ScrubWriter.TsigStatus..stub }, %method.0 { ptr @go..C470, ptr null, ptr @type..func_8bool_9_8_9, ptr @type..func_8go_0llvm_0ScrubWriter_3bool_9_8_9, ptr @go_0llvm.ScrubWriter.TsigTimersOnly..stub }, %method.0 { ptr @go..C474, ptr null, ptr @type..func_8_6_7uint8_9_8int_3error_9, ptr @type..func_8go_0llvm_0ScrubWriter_3_6_7uint8_9_8int_3error_9, ptr @go_0llvm.ScrubWriter.Write..stub }, %method.0 { ptr @go..C478, ptr null, ptr @type..func_8_2go_0llvm_0Msg_9_8error_9, ptr @type..func_8go_0llvm_0ScrubWriter_3_2go_0llvm_0Msg_9_8error_9, ptr @go_0llvm.ScrubWriter.WriteMsg..stub }]
@go..C483 = internal constant %uncommonType.0 { ptr @go..C454, ptr @go..C455, %IPST.44 { ptr @go..C482, i64 8, i64 8 } }
@go_0llvm.ScrubWriter..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 461072169, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C484, ptr @go..C512, ptr @type.._2_2go_0llvm_0ScrubWriter }, ptr @go_0llvm.ScrubWriter..d }, comdat
@const.220 = private constant [27 x i8] c"*\09go.llvm\09llvm.ScrubWriter\00", align 1
@go..C484 = internal constant { ptr, i64 } { ptr @const.220, i64 26 }
@go..C485 = internal constant { ptr, i64 } { ptr @const.77, i64 5 }
@type..func_8_2go_0llvm_0ScrubWriter_9_8error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1236821272, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C486, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C487, i64 1, i64 1 }, %IPST.45 { ptr @go..C488, i64 1, i64 1 } }, comdat
@const.221 = private constant [39 x i8] c"func(*\09go.llvm\09llvm.ScrubWriter) error\00", align 1
@go..C486 = internal constant { ptr, i64 } { ptr @const.221, i64 38 }
@go..C487 = internal constant [1 x ptr] [ptr @go_0llvm.ScrubWriter..p]
@go..C488 = internal constant [1 x ptr] [ptr @error..d]
@go..C489 = internal constant { ptr, i64 } { ptr @const.83, i64 6 }
@type..func_8_2go_0llvm_0ScrubWriter_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1869407528, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C490, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C491, i64 1, i64 1 }, %IPST.45 { ptr @go..C492, i64 0, i64 0 } }, comdat
@const.222 = private constant [33 x i8] c"func(*\09go.llvm\09llvm.ScrubWriter)\00", align 1
@go..C490 = internal constant { ptr, i64 } { ptr @const.222, i64 32 }
@go..C491 = internal constant [1 x ptr] [ptr @go_0llvm.ScrubWriter..p]
@go..C492 = internal constant [1 x ptr] zeroinitializer
@go..C493 = internal constant { ptr, i64 } { ptr @const.85, i64 9 }
@type..func_8_2go_0llvm_0ScrubWriter_9_8net_0Addr_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1903166184, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C494, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C495, i64 1, i64 1 }, %IPST.45 { ptr @go..C496, i64 1, i64 1 } }, comdat
@const.223 = private constant [47 x i8] c"func(*\09go.llvm\09llvm.ScrubWriter) \09net\09net.Addr\00", align 1
@go..C494 = internal constant { ptr, i64 } { ptr @const.223, i64 46 }
@go..C495 = internal constant [1 x ptr] [ptr @go_0llvm.ScrubWriter..p]
@go..C496 = internal constant [1 x ptr] [ptr @net.Addr..d]
@go..C497 = internal constant { ptr, i64 } { ptr @const.87, i64 10 }
@go..C498 = internal constant { ptr, i64 } { ptr @const.88, i64 10 }
@go..C499 = internal constant { ptr, i64 } { ptr @const.89, i64 14 }
@type..func_8_2go_0llvm_0ScrubWriter_3bool_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1507543400, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C500, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C501, i64 2, i64 2 }, %IPST.45 { ptr @go..C502, i64 0, i64 0 } }, comdat
@const.224 = private constant [39 x i8] c"func(*\09go.llvm\09llvm.ScrubWriter, bool)\00", align 1
@go..C500 = internal constant { ptr, i64 } { ptr @const.224, i64 38 }
@go..C501 = internal constant [2 x ptr] [ptr @go_0llvm.ScrubWriter..p, ptr @bool..d]
@go..C502 = internal constant [1 x ptr] zeroinitializer
@go..C503 = internal constant { ptr, i64 } { ptr @const.93, i64 5 }
@type..func_8_2go_0llvm_0ScrubWriter_3_6_7uint8_9_8int_3error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -17014040, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C504, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C505, i64 2, i64 2 }, %IPST.45 { ptr @go..C506, i64 2, i64 2 } }, comdat
@const.225 = private constant [55 x i8] c"func(*\09go.llvm\09llvm.ScrubWriter, []uint8) (int, error)\00", align 1
@go..C504 = internal constant { ptr, i64 } { ptr @const.225, i64 54 }
@go..C505 = internal constant [2 x ptr] [ptr @go_0llvm.ScrubWriter..p, ptr @type.._6_7uint8]
@go..C506 = internal constant [2 x ptr] [ptr @int..d, ptr @error..d]
@go..C507 = internal constant { ptr, i64 } { ptr @const.100, i64 8 }
@type..func_8_2go_0llvm_0ScrubWriter_3_2go_0llvm_0Msg_9_8error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1599366872, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C508, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C509, i64 2, i64 2 }, %IPST.45 { ptr @go..C510, i64 1, i64 1 } }, comdat
@const.226 = private constant [59 x i8] c"func(*\09go.llvm\09llvm.ScrubWriter, *\09go.llvm\09llvm.Msg) error\00", align 1
@go..C508 = internal constant { ptr, i64 } { ptr @const.226, i64 58 }
@go..C509 = internal constant [2 x ptr] [ptr @go_0llvm.ScrubWriter..p, ptr @go_0llvm.Msg..p]
@go..C510 = internal constant [1 x ptr] [ptr @error..d]
@go..C511 = internal constant [8 x %method.0] [%method.0 { ptr @go..C485, ptr null, ptr @type..func_8_9_8error_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_9_8error_9, ptr @go_0llvm.ScrubWriter.Close..stub }, %method.0 { ptr @go..C489, ptr null, ptr @type..func_8_9_8_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_9_8_9, ptr @go_0llvm.ScrubWriter.Hijack..stub }, %method.0 { ptr @go..C493, ptr null, ptr @type..func_8_9_8net_0Addr_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_9_8net_0Addr_9, ptr @go_0llvm.ScrubWriter.LocalAddr..stub }, %method.0 { ptr @go..C497, ptr null, ptr @type..func_8_9_8net_0Addr_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_9_8net_0Addr_9, ptr @go_0llvm.ScrubWriter.RemoteAddr..stub }, %method.0 { ptr @go..C498, ptr null, ptr @type..func_8_9_8error_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_9_8error_9, ptr @go_0llvm.ScrubWriter.TsigStatus..stub }, %method.0 { ptr @go..C499, ptr null, ptr @type..func_8bool_9_8_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_3bool_9_8_9, ptr @go_0llvm.ScrubWriter.TsigTimersOnly..stub }, %method.0 { ptr @go..C503, ptr null, ptr @type..func_8_6_7uint8_9_8int_3error_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_3_6_7uint8_9_8int_3error_9, ptr @go_0llvm.ScrubWriter.Write..stub }, %method.0 { ptr @go..C507, ptr null, ptr @type..func_8_2go_0llvm_0Msg_9_8error_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_3_2go_0llvm_0Msg_9_8error_9, ptr @go_0llvm.ScrubWriter.WriteMsg..stub }]
@go..C512 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.44 { ptr @go..C511, i64 8, i64 8 } }
@type.._2_2go_0llvm_0ScrubWriter = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1212779879, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C513, ptr null, ptr null }, ptr @go_0llvm.ScrubWriter..p }, comdat
@const.227 = private constant [28 x i8] c"**\09go.llvm\09llvm.ScrubWriter\00", align 1
@go..C513 = internal constant { ptr, i64 } { ptr @const.227, i64 27 }
@go..C514 = internal constant { ptr, i64 } { ptr @const.75, i64 14 }
@const.228 = private constant [4 x i8] c"req\00", align 1
@go..C515 = internal constant { ptr, i64 } { ptr @const.228, i64 3 }
@go..C516 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C517 = internal constant [2 x %structField.0] [%structField.0 { ptr @go..C514, ptr null, ptr @go_0llvm.ResponseWriter..d, ptr null, i64 1 }, %structField.0 { ptr @go..C515, ptr @go..C516, ptr @go_0llvm.Msg..p, ptr null, i64 32 }]
@go_0llvm.OPT..d = constant %StructType.0 { %_type.0 { i64 56, i64 40, i32 -1484427225, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..ra, ptr @go..C518, ptr @go..C522, ptr @go_0llvm.OPT..p }, %IPST.46 { ptr @go..C555, i64 2, i64 2 } }
@const.229 = private constant [18 x i8] c"\09go.llvm\09llvm.OPT\00", align 1
@go..C518 = internal constant { ptr, i64 } { ptr @const.229, i64 17 }
@const.230 = private constant [4 x i8] c"OPT\00", align 1
@go..C519 = internal constant { ptr, i64 } { ptr @const.230, i64 3 }
@go..C520 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C521 = internal constant [1 x %method.0] zeroinitializer
@go..C522 = internal constant %uncommonType.0 { ptr @go..C519, ptr @go..C520, %IPST.44 { ptr @go..C521, i64 0, i64 0 } }
@go_0llvm.OPT..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 2018968185, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C523, ptr null, ptr null }, ptr @go_0llvm.OPT..d }, comdat
@const.231 = private constant [19 x i8] c"*\09go.llvm\09llvm.OPT\00", align 1
@go..C523 = internal constant { ptr, i64 } { ptr @const.231, i64 18 }
@go..C524 = internal constant { ptr, i64 } { ptr @const.29, i64 3 }
@const.232 = private constant [7 x i8] c"Option\00", align 1
@go..C525 = internal constant { ptr, i64 } { ptr @const.232, i64 6 }
@type.._6_7go_0llvm_0EDNS0 = weak constant %SliceType.0 { %_type.0 { i64 24, i64 8, i32 -1540696682, i8 0, i8 8, i8 8, i8 23, ptr null, ptr @gcbits..ba, ptr @go..C526, ptr null, ptr null }, ptr @go_0llvm.EDNS0..d }, comdat
@const.233 = private constant [22 x i8] c"[]\09go.llvm\09llvm.EDNS0\00", align 1
@go..C526 = internal constant { ptr, i64 } { ptr @const.233, i64 21 }
@go_0llvm.EDNS0..d = constant %InterfaceType.0 { %_type.0 { i64 16, i64 16, i32 -1540696696, i8 0, i8 8, i8 8, i8 20, ptr @runtime.interequal..f, ptr @gcbits..da, ptr @go..C527, ptr @go..C531, ptr @go_0llvm.EDNS0..p }, %IPST.47 { ptr @go..C553, i64 5, i64 5 } }
@const.234 = private constant [20 x i8] c"\09go.llvm\09llvm.EDNS0\00", align 1
@go..C527 = internal constant { ptr, i64 } { ptr @const.234, i64 19 }
@const.235 = private constant [6 x i8] c"EDNS0\00", align 1
@go..C528 = internal constant { ptr, i64 } { ptr @const.235, i64 5 }
@go..C529 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C530 = internal constant [1 x %method.0] zeroinitializer
@go..C531 = internal constant %uncommonType.0 { ptr @go..C528, ptr @go..C529, %IPST.44 { ptr @go..C530, i64 0, i64 0 } }
@go_0llvm.EDNS0..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1118656649, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C532, ptr null, ptr null }, ptr @go_0llvm.EDNS0..d }, comdat
@const.236 = private constant [21 x i8] c"*\09go.llvm\09llvm.EDNS0\00", align 1
@go..C532 = internal constant { ptr, i64 } { ptr @const.236, i64 20 }
@go..C533 = internal constant { ptr, i64 } { ptr @const.232, i64 6 }
@type..func_8_9_8uint16_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 615899144, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C534, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C535, i64 0, i64 0 }, %IPST.45 { ptr @go..C536, i64 1, i64 1 } }, comdat
@const.237 = private constant [14 x i8] c"func() uint16\00", align 1
@go..C534 = internal constant { ptr, i64 } { ptr @const.237, i64 13 }
@go..C535 = internal constant [1 x ptr] zeroinitializer
@go..C536 = internal constant [1 x ptr] [ptr @uint16..d]
@const.238 = private constant [7 x i8] c"String\00", align 1
@go..C537 = internal constant { ptr, i64 } { ptr @const.238, i64 6 }
@go..C538 = internal constant { ptr, i64 } { ptr @const.22, i64 4 }
@go..C539 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8_9_8go_0llvm_0EDNS0_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 179659272, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C540, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C541, i64 0, i64 0 }, %IPST.45 { ptr @go..C542, i64 1, i64 1 } }, comdat
@const.239 = private constant [27 x i8] c"func() \09go.llvm\09llvm.EDNS0\00", align 1
@go..C540 = internal constant { ptr, i64 } { ptr @const.239, i64 26 }
@go..C541 = internal constant [1 x ptr] zeroinitializer
@go..C542 = internal constant [1 x ptr] [ptr @go_0llvm.EDNS0..d]
@const.240 = private constant [5 x i8] c"pack\00", align 1
@go..C543 = internal constant { ptr, i64 } { ptr @const.240, i64 4 }
@go..C544 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8_9_8_6_7uint8_3error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 2134062408, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C545, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C546, i64 0, i64 0 }, %IPST.45 { ptr @go..C547, i64 2, i64 2 } }, comdat
@const.241 = private constant [24 x i8] c"func() ([]uint8, error)\00", align 1
@go..C545 = internal constant { ptr, i64 } { ptr @const.241, i64 23 }
@go..C546 = internal constant [1 x ptr] zeroinitializer
@go..C547 = internal constant [2 x ptr] [ptr @type.._6_7uint8, ptr @error..d]
@const.242 = private constant [7 x i8] c"unpack\00", align 1
@go..C548 = internal constant { ptr, i64 } { ptr @const.242, i64 6 }
@go..C549 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8_6_7uint8_9_8error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1067031208, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C550, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C551, i64 1, i64 1 }, %IPST.45 { ptr @go..C552, i64 1, i64 1 } }, comdat
@const.243 = private constant [20 x i8] c"func([]uint8) error\00", align 1
@go..C550 = internal constant { ptr, i64 } { ptr @const.243, i64 19 }
@go..C551 = internal constant [1 x ptr] [ptr @type.._6_7uint8]
@go..C552 = internal constant [1 x ptr] [ptr @error..d]
@go..C553 = internal constant [5 x %imethod.0] [%imethod.0 { ptr @go..C533, ptr null, ptr @type..func_8_9_8uint16_9 }, %imethod.0 { ptr @go..C537, ptr null, ptr @type..func_8_9_8string_9 }, %imethod.0 { ptr @go..C538, ptr @go..C539, ptr @type..func_8_9_8go_0llvm_0EDNS0_9 }, %imethod.0 { ptr @go..C543, ptr @go..C544, ptr @type..func_8_9_8_6_7uint8_3error_9 }, %imethod.0 { ptr @go..C548, ptr @go..C549, ptr @type..func_8_6_7uint8_9_8error_9 }]
@const.244 = private constant [10 x i8] c"dns:\22opt\22\00", align 1
@go..C554 = internal constant { ptr, i64 } { ptr @const.244, i64 9 }
@go..C555 = internal constant [2 x %structField.0] [%structField.0 { ptr @go..C524, ptr null, ptr @go_0llvm.RR__Header..d, ptr null, i64 0 }, %structField.0 { ptr @go..C525, ptr null, ptr @type.._6_7go_0llvm_0EDNS0, ptr @go..C554, i64 64 }]
@go_0llvm.supported..d = constant %StructType.0 { %_type.0 { i64 32, i64 8, i32 -1967664972, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..ba, ptr @go..C556, ptr @go..C560, ptr @go_0llvm.supported..p }, %IPST.46 { ptr @go..C611, i64 2, i64 2 } }
@const.245 = private constant [24 x i8] c"\09go.llvm\09llvm.supported\00", align 1
@go..C556 = internal constant { ptr, i64 } { ptr @const.245, i64 23 }
@const.246 = private constant [10 x i8] c"supported\00", align 1
@go..C557 = internal constant { ptr, i64 } { ptr @const.246, i64 9 }
@go..C558 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C559 = internal constant [1 x %method.0] zeroinitializer
@go..C560 = internal constant %uncommonType.0 { ptr @go..C557, ptr @go..C558, %IPST.44 { ptr @go..C559, i64 0, i64 0 } }
@go_0llvm.supported..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1417868471, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C561, ptr @go..C590, ptr @type.._2_2go_0llvm_0supported }, ptr @go_0llvm.supported..d }, comdat
@const.247 = private constant [25 x i8] c"*\09go.llvm\09llvm.supported\00", align 1
@go..C561 = internal constant { ptr, i64 } { ptr @const.247, i64 24 }
@const.248 = private constant [5 x i8] c"Lock\00", align 1
@go..C562 = internal constant { ptr, i64 } { ptr @const.248, i64 4 }
@type..func_8_2go_0llvm_0supported_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1872849192, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C563, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C564, i64 1, i64 1 }, %IPST.45 { ptr @go..C565, i64 0, i64 0 } }, comdat
@const.249 = private constant [31 x i8] c"func(*\09go.llvm\09llvm.supported)\00", align 1
@go..C563 = internal constant { ptr, i64 } { ptr @const.249, i64 30 }
@go..C564 = internal constant [1 x ptr] [ptr @go_0llvm.supported..p]
@go..C565 = internal constant [1 x ptr] zeroinitializer
@const.250 = private constant [6 x i8] c"RLock\00", align 1
@go..C566 = internal constant { ptr, i64 } { ptr @const.250, i64 5 }
@const.251 = private constant [8 x i8] c"RLocker\00", align 1
@go..C567 = internal constant { ptr, i64 } { ptr @const.251, i64 7 }
@type..func_8_9_8sync_0Locker_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -854692856, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C568, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C569, i64 0, i64 0 }, %IPST.45 { ptr @go..C570, i64 1, i64 1 } }, comdat
@const.252 = private constant [25 x i8] c"func() \09sync\09sync.Locker\00", align 1
@go..C568 = internal constant { ptr, i64 } { ptr @const.252, i64 24 }
@go..C569 = internal constant [1 x ptr] zeroinitializer
@sync.Locker..d = external constant %InterfaceType.0
@go..C570 = internal constant [1 x ptr] [ptr @sync.Locker..d]
@type..func_8_2go_0llvm_0supported_9_8sync_0Locker_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1018156328, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C571, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C572, i64 1, i64 1 }, %IPST.45 { ptr @go..C573, i64 1, i64 1 } }, comdat
@const.253 = private constant [49 x i8] c"func(*\09go.llvm\09llvm.supported) \09sync\09sync.Locker\00", align 1
@go..C571 = internal constant { ptr, i64 } { ptr @const.253, i64 48 }
@go..C572 = internal constant [1 x ptr] [ptr @go_0llvm.supported..p]
@go..C573 = internal constant [1 x ptr] [ptr @sync.Locker..d]
@const.254 = private constant [8 x i8] c"RUnlock\00", align 1
@go..C574 = internal constant { ptr, i64 } { ptr @const.254, i64 7 }
@const.255 = private constant [7 x i8] c"Unlock\00", align 1
@go..C575 = internal constant { ptr, i64 } { ptr @const.255, i64 6 }
@const.256 = private constant [12 x i8] c"rUnlockSlow\00", align 1
@go..C576 = internal constant { ptr, i64 } { ptr @const.256, i64 11 }
@const.257 = private constant [5 x i8] c"sync\00", align 1
@go..C577 = internal constant { ptr, i64 } { ptr @const.257, i64 4 }
@type..func_8int32_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1622961576, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C578, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C584, i64 1, i64 1 }, %IPST.45 { ptr @go..C585, i64 0, i64 0 } }, comdat
@const.258 = private constant [12 x i8] c"func(int32)\00", align 1
@go..C578 = internal constant { ptr, i64 } { ptr @const.258, i64 11 }
@int32..d = weak constant %_type.0 { i64 4, i64 0, i32 -1157242003, i8 8, i8 4, i8 4, i8 -123, ptr @runtime.memequal32..f, ptr null, ptr @go..C579, ptr @go..C582, ptr @int32..p }, comdat
@const.259 = private constant [6 x i8] c"int32\00", align 1
@go..C579 = internal constant { ptr, i64 } { ptr @const.259, i64 5 }
@go..C580 = internal constant { ptr, i64 } { ptr @const.259, i64 5 }
@go..C581 = internal constant [1 x %method.0] zeroinitializer
@go..C582 = internal constant %uncommonType.0 { ptr @go..C580, ptr null, %IPST.44 { ptr @go..C581, i64 0, i64 0 } }
@int32..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1336002855, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C583, ptr null, ptr null }, ptr @int32..d }, comdat
@const.260 = private constant [7 x i8] c"*int32\00", align 1
@go..C583 = internal constant { ptr, i64 } { ptr @const.260, i64 6 }
@go..C584 = internal constant [1 x ptr] [ptr @int32..d]
@go..C585 = internal constant [1 x ptr] zeroinitializer
@type..func_8_2go_0llvm_0supported_3int32_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 823805032, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C586, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C587, i64 2, i64 2 }, %IPST.45 { ptr @go..C588, i64 0, i64 0 } }, comdat
@const.261 = private constant [38 x i8] c"func(*\09go.llvm\09llvm.supported, int32)\00", align 1
@go..C586 = internal constant { ptr, i64 } { ptr @const.261, i64 37 }
@go..C587 = internal constant [2 x ptr] [ptr @go_0llvm.supported..p, ptr @int32..d]
@go..C588 = internal constant [1 x ptr] zeroinitializer
@go..C589 = internal constant [6 x %method.0] [%method.0 { ptr @go..C562, ptr null, ptr @type..func_8_9_8_9, ptr @type..func_8_2go_0llvm_0supported_9_8_9, ptr @go_0llvm.supported.Lock..stub }, %method.0 { ptr @go..C566, ptr null, ptr @type..func_8_9_8_9, ptr @type..func_8_2go_0llvm_0supported_9_8_9, ptr @go_0llvm.supported.RLock..stub }, %method.0 { ptr @go..C567, ptr null, ptr @type..func_8_9_8sync_0Locker_9, ptr @type..func_8_2go_0llvm_0supported_9_8sync_0Locker_9, ptr @go_0llvm.supported.RLocker..stub }, %method.0 { ptr @go..C574, ptr null, ptr @type..func_8_9_8_9, ptr @type..func_8_2go_0llvm_0supported_9_8_9, ptr @go_0llvm.supported.RUnlock..stub }, %method.0 { ptr @go..C575, ptr null, ptr @type..func_8_9_8_9, ptr @type..func_8_2go_0llvm_0supported_9_8_9, ptr @go_0llvm.supported.Unlock..stub }, %method.0 { ptr @go..C576, ptr @go..C577, ptr @type..func_8int32_9_8_9, ptr @type..func_8_2go_0llvm_0supported_3int32_9_8_9, ptr @go_0llvm.supported.sync_0rUnlockSlow..stub }]
@go..C590 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.44 { ptr @go..C589, i64 6, i64 6 } }
@type.._2_2go_0llvm_0supported = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1211059047, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C591, ptr null, ptr null }, ptr @go_0llvm.supported..p }, comdat
@const.262 = private constant [26 x i8] c"**\09go.llvm\09llvm.supported\00", align 1
@go..C591 = internal constant { ptr, i64 } { ptr @const.262, i64 25 }
@const.263 = private constant [2 x i8] c"m\00", align 1
@go..C592 = internal constant { ptr, i64 } { ptr @const.263, i64 1 }
@go..C593 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..map_6uint16_7struct_4_5 = weak constant %MapType.0 { %_type.0 { i64 8, i64 8, i32 76732316, i8 0, i8 8, i8 8, i8 53, ptr null, ptr @gcbits..ba, ptr @go..C594, ptr null, ptr null }, ptr @uint16..d, ptr @type..struct_4_5, ptr @type..struct_4_4x_5topbits_b_68x_7uint8_ckeys_b_68x_7uint16_cvalues_b_68x_7struct_4_5_coverflow_buintptr_5, ptr @runtime.memhash16..f, i8 2, i8 0, i16 32, i32 4 }, comdat
@const.264 = private constant [21 x i8] c"map[uint16]struct {}\00", align 1
@go..C594 = internal constant { ptr, i64 } { ptr @const.264, i64 20 }
@type..struct_4_5 = weak constant %StructType.0 { %_type.0 { i64 0, i64 0, i32 12, i8 8, i8 1, i8 1, i8 -103, ptr @runtime.memequal0..f, ptr null, ptr @go..C595, ptr null, ptr null }, %IPST.46 { ptr @go..C596, i64 0, i64 0 } }, comdat
@runtime.memequal0..f = external constant %functionDescriptor.0
@const.265 = private constant [10 x i8] c"struct {}\00", align 1
@go..C595 = internal constant { ptr, i64 } { ptr @const.265, i64 9 }
@go..C596 = internal constant [1 x %structField.0] zeroinitializer
@type..struct_4_4x_5topbits_b_68x_7uint8_ckeys_b_68x_7uint16_cvalues_b_68x_7struct_4_5_coverflow_buintptr_5 = weak constant %StructType.0 { %_type.0 { i64 32, i64 0, i32 1108425716, i8 8, i8 8, i8 8, i8 -103, ptr null, ptr null, ptr @go..C597, ptr null, ptr null }, %IPST.46 { ptr @go..C609, i64 4, i64 4 } }, comdat
@const.266 = private constant [83 x i8] c"struct { topbits [8]uint8; keys [8]uint16; values [8]struct {}; overflow uintptr }\00", align 1
@go..C597 = internal constant { ptr, i64 } { ptr @const.266, i64 82 }
@go..C598 = internal constant { ptr, i64 } { ptr @const.136, i64 7 }
@go..C599 = internal constant { ptr, i64 } { ptr @const.138, i64 4 }
@go..C600 = internal constant { ptr, i64 } { ptr @const.141, i64 6 }
@type.._68x_7struct_4_5 = weak constant %ArrayType.0 { %_type.0 { i64 0, i64 0, i32 39, i8 8, i8 1, i8 1, i8 -111, ptr null, ptr null, ptr @go..C601, ptr null, ptr null }, ptr @type..struct_4_5, ptr @type.._6_7struct_4_5, i64 8 }, comdat
@const.267 = private constant [13 x i8] c"[8]struct {}\00", align 1
@go..C601 = internal constant { ptr, i64 } { ptr @const.267, i64 12 }
@type.._6_7struct_4_5 = weak constant %SliceType.0 { %_type.0 { i64 24, i64 8, i32 26, i8 0, i8 8, i8 8, i8 23, ptr null, ptr @gcbits..ba, ptr @go..C602, ptr null, ptr null }, ptr @type..struct_4_5 }, comdat
@const.268 = private constant [12 x i8] c"[]struct {}\00", align 1
@go..C602 = internal constant { ptr, i64 } { ptr @const.268, i64 11 }
@go..C603 = internal constant { ptr, i64 } { ptr @const.144, i64 8 }
@uintptr..d = weak constant %_type.0 { i64 8, i64 0, i32 -1488193301, i8 8, i8 8, i8 8, i8 -116, ptr @runtime.memequal64..f, ptr null, ptr @go..C604, ptr @go..C607, ptr @uintptr..p }, comdat
@const.269 = private constant [8 x i8] c"uintptr\00", align 1
@go..C604 = internal constant { ptr, i64 } { ptr @const.269, i64 7 }
@go..C605 = internal constant { ptr, i64 } { ptr @const.269, i64 7 }
@go..C606 = internal constant [1 x %method.0] zeroinitializer
@go..C607 = internal constant %uncommonType.0 { ptr @go..C605, ptr null, %IPST.44 { ptr @go..C606, i64 0, i64 0 } }
@uintptr..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1958710969, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C608, ptr null, ptr null }, ptr @uintptr..d }, comdat
@const.270 = private constant [9 x i8] c"*uintptr\00", align 1
@go..C608 = internal constant { ptr, i64 } { ptr @const.270, i64 8 }
@go..C609 = internal constant [4 x %structField.0] [%structField.0 { ptr @go..C598, ptr null, ptr @type.._68x_7uint8, ptr null, i64 0 }, %structField.0 { ptr @go..C599, ptr null, ptr @type.._68x_7uint16, ptr null, i64 16 }, %structField.0 { ptr @go..C600, ptr null, ptr @type.._68x_7struct_4_5, ptr null, i64 48 }, %structField.0 { ptr @go..C603, ptr null, ptr @uintptr..d, ptr null, i64 48 }]
@runtime.memhash16..f = external constant %functionDescriptor.0
@const.271 = private constant [8 x i8] c"RWMutex\00", align 1
@go..C610 = internal constant { ptr, i64 } { ptr @const.271, i64 7 }
@sync.RWMutex..d = external constant %StructType.0
@go..C611 = internal constant [2 x %structField.0] [%structField.0 { ptr @go..C592, ptr @go..C593, ptr @type..map_6uint16_7struct_4_5, ptr null, i64 0 }, %structField.0 { ptr @go..C610, ptr null, ptr @sync.RWMutex..d, ptr null, i64 17 }]
@go_0llvm.sup = internal global ptr null
@runtime.writeBarrier = external local_unnamed_addr externally_initialized global { i8, [3 x i8], i8, i8, i64 }
@go_0llvm.Transfer..d = constant %StructType.0 { %_type.0 { i64 48, i64 48, i32 297583693, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..zb, ptr @go..C612, ptr @go..C616, ptr @go_0llvm.Transfer..p }, %IPST.46 { ptr @go..C635, i64 3, i64 3 } }
@gcbits..zb = weak constant [1 x i8] c"9", comdat
@const.273 = private constant [23 x i8] c"\09go.llvm\09llvm.Transfer\00", align 1
@go..C612 = internal constant { ptr, i64 } { ptr @const.273, i64 22 }
@const.274 = private constant [9 x i8] c"Transfer\00", align 1
@go..C613 = internal constant { ptr, i64 } { ptr @const.274, i64 8 }
@go..C614 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C615 = internal constant [1 x %method.0] zeroinitializer
@go..C616 = internal constant %uncommonType.0 { ptr @go..C613, ptr @go..C614, %IPST.44 { ptr @go..C615, i64 0, i64 0 } }
@go_0llvm.Transfer..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 466371801, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C617, ptr null, ptr null }, ptr @go_0llvm.Transfer..d }, comdat
@const.275 = private constant [24 x i8] c"*\09go.llvm\09llvm.Transfer\00", align 1
@go..C617 = internal constant { ptr, i64 } { ptr @const.275, i64 23 }
@const.276 = private constant [12 x i8] c"Transferers\00", align 1
@go..C618 = internal constant { ptr, i64 } { ptr @const.276, i64 11 }
@type.._6_7go_0llvm_0Transferer = weak constant %SliceType.0 { %_type.0 { i64 24, i64 8, i32 597710164, i8 0, i8 8, i8 8, i8 23, ptr null, ptr @gcbits..ba, ptr @go..C619, ptr null, ptr null }, ptr @go_0llvm.Transferer..d }, comdat
@const.277 = private constant [27 x i8] c"[]\09go.llvm\09llvm.Transferer\00", align 1
@go..C619 = internal constant { ptr, i64 } { ptr @const.277, i64 26 }
@go_0llvm.Transferer..d = constant %InterfaceType.0 { %_type.0 { i64 16, i64 16, i32 597710150, i8 0, i8 8, i8 8, i8 20, ptr @runtime.interequal..f, ptr @gcbits..da, ptr @go..C620, ptr @go..C624, ptr @go_0llvm.Transferer..p }, %IPST.47 { ptr @go..C631, i64 1, i64 1 } }
@const.278 = private constant [25 x i8] c"\09go.llvm\09llvm.Transferer\00", align 1
@go..C620 = internal constant { ptr, i64 } { ptr @const.278, i64 24 }
@const.279 = private constant [11 x i8] c"Transferer\00", align 1
@go..C621 = internal constant { ptr, i64 } { ptr @const.279, i64 10 }
@go..C622 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C623 = internal constant [1 x %method.0] zeroinitializer
@go..C624 = internal constant %uncommonType.0 { ptr @go..C621, ptr @go..C622, %IPST.44 { ptr @go..C623, i64 0, i64 0 } }
@go_0llvm.Transferer..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 973427817, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C625, ptr null, ptr null }, ptr @go_0llvm.Transferer..d }, comdat
@const.280 = private constant [26 x i8] c"*\09go.llvm\09llvm.Transferer\00", align 1
@go..C625 = internal constant { ptr, i64 } { ptr @const.280, i64 25 }
@go..C626 = internal constant { ptr, i64 } { ptr @const.274, i64 8 }
@type..func_8string_3uint32_9_8_x3c_x2dchan_b_6_7go_0llvm_0RR_3error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 152087304, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C627, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C628, i64 2, i64 2 }, %IPST.45 { ptr @go..C630, i64 2, i64 2 } }, comdat
@const.281 = private constant [56 x i8] c"func(string, uint32) (<-chan []\09go.llvm\09llvm.RR, error)\00", align 1
@go..C627 = internal constant { ptr, i64 } { ptr @const.281, i64 55 }
@go..C628 = internal constant [2 x ptr] [ptr @string..d, ptr @uint32..d]
@type.._x3c_x2dchan_b_6_7go_0llvm_0RR = weak constant %ChanType.0 { %_type.0 { i64 8, i64 8, i32 -1461136865, i8 8, i8 8, i8 8, i8 50, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C629, ptr null, ptr null }, ptr @type.._6_7go_0llvm_0RR, i64 1 }, comdat
@const.282 = private constant [26 x i8] c"<-chan []\09go.llvm\09llvm.RR\00", align 1
@go..C629 = internal constant { ptr, i64 } { ptr @const.282, i64 25 }
@go..C630 = internal constant [2 x ptr] [ptr @type.._x3c_x2dchan_b_6_7go_0llvm_0RR, ptr @error..d]
@go..C631 = internal constant [1 x %imethod.0] [%imethod.0 { ptr @go..C626, ptr null, ptr @type..func_8string_3uint32_9_8_x3c_x2dchan_b_6_7go_0llvm_0RR_3error_9 }]
@const.283 = private constant [11 x i8] c"tsigSecret\00", align 1
@go..C632 = internal constant { ptr, i64 } { ptr @const.283, i64 10 }
@go..C633 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.284 = private constant [5 x i8] c"Next\00", align 1
@go..C634 = internal constant { ptr, i64 } { ptr @const.284, i64 4 }
@go..C635 = internal constant [3 x %structField.0] [%structField.0 { ptr @go..C618, ptr null, ptr @type.._6_7go_0llvm_0Transferer, ptr null, i64 0 }, %structField.0 { ptr @go..C632, ptr @go..C633, ptr @type..map_6string_7string, ptr null, i64 48 }, %structField.0 { ptr @go..C634, ptr null, ptr @go_0llvm.Handler..d, ptr null, i64 64 }]
@go_0llvm.Zones..d = constant %SliceType.0 { %_type.0 { i64 24, i64 8, i32 496200441, i8 0, i8 8, i8 8, i8 23, ptr null, ptr @gcbits..ba, ptr @go..C636, ptr @go..C640, ptr @go_0llvm.Zones..p }, ptr @string..d }
@const.285 = private constant [20 x i8] c"\09go.llvm\09llvm.Zones\00", align 1
@go..C636 = internal constant { ptr, i64 } { ptr @const.285, i64 19 }
@const.286 = private constant [6 x i8] c"Zones\00", align 1
@go..C637 = internal constant { ptr, i64 } { ptr @const.286, i64 5 }
@go..C638 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C639 = internal constant [1 x %method.0] zeroinitializer
@go..C640 = internal constant %uncommonType.0 { ptr @go..C637, ptr @go..C638, %IPST.44 { ptr @go..C639, i64 0, i64 0 } }
@go_0llvm.Zones..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -650727527, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C641, ptr null, ptr null }, ptr @go_0llvm.Zones..d }, comdat
@const.287 = private constant [21 x i8] c"*\09go.llvm\09llvm.Zones\00", align 1
@go..C641 = internal constant { ptr, i64 } { ptr @const.287, i64 20 }
@go_0llvm.Zone..d = constant %StructType.0 { %_type.0 { i64 216, i64 216, i32 -1880618080, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..jhjacda, ptr @go..C642, ptr @go..C710, ptr @go_0llvm.Zone..p }, %IPST.46 { ptr @go..C844, i64 12, i64 12 } }
@gcbits..jhjacda = weak constant [4 x i8] c"\E9$ \06", comdat
@const.288 = private constant [19 x i8] c"\09go.llvm\09llvm.Zone\00", align 1
@go..C642 = internal constant { ptr, i64 } { ptr @const.288, i64 18 }
@go..C643 = internal constant { ptr, i64 } { ptr @const.152, i64 4 }
@go..C644 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.289 = private constant [4 x i8] c"Len\00", align 1
@go..C645 = internal constant { ptr, i64 } { ptr @const.289, i64 3 }
@type..func_8_9_8int_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 274483336, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C646, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C647, i64 0, i64 0 }, %IPST.45 { ptr @go..C648, i64 1, i64 1 } }, comdat
@const.290 = private constant [11 x i8] c"func() int\00", align 1
@go..C646 = internal constant { ptr, i64 } { ptr @const.290, i64 10 }
@go..C647 = internal constant [1 x ptr] zeroinitializer
@go..C648 = internal constant [1 x ptr] [ptr @int..d]
@type..func_8go_0llvm_0Zone_9_8int_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 224246920, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C649, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C650, i64 1, i64 1 }, %IPST.45 { ptr @go..C651, i64 1, i64 1 } }, comdat
@const.291 = private constant [29 x i8] c"func(\09go.llvm\09llvm.Zone) int\00", align 1
@go..C649 = internal constant { ptr, i64 } { ptr @const.291, i64 28 }
@go..C650 = internal constant [1 x ptr] [ptr @go_0llvm.Zone..d]
@go..C651 = internal constant [1 x ptr] [ptr @int..d]
@go..C652 = internal constant { ptr, i64 } { ptr @const.284, i64 4 }
@type..func_8string_9_8_2go_0llvm_0Elem_3bool_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 773419528, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C653, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C654, i64 1, i64 1 }, %IPST.45 { ptr @go..C703, i64 2, i64 2 } }, comdat
@const.292 = private constant [41 x i8] c"func(string) (*\09go.llvm\09llvm.Elem, bool)\00", align 1
@go..C653 = internal constant { ptr, i64 } { ptr @const.292, i64 40 }
@go..C654 = internal constant [1 x ptr] [ptr @string..d]
@go_0llvm.Elem..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 485998425, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C655, ptr @go..C682, ptr @type.._2_2go_0llvm_0Elem }, ptr @go_0llvm.Elem..d }, comdat
@const.293 = private constant [20 x i8] c"*\09go.llvm\09llvm.Elem\00", align 1
@go..C655 = internal constant { ptr, i64 } { ptr @const.293, i64 19 }
@const.294 = private constant [6 x i8] c"Empty\00", align 1
@go..C656 = internal constant { ptr, i64 } { ptr @const.294, i64 5 }
@type..func_8_9_8bool_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -361864120, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C657, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C658, i64 0, i64 0 }, %IPST.45 { ptr @go..C659, i64 1, i64 1 } }, comdat
@const.295 = private constant [12 x i8] c"func() bool\00", align 1
@go..C657 = internal constant { ptr, i64 } { ptr @const.295, i64 11 }
@go..C658 = internal constant [1 x ptr] zeroinitializer
@go..C659 = internal constant [1 x ptr] [ptr @bool..d]
@type..func_8_2go_0llvm_0Elem_9_8bool_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1989783704, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C660, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C661, i64 1, i64 1 }, %IPST.45 { ptr @go..C662, i64 1, i64 1 } }, comdat
@const.296 = private constant [31 x i8] c"func(*\09go.llvm\09llvm.Elem) bool\00", align 1
@go..C660 = internal constant { ptr, i64 } { ptr @const.296, i64 30 }
@go..C661 = internal constant [1 x ptr] [ptr @go_0llvm.Elem..p]
@go..C662 = internal constant [1 x ptr] [ptr @bool..d]
@go..C663 = internal constant { ptr, i64 } { ptr @const.9, i64 4 }
@type..func_8_2go_0llvm_0Elem_9_8string_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -711880280, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C664, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C665, i64 1, i64 1 }, %IPST.45 { ptr @go..C666, i64 1, i64 1 } }, comdat
@const.297 = private constant [33 x i8] c"func(*\09go.llvm\09llvm.Elem) string\00", align 1
@go..C664 = internal constant { ptr, i64 } { ptr @const.297, i64 32 }
@go..C665 = internal constant [1 x ptr] [ptr @go_0llvm.Elem..p]
@go..C666 = internal constant [1 x ptr] [ptr @string..d]
@const.298 = private constant [5 x i8] c"Type\00", align 1
@go..C667 = internal constant { ptr, i64 } { ptr @const.298, i64 4 }
@type..func_8uint16_9_8_6_7go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -466840568, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C668, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C669, i64 1, i64 1 }, %IPST.45 { ptr @go..C670, i64 1, i64 1 } }, comdat
@const.299 = private constant [32 x i8] c"func(uint16) []\09go.llvm\09llvm.RR\00", align 1
@go..C668 = internal constant { ptr, i64 } { ptr @const.299, i64 31 }
@go..C669 = internal constant [1 x ptr] [ptr @uint16..d]
@go..C670 = internal constant [1 x ptr] [ptr @type.._6_7go_0llvm_0RR]
@type..func_8_2go_0llvm_0Elem_3uint16_9_8_6_7go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 360673064, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C671, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C672, i64 2, i64 2 }, %IPST.45 { ptr @go..C673, i64 1, i64 1 } }, comdat
@const.300 = private constant [53 x i8] c"func(*\09go.llvm\09llvm.Elem, uint16) []\09go.llvm\09llvm.RR\00", align 1
@go..C671 = internal constant { ptr, i64 } { ptr @const.300, i64 52 }
@go..C672 = internal constant [2 x ptr] [ptr @go_0llvm.Elem..p, ptr @uint16..d]
@go..C673 = internal constant [1 x ptr] [ptr @type.._6_7go_0llvm_0RR]
@const.301 = private constant [16 x i8] c"TypeForWildcard\00", align 1
@go..C674 = internal constant { ptr, i64 } { ptr @const.301, i64 15 }
@type..func_8uint16_3string_9_8_6_7go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 449198728, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C675, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C676, i64 2, i64 2 }, %IPST.45 { ptr @go..C677, i64 1, i64 1 } }, comdat
@const.302 = private constant [40 x i8] c"func(uint16, string) []\09go.llvm\09llvm.RR\00", align 1
@go..C675 = internal constant { ptr, i64 } { ptr @const.302, i64 39 }
@go..C676 = internal constant [2 x ptr] [ptr @uint16..d, ptr @string..d]
@go..C677 = internal constant [1 x ptr] [ptr @type.._6_7go_0llvm_0RR]
@type..func_8_2go_0llvm_0Elem_3uint16_3string_9_8_6_7go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -2102215640, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C678, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C679, i64 3, i64 3 }, %IPST.45 { ptr @go..C680, i64 1, i64 1 } }, comdat
@const.303 = private constant [61 x i8] c"func(*\09go.llvm\09llvm.Elem, uint16, string) []\09go.llvm\09llvm.RR\00", align 1
@go..C678 = internal constant { ptr, i64 } { ptr @const.303, i64 60 }
@go..C679 = internal constant [3 x ptr] [ptr @go_0llvm.Elem..p, ptr @uint16..d, ptr @string..d]
@go..C680 = internal constant [1 x ptr] [ptr @type.._6_7go_0llvm_0RR]
@go..C681 = internal constant [4 x %method.0] [%method.0 { ptr @go..C656, ptr null, ptr @type..func_8_9_8bool_9, ptr @type..func_8_2go_0llvm_0Elem_9_8bool_9, ptr @go_0llvm.Elem.Empty }, %method.0 { ptr @go..C663, ptr null, ptr @type..func_8_9_8string_9, ptr @type..func_8_2go_0llvm_0Elem_9_8string_9, ptr @go_0llvm.Elem.Name }, %method.0 { ptr @go..C667, ptr null, ptr @type..func_8uint16_9_8_6_7go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0Elem_3uint16_9_8_6_7go_0llvm_0RR_9, ptr @go_0llvm.Elem.Type }, %method.0 { ptr @go..C674, ptr null, ptr @type..func_8uint16_3string_9_8_6_7go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0Elem_3uint16_3string_9_8_6_7go_0llvm_0RR_9, ptr @go_0llvm.Elem.TypeForWildcard }]
@go..C682 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.44 { ptr @go..C681, i64 4, i64 4 } }
@type.._2_2go_0llvm_0Elem = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -813959783, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C683, ptr null, ptr null }, ptr @go_0llvm.Elem..p }, comdat
@const.304 = private constant [21 x i8] c"**\09go.llvm\09llvm.Elem\00", align 1
@go..C683 = internal constant { ptr, i64 } { ptr @const.304, i64 20 }
@go_0llvm.Elem..d = constant %StructType.0 { %_type.0 { i64 24, i64 16, i32 -1848673291, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..da, ptr @go..C684, ptr @go..C688, ptr @go_0llvm.Elem..p }, %IPST.46 { ptr @go..C702, i64 2, i64 2 } }
@const.305 = private constant [19 x i8] c"\09go.llvm\09llvm.Elem\00", align 1
@go..C684 = internal constant { ptr, i64 } { ptr @const.305, i64 18 }
@const.306 = private constant [5 x i8] c"Elem\00", align 1
@go..C685 = internal constant { ptr, i64 } { ptr @const.306, i64 4 }
@go..C686 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C687 = internal constant [1 x %method.0] zeroinitializer
@go..C688 = internal constant %uncommonType.0 { ptr @go..C685, ptr @go..C686, %IPST.44 { ptr @go..C687, i64 0, i64 0 } }
@go..C689 = internal constant { ptr, i64 } { ptr @const.263, i64 1 }
@go..C690 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..map_6uint16_7_6_7go_0llvm_0RR = weak constant %MapType.0 { %_type.0 { i64 8, i64 8, i32 -1982194144, i8 0, i8 8, i8 8, i8 53, ptr null, ptr @gcbits..ba, ptr @go..C691, ptr null, ptr null }, ptr @uint16..d, ptr @type.._6_7go_0llvm_0RR, ptr @type..struct_4_4x_5topbits_b_68x_7uint8_ckeys_b_68x_7uint16_cvalues_b_68x_7_6_7go_0llvm_0RR_coverflow_b_2_4void_5_5, ptr @runtime.memhash16..f, i8 2, i8 24, i16 224, i32 4 }, comdat
@const.307 = private constant [30 x i8] c"map[uint16][]\09go.llvm\09llvm.RR\00", align 1
@go..C691 = internal constant { ptr, i64 } { ptr @const.307, i64 29 }
@type..struct_4_4x_5topbits_b_68x_7uint8_ckeys_b_68x_7uint16_cvalues_b_68x_7_6_7go_0llvm_0RR_coverflow_b_2_4void_5_5 = weak constant %StructType.0 { %_type.0 { i64 224, i64 224, i32 -1332066844, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..isejsea, ptr @go..C692, ptr null, ptr null }, %IPST.46 { ptr @go..C699, i64 4, i64 4 } }, comdat
@gcbits..isejsea = weak constant [4 x i8] c"H\92$\09", comdat
@const.308 = private constant [86 x i8] c"struct { topbits [8]uint8; keys [8]uint16; values [8][]\09go.llvm\09llvm.RR; overflow * }\00", align 1
@go..C692 = internal constant { ptr, i64 } { ptr @const.308, i64 85 }
@go..C693 = internal constant { ptr, i64 } { ptr @const.136, i64 7 }
@go..C694 = internal constant { ptr, i64 } { ptr @const.138, i64 4 }
@go..C695 = internal constant { ptr, i64 } { ptr @const.141, i64 6 }
@type.._68x_7_6_7go_0llvm_0RR = weak constant %ArrayType.0 { %_type.0 { i64 192, i64 176, i32 177114415, i8 0, i8 8, i8 8, i8 17, ptr null, ptr @gcbits..jsejc, ptr @go..C696, ptr null, ptr null }, ptr @type.._6_7go_0llvm_0RR, ptr @type.._6_7_6_7go_0llvm_0RR, i64 8 }, comdat
@gcbits..jsejc = weak constant [3 x i8] c"I\92$", comdat
@const.309 = private constant [22 x i8] c"[8][]\09go.llvm\09llvm.RR\00", align 1
@go..C696 = internal constant { ptr, i64 } { ptr @const.309, i64 21 }
@type.._6_7_6_7go_0llvm_0RR = weak constant %SliceType.0 { %_type.0 { i64 24, i64 8, i32 -2058926434, i8 0, i8 8, i8 8, i8 23, ptr null, ptr @gcbits..ba, ptr @go..C697, ptr null, ptr null }, ptr @type.._6_7go_0llvm_0RR }, comdat
@const.310 = private constant [21 x i8] c"[][]\09go.llvm\09llvm.RR\00", align 1
@go..C697 = internal constant { ptr, i64 } { ptr @const.310, i64 20 }
@go..C698 = internal constant { ptr, i64 } { ptr @const.144, i64 8 }
@go..C699 = internal constant [4 x %structField.0] [%structField.0 { ptr @go..C693, ptr null, ptr @type.._68x_7uint8, ptr null, i64 0 }, %structField.0 { ptr @go..C694, ptr null, ptr @type.._68x_7uint16, ptr null, i64 16 }, %structField.0 { ptr @go..C695, ptr null, ptr @type.._68x_7_6_7go_0llvm_0RR, ptr null, i64 48 }, %structField.0 { ptr @go..C698, ptr null, ptr @unsafe.Pointer..d, ptr null, i64 432 }]
@go..C700 = internal constant { ptr, i64 } { ptr @const.175, i64 4 }
@go..C701 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C702 = internal constant [2 x %structField.0] [%structField.0 { ptr @go..C689, ptr @go..C690, ptr @type..map_6uint16_7_6_7go_0llvm_0RR, ptr null, i64 0 }, %structField.0 { ptr @go..C700, ptr @go..C701, ptr @string..d, ptr null, i64 16 }]
@go..C703 = internal constant [2 x ptr] [ptr @go_0llvm.Elem..p, ptr @bool..d]
@type..func_8go_0llvm_0Zone_3string_9_8_2go_0llvm_0Elem_3bool_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1181202760, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C704, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C705, i64 2, i64 2 }, %IPST.45 { ptr @go..C706, i64 2, i64 2 } }, comdat
@const.311 = private constant [61 x i8] c"func(\09go.llvm\09llvm.Zone, string) (*\09go.llvm\09llvm.Elem, bool)\00", align 1
@go..C704 = internal constant { ptr, i64 } { ptr @const.311, i64 60 }
@go..C705 = internal constant [2 x ptr] [ptr @go_0llvm.Zone..d, ptr @string..d]
@go..C706 = internal constant [2 x ptr] [ptr @go_0llvm.Elem..p, ptr @bool..d]
@const.312 = private constant [5 x i8] c"Prev\00", align 1
@go..C707 = internal constant { ptr, i64 } { ptr @const.312, i64 4 }
@const.313 = private constant [7 x i8] c"Search\00", align 1
@go..C708 = internal constant { ptr, i64 } { ptr @const.313, i64 6 }
@go..C709 = internal constant [4 x %method.0] [%method.0 { ptr @go..C645, ptr null, ptr @type..func_8_9_8int_9, ptr @type..func_8go_0llvm_0Zone_9_8int_9, ptr @go_0llvm.Zone.Len..stub }, %method.0 { ptr @go..C652, ptr null, ptr @type..func_8string_9_8_2go_0llvm_0Elem_3bool_9, ptr @type..func_8go_0llvm_0Zone_3string_9_8_2go_0llvm_0Elem_3bool_9, ptr @go_0llvm.Zone.Next..stub }, %method.0 { ptr @go..C707, ptr null, ptr @type..func_8string_9_8_2go_0llvm_0Elem_3bool_9, ptr @type..func_8go_0llvm_0Zone_3string_9_8_2go_0llvm_0Elem_3bool_9, ptr @go_0llvm.Zone.Prev..stub }, %method.0 { ptr @go..C708, ptr null, ptr @type..func_8string_9_8_2go_0llvm_0Elem_3bool_9, ptr @type..func_8go_0llvm_0Zone_3string_9_8_2go_0llvm_0Elem_3bool_9, ptr @go_0llvm.Zone.Search..stub }]
@go..C710 = internal constant %uncommonType.0 { ptr @go..C643, ptr @go..C644, %IPST.44 { ptr @go..C709, i64 4, i64 4 } }
@go_0llvm.Zone..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -25118199, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C711, ptr @go..C739, ptr @type.._2_2go_0llvm_0Zone }, ptr @go_0llvm.Zone..d }, comdat
@const.314 = private constant [20 x i8] c"*\09go.llvm\09llvm.Zone\00", align 1
@go..C711 = internal constant { ptr, i64 } { ptr @const.314, i64 19 }
@go..C712 = internal constant { ptr, i64 } { ptr @const.289, i64 3 }
@type..func_8_2go_0llvm_0Zone_9_8int_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -529299032, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C713, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C714, i64 1, i64 1 }, %IPST.45 { ptr @go..C715, i64 1, i64 1 } }, comdat
@const.315 = private constant [30 x i8] c"func(*\09go.llvm\09llvm.Zone) int\00", align 1
@go..C713 = internal constant { ptr, i64 } { ptr @const.315, i64 29 }
@go..C714 = internal constant [1 x ptr] [ptr @go_0llvm.Zone..p]
@go..C715 = internal constant [1 x ptr] [ptr @int..d]
@go..C716 = internal constant { ptr, i64 } { ptr @const.248, i64 4 }
@type..func_8_2go_0llvm_0Zone_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -803782360, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C717, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C718, i64 1, i64 1 }, %IPST.45 { ptr @go..C719, i64 0, i64 0 } }, comdat
@const.316 = private constant [26 x i8] c"func(*\09go.llvm\09llvm.Zone)\00", align 1
@go..C717 = internal constant { ptr, i64 } { ptr @const.316, i64 25 }
@go..C718 = internal constant [1 x ptr] [ptr @go_0llvm.Zone..p]
@go..C719 = internal constant [1 x ptr] zeroinitializer
@go..C720 = internal constant { ptr, i64 } { ptr @const.284, i64 4 }
@type..func_8_2go_0llvm_0Zone_3string_9_8_2go_0llvm_0Elem_3bool_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 427656808, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C721, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C722, i64 2, i64 2 }, %IPST.45 { ptr @go..C723, i64 2, i64 2 } }, comdat
@const.317 = private constant [62 x i8] c"func(*\09go.llvm\09llvm.Zone, string) (*\09go.llvm\09llvm.Elem, bool)\00", align 1
@go..C721 = internal constant { ptr, i64 } { ptr @const.317, i64 61 }
@go..C722 = internal constant [2 x ptr] [ptr @go_0llvm.Zone..p, ptr @string..d]
@go..C723 = internal constant [2 x ptr] [ptr @go_0llvm.Elem..p, ptr @bool..d]
@go..C724 = internal constant { ptr, i64 } { ptr @const.312, i64 4 }
@go..C725 = internal constant { ptr, i64 } { ptr @const.250, i64 5 }
@go..C726 = internal constant { ptr, i64 } { ptr @const.251, i64 7 }
@type..func_8_2go_0llvm_0Zone_9_8sync_0Locker_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1658475224, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C727, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C728, i64 1, i64 1 }, %IPST.45 { ptr @go..C729, i64 1, i64 1 } }, comdat
@const.318 = private constant [44 x i8] c"func(*\09go.llvm\09llvm.Zone) \09sync\09sync.Locker\00", align 1
@go..C727 = internal constant { ptr, i64 } { ptr @const.318, i64 43 }
@go..C728 = internal constant [1 x ptr] [ptr @go_0llvm.Zone..p]
@go..C729 = internal constant [1 x ptr] [ptr @sync.Locker..d]
@go..C730 = internal constant { ptr, i64 } { ptr @const.254, i64 7 }
@go..C731 = internal constant { ptr, i64 } { ptr @const.313, i64 6 }
@go..C732 = internal constant { ptr, i64 } { ptr @const.255, i64 6 }
@go..C733 = internal constant { ptr, i64 } { ptr @const.256, i64 11 }
@go..C734 = internal constant { ptr, i64 } { ptr @const.257, i64 4 }
@type..func_8_2go_0llvm_0Zone_3int32_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1852826520, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C735, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C736, i64 2, i64 2 }, %IPST.45 { ptr @go..C737, i64 0, i64 0 } }, comdat
@const.319 = private constant [33 x i8] c"func(*\09go.llvm\09llvm.Zone, int32)\00", align 1
@go..C735 = internal constant { ptr, i64 } { ptr @const.319, i64 32 }
@go..C736 = internal constant [2 x ptr] [ptr @go_0llvm.Zone..p, ptr @int32..d]
@go..C737 = internal constant [1 x ptr] zeroinitializer
@go..C738 = internal constant [10 x %method.0] [%method.0 { ptr @go..C712, ptr null, ptr @type..func_8_9_8int_9, ptr @type..func_8_2go_0llvm_0Zone_9_8int_9, ptr @go_0llvm.Zone.Len..stub }, %method.0 { ptr @go..C716, ptr null, ptr @type..func_8_9_8_9, ptr @type..func_8_2go_0llvm_0Zone_9_8_9, ptr @go_0llvm.Zone.Lock..stub }, %method.0 { ptr @go..C720, ptr null, ptr @type..func_8string_9_8_2go_0llvm_0Elem_3bool_9, ptr @type..func_8_2go_0llvm_0Zone_3string_9_8_2go_0llvm_0Elem_3bool_9, ptr @go_0llvm.Zone.Next..stub }, %method.0 { ptr @go..C724, ptr null, ptr @type..func_8string_9_8_2go_0llvm_0Elem_3bool_9, ptr @type..func_8_2go_0llvm_0Zone_3string_9_8_2go_0llvm_0Elem_3bool_9, ptr @go_0llvm.Zone.Prev..stub }, %method.0 { ptr @go..C725, ptr null, ptr @type..func_8_9_8_9, ptr @type..func_8_2go_0llvm_0Zone_9_8_9, ptr @go_0llvm.Zone.RLock..stub }, %method.0 { ptr @go..C726, ptr null, ptr @type..func_8_9_8sync_0Locker_9, ptr @type..func_8_2go_0llvm_0Zone_9_8sync_0Locker_9, ptr @go_0llvm.Zone.RLocker..stub }, %method.0 { ptr @go..C730, ptr null, ptr @type..func_8_9_8_9, ptr @type..func_8_2go_0llvm_0Zone_9_8_9, ptr @go_0llvm.Zone.RUnlock..stub }, %method.0 { ptr @go..C731, ptr null, ptr @type..func_8string_9_8_2go_0llvm_0Elem_3bool_9, ptr @type..func_8_2go_0llvm_0Zone_3string_9_8_2go_0llvm_0Elem_3bool_9, ptr @go_0llvm.Zone.Search..stub }, %method.0 { ptr @go..C732, ptr null, ptr @type..func_8_9_8_9, ptr @type..func_8_2go_0llvm_0Zone_9_8_9, ptr @go_0llvm.Zone.Unlock..stub }, %method.0 { ptr @go..C733, ptr @go..C734, ptr @type..func_8int32_9_8_9, ptr @type..func_8_2go_0llvm_0Zone_3int32_9_8_9, ptr @go_0llvm.Zone.sync_0rUnlockSlow..stub }]
@go..C739 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.44 { ptr @go..C738, i64 10, i64 10 } }
@type.._2_2go_0llvm_0Zone = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -401891175, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C740, ptr null, ptr null }, ptr @go_0llvm.Zone..p }, comdat
@const.320 = private constant [21 x i8] c"**\09go.llvm\09llvm.Zone\00", align 1
@go..C740 = internal constant { ptr, i64 } { ptr @const.320, i64 20 }
@const.321 = private constant [7 x i8] c"origin\00", align 1
@go..C741 = internal constant { ptr, i64 } { ptr @const.321, i64 6 }
@go..C742 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.322 = private constant [8 x i8] c"origLen\00", align 1
@go..C743 = internal constant { ptr, i64 } { ptr @const.322, i64 7 }
@go..C744 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.323 = private constant [5 x i8] c"file\00", align 1
@go..C745 = internal constant { ptr, i64 } { ptr @const.323, i64 4 }
@go..C746 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.324 = private constant [5 x i8] c"Tree\00", align 1
@go..C747 = internal constant { ptr, i64 } { ptr @const.324, i64 4 }
@go_0llvm.Tree..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -318703895, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C748, ptr @go..C760, ptr @type.._2_2go_0llvm_0Tree }, ptr @go_0llvm.Tree..d }, comdat
@const.325 = private constant [20 x i8] c"*\09go.llvm\09llvm.Tree\00", align 1
@go..C748 = internal constant { ptr, i64 } { ptr @const.325, i64 19 }
@go..C749 = internal constant { ptr, i64 } { ptr @const.289, i64 3 }
@type..func_8_2go_0llvm_0Tree_9_8int_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1334106712, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C750, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C751, i64 1, i64 1 }, %IPST.45 { ptr @go..C752, i64 1, i64 1 } }, comdat
@const.326 = private constant [30 x i8] c"func(*\09go.llvm\09llvm.Tree) int\00", align 1
@go..C750 = internal constant { ptr, i64 } { ptr @const.326, i64 29 }
@go..C751 = internal constant [1 x ptr] [ptr @go_0llvm.Tree..p]
@go..C752 = internal constant [1 x ptr] [ptr @int..d]
@go..C753 = internal constant { ptr, i64 } { ptr @const.284, i64 4 }
@type..func_8_2go_0llvm_0Tree_3string_9_8_2go_0llvm_0Elem_3bool_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -377150872, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C754, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C755, i64 2, i64 2 }, %IPST.45 { ptr @go..C756, i64 2, i64 2 } }, comdat
@const.327 = private constant [62 x i8] c"func(*\09go.llvm\09llvm.Tree, string) (*\09go.llvm\09llvm.Elem, bool)\00", align 1
@go..C754 = internal constant { ptr, i64 } { ptr @const.327, i64 61 }
@go..C755 = internal constant [2 x ptr] [ptr @go_0llvm.Tree..p, ptr @string..d]
@go..C756 = internal constant [2 x ptr] [ptr @go_0llvm.Elem..p, ptr @bool..d]
@go..C757 = internal constant { ptr, i64 } { ptr @const.312, i64 4 }
@go..C758 = internal constant { ptr, i64 } { ptr @const.313, i64 6 }
@go..C759 = internal constant [4 x %method.0] [%method.0 { ptr @go..C749, ptr null, ptr @type..func_8_9_8int_9, ptr @type..func_8_2go_0llvm_0Tree_9_8int_9, ptr @go_0llvm.Tree.Len }, %method.0 { ptr @go..C753, ptr null, ptr @type..func_8string_9_8_2go_0llvm_0Elem_3bool_9, ptr @type..func_8_2go_0llvm_0Tree_3string_9_8_2go_0llvm_0Elem_3bool_9, ptr @go_0llvm.Tree.Next }, %method.0 { ptr @go..C757, ptr null, ptr @type..func_8string_9_8_2go_0llvm_0Elem_3bool_9, ptr @type..func_8_2go_0llvm_0Tree_3string_9_8_2go_0llvm_0Elem_3bool_9, ptr @go_0llvm.Tree.Prev }, %method.0 { ptr @go..C758, ptr null, ptr @type..func_8string_9_8_2go_0llvm_0Elem_3bool_9, ptr @type..func_8_2go_0llvm_0Tree_3string_9_8_2go_0llvm_0Elem_3bool_9, ptr @go_0llvm.Tree.Search }]
@go..C760 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.44 { ptr @go..C759, i64 4, i64 4 } }
@type.._2_2go_0llvm_0Tree = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -804295015, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C761, ptr null, ptr null }, ptr @go_0llvm.Tree..p }, comdat
@const.328 = private constant [21 x i8] c"**\09go.llvm\09llvm.Tree\00", align 1
@go..C761 = internal constant { ptr, i64 } { ptr @const.328, i64 20 }
@go_0llvm.Tree..d = constant %StructType.0 { %_type.0 { i64 16, i64 8, i32 1859129198, i8 8, i8 8, i8 8, i8 25, ptr @runtime.memequal128..f, ptr @gcbits..ba, ptr @go..C762, ptr @go..C766, ptr @go_0llvm.Tree..p }, %IPST.46 { ptr @go..C815, i64 2, i64 2 } }
@runtime.memequal128..f = external constant %functionDescriptor.0
@const.329 = private constant [19 x i8] c"\09go.llvm\09llvm.Tree\00", align 1
@go..C762 = internal constant { ptr, i64 } { ptr @const.329, i64 18 }
@go..C763 = internal constant { ptr, i64 } { ptr @const.324, i64 4 }
@go..C764 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C765 = internal constant [1 x %method.0] zeroinitializer
@go..C766 = internal constant %uncommonType.0 { ptr @go..C763, ptr @go..C764, %IPST.44 { ptr @go..C765, i64 0, i64 0 } }
@go..C767 = internal constant { ptr, i64 } { ptr @const.154, i64 4 }
@go_0llvm.Node..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -391165399, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C768, ptr @go..C802, ptr @type.._2_2go_0llvm_0Node }, ptr @go_0llvm.Node..d }, comdat
@const.330 = private constant [20 x i8] c"*\09go.llvm\09llvm.Node\00", align 1
@go..C768 = internal constant { ptr, i64 } { ptr @const.330, i64 19 }
@const.331 = private constant [5 x i8] c"ceil\00", align 1
@go..C769 = internal constant { ptr, i64 } { ptr @const.331, i64 4 }
@go..C770 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8string_9_8_2go_0llvm_0Node_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1193237896, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C771, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C772, i64 1, i64 1 }, %IPST.45 { ptr @go..C773, i64 1, i64 1 } }, comdat
@const.332 = private constant [33 x i8] c"func(string) *\09go.llvm\09llvm.Node\00", align 1
@go..C771 = internal constant { ptr, i64 } { ptr @const.332, i64 32 }
@go..C772 = internal constant [1 x ptr] [ptr @string..d]
@go..C773 = internal constant [1 x ptr] [ptr @go_0llvm.Node..p]
@type..func_8_2go_0llvm_0Node_3string_9_8_2go_0llvm_0Node_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 2018866664, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C774, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C775, i64 2, i64 2 }, %IPST.45 { ptr @go..C776, i64 1, i64 1 } }, comdat
@const.333 = private constant [54 x i8] c"func(*\09go.llvm\09llvm.Node, string) *\09go.llvm\09llvm.Node\00", align 1
@go..C774 = internal constant { ptr, i64 } { ptr @const.333, i64 53 }
@go..C775 = internal constant [2 x ptr] [ptr @go_0llvm.Node..p, ptr @string..d]
@go..C776 = internal constant [1 x ptr] [ptr @go_0llvm.Node..p]
@const.334 = private constant [6 x i8] c"color\00", align 1
@go..C777 = internal constant { ptr, i64 } { ptr @const.334, i64 5 }
@go..C778 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8_9_8go_0llvm_0Color_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1763665992, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C779, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C780, i64 0, i64 0 }, %IPST.45 { ptr @go..C787, i64 1, i64 1 } }, comdat
@const.335 = private constant [27 x i8] c"func() \09go.llvm\09llvm.Color\00", align 1
@go..C779 = internal constant { ptr, i64 } { ptr @const.335, i64 26 }
@go..C780 = internal constant [1 x ptr] zeroinitializer
@go_0llvm.Color..d = constant %_type.0 { i64 1, i64 0, i32 1235516833, i8 8, i8 1, i8 1, i8 -127, ptr @runtime.memequal8..f, ptr null, ptr @go..C781, ptr @go..C785, ptr @go_0llvm.Color..p }
@const.336 = private constant [20 x i8] c"\09go.llvm\09llvm.Color\00", align 1
@go..C781 = internal constant { ptr, i64 } { ptr @const.336, i64 19 }
@const.337 = private constant [6 x i8] c"Color\00", align 1
@go..C782 = internal constant { ptr, i64 } { ptr @const.337, i64 5 }
@go..C783 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C784 = internal constant [1 x %method.0] zeroinitializer
@go..C785 = internal constant %uncommonType.0 { ptr @go..C782, ptr @go..C783, %IPST.44 { ptr @go..C784, i64 0, i64 0 } }
@go_0llvm.Color..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1706567143, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C786, ptr null, ptr null }, ptr @go_0llvm.Color..d }, comdat
@const.338 = private constant [21 x i8] c"*\09go.llvm\09llvm.Color\00", align 1
@go..C786 = internal constant { ptr, i64 } { ptr @const.338, i64 20 }
@go..C787 = internal constant [1 x ptr] [ptr @go_0llvm.Color..d]
@type..func_8_2go_0llvm_0Node_9_8go_0llvm_0Color_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 2131275112, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C788, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C789, i64 1, i64 1 }, %IPST.45 { ptr @go..C790, i64 1, i64 1 } }, comdat
@const.339 = private constant [46 x i8] c"func(*\09go.llvm\09llvm.Node) \09go.llvm\09llvm.Color\00", align 1
@go..C788 = internal constant { ptr, i64 } { ptr @const.339, i64 45 }
@go..C789 = internal constant [1 x ptr] [ptr @go_0llvm.Node..p]
@go..C790 = internal constant [1 x ptr] [ptr @go_0llvm.Color..d]
@const.340 = private constant [6 x i8] c"floor\00", align 1
@go..C791 = internal constant { ptr, i64 } { ptr @const.340, i64 5 }
@go..C792 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.341 = private constant [7 x i8] c"search\00", align 1
@go..C793 = internal constant { ptr, i64 } { ptr @const.341, i64 6 }
@go..C794 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8string_9_8_2go_0llvm_0Node_3bool_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 469509640, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C795, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C796, i64 1, i64 1 }, %IPST.45 { ptr @go..C797, i64 2, i64 2 } }, comdat
@const.342 = private constant [41 x i8] c"func(string) (*\09go.llvm\09llvm.Node, bool)\00", align 1
@go..C795 = internal constant { ptr, i64 } { ptr @const.342, i64 40 }
@go..C796 = internal constant [1 x ptr] [ptr @string..d]
@go..C797 = internal constant [2 x ptr] [ptr @go_0llvm.Node..p, ptr @bool..d]
@type..func_8_2go_0llvm_0Node_3string_9_8_2go_0llvm_0Node_3bool_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1295138408, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C798, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C799, i64 2, i64 2 }, %IPST.45 { ptr @go..C800, i64 2, i64 2 } }, comdat
@const.343 = private constant [62 x i8] c"func(*\09go.llvm\09llvm.Node, string) (*\09go.llvm\09llvm.Node, bool)\00", align 1
@go..C798 = internal constant { ptr, i64 } { ptr @const.343, i64 61 }
@go..C799 = internal constant [2 x ptr] [ptr @go_0llvm.Node..p, ptr @string..d]
@go..C800 = internal constant [2 x ptr] [ptr @go_0llvm.Node..p, ptr @bool..d]
@go..C801 = internal constant [4 x %method.0] [%method.0 { ptr @go..C769, ptr @go..C770, ptr @type..func_8string_9_8_2go_0llvm_0Node_9, ptr @type..func_8_2go_0llvm_0Node_3string_9_8_2go_0llvm_0Node_9, ptr @go_0llvm.Node.ceil }, %method.0 { ptr @go..C777, ptr @go..C778, ptr @type..func_8_9_8go_0llvm_0Color_9, ptr @type..func_8_2go_0llvm_0Node_9_8go_0llvm_0Color_9, ptr @go_0llvm.Node.color }, %method.0 { ptr @go..C791, ptr @go..C792, ptr @type..func_8string_9_8_2go_0llvm_0Node_9, ptr @type..func_8_2go_0llvm_0Node_3string_9_8_2go_0llvm_0Node_9, ptr @go_0llvm.Node.floor }, %method.0 { ptr @go..C793, ptr @go..C794, ptr @type..func_8string_9_8_2go_0llvm_0Node_3bool_9, ptr @type..func_8_2go_0llvm_0Node_3string_9_8_2go_0llvm_0Node_3bool_9, ptr @go_0llvm.Node.search }]
@go..C802 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.44 { ptr @go..C801, i64 4, i64 4 } }
@type.._2_2go_0llvm_0Node = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1963679079, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C803, ptr null, ptr null }, ptr @go_0llvm.Node..p }, comdat
@const.344 = private constant [21 x i8] c"**\09go.llvm\09llvm.Node\00", align 1
@go..C803 = internal constant { ptr, i64 } { ptr @const.344, i64 20 }
@go_0llvm.Node..d = constant %StructType.0 { %_type.0 { i64 32, i64 24, i32 512423074, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.Node..eq..f, ptr @gcbits..ha, ptr @go..C804, ptr @go..C808, ptr @go_0llvm.Node..p }, %IPST.46 { ptr @go..C813, i64 4, i64 4 } }
@go_0llvm.Node..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.Node..eq to i64) }
@const.345 = private constant [19 x i8] c"\09go.llvm\09llvm.Node\00", align 1
@go..C804 = internal constant { ptr, i64 } { ptr @const.345, i64 18 }
@const.346 = private constant [5 x i8] c"Node\00", align 1
@go..C805 = internal constant { ptr, i64 } { ptr @const.346, i64 4 }
@go..C806 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C807 = internal constant [1 x %method.0] zeroinitializer
@go..C808 = internal constant %uncommonType.0 { ptr @go..C805, ptr @go..C806, %IPST.44 { ptr @go..C807, i64 0, i64 0 } }
@go..C809 = internal constant { ptr, i64 } { ptr @const.306, i64 4 }
@const.347 = private constant [5 x i8] c"Left\00", align 1
@go..C810 = internal constant { ptr, i64 } { ptr @const.347, i64 4 }
@const.348 = private constant [6 x i8] c"Right\00", align 1
@go..C811 = internal constant { ptr, i64 } { ptr @const.348, i64 5 }
@go..C812 = internal constant { ptr, i64 } { ptr @const.337, i64 5 }
@go..C813 = internal constant [4 x %structField.0] [%structField.0 { ptr @go..C809, ptr null, ptr @go_0llvm.Elem..p, ptr null, i64 0 }, %structField.0 { ptr @go..C810, ptr null, ptr @go_0llvm.Node..p, ptr null, i64 16 }, %structField.0 { ptr @go..C811, ptr null, ptr @go_0llvm.Node..p, ptr null, i64 32 }, %structField.0 { ptr @go..C812, ptr null, ptr @go_0llvm.Color..d, ptr null, i64 48 }]
@const.349 = private constant [6 x i8] c"Count\00", align 1
@go..C814 = internal constant { ptr, i64 } { ptr @const.349, i64 5 }
@go..C815 = internal constant [2 x %structField.0] [%structField.0 { ptr @go..C767, ptr null, ptr @go_0llvm.Node..p, ptr null, i64 0 }, %structField.0 { ptr @go..C814, ptr null, ptr @int..d, ptr null, i64 16 }]
@const.350 = private constant [5 x i8] c"Apex\00", align 1
@go..C816 = internal constant { ptr, i64 } { ptr @const.350, i64 4 }
@go_0llvm.Apex..d = constant %StructType.0 { %_type.0 { i64 80, i64 64, i32 2100767578, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..te, ptr @go..C817, ptr @go..C821, ptr @go_0llvm.Apex..p }, %IPST.46 { ptr @go..C827, i64 4, i64 4 } }
@gcbits..te = weak constant [1 x i8] c"\93", comdat
@const.351 = private constant [19 x i8] c"\09go.llvm\09llvm.Apex\00", align 1
@go..C817 = internal constant { ptr, i64 } { ptr @const.351, i64 18 }
@go..C818 = internal constant { ptr, i64 } { ptr @const.350, i64 4 }
@go..C819 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C820 = internal constant [1 x %method.0] zeroinitializer
@go..C821 = internal constant %uncommonType.0 { ptr @go..C818, ptr @go..C819, %IPST.44 { ptr @go..C820, i64 0, i64 0 } }
@go_0llvm.Apex..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -747457111, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C822, ptr null, ptr null }, ptr @go_0llvm.Apex..d }, comdat
@const.352 = private constant [20 x i8] c"*\09go.llvm\09llvm.Apex\00", align 1
@go..C822 = internal constant { ptr, i64 } { ptr @const.352, i64 19 }
@go..C823 = internal constant { ptr, i64 } { ptr @const.1, i64 3 }
@go..C824 = internal constant { ptr, i64 } { ptr @const.69, i64 2 }
@const.353 = private constant [7 x i8] c"SIGSOA\00", align 1
@go..C825 = internal constant { ptr, i64 } { ptr @const.353, i64 6 }
@const.354 = private constant [6 x i8] c"SIGNS\00", align 1
@go..C826 = internal constant { ptr, i64 } { ptr @const.354, i64 5 }
@go..C827 = internal constant [4 x %structField.0] [%structField.0 { ptr @go..C823, ptr null, ptr @go_0llvm.SOA..p, ptr null, i64 0 }, %structField.0 { ptr @go..C824, ptr null, ptr @type.._6_7go_0llvm_0RR, ptr null, i64 16 }, %structField.0 { ptr @go..C825, ptr null, ptr @type.._6_7go_0llvm_0RR, ptr null, i64 64 }, %structField.0 { ptr @go..C826, ptr null, ptr @type.._6_7go_0llvm_0RR, ptr null, i64 112 }]
@const.355 = private constant [8 x i8] c"Expired\00", align 1
@go..C828 = internal constant { ptr, i64 } { ptr @const.355, i64 7 }
@go..C829 = internal constant { ptr, i64 } { ptr @const.271, i64 7 }
@const.356 = private constant [12 x i8] c"StartupOnce\00", align 1
@go..C830 = internal constant { ptr, i64 } { ptr @const.356, i64 11 }
@sync.Once..d = external constant %StructType.0
@const.357 = private constant [13 x i8] c"TransferFrom\00", align 1
@go..C831 = internal constant { ptr, i64 } { ptr @const.357, i64 12 }
@const.358 = private constant [15 x i8] c"ReloadInterval\00", align 1
@go..C832 = internal constant { ptr, i64 } { ptr @const.358, i64 14 }
@const.359 = private constant [15 x i8] c"reloadShutdown\00", align 1
@go..C833 = internal constant { ptr, i64 } { ptr @const.359, i64 14 }
@go..C834 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..chan_bbool = weak constant %ChanType.0 { %_type.0 { i64 8, i64 8, i32 1966551623, i8 8, i8 8, i8 8, i8 50, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C835, ptr null, ptr null }, ptr @bool..d, i64 3 }, comdat
@const.360 = private constant [10 x i8] c"chan bool\00", align 1
@go..C835 = internal constant { ptr, i64 } { ptr @const.360, i64 9 }
@const.361 = private constant [9 x i8] c"Upstream\00", align 1
@go..C836 = internal constant { ptr, i64 } { ptr @const.361, i64 8 }
@go_0llvm.Upstream..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1322975673, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C837, ptr null, ptr null }, ptr @go_0llvm.Upstream..d }, comdat
@const.362 = private constant [24 x i8] c"*\09go.llvm\09llvm.Upstream\00", align 1
@go..C837 = internal constant { ptr, i64 } { ptr @const.362, i64 23 }
@go_0llvm.Upstream..d = constant %StructType.0 { %_type.0 { i64 0, i64 0, i32 -1796362213, i8 8, i8 1, i8 1, i8 -103, ptr @runtime.memequal0..f, ptr null, ptr @go..C838, ptr @go..C842, ptr @go_0llvm.Upstream..p }, %IPST.46 { ptr @go..C843, i64 0, i64 0 } }
@const.363 = private constant [23 x i8] c"\09go.llvm\09llvm.Upstream\00", align 1
@go..C838 = internal constant { ptr, i64 } { ptr @const.363, i64 22 }
@go..C839 = internal constant { ptr, i64 } { ptr @const.361, i64 8 }
@go..C840 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C841 = internal constant [1 x %method.0] zeroinitializer
@go..C842 = internal constant %uncommonType.0 { ptr @go..C839, ptr @go..C840, %IPST.44 { ptr @go..C841, i64 0, i64 0 } }
@go..C843 = internal constant [1 x %structField.0] zeroinitializer
@go..C844 = internal constant [12 x %structField.0] [%structField.0 { ptr @go..C741, ptr @go..C742, ptr @string..d, ptr null, i64 0 }, %structField.0 { ptr @go..C743, ptr @go..C744, ptr @int..d, ptr null, i64 32 }, %structField.0 { ptr @go..C745, ptr @go..C746, ptr @string..d, ptr null, i64 48 }, %structField.0 { ptr @go..C747, ptr null, ptr @go_0llvm.Tree..p, ptr null, i64 81 }, %structField.0 { ptr @go..C816, ptr null, ptr @go_0llvm.Apex..d, ptr null, i64 97 }, %structField.0 { ptr @go..C828, ptr null, ptr @bool..d, ptr null, i64 256 }, %structField.0 { ptr @go..C829, ptr null, ptr @sync.RWMutex..d, ptr null, i64 265 }, %structField.0 { ptr @go..C830, ptr null, ptr @sync.Once..d, ptr null, i64 312 }, %structField.0 { ptr @go..C831, ptr null, ptr @type.._6_7string, ptr null, i64 336 }, %structField.0 { ptr @go..C832, ptr null, ptr @time.Duration..d, ptr null, i64 384 }, %structField.0 { ptr @go..C833, ptr @go..C834, ptr @type..chan_bbool, ptr null, i64 400 }, %structField.0 { ptr @go..C836, ptr null, ptr @go_0llvm.Upstream..p, ptr null, i64 416 }]
@go_0llvm.Result..d = constant %_type.0 { i64 8, i64 0, i32 -2104593785, i8 8, i8 8, i8 8, i8 -126, ptr @runtime.memequal64..f, ptr null, ptr @go..C845, ptr @go..C849, ptr @go_0llvm.Result..p }
@const.364 = private constant [21 x i8] c"\09go.llvm\09llvm.Result\00", align 1
@go..C845 = internal constant { ptr, i64 } { ptr @const.364, i64 20 }
@const.365 = private constant [7 x i8] c"Result\00", align 1
@go..C846 = internal constant { ptr, i64 } { ptr @const.365, i64 6 }
@go..C847 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C848 = internal constant [1 x %method.0] zeroinitializer
@go..C849 = internal constant %uncommonType.0 { ptr @go..C846, ptr @go..C847, %IPST.44 { ptr @go..C848, i64 0, i64 0 } }
@go_0llvm.Result..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 686237817, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C850, ptr null, ptr null }, ptr @go_0llvm.Result..d }, comdat
@const.366 = private constant [22 x i8] c"*\09go.llvm\09llvm.Result\00", align 1
@go..C850 = internal constant { ptr, i64 } { ptr @const.366, i64 21 }
@go_0llvm.Key..d = constant %StructType.0 { %_type.0 { i64 0, i64 0, i32 -974766839, i8 8, i8 1, i8 1, i8 -103, ptr @runtime.memequal0..f, ptr null, ptr @go..C851, ptr @go..C855, ptr @go_0llvm.Key..p }, %IPST.46 { ptr @go..C857, i64 0, i64 0 } }
@const.367 = private constant [18 x i8] c"\09go.llvm\09llvm.Key\00", align 1
@go..C851 = internal constant { ptr, i64 } { ptr @const.367, i64 17 }
@const.368 = private constant [4 x i8] c"Key\00", align 1
@go..C852 = internal constant { ptr, i64 } { ptr @const.368, i64 3 }
@go..C853 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C854 = internal constant [1 x %method.0] zeroinitializer
@go..C855 = internal constant %uncommonType.0 { ptr @go..C852, ptr @go..C853, %IPST.44 { ptr @go..C854, i64 0, i64 0 } }
@go_0llvm.Key..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1583599769, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C856, ptr null, ptr null }, ptr @go_0llvm.Key..d }, comdat
@const.369 = private constant [19 x i8] c"*\09go.llvm\09llvm.Key\00", align 1
@go..C856 = internal constant { ptr, i64 } { ptr @const.369, i64 18 }
@go..C857 = internal constant [1 x %structField.0] zeroinitializer
@go_0llvm.LoopKey..d = constant %StructType.0 { %_type.0 { i64 0, i64 0, i32 -1961596669, i8 8, i8 1, i8 1, i8 -103, ptr @runtime.memequal0..f, ptr null, ptr @go..C858, ptr @go..C862, ptr @go_0llvm.LoopKey..p }, %IPST.46 { ptr @go..C864, i64 0, i64 0 } }
@const.370 = private constant [22 x i8] c"\09go.llvm\09llvm.LoopKey\00", align 1
@go..C858 = internal constant { ptr, i64 } { ptr @const.370, i64 21 }
@const.371 = private constant [8 x i8] c"LoopKey\00", align 1
@go..C859 = internal constant { ptr, i64 } { ptr @const.371, i64 7 }
@go..C860 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C861 = internal constant [1 x %method.0] zeroinitializer
@go..C862 = internal constant %uncommonType.0 { ptr @go..C859, ptr @go..C860, %IPST.44 { ptr @go..C861, i64 0, i64 0 } }
@go_0llvm.LoopKey..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1320775623, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C863, ptr null, ptr null }, ptr @go_0llvm.LoopKey..d }, comdat
@const.372 = private constant [23 x i8] c"*\09go.llvm\09llvm.LoopKey\00", align 1
@go..C863 = internal constant { ptr, i64 } { ptr @const.372, i64 22 }
@go..C864 = internal constant [1 x %structField.0] zeroinitializer
@go_0llvm.ViewKey..d = constant %StructType.0 { %_type.0 { i64 0, i64 0, i32 1546472894, i8 8, i8 1, i8 1, i8 -103, ptr @runtime.memequal0..f, ptr null, ptr @go..C865, ptr @go..C869, ptr @go_0llvm.ViewKey..p }, %IPST.46 { ptr @go..C871, i64 0, i64 0 } }
@const.373 = private constant [22 x i8] c"\09go.llvm\09llvm.ViewKey\00", align 1
@go..C865 = internal constant { ptr, i64 } { ptr @const.373, i64 21 }
@const.374 = private constant [8 x i8] c"ViewKey\00", align 1
@go..C866 = internal constant { ptr, i64 } { ptr @const.374, i64 7 }
@go..C867 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C868 = internal constant [1 x %method.0] zeroinitializer
@go..C869 = internal constant %uncommonType.0 { ptr @go..C866, ptr @go..C867, %IPST.44 { ptr @go..C868, i64 0, i64 0 } }
@go_0llvm.ViewKey..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1026237463, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C870, ptr null, ptr null }, ptr @go_0llvm.ViewKey..d }, comdat
@const.375 = private constant [23 x i8] c"*\09go.llvm\09llvm.ViewKey\00", align 1
@go..C870 = internal constant { ptr, i64 } { ptr @const.375, i64 22 }
@go..C871 = internal constant [1 x %structField.0] zeroinitializer
@go_0llvm.NonWriter..d = constant %StructType.0 { %_type.0 { i64 24, i64 24, i32 -728878526, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.NonWriter..eq..f, ptr @gcbits..ha, ptr @go..C872, ptr @go..C902, ptr @go_0llvm.NonWriter..p }, %IPST.46 { ptr @go..C935, i64 2, i64 2 } }
@go_0llvm.NonWriter..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.NonWriter..eq to i64) }
@const.376 = private constant [24 x i8] c"\09go.llvm\09llvm.NonWriter\00", align 1
@go..C872 = internal constant { ptr, i64 } { ptr @const.376, i64 23 }
@const.377 = private constant [10 x i8] c"NonWriter\00", align 1
@go..C873 = internal constant { ptr, i64 } { ptr @const.377, i64 9 }
@go..C874 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C875 = internal constant { ptr, i64 } { ptr @const.77, i64 5 }
@type..func_8go_0llvm_0NonWriter_9_8error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -660537848, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C876, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C877, i64 1, i64 1 }, %IPST.45 { ptr @go..C878, i64 1, i64 1 } }, comdat
@const.378 = private constant [36 x i8] c"func(\09go.llvm\09llvm.NonWriter) error\00", align 1
@go..C876 = internal constant { ptr, i64 } { ptr @const.378, i64 35 }
@go..C877 = internal constant [1 x ptr] [ptr @go_0llvm.NonWriter..d]
@go..C878 = internal constant [1 x ptr] [ptr @error..d]
@go..C879 = internal constant { ptr, i64 } { ptr @const.83, i64 6 }
@type..func_8go_0llvm_0NonWriter_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1849276344, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C880, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C881, i64 1, i64 1 }, %IPST.45 { ptr @go..C882, i64 0, i64 0 } }, comdat
@const.379 = private constant [30 x i8] c"func(\09go.llvm\09llvm.NonWriter)\00", align 1
@go..C880 = internal constant { ptr, i64 } { ptr @const.379, i64 29 }
@go..C881 = internal constant [1 x ptr] [ptr @go_0llvm.NonWriter..d]
@go..C882 = internal constant [1 x ptr] zeroinitializer
@go..C883 = internal constant { ptr, i64 } { ptr @const.85, i64 9 }
@type..func_8go_0llvm_0NonWriter_9_8net_0Addr_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1815517688, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C884, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C885, i64 1, i64 1 }, %IPST.45 { ptr @go..C886, i64 1, i64 1 } }, comdat
@const.380 = private constant [44 x i8] c"func(\09go.llvm\09llvm.NonWriter) \09net\09net.Addr\00", align 1
@go..C884 = internal constant { ptr, i64 } { ptr @const.380, i64 43 }
@go..C885 = internal constant [1 x ptr] [ptr @go_0llvm.NonWriter..d]
@go..C886 = internal constant [1 x ptr] [ptr @net.Addr..d]
@go..C887 = internal constant { ptr, i64 } { ptr @const.87, i64 10 }
@go..C888 = internal constant { ptr, i64 } { ptr @const.88, i64 10 }
@go..C889 = internal constant { ptr, i64 } { ptr @const.89, i64 14 }
@type..func_8go_0llvm_0NonWriter_3bool_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 2083826824, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C890, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C891, i64 2, i64 2 }, %IPST.45 { ptr @go..C892, i64 0, i64 0 } }, comdat
@const.381 = private constant [36 x i8] c"func(\09go.llvm\09llvm.NonWriter, bool)\00", align 1
@go..C890 = internal constant { ptr, i64 } { ptr @const.381, i64 35 }
@go..C891 = internal constant [2 x ptr] [ptr @go_0llvm.NonWriter..d, ptr @bool..d]
@go..C892 = internal constant [1 x ptr] zeroinitializer
@go..C893 = internal constant { ptr, i64 } { ptr @const.93, i64 5 }
@type..func_8go_0llvm_0NonWriter_3_6_7uint8_9_8int_3error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 559269384, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C894, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C895, i64 2, i64 2 }, %IPST.45 { ptr @go..C896, i64 2, i64 2 } }, comdat
@const.382 = private constant [52 x i8] c"func(\09go.llvm\09llvm.NonWriter, []uint8) (int, error)\00", align 1
@go..C894 = internal constant { ptr, i64 } { ptr @const.382, i64 51 }
@go..C895 = internal constant [2 x ptr] [ptr @go_0llvm.NonWriter..d, ptr @type.._6_7uint8]
@go..C896 = internal constant [2 x ptr] [ptr @int..d, ptr @error..d]
@go..C897 = internal constant { ptr, i64 } { ptr @const.100, i64 8 }
@type..func_8go_0llvm_0NonWriter_3_2go_0llvm_0Msg_9_8error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1023083448, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C898, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C899, i64 2, i64 2 }, %IPST.45 { ptr @go..C900, i64 1, i64 1 } }, comdat
@const.383 = private constant [56 x i8] c"func(\09go.llvm\09llvm.NonWriter, *\09go.llvm\09llvm.Msg) error\00", align 1
@go..C898 = internal constant { ptr, i64 } { ptr @const.383, i64 55 }
@go..C899 = internal constant [2 x ptr] [ptr @go_0llvm.NonWriter..d, ptr @go_0llvm.Msg..p]
@go..C900 = internal constant [1 x ptr] [ptr @error..d]
@go..C901 = internal constant [8 x %method.0] [%method.0 { ptr @go..C875, ptr null, ptr @type..func_8_9_8error_9, ptr @type..func_8go_0llvm_0NonWriter_9_8error_9, ptr @go_0llvm.NonWriter.Close..stub }, %method.0 { ptr @go..C879, ptr null, ptr @type..func_8_9_8_9, ptr @type..func_8go_0llvm_0NonWriter_9_8_9, ptr @go_0llvm.NonWriter.Hijack..stub }, %method.0 { ptr @go..C883, ptr null, ptr @type..func_8_9_8net_0Addr_9, ptr @type..func_8go_0llvm_0NonWriter_9_8net_0Addr_9, ptr @go_0llvm.NonWriter.LocalAddr..stub }, %method.0 { ptr @go..C887, ptr null, ptr @type..func_8_9_8net_0Addr_9, ptr @type..func_8go_0llvm_0NonWriter_9_8net_0Addr_9, ptr @go_0llvm.NonWriter.RemoteAddr..stub }, %method.0 { ptr @go..C888, ptr null, ptr @type..func_8_9_8error_9, ptr @type..func_8go_0llvm_0NonWriter_9_8error_9, ptr @go_0llvm.NonWriter.TsigStatus..stub }, %method.0 { ptr @go..C889, ptr null, ptr @type..func_8bool_9_8_9, ptr @type..func_8go_0llvm_0NonWriter_3bool_9_8_9, ptr @go_0llvm.NonWriter.TsigTimersOnly..stub }, %method.0 { ptr @go..C893, ptr null, ptr @type..func_8_6_7uint8_9_8int_3error_9, ptr @type..func_8go_0llvm_0NonWriter_3_6_7uint8_9_8int_3error_9, ptr @go_0llvm.NonWriter.Write..stub }, %method.0 { ptr @go..C897, ptr null, ptr @type..func_8_2go_0llvm_0Msg_9_8error_9, ptr @type..func_8go_0llvm_0NonWriter_3_2go_0llvm_0Msg_9_8error_9, ptr @go_0llvm.NonWriter.WriteMsg..stub }]
@go..C902 = internal constant %uncommonType.0 { ptr @go..C873, ptr @go..C874, %IPST.44 { ptr @go..C901, i64 8, i64 8 } }
@go_0llvm.NonWriter..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1222845481, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C903, ptr @go..C931, ptr @type.._2_2go_0llvm_0NonWriter }, ptr @go_0llvm.NonWriter..d }, comdat
@const.384 = private constant [25 x i8] c"*\09go.llvm\09llvm.NonWriter\00", align 1
@go..C903 = internal constant { ptr, i64 } { ptr @const.384, i64 24 }
@go..C904 = internal constant { ptr, i64 } { ptr @const.77, i64 5 }
@type..func_8_2go_0llvm_0NonWriter_9_8error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1665088232, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C905, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C906, i64 1, i64 1 }, %IPST.45 { ptr @go..C907, i64 1, i64 1 } }, comdat
@const.385 = private constant [37 x i8] c"func(*\09go.llvm\09llvm.NonWriter) error\00", align 1
@go..C905 = internal constant { ptr, i64 } { ptr @const.385, i64 36 }
@go..C906 = internal constant [1 x ptr] [ptr @go_0llvm.NonWriter..p]
@go..C907 = internal constant [1 x ptr] [ptr @error..d]
@go..C908 = internal constant { ptr, i64 } { ptr @const.83, i64 6 }
@type..func_8_2go_0llvm_0NonWriter_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 476349736, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C909, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C910, i64 1, i64 1 }, %IPST.45 { ptr @go..C911, i64 0, i64 0 } }, comdat
@const.386 = private constant [31 x i8] c"func(*\09go.llvm\09llvm.NonWriter)\00", align 1
@go..C909 = internal constant { ptr, i64 } { ptr @const.386, i64 30 }
@go..C910 = internal constant [1 x ptr] [ptr @go_0llvm.NonWriter..p]
@go..C911 = internal constant [1 x ptr] zeroinitializer
@go..C912 = internal constant { ptr, i64 } { ptr @const.85, i64 9 }
@type..func_8_2go_0llvm_0NonWriter_9_8net_0Addr_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 510108392, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C913, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C914, i64 1, i64 1 }, %IPST.45 { ptr @go..C915, i64 1, i64 1 } }, comdat
@const.387 = private constant [45 x i8] c"func(*\09go.llvm\09llvm.NonWriter) \09net\09net.Addr\00", align 1
@go..C913 = internal constant { ptr, i64 } { ptr @const.387, i64 44 }
@go..C914 = internal constant [1 x ptr] [ptr @go_0llvm.NonWriter..p]
@go..C915 = internal constant [1 x ptr] [ptr @net.Addr..d]
@go..C916 = internal constant { ptr, i64 } { ptr @const.87, i64 10 }
@go..C917 = internal constant { ptr, i64 } { ptr @const.88, i64 10 }
@go..C918 = internal constant { ptr, i64 } { ptr @const.89, i64 14 }
@type..func_8_2go_0llvm_0NonWriter_3bool_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 114485608, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C919, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C920, i64 2, i64 2 }, %IPST.45 { ptr @go..C921, i64 0, i64 0 } }, comdat
@const.388 = private constant [37 x i8] c"func(*\09go.llvm\09llvm.NonWriter, bool)\00", align 1
@go..C919 = internal constant { ptr, i64 } { ptr @const.388, i64 36 }
@go..C920 = internal constant [2 x ptr] [ptr @go_0llvm.NonWriter..p, ptr @bool..d]
@go..C921 = internal constant [1 x ptr] zeroinitializer
@go..C922 = internal constant { ptr, i64 } { ptr @const.93, i64 5 }
@type..func_8_2go_0llvm_0NonWriter_3_6_7uint8_9_8int_3error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1410071832, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C923, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C924, i64 2, i64 2 }, %IPST.45 { ptr @go..C925, i64 2, i64 2 } }, comdat
@const.389 = private constant [53 x i8] c"func(*\09go.llvm\09llvm.NonWriter, []uint8) (int, error)\00", align 1
@go..C923 = internal constant { ptr, i64 } { ptr @const.389, i64 52 }
@go..C924 = internal constant [2 x ptr] [ptr @go_0llvm.NonWriter..p, ptr @type.._6_7uint8]
@go..C925 = internal constant [2 x ptr] [ptr @int..d, ptr @error..d]
@go..C926 = internal constant { ptr, i64 } { ptr @const.100, i64 8 }
@type..func_8_2go_0llvm_0NonWriter_3_2go_0llvm_0Msg_9_8error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1302542632, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C927, ptr null, ptr null }, i8 0, %IPST.45 { ptr @go..C928, i64 2, i64 2 }, %IPST.45 { ptr @go..C929, i64 1, i64 1 } }, comdat
@const.390 = private constant [57 x i8] c"func(*\09go.llvm\09llvm.NonWriter, *\09go.llvm\09llvm.Msg) error\00", align 1
@go..C927 = internal constant { ptr, i64 } { ptr @const.390, i64 56 }
@go..C928 = internal constant [2 x ptr] [ptr @go_0llvm.NonWriter..p, ptr @go_0llvm.Msg..p]
@go..C929 = internal constant [1 x ptr] [ptr @error..d]
@go..C930 = internal constant [8 x %method.0] [%method.0 { ptr @go..C904, ptr null, ptr @type..func_8_9_8error_9, ptr @type..func_8_2go_0llvm_0NonWriter_9_8error_9, ptr @go_0llvm.NonWriter.Close..stub }, %method.0 { ptr @go..C908, ptr null, ptr @type..func_8_9_8_9, ptr @type..func_8_2go_0llvm_0NonWriter_9_8_9, ptr @go_0llvm.NonWriter.Hijack..stub }, %method.0 { ptr @go..C912, ptr null, ptr @type..func_8_9_8net_0Addr_9, ptr @type..func_8_2go_0llvm_0NonWriter_9_8net_0Addr_9, ptr @go_0llvm.NonWriter.LocalAddr..stub }, %method.0 { ptr @go..C916, ptr null, ptr @type..func_8_9_8net_0Addr_9, ptr @type..func_8_2go_0llvm_0NonWriter_9_8net_0Addr_9, ptr @go_0llvm.NonWriter.RemoteAddr..stub }, %method.0 { ptr @go..C917, ptr null, ptr @type..func_8_9_8error_9, ptr @type..func_8_2go_0llvm_0NonWriter_9_8error_9, ptr @go_0llvm.NonWriter.TsigStatus..stub }, %method.0 { ptr @go..C918, ptr null, ptr @type..func_8bool_9_8_9, ptr @type..func_8_2go_0llvm_0NonWriter_3bool_9_8_9, ptr @go_0llvm.NonWriter.TsigTimersOnly..stub }, %method.0 { ptr @go..C922, ptr null, ptr @type..func_8_6_7uint8_9_8int_3error_9, ptr @type..func_8_2go_0llvm_0NonWriter_3_6_7uint8_9_8int_3error_9, ptr @go_0llvm.NonWriter.Write..stub }, %method.0 { ptr @go..C926, ptr null, ptr @type..func_8_2go_0llvm_0Msg_9_8error_9, ptr @type..func_8_2go_0llvm_0NonWriter_3_2go_0llvm_0Msg_9_8error_9, ptr @go_0llvm.NonWriter.WriteMsg..stub }]
@go..C931 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.44 { ptr @go..C930, i64 8, i64 8 } }
@type.._2_2go_0llvm_0NonWriter = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1909308775, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C932, ptr null, ptr null }, ptr @go_0llvm.NonWriter..p }, comdat
@const.391 = private constant [26 x i8] c"**\09go.llvm\09llvm.NonWriter\00", align 1
@go..C932 = internal constant { ptr, i64 } { ptr @const.391, i64 25 }
@go..C933 = internal constant { ptr, i64 } { ptr @const.75, i64 14 }
@go..C934 = internal constant { ptr, i64 } { ptr @const.104, i64 3 }
@go..C935 = internal constant [2 x %structField.0] [%structField.0 { ptr @go..C933, ptr null, ptr @go_0llvm.ResponseWriter..d, ptr null, i64 1 }, %structField.0 { ptr @go..C934, ptr null, ptr @go_0llvm.Msg..p, ptr null, i64 32 }]
@go_0llvm.Func..d = constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -793423952, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C936, ptr @go..C940, ptr @go_0llvm.Func..p }, i8 0, %IPST.45 { ptr @go..C942, i64 0, i64 0 }, %IPST.45 { ptr @go..C943, i64 1, i64 1 } }
@const.392 = private constant [19 x i8] c"\09go.llvm\09llvm.Func\00", align 1
@go..C936 = internal constant { ptr, i64 } { ptr @const.392, i64 18 }
@const.393 = private constant [5 x i8] c"Func\00", align 1
@go..C937 = internal constant { ptr, i64 } { ptr @const.393, i64 4 }
@go..C938 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C939 = internal constant [1 x %method.0] zeroinitializer
@go..C940 = internal constant %uncommonType.0 { ptr @go..C937, ptr @go..C938, %IPST.44 { ptr @go..C939, i64 0, i64 0 } }
@go_0llvm.Func..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 190118665, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C941, ptr null, ptr null }, ptr @go_0llvm.Func..d }, comdat
@const.394 = private constant [20 x i8] c"*\09go.llvm\09llvm.Func\00", align 1
@go..C941 = internal constant { ptr, i64 } { ptr @const.394, i64 19 }
@go..C942 = internal constant [1 x ptr] zeroinitializer
@go..C943 = internal constant [1 x ptr] [ptr @string..d]
@go_0llvm.Less..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.Less to i64) }
@go_0llvm.go_0llvm..init0..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.go_0llvm..init0 to i64) }
@go_0llvm._63_7int32..eq..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm._63_7int32..eq to i64) }
@go_0llvm._632_7uint8..eq..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm._632_7uint8..eq to i64) }
@go_0llvm._65_7uint8..eq..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm._65_7uint8..eq to i64) }
@go_0llvm._628_7uint8..eq..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm._628_7uint8..eq to i64) }
@go_0llvm._6255_7uint8..eq..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm._6255_7uint8..eq to i64) }
@go_0llvm._616_7uint8..eq..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm._616_7uint8..eq to i64) }
@go_0llvm._64_7uint8..eq..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm._64_7uint8..eq to i64) }
@go_0llvm._6127_7bool..eq..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm._6127_7bool..eq to i64) }
@go_0llvm._6256_7bool..eq..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm._6256_7bool..eq to i64) }
@go_0llvm._614_7int8..eq..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm._614_7int8..eq to i64) }
@go_0llvm._696_7int8..eq..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm._696_7int8..eq to i64) }
@go_0llvm._68_7uint8..eq..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm._68_7uint8..eq to i64) }
@go_0llvm._65_7string..eq..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm._65_7string..eq to i64) }
@go_0llvm._6128_7uint64..eq..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm._6128_7uint64..eq to i64) }
@go_0llvm._665_7int8..eq..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm._665_7int8..eq to i64) }
@go_0llvm._613_7int32..eq..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm._613_7int32..eq to i64) }
@go_0llvm._6256_7uint8..eq..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm._6256_7uint8..eq to i64) }
@sync.rlocker..p = external constant %PtrType.0
@pimt..interface_4Lock_bfunc_8_9_8_9_cUnlock_bfunc_8_9_8_9_5..sync.rlocker = internal constant { ptr, ptr, ptr } { ptr @sync.rlocker..p, ptr @sync.rlocker.Lock, ptr @sync.rlocker.Unlock }
@go.llvm..types = local_unnamed_addr constant { i64, [167 x ptr] } { i64 167, [167 x ptr] [ptr @string..p, ptr @uint16..p, ptr @uint32..p, ptr @go_0llvm.RR__Header..p, ptr @type..func_8_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0SOA_9_8_2go_0llvm_0RR__Header_9, ptr @go_0llvm.RR..p, ptr @type..func_8_9_8go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0SOA_9_8go_0llvm_0RR_9, ptr @type.._2_2go_0llvm_0SOA, ptr @go_0llvm.SOA..p, ptr @type..func_8_2go_0llvm_0DNAME_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0DNAME_9_8go_0llvm_0RR_9, ptr @type.._2_2go_0llvm_0DNAME, ptr @go_0llvm.DNAME..p, ptr @type..func_8_2go_0llvm_0CNAME_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0CNAME_9_8go_0llvm_0RR_9, ptr @type.._2_2go_0llvm_0CNAME, ptr @go_0llvm.CNAME..p, ptr @type..func_8_2go_0llvm_0SRV_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0SRV_9_8go_0llvm_0RR_9, ptr @type.._2_2go_0llvm_0SRV, ptr @go_0llvm.SRV..p, ptr @type..func_8_2go_0llvm_0MX_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0MX_9_8go_0llvm_0RR_9, ptr @type.._2_2go_0llvm_0MX, ptr @go_0llvm.MX..p, ptr @type..func_8_2go_0llvm_0NS_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0NS_9_8go_0llvm_0RR_9, ptr @type.._2_2go_0llvm_0NS, ptr @go_0llvm.NS..p, ptr @go_0llvm.ResponseWriter..p, ptr @error..p, ptr @type..func_8_9_8string_9, ptr @type..func_8_9_8error_9, ptr @type..func_8_9_8_9, ptr @type..func_8_9_8net_0Addr_9, ptr @bool..p, ptr @type..func_8bool_9_8_9, ptr @uint8..p, ptr @type.._6_7uint8, ptr @int..p, ptr @type..func_8_6_7uint8_9_8int_3error_9, ptr @go_0llvm.MsgHdr..p, ptr @go_0llvm.Question..p, ptr @type.._6_7go_0llvm_0Question, ptr @type.._6_7go_0llvm_0RR, ptr @go_0llvm.Msg..p, ptr @type..func_8_2go_0llvm_0Msg_9_8error_9, ptr @go_0llvm.compressionMap..p, ptr @type.._6_7string, ptr @type.._6_7int, ptr @type..map_6string_7int, ptr @type.._6_7uint16, ptr @type..map_6string_7uint16, ptr @go_0llvm.Config..p, ptr @type..func_8_2net_1http_0Request_9_8bool_9, ptr @go_0llvm.FilterFunc..p, ptr @int8..p, ptr @go_0llvm.Request..p, ptr @type.._6_7go_0llvm_0FilterFunc, ptr @type..map_6string_7string, ptr @go_0llvm.Plugin..p, ptr @go_0llvm.Handler..p, ptr @type..func_8context_0Context_3go_0llvm_0ResponseWriter_3_2go_0llvm_0Msg_9_8int_3error_9, ptr @type.._6_7go_0llvm_0Plugin, ptr @type.._6_7go_0llvm_0Handler, ptr @type..map_6string_7go_0llvm_0Handler, ptr @go_0llvm.MetadataCollector..p, ptr @type..func_8context_0Context_3go_0llvm_0Request_9_8context_0Context_9, ptr @go_0llvm.HandlerFunc..p, ptr @type..func_8go_0llvm_0ScrubWriter_9_8error_9, ptr @type..func_8go_0llvm_0ScrubWriter_9_8_9, ptr @type..func_8go_0llvm_0ScrubWriter_9_8net_0Addr_9, ptr @type..func_8go_0llvm_0ScrubWriter_3bool_9_8_9, ptr @type..func_8go_0llvm_0ScrubWriter_3_6_7uint8_9_8int_3error_9, ptr @type..func_8go_0llvm_0ScrubWriter_3_2go_0llvm_0Msg_9_8error_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_9_8error_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_9_8_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_9_8net_0Addr_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_3bool_9_8_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_3_6_7uint8_9_8int_3error_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_3_2go_0llvm_0Msg_9_8error_9, ptr @type.._2_2go_0llvm_0ScrubWriter, ptr @go_0llvm.ScrubWriter..p, ptr @go_0llvm.OPT..p, ptr @go_0llvm.EDNS0..p, ptr @type..func_8_9_8uint16_9, ptr @type..func_8_9_8go_0llvm_0EDNS0_9, ptr @type..func_8_9_8_6_7uint8_3error_9, ptr @type..func_8_6_7uint8_9_8error_9, ptr @type.._6_7go_0llvm_0EDNS0, ptr @type..func_8_2go_0llvm_0supported_9_8_9, ptr @type..func_8_9_8sync_0Locker_9, ptr @type..func_8_2go_0llvm_0supported_9_8sync_0Locker_9, ptr @int32..p, ptr @type..func_8int32_9_8_9, ptr @type..func_8_2go_0llvm_0supported_3int32_9_8_9, ptr @type.._2_2go_0llvm_0supported, ptr @go_0llvm.supported..p, ptr @type..struct_4_5, ptr @type.._6_7struct_4_5, ptr @uintptr..p, ptr @type..map_6uint16_7struct_4_5, ptr @go_0llvm.Transfer..p, ptr @go_0llvm.Transferer..p, ptr @type.._x3c_x2dchan_b_6_7go_0llvm_0RR, ptr @type..func_8string_3uint32_9_8_x3c_x2dchan_b_6_7go_0llvm_0RR_3error_9, ptr @type.._6_7go_0llvm_0Transferer, ptr @go_0llvm.Zones..p, ptr @type..func_8_9_8int_9, ptr @type..func_8go_0llvm_0Zone_9_8int_9, ptr @type..func_8_9_8bool_9, ptr @type..func_8_2go_0llvm_0Elem_9_8bool_9, ptr @type..func_8_2go_0llvm_0Elem_9_8string_9, ptr @type..func_8uint16_9_8_6_7go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0Elem_3uint16_9_8_6_7go_0llvm_0RR_9, ptr @type..func_8uint16_3string_9_8_6_7go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0Elem_3uint16_3string_9_8_6_7go_0llvm_0RR_9, ptr @type.._2_2go_0llvm_0Elem, ptr @type.._6_7_6_7go_0llvm_0RR, ptr @type..map_6uint16_7_6_7go_0llvm_0RR, ptr @go_0llvm.Elem..p, ptr @type..func_8string_9_8_2go_0llvm_0Elem_3bool_9, ptr @type..func_8go_0llvm_0Zone_3string_9_8_2go_0llvm_0Elem_3bool_9, ptr @type..func_8_2go_0llvm_0Zone_9_8int_9, ptr @type..func_8_2go_0llvm_0Zone_9_8_9, ptr @type..func_8_2go_0llvm_0Zone_3string_9_8_2go_0llvm_0Elem_3bool_9, ptr @type..func_8_2go_0llvm_0Zone_9_8sync_0Locker_9, ptr @type..func_8_2go_0llvm_0Zone_3int32_9_8_9, ptr @type.._2_2go_0llvm_0Zone, ptr @go_0llvm.Zone..p, ptr @type..func_8_2go_0llvm_0Tree_9_8int_9, ptr @type..func_8_2go_0llvm_0Tree_3string_9_8_2go_0llvm_0Elem_3bool_9, ptr @type.._2_2go_0llvm_0Tree, ptr @type..func_8string_9_8_2go_0llvm_0Node_9, ptr @type..func_8_2go_0llvm_0Node_3string_9_8_2go_0llvm_0Node_9, ptr @go_0llvm.Color..p, ptr @type..func_8_9_8go_0llvm_0Color_9, ptr @type..func_8_2go_0llvm_0Node_9_8go_0llvm_0Color_9, ptr @type..func_8string_9_8_2go_0llvm_0Node_3bool_9, ptr @type..func_8_2go_0llvm_0Node_3string_9_8_2go_0llvm_0Node_3bool_9, ptr @type.._2_2go_0llvm_0Node, ptr @go_0llvm.Node..p, ptr @go_0llvm.Tree..p, ptr @go_0llvm.Apex..p, ptr @type..chan_bbool, ptr @go_0llvm.Upstream..p, ptr @go_0llvm.Result..p, ptr @go_0llvm.Key..p, ptr @go_0llvm.LoopKey..p, ptr @go_0llvm.ViewKey..p, ptr @type..func_8go_0llvm_0NonWriter_9_8error_9, ptr @type..func_8go_0llvm_0NonWriter_9_8_9, ptr @type..func_8go_0llvm_0NonWriter_9_8net_0Addr_9, ptr @type..func_8go_0llvm_0NonWriter_3bool_9_8_9, ptr @type..func_8go_0llvm_0NonWriter_3_6_7uint8_9_8int_3error_9, ptr @type..func_8go_0llvm_0NonWriter_3_2go_0llvm_0Msg_9_8error_9, ptr @type..func_8_2go_0llvm_0NonWriter_9_8error_9, ptr @type..func_8_2go_0llvm_0NonWriter_9_8_9, ptr @type..func_8_2go_0llvm_0NonWriter_9_8net_0Addr_9, ptr @type..func_8_2go_0llvm_0NonWriter_3bool_9_8_9, ptr @type..func_8_2go_0llvm_0NonWriter_3_6_7uint8_9_8int_3error_9, ptr @type..func_8_2go_0llvm_0NonWriter_3_2go_0llvm_0Msg_9_8error_9, ptr @type.._2_2go_0llvm_0NonWriter, ptr @go_0llvm.NonWriter..p, ptr @go_0llvm.Func..p] }
@go..C0 = internal global { ptr, i64, [1 x { ptr, i64, i64, ptr }] } { ptr null, i64 1, [1 x { ptr, i64, i64, ptr }] [{ ptr, i64, i64, ptr } { ptr @go_0llvm.sup, i64 8, i64 8, ptr @gcbits..ba }] }


define i8 @go_0llvm.SOA..eq(ptr nest nocapture readnone %nest.69, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.378 = icmp eq ptr %key1, null
  br i1 %icmp.378, label %then.339, label %else.339, !make.implicit !3

then.339:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.339:                                         ; preds = %entry
  %tmpv.494.sroa.0.0.copyload = load ptr, ptr %key1, align 8
  %tmpv.494.sroa.3.0.cast.1916.sroa_idx23 = getelementptr inbounds i8, ptr %key1, i64 16
  %tmpv.494.sroa.3.0.copyload = load i16, ptr %tmpv.494.sroa.3.0.cast.1916.sroa_idx23, align 8
  %tmpv.494.sroa.5.0.cast.1916.sroa_idx24 = getelementptr inbounds i8, ptr %key1, i64 18
  %tmpv.494.sroa.5.0.copyload = load i16, ptr %tmpv.494.sroa.5.0.cast.1916.sroa_idx24, align 2
  %tmpv.494.sroa.6.0.cast.1916.sroa_idx25 = getelementptr inbounds i8, ptr %key1, i64 20
  %tmpv.494.sroa.6.0.copyload = load i32, ptr %tmpv.494.sroa.6.0.cast.1916.sroa_idx25, align 4
  %tmpv.494.sroa.7.0.cast.1916.sroa_idx26 = getelementptr inbounds i8, ptr %key1, i64 24
  %tmpv.494.sroa.7.0.copyload = load i16, ptr %tmpv.494.sroa.7.0.cast.1916.sroa_idx26, align 8
  %icmp.379 = icmp eq ptr %key2, null
  br i1 %icmp.379, label %then.340, label %else.340, !make.implicit !3

then.340:                                         ; preds = %else.339
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.340:                                         ; preds = %else.339
  %tmpv.494.sroa.2.0.cast.1916.sroa_idx22 = getelementptr inbounds i8, ptr %key1, i64 8
  %tmpv.494.sroa.2.0.copyload = load i64, ptr %tmpv.494.sroa.2.0.cast.1916.sroa_idx22, align 8
  %tmpv.495.sroa.0.0.copyload = load ptr, ptr %key2, align 8
  %tmpv.495.sroa.2.0.cast.1921.sroa_idx17 = getelementptr inbounds i8, ptr %key2, i64 8
  %tmpv.495.sroa.2.0.copyload = load i64, ptr %tmpv.495.sroa.2.0.cast.1921.sroa_idx17, align 8
  %tmpv.495.sroa.3.0.cast.1921.sroa_idx18 = getelementptr inbounds i8, ptr %key2, i64 16
  %tmpv.495.sroa.3.0.copyload = load i16, ptr %tmpv.495.sroa.3.0.cast.1921.sroa_idx18, align 8
  %tmpv.495.sroa.5.0.cast.1921.sroa_idx19 = getelementptr inbounds i8, ptr %key2, i64 18
  %tmpv.495.sroa.5.0.copyload = load i16, ptr %tmpv.495.sroa.5.0.cast.1921.sroa_idx19, align 2
  %tmpv.495.sroa.6.0.cast.1921.sroa_idx20 = getelementptr inbounds i8, ptr %key2, i64 20
  %tmpv.495.sroa.6.0.copyload = load i32, ptr %tmpv.495.sroa.6.0.cast.1921.sroa_idx20, align 4
  %tmpv.495.sroa.7.0.cast.1921.sroa_idx21 = getelementptr inbounds i8, ptr %key2, i64 24
  %tmpv.495.sroa.7.0.copyload = load i16, ptr %tmpv.495.sroa.7.0.cast.1921.sroa_idx21, align 8
  %icmp.380 = icmp eq i64 %tmpv.494.sroa.2.0.copyload, %tmpv.495.sroa.2.0.copyload
  br i1 %icmp.380, label %then.341, label %fallthrough.341

then.341:                                         ; preds = %else.340
  %icmp.381 = icmp eq ptr %tmpv.494.sroa.0.0.copyload, %tmpv.495.sroa.0.0.copyload
  br i1 %icmp.381, label %fallthrough.341, label %else.342

fallthrough.341:                                  ; preds = %else.342, %then.341, %else.340
  %tmpv.504.0 = phi i1 [ false, %else.340 ], [ %icmp.382, %else.342 ], [ true, %then.341 ]
  %icmp.384 = icmp eq i16 %tmpv.494.sroa.3.0.copyload, %tmpv.495.sroa.3.0.copyload
  %spec.select = select i1 %tmpv.504.0, i1 %icmp.384, i1 false
  %icmp.385 = icmp eq i16 %tmpv.494.sroa.5.0.copyload, %tmpv.495.sroa.5.0.copyload
  %tmpv.506.0.in = select i1 %spec.select, i1 %icmp.385, i1 false
  %icmp.386 = icmp eq i32 %tmpv.494.sroa.6.0.copyload, %tmpv.495.sroa.6.0.copyload
  %spec.select35 = select i1 %tmpv.506.0.in, i1 %icmp.386, i1 false
  %icmp.387 = icmp eq i16 %tmpv.494.sroa.7.0.copyload, %tmpv.495.sroa.7.0.copyload
  %tmpv.508.0.in = select i1 %spec.select35, i1 %icmp.387, i1 false
  br i1 %tmpv.508.0.in, label %else.348, label %common.ret

else.342:                                         ; preds = %then.341
  %bcmp2 = call i32 @bcmp(ptr %tmpv.494.sroa.0.0.copyload, ptr %tmpv.495.sroa.0.0.copyload, i64 %tmpv.494.sroa.2.0.copyload)
  %icmp.382 = icmp eq i32 %bcmp2, 0
  br label %fallthrough.341

common.ret:                                       ; preds = %fallthrough.341, %else.348, %else.351, %else.353, %else.356, %else.359, %else.362, %else.365, %else.368, %else.371
  %common.ret.op = phi i8 [ %spec.select36, %else.371 ], [ 0, %else.368 ], [ 0, %else.365 ], [ 0, %else.362 ], [ 0, %else.359 ], [ 0, %else.356 ], [ 0, %else.353 ], [ 0, %else.351 ], [ 0, %else.348 ], [ 0, %fallthrough.341 ]
  ret i8 %common.ret.op

else.348:                                         ; preds = %fallthrough.341
  %tmpv.509.sroa.0.0.cast.1930.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 32
  %tmpv.509.sroa.0.0.copyload = load ptr, ptr %tmpv.509.sroa.0.0.cast.1930.sroa_idx, align 8
  %tmpv.509.sroa.3.0.cast.1930.sroa_idx6 = getelementptr inbounds i8, ptr %key1, i64 40
  %tmpv.509.sroa.3.0.copyload = load i64, ptr %tmpv.509.sroa.3.0.cast.1930.sroa_idx6, align 8
  %tmpv.511.sroa.0.0.cast.1933.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 32
  %tmpv.511.sroa.0.0.copyload = load ptr, ptr %tmpv.511.sroa.0.0.cast.1933.sroa_idx, align 8
  %tmpv.511.sroa.3.0.cast.1933.sroa_idx4 = getelementptr inbounds i8, ptr %key2, i64 40
  %tmpv.511.sroa.3.0.copyload = load i64, ptr %tmpv.511.sroa.3.0.cast.1933.sroa_idx4, align 8
  %icmp.391 = icmp eq i64 %tmpv.509.sroa.3.0.copyload, %tmpv.511.sroa.3.0.copyload
  br i1 %icmp.391, label %then.350, label %common.ret

then.350:                                         ; preds = %else.348
  %icmp.392 = icmp eq ptr %tmpv.509.sroa.0.0.copyload, %tmpv.511.sroa.0.0.copyload
  br i1 %icmp.392, label %else.353, label %else.351

else.351:                                         ; preds = %then.350
  %bcmp = call i32 @bcmp(ptr %tmpv.509.sroa.0.0.copyload, ptr %tmpv.511.sroa.0.0.copyload, i64 %tmpv.509.sroa.3.0.copyload)
  %icmp.393 = icmp eq i32 %bcmp, 0
  br i1 %icmp.393, label %else.353, label %common.ret

else.353:                                         ; preds = %else.351, %then.350
  %tmpv.515.sroa.0.0.cast.1936.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 48
  %tmpv.515.sroa.0.0.copyload = load ptr, ptr %tmpv.515.sroa.0.0.cast.1936.sroa_idx, align 8
  %tmpv.515.sroa.3.0.cast.1936.sroa_idx3 = getelementptr inbounds i8, ptr %key1, i64 56
  %tmpv.515.sroa.3.0.copyload = load i64, ptr %tmpv.515.sroa.3.0.cast.1936.sroa_idx3, align 8
  %tmpv.517.sroa.0.0.cast.1939.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 48
  %tmpv.517.sroa.0.0.copyload = load ptr, ptr %tmpv.517.sroa.0.0.cast.1939.sroa_idx, align 8
  %tmpv.517.sroa.3.0.cast.1939.sroa_idx1 = getelementptr inbounds i8, ptr %key2, i64 56
  %tmpv.517.sroa.3.0.copyload = load i64, ptr %tmpv.517.sroa.3.0.cast.1939.sroa_idx1, align 8
  %icmp.397 = icmp eq i64 %tmpv.515.sroa.3.0.copyload, %tmpv.517.sroa.3.0.copyload
  br i1 %icmp.397, label %then.355, label %common.ret

then.355:                                         ; preds = %else.353
  %icmp.398 = icmp eq ptr %tmpv.515.sroa.0.0.copyload, %tmpv.517.sroa.0.0.copyload
  br i1 %icmp.398, label %else.359, label %else.356

else.356:                                         ; preds = %then.355
  %bcmp1 = call i32 @bcmp(ptr %tmpv.515.sroa.0.0.copyload, ptr %tmpv.517.sroa.0.0.copyload, i64 %tmpv.515.sroa.3.0.copyload)
  %icmp.399 = icmp eq i32 %bcmp1, 0
  br i1 %icmp.399, label %else.359, label %common.ret

else.359:                                         ; preds = %else.356, %then.355
  %field.489 = getelementptr inbounds i8, ptr %key1, i64 64
  %.field.ld.136 = load i32, ptr %field.489, align 4
  %field.490 = getelementptr inbounds i8, ptr %key2, i64 64
  %.field.ld.137 = load i32, ptr %field.490, align 4
  %icmp.403.not = icmp eq i32 %.field.ld.136, %.field.ld.137
  br i1 %icmp.403.not, label %else.362, label %common.ret

else.362:                                         ; preds = %else.359
  %field.491 = getelementptr inbounds i8, ptr %key1, i64 68
  %.field.ld.138 = load i32, ptr %field.491, align 4
  %field.492 = getelementptr inbounds i8, ptr %key2, i64 68
  %.field.ld.139 = load i32, ptr %field.492, align 4
  %icmp.406.not = icmp eq i32 %.field.ld.138, %.field.ld.139
  br i1 %icmp.406.not, label %else.365, label %common.ret

else.365:                                         ; preds = %else.362
  %field.493 = getelementptr inbounds i8, ptr %key1, i64 72
  %.field.ld.140 = load i32, ptr %field.493, align 4
  %field.494 = getelementptr inbounds i8, ptr %key2, i64 72
  %.field.ld.141 = load i32, ptr %field.494, align 4
  %icmp.409.not = icmp eq i32 %.field.ld.140, %.field.ld.141
  br i1 %icmp.409.not, label %else.368, label %common.ret

else.368:                                         ; preds = %else.365
  %field.495 = getelementptr inbounds i8, ptr %key1, i64 76
  %.field.ld.142 = load i32, ptr %field.495, align 4
  %field.496 = getelementptr inbounds i8, ptr %key2, i64 76
  %.field.ld.143 = load i32, ptr %field.496, align 4
  %icmp.412.not = icmp eq i32 %.field.ld.142, %.field.ld.143
  br i1 %icmp.412.not, label %else.371, label %common.ret

else.371:                                         ; preds = %else.368
  %field.497 = getelementptr inbounds i8, ptr %key1, i64 80
  %.field.ld.144 = load i32, ptr %field.497, align 4
  %field.498 = getelementptr inbounds i8, ptr %key2, i64 80
  %.field.ld.145 = load i32, ptr %field.498, align 4
  %icmp.415.not = icmp eq i32 %.field.ld.144, %.field.ld.145
  %spec.select36 = zext i1 %icmp.415.not to i8
  br label %common.ret
}

define i8 @go_0llvm.RR__Header..eq(ptr nest nocapture readnone %nest.65, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.291 = icmp eq ptr %key1, null
  br i1 %icmp.291, label %then.258, label %else.258, !make.implicit !3

then.258:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.258:                                         ; preds = %entry
  %tmpv.414.sroa.0.0.copyload = load ptr, ptr %key1, align 8
  %icmp.292 = icmp eq ptr %key2, null
  br i1 %icmp.292, label %then.259, label %else.259, !make.implicit !3

then.259:                                         ; preds = %else.258
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.259:                                         ; preds = %else.258
  %tmpv.414.sroa.3.0.cast.1828.sroa_idx3 = getelementptr inbounds i8, ptr %key1, i64 8
  %tmpv.414.sroa.3.0.copyload = load i64, ptr %tmpv.414.sroa.3.0.cast.1828.sroa_idx3, align 8
  %tmpv.416.sroa.0.0.copyload = load ptr, ptr %key2, align 8
  %tmpv.416.sroa.3.0.cast.1831.sroa_idx1 = getelementptr inbounds i8, ptr %key2, i64 8
  %tmpv.416.sroa.3.0.copyload = load i64, ptr %tmpv.416.sroa.3.0.cast.1831.sroa_idx1, align 8
  %icmp.293 = icmp eq i64 %tmpv.414.sroa.3.0.copyload, %tmpv.416.sroa.3.0.copyload
  br i1 %icmp.293, label %then.260, label %common.ret

then.260:                                         ; preds = %else.259
  %icmp.294 = icmp eq ptr %tmpv.414.sroa.0.0.copyload, %tmpv.416.sroa.0.0.copyload
  br i1 %icmp.294, label %else.264, label %else.261

else.261:                                         ; preds = %then.260
  %bcmp = call i32 @bcmp(ptr %tmpv.414.sroa.0.0.copyload, ptr %tmpv.416.sroa.0.0.copyload, i64 %tmpv.414.sroa.3.0.copyload)
  %icmp.295 = icmp eq i32 %bcmp, 0
  br i1 %icmp.295, label %else.264, label %common.ret

common.ret:                                       ; preds = %else.259, %else.261, %else.264, %else.267, %else.270, %else.273
  %common.ret.op = phi i8 [ %spec.select, %else.273 ], [ 0, %else.270 ], [ 0, %else.267 ], [ 0, %else.264 ], [ 0, %else.261 ], [ 0, %else.259 ]
  ret i8 %common.ret.op

else.264:                                         ; preds = %else.261, %then.260
  %field.368 = getelementptr inbounds i8, ptr %key1, i64 16
  %.field.ld.110 = load i16, ptr %field.368, align 2
  %field.369 = getelementptr inbounds i8, ptr %key2, i64 16
  %.field.ld.111 = load i16, ptr %field.369, align 2
  %icmp.299.not = icmp eq i16 %.field.ld.110, %.field.ld.111
  br i1 %icmp.299.not, label %else.267, label %common.ret

else.267:                                         ; preds = %else.264
  %field.370 = getelementptr inbounds i8, ptr %key1, i64 18
  %.field.ld.112 = load i16, ptr %field.370, align 2
  %field.371 = getelementptr inbounds i8, ptr %key2, i64 18
  %.field.ld.113 = load i16, ptr %field.371, align 2
  %icmp.302.not = icmp eq i16 %.field.ld.112, %.field.ld.113
  br i1 %icmp.302.not, label %else.270, label %common.ret

else.270:                                         ; preds = %else.267
  %field.372 = getelementptr inbounds i8, ptr %key1, i64 20
  %.field.ld.114 = load i32, ptr %field.372, align 4
  %field.373 = getelementptr inbounds i8, ptr %key2, i64 20
  %.field.ld.115 = load i32, ptr %field.373, align 4
  %icmp.305.not = icmp eq i32 %.field.ld.114, %.field.ld.115
  br i1 %icmp.305.not, label %else.273, label %common.ret

else.273:                                         ; preds = %else.270
  %field.374 = getelementptr inbounds i8, ptr %key1, i64 24
  %.field.ld.116 = load i16, ptr %field.374, align 2
  %field.375 = getelementptr inbounds i8, ptr %key2, i64 24
  %.field.ld.117 = load i16, ptr %field.375, align 2
  %icmp.308.not = icmp eq i16 %.field.ld.116, %.field.ld.117
  %spec.select = zext i1 %icmp.308.not to i8
  br label %common.ret
}

define ptr @go_0llvm.SOA.Header(ptr nest nocapture readnone %nest.5, ptr readnone returned %rr) #0 {
entry:
  %icmp.7 = icmp eq ptr %rr, null
  br i1 %icmp.7, label %then.4, label %else.4, !make.implicit !3

then.4:                                           ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.4:                                           ; preds = %entry
  ret ptr %rr
}

define { ptr, ptr } @go_0llvm.SOA.copy(ptr nest nocapture readnone %nest.11, ptr readonly %rr) #0 {
entry:
  %tmpv.38 = alloca %RR_Header.0, align 8
  %tmpv.40 = alloca { ptr, i64 }, align 8
  %tmpv.42 = alloca { ptr, i64 }, align 8
  %tmpv.55 = alloca %SOA.0, align 8, !go_addrtaken !3
  %icmp.22 = icmp eq ptr %rr, null
  br i1 %icmp.22, label %then.19, label %else.19, !make.implicit !3

then.19:                                          ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.19:                                          ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %tmpv.38, ptr noundef nonnull align 8 dereferenceable(32) %rr, i64 32, i1 false)
  %field.35 = getelementptr inbounds %SOA.0, ptr %rr, i64 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %tmpv.40, ptr noundef nonnull align 8 dereferenceable(16) %field.35, i64 16, i1 false)
  %field.36 = getelementptr inbounds %SOA.0, ptr %rr, i64 0, i32 2
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %tmpv.42, ptr noundef nonnull align 8 dereferenceable(16) %field.36, i64 16, i1 false)
  %field.37 = getelementptr inbounds %SOA.0, ptr %rr, i64 0, i32 3
  %.field.ld.1 = load i32, ptr %field.37, align 4
  %field.38 = getelementptr inbounds %SOA.0, ptr %rr, i64 0, i32 4
  %.field.ld.2 = load i32, ptr %field.38, align 4
  %field.39 = getelementptr inbounds %SOA.0, ptr %rr, i64 0, i32 5
  %.field.ld.3 = load i32, ptr %field.39, align 4
  %field.40 = getelementptr inbounds %SOA.0, ptr %rr, i64 0, i32 6
  %.field.ld.4 = load i32, ptr %field.40, align 4
  %field.41 = getelementptr inbounds %SOA.0, ptr %rr, i64 0, i32 7
  %.field.ld.5 = load i32, ptr %field.41, align 4
  %call.6 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.SOA..d)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %tmpv.55, ptr noundef nonnull align 8 dereferenceable(32) %tmpv.38, i64 32, i1 false)
  %field.43 = getelementptr inbounds %SOA.0, ptr %tmpv.55, i64 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %field.43, ptr noundef nonnull align 8 dereferenceable(16) %tmpv.40, i64 16, i1 false)
  %field.44 = getelementptr inbounds %SOA.0, ptr %tmpv.55, i64 0, i32 2
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %field.44, ptr noundef nonnull align 8 dereferenceable(16) %tmpv.42, i64 16, i1 false)
  %field.45 = getelementptr inbounds %SOA.0, ptr %tmpv.55, i64 0, i32 3
  store i32 %.field.ld.1, ptr %field.45, align 8
  %field.46 = getelementptr inbounds %SOA.0, ptr %tmpv.55, i64 0, i32 4
  store i32 %.field.ld.2, ptr %field.46, align 4
  %field.47 = getelementptr inbounds %SOA.0, ptr %tmpv.55, i64 0, i32 5
  store i32 %.field.ld.3, ptr %field.47, align 8
  %field.48 = getelementptr inbounds %SOA.0, ptr %tmpv.55, i64 0, i32 6
  store i32 %.field.ld.4, ptr %field.48, align 4
  %field.49 = getelementptr inbounds %SOA.0, ptr %tmpv.55, i64 0, i32 7
  store i32 %.field.ld.5, ptr %field.49, align 8
  %deref.ld.6 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.30 = icmp eq i32 %deref.ld.6, 0
  br i1 %icmp.30, label %then.27, label %else.27

then.27:                                          ; preds = %else.19
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(88) %call.6, ptr noundef nonnull align 8 dereferenceable(88) %tmpv.55, i64 88, i1 false)
  br label %fallthrough.27

fallthrough.27:                                   ; preds = %else.27, %then.27
  %ld.4.fca.1.insert = insertvalue { ptr, ptr } { ptr @pimt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.SOA, ptr undef }, ptr %call.6, 1
  ret { ptr, ptr } %ld.4.fca.1.insert

else.27:                                          ; preds = %else.19
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.SOA..d, ptr nonnull %call.6, ptr nonnull %tmpv.55)
  br label %fallthrough.27
}

define i8 @go_0llvm.DNAME..eq(ptr nest nocapture readnone %nest.71, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.422 = icmp eq ptr %key1, null
  br i1 %icmp.422, label %then.380, label %else.380, !make.implicit !3

then.380:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.380:                                         ; preds = %entry
  %tmpv.539.sroa.0.0.copyload = load ptr, ptr %key1, align 8
  %tmpv.539.sroa.3.0.cast.1964.sroa_idx20 = getelementptr inbounds i8, ptr %key1, i64 16
  %tmpv.539.sroa.3.0.copyload = load i16, ptr %tmpv.539.sroa.3.0.cast.1964.sroa_idx20, align 8
  %tmpv.539.sroa.5.0.cast.1964.sroa_idx21 = getelementptr inbounds i8, ptr %key1, i64 18
  %tmpv.539.sroa.5.0.copyload = load i16, ptr %tmpv.539.sroa.5.0.cast.1964.sroa_idx21, align 2
  %tmpv.539.sroa.6.0.cast.1964.sroa_idx22 = getelementptr inbounds i8, ptr %key1, i64 20
  %tmpv.539.sroa.6.0.copyload = load i32, ptr %tmpv.539.sroa.6.0.cast.1964.sroa_idx22, align 4
  %tmpv.539.sroa.7.0.cast.1964.sroa_idx23 = getelementptr inbounds i8, ptr %key1, i64 24
  %tmpv.539.sroa.7.0.copyload = load i16, ptr %tmpv.539.sroa.7.0.cast.1964.sroa_idx23, align 8
  %icmp.423 = icmp eq ptr %key2, null
  br i1 %icmp.423, label %then.381, label %else.381, !make.implicit !3

then.381:                                         ; preds = %else.380
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.381:                                         ; preds = %else.380
  %tmpv.539.sroa.2.0.cast.1964.sroa_idx19 = getelementptr inbounds i8, ptr %key1, i64 8
  %tmpv.539.sroa.2.0.copyload = load i64, ptr %tmpv.539.sroa.2.0.cast.1964.sroa_idx19, align 8
  %tmpv.540.sroa.0.0.copyload = load ptr, ptr %key2, align 8
  %tmpv.540.sroa.2.0.cast.1969.sroa_idx14 = getelementptr inbounds i8, ptr %key2, i64 8
  %tmpv.540.sroa.2.0.copyload = load i64, ptr %tmpv.540.sroa.2.0.cast.1969.sroa_idx14, align 8
  %tmpv.540.sroa.3.0.cast.1969.sroa_idx15 = getelementptr inbounds i8, ptr %key2, i64 16
  %tmpv.540.sroa.3.0.copyload = load i16, ptr %tmpv.540.sroa.3.0.cast.1969.sroa_idx15, align 8
  %tmpv.540.sroa.5.0.cast.1969.sroa_idx16 = getelementptr inbounds i8, ptr %key2, i64 18
  %tmpv.540.sroa.5.0.copyload = load i16, ptr %tmpv.540.sroa.5.0.cast.1969.sroa_idx16, align 2
  %tmpv.540.sroa.6.0.cast.1969.sroa_idx17 = getelementptr inbounds i8, ptr %key2, i64 20
  %tmpv.540.sroa.6.0.copyload = load i32, ptr %tmpv.540.sroa.6.0.cast.1969.sroa_idx17, align 4
  %tmpv.540.sroa.7.0.cast.1969.sroa_idx18 = getelementptr inbounds i8, ptr %key2, i64 24
  %tmpv.540.sroa.7.0.copyload = load i16, ptr %tmpv.540.sroa.7.0.cast.1969.sroa_idx18, align 8
  %icmp.424 = icmp eq i64 %tmpv.539.sroa.2.0.copyload, %tmpv.540.sroa.2.0.copyload
  br i1 %icmp.424, label %then.382, label %fallthrough.382

then.382:                                         ; preds = %else.381
  %icmp.425 = icmp eq ptr %tmpv.539.sroa.0.0.copyload, %tmpv.540.sroa.0.0.copyload
  br i1 %icmp.425, label %fallthrough.382, label %else.383

fallthrough.382:                                  ; preds = %else.383, %then.382, %else.381
  %tmpv.549.0 = phi i1 [ false, %else.381 ], [ %icmp.426, %else.383 ], [ true, %then.382 ]
  %icmp.428 = icmp eq i16 %tmpv.539.sroa.3.0.copyload, %tmpv.540.sroa.3.0.copyload
  %spec.select = select i1 %tmpv.549.0, i1 %icmp.428, i1 false
  %icmp.429 = icmp eq i16 %tmpv.539.sroa.5.0.copyload, %tmpv.540.sroa.5.0.copyload
  %tmpv.551.0.in = select i1 %spec.select, i1 %icmp.429, i1 false
  %icmp.430 = icmp eq i32 %tmpv.539.sroa.6.0.copyload, %tmpv.540.sroa.6.0.copyload
  %spec.select26 = select i1 %tmpv.551.0.in, i1 %icmp.430, i1 false
  %icmp.431 = icmp eq i16 %tmpv.539.sroa.7.0.copyload, %tmpv.540.sroa.7.0.copyload
  %tmpv.553.0.in = select i1 %spec.select26, i1 %icmp.431, i1 false
  br i1 %tmpv.553.0.in, label %else.389, label %then.388

else.383:                                         ; preds = %then.382
  %bcmp1 = call i32 @bcmp(ptr %tmpv.539.sroa.0.0.copyload, ptr %tmpv.540.sroa.0.0.copyload, i64 %tmpv.539.sroa.2.0.copyload)
  %icmp.426 = icmp eq i32 %bcmp1, 0
  br label %fallthrough.382

then.388:                                         ; preds = %else.392, %then.391, %else.389, %fallthrough.382
  %merge = phi i8 [ 0, %fallthrough.382 ], [ 0, %else.389 ], [ %phi.cast, %else.392 ], [ 1, %then.391 ]
  ret i8 %merge

else.389:                                         ; preds = %fallthrough.382
  %tmpv.554.sroa.0.0.cast.1978.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 32
  %tmpv.554.sroa.0.0.copyload = load ptr, ptr %tmpv.554.sroa.0.0.cast.1978.sroa_idx, align 8
  %tmpv.554.sroa.3.0.cast.1978.sroa_idx3 = getelementptr inbounds i8, ptr %key1, i64 40
  %tmpv.554.sroa.3.0.copyload = load i64, ptr %tmpv.554.sroa.3.0.cast.1978.sroa_idx3, align 8
  %tmpv.556.sroa.0.0.cast.1981.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 32
  %tmpv.556.sroa.0.0.copyload = load ptr, ptr %tmpv.556.sroa.0.0.cast.1981.sroa_idx, align 8
  %tmpv.556.sroa.3.0.cast.1981.sroa_idx1 = getelementptr inbounds i8, ptr %key2, i64 40
  %tmpv.556.sroa.3.0.copyload = load i64, ptr %tmpv.556.sroa.3.0.cast.1981.sroa_idx1, align 8
  %icmp.435 = icmp eq i64 %tmpv.554.sroa.3.0.copyload, %tmpv.556.sroa.3.0.copyload
  br i1 %icmp.435, label %then.391, label %then.388

then.391:                                         ; preds = %else.389
  %icmp.436 = icmp eq ptr %tmpv.554.sroa.0.0.copyload, %tmpv.556.sroa.0.0.copyload
  br i1 %icmp.436, label %then.388, label %else.392

else.392:                                         ; preds = %then.391
  %bcmp = call i32 @bcmp(ptr %tmpv.554.sroa.0.0.copyload, ptr %tmpv.556.sroa.0.0.copyload, i64 %tmpv.554.sroa.3.0.copyload)
  %icmp.437 = icmp eq i32 %bcmp, 0
  %phi.cast = zext i1 %icmp.437 to i8
  br label %then.388
}

define ptr @go_0llvm.DNAME.Header(ptr nest nocapture readnone %nest.2, ptr readnone returned %rr) #0 {
entry:
  %icmp.4 = icmp eq ptr %rr, null
  br i1 %icmp.4, label %then.1, label %else.1, !make.implicit !3

then.1:                                           ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.1:                                           ; preds = %entry
  ret ptr %rr
}

define { ptr, ptr } @go_0llvm.DNAME.copy(ptr nest nocapture readnone %nest.8, ptr readonly %rr) #0 {
entry:
  %tmpv.18 = alloca %RR_Header.0, align 8
  %tmpv.20 = alloca { ptr, i64 }, align 8
  %tmpv.23 = alloca %DNAME.0, align 8, !go_addrtaken !3
  %icmp.12 = icmp eq ptr %rr, null
  br i1 %icmp.12, label %then.9, label %else.9, !make.implicit !3

then.9:                                           ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.9:                                           ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %tmpv.18, ptr noundef nonnull align 8 dereferenceable(32) %rr, i64 32, i1 false)
  %field.15 = getelementptr inbounds %DNAME.0, ptr %rr, i64 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %tmpv.20, ptr noundef nonnull align 8 dereferenceable(16) %field.15, i64 16, i1 false)
  %call.3 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.DNAME..d)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %tmpv.23, ptr noundef nonnull align 8 dereferenceable(32) %tmpv.18, i64 32, i1 false)
  %field.17 = getelementptr inbounds %DNAME.0, ptr %tmpv.23, i64 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %field.17, ptr noundef nonnull align 8 dereferenceable(16) %tmpv.20, i64 16, i1 false)
  %deref.ld.3 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.14 = icmp eq i32 %deref.ld.3, 0
  br i1 %icmp.14, label %then.11, label %else.11

then.11:                                          ; preds = %else.9
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(48) %call.3, ptr noundef nonnull align 8 dereferenceable(48) %tmpv.23, i64 48, i1 false)
  br label %fallthrough.11

fallthrough.11:                                   ; preds = %else.11, %then.11
  %ld.1.fca.1.insert = insertvalue { ptr, ptr } { ptr @pimt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.DNAME, ptr undef }, ptr %call.3, 1
  ret { ptr, ptr } %ld.1.fca.1.insert

else.11:                                          ; preds = %else.9
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.DNAME..d, ptr nonnull %call.3, ptr nonnull %tmpv.23)
  br label %fallthrough.11
}

define i8 @go_0llvm.CNAME..eq(ptr nest nocapture readnone %nest.72, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.439 = icmp eq ptr %key1, null
  br i1 %icmp.439, label %then.395, label %else.395, !make.implicit !3

then.395:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.395:                                         ; preds = %entry
  %tmpv.562.sroa.0.0.copyload = load ptr, ptr %key1, align 8
  %tmpv.562.sroa.3.0.cast.1986.sroa_idx20 = getelementptr inbounds i8, ptr %key1, i64 16
  %tmpv.562.sroa.3.0.copyload = load i16, ptr %tmpv.562.sroa.3.0.cast.1986.sroa_idx20, align 8
  %tmpv.562.sroa.5.0.cast.1986.sroa_idx21 = getelementptr inbounds i8, ptr %key1, i64 18
  %tmpv.562.sroa.5.0.copyload = load i16, ptr %tmpv.562.sroa.5.0.cast.1986.sroa_idx21, align 2
  %tmpv.562.sroa.6.0.cast.1986.sroa_idx22 = getelementptr inbounds i8, ptr %key1, i64 20
  %tmpv.562.sroa.6.0.copyload = load i32, ptr %tmpv.562.sroa.6.0.cast.1986.sroa_idx22, align 4
  %tmpv.562.sroa.7.0.cast.1986.sroa_idx23 = getelementptr inbounds i8, ptr %key1, i64 24
  %tmpv.562.sroa.7.0.copyload = load i16, ptr %tmpv.562.sroa.7.0.cast.1986.sroa_idx23, align 8
  %icmp.440 = icmp eq ptr %key2, null
  br i1 %icmp.440, label %then.396, label %else.396, !make.implicit !3

then.396:                                         ; preds = %else.395
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.396:                                         ; preds = %else.395
  %tmpv.562.sroa.2.0.cast.1986.sroa_idx19 = getelementptr inbounds i8, ptr %key1, i64 8
  %tmpv.562.sroa.2.0.copyload = load i64, ptr %tmpv.562.sroa.2.0.cast.1986.sroa_idx19, align 8
  %tmpv.563.sroa.0.0.copyload = load ptr, ptr %key2, align 8
  %tmpv.563.sroa.2.0.cast.1991.sroa_idx14 = getelementptr inbounds i8, ptr %key2, i64 8
  %tmpv.563.sroa.2.0.copyload = load i64, ptr %tmpv.563.sroa.2.0.cast.1991.sroa_idx14, align 8
  %tmpv.563.sroa.3.0.cast.1991.sroa_idx15 = getelementptr inbounds i8, ptr %key2, i64 16
  %tmpv.563.sroa.3.0.copyload = load i16, ptr %tmpv.563.sroa.3.0.cast.1991.sroa_idx15, align 8
  %tmpv.563.sroa.5.0.cast.1991.sroa_idx16 = getelementptr inbounds i8, ptr %key2, i64 18
  %tmpv.563.sroa.5.0.copyload = load i16, ptr %tmpv.563.sroa.5.0.cast.1991.sroa_idx16, align 2
  %tmpv.563.sroa.6.0.cast.1991.sroa_idx17 = getelementptr inbounds i8, ptr %key2, i64 20
  %tmpv.563.sroa.6.0.copyload = load i32, ptr %tmpv.563.sroa.6.0.cast.1991.sroa_idx17, align 4
  %tmpv.563.sroa.7.0.cast.1991.sroa_idx18 = getelementptr inbounds i8, ptr %key2, i64 24
  %tmpv.563.sroa.7.0.copyload = load i16, ptr %tmpv.563.sroa.7.0.cast.1991.sroa_idx18, align 8
  %icmp.441 = icmp eq i64 %tmpv.562.sroa.2.0.copyload, %tmpv.563.sroa.2.0.copyload
  br i1 %icmp.441, label %then.397, label %fallthrough.397

then.397:                                         ; preds = %else.396
  %icmp.442 = icmp eq ptr %tmpv.562.sroa.0.0.copyload, %tmpv.563.sroa.0.0.copyload
  br i1 %icmp.442, label %fallthrough.397, label %else.398

fallthrough.397:                                  ; preds = %else.398, %then.397, %else.396
  %tmpv.572.0 = phi i1 [ false, %else.396 ], [ %icmp.443, %else.398 ], [ true, %then.397 ]
  %icmp.445 = icmp eq i16 %tmpv.562.sroa.3.0.copyload, %tmpv.563.sroa.3.0.copyload
  %spec.select = select i1 %tmpv.572.0, i1 %icmp.445, i1 false
  %icmp.446 = icmp eq i16 %tmpv.562.sroa.5.0.copyload, %tmpv.563.sroa.5.0.copyload
  %tmpv.574.0.in = select i1 %spec.select, i1 %icmp.446, i1 false
  %icmp.447 = icmp eq i32 %tmpv.562.sroa.6.0.copyload, %tmpv.563.sroa.6.0.copyload
  %spec.select26 = select i1 %tmpv.574.0.in, i1 %icmp.447, i1 false
  %icmp.448 = icmp eq i16 %tmpv.562.sroa.7.0.copyload, %tmpv.563.sroa.7.0.copyload
  %tmpv.576.0.in = select i1 %spec.select26, i1 %icmp.448, i1 false
  br i1 %tmpv.576.0.in, label %else.404, label %then.403

else.398:                                         ; preds = %then.397
  %bcmp1 = call i32 @bcmp(ptr %tmpv.562.sroa.0.0.copyload, ptr %tmpv.563.sroa.0.0.copyload, i64 %tmpv.562.sroa.2.0.copyload)
  %icmp.443 = icmp eq i32 %bcmp1, 0
  br label %fallthrough.397

then.403:                                         ; preds = %else.407, %then.406, %else.404, %fallthrough.397
  %merge = phi i8 [ 0, %fallthrough.397 ], [ 0, %else.404 ], [ %phi.cast, %else.407 ], [ 1, %then.406 ]
  ret i8 %merge

else.404:                                         ; preds = %fallthrough.397
  %tmpv.577.sroa.0.0.cast.2000.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 32
  %tmpv.577.sroa.0.0.copyload = load ptr, ptr %tmpv.577.sroa.0.0.cast.2000.sroa_idx, align 8
  %tmpv.577.sroa.3.0.cast.2000.sroa_idx3 = getelementptr inbounds i8, ptr %key1, i64 40
  %tmpv.577.sroa.3.0.copyload = load i64, ptr %tmpv.577.sroa.3.0.cast.2000.sroa_idx3, align 8
  %tmpv.579.sroa.0.0.cast.2003.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 32
  %tmpv.579.sroa.0.0.copyload = load ptr, ptr %tmpv.579.sroa.0.0.cast.2003.sroa_idx, align 8
  %tmpv.579.sroa.3.0.cast.2003.sroa_idx1 = getelementptr inbounds i8, ptr %key2, i64 40
  %tmpv.579.sroa.3.0.copyload = load i64, ptr %tmpv.579.sroa.3.0.cast.2003.sroa_idx1, align 8
  %icmp.452 = icmp eq i64 %tmpv.577.sroa.3.0.copyload, %tmpv.579.sroa.3.0.copyload
  br i1 %icmp.452, label %then.406, label %then.403

then.406:                                         ; preds = %else.404
  %icmp.453 = icmp eq ptr %tmpv.577.sroa.0.0.copyload, %tmpv.579.sroa.0.0.copyload
  br i1 %icmp.453, label %then.403, label %else.407

else.407:                                         ; preds = %then.406
  %bcmp = call i32 @bcmp(ptr %tmpv.577.sroa.0.0.copyload, ptr %tmpv.579.sroa.0.0.copyload, i64 %tmpv.577.sroa.3.0.copyload)
  %icmp.454 = icmp eq i32 %bcmp, 0
  %phi.cast = zext i1 %icmp.454 to i8
  br label %then.403
}

define ptr @go_0llvm.CNAME.Header(ptr nest nocapture readnone %nest.1, ptr readnone returned %rr) #0 {
entry:
  %icmp.3 = icmp eq ptr %rr, null
  br i1 %icmp.3, label %then.0, label %else.0, !make.implicit !3

then.0:                                           ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.0:                                           ; preds = %entry
  ret ptr %rr
}

define { ptr, ptr } @go_0llvm.CNAME.copy(ptr nest nocapture readnone %nest.7, ptr readonly %rr) #0 {
entry:
  %tmpv.12 = alloca %RR_Header.0, align 8
  %tmpv.14 = alloca { ptr, i64 }, align 8
  %tmpv.17 = alloca %CNAME.0, align 8, !go_addrtaken !3
  %icmp.9 = icmp eq ptr %rr, null
  br i1 %icmp.9, label %then.6, label %else.6, !make.implicit !3

then.6:                                           ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.6:                                           ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %tmpv.12, ptr noundef nonnull align 8 dereferenceable(32) %rr, i64 32, i1 false)
  %field.9 = getelementptr inbounds %CNAME.0, ptr %rr, i64 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %tmpv.14, ptr noundef nonnull align 8 dereferenceable(16) %field.9, i64 16, i1 false)
  %call.2 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.CNAME..d)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %tmpv.17, ptr noundef nonnull align 8 dereferenceable(32) %tmpv.12, i64 32, i1 false)
  %field.11 = getelementptr inbounds %CNAME.0, ptr %tmpv.17, i64 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %field.11, ptr noundef nonnull align 8 dereferenceable(16) %tmpv.14, i64 16, i1 false)
  %deref.ld.2 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.11 = icmp eq i32 %deref.ld.2, 0
  br i1 %icmp.11, label %then.8, label %else.8

then.8:                                           ; preds = %else.6
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(48) %call.2, ptr noundef nonnull align 8 dereferenceable(48) %tmpv.17, i64 48, i1 false)
  br label %fallthrough.8

fallthrough.8:                                    ; preds = %else.8, %then.8
  %ld.0.fca.1.insert = insertvalue { ptr, ptr } { ptr @pimt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.CNAME, ptr undef }, ptr %call.2, 1
  ret { ptr, ptr } %ld.0.fca.1.insert

else.8:                                           ; preds = %else.6
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.CNAME..d, ptr nonnull %call.2, ptr nonnull %tmpv.17)
  br label %fallthrough.8
}

define i8 @go_0llvm.SRV..eq(ptr nest nocapture readnone %nest.73, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.456 = icmp eq ptr %key1, null
  br i1 %icmp.456, label %then.410, label %else.410, !make.implicit !3

then.410:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.410:                                         ; preds = %entry
  %tmpv.585.sroa.0.0.copyload = load ptr, ptr %key1, align 8
  %tmpv.585.sroa.3.0.cast.2008.sroa_idx20 = getelementptr inbounds i8, ptr %key1, i64 16
  %tmpv.585.sroa.3.0.copyload = load i16, ptr %tmpv.585.sroa.3.0.cast.2008.sroa_idx20, align 8
  %tmpv.585.sroa.5.0.cast.2008.sroa_idx21 = getelementptr inbounds i8, ptr %key1, i64 18
  %tmpv.585.sroa.5.0.copyload = load i16, ptr %tmpv.585.sroa.5.0.cast.2008.sroa_idx21, align 2
  %tmpv.585.sroa.6.0.cast.2008.sroa_idx22 = getelementptr inbounds i8, ptr %key1, i64 20
  %tmpv.585.sroa.6.0.copyload = load i32, ptr %tmpv.585.sroa.6.0.cast.2008.sroa_idx22, align 4
  %tmpv.585.sroa.7.0.cast.2008.sroa_idx23 = getelementptr inbounds i8, ptr %key1, i64 24
  %tmpv.585.sroa.7.0.copyload = load i16, ptr %tmpv.585.sroa.7.0.cast.2008.sroa_idx23, align 8
  %icmp.457 = icmp eq ptr %key2, null
  br i1 %icmp.457, label %then.411, label %else.411, !make.implicit !3

then.411:                                         ; preds = %else.410
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.411:                                         ; preds = %else.410
  %tmpv.585.sroa.2.0.cast.2008.sroa_idx19 = getelementptr inbounds i8, ptr %key1, i64 8
  %tmpv.585.sroa.2.0.copyload = load i64, ptr %tmpv.585.sroa.2.0.cast.2008.sroa_idx19, align 8
  %tmpv.586.sroa.0.0.copyload = load ptr, ptr %key2, align 8
  %tmpv.586.sroa.2.0.cast.2013.sroa_idx14 = getelementptr inbounds i8, ptr %key2, i64 8
  %tmpv.586.sroa.2.0.copyload = load i64, ptr %tmpv.586.sroa.2.0.cast.2013.sroa_idx14, align 8
  %tmpv.586.sroa.3.0.cast.2013.sroa_idx15 = getelementptr inbounds i8, ptr %key2, i64 16
  %tmpv.586.sroa.3.0.copyload = load i16, ptr %tmpv.586.sroa.3.0.cast.2013.sroa_idx15, align 8
  %tmpv.586.sroa.5.0.cast.2013.sroa_idx16 = getelementptr inbounds i8, ptr %key2, i64 18
  %tmpv.586.sroa.5.0.copyload = load i16, ptr %tmpv.586.sroa.5.0.cast.2013.sroa_idx16, align 2
  %tmpv.586.sroa.6.0.cast.2013.sroa_idx17 = getelementptr inbounds i8, ptr %key2, i64 20
  %tmpv.586.sroa.6.0.copyload = load i32, ptr %tmpv.586.sroa.6.0.cast.2013.sroa_idx17, align 4
  %tmpv.586.sroa.7.0.cast.2013.sroa_idx18 = getelementptr inbounds i8, ptr %key2, i64 24
  %tmpv.586.sroa.7.0.copyload = load i16, ptr %tmpv.586.sroa.7.0.cast.2013.sroa_idx18, align 8
  %icmp.458 = icmp eq i64 %tmpv.585.sroa.2.0.copyload, %tmpv.586.sroa.2.0.copyload
  br i1 %icmp.458, label %then.412, label %fallthrough.412

then.412:                                         ; preds = %else.411
  %icmp.459 = icmp eq ptr %tmpv.585.sroa.0.0.copyload, %tmpv.586.sroa.0.0.copyload
  br i1 %icmp.459, label %fallthrough.412, label %else.413

fallthrough.412:                                  ; preds = %else.413, %then.412, %else.411
  %tmpv.595.0 = phi i1 [ false, %else.411 ], [ %icmp.460, %else.413 ], [ true, %then.412 ]
  %icmp.462 = icmp eq i16 %tmpv.585.sroa.3.0.copyload, %tmpv.586.sroa.3.0.copyload
  %spec.select = select i1 %tmpv.595.0, i1 %icmp.462, i1 false
  %icmp.463 = icmp eq i16 %tmpv.585.sroa.5.0.copyload, %tmpv.586.sroa.5.0.copyload
  %tmpv.597.0.in = select i1 %spec.select, i1 %icmp.463, i1 false
  %icmp.464 = icmp eq i32 %tmpv.585.sroa.6.0.copyload, %tmpv.586.sroa.6.0.copyload
  %spec.select29 = select i1 %tmpv.597.0.in, i1 %icmp.464, i1 false
  %icmp.465 = icmp eq i16 %tmpv.585.sroa.7.0.copyload, %tmpv.586.sroa.7.0.copyload
  %tmpv.599.0.in = select i1 %spec.select29, i1 %icmp.465, i1 false
  br i1 %tmpv.599.0.in, label %else.420, label %then.418

else.413:                                         ; preds = %then.412
  %bcmp1 = call i32 @bcmp(ptr %tmpv.585.sroa.0.0.copyload, ptr %tmpv.586.sroa.0.0.copyload, i64 %tmpv.585.sroa.2.0.copyload)
  %icmp.460 = icmp eq i32 %bcmp1, 0
  br label %fallthrough.412

then.418:                                         ; preds = %else.431, %then.430, %else.428, %else.426, %else.423, %else.420, %fallthrough.412
  %merge = phi i8 [ 0, %else.426 ], [ 0, %else.423 ], [ 0, %else.420 ], [ 0, %fallthrough.412 ], [ 0, %else.428 ], [ %phi.cast, %else.431 ], [ 1, %then.430 ]
  ret i8 %merge

else.420:                                         ; preds = %fallthrough.412
  %field.578 = getelementptr inbounds i8, ptr %key1, i64 32
  %.field.ld.148 = load i16, ptr %field.578, align 2
  %field.579 = getelementptr inbounds i8, ptr %key2, i64 32
  %.field.ld.149 = load i16, ptr %field.579, align 2
  %icmp.469.not = icmp eq i16 %.field.ld.148, %.field.ld.149
  br i1 %icmp.469.not, label %else.423, label %then.418

else.423:                                         ; preds = %else.420
  %field.580 = getelementptr inbounds i8, ptr %key1, i64 34
  %.field.ld.150 = load i16, ptr %field.580, align 2
  %field.581 = getelementptr inbounds i8, ptr %key2, i64 34
  %.field.ld.151 = load i16, ptr %field.581, align 2
  %icmp.472.not = icmp eq i16 %.field.ld.150, %.field.ld.151
  br i1 %icmp.472.not, label %else.426, label %then.418

else.426:                                         ; preds = %else.423
  %field.582 = getelementptr inbounds i8, ptr %key1, i64 36
  %.field.ld.152 = load i16, ptr %field.582, align 2
  %field.583 = getelementptr inbounds i8, ptr %key2, i64 36
  %.field.ld.153 = load i16, ptr %field.583, align 2
  %icmp.475.not = icmp eq i16 %.field.ld.152, %.field.ld.153
  br i1 %icmp.475.not, label %else.428, label %then.418

else.428:                                         ; preds = %else.426
  %tmpv.606.sroa.0.0.cast.2028.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 40
  %tmpv.606.sroa.0.0.copyload = load ptr, ptr %tmpv.606.sroa.0.0.cast.2028.sroa_idx, align 8
  %tmpv.606.sroa.3.0.cast.2028.sroa_idx3 = getelementptr inbounds i8, ptr %key1, i64 48
  %tmpv.606.sroa.3.0.copyload = load i64, ptr %tmpv.606.sroa.3.0.cast.2028.sroa_idx3, align 8
  %tmpv.608.sroa.0.0.cast.2031.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 40
  %tmpv.608.sroa.0.0.copyload = load ptr, ptr %tmpv.608.sroa.0.0.cast.2031.sroa_idx, align 8
  %tmpv.608.sroa.3.0.cast.2031.sroa_idx1 = getelementptr inbounds i8, ptr %key2, i64 48
  %tmpv.608.sroa.3.0.copyload = load i64, ptr %tmpv.608.sroa.3.0.cast.2031.sroa_idx1, align 8
  %icmp.478 = icmp eq i64 %tmpv.606.sroa.3.0.copyload, %tmpv.608.sroa.3.0.copyload
  br i1 %icmp.478, label %then.430, label %then.418

then.430:                                         ; preds = %else.428
  %icmp.479 = icmp eq ptr %tmpv.606.sroa.0.0.copyload, %tmpv.608.sroa.0.0.copyload
  br i1 %icmp.479, label %then.418, label %else.431

else.431:                                         ; preds = %then.430
  %bcmp = call i32 @bcmp(ptr %tmpv.606.sroa.0.0.copyload, ptr %tmpv.608.sroa.0.0.copyload, i64 %tmpv.606.sroa.3.0.copyload)
  %icmp.480 = icmp eq i32 %bcmp, 0
  %phi.cast = zext i1 %icmp.480 to i8
  br label %then.418
}

define ptr @go_0llvm.SRV.Header(ptr nest nocapture readnone %nest.6, ptr readnone returned %rr) #0 {
entry:
  %icmp.8 = icmp eq ptr %rr, null
  br i1 %icmp.8, label %then.5, label %else.5, !make.implicit !3

then.5:                                           ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.5:                                           ; preds = %entry
  ret ptr %rr
}

define { ptr, ptr } @go_0llvm.SRV.copy(ptr nest nocapture readnone %nest.12, ptr readonly %rr) #0 {
entry:
  %tmpv.56 = alloca %RR_Header.0, align 8
  %tmpv.64 = alloca { ptr, i64 }, align 8
  %tmpv.67 = alloca %SRV.0, align 8, !go_addrtaken !3
  %icmp.31 = icmp eq ptr %rr, null
  br i1 %icmp.31, label %then.28, label %else.28, !make.implicit !3

then.28:                                          ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.28:                                          ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %tmpv.56, ptr noundef nonnull align 8 dereferenceable(32) %rr, i64 32, i1 false)
  %field.53 = getelementptr inbounds %SRV.0, ptr %rr, i64 0, i32 1
  %.field.ld.6 = load i16, ptr %field.53, align 2
  %field.54 = getelementptr inbounds %SRV.0, ptr %rr, i64 0, i32 2
  %.field.ld.7 = load i16, ptr %field.54, align 2
  %field.55 = getelementptr inbounds %SRV.0, ptr %rr, i64 0, i32 3
  %.field.ld.8 = load i16, ptr %field.55, align 2
  %field.56 = getelementptr inbounds %SRV.0, ptr %rr, i64 0, i32 4
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %tmpv.64, ptr noundef nonnull align 8 dereferenceable(16) %field.56, i64 16, i1 false)
  %call.7 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.SRV..d)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %tmpv.67, ptr noundef nonnull align 8 dereferenceable(32) %tmpv.56, i64 32, i1 false)
  %field.58 = getelementptr inbounds %SRV.0, ptr %tmpv.67, i64 0, i32 1
  store i16 %.field.ld.6, ptr %field.58, align 8
  %field.59 = getelementptr inbounds %SRV.0, ptr %tmpv.67, i64 0, i32 2
  store i16 %.field.ld.7, ptr %field.59, align 2
  %field.60 = getelementptr inbounds %SRV.0, ptr %tmpv.67, i64 0, i32 3
  store i16 %.field.ld.8, ptr %field.60, align 4
  %field.61 = getelementptr inbounds %SRV.0, ptr %tmpv.67, i64 0, i32 4
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %field.61, ptr noundef nonnull align 8 dereferenceable(16) %tmpv.64, i64 16, i1 false)
  %deref.ld.7 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.36 = icmp eq i32 %deref.ld.7, 0
  br i1 %icmp.36, label %then.33, label %else.33

then.33:                                          ; preds = %else.28
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(56) %call.7, ptr noundef nonnull align 8 dereferenceable(56) %tmpv.67, i64 56, i1 false)
  br label %fallthrough.33

fallthrough.33:                                   ; preds = %else.33, %then.33
  %ld.5.fca.1.insert = insertvalue { ptr, ptr } { ptr @pimt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.SRV, ptr undef }, ptr %call.7, 1
  ret { ptr, ptr } %ld.5.fca.1.insert

else.33:                                          ; preds = %else.28
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.SRV..d, ptr nonnull %call.7, ptr nonnull %tmpv.67)
  br label %fallthrough.33
}

define i8 @go_0llvm.MX..eq(ptr nest nocapture readnone %nest.74, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.482 = icmp eq ptr %key1, null
  br i1 %icmp.482, label %then.434, label %else.434, !make.implicit !3

then.434:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.434:                                         ; preds = %entry
  %tmpv.614.sroa.0.0.copyload = load ptr, ptr %key1, align 8
  %tmpv.614.sroa.3.0.cast.2036.sroa_idx20 = getelementptr inbounds i8, ptr %key1, i64 16
  %tmpv.614.sroa.3.0.copyload = load i16, ptr %tmpv.614.sroa.3.0.cast.2036.sroa_idx20, align 8
  %tmpv.614.sroa.5.0.cast.2036.sroa_idx21 = getelementptr inbounds i8, ptr %key1, i64 18
  %tmpv.614.sroa.5.0.copyload = load i16, ptr %tmpv.614.sroa.5.0.cast.2036.sroa_idx21, align 2
  %tmpv.614.sroa.6.0.cast.2036.sroa_idx22 = getelementptr inbounds i8, ptr %key1, i64 20
  %tmpv.614.sroa.6.0.copyload = load i32, ptr %tmpv.614.sroa.6.0.cast.2036.sroa_idx22, align 4
  %tmpv.614.sroa.7.0.cast.2036.sroa_idx23 = getelementptr inbounds i8, ptr %key1, i64 24
  %tmpv.614.sroa.7.0.copyload = load i16, ptr %tmpv.614.sroa.7.0.cast.2036.sroa_idx23, align 8
  %icmp.483 = icmp eq ptr %key2, null
  br i1 %icmp.483, label %then.435, label %else.435, !make.implicit !3

then.435:                                         ; preds = %else.434
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.435:                                         ; preds = %else.434
  %tmpv.614.sroa.2.0.cast.2036.sroa_idx19 = getelementptr inbounds i8, ptr %key1, i64 8
  %tmpv.614.sroa.2.0.copyload = load i64, ptr %tmpv.614.sroa.2.0.cast.2036.sroa_idx19, align 8
  %tmpv.615.sroa.0.0.copyload = load ptr, ptr %key2, align 8
  %tmpv.615.sroa.2.0.cast.2041.sroa_idx14 = getelementptr inbounds i8, ptr %key2, i64 8
  %tmpv.615.sroa.2.0.copyload = load i64, ptr %tmpv.615.sroa.2.0.cast.2041.sroa_idx14, align 8
  %tmpv.615.sroa.3.0.cast.2041.sroa_idx15 = getelementptr inbounds i8, ptr %key2, i64 16
  %tmpv.615.sroa.3.0.copyload = load i16, ptr %tmpv.615.sroa.3.0.cast.2041.sroa_idx15, align 8
  %tmpv.615.sroa.5.0.cast.2041.sroa_idx16 = getelementptr inbounds i8, ptr %key2, i64 18
  %tmpv.615.sroa.5.0.copyload = load i16, ptr %tmpv.615.sroa.5.0.cast.2041.sroa_idx16, align 2
  %tmpv.615.sroa.6.0.cast.2041.sroa_idx17 = getelementptr inbounds i8, ptr %key2, i64 20
  %tmpv.615.sroa.6.0.copyload = load i32, ptr %tmpv.615.sroa.6.0.cast.2041.sroa_idx17, align 4
  %tmpv.615.sroa.7.0.cast.2041.sroa_idx18 = getelementptr inbounds i8, ptr %key2, i64 24
  %tmpv.615.sroa.7.0.copyload = load i16, ptr %tmpv.615.sroa.7.0.cast.2041.sroa_idx18, align 8
  %icmp.484 = icmp eq i64 %tmpv.614.sroa.2.0.copyload, %tmpv.615.sroa.2.0.copyload
  br i1 %icmp.484, label %then.436, label %fallthrough.436

then.436:                                         ; preds = %else.435
  %icmp.485 = icmp eq ptr %tmpv.614.sroa.0.0.copyload, %tmpv.615.sroa.0.0.copyload
  br i1 %icmp.485, label %fallthrough.436, label %else.437

fallthrough.436:                                  ; preds = %else.437, %then.436, %else.435
  %tmpv.624.0 = phi i1 [ false, %else.435 ], [ %icmp.486, %else.437 ], [ true, %then.436 ]
  %icmp.488 = icmp eq i16 %tmpv.614.sroa.3.0.copyload, %tmpv.615.sroa.3.0.copyload
  %spec.select = select i1 %tmpv.624.0, i1 %icmp.488, i1 false
  %icmp.489 = icmp eq i16 %tmpv.614.sroa.5.0.copyload, %tmpv.615.sroa.5.0.copyload
  %tmpv.626.0.in = select i1 %spec.select, i1 %icmp.489, i1 false
  %icmp.490 = icmp eq i32 %tmpv.614.sroa.6.0.copyload, %tmpv.615.sroa.6.0.copyload
  %spec.select27 = select i1 %tmpv.626.0.in, i1 %icmp.490, i1 false
  %icmp.491 = icmp eq i16 %tmpv.614.sroa.7.0.copyload, %tmpv.615.sroa.7.0.copyload
  %tmpv.628.0.in = select i1 %spec.select27, i1 %icmp.491, i1 false
  br i1 %tmpv.628.0.in, label %else.444, label %then.442

else.437:                                         ; preds = %then.436
  %bcmp1 = call i32 @bcmp(ptr %tmpv.614.sroa.0.0.copyload, ptr %tmpv.615.sroa.0.0.copyload, i64 %tmpv.614.sroa.2.0.copyload)
  %icmp.486 = icmp eq i32 %bcmp1, 0
  br label %fallthrough.436

then.442:                                         ; preds = %else.449, %then.448, %else.446, %else.444, %fallthrough.436
  %merge = phi i8 [ 0, %else.444 ], [ 0, %fallthrough.436 ], [ 0, %else.446 ], [ %phi.cast, %else.449 ], [ 1, %then.448 ]
  ret i8 %merge

else.444:                                         ; preds = %fallthrough.436
  %field.612 = getelementptr inbounds i8, ptr %key1, i64 32
  %.field.ld.154 = load i16, ptr %field.612, align 2
  %field.613 = getelementptr inbounds i8, ptr %key2, i64 32
  %.field.ld.155 = load i16, ptr %field.613, align 2
  %icmp.495.not = icmp eq i16 %.field.ld.154, %.field.ld.155
  br i1 %icmp.495.not, label %else.446, label %then.442

else.446:                                         ; preds = %else.444
  %tmpv.631.sroa.0.0.cast.2052.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 40
  %tmpv.631.sroa.0.0.copyload = load ptr, ptr %tmpv.631.sroa.0.0.cast.2052.sroa_idx, align 8
  %tmpv.631.sroa.3.0.cast.2052.sroa_idx3 = getelementptr inbounds i8, ptr %key1, i64 48
  %tmpv.631.sroa.3.0.copyload = load i64, ptr %tmpv.631.sroa.3.0.cast.2052.sroa_idx3, align 8
  %tmpv.633.sroa.0.0.cast.2055.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 40
  %tmpv.633.sroa.0.0.copyload = load ptr, ptr %tmpv.633.sroa.0.0.cast.2055.sroa_idx, align 8
  %tmpv.633.sroa.3.0.cast.2055.sroa_idx1 = getelementptr inbounds i8, ptr %key2, i64 48
  %tmpv.633.sroa.3.0.copyload = load i64, ptr %tmpv.633.sroa.3.0.cast.2055.sroa_idx1, align 8
  %icmp.498 = icmp eq i64 %tmpv.631.sroa.3.0.copyload, %tmpv.633.sroa.3.0.copyload
  br i1 %icmp.498, label %then.448, label %then.442

then.448:                                         ; preds = %else.446
  %icmp.499 = icmp eq ptr %tmpv.631.sroa.0.0.copyload, %tmpv.633.sroa.0.0.copyload
  br i1 %icmp.499, label %then.442, label %else.449

else.449:                                         ; preds = %then.448
  %bcmp = call i32 @bcmp(ptr %tmpv.631.sroa.0.0.copyload, ptr %tmpv.633.sroa.0.0.copyload, i64 %tmpv.631.sroa.3.0.copyload)
  %icmp.500 = icmp eq i32 %bcmp, 0
  %phi.cast = zext i1 %icmp.500 to i8
  br label %then.442
}

define ptr @go_0llvm.MX.Header(ptr nest nocapture readnone %nest.3, ptr readnone returned %rr) #0 {
entry:
  %icmp.5 = icmp eq ptr %rr, null
  br i1 %icmp.5, label %then.2, label %else.2, !make.implicit !3

then.2:                                           ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.2:                                           ; preds = %entry
  ret ptr %rr
}

define { ptr, ptr } @go_0llvm.MX.copy(ptr nest nocapture readnone %nest.9, ptr readonly %rr) #0 {
entry:
  %tmpv.24 = alloca %RR_Header.0, align 8
  %tmpv.28 = alloca { ptr, i64 }, align 8
  %tmpv.31 = alloca %MX.0, align 8, !go_addrtaken !3
  %icmp.15 = icmp eq ptr %rr, null
  br i1 %icmp.15, label %then.12, label %else.12, !make.implicit !3

then.12:                                          ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.12:                                          ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %tmpv.24, ptr noundef nonnull align 8 dereferenceable(32) %rr, i64 32, i1 false)
  %field.21 = getelementptr inbounds %MX.0, ptr %rr, i64 0, i32 1
  %.field.ld.0 = load i16, ptr %field.21, align 2
  %field.22 = getelementptr inbounds %MX.0, ptr %rr, i64 0, i32 2
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %tmpv.28, ptr noundef nonnull align 8 dereferenceable(16) %field.22, i64 16, i1 false)
  %call.4 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.MX..d)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %tmpv.31, ptr noundef nonnull align 8 dereferenceable(32) %tmpv.24, i64 32, i1 false)
  %field.24 = getelementptr inbounds %MX.0, ptr %tmpv.31, i64 0, i32 1
  store i16 %.field.ld.0, ptr %field.24, align 8
  %field.25 = getelementptr inbounds %MX.0, ptr %tmpv.31, i64 0, i32 2
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %field.25, ptr noundef nonnull align 8 dereferenceable(16) %tmpv.28, i64 16, i1 false)
  %deref.ld.4 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.18 = icmp eq i32 %deref.ld.4, 0
  br i1 %icmp.18, label %then.15, label %else.15

then.15:                                          ; preds = %else.12
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(56) %call.4, ptr noundef nonnull align 8 dereferenceable(56) %tmpv.31, i64 56, i1 false)
  br label %fallthrough.15

fallthrough.15:                                   ; preds = %else.15, %then.15
  %ld.2.fca.1.insert = insertvalue { ptr, ptr } { ptr @pimt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.MX, ptr undef }, ptr %call.4, 1
  ret { ptr, ptr } %ld.2.fca.1.insert

else.15:                                          ; preds = %else.12
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.MX..d, ptr nonnull %call.4, ptr nonnull %tmpv.31)
  br label %fallthrough.15
}

define i8 @go_0llvm.NS..eq(ptr nest nocapture readnone %nest.75, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.502 = icmp eq ptr %key1, null
  br i1 %icmp.502, label %then.452, label %else.452, !make.implicit !3

then.452:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.452:                                         ; preds = %entry
  %tmpv.639.sroa.0.0.copyload = load ptr, ptr %key1, align 8
  %tmpv.639.sroa.3.0.cast.2060.sroa_idx20 = getelementptr inbounds i8, ptr %key1, i64 16
  %tmpv.639.sroa.3.0.copyload = load i16, ptr %tmpv.639.sroa.3.0.cast.2060.sroa_idx20, align 8
  %tmpv.639.sroa.5.0.cast.2060.sroa_idx21 = getelementptr inbounds i8, ptr %key1, i64 18
  %tmpv.639.sroa.5.0.copyload = load i16, ptr %tmpv.639.sroa.5.0.cast.2060.sroa_idx21, align 2
  %tmpv.639.sroa.6.0.cast.2060.sroa_idx22 = getelementptr inbounds i8, ptr %key1, i64 20
  %tmpv.639.sroa.6.0.copyload = load i32, ptr %tmpv.639.sroa.6.0.cast.2060.sroa_idx22, align 4
  %tmpv.639.sroa.7.0.cast.2060.sroa_idx23 = getelementptr inbounds i8, ptr %key1, i64 24
  %tmpv.639.sroa.7.0.copyload = load i16, ptr %tmpv.639.sroa.7.0.cast.2060.sroa_idx23, align 8
  %icmp.503 = icmp eq ptr %key2, null
  br i1 %icmp.503, label %then.453, label %else.453, !make.implicit !3

then.453:                                         ; preds = %else.452
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.453:                                         ; preds = %else.452
  %tmpv.639.sroa.2.0.cast.2060.sroa_idx19 = getelementptr inbounds i8, ptr %key1, i64 8
  %tmpv.639.sroa.2.0.copyload = load i64, ptr %tmpv.639.sroa.2.0.cast.2060.sroa_idx19, align 8
  %tmpv.640.sroa.0.0.copyload = load ptr, ptr %key2, align 8
  %tmpv.640.sroa.2.0.cast.2065.sroa_idx14 = getelementptr inbounds i8, ptr %key2, i64 8
  %tmpv.640.sroa.2.0.copyload = load i64, ptr %tmpv.640.sroa.2.0.cast.2065.sroa_idx14, align 8
  %tmpv.640.sroa.3.0.cast.2065.sroa_idx15 = getelementptr inbounds i8, ptr %key2, i64 16
  %tmpv.640.sroa.3.0.copyload = load i16, ptr %tmpv.640.sroa.3.0.cast.2065.sroa_idx15, align 8
  %tmpv.640.sroa.5.0.cast.2065.sroa_idx16 = getelementptr inbounds i8, ptr %key2, i64 18
  %tmpv.640.sroa.5.0.copyload = load i16, ptr %tmpv.640.sroa.5.0.cast.2065.sroa_idx16, align 2
  %tmpv.640.sroa.6.0.cast.2065.sroa_idx17 = getelementptr inbounds i8, ptr %key2, i64 20
  %tmpv.640.sroa.6.0.copyload = load i32, ptr %tmpv.640.sroa.6.0.cast.2065.sroa_idx17, align 4
  %tmpv.640.sroa.7.0.cast.2065.sroa_idx18 = getelementptr inbounds i8, ptr %key2, i64 24
  %tmpv.640.sroa.7.0.copyload = load i16, ptr %tmpv.640.sroa.7.0.cast.2065.sroa_idx18, align 8
  %icmp.504 = icmp eq i64 %tmpv.639.sroa.2.0.copyload, %tmpv.640.sroa.2.0.copyload
  br i1 %icmp.504, label %then.454, label %fallthrough.454

then.454:                                         ; preds = %else.453
  %icmp.505 = icmp eq ptr %tmpv.639.sroa.0.0.copyload, %tmpv.640.sroa.0.0.copyload
  br i1 %icmp.505, label %fallthrough.454, label %else.455

fallthrough.454:                                  ; preds = %else.455, %then.454, %else.453
  %tmpv.649.0 = phi i1 [ false, %else.453 ], [ %icmp.506, %else.455 ], [ true, %then.454 ]
  %icmp.508 = icmp eq i16 %tmpv.639.sroa.3.0.copyload, %tmpv.640.sroa.3.0.copyload
  %spec.select = select i1 %tmpv.649.0, i1 %icmp.508, i1 false
  %icmp.509 = icmp eq i16 %tmpv.639.sroa.5.0.copyload, %tmpv.640.sroa.5.0.copyload
  %tmpv.651.0.in = select i1 %spec.select, i1 %icmp.509, i1 false
  %icmp.510 = icmp eq i32 %tmpv.639.sroa.6.0.copyload, %tmpv.640.sroa.6.0.copyload
  %spec.select26 = select i1 %tmpv.651.0.in, i1 %icmp.510, i1 false
  %icmp.511 = icmp eq i16 %tmpv.639.sroa.7.0.copyload, %tmpv.640.sroa.7.0.copyload
  %tmpv.653.0.in = select i1 %spec.select26, i1 %icmp.511, i1 false
  br i1 %tmpv.653.0.in, label %else.461, label %then.460

else.455:                                         ; preds = %then.454
  %bcmp1 = call i32 @bcmp(ptr %tmpv.639.sroa.0.0.copyload, ptr %tmpv.640.sroa.0.0.copyload, i64 %tmpv.639.sroa.2.0.copyload)
  %icmp.506 = icmp eq i32 %bcmp1, 0
  br label %fallthrough.454

then.460:                                         ; preds = %else.464, %then.463, %else.461, %fallthrough.454
  %merge = phi i8 [ 0, %fallthrough.454 ], [ 0, %else.461 ], [ %phi.cast, %else.464 ], [ 1, %then.463 ]
  ret i8 %merge

else.461:                                         ; preds = %fallthrough.454
  %tmpv.654.sroa.0.0.cast.2074.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 32
  %tmpv.654.sroa.0.0.copyload = load ptr, ptr %tmpv.654.sroa.0.0.cast.2074.sroa_idx, align 8
  %tmpv.654.sroa.3.0.cast.2074.sroa_idx3 = getelementptr inbounds i8, ptr %key1, i64 40
  %tmpv.654.sroa.3.0.copyload = load i64, ptr %tmpv.654.sroa.3.0.cast.2074.sroa_idx3, align 8
  %tmpv.656.sroa.0.0.cast.2077.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 32
  %tmpv.656.sroa.0.0.copyload = load ptr, ptr %tmpv.656.sroa.0.0.cast.2077.sroa_idx, align 8
  %tmpv.656.sroa.3.0.cast.2077.sroa_idx1 = getelementptr inbounds i8, ptr %key2, i64 40
  %tmpv.656.sroa.3.0.copyload = load i64, ptr %tmpv.656.sroa.3.0.cast.2077.sroa_idx1, align 8
  %icmp.515 = icmp eq i64 %tmpv.654.sroa.3.0.copyload, %tmpv.656.sroa.3.0.copyload
  br i1 %icmp.515, label %then.463, label %then.460

then.463:                                         ; preds = %else.461
  %icmp.516 = icmp eq ptr %tmpv.654.sroa.0.0.copyload, %tmpv.656.sroa.0.0.copyload
  br i1 %icmp.516, label %then.460, label %else.464

else.464:                                         ; preds = %then.463
  %bcmp = call i32 @bcmp(ptr %tmpv.654.sroa.0.0.copyload, ptr %tmpv.656.sroa.0.0.copyload, i64 %tmpv.654.sroa.3.0.copyload)
  %icmp.517 = icmp eq i32 %bcmp, 0
  %phi.cast = zext i1 %icmp.517 to i8
  br label %then.460
}

define ptr @go_0llvm.NS.Header(ptr nest nocapture readnone %nest.4, ptr readnone returned %rr) #0 {
entry:
  %icmp.6 = icmp eq ptr %rr, null
  br i1 %icmp.6, label %then.3, label %else.3, !make.implicit !3

then.3:                                           ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.3:                                           ; preds = %entry
  ret ptr %rr
}

define { ptr, ptr } @go_0llvm.NS.copy(ptr nest nocapture readnone %nest.10, ptr readonly %rr) #0 {
entry:
  %tmpv.32 = alloca %RR_Header.0, align 8
  %tmpv.34 = alloca { ptr, i64 }, align 8
  %tmpv.37 = alloca %NS.0, align 8, !go_addrtaken !3
  %icmp.19 = icmp eq ptr %rr, null
  br i1 %icmp.19, label %then.16, label %else.16, !make.implicit !3

then.16:                                          ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.16:                                          ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %tmpv.32, ptr noundef nonnull align 8 dereferenceable(32) %rr, i64 32, i1 false)
  %field.29 = getelementptr inbounds %NS.0, ptr %rr, i64 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %tmpv.34, ptr noundef nonnull align 8 dereferenceable(16) %field.29, i64 16, i1 false)
  %call.5 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.NS..d)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %tmpv.37, ptr noundef nonnull align 8 dereferenceable(32) %tmpv.32, i64 32, i1 false)
  %field.31 = getelementptr inbounds %NS.0, ptr %tmpv.37, i64 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %field.31, ptr noundef nonnull align 8 dereferenceable(16) %tmpv.34, i64 16, i1 false)
  %deref.ld.5 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.21 = icmp eq i32 %deref.ld.5, 0
  br i1 %icmp.21, label %then.18, label %else.18

then.18:                                          ; preds = %else.16
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(48) %call.5, ptr noundef nonnull align 8 dereferenceable(48) %tmpv.37, i64 48, i1 false)
  br label %fallthrough.18

fallthrough.18:                                   ; preds = %else.18, %then.18
  %ld.3.fca.1.insert = insertvalue { ptr, ptr } { ptr @pimt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.NS, ptr undef }, ptr %call.5, 1
  ret { ptr, ptr } %ld.3.fca.1.insert

else.18:                                          ; preds = %else.16
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.NS..d, ptr nonnull %call.5, ptr nonnull %tmpv.37)
  br label %fallthrough.18
}

declare { i64, i8 } @go_0llvm.PrevLabel(ptr, ptr, i64, i64) #0

declare { ptr, ptr } @go_0llvm.Copy(ptr, ptr, ptr) #0

define i8 @go_0llvm.MsgHdr..eq(ptr nest nocapture readnone %nest.63, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.246 = icmp eq ptr %key1, null
  br i1 %icmp.246, label %then.214, label %else.214, !make.implicit !3

then.214:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.214:                                         ; preds = %entry
  %icmp.247 = icmp eq ptr %key2, null
  br i1 %icmp.247, label %then.215, label %else.215, !make.implicit !3

then.215:                                         ; preds = %else.214
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.215:                                         ; preds = %else.214
  %.field.ld.84 = load i16, ptr %key1, align 2
  %.field.ld.85 = load i16, ptr %key2, align 2
  %icmp.248.not = icmp eq i16 %.field.ld.84, %.field.ld.85
  br i1 %icmp.248.not, label %else.218, label %common.ret

common.ret:                                       ; preds = %else.215, %else.218, %else.221, %else.224, %else.227, %else.230, %else.233, %else.236, %else.239, %else.242, %else.245
  %common.ret.op = phi i8 [ %spec.select, %else.245 ], [ 0, %else.242 ], [ 0, %else.239 ], [ 0, %else.236 ], [ 0, %else.233 ], [ 0, %else.230 ], [ 0, %else.227 ], [ 0, %else.224 ], [ 0, %else.221 ], [ 0, %else.218 ], [ 0, %else.215 ]
  ret i8 %common.ret.op

else.218:                                         ; preds = %else.215
  %0 = getelementptr inbounds i8, ptr %key1, i64 2
  %.field.ld.86 = load i8, ptr %0, align 1
  %1 = getelementptr inbounds i8, ptr %key2, i64 2
  %.field.ld.87 = load i8, ptr %1, align 1
  %icmp.251.not = icmp eq i8 %.field.ld.86, %.field.ld.87
  br i1 %icmp.251.not, label %else.221, label %common.ret

else.221:                                         ; preds = %else.218
  %field.328 = getelementptr inbounds i8, ptr %key1, i64 8
  %.field.ld.88 = load i64, ptr %field.328, align 8
  %field.329 = getelementptr inbounds i8, ptr %key2, i64 8
  %.field.ld.89 = load i64, ptr %field.329, align 8
  %icmp.254.not = icmp eq i64 %.field.ld.88, %.field.ld.89
  br i1 %icmp.254.not, label %else.224, label %common.ret

else.224:                                         ; preds = %else.221
  %2 = getelementptr inbounds i8, ptr %key1, i64 16
  %.field.ld.90 = load i8, ptr %2, align 1
  %3 = getelementptr inbounds i8, ptr %key2, i64 16
  %.field.ld.91 = load i8, ptr %3, align 1
  %icmp.257.not = icmp eq i8 %.field.ld.90, %.field.ld.91
  br i1 %icmp.257.not, label %else.227, label %common.ret

else.227:                                         ; preds = %else.224
  %4 = getelementptr inbounds i8, ptr %key1, i64 17
  %.field.ld.92 = load i8, ptr %4, align 1
  %5 = getelementptr inbounds i8, ptr %key2, i64 17
  %.field.ld.93 = load i8, ptr %5, align 1
  %icmp.260.not = icmp eq i8 %.field.ld.92, %.field.ld.93
  br i1 %icmp.260.not, label %else.230, label %common.ret

else.230:                                         ; preds = %else.227
  %6 = getelementptr inbounds i8, ptr %key1, i64 18
  %.field.ld.94 = load i8, ptr %6, align 1
  %7 = getelementptr inbounds i8, ptr %key2, i64 18
  %.field.ld.95 = load i8, ptr %7, align 1
  %icmp.263.not = icmp eq i8 %.field.ld.94, %.field.ld.95
  br i1 %icmp.263.not, label %else.233, label %common.ret

else.233:                                         ; preds = %else.230
  %8 = getelementptr inbounds i8, ptr %key1, i64 19
  %.field.ld.96 = load i8, ptr %8, align 1
  %9 = getelementptr inbounds i8, ptr %key2, i64 19
  %.field.ld.97 = load i8, ptr %9, align 1
  %icmp.266.not = icmp eq i8 %.field.ld.96, %.field.ld.97
  br i1 %icmp.266.not, label %else.236, label %common.ret

else.236:                                         ; preds = %else.233
  %10 = getelementptr inbounds i8, ptr %key1, i64 20
  %.field.ld.98 = load i8, ptr %10, align 1
  %11 = getelementptr inbounds i8, ptr %key2, i64 20
  %.field.ld.99 = load i8, ptr %11, align 1
  %icmp.269.not = icmp eq i8 %.field.ld.98, %.field.ld.99
  br i1 %icmp.269.not, label %else.239, label %common.ret

else.239:                                         ; preds = %else.236
  %12 = getelementptr inbounds i8, ptr %key1, i64 21
  %.field.ld.100 = load i8, ptr %12, align 1
  %13 = getelementptr inbounds i8, ptr %key2, i64 21
  %.field.ld.101 = load i8, ptr %13, align 1
  %icmp.272.not = icmp eq i8 %.field.ld.100, %.field.ld.101
  br i1 %icmp.272.not, label %else.242, label %common.ret

else.242:                                         ; preds = %else.239
  %14 = getelementptr inbounds i8, ptr %key1, i64 22
  %.field.ld.102 = load i8, ptr %14, align 1
  %15 = getelementptr inbounds i8, ptr %key2, i64 22
  %.field.ld.103 = load i8, ptr %15, align 1
  %icmp.275.not = icmp eq i8 %.field.ld.102, %.field.ld.103
  br i1 %icmp.275.not, label %else.245, label %common.ret

else.245:                                         ; preds = %else.242
  %field.344 = getelementptr inbounds i8, ptr %key1, i64 24
  %.field.ld.104 = load i64, ptr %field.344, align 8
  %field.345 = getelementptr inbounds i8, ptr %key2, i64 24
  %.field.ld.105 = load i64, ptr %field.345, align 8
  %icmp.278.not = icmp eq i64 %.field.ld.104, %.field.ld.105
  %spec.select = zext i1 %icmp.278.not to i8
  br label %common.ret
}

define i8 @go_0llvm.Question..eq(ptr nest nocapture readnone %nest.64, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.279 = icmp eq ptr %key1, null
  br i1 %icmp.279, label %then.247, label %else.247, !make.implicit !3

then.247:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.247:                                         ; preds = %entry
  %tmpv.402.sroa.0.0.copyload = load ptr, ptr %key1, align 8
  %icmp.280 = icmp eq ptr %key2, null
  br i1 %icmp.280, label %then.248, label %else.248, !make.implicit !3

then.248:                                         ; preds = %else.247
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.248:                                         ; preds = %else.247
  %tmpv.402.sroa.3.0.cast.1816.sroa_idx3 = getelementptr inbounds i8, ptr %key1, i64 8
  %tmpv.402.sroa.3.0.copyload = load i64, ptr %tmpv.402.sroa.3.0.cast.1816.sroa_idx3, align 8
  %tmpv.404.sroa.0.0.copyload = load ptr, ptr %key2, align 8
  %tmpv.404.sroa.3.0.cast.1819.sroa_idx1 = getelementptr inbounds i8, ptr %key2, i64 8
  %tmpv.404.sroa.3.0.copyload = load i64, ptr %tmpv.404.sroa.3.0.cast.1819.sroa_idx1, align 8
  %icmp.281 = icmp eq i64 %tmpv.402.sroa.3.0.copyload, %tmpv.404.sroa.3.0.copyload
  br i1 %icmp.281, label %then.249, label %common.ret

then.249:                                         ; preds = %else.248
  %icmp.282 = icmp eq ptr %tmpv.402.sroa.0.0.copyload, %tmpv.404.sroa.0.0.copyload
  br i1 %icmp.282, label %else.253, label %else.250

else.250:                                         ; preds = %then.249
  %bcmp = call i32 @bcmp(ptr %tmpv.402.sroa.0.0.copyload, ptr %tmpv.404.sroa.0.0.copyload, i64 %tmpv.402.sroa.3.0.copyload)
  %icmp.283 = icmp eq i32 %bcmp, 0
  br i1 %icmp.283, label %else.253, label %common.ret

common.ret:                                       ; preds = %else.248, %else.250, %else.253, %else.256
  %common.ret.op = phi i8 [ %spec.select, %else.256 ], [ 0, %else.253 ], [ 0, %else.250 ], [ 0, %else.248 ]
  ret i8 %common.ret.op

else.253:                                         ; preds = %else.250, %then.249
  %field.355 = getelementptr inbounds i8, ptr %key1, i64 16
  %.field.ld.106 = load i16, ptr %field.355, align 2
  %field.356 = getelementptr inbounds i8, ptr %key2, i64 16
  %.field.ld.107 = load i16, ptr %field.356, align 2
  %icmp.287.not = icmp eq i16 %.field.ld.106, %.field.ld.107
  br i1 %icmp.287.not, label %else.256, label %common.ret

else.256:                                         ; preds = %else.253
  %field.357 = getelementptr inbounds i8, ptr %key1, i64 18
  %.field.ld.108 = load i16, ptr %field.357, align 2
  %field.358 = getelementptr inbounds i8, ptr %key2, i64 18
  %.field.ld.109 = load i16, ptr %field.358, align 2
  %icmp.290.not = icmp eq i16 %.field.ld.108, %.field.ld.109
  %spec.select = zext i1 %icmp.290.not to i8
  br label %common.ret
}

define i8 @go_0llvm.Request..eq(ptr nest nocapture readnone %nest.66, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.309 = icmp eq ptr %key1, null
  br i1 %icmp.309, label %then.275, label %else.275, !make.implicit !3

then.275:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.275:                                         ; preds = %entry
  %icmp.310 = icmp eq ptr %key2, null
  br i1 %icmp.310, label %then.276, label %else.276, !make.implicit !3

then.276:                                         ; preds = %else.275
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.276:                                         ; preds = %else.275
  %.field.ld.118 = load ptr, ptr %key1, align 8
  %.field.ld.119 = load ptr, ptr %key2, align 8
  %icmp.311.not = icmp eq ptr %.field.ld.118, %.field.ld.119
  br i1 %icmp.311.not, label %else.279, label %then.277

then.277:                                         ; preds = %else.318, %then.317, %else.315, %else.313, %else.310, %else.308, %else.305, %else.303, %else.300, %else.298, %else.295, %else.293, %else.290, %else.287, %else.284, %else.281, %else.279, %else.276
  %merge = phi i8 [ 0, %else.313 ], [ 0, %else.308 ], [ 0, %else.303 ], [ 0, %else.298 ], [ 0, %else.293 ], [ 0, %else.290 ], [ 0, %else.287 ], [ 0, %else.284 ], [ 0, %else.279 ], [ 0, %else.276 ], [ 0, %else.315 ], [ %phi.cast, %else.318 ], [ 1, %then.317 ], [ 0, %else.281 ], [ 0, %else.295 ], [ 0, %else.300 ], [ 0, %else.305 ], [ 0, %else.310 ]
  ret i8 %merge

else.279:                                         ; preds = %else.276
  %field.378 = getelementptr inbounds i8, ptr %key1, i64 8
  %field.379 = getelementptr inbounds i8, ptr %key2, i64 8
  %ld.75 = load ptr, ptr %field.378, align 8
  %field1.33 = getelementptr inbounds i8, ptr %key1, i64 16
  %ld.76 = load ptr, ptr %field1.33, align 8
  %ld.77 = load ptr, ptr %field.379, align 8
  %field1.34 = getelementptr inbounds i8, ptr %key2, i64 16
  %ld.78 = load ptr, ptr %field1.34, align 8
  %call.68 = call i8 @runtime.ifaceeq(ptr nest undef, ptr %ld.75, ptr %ld.76, ptr %ld.77, ptr %ld.78)
  %icmp.314.not = icmp eq i8 %call.68, 1
  br i1 %icmp.314.not, label %else.281, label %then.277

else.281:                                         ; preds = %else.279
  %tmpv.434.sroa.0.0.cast.1852.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 24
  %tmpv.434.sroa.0.0.copyload = load ptr, ptr %tmpv.434.sroa.0.0.cast.1852.sroa_idx, align 8
  %tmpv.434.sroa.3.0.cast.1852.sroa_idx18 = getelementptr inbounds i8, ptr %key1, i64 32
  %tmpv.434.sroa.3.0.copyload = load i64, ptr %tmpv.434.sroa.3.0.cast.1852.sroa_idx18, align 8
  %tmpv.436.sroa.0.0.cast.1855.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 24
  %tmpv.436.sroa.0.0.copyload = load ptr, ptr %tmpv.436.sroa.0.0.cast.1855.sroa_idx, align 8
  %tmpv.436.sroa.3.0.cast.1855.sroa_idx16 = getelementptr inbounds i8, ptr %key2, i64 32
  %tmpv.436.sroa.3.0.copyload = load i64, ptr %tmpv.436.sroa.3.0.cast.1855.sroa_idx16, align 8
  %icmp.317 = icmp eq i64 %tmpv.434.sroa.3.0.copyload, %tmpv.436.sroa.3.0.copyload
  br i1 %icmp.317, label %then.283, label %then.277

then.283:                                         ; preds = %else.281
  %icmp.318 = icmp eq ptr %tmpv.434.sroa.0.0.copyload, %tmpv.436.sroa.0.0.copyload
  br i1 %icmp.318, label %else.287, label %else.284

else.284:                                         ; preds = %then.283
  %bcmp = call i32 @bcmp(ptr %tmpv.434.sroa.0.0.copyload, ptr %tmpv.436.sroa.0.0.copyload, i64 %tmpv.434.sroa.3.0.copyload)
  %icmp.319 = icmp eq i32 %bcmp, 0
  br i1 %icmp.319, label %else.287, label %then.277

else.287:                                         ; preds = %else.284, %then.283
  %field.389 = getelementptr inbounds i8, ptr %key1, i64 40
  %.field.ld.120 = load i16, ptr %field.389, align 2
  %field.390 = getelementptr inbounds i8, ptr %key2, i64 40
  %.field.ld.121 = load i16, ptr %field.390, align 2
  %icmp.323.not = icmp eq i16 %.field.ld.120, %.field.ld.121
  br i1 %icmp.323.not, label %else.290, label %then.277

else.290:                                         ; preds = %else.287
  %0 = getelementptr inbounds i8, ptr %key1, i64 42
  %.field.ld.122 = load i8, ptr %0, align 1
  %1 = getelementptr inbounds i8, ptr %key2, i64 42
  %.field.ld.123 = load i8, ptr %1, align 1
  %icmp.326.not = icmp eq i8 %.field.ld.122, %.field.ld.123
  br i1 %icmp.326.not, label %else.293, label %then.277

else.293:                                         ; preds = %else.290
  %2 = getelementptr inbounds i8, ptr %key1, i64 43
  %.field.ld.124 = load i8, ptr %2, align 1
  %3 = getelementptr inbounds i8, ptr %key2, i64 43
  %.field.ld.125 = load i8, ptr %3, align 1
  %icmp.329.not = icmp eq i8 %.field.ld.124, %.field.ld.125
  br i1 %icmp.329.not, label %else.295, label %then.277

else.295:                                         ; preds = %else.293
  %tmpv.446.sroa.0.0.cast.1864.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 48
  %tmpv.446.sroa.0.0.copyload = load ptr, ptr %tmpv.446.sroa.0.0.cast.1864.sroa_idx, align 8
  %tmpv.446.sroa.3.0.cast.1864.sroa_idx15 = getelementptr inbounds i8, ptr %key1, i64 56
  %tmpv.446.sroa.3.0.copyload = load i64, ptr %tmpv.446.sroa.3.0.cast.1864.sroa_idx15, align 8
  %tmpv.448.sroa.0.0.cast.1867.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 48
  %tmpv.448.sroa.0.0.copyload = load ptr, ptr %tmpv.448.sroa.0.0.cast.1867.sroa_idx, align 8
  %tmpv.448.sroa.3.0.cast.1867.sroa_idx13 = getelementptr inbounds i8, ptr %key2, i64 56
  %tmpv.448.sroa.3.0.copyload = load i64, ptr %tmpv.448.sroa.3.0.cast.1867.sroa_idx13, align 8
  %icmp.332 = icmp eq i64 %tmpv.446.sroa.3.0.copyload, %tmpv.448.sroa.3.0.copyload
  br i1 %icmp.332, label %then.297, label %then.277

then.297:                                         ; preds = %else.295
  %icmp.333 = icmp eq ptr %tmpv.446.sroa.0.0.copyload, %tmpv.448.sroa.0.0.copyload
  br i1 %icmp.333, label %else.300, label %else.298

else.298:                                         ; preds = %then.297
  %bcmp1 = call i32 @bcmp(ptr %tmpv.446.sroa.0.0.copyload, ptr %tmpv.448.sroa.0.0.copyload, i64 %tmpv.446.sroa.3.0.copyload)
  %icmp.334 = icmp eq i32 %bcmp1, 0
  br i1 %icmp.334, label %else.300, label %then.277

else.300:                                         ; preds = %else.298, %then.297
  %tmpv.452.sroa.0.0.cast.1870.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 64
  %tmpv.452.sroa.0.0.copyload = load ptr, ptr %tmpv.452.sroa.0.0.cast.1870.sroa_idx, align 8
  %tmpv.452.sroa.3.0.cast.1870.sroa_idx12 = getelementptr inbounds i8, ptr %key1, i64 72
  %tmpv.452.sroa.3.0.copyload = load i64, ptr %tmpv.452.sroa.3.0.cast.1870.sroa_idx12, align 8
  %tmpv.454.sroa.0.0.cast.1873.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 64
  %tmpv.454.sroa.0.0.copyload = load ptr, ptr %tmpv.454.sroa.0.0.cast.1873.sroa_idx, align 8
  %tmpv.454.sroa.3.0.cast.1873.sroa_idx10 = getelementptr inbounds i8, ptr %key2, i64 72
  %tmpv.454.sroa.3.0.copyload = load i64, ptr %tmpv.454.sroa.3.0.cast.1873.sroa_idx10, align 8
  %icmp.338 = icmp eq i64 %tmpv.452.sroa.3.0.copyload, %tmpv.454.sroa.3.0.copyload
  br i1 %icmp.338, label %then.302, label %then.277

then.302:                                         ; preds = %else.300
  %icmp.339 = icmp eq ptr %tmpv.452.sroa.0.0.copyload, %tmpv.454.sroa.0.0.copyload
  br i1 %icmp.339, label %else.305, label %else.303

else.303:                                         ; preds = %then.302
  %bcmp2 = call i32 @bcmp(ptr %tmpv.452.sroa.0.0.copyload, ptr %tmpv.454.sroa.0.0.copyload, i64 %tmpv.452.sroa.3.0.copyload)
  %icmp.340 = icmp eq i32 %bcmp2, 0
  br i1 %icmp.340, label %else.305, label %then.277

else.305:                                         ; preds = %else.303, %then.302
  %tmpv.458.sroa.0.0.cast.1876.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 80
  %tmpv.458.sroa.0.0.copyload = load ptr, ptr %tmpv.458.sroa.0.0.cast.1876.sroa_idx, align 8
  %tmpv.458.sroa.3.0.cast.1876.sroa_idx9 = getelementptr inbounds i8, ptr %key1, i64 88
  %tmpv.458.sroa.3.0.copyload = load i64, ptr %tmpv.458.sroa.3.0.cast.1876.sroa_idx9, align 8
  %tmpv.460.sroa.0.0.cast.1879.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 80
  %tmpv.460.sroa.0.0.copyload = load ptr, ptr %tmpv.460.sroa.0.0.cast.1879.sroa_idx, align 8
  %tmpv.460.sroa.3.0.cast.1879.sroa_idx7 = getelementptr inbounds i8, ptr %key2, i64 88
  %tmpv.460.sroa.3.0.copyload = load i64, ptr %tmpv.460.sroa.3.0.cast.1879.sroa_idx7, align 8
  %icmp.344 = icmp eq i64 %tmpv.458.sroa.3.0.copyload, %tmpv.460.sroa.3.0.copyload
  br i1 %icmp.344, label %then.307, label %then.277

then.307:                                         ; preds = %else.305
  %icmp.345 = icmp eq ptr %tmpv.458.sroa.0.0.copyload, %tmpv.460.sroa.0.0.copyload
  br i1 %icmp.345, label %else.310, label %else.308

else.308:                                         ; preds = %then.307
  %bcmp3 = call i32 @bcmp(ptr %tmpv.458.sroa.0.0.copyload, ptr %tmpv.460.sroa.0.0.copyload, i64 %tmpv.458.sroa.3.0.copyload)
  %icmp.346 = icmp eq i32 %bcmp3, 0
  br i1 %icmp.346, label %else.310, label %then.277

else.310:                                         ; preds = %else.308, %then.307
  %tmpv.464.sroa.0.0.cast.1882.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 96
  %tmpv.464.sroa.0.0.copyload = load ptr, ptr %tmpv.464.sroa.0.0.cast.1882.sroa_idx, align 8
  %tmpv.464.sroa.3.0.cast.1882.sroa_idx6 = getelementptr inbounds i8, ptr %key1, i64 104
  %tmpv.464.sroa.3.0.copyload = load i64, ptr %tmpv.464.sroa.3.0.cast.1882.sroa_idx6, align 8
  %tmpv.466.sroa.0.0.cast.1885.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 96
  %tmpv.466.sroa.0.0.copyload = load ptr, ptr %tmpv.466.sroa.0.0.cast.1885.sroa_idx, align 8
  %tmpv.466.sroa.3.0.cast.1885.sroa_idx4 = getelementptr inbounds i8, ptr %key2, i64 104
  %tmpv.466.sroa.3.0.copyload = load i64, ptr %tmpv.466.sroa.3.0.cast.1885.sroa_idx4, align 8
  %icmp.350 = icmp eq i64 %tmpv.464.sroa.3.0.copyload, %tmpv.466.sroa.3.0.copyload
  br i1 %icmp.350, label %then.312, label %then.277

then.312:                                         ; preds = %else.310
  %icmp.351 = icmp eq ptr %tmpv.464.sroa.0.0.copyload, %tmpv.466.sroa.0.0.copyload
  br i1 %icmp.351, label %else.315, label %else.313

else.313:                                         ; preds = %then.312
  %bcmp4 = call i32 @bcmp(ptr %tmpv.464.sroa.0.0.copyload, ptr %tmpv.466.sroa.0.0.copyload, i64 %tmpv.464.sroa.3.0.copyload)
  %icmp.352 = icmp eq i32 %bcmp4, 0
  br i1 %icmp.352, label %else.315, label %then.277

else.315:                                         ; preds = %else.313, %then.312
  %tmpv.470.sroa.0.0.cast.1888.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 112
  %tmpv.470.sroa.0.0.copyload = load ptr, ptr %tmpv.470.sroa.0.0.cast.1888.sroa_idx, align 8
  %tmpv.470.sroa.3.0.cast.1888.sroa_idx3 = getelementptr inbounds i8, ptr %key1, i64 120
  %tmpv.470.sroa.3.0.copyload = load i64, ptr %tmpv.470.sroa.3.0.cast.1888.sroa_idx3, align 8
  %tmpv.472.sroa.0.0.cast.1891.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 112
  %tmpv.472.sroa.0.0.copyload = load ptr, ptr %tmpv.472.sroa.0.0.cast.1891.sroa_idx, align 8
  %tmpv.472.sroa.3.0.cast.1891.sroa_idx1 = getelementptr inbounds i8, ptr %key2, i64 120
  %tmpv.472.sroa.3.0.copyload = load i64, ptr %tmpv.472.sroa.3.0.cast.1891.sroa_idx1, align 8
  %icmp.356 = icmp eq i64 %tmpv.470.sroa.3.0.copyload, %tmpv.472.sroa.3.0.copyload
  br i1 %icmp.356, label %then.317, label %then.277

then.317:                                         ; preds = %else.315
  %icmp.357 = icmp eq ptr %tmpv.470.sroa.0.0.copyload, %tmpv.472.sroa.0.0.copyload
  br i1 %icmp.357, label %then.277, label %else.318

else.318:                                         ; preds = %then.317
  %bcmp5 = call i32 @bcmp(ptr %tmpv.470.sroa.0.0.copyload, ptr %tmpv.472.sroa.0.0.copyload, i64 %tmpv.470.sroa.3.0.copyload)
  %icmp.358 = icmp eq i32 %bcmp5, 0
  %phi.cast = zext i1 %icmp.358 to i8
  br label %then.277
}

define i8 @go_0llvm.ScrubWriter..eq(ptr nest nocapture readnone %nest.67, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.360 = icmp eq ptr %key1, null
  br i1 %icmp.360, label %then.320, label %else.320, !make.implicit !3

then.320:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.320:                                         ; preds = %entry
  %icmp.361 = icmp eq ptr %key2, null
  br i1 %icmp.361, label %then.321, label %else.321, !make.implicit !3

then.321:                                         ; preds = %else.320
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.321:                                         ; preds = %else.320
  %ld.79 = load ptr, ptr %key1, align 8
  %field1.35 = getelementptr inbounds i8, ptr %key1, i64 8
  %ld.80 = load ptr, ptr %field1.35, align 8
  %ld.81 = load ptr, ptr %key2, align 8
  %field1.36 = getelementptr inbounds i8, ptr %key2, i64 8
  %ld.82 = load ptr, ptr %field1.36, align 8
  %call.75 = call i8 @runtime.ifaceeq(ptr nest undef, ptr %ld.79, ptr %ld.80, ptr %ld.81, ptr %ld.82)
  %icmp.362.not = icmp eq i8 %call.75, 1
  br i1 %icmp.362.not, label %else.324, label %common.ret

common.ret:                                       ; preds = %else.321, %else.324
  %common.ret.op = phi i8 [ %spec.select, %else.324 ], [ 0, %else.321 ]
  ret i8 %common.ret.op

else.324:                                         ; preds = %else.321
  %field.442 = getelementptr inbounds i8, ptr %key1, i64 16
  %.field.ld.126 = load ptr, ptr %field.442, align 8
  %field.443 = getelementptr inbounds i8, ptr %key2, i64 16
  %.field.ld.127 = load ptr, ptr %field.443, align 8
  %icmp.365.not = icmp eq ptr %.field.ld.126, %.field.ld.127
  %spec.select = zext i1 %icmp.365.not to i8
  br label %common.ret
}

define { ptr, ptr } @go_0llvm.ScrubWriter.Close..stub(ptr nest nocapture readnone %nest.31, ptr readonly %"$this255.pointer") #0 {
entry:
  %tmpv.231 = alloca %ScrubWriter.0, align 8, !go_addrtaken !3
  %call.35 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d)
  %icmp.168 = icmp eq ptr %"$this255.pointer", null
  br i1 %icmp.168, label %then.134, label %else.134, !make.implicit !3

then.134:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.134:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.231, ptr noundef nonnull align 8 dereferenceable(24) %"$this255.pointer", i64 24, i1 false)
  %deref.ld.12 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.169 = icmp eq i32 %deref.ld.12, 0
  br i1 %icmp.169, label %then.135, label %else.135

then.135:                                         ; preds = %else.134
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.35, ptr noundef nonnull align 8 dereferenceable(24) %"$this255.pointer", i64 24, i1 false)
  br label %else.137

else.135:                                         ; preds = %else.134
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d, ptr nonnull %call.35, ptr nonnull %tmpv.231)
  br label %else.137

else.137:                                         ; preds = %else.135, %then.135
  %.field.ld.36 = load ptr, ptr %call.35, align 8
  %field.226 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.36, i64 0, i32 1
  %.field.ld.37 = load ptr, ptr %field.226, align 8
  %field.227 = getelementptr inbounds i8, ptr %call.35, i64 8
  %.field.ld.38 = load ptr, ptr %field.227, align 8
  %call.34 = call { ptr, ptr } %.field.ld.37(ptr nest undef, ptr %.field.ld.38)
  ret { ptr, ptr } %call.34
}

define void @go_0llvm.ScrubWriter.Hijack..stub(ptr nest nocapture readnone %nest.32, ptr readonly %"$this256.pointer") #0 {
entry:
  %tmpv.237 = alloca %ScrubWriter.0, align 8, !go_addrtaken !3
  %call.36 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d)
  %icmp.172 = icmp eq ptr %"$this256.pointer", null
  br i1 %icmp.172, label %then.138, label %else.138, !make.implicit !3

then.138:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.138:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.237, ptr noundef nonnull align 8 dereferenceable(24) %"$this256.pointer", i64 24, i1 false)
  %deref.ld.13 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.173 = icmp eq i32 %deref.ld.13, 0
  br i1 %icmp.173, label %then.139, label %else.139

then.139:                                         ; preds = %else.138
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.36, ptr noundef nonnull align 8 dereferenceable(24) %"$this256.pointer", i64 24, i1 false)
  br label %else.141

else.139:                                         ; preds = %else.138
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d, ptr nonnull %call.36, ptr nonnull %tmpv.237)
  br label %else.141

else.141:                                         ; preds = %else.139, %then.139
  %.field.ld.39 = load ptr, ptr %call.36, align 8
  %field.230 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.39, i64 0, i32 2
  %.field.ld.40 = load ptr, ptr %field.230, align 8
  %field.231 = getelementptr inbounds i8, ptr %call.36, i64 8
  %.field.ld.41 = load ptr, ptr %field.231, align 8
  call void %.field.ld.40(ptr nest undef, ptr %.field.ld.41)
  ret void
}

define { ptr, ptr } @go_0llvm.ScrubWriter.LocalAddr..stub(ptr nest nocapture readnone %nest.33, ptr readonly %"$this257.pointer") #0 {
entry:
  %tmpv.244 = alloca %ScrubWriter.0, align 8, !go_addrtaken !3
  %call.38 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d)
  %icmp.176 = icmp eq ptr %"$this257.pointer", null
  br i1 %icmp.176, label %then.142, label %else.142, !make.implicit !3

then.142:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.142:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.244, ptr noundef nonnull align 8 dereferenceable(24) %"$this257.pointer", i64 24, i1 false)
  %deref.ld.14 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.177 = icmp eq i32 %deref.ld.14, 0
  br i1 %icmp.177, label %then.143, label %else.143

then.143:                                         ; preds = %else.142
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.38, ptr noundef nonnull align 8 dereferenceable(24) %"$this257.pointer", i64 24, i1 false)
  br label %else.145

else.143:                                         ; preds = %else.142
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d, ptr nonnull %call.38, ptr nonnull %tmpv.244)
  br label %else.145

else.145:                                         ; preds = %else.143, %then.143
  %.field.ld.42 = load ptr, ptr %call.38, align 8
  %field.234 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.42, i64 0, i32 3
  %.field.ld.43 = load ptr, ptr %field.234, align 8
  %field.235 = getelementptr inbounds i8, ptr %call.38, i64 8
  %.field.ld.44 = load ptr, ptr %field.235, align 8
  %call.37 = call { ptr, ptr } %.field.ld.43(ptr nest undef, ptr %.field.ld.44)
  ret { ptr, ptr } %call.37
}

define { ptr, ptr } @go_0llvm.ScrubWriter.RemoteAddr..stub(ptr nest nocapture readnone %nest.34, ptr readonly %"$this258.pointer") #0 {
entry:
  %tmpv.251 = alloca %ScrubWriter.0, align 8, !go_addrtaken !3
  %call.40 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d)
  %icmp.180 = icmp eq ptr %"$this258.pointer", null
  br i1 %icmp.180, label %then.146, label %else.146, !make.implicit !3

then.146:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.146:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.251, ptr noundef nonnull align 8 dereferenceable(24) %"$this258.pointer", i64 24, i1 false)
  %deref.ld.15 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.181 = icmp eq i32 %deref.ld.15, 0
  br i1 %icmp.181, label %then.147, label %else.147

then.147:                                         ; preds = %else.146
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.40, ptr noundef nonnull align 8 dereferenceable(24) %"$this258.pointer", i64 24, i1 false)
  br label %else.149

else.147:                                         ; preds = %else.146
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d, ptr nonnull %call.40, ptr nonnull %tmpv.251)
  br label %else.149

else.149:                                         ; preds = %else.147, %then.147
  %.field.ld.45 = load ptr, ptr %call.40, align 8
  %field.238 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.45, i64 0, i32 4
  %.field.ld.46 = load ptr, ptr %field.238, align 8
  %field.239 = getelementptr inbounds i8, ptr %call.40, i64 8
  %.field.ld.47 = load ptr, ptr %field.239, align 8
  %call.39 = call { ptr, ptr } %.field.ld.46(ptr nest undef, ptr %.field.ld.47)
  ret { ptr, ptr } %call.39
}

define { ptr, ptr } @go_0llvm.ScrubWriter.TsigStatus..stub(ptr nest nocapture readnone %nest.35, ptr readonly %"$this259.pointer") #0 {
entry:
  %tmpv.258 = alloca %ScrubWriter.0, align 8, !go_addrtaken !3
  %call.42 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d)
  %icmp.184 = icmp eq ptr %"$this259.pointer", null
  br i1 %icmp.184, label %then.150, label %else.150, !make.implicit !3

then.150:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.150:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.258, ptr noundef nonnull align 8 dereferenceable(24) %"$this259.pointer", i64 24, i1 false)
  %deref.ld.16 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.185 = icmp eq i32 %deref.ld.16, 0
  br i1 %icmp.185, label %then.151, label %else.151

then.151:                                         ; preds = %else.150
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.42, ptr noundef nonnull align 8 dereferenceable(24) %"$this259.pointer", i64 24, i1 false)
  br label %else.153

else.151:                                         ; preds = %else.150
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d, ptr nonnull %call.42, ptr nonnull %tmpv.258)
  br label %else.153

else.153:                                         ; preds = %else.151, %then.151
  %.field.ld.48 = load ptr, ptr %call.42, align 8
  %field.242 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.48, i64 0, i32 5
  %.field.ld.49 = load ptr, ptr %field.242, align 8
  %field.243 = getelementptr inbounds i8, ptr %call.42, i64 8
  %.field.ld.50 = load ptr, ptr %field.243, align 8
  %call.41 = call { ptr, ptr } %.field.ld.49(ptr nest undef, ptr %.field.ld.50)
  ret { ptr, ptr } %call.41
}

define void @go_0llvm.ScrubWriter.TsigTimersOnly..stub(ptr nest nocapture readnone %nest.36, ptr readonly %"$this260.pointer", i8 zeroext %"$p261") #0 {
entry:
  %tmpv.264 = alloca %ScrubWriter.0, align 8, !go_addrtaken !3
  %call.43 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d)
  %icmp.188 = icmp eq ptr %"$this260.pointer", null
  br i1 %icmp.188, label %then.154, label %else.154, !make.implicit !3

then.154:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.154:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.264, ptr noundef nonnull align 8 dereferenceable(24) %"$this260.pointer", i64 24, i1 false)
  %deref.ld.17 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.189 = icmp eq i32 %deref.ld.17, 0
  br i1 %icmp.189, label %then.155, label %else.155

then.155:                                         ; preds = %else.154
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.43, ptr noundef nonnull align 8 dereferenceable(24) %"$this260.pointer", i64 24, i1 false)
  br label %else.157

else.155:                                         ; preds = %else.154
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d, ptr nonnull %call.43, ptr nonnull %tmpv.264)
  br label %else.157

else.157:                                         ; preds = %else.155, %then.155
  %.field.ld.51 = load ptr, ptr %call.43, align 8
  %field.246 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.51, i64 0, i32 6
  %.field.ld.52 = load ptr, ptr %field.246, align 8
  %field.247 = getelementptr inbounds i8, ptr %call.43, i64 8
  %.field.ld.53 = load ptr, ptr %field.247, align 8
  call void %.field.ld.52(ptr nest undef, ptr %.field.ld.53, i8 zeroext %"$p261")
  ret void
}

define void @go_0llvm.ScrubWriter.Write..stub(ptr nocapture writeonly sret({ i64, %error.0 }) %sret.formal.2, ptr nest nocapture readnone %nest.37, ptr readonly %"$this262.pointer", ptr byval({ ptr, i64, i64 }) %"$p263") #0 {
entry:
  %sret.actual.11 = alloca { i64, %error.0 }, align 8
  %tmpv.275 = alloca %ScrubWriter.0, align 8, !go_addrtaken !3
  %call.44 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d)
  %icmp.192 = icmp eq ptr %"$this262.pointer", null
  br i1 %icmp.192, label %then.158, label %else.158, !make.implicit !3

then.158:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.158:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.275, ptr noundef nonnull align 8 dereferenceable(24) %"$this262.pointer", i64 24, i1 false)
  %deref.ld.18 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.193 = icmp eq i32 %deref.ld.18, 0
  br i1 %icmp.193, label %then.159, label %else.159

then.159:                                         ; preds = %else.158
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.44, ptr noundef nonnull align 8 dereferenceable(24) %"$this262.pointer", i64 24, i1 false)
  br label %fallthrough.159

fallthrough.159:                                  ; preds = %else.159, %then.159
  %.field.ld.54 = load ptr, ptr %call.44, align 8
  %field.250 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.54, i64 0, i32 7
  %.field.ld.55 = load ptr, ptr %field.250, align 8
  %field.251 = getelementptr inbounds i8, ptr %call.44, i64 8
  %.field.ld.56 = load ptr, ptr %field.251, align 8
  call void %.field.ld.55(ptr nonnull %sret.actual.11, ptr nest undef, ptr %.field.ld.56, ptr nonnull byval({ ptr, i64, i64 }) %"$p263")
  %tmpv.266.sroa.0.0.copyload = load i64, ptr %sret.actual.11, align 8
  %tmpv.266.sroa.2.0.cast.1527.sroa_idx = getelementptr inbounds { i64, %error.0 }, ptr %sret.actual.11, i64 0, i32 1
  %tmp.14.sroa.2.0.cast.1536.sroa_idx = getelementptr inbounds { i64, %error.0 }, ptr %sret.formal.2, i64 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %tmp.14.sroa.2.0.cast.1536.sroa_idx, ptr noundef nonnull align 8 dereferenceable(16) %tmpv.266.sroa.2.0.cast.1527.sroa_idx, i64 16, i1 false)
  store i64 %tmpv.266.sroa.0.0.copyload, ptr %sret.formal.2, align 8
  ret void

else.159:                                         ; preds = %else.158
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d, ptr nonnull %call.44, ptr nonnull %tmpv.275)
  br label %fallthrough.159
}

define { ptr, ptr } @go_0llvm.ScrubWriter.WriteMsg..stub(ptr nest nocapture readnone %nest.38, ptr readonly %"$this264.pointer", ptr %"$p265") #0 {
entry:
  %tmpv.282 = alloca %ScrubWriter.0, align 8, !go_addrtaken !3
  %call.46 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d)
  %icmp.196 = icmp eq ptr %"$this264.pointer", null
  br i1 %icmp.196, label %then.162, label %else.162, !make.implicit !3

then.162:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.162:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.282, ptr noundef nonnull align 8 dereferenceable(24) %"$this264.pointer", i64 24, i1 false)
  %deref.ld.19 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.197 = icmp eq i32 %deref.ld.19, 0
  br i1 %icmp.197, label %then.163, label %else.163

then.163:                                         ; preds = %else.162
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.46, ptr noundef nonnull align 8 dereferenceable(24) %"$this264.pointer", i64 24, i1 false)
  br label %else.165

else.163:                                         ; preds = %else.162
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d, ptr nonnull %call.46, ptr nonnull %tmpv.282)
  br label %else.165

else.165:                                         ; preds = %else.163, %then.163
  %.field.ld.57 = load ptr, ptr %call.46, align 8
  %field.258 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.57, i64 0, i32 8
  %.field.ld.58 = load ptr, ptr %field.258, align 8
  %field.259 = getelementptr inbounds i8, ptr %call.46, i64 8
  %.field.ld.59 = load ptr, ptr %field.259, align 8
  %call.45 = call { ptr, ptr } %.field.ld.58(ptr nest undef, ptr %.field.ld.59, ptr %"$p265")
  ret { ptr, ptr } %call.45
}

define void @go_0llvm.supported.Lock..stub(ptr nest nocapture readnone %nest.41, ptr %"$this268") #0 {
entry:
  %icmp.200 = icmp eq ptr %"$this268", null
  br i1 %icmp.200, label %then.168, label %else.168, !make.implicit !3

then.168:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.168:                                         ; preds = %entry
  %field.262 = getelementptr inbounds %.go.llvm.supported.0, ptr %"$this268", i64 0, i32 1
  call void @sync.RWMutex.Lock(ptr nest undef, ptr nonnull %field.262)
  ret void
}

define void @go_0llvm.supported.RLock..stub(ptr nest nocapture readnone %nest.44, ptr %"$this272") #0 {
entry:
  %icmp.203 = icmp eq ptr %"$this272", null
  br i1 %icmp.203, label %then.171, label %else.171, !make.implicit !3

then.171:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.171:                                         ; preds = %entry
  %field.265 = getelementptr inbounds %.go.llvm.supported.0, ptr %"$this272", i64 0, i32 1
  call void @sync.RWMutex.RLock(ptr nest undef, ptr nonnull %field.265)
  ret void
}

define { ptr, ptr } @go_0llvm.supported.RLocker..stub(ptr nest nocapture readnone %nest.39, ptr %"$this266") #0 {
entry:
  %icmp.198 = icmp eq ptr %"$this266", null
  br i1 %icmp.198, label %then.166, label %else.166, !make.implicit !3

then.166:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.166:                                         ; preds = %entry
  %field.260 = getelementptr inbounds %.go.llvm.supported.0, ptr %"$this266", i64 0, i32 1
  %ld.87.fca.1.insert.i = insertvalue { ptr, ptr } { ptr @pimt..interface_4Lock_bfunc_8_9_8_9_cUnlock_bfunc_8_9_8_9_5..sync.rlocker, ptr undef }, ptr %field.260, 1
  ret { ptr, ptr } %ld.87.fca.1.insert.i
}

define void @go_0llvm.supported.RUnlock..stub(ptr nest nocapture readnone %nest.43, ptr %"$this271") #0 {
entry:
  %icmp.202 = icmp eq ptr %"$this271", null
  br i1 %icmp.202, label %then.170, label %else.170, !make.implicit !3

then.170:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.170:                                         ; preds = %entry
  %field.264 = getelementptr inbounds %.go.llvm.supported.0, ptr %"$this271", i64 0, i32 1
  call void @sync.RWMutex.RUnlock(ptr nest undef, ptr nonnull %field.264)
  ret void
}

define void @go_0llvm.supported.Unlock..stub(ptr nest nocapture readnone %nest.40, ptr %"$this267") #0 {
entry:
  %icmp.199 = icmp eq ptr %"$this267", null
  br i1 %icmp.199, label %then.167, label %else.167, !make.implicit !3

then.167:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.167:                                         ; preds = %entry
  %field.261 = getelementptr inbounds %.go.llvm.supported.0, ptr %"$this267", i64 0, i32 1
  call void @sync.RWMutex.Unlock(ptr nest undef, ptr nonnull %field.261)
  ret void
}

define void @go_0llvm.supported.sync_0rUnlockSlow..stub(ptr nest nocapture readnone %nest.42, ptr %"$this269", i32 %"$p270") #0 {
entry:
  %icmp.201 = icmp eq ptr %"$this269", null
  br i1 %icmp.201, label %then.169, label %else.169, !make.implicit !3

then.169:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.169:                                         ; preds = %entry
  %field.263 = getelementptr inbounds %.go.llvm.supported.0, ptr %"$this269", i64 0, i32 1
  call void @sync.RWMutex.rUnlockSlow(ptr nest undef, ptr nonnull %field.263, i32 %"$p270")
  ret void
}

define void @go.llvm..import(ptr nest nocapture readnone %nest.0) local_unnamed_addr #0 {
entry:
  %tmpv.3 = alloca %.go.llvm.supported.0, align 8, !go_addrtaken !3
  call void @runtime.registerGCRoots(ptr nest undef, ptr nonnull @go..C0)
  %call.0 = call ptr @runtime.makemap__small(ptr nest undef)
  %call.1 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.supported..d)
  store ptr %call.0, ptr %tmpv.3, align 8
  %field.1 = getelementptr inbounds %.go.llvm.supported.0, ptr %tmpv.3, i64 0, i32 1
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %field.1, i8 0, i64 24, i1 false)
  %deref.ld.0 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.0 = icmp eq i32 %deref.ld.0, 0
  br i1 %icmp.0, label %fallthrough.474.thread, label %fallthrough.474

fallthrough.474.thread:                           ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %call.1, ptr noundef nonnull align 8 dereferenceable(32) %tmpv.3, i64 32, i1 false)
  br label %else.476

fallthrough.474:                                  ; preds = %entry
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.supported..d, ptr nonnull %call.1, ptr nonnull %tmpv.3)
  %deref.ld.1.pr = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.2 = icmp eq i32 %deref.ld.1.pr, 0
  br i1 %icmp.2, label %else.476, label %else.475

fallthrough.475:                                  ; preds = %else.476, %else.475
  ret void

else.475:                                         ; preds = %fallthrough.474
  %pticast.13 = ptrtoint ptr %call.1 to i64
  call void @runtime.gcWriteBarrier(ptr nest undef, ptr nonnull @go_0llvm.sup, i64 %pticast.13)
  br label %fallthrough.475

else.476:                                         ; preds = %fallthrough.474.thread, %fallthrough.474
  store ptr %call.1, ptr @go_0llvm.sup, align 8
  br label %fallthrough.475
}

declare ptr @runtime.makemap__small(ptr) local_unnamed_addr #0

declare noalias nonnull ptr @runtime.newobject(ptr, ptr) local_unnamed_addr #0

; Function Attrs: cold
declare void @runtime.typedmemmove(ptr, ptr, ptr, ptr) local_unnamed_addr #1

; Function Attrs: noreturn
declare void @runtime.panicmem(ptr) local_unnamed_addr #2

; Function Attrs: cold
declare void @runtime.gcWriteBarrier(ptr, ptr, i64) local_unnamed_addr #1

define i64 @go_0llvm.Zone.Len..stub(ptr nest nocapture readnone %nest.54, ptr readonly %"$this286.pointer") #0 {
entry:
  %icmp.213 = icmp eq ptr %"$this286.pointer", null
  br i1 %icmp.213, label %then.181, label %else.181, !make.implicit !3

then.181:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.181:                                         ; preds = %entry
  %"$this286.sroa.3.0.cast.1627.sroa_idx4" = getelementptr inbounds %Zone.0, ptr %"$this286.pointer", i64 0, i32 3
  %"$this286.sroa.3.0.copyload" = load ptr, ptr %"$this286.sroa.3.0.cast.1627.sroa_idx4", align 8
  %call.52 = call i64 @go_0llvm.Tree.Len(ptr nest poison, ptr %"$this286.sroa.3.0.copyload")
  ret i64 %call.52
}

define i8 @go_0llvm.Elem.Empty(ptr nest nocapture readnone %nest.14, ptr readonly %e) #0 {
entry:
  %icmp.37 = icmp eq ptr %e, null
  br i1 %icmp.37, label %then.34, label %else.34, !make.implicit !3

then.34:                                          ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.34:                                          ; preds = %entry
  %.field.ld.91 = load ptr, ptr %e, align 8
  %icmp.38 = icmp eq ptr %.field.ld.91, null
  br i1 %icmp.38, label %fallthrough.35, label %else.35

fallthrough.35:                                   ; preds = %else.35, %else.34
  %tmpv.73.0 = phi i8 [ %phi.cast, %else.35 ], [ 1, %else.34 ]
  ret i8 %tmpv.73.0

else.35:                                          ; preds = %else.34
  %deref.ld.8 = load i64, ptr %.field.ld.91, align 8
  %phi.cmp = icmp eq i64 %deref.ld.8, 0
  %phi.cast = zext i1 %phi.cmp to i8
  br label %fallthrough.35
}

define { ptr, i64 } @go_0llvm.Elem.Name(ptr nest nocapture readnone %nest.15, ptr %e) #0 {
entry:
  %tmpv.84 = alloca %IPST.2, align 8, !go_addrtaken !3
  %icmp.40 = icmp eq ptr %e, null
  br i1 %icmp.40, label %then.36, label %else.36, !make.implicit !3

then.36:                                          ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.36:                                          ; preds = %entry
  %tmpv.74.sroa.0.0.cast.1237.sroa_idx = getelementptr inbounds %Elem.0, ptr %e, i64 0, i32 1, i32 0
  %tmpv.74.sroa.3.0.cast.1237.sroa_idx20 = getelementptr inbounds %Elem.0, ptr %e, i64 0, i32 1, i32 1
  %tmpv.74.sroa.3.0.copyload = load i64, ptr %tmpv.74.sroa.3.0.cast.1237.sroa_idx20, align 8
  %icmp.42 = icmp eq i64 %tmpv.74.sroa.3.0.copyload, 0
  br i1 %icmp.42, label %else.41, label %else.40

common.ret:                                       ; preds = %else.41, %else.49, %else.40
  %common.ret.op = phi { ptr, i64 } [ %ld.10.fca.1.insert, %else.40 ], [ %ld.11.fca.1.insert, %else.49 ], [ zeroinitializer, %else.41 ]
  ret { ptr, i64 } %common.ret.op

else.40:                                          ; preds = %else.36
  %"$ret14.sroa.0.0.copyload" = load ptr, ptr %tmpv.74.sroa.0.0.cast.1237.sroa_idx, align 8
  %ld.10.fca.0.insert = insertvalue { ptr, i64 } undef, ptr %"$ret14.sroa.0.0.copyload", 0
  %ld.10.fca.1.insert = insertvalue { ptr, i64 } %ld.10.fca.0.insert, i64 %tmpv.74.sroa.3.0.copyload, 1
  br label %common.ret

else.41:                                          ; preds = %else.36
  %.field.ld.10 = load ptr, ptr %e, align 8
  call void @runtime.mapiterinit(ptr nest undef, ptr nonnull @type..map_6uint16_7_6_7go_0llvm_0RR, ptr %.field.ld.10, ptr nonnull %tmpv.84)
  %tmpv.84.field.ld.2 = load ptr, ptr %tmpv.84, align 8
  %icmp.56.not = icmp eq ptr %tmpv.84.field.ld.2, null
  br i1 %icmp.56.not, label %common.ret, label %then.50

fallthrough.42:                                   ; preds = %then.50
  %tmpv.83.sroa.0.0.copyload = load ptr, ptr %tmpv.84.field.ld.1, align 8
  %tmpv.88.sroa.0.0.copyload = load ptr, ptr %tmpv.83.sroa.0.0.copyload, align 8
  %tmpv.88.sroa.2.0.cast.1254.sroa_idx2 = getelementptr inbounds %RR.0, ptr %tmpv.83.sroa.0.0.copyload, i64 0, i32 1
  %tmpv.88.sroa.2.0.copyload = load ptr, ptr %tmpv.88.sroa.2.0.cast.1254.sroa_idx2, align 8
  %field.81 = getelementptr inbounds { ptr, ptr, ptr }, ptr %tmpv.88.sroa.0.0.copyload, i64 0, i32 1
  %.field.ld.11 = load ptr, ptr %field.81, align 8
  %call.11 = call ptr %.field.ld.11(ptr nest undef, ptr %tmpv.88.sroa.2.0.copyload)
  %icmp.50 = icmp eq ptr %call.11, null
  br i1 %icmp.50, label %then.44, label %else.44, !make.implicit !3

else.42:                                          ; preds = %then.50
  call void @runtime.goPanicIndex(ptr nest undef, i64 0, i64 %tmpv.83.sroa.2.0.copyload)
  unreachable

then.44:                                          ; preds = %fallthrough.42
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.44:                                          ; preds = %fallthrough.42
  %tmpv.92.sroa.0.0.copyload = load ptr, ptr %call.11, align 8
  %tmpv.92.sroa.3.0.cast.1258.sroa_idx1 = getelementptr inbounds %RR_Header.0, ptr %call.11, i64 0, i32 0, i32 1
  %tmpv.92.sroa.3.0.copyload = load i64, ptr %tmpv.92.sroa.3.0.cast.1258.sroa_idx1, align 8
  store i64 %tmpv.92.sroa.3.0.copyload, ptr %tmpv.74.sroa.3.0.cast.1237.sroa_idx20, align 8
  %deref.ld.9 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.54 = icmp eq i32 %deref.ld.9, 0
  br i1 %icmp.54, label %else.47, label %else.48

else.47:                                          ; preds = %else.44
  store ptr %tmpv.92.sroa.0.0.copyload, ptr %tmpv.74.sroa.0.0.cast.1237.sroa_idx, align 8
  br label %else.49

else.48:                                          ; preds = %else.44
  %pticast.17 = ptrtoint ptr %tmpv.92.sroa.0.0.copyload to i64
  call void @runtime.gcWriteBarrier(ptr nest undef, ptr nonnull %tmpv.74.sroa.0.0.cast.1237.sroa_idx, i64 %pticast.17)
  %"$ret14.sroa.0.0.copyload21.pre" = load ptr, ptr %tmpv.74.sroa.0.0.cast.1237.sroa_idx, align 8
  %"$ret14.sroa.11.0.copyload29.pre" = load i64, ptr %tmpv.74.sroa.3.0.cast.1237.sroa_idx20, align 8
  br label %else.49

else.49:                                          ; preds = %else.48, %else.47
  %"$ret14.sroa.11.0.copyload29" = phi i64 [ %"$ret14.sroa.11.0.copyload29.pre", %else.48 ], [ %tmpv.92.sroa.3.0.copyload, %else.47 ]
  %"$ret14.sroa.0.0.copyload21" = phi ptr [ %"$ret14.sroa.0.0.copyload21.pre", %else.48 ], [ %tmpv.92.sroa.0.0.copyload, %else.47 ]
  %ld.11.fca.0.insert = insertvalue { ptr, i64 } undef, ptr %"$ret14.sroa.0.0.copyload21", 0
  %ld.11.fca.1.insert = insertvalue { ptr, i64 } %ld.11.fca.0.insert, i64 %"$ret14.sroa.11.0.copyload29", 1
  br label %common.ret

then.50:                                          ; preds = %else.41
  %field.76 = getelementptr inbounds %IPST.2, ptr %tmpv.84, i64 0, i32 1
  %tmpv.84.field.ld.1 = load ptr, ptr %field.76, align 8
  %tmpv.83.sroa.2.0.cast.1248.sroa_idx17 = getelementptr inbounds %IPST.0, ptr %tmpv.84.field.ld.1, i64 0, i32 1
  %tmpv.83.sroa.2.0.copyload = load i64, ptr %tmpv.83.sroa.2.0.cast.1248.sroa_idx17, align 8
  %icmp.48 = icmp sgt i64 %tmpv.83.sroa.2.0.copyload, 0
  br i1 %icmp.48, label %fallthrough.42, label %else.42
}

define void @go_0llvm.Elem.Type(ptr nocapture writeonly sret(%IPST.0) %sret.formal.0, ptr nest nocapture readnone %nest.16, ptr readonly %e, i16 zeroext %qtype) #0 {
entry:
  %qtype.addr = alloca i16, align 2
  store i16 %qtype, ptr %qtype.addr, align 2
  %icmp.57 = icmp eq ptr %e, null
  br i1 %icmp.57, label %then.51, label %else.51, !make.implicit !3

then.51:                                          ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.51:                                          ; preds = %entry
  %.field.ld.12 = load ptr, ptr %e, align 8
  %call.12 = call ptr @runtime.mapaccess1(ptr nest undef, ptr nonnull @type..map_6uint16_7_6_7go_0llvm_0RR, ptr %.field.ld.12, ptr nonnull %qtype.addr)
  call void @llvm.memmove.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %sret.formal.0, ptr noundef nonnull align 8 dereferenceable(24) %call.12, i64 24, i1 false)
  ret void
}

define void @go_0llvm.Elem.TypeForWildcard(ptr nocapture writeonly sret(%IPST.0) %sret.formal.1, ptr nest nocapture readnone %nest.17, ptr readonly %e, i16 zeroext %qtype, ptr %qname.chunk0, i64 %qname.chunk1) #0 {
entry:
  %qtype.addr = alloca i16, align 2
  store i16 %qtype, ptr %qtype.addr, align 2
  %icmp.58 = icmp eq ptr %e, null
  br i1 %icmp.58, label %then.52, label %else.52, !make.implicit !3

then.52:                                          ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.52:                                          ; preds = %entry
  %.field.ld.13 = load ptr, ptr %e, align 8
  %call.13 = call ptr @runtime.mapaccess1(ptr nest undef, ptr nonnull @type..map_6uint16_7_6_7go_0llvm_0RR, ptr %.field.ld.13, ptr nonnull %qtype.addr)
  %rrs.sroa.0.0.copyload = load ptr, ptr %call.13, align 8
  %rrs.sroa.7.0.cast.1288.sroa_idx36 = getelementptr inbounds i8, ptr %call.13, i64 8
  %rrs.sroa.7.0.copyload = load i64, ptr %rrs.sroa.7.0.cast.1288.sroa_idx36, align 8
  %icmp.59 = icmp eq ptr %rrs.sroa.0.0.copyload, null
  br i1 %icmp.59, label %then.53, label %else.53

common.ret:                                       ; preds = %else.66, %then.53
  ret void

then.53:                                          ; preds = %else.52
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %sret.formal.1, i8 0, i64 24, i1 false)
  br label %common.ret

else.53:                                          ; preds = %else.52
  %call.14 = call ptr @runtime.makeslice(ptr nest undef, ptr nonnull @go_0llvm.RR..d, i64 %rrs.sroa.7.0.copyload, i64 %rrs.sroa.7.0.copyload)
  %pticast.19 = ptrtoint ptr %qname.chunk0 to i64
  %icmp.7565 = icmp sgt i64 %rrs.sroa.7.0.copyload, 0
  br i1 %icmp.7565, label %then.66, label %else.66

then.56:                                          ; preds = %then.66
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.56:                                          ; preds = %then.66
  %call.15.fca.0.extract = extractvalue { ptr, ptr } %call.15, 0
  store ptr %call.15.fca.0.extract, ptr %ptroff.2, align 8
  %deref.ld.10 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.67 = icmp eq i32 %deref.ld.10, 0
  %field.109 = getelementptr %RR.0, ptr %call.14, i64 %tmpv.103.066, i32 1
  br i1 %icmp.67, label %else.58, label %else.59

else.58:                                          ; preds = %else.56
  store ptr %call.15.fca.1.extract, ptr %field.109, align 8
  br label %fallthrough.60

else.59:                                          ; preds = %else.56
  %pticast.18 = ptrtoint ptr %call.15.fca.1.extract to i64
  call void @runtime.gcWriteBarrier(ptr nest undef, ptr %field.109, i64 %pticast.18)
  %tmpv.117.sroa.0.0.copyload.pre = load ptr, ptr %ptroff.2, align 8
  %tmpv.117.sroa.2.0.copyload.pre = load ptr, ptr %field.109, align 8
  br label %fallthrough.60

fallthrough.60:                                   ; preds = %else.59, %else.58
  %tmpv.117.sroa.2.0.copyload = phi ptr [ %tmpv.117.sroa.2.0.copyload.pre, %else.59 ], [ %call.15.fca.1.extract, %else.58 ]
  %tmpv.117.sroa.0.0.copyload = phi ptr [ %tmpv.117.sroa.0.0.copyload.pre, %else.59 ], [ %call.15.fca.0.extract, %else.58 ]
  %field.117 = getelementptr inbounds { ptr, ptr, ptr }, ptr %tmpv.117.sroa.0.0.copyload, i64 0, i32 1
  %.field.ld.14 = load ptr, ptr %field.117, align 8
  %call.16 = call ptr %.field.ld.14(ptr nest undef, ptr %tmpv.117.sroa.2.0.copyload)
  %icmp.70 = icmp eq ptr %call.16, null
  br i1 %icmp.70, label %then.61, label %else.62, !make.implicit !3

then.61:                                          ; preds = %fallthrough.60
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.62:                                          ; preds = %fallthrough.60
  %field.120 = getelementptr inbounds %RR_Header.0, ptr %call.16, i64 0, i32 0, i32 1
  store i64 %qname.chunk1, ptr %field.120, align 8
  %deref.ld.11 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.74 = icmp eq i32 %deref.ld.11, 0
  br i1 %icmp.74, label %else.64, label %else.65

fallthrough.63:                                   ; preds = %else.65, %else.64
  %add.0 = add nuw nsw i64 %tmpv.103.066, 1
  %exitcond.not = icmp eq i64 %add.0, %rrs.sroa.7.0.copyload
  br i1 %exitcond.not, label %else.66, label %then.66

else.64:                                          ; preds = %else.62
  store ptr %qname.chunk0, ptr %call.16, align 8
  br label %fallthrough.63

else.65:                                          ; preds = %else.62
  call void @runtime.gcWriteBarrier(ptr nest undef, ptr nonnull %call.16, i64 %pticast.19)
  br label %fallthrough.63

then.66:                                          ; preds = %else.53, %fallthrough.63
  %tmpv.103.066 = phi i64 [ %add.0, %fallthrough.63 ], [ 0, %else.53 ]
  %ptroff.1 = getelementptr %RR.0, ptr %rrs.sroa.0.0.copyload, i64 %tmpv.103.066
  %ld.13 = load ptr, ptr %ptroff.1, align 8
  %0 = getelementptr %RR.0, ptr %rrs.sroa.0.0.copyload, i64 %tmpv.103.066, i32 1
  %ld.14 = load ptr, ptr %0, align 8
  %call.15 = call { ptr, ptr } @go_0llvm.Copy(ptr nest undef, ptr %ld.13, ptr %ld.14)
  %call.15.fca.1.extract = extractvalue { ptr, ptr } %call.15, 1
  %ptroff.2 = getelementptr %RR.0, ptr %call.14, i64 %tmpv.103.066
  %icmp.64 = icmp eq ptr %ptroff.2, null
  br i1 %icmp.64, label %then.56, label %else.56, !make.implicit !3

else.66:                                          ; preds = %fallthrough.63, %else.53
  store ptr %call.14, ptr %sret.formal.1, align 8
  %"$ret16.sroa.8.0.cast.1318.sroa_idx50" = getelementptr inbounds %IPST.0, ptr %sret.formal.1, i64 0, i32 1
  store i64 %rrs.sroa.7.0.copyload, ptr %"$ret16.sroa.8.0.cast.1318.sroa_idx50", align 8
  %"$ret16.sroa.9.0.cast.1318.sroa_idx57" = getelementptr inbounds %IPST.0, ptr %sret.formal.1, i64 0, i32 2
  store i64 %rrs.sroa.7.0.copyload, ptr %"$ret16.sroa.9.0.cast.1318.sroa_idx57", align 8
  br label %common.ret
}

define { ptr, i8 } @go_0llvm.Zone.Next..stub(ptr nest nocapture readnone %nest.48, ptr readonly %"$this276.pointer", ptr %"$p277.chunk0", i64 %"$p277.chunk1") #0 {
entry:
  %icmp.207 = icmp eq ptr %"$this276.pointer", null
  br i1 %icmp.207, label %then.175, label %else.175, !make.implicit !3

then.175:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.175:                                         ; preds = %entry
  %"$this276.sroa.3.0.cast.1602.sroa_idx4" = getelementptr inbounds %Zone.0, ptr %"$this276.pointer", i64 0, i32 3
  %"$this276.sroa.3.0.copyload" = load ptr, ptr %"$this276.sroa.3.0.cast.1602.sroa_idx4", align 8
  %call.49 = call { ptr, i8 } @go_0llvm.Tree.Next(ptr nest poison, ptr %"$this276.sroa.3.0.copyload", ptr %"$p277.chunk0", i64 %"$p277.chunk1")
  ret { ptr, i8 } %call.49
}

define { ptr, i8 } @go_0llvm.Zone.Prev..stub(ptr nest nocapture readnone %nest.52, ptr readonly %"$this282.pointer", ptr %"$p283.chunk0", i64 %"$p283.chunk1") #0 {
entry:
  %icmp.211 = icmp eq ptr %"$this282.pointer", null
  br i1 %icmp.211, label %then.179, label %else.179, !make.implicit !3

then.179:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.179:                                         ; preds = %entry
  %"$this282.sroa.3.0.cast.1614.sroa_idx4" = getelementptr inbounds %Zone.0, ptr %"$this282.pointer", i64 0, i32 3
  %"$this282.sroa.3.0.copyload" = load ptr, ptr %"$this282.sroa.3.0.cast.1614.sroa_idx4", align 8
  %call.50 = call { ptr, i8 } @go_0llvm.Tree.Prev(ptr nest poison, ptr %"$this282.sroa.3.0.copyload", ptr %"$p283.chunk0", i64 %"$p283.chunk1")
  ret { ptr, i8 } %call.50
}

define { ptr, i8 } @go_0llvm.Zone.Search..stub(ptr nest nocapture readnone %nest.53, ptr readonly %"$this284.pointer", ptr %"$p285.chunk0", i64 %"$p285.chunk1") #0 {
entry:
  %icmp.212 = icmp eq ptr %"$this284.pointer", null
  br i1 %icmp.212, label %then.180, label %else.180, !make.implicit !3

then.180:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.180:                                         ; preds = %entry
  %"$this284.sroa.3.0.cast.1623.sroa_idx4" = getelementptr inbounds %Zone.0, ptr %"$this284.pointer", i64 0, i32 3
  %"$this284.sroa.3.0.copyload" = load ptr, ptr %"$this284.sroa.3.0.cast.1623.sroa_idx4", align 8
  %call.51 = call { ptr, i8 } @go_0llvm.Tree.Search(ptr nest poison, ptr %"$this284.sroa.3.0.copyload", ptr %"$p285.chunk0", i64 %"$p285.chunk1")
  ret { ptr, i8 } %call.51
}

define void @go_0llvm.Zone.Lock..stub(ptr nest nocapture readnone %nest.47, ptr %"$this275") #0 {
entry:
  %icmp.206 = icmp eq ptr %"$this275", null
  br i1 %icmp.206, label %then.174, label %else.174, !make.implicit !3

then.174:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.174:                                         ; preds = %entry
  %field.268 = getelementptr inbounds %Zone.0, ptr %"$this275", i64 0, i32 6
  call void @sync.RWMutex.Lock(ptr nest undef, ptr nonnull %field.268)
  ret void
}

define void @go_0llvm.Zone.RLock..stub(ptr nest nocapture readnone %nest.51, ptr %"$this281") #0 {
entry:
  %icmp.210 = icmp eq ptr %"$this281", null
  br i1 %icmp.210, label %then.178, label %else.178, !make.implicit !3

then.178:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.178:                                         ; preds = %entry
  %field.276 = getelementptr inbounds %Zone.0, ptr %"$this281", i64 0, i32 6
  call void @sync.RWMutex.RLock(ptr nest undef, ptr nonnull %field.276)
  ret void
}

define { ptr, ptr } @go_0llvm.Zone.RLocker..stub(ptr nest nocapture readnone %nest.45, ptr %"$this273") #0 {
entry:
  %icmp.204 = icmp eq ptr %"$this273", null
  br i1 %icmp.204, label %then.172, label %else.172, !make.implicit !3

then.172:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.172:                                         ; preds = %entry
  %field.266 = getelementptr inbounds %Zone.0, ptr %"$this273", i64 0, i32 6
  %ld.87.fca.1.insert.i = insertvalue { ptr, ptr } { ptr @pimt..interface_4Lock_bfunc_8_9_8_9_cUnlock_bfunc_8_9_8_9_5..sync.rlocker, ptr undef }, ptr %field.266, 1
  ret { ptr, ptr } %ld.87.fca.1.insert.i
}

define void @go_0llvm.Zone.RUnlock..stub(ptr nest nocapture readnone %nest.50, ptr %"$this280") #0 {
entry:
  %icmp.209 = icmp eq ptr %"$this280", null
  br i1 %icmp.209, label %then.177, label %else.177, !make.implicit !3

then.177:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.177:                                         ; preds = %entry
  %field.275 = getelementptr inbounds %Zone.0, ptr %"$this280", i64 0, i32 6
  call void @sync.RWMutex.RUnlock(ptr nest undef, ptr nonnull %field.275)
  ret void
}

define void @go_0llvm.Zone.Unlock..stub(ptr nest nocapture readnone %nest.46, ptr %"$this274") #0 {
entry:
  %icmp.205 = icmp eq ptr %"$this274", null
  br i1 %icmp.205, label %then.173, label %else.173, !make.implicit !3

then.173:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.173:                                         ; preds = %entry
  %field.267 = getelementptr inbounds %Zone.0, ptr %"$this274", i64 0, i32 6
  call void @sync.RWMutex.Unlock(ptr nest undef, ptr nonnull %field.267)
  ret void
}

define void @go_0llvm.Zone.sync_0rUnlockSlow..stub(ptr nest nocapture readnone %nest.49, ptr %"$this278", i32 %"$p279") #0 {
entry:
  %icmp.208 = icmp eq ptr %"$this278", null
  br i1 %icmp.208, label %then.176, label %else.176, !make.implicit !3

then.176:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.176:                                         ; preds = %entry
  %field.274 = getelementptr inbounds %Zone.0, ptr %"$this278", i64 0, i32 6
  call void @sync.RWMutex.rUnlockSlow(ptr nest undef, ptr nonnull %field.274, i32 %"$p279")
  ret void
}

define i64 @go_0llvm.Tree.Len(ptr nest nocapture readnone %nest.20, ptr readonly %t) #0 {
entry:
  %icmp.78 = icmp eq ptr %t, null
  br i1 %icmp.78, label %then.69, label %else.69, !make.implicit !3

then.69:                                          ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.69:                                          ; preds = %entry
  %field.127 = getelementptr inbounds %Tree.0, ptr %t, i64 0, i32 1
  %.field.ld.16 = load i64, ptr %field.127, align 8
  ret i64 %.field.ld.16
}

define { ptr, i8 } @go_0llvm.Tree.Next(ptr nest nocapture readnone %nest.25, ptr readonly %t, ptr %qname.chunk0, i64 %qname.chunk1) #0 {
entry:
  %icmp.110 = icmp eq ptr %t, null
  br i1 %icmp.110, label %then.93, label %else.93, !make.implicit !3

then.93:                                          ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.93:                                          ; preds = %entry
  %.field.ld.29 = load ptr, ptr %t, align 8
  %icmp.111 = icmp eq ptr %.field.ld.29, null
  br i1 %icmp.111, label %common.ret, label %else.95

common.ret:                                       ; preds = %else.93, %else.95, %else.97
  %common.ret.op = phi { ptr, i8 } [ %ld.39.fca.1.insert, %else.97 ], [ zeroinitializer, %else.95 ], [ zeroinitializer, %else.93 ]
  ret { ptr, i8 } %common.ret.op

else.95:                                          ; preds = %else.93
  %call.23 = call ptr @go_0llvm.Node.ceil(ptr nest poison, ptr nonnull %.field.ld.29, ptr %qname.chunk0, i64 %qname.chunk1)
  %icmp.113 = icmp eq ptr %call.23, null
  br i1 %icmp.113, label %common.ret, label %else.97

else.97:                                          ; preds = %else.95
  %.field.ld.319 = load ptr, ptr %call.23, align 8
  %ld.39.fca.0.insert = insertvalue { ptr, i8 } undef, ptr %.field.ld.319, 0
  %ld.39.fca.1.insert = insertvalue { ptr, i8 } %ld.39.fca.0.insert, i8 1, 1
  br label %common.ret
}

define { ptr, i8 } @go_0llvm.Tree.Prev(ptr nest nocapture readnone %nest.23, ptr readonly %t, ptr %qname.chunk0, i64 %qname.chunk1) #0 {
entry:
  %icmp.94 = icmp eq ptr %t, null
  br i1 %icmp.94, label %then.81, label %else.81, !make.implicit !3

then.81:                                          ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.81:                                          ; preds = %entry
  %.field.ld.23 = load ptr, ptr %t, align 8
  %icmp.95 = icmp eq ptr %.field.ld.23, null
  br i1 %icmp.95, label %common.ret, label %else.83

common.ret:                                       ; preds = %else.81, %else.83, %else.85
  %common.ret.op = phi { ptr, i8 } [ %ld.28.fca.1.insert, %else.85 ], [ zeroinitializer, %else.83 ], [ zeroinitializer, %else.81 ]
  ret { ptr, i8 } %common.ret.op

else.83:                                          ; preds = %else.81
  %call.19 = call ptr @go_0llvm.Node.floor(ptr nest poison, ptr nonnull %.field.ld.23, ptr %qname.chunk0, i64 %qname.chunk1)
  %icmp.97 = icmp eq ptr %call.19, null
  br i1 %icmp.97, label %common.ret, label %else.85

else.85:                                          ; preds = %else.83
  %.field.ld.259 = load ptr, ptr %call.19, align 8
  %ld.28.fca.0.insert = insertvalue { ptr, i8 } undef, ptr %.field.ld.259, 0
  %ld.28.fca.1.insert = insertvalue { ptr, i8 } %ld.28.fca.0.insert, i8 1, 1
  br label %common.ret
}

define { ptr, i8 } @go_0llvm.Tree.Search(ptr nest nocapture readnone %nest.21, ptr readonly %t, ptr %qname.chunk0, i64 %qname.chunk1) #0 {
entry:
  %icmp.79 = icmp eq ptr %t, null
  br i1 %icmp.79, label %then.70, label %else.70, !make.implicit !3

then.70:                                          ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.70:                                          ; preds = %entry
  %.field.ld.17 = load ptr, ptr %t, align 8
  %icmp.80 = icmp eq ptr %.field.ld.17, null
  br i1 %icmp.80, label %common.ret, label %else.72

common.ret:                                       ; preds = %else.70, %else.74, %then.73
  %common.ret.op = phi { ptr, i8 } [ %ld.18.fca.1.insert, %then.73 ], [ %ld.19.fca.1.insert, %else.74 ], [ zeroinitializer, %else.70 ]
  ret { ptr, i8 } %common.ret.op

else.72:                                          ; preds = %else.70
  %call.17 = call { ptr, i8 } @go_0llvm.Node.search(ptr nest poison, ptr nonnull %.field.ld.17, ptr %qname.chunk0, i64 %qname.chunk1)
  %call.17.fca.0.extract = extractvalue { ptr, i8 } %call.17, 0
  %call.17.fca.1.extract = extractvalue { ptr, i8 } %call.17, 1
  %icmp.82 = icmp eq ptr %call.17.fca.0.extract, null
  br i1 %icmp.82, label %then.73, label %else.74

then.73:                                          ; preds = %else.72
  %ld.18.fca.1.insert = insertvalue { ptr, i8 } { ptr null, i8 undef }, i8 %call.17.fca.1.extract, 1
  br label %common.ret

else.74:                                          ; preds = %else.72
  %.field.ld.1910 = load ptr, ptr %call.17.fca.0.extract, align 8
  %ld.19.fca.0.insert = insertvalue { ptr, i8 } undef, ptr %.field.ld.1910, 0
  %ld.19.fca.1.insert = insertvalue { ptr, i8 } %ld.19.fca.0.insert, i8 %call.17.fca.1.extract, 1
  br label %common.ret
}

define ptr @go_0llvm.Node.ceil(ptr nest nocapture readnone %nest.26, ptr readonly %n, ptr %qname.chunk0, i64 %qname.chunk1) #0 {
entry:
  %icmp.115 = icmp eq ptr %n, null
  br i1 %icmp.115, label %common.ret, label %else.99

common.ret:                                       ; preds = %entry, %else.99, %else.103, %else.102
  %common.ret.op = phi ptr [ %call.25, %else.102 ], [ null, %entry ], [ %n, %else.99 ], [ %n.call.26, %else.103 ]
  ret ptr %common.ret.op

else.99:                                          ; preds = %entry
  %.field.ld.32 = load ptr, ptr %n, align 8
  %call.24 = call i64 @go_0llvm.Less(ptr nest poison, ptr %.field.ld.32, ptr %qname.chunk0, i64 %qname.chunk1)
  %icmp.117.not = icmp eq i64 %call.24, 0
  br i1 %icmp.117.not, label %common.ret, label %label.0

label.0:                                          ; preds = %else.99
  %icmp.120 = icmp slt i64 %call.24, 1
  br i1 %icmp.120, label %else.103, label %else.102

else.102:                                         ; preds = %label.0
  %field.168 = getelementptr inbounds %Node.0, ptr %n, i64 0, i32 2
  %.field.ld.33 = load ptr, ptr %field.168, align 8
  %call.25 = call ptr @go_0llvm.Node.ceil(ptr nest poison, ptr %.field.ld.33, ptr %qname.chunk0, i64 %qname.chunk1)
  br label %common.ret

else.103:                                         ; preds = %label.0
  %field.169 = getelementptr inbounds %Node.0, ptr %n, i64 0, i32 1
  %.field.ld.34 = load ptr, ptr %field.169, align 8
  %call.26 = call ptr @go_0llvm.Node.ceil(ptr nest poison, ptr %.field.ld.34, ptr %qname.chunk0, i64 %qname.chunk1)
  %icmp.125.not = icmp eq ptr %call.26, null
  %n.call.26 = select i1 %icmp.125.not, ptr %n, ptr %call.26
  br label %common.ret
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read)
define i8 @go_0llvm.Node.color(ptr nest nocapture readnone %nest.19, ptr readonly %n) #3 {
entry:
  %icmp.76 = icmp eq ptr %n, null
  br i1 %icmp.76, label %common.ret, label %else.68

common.ret:                                       ; preds = %entry, %else.68
  %common.ret.op = phi i8 [ %.field.ld.15, %else.68 ], [ 1, %entry ]
  ret i8 %common.ret.op

else.68:                                          ; preds = %entry
  %field.126 = getelementptr inbounds %Node.0, ptr %n, i64 0, i32 3
  %.field.ld.15 = load i8, ptr %field.126, align 1
  br label %common.ret
}

define ptr @go_0llvm.Node.floor(ptr nest nocapture readnone %nest.24, ptr readonly %n, ptr %qname.chunk0, i64 %qname.chunk1) #0 {
entry:
  %icmp.99 = icmp eq ptr %n, null
  br i1 %icmp.99, label %common.ret, label %else.87

common.ret:                                       ; preds = %entry, %else.87, %else.91, %else.90
  %common.ret.op = phi ptr [ %call.21, %else.90 ], [ null, %entry ], [ %n, %else.87 ], [ %n.call.22, %else.91 ]
  ret ptr %common.ret.op

else.87:                                          ; preds = %entry
  %.field.ld.26 = load ptr, ptr %n, align 8
  %call.20 = call i64 @go_0llvm.Less(ptr nest poison, ptr %.field.ld.26, ptr %qname.chunk0, i64 %qname.chunk1)
  %icmp.101.not = icmp eq i64 %call.20, 0
  br i1 %icmp.101.not, label %common.ret, label %label.0

label.0:                                          ; preds = %else.87
  %icmp.104 = icmp sgt i64 %call.20, 0
  br i1 %icmp.104, label %else.91, label %else.90

else.90:                                          ; preds = %label.0
  %field.156 = getelementptr inbounds %Node.0, ptr %n, i64 0, i32 1
  %.field.ld.27 = load ptr, ptr %field.156, align 8
  %call.21 = call ptr @go_0llvm.Node.floor(ptr nest poison, ptr %.field.ld.27, ptr %qname.chunk0, i64 %qname.chunk1)
  br label %common.ret

else.91:                                          ; preds = %label.0
  %field.157 = getelementptr inbounds %Node.0, ptr %n, i64 0, i32 2
  %.field.ld.28 = load ptr, ptr %field.157, align 8
  %call.22 = call ptr @go_0llvm.Node.floor(ptr nest poison, ptr %.field.ld.28, ptr %qname.chunk0, i64 %qname.chunk1)
  %icmp.109.not = icmp eq ptr %call.22, null
  %n.call.22 = select i1 %icmp.109.not, ptr %n, ptr %call.22
  br label %common.ret
}

define { ptr, i8 } @go_0llvm.Node.search(ptr nest nocapture readnone %nest.22, ptr %n, ptr %qname.chunk0, i64 %qname.chunk1) #0 {
entry:
  %icmp.93.not9 = icmp eq ptr %n, null
  br i1 %icmp.93.not9, label %common.ret, label %then.80

common.ret:                                       ; preds = %label.2, %entry, %else.76
  %common.ret.op = phi { ptr, i8 } [ %ld.22.fca.1.insert, %else.76 ], [ zeroinitializer, %entry ], [ zeroinitializer, %label.2 ]
  ret { ptr, i8 } %common.ret.op

else.76:                                          ; preds = %then.80
  %ld.22.fca.0.insert = insertvalue { ptr, i8 } undef, ptr %n.addr.010, 0
  %ld.22.fca.1.insert = insertvalue { ptr, i8 } %ld.22.fca.0.insert, i8 1, 1
  br label %common.ret

label.2:                                          ; preds = %then.80
  %field.143 = getelementptr inbounds %Node.0, ptr %n.addr.010, i64 0, i32 2
  %field.142 = getelementptr inbounds %Node.0, ptr %n.addr.010, i64 0, i32 1
  %icmp.881 = icmp slt i64 %call.18, 0
  %n.addr.1.in = select i1 %icmp.881, ptr %field.142, ptr %field.143
  %n.addr.1 = load ptr, ptr %n.addr.1.in, align 8
  %icmp.93.not = icmp eq ptr %n.addr.1, null
  br i1 %icmp.93.not, label %common.ret, label %then.80

then.80:                                          ; preds = %entry, %label.2
  %n.addr.010 = phi ptr [ %n.addr.1, %label.2 ], [ %n, %entry ]
  %.field.ld.20 = load ptr, ptr %n.addr.010, align 8
  %call.18 = call i64 @go_0llvm.Less(ptr nest poison, ptr %.field.ld.20, ptr %qname.chunk0, i64 %qname.chunk1)
  %icmp.85.not = icmp eq i64 %call.18, 0
  br i1 %icmp.85.not, label %else.76, label %label.2
}

define i8 @go_0llvm.Node..eq(ptr nest nocapture readnone %nest.68, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.366 = icmp eq ptr %key1, null
  br i1 %icmp.366, label %then.326, label %else.326, !make.implicit !3

then.326:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.326:                                         ; preds = %entry
  %icmp.367 = icmp eq ptr %key2, null
  br i1 %icmp.367, label %then.327, label %else.327, !make.implicit !3

then.327:                                         ; preds = %else.326
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.327:                                         ; preds = %else.326
  %.field.ld.128 = load ptr, ptr %key1, align 8
  %.field.ld.129 = load ptr, ptr %key2, align 8
  %icmp.368.not = icmp eq ptr %.field.ld.128, %.field.ld.129
  br i1 %icmp.368.not, label %else.330, label %common.ret

common.ret:                                       ; preds = %else.327, %else.330, %else.333, %else.336
  %common.ret.op = phi i8 [ %spec.select, %else.336 ], [ 0, %else.333 ], [ 0, %else.330 ], [ 0, %else.327 ]
  ret i8 %common.ret.op

else.330:                                         ; preds = %else.327
  %field.446 = getelementptr inbounds i8, ptr %key1, i64 8
  %.field.ld.130 = load ptr, ptr %field.446, align 8
  %field.447 = getelementptr inbounds i8, ptr %key2, i64 8
  %.field.ld.131 = load ptr, ptr %field.447, align 8
  %icmp.371.not = icmp eq ptr %.field.ld.130, %.field.ld.131
  br i1 %icmp.371.not, label %else.333, label %common.ret

else.333:                                         ; preds = %else.330
  %field.448 = getelementptr inbounds i8, ptr %key1, i64 16
  %.field.ld.132 = load ptr, ptr %field.448, align 8
  %field.449 = getelementptr inbounds i8, ptr %key2, i64 16
  %.field.ld.133 = load ptr, ptr %field.449, align 8
  %icmp.374.not = icmp eq ptr %.field.ld.132, %.field.ld.133
  br i1 %icmp.374.not, label %else.336, label %common.ret

else.336:                                         ; preds = %else.333
  %0 = getelementptr inbounds i8, ptr %key1, i64 24
  %.field.ld.134 = load i8, ptr %0, align 1
  %1 = getelementptr inbounds i8, ptr %key2, i64 24
  %.field.ld.135 = load i8, ptr %1, align 1
  %icmp.377.not = icmp eq i8 %.field.ld.134, %.field.ld.135
  %spec.select = zext i1 %icmp.377.not to i8
  br label %common.ret
}

define i8 @go_0llvm.NonWriter..eq(ptr nest nocapture readnone %nest.70, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.416 = icmp eq ptr %key1, null
  br i1 %icmp.416, label %then.373, label %else.373, !make.implicit !3

then.373:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.373:                                         ; preds = %entry
  %icmp.417 = icmp eq ptr %key2, null
  br i1 %icmp.417, label %then.374, label %else.374, !make.implicit !3

then.374:                                         ; preds = %else.373
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.374:                                         ; preds = %else.373
  %ld.83 = load ptr, ptr %key1, align 8
  %field1.37 = getelementptr inbounds i8, ptr %key1, i64 8
  %ld.84 = load ptr, ptr %field1.37, align 8
  %ld.85 = load ptr, ptr %key2, align 8
  %field1.38 = getelementptr inbounds i8, ptr %key2, i64 8
  %ld.86 = load ptr, ptr %field1.38, align 8
  %call.79 = call i8 @runtime.ifaceeq(ptr nest undef, ptr %ld.83, ptr %ld.84, ptr %ld.85, ptr %ld.86)
  %icmp.418.not = icmp eq i8 %call.79, 1
  br i1 %icmp.418.not, label %else.377, label %common.ret

common.ret:                                       ; preds = %else.374, %else.377
  %common.ret.op = phi i8 [ %spec.select, %else.377 ], [ 0, %else.374 ]
  ret i8 %common.ret.op

else.377:                                         ; preds = %else.374
  %field.501 = getelementptr inbounds i8, ptr %key1, i64 16
  %.field.ld.146 = load ptr, ptr %field.501, align 8
  %field.502 = getelementptr inbounds i8, ptr %key2, i64 16
  %.field.ld.147 = load ptr, ptr %field.502, align 8
  %icmp.421.not = icmp eq ptr %.field.ld.146, %.field.ld.147
  %spec.select = zext i1 %icmp.421.not to i8
  br label %common.ret
}

define { ptr, ptr } @go_0llvm.NonWriter.Close..stub(ptr nest nocapture readnone %nest.55, ptr readonly %"$this287.pointer") #0 {
entry:
  %tmpv.323 = alloca %NonWriter.0, align 8, !go_addrtaken !3
  %call.54 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d)
  %icmp.216 = icmp eq ptr %"$this287.pointer", null
  br i1 %icmp.216, label %then.182, label %else.182, !make.implicit !3

then.182:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.182:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.323, ptr noundef nonnull align 8 dereferenceable(24) %"$this287.pointer", i64 24, i1 false)
  %deref.ld.20 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.217 = icmp eq i32 %deref.ld.20, 0
  br i1 %icmp.217, label %then.183, label %else.183

then.183:                                         ; preds = %else.182
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.54, ptr noundef nonnull align 8 dereferenceable(24) %"$this287.pointer", i64 24, i1 false)
  br label %else.185

else.183:                                         ; preds = %else.182
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d, ptr nonnull %call.54, ptr nonnull %tmpv.323)
  br label %else.185

else.185:                                         ; preds = %else.183, %then.183
  %.field.ld.60 = load ptr, ptr %call.54, align 8
  %field.290 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.60, i64 0, i32 1
  %.field.ld.61 = load ptr, ptr %field.290, align 8
  %field.291 = getelementptr inbounds i8, ptr %call.54, i64 8
  %.field.ld.62 = load ptr, ptr %field.291, align 8
  %call.53 = call { ptr, ptr } %.field.ld.61(ptr nest undef, ptr %.field.ld.62)
  ret { ptr, ptr } %call.53
}

define void @go_0llvm.NonWriter.Hijack..stub(ptr nest nocapture readnone %nest.56, ptr readonly %"$this288.pointer") #0 {
entry:
  %tmpv.329 = alloca %NonWriter.0, align 8, !go_addrtaken !3
  %call.55 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d)
  %icmp.220 = icmp eq ptr %"$this288.pointer", null
  br i1 %icmp.220, label %then.186, label %else.186, !make.implicit !3

then.186:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.186:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.329, ptr noundef nonnull align 8 dereferenceable(24) %"$this288.pointer", i64 24, i1 false)
  %deref.ld.21 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.221 = icmp eq i32 %deref.ld.21, 0
  br i1 %icmp.221, label %then.187, label %else.187

then.187:                                         ; preds = %else.186
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.55, ptr noundef nonnull align 8 dereferenceable(24) %"$this288.pointer", i64 24, i1 false)
  br label %else.189

else.187:                                         ; preds = %else.186
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d, ptr nonnull %call.55, ptr nonnull %tmpv.329)
  br label %else.189

else.189:                                         ; preds = %else.187, %then.187
  %.field.ld.63 = load ptr, ptr %call.55, align 8
  %field.294 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.63, i64 0, i32 2
  %.field.ld.64 = load ptr, ptr %field.294, align 8
  %field.295 = getelementptr inbounds i8, ptr %call.55, i64 8
  %.field.ld.65 = load ptr, ptr %field.295, align 8
  call void %.field.ld.64(ptr nest undef, ptr %.field.ld.65)
  ret void
}

define { ptr, ptr } @go_0llvm.NonWriter.LocalAddr..stub(ptr nest nocapture readnone %nest.57, ptr readonly %"$this289.pointer") #0 {
entry:
  %tmpv.336 = alloca %NonWriter.0, align 8, !go_addrtaken !3
  %call.57 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d)
  %icmp.224 = icmp eq ptr %"$this289.pointer", null
  br i1 %icmp.224, label %then.190, label %else.190, !make.implicit !3

then.190:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.190:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.336, ptr noundef nonnull align 8 dereferenceable(24) %"$this289.pointer", i64 24, i1 false)
  %deref.ld.22 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.225 = icmp eq i32 %deref.ld.22, 0
  br i1 %icmp.225, label %then.191, label %else.191

then.191:                                         ; preds = %else.190
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.57, ptr noundef nonnull align 8 dereferenceable(24) %"$this289.pointer", i64 24, i1 false)
  br label %else.193

else.191:                                         ; preds = %else.190
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d, ptr nonnull %call.57, ptr nonnull %tmpv.336)
  br label %else.193

else.193:                                         ; preds = %else.191, %then.191
  %.field.ld.66 = load ptr, ptr %call.57, align 8
  %field.298 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.66, i64 0, i32 3
  %.field.ld.67 = load ptr, ptr %field.298, align 8
  %field.299 = getelementptr inbounds i8, ptr %call.57, i64 8
  %.field.ld.68 = load ptr, ptr %field.299, align 8
  %call.56 = call { ptr, ptr } %.field.ld.67(ptr nest undef, ptr %.field.ld.68)
  ret { ptr, ptr } %call.56
}

define { ptr, ptr } @go_0llvm.NonWriter.RemoteAddr..stub(ptr nest nocapture readnone %nest.58, ptr readonly %"$this290.pointer") #0 {
entry:
  %tmpv.343 = alloca %NonWriter.0, align 8, !go_addrtaken !3
  %call.59 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d)
  %icmp.228 = icmp eq ptr %"$this290.pointer", null
  br i1 %icmp.228, label %then.194, label %else.194, !make.implicit !3

then.194:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.194:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.343, ptr noundef nonnull align 8 dereferenceable(24) %"$this290.pointer", i64 24, i1 false)
  %deref.ld.23 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.229 = icmp eq i32 %deref.ld.23, 0
  br i1 %icmp.229, label %then.195, label %else.195

then.195:                                         ; preds = %else.194
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.59, ptr noundef nonnull align 8 dereferenceable(24) %"$this290.pointer", i64 24, i1 false)
  br label %else.197

else.195:                                         ; preds = %else.194
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d, ptr nonnull %call.59, ptr nonnull %tmpv.343)
  br label %else.197

else.197:                                         ; preds = %else.195, %then.195
  %.field.ld.69 = load ptr, ptr %call.59, align 8
  %field.302 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.69, i64 0, i32 4
  %.field.ld.70 = load ptr, ptr %field.302, align 8
  %field.303 = getelementptr inbounds i8, ptr %call.59, i64 8
  %.field.ld.71 = load ptr, ptr %field.303, align 8
  %call.58 = call { ptr, ptr } %.field.ld.70(ptr nest undef, ptr %.field.ld.71)
  ret { ptr, ptr } %call.58
}

define { ptr, ptr } @go_0llvm.NonWriter.TsigStatus..stub(ptr nest nocapture readnone %nest.59, ptr readonly %"$this291.pointer") #0 {
entry:
  %tmpv.350 = alloca %NonWriter.0, align 8, !go_addrtaken !3
  %call.61 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d)
  %icmp.232 = icmp eq ptr %"$this291.pointer", null
  br i1 %icmp.232, label %then.198, label %else.198, !make.implicit !3

then.198:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.198:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.350, ptr noundef nonnull align 8 dereferenceable(24) %"$this291.pointer", i64 24, i1 false)
  %deref.ld.24 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.233 = icmp eq i32 %deref.ld.24, 0
  br i1 %icmp.233, label %then.199, label %else.199

then.199:                                         ; preds = %else.198
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.61, ptr noundef nonnull align 8 dereferenceable(24) %"$this291.pointer", i64 24, i1 false)
  br label %else.201

else.199:                                         ; preds = %else.198
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d, ptr nonnull %call.61, ptr nonnull %tmpv.350)
  br label %else.201

else.201:                                         ; preds = %else.199, %then.199
  %.field.ld.72 = load ptr, ptr %call.61, align 8
  %field.306 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.72, i64 0, i32 5
  %.field.ld.73 = load ptr, ptr %field.306, align 8
  %field.307 = getelementptr inbounds i8, ptr %call.61, i64 8
  %.field.ld.74 = load ptr, ptr %field.307, align 8
  %call.60 = call { ptr, ptr } %.field.ld.73(ptr nest undef, ptr %.field.ld.74)
  ret { ptr, ptr } %call.60
}

define void @go_0llvm.NonWriter.TsigTimersOnly..stub(ptr nest nocapture readnone %nest.60, ptr readonly %"$this292.pointer", i8 zeroext %"$p293") #0 {
entry:
  %tmpv.356 = alloca %NonWriter.0, align 8, !go_addrtaken !3
  %call.62 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d)
  %icmp.236 = icmp eq ptr %"$this292.pointer", null
  br i1 %icmp.236, label %then.202, label %else.202, !make.implicit !3

then.202:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.202:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.356, ptr noundef nonnull align 8 dereferenceable(24) %"$this292.pointer", i64 24, i1 false)
  %deref.ld.25 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.237 = icmp eq i32 %deref.ld.25, 0
  br i1 %icmp.237, label %then.203, label %else.203

then.203:                                         ; preds = %else.202
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.62, ptr noundef nonnull align 8 dereferenceable(24) %"$this292.pointer", i64 24, i1 false)
  br label %else.205

else.203:                                         ; preds = %else.202
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d, ptr nonnull %call.62, ptr nonnull %tmpv.356)
  br label %else.205

else.205:                                         ; preds = %else.203, %then.203
  %.field.ld.75 = load ptr, ptr %call.62, align 8
  %field.310 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.75, i64 0, i32 6
  %.field.ld.76 = load ptr, ptr %field.310, align 8
  %field.311 = getelementptr inbounds i8, ptr %call.62, i64 8
  %.field.ld.77 = load ptr, ptr %field.311, align 8
  call void %.field.ld.76(ptr nest undef, ptr %.field.ld.77, i8 zeroext %"$p293")
  ret void
}

define void @go_0llvm.NonWriter.Write..stub(ptr nocapture writeonly sret({ i64, %error.0 }) %sret.formal.3, ptr nest nocapture readnone %nest.61, ptr readonly %"$this294.pointer", ptr byval({ ptr, i64, i64 }) %"$p295") #0 {
entry:
  %sret.actual.22 = alloca { i64, %error.0 }, align 8
  %tmpv.367 = alloca %NonWriter.0, align 8, !go_addrtaken !3
  %call.63 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d)
  %icmp.240 = icmp eq ptr %"$this294.pointer", null
  br i1 %icmp.240, label %then.206, label %else.206, !make.implicit !3

then.206:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.206:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.367, ptr noundef nonnull align 8 dereferenceable(24) %"$this294.pointer", i64 24, i1 false)
  %deref.ld.26 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.241 = icmp eq i32 %deref.ld.26, 0
  br i1 %icmp.241, label %then.207, label %else.207

then.207:                                         ; preds = %else.206
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.63, ptr noundef nonnull align 8 dereferenceable(24) %"$this294.pointer", i64 24, i1 false)
  br label %fallthrough.207

fallthrough.207:                                  ; preds = %else.207, %then.207
  %.field.ld.78 = load ptr, ptr %call.63, align 8
  %field.314 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.78, i64 0, i32 7
  %.field.ld.79 = load ptr, ptr %field.314, align 8
  %field.315 = getelementptr inbounds i8, ptr %call.63, i64 8
  %.field.ld.80 = load ptr, ptr %field.315, align 8
  call void %.field.ld.79(ptr nonnull %sret.actual.22, ptr nest undef, ptr %.field.ld.80, ptr nonnull byval({ ptr, i64, i64 }) %"$p295")
  %tmpv.358.sroa.0.0.copyload = load i64, ptr %sret.actual.22, align 8
  %tmpv.358.sroa.2.0.cast.1743.sroa_idx = getelementptr inbounds { i64, %error.0 }, ptr %sret.actual.22, i64 0, i32 1
  %tmp.18.sroa.2.0.cast.1752.sroa_idx = getelementptr inbounds { i64, %error.0 }, ptr %sret.formal.3, i64 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %tmp.18.sroa.2.0.cast.1752.sroa_idx, ptr noundef nonnull align 8 dereferenceable(16) %tmpv.358.sroa.2.0.cast.1743.sroa_idx, i64 16, i1 false)
  store i64 %tmpv.358.sroa.0.0.copyload, ptr %sret.formal.3, align 8
  ret void

else.207:                                         ; preds = %else.206
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d, ptr nonnull %call.63, ptr nonnull %tmpv.367)
  br label %fallthrough.207
}

define { ptr, ptr } @go_0llvm.NonWriter.WriteMsg..stub(ptr nest nocapture readnone %nest.62, ptr readonly %"$this296.pointer", ptr %"$p297") #0 {
entry:
  %tmpv.374 = alloca %NonWriter.0, align 8, !go_addrtaken !3
  %call.65 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d)
  %icmp.244 = icmp eq ptr %"$this296.pointer", null
  br i1 %icmp.244, label %then.210, label %else.210, !make.implicit !3

then.210:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.210:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.374, ptr noundef nonnull align 8 dereferenceable(24) %"$this296.pointer", i64 24, i1 false)
  %deref.ld.27 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.245 = icmp eq i32 %deref.ld.27, 0
  br i1 %icmp.245, label %then.211, label %else.211

then.211:                                         ; preds = %else.210
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.65, ptr noundef nonnull align 8 dereferenceable(24) %"$this296.pointer", i64 24, i1 false)
  br label %else.213

else.211:                                         ; preds = %else.210
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d, ptr nonnull %call.65, ptr nonnull %tmpv.374)
  br label %else.213

else.213:                                         ; preds = %else.211, %then.211
  %.field.ld.81 = load ptr, ptr %call.65, align 8
  %field.322 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.81, i64 0, i32 8
  %.field.ld.82 = load ptr, ptr %field.322, align 8
  %field.323 = getelementptr inbounds i8, ptr %call.65, i64 8
  %.field.ld.83 = load ptr, ptr %field.323, align 8
  %call.64 = call { ptr, ptr } %.field.ld.82(ptr nest undef, ptr %.field.ld.83, ptr %"$p297")
  ret { ptr, ptr } %call.64
}

define i64 @go_0llvm.Less(ptr nest nocapture readnone %nest.13, ptr %a, ptr %name.chunk0, i64 %name.chunk1) #0 {
entry:
  %bb8.i = alloca { ptr, i64, i64 }, align 8
  %ab7.i = alloca { ptr, i64, i64 }, align 8
  %ab.i = alloca { ptr, i64, i64 }, align 8
  %bb.i = alloca { ptr, i64, i64 }, align 8
  %tmpv.1823.i = alloca [32 x i8], align 1
  %sret.actual.5.i = alloca { ptr, i64, i64 }, align 8
  %tmpv.1856.i = alloca [32 x i8], align 1
  %sret.actual.6.i = alloca { ptr, i64, i64 }, align 8
  %call.8 = call { ptr, i64 } @go_0llvm.Elem.Name(ptr nest poison, ptr %a)
  %call.8.fca.0.extract = extractvalue { ptr, i64 } %call.8, 0
  %call.8.fca.1.extract = extractvalue { ptr, i64 } %call.8, 1
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %tmpv.1823.i)
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %sret.actual.5.i)
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %tmpv.1856.i)
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %sret.actual.6.i)
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %ab.i)
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %bb.i)
  %call.2740.i = call { i64, i8 } @go_0llvm.PrevLabel(ptr nest undef, ptr %name.chunk0, i64 %name.chunk1, i64 1)
  %call.27.fca.1.extract42.i = extractvalue { i64, i8 } %call.2740.i, 1
  %call.2843.i = call { i64, i8 } @go_0llvm.PrevLabel(ptr nest undef, ptr %call.8.fca.0.extract, i64 %call.8.fca.1.extract, i64 1)
  %0 = and i8 %call.27.fca.1.extract42.i, 1
  %trunc.108.not45.i = icmp eq i8 %0, 0
  %call.28.fca.1.extract46.i = extractvalue { i64, i8 } %call.2843.i, 1
  %spec.select47.i = select i1 %trunc.108.not45.i, i8 %call.27.fca.1.extract42.i, i8 %call.28.fca.1.extract46.i
  %1 = and i8 %spec.select47.i, 1
  %trunc.109.not48.i = icmp eq i8 %1, 0
  br i1 %trunc.109.not48.i, label %else.106.i, label %then.106.i

then.106.i:                                       ; preds = %else.113.i, %entry
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %ab.i)
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %bb.i)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %tmpv.1823.i)
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %sret.actual.5.i)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %tmpv.1856.i)
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %sret.actual.6.i)
  br label %go_0llvm.less.exit

else.106.i:                                       ; preds = %entry, %else.113.i
  %call.2854.i = phi { i64, i8 } [ %call.28.i, %else.113.i ], [ %call.2843.i, %entry ]
  %call.2752.i = phi { i64, i8 } [ %call.27.i, %else.113.i ], [ %call.2740.i, %entry ]
  %i.051.i = phi i64 [ %add.1.i, %else.113.i ], [ 1, %entry ]
  %aj.050.i = phi i64 [ %call.27.fca.0.extract53.i, %else.113.i ], [ %name.chunk1, %entry ]
  %bj.049.i = phi i64 [ %call.28.fca.0.extract55.i, %else.113.i ], [ %call.8.fca.1.extract, %entry ]
  %call.27.fca.0.extract53.i = extractvalue { i64, i8 } %call.2752.i, 0
  %call.28.fca.0.extract55.i = extractvalue { i64, i8 } %call.2854.i, 0
  %.not1.i = icmp sgt i64 %aj.050.i, -1
  %icmp.127.i = icmp sle i64 %aj.050.i, %name.chunk1
  %iand.4.i = and i1 %.not1.i, %icmp.127.i
  br i1 %iand.4.i, label %fallthrough.107.i, label %else.107.i

fallthrough.107.i:                                ; preds = %else.106.i
  %.not2.i = icmp sgt i64 %call.27.fca.0.extract53.i, -1
  %icmp.129.i = icmp sge i64 %aj.050.i, %call.27.fca.0.extract53.i
  %iand.5.i = and i1 %.not2.i, %icmp.129.i
  br i1 %iand.5.i, label %fallthrough.108.i, label %else.108.i

else.107.i:                                       ; preds = %else.106.i
  call void @runtime.goPanicSliceAlen(ptr nest undef, i64 %aj.050.i, i64 %name.chunk1)
  unreachable

fallthrough.108.i:                                ; preds = %fallthrough.107.i
  %sub.0.i = sub nsw i64 %aj.050.i, %call.27.fca.0.extract53.i
  %icmp.130.i = icmp eq i64 %aj.050.i, %call.27.fca.0.extract53.i
  %.call.27.fca.0.extract.i = select i1 %icmp.130.i, i64 0, i64 %call.27.fca.0.extract53.i
  %ptroff.4.i = getelementptr i8, ptr %name.chunk0, i64 %.call.27.fca.0.extract.i
  call void @runtime.stringtoslicebyte(ptr nonnull %sret.actual.5.i, ptr nest undef, ptr nonnull %tmpv.1823.i, ptr %ptroff.4.i, i64 %sub.0.i)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %ab.i, ptr noundef nonnull align 8 dereferenceable(24) %sret.actual.5.i, i64 24, i1 false)
  %.not4.i = icmp sgt i64 %bj.049.i, -1
  %icmp.132.i = icmp sle i64 %bj.049.i, %call.8.fca.1.extract
  %iand.6.i = and i1 %.not4.i, %icmp.132.i
  br i1 %iand.6.i, label %fallthrough.110.i, label %else.110.i

else.108.i:                                       ; preds = %fallthrough.107.i
  %call.27.fca.0.extract53.i.le = extractvalue { i64, i8 } %call.2752.i, 0
  call void @runtime.goPanicSliceB(ptr nest undef, i64 %call.27.fca.0.extract53.i.le, i64 %aj.050.i)
  unreachable

fallthrough.110.i:                                ; preds = %fallthrough.108.i
  %.not5.i = icmp sgt i64 %call.28.fca.0.extract55.i, -1
  %icmp.134.i = icmp sge i64 %bj.049.i, %call.28.fca.0.extract55.i
  %iand.7.i = and i1 %.not5.i, %icmp.134.i
  br i1 %iand.7.i, label %fallthrough.111.i, label %else.111.i

else.110.i:                                       ; preds = %fallthrough.108.i
  call void @runtime.goPanicSliceAlen(ptr nest undef, i64 %bj.049.i, i64 %call.8.fca.1.extract)
  unreachable

fallthrough.111.i:                                ; preds = %fallthrough.110.i
  %sub.2.i = sub nsw i64 %bj.049.i, %call.28.fca.0.extract55.i
  %icmp.135.i = icmp eq i64 %bj.049.i, %call.28.fca.0.extract55.i
  %.call.28.fca.0.extract.i = select i1 %icmp.135.i, i64 0, i64 %call.28.fca.0.extract55.i
  %ptroff.5.i = getelementptr i8, ptr %call.8.fca.0.extract, i64 %.call.28.fca.0.extract.i
  call void @runtime.stringtoslicebyte(ptr nonnull %sret.actual.6.i, ptr nest undef, ptr nonnull %tmpv.1856.i, ptr %ptroff.5.i, i64 %sub.2.i)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %bb.i, ptr noundef nonnull align 8 dereferenceable(24) %sret.actual.6.i, i64 24, i1 false)
  call fastcc void @go_0llvm.doDDD(ptr nonnull byval({ ptr, i64, i64 }) %ab.i)
  call fastcc void @go_0llvm.doDDD(ptr nonnull byval({ ptr, i64, i64 }) %bb.i)
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %ab7.i)
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %bb8.i)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %bb8.i, ptr noundef nonnull align 8 dereferenceable(24) %bb.i, i64 24, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %ab7.i, ptr noundef nonnull align 8 dereferenceable(24) %ab.i, i64 24, i1 false)
  %call.107.i.i = call i64 @internal_1bytealg.Compare(ptr nest undef, ptr nonnull byval({ ptr, i64, i64 }) %ab7.i, ptr nonnull byval({ ptr, i64, i64 }) %bb8.i)
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %ab7.i)
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %bb8.i)
  %icmp.136.not.i = icmp eq i64 %call.107.i.i, 0
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %ab.i)
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %bb.i)
  br i1 %icmp.136.not.i, label %else.113.i, label %then.113.i

else.111.i:                                       ; preds = %fallthrough.110.i
  %call.28.fca.0.extract55.i.le = extractvalue { i64, i8 } %call.2854.i, 0
  call void @runtime.goPanicSliceB(ptr nest undef, i64 %call.28.fca.0.extract55.i.le, i64 %bj.049.i)
  unreachable

then.113.i:                                       ; preds = %fallthrough.111.i
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %tmpv.1823.i)
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %sret.actual.5.i)
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %tmpv.1856.i)
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %sret.actual.6.i)
  br label %go_0llvm.less.exit

else.113.i:                                       ; preds = %fallthrough.111.i
  %add.1.i = add i64 %i.051.i, 1
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %ab.i)
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %bb.i)
  %call.27.i = call { i64, i8 } @go_0llvm.PrevLabel(ptr nest undef, ptr %name.chunk0, i64 %name.chunk1, i64 %add.1.i)
  %call.27.fca.1.extract.i = extractvalue { i64, i8 } %call.27.i, 1
  %call.28.i = call { i64, i8 } @go_0llvm.PrevLabel(ptr nest undef, ptr %call.8.fca.0.extract, i64 %call.8.fca.1.extract, i64 %add.1.i)
  %2 = and i8 %call.27.fca.1.extract.i, 1
  %trunc.108.not.i = icmp eq i8 %2, 0
  %call.28.fca.1.extract.i = extractvalue { i64, i8 } %call.28.i, 1
  %spec.select.i = select i1 %trunc.108.not.i, i8 %call.27.fca.1.extract.i, i8 %call.28.fca.1.extract.i
  %3 = and i8 %spec.select.i, 1
  %trunc.109.not.i = icmp eq i8 %3, 0
  br i1 %trunc.109.not.i, label %else.106.i, label %then.106.i

go_0llvm.less.exit:                               ; preds = %then.113.i, %then.106.i
  %call.93 = phi i64 [ 0, %then.106.i ], [ %call.107.i.i, %then.113.i ]
  ret i64 %call.93
}

declare void @runtime.mapiterinit(ptr, ptr, ptr, ptr) local_unnamed_addr #0

; Function Attrs: noreturn
declare void @runtime.goPanicIndex(ptr, i64, i64) local_unnamed_addr #2

; Function Attrs: nofree memory(read)
declare nonnull ptr @runtime.mapaccess1(ptr, ptr, ptr, ptr) local_unnamed_addr #4

declare noalias nonnull ptr @runtime.makeslice(ptr, ptr, i64, i64) local_unnamed_addr #0

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define void @go_0llvm.go_0llvm..init0(ptr nest nocapture %nest.18) #5 {
entry:
  ret void
}

; Function Attrs: noreturn
declare void @runtime.goPanicSliceAlen(ptr, i64, i64) local_unnamed_addr #2

; Function Attrs: noreturn
declare void @runtime.goPanicSliceB(ptr, i64, i64) local_unnamed_addr #2

declare void @runtime.stringtoslicebyte(ptr, ptr, ptr, ptr, i64) local_unnamed_addr #0

define internal fastcc void @go_0llvm.doDDD(ptr nocapture readonly byval({ ptr, i64, i64 }) %b) unnamed_addr #0 {
entry:
  %field.184 = getelementptr inbounds { ptr, i64, i64 }, ptr %b, i64 0, i32 1
  %b.field.ld.3 = load i64, ptr %field.184, align 8
  %field.198 = getelementptr inbounds { ptr, i64, i64 }, ptr %b, i64 0, i32 2
  %icmp.15764 = icmp sgt i64 %b.field.ld.3, 0
  br i1 %icmp.15764, label %then.129, label %else.129

then.114:                                         ; preds = %then.129
  %icmp.139 = icmp sgt i64 %b.field.ld.3, %i.065
  br i1 %icmp.139, label %fallthrough.115, label %else.115

fallthrough.115:                                  ; preds = %then.114
  %b.field.ld.6 = load ptr, ptr %b, align 8
  %ptroff.6 = getelementptr i8, ptr %b.field.ld.6, i64 %i.065
  %.ptroff.ld.0 = load i8, ptr %ptroff.6, align 1
  %icmp.140 = icmp eq i8 %.ptroff.ld.0, 92
  br i1 %icmp.140, label %then.116, label %fallthrough.122

else.115:                                         ; preds = %then.114
  call void @runtime.goPanicIndex(ptr nest undef, i64 %i.065, i64 %b.field.ld.3)
  unreachable

then.116:                                         ; preds = %fallthrough.115
  %add.3 = add nuw nsw i64 %i.065, 1
  %icmp.142 = icmp slt i64 %add.3, %b.field.ld.3
  br i1 %icmp.142, label %fallthrough.117, label %else.117

fallthrough.117:                                  ; preds = %then.116
  %ptroff.7 = getelementptr i8, ptr %b.field.ld.6, i64 %add.3
  %.ptroff.ld.1 = load i8, ptr %ptroff.7, align 1
  %b.off.i = add i8 %.ptroff.ld.1, -48
  %0 = icmp ult i8 %b.off.i, 10
  br i1 %0, label %then.118, label %fallthrough.122

else.117:                                         ; preds = %then.116
  call void @runtime.goPanicIndex(ptr nest undef, i64 %add.3, i64 %b.field.ld.3)
  unreachable

then.118:                                         ; preds = %fallthrough.117
  %add.4 = add nuw i64 %i.065, 2
  %.not8 = icmp sgt i64 %add.4, -1
  %icmp.144 = icmp slt i64 %add.4, %b.field.ld.3
  %iand.10 = and i1 %.not8, %icmp.144
  br i1 %iand.10, label %fallthrough.119, label %else.119

fallthrough.119:                                  ; preds = %then.118
  %ptroff.8 = getelementptr i8, ptr %b.field.ld.6, i64 %add.4
  %.ptroff.ld.2 = load i8, ptr %ptroff.8, align 1
  %b.off.i15 = add i8 %.ptroff.ld.2, -48
  %1 = icmp ult i8 %b.off.i15, 10
  br i1 %1, label %then.120, label %fallthrough.122

else.119:                                         ; preds = %then.118
  call void @runtime.goPanicIndex(ptr nest undef, i64 %add.4, i64 %b.field.ld.3)
  unreachable

then.120:                                         ; preds = %fallthrough.119
  %.not6 = icmp sgt i64 %add.2, -1
  %icmp.146 = icmp slt i64 %add.2, %b.field.ld.3
  %iand.11 = and i1 %.not6, %icmp.146
  br i1 %iand.11, label %fallthrough.121, label %else.121

fallthrough.121:                                  ; preds = %then.120
  %ptroff.9 = getelementptr i8, ptr %b.field.ld.6, i64 %add.2
  %.ptroff.ld.3 = load i8, ptr %ptroff.9, align 1
  %b.off.i17 = add i8 %.ptroff.ld.3, -48
  %2 = icmp ult i8 %b.off.i17, 10
  br i1 %2, label %then.122, label %fallthrough.122

else.121:                                         ; preds = %then.120
  call void @runtime.goPanicIndex(ptr nest undef, i64 %add.2, i64 %b.field.ld.3)
  unreachable

then.122:                                         ; preds = %fallthrough.121
  %b.field.ld.17 = load i64, ptr %field.198, align 8
  %icmp.148.not = icmp slt i64 %b.field.ld.17, %i.065
  br i1 %icmp.148.not, label %else.123, label %fallthrough.123

fallthrough.122:                                  ; preds = %fallthrough.127, %fallthrough.119, %fallthrough.115, %then.129, %fallthrough.117, %fallthrough.125, %fallthrough.121
  %lb.1 = phi i64 [ %lb.068, %fallthrough.121 ], [ %sub.7, %fallthrough.125 ], [ %lb.068, %fallthrough.117 ], [ %lb.068, %then.129 ], [ %lb.068, %fallthrough.115 ], [ %lb.068, %fallthrough.119 ], [ %sub.7, %fallthrough.127 ]
  %add.9 = add nuw nsw i64 %i.065, 1
  %icmp.157 = icmp slt i64 %add.9, %lb.1
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  br i1 %icmp.157, label %then.129, label %else.129

fallthrough.123:                                  ; preds = %then.122
  %icmp.149 = icmp eq i64 %b.field.ld.17, %i.065
  %.i.0 = select i1 %icmp.149, i64 0, i64 %i.065
  %ptroff.10 = getelementptr i8, ptr %b.field.ld.6, i64 %.i.0
  %sub.5 = sub i64 %b.field.ld.3, %i.065
  %icmp.161.i = icmp sgt i64 %sub.5, 1
  br i1 %icmp.161.i, label %fallthrough.131.i, label %else.131.i

fallthrough.131.i:                                ; preds = %fallthrough.123
  %icmp.163.not.i = icmp eq i64 %sub.5, 2
  br i1 %icmp.163.not.i, label %else.132.i, label %fallthrough.132.i

else.131.i:                                       ; preds = %fallthrough.123
  call void @runtime.goPanicIndex(ptr nest undef, i64 1, i64 %sub.5)
  unreachable

fallthrough.132.i:                                ; preds = %fallthrough.131.i
  %icmp.165.i = icmp ugt i64 %sub.5, 3
  br i1 %icmp.165.i, label %fallthrough.125, label %else.133.i

else.132.i:                                       ; preds = %fallthrough.131.i
  call void @runtime.goPanicIndex(ptr nest undef, i64 2, i64 2)
  unreachable

else.133.i:                                       ; preds = %fallthrough.132.i
  call void @runtime.goPanicIndex(ptr nest undef, i64 3, i64 3)
  unreachable

else.123:                                         ; preds = %then.122
  call void @runtime.goPanicSliceB(ptr nest undef, i64 %i.065, i64 %b.field.ld.17)
  unreachable

fallthrough.125:                                  ; preds = %fallthrough.132.i
  %ptroff.14.i = getelementptr i8, ptr %ptroff.10, i64 1
  %.ptroff.ld.5.i = load i8, ptr %ptroff.14.i, align 1
  %3 = mul i8 %.ptroff.ld.5.i, 100
  %mul.1.i = add i8 %3, 48
  %ptroff.15.i = getelementptr i8, ptr %ptroff.10, i64 2
  %.ptroff.ld.6.i = load i8, ptr %ptroff.15.i, align 1
  %4 = mul i8 %.ptroff.ld.6.i, 10
  %sub.11.i = add i8 %mul.1.i, %4
  %ptroff.16.i = getelementptr i8, ptr %ptroff.10, i64 3
  %.ptroff.ld.7.i = load i8, ptr %ptroff.16.i, align 1
  %add.11.i = add i8 %sub.11.i, %.ptroff.ld.7.i
  store i8 %add.11.i, ptr %ptroff.6, align 1
  %sub.7 = add i64 %lb.068, -3
  %icmp.15661 = icmp slt i64 %add.3, %sub.7
  br i1 %icmp.15661, label %then.128.preheader, label %fallthrough.122

then.128.preheader:                               ; preds = %fallthrough.125
  %.not4 = icmp sgt i64 %indvars.iv, -1
  br label %then.128

fallthrough.126:                                  ; preds = %then.128
  %add.7 = add nuw i64 %j.0.in62, 4
  %icmp.155 = icmp slt i64 %add.7, %b.field.ld.3
  %iand.15 = and i1 %.not4, %icmp.155
  br i1 %iand.15, label %fallthrough.127, label %else.127

else.126:                                         ; preds = %then.128
  call void @runtime.goPanicIndex(ptr nest undef, i64 %b.field.ld.3, i64 %b.field.ld.3)
  unreachable

fallthrough.127:                                  ; preds = %fallthrough.126
  %ptroff.12 = getelementptr i8, ptr %b.field.ld.6, i64 %j.063
  %ptroff.13 = getelementptr i8, ptr %b.field.ld.6, i64 %add.7
  %.ptroff.ld.4 = load i8, ptr %ptroff.13, align 1
  store i8 %.ptroff.ld.4, ptr %ptroff.12, align 1
  %j.0 = add nuw nsw i64 %j.063, 1
  %exitcond.not = icmp eq i64 %j.0, %sub.7
  br i1 %exitcond.not, label %fallthrough.122, label %then.128

else.127:                                         ; preds = %fallthrough.126
  call void @runtime.goPanicIndex(ptr nest undef, i64 %add.7, i64 %b.field.ld.3)
  unreachable

then.128:                                         ; preds = %then.128.preheader, %fallthrough.127
  %j.063 = phi i64 [ %j.0, %fallthrough.127 ], [ %add.3, %then.128.preheader ]
  %j.0.in62 = phi i64 [ %j.063, %fallthrough.127 ], [ %i.065, %then.128.preheader ]
  %icmp.153 = icmp slt i64 %j.063, %b.field.ld.3
  br i1 %icmp.153, label %fallthrough.126, label %else.126

then.129:                                         ; preds = %entry, %fallthrough.122
  %indvars.iv = phi i64 [ %indvars.iv.next, %fallthrough.122 ], [ 4, %entry ]
  %lb.068 = phi i64 [ %lb.1, %fallthrough.122 ], [ %b.field.ld.3, %entry ]
  %i.065 = phi i64 [ %add.9, %fallthrough.122 ], [ 0, %entry ]
  %add.2 = add nuw i64 %i.065, 3
  %icmp.137 = icmp slt i64 %add.2, %lb.068
  br i1 %icmp.137, label %then.114, label %fallthrough.122

else.129:                                         ; preds = %fallthrough.122, %entry
  ret void
}

declare void @sync.RWMutex.Unlock(ptr, ptr) local_unnamed_addr #0

declare void @sync.RWMutex.Lock(ptr, ptr) local_unnamed_addr #0

declare void @sync.RWMutex.rUnlockSlow(ptr, ptr, i32) local_unnamed_addr #0

declare void @sync.RWMutex.RUnlock(ptr, ptr) local_unnamed_addr #0

declare void @sync.RWMutex.RLock(ptr, ptr) local_unnamed_addr #0

declare i8 @runtime.ifaceeq(ptr, ptr, ptr, ptr, ptr) local_unnamed_addr #0

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._63_7int32..eq(ptr nest nocapture readnone %nest.76, ptr readonly %key1, ptr readonly %key2) #6 {
entry:
  %call.90 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 12)
  ret i8 %call.90
}

; Function Attrs: nofree memory(argmem: read)
declare i8 @runtime.memequal(ptr, ptr, ptr, i64) local_unnamed_addr #7

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._632_7uint8..eq(ptr nest nocapture readnone %nest.77, ptr readonly %key1, ptr readonly %key2) #6 {
entry:
  %call.91 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 32)
  ret i8 %call.91
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._65_7uint8..eq(ptr nest nocapture readnone %nest.78, ptr readonly %key1, ptr readonly %key2) #6 {
entry:
  %call.92 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 5)
  ret i8 %call.92
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._628_7uint8..eq(ptr nest nocapture readnone %nest.79, ptr readonly %key1, ptr readonly %key2) #6 {
entry:
  %call.93 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 28)
  ret i8 %call.93
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._6255_7uint8..eq(ptr nest nocapture readnone %nest.80, ptr readonly %key1, ptr readonly %key2) #6 {
entry:
  %call.94 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 255)
  ret i8 %call.94
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._616_7uint8..eq(ptr nest nocapture readnone %nest.81, ptr readonly %key1, ptr readonly %key2) #6 {
entry:
  %call.95 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 16)
  ret i8 %call.95
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._64_7uint8..eq(ptr nest nocapture readnone %nest.82, ptr readonly %key1, ptr readonly %key2) #6 {
entry:
  %call.96 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 4)
  ret i8 %call.96
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._6127_7bool..eq(ptr nest nocapture readnone %nest.83, ptr readonly %key1, ptr readonly %key2) #6 {
entry:
  %call.97 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 127)
  ret i8 %call.97
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._6256_7bool..eq(ptr nest nocapture readnone %nest.84, ptr readonly %key1, ptr readonly %key2) #6 {
entry:
  %call.98 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 256)
  ret i8 %call.98
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._614_7int8..eq(ptr nest nocapture readnone %nest.85, ptr readonly %key1, ptr readonly %key2) #6 {
entry:
  %call.99 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 14)
  ret i8 %call.99
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._696_7int8..eq(ptr nest nocapture readnone %nest.86, ptr readonly %key1, ptr readonly %key2) #6 {
entry:
  %call.100 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 96)
  ret i8 %call.100
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._68_7uint8..eq(ptr nest nocapture readnone %nest.87, ptr readonly %key1, ptr readonly %key2) #6 {
entry:
  %call.101 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 8)
  ret i8 %call.101
}

define i8 @go_0llvm._65_7string..eq(ptr nest nocapture readnone %nest.88, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.523 = icmp eq ptr %key1, null
  br i1 %icmp.523, label %then.468, label %else.468, !make.implicit !3

then.468:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.468:                                         ; preds = %entry
  %icmp.524 = icmp eq ptr %key2, null
  %tmpv.677.sroa.0.0.copyload = load ptr, ptr %key1, align 8
  br i1 %icmp.524, label %then.469, label %else.469, !make.implicit !3

then.469:                                         ; preds = %else.468
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.469:                                         ; preds = %else.468
  %tmpv.677.sroa.3.0.cast.2082.sroa_idx3 = getelementptr i8, ptr %key1, i64 8
  %tmpv.677.sroa.3.0.copyload = load i64, ptr %tmpv.677.sroa.3.0.cast.2082.sroa_idx3, align 8
  %tmpv.679.sroa.0.0.copyload = load ptr, ptr %key2, align 8
  %tmpv.679.sroa.3.0.cast.2085.sroa_idx1 = getelementptr i8, ptr %key2, i64 8
  %tmpv.679.sroa.3.0.copyload = load i64, ptr %tmpv.679.sroa.3.0.cast.2085.sroa_idx1, align 8
  %icmp.525 = icmp eq i64 %tmpv.677.sroa.3.0.copyload, %tmpv.679.sroa.3.0.copyload
  br i1 %icmp.525, label %then.470, label %then.472

then.470:                                         ; preds = %else.469
  %icmp.526 = icmp eq ptr %tmpv.677.sroa.0.0.copyload, %tmpv.679.sroa.0.0.copyload
  br i1 %icmp.526, label %else.468.1, label %else.471

else.471:                                         ; preds = %then.470
  %bcmp = call i32 @bcmp(ptr %tmpv.677.sroa.0.0.copyload, ptr %tmpv.679.sroa.0.0.copyload, i64 %tmpv.677.sroa.3.0.copyload)
  %icmp.527 = icmp eq i32 %bcmp, 0
  br i1 %icmp.527, label %else.468.1, label %then.472

then.472:                                         ; preds = %else.471.4, %then.470.4, %else.468.4, %else.471.3, %else.468.3, %else.471.2, %else.468.2, %else.471.1, %else.468.1, %else.471, %else.469
  %merge = phi i8 [ 0, %else.468.3 ], [ 0, %else.468.2 ], [ 0, %else.468.1 ], [ 0, %else.471.3 ], [ 0, %else.471.2 ], [ 0, %else.471.1 ], [ 0, %else.471 ], [ 0, %else.469 ], [ 0, %else.468.4 ], [ %phi.cast, %else.471.4 ], [ 1, %then.470.4 ]
  ret i8 %merge

else.468.1:                                       ; preds = %then.470, %else.471
  %tmpv.677.sroa.0.0.cast.2082.sroa_idx.1 = getelementptr i8, ptr %key1, i64 16
  %tmpv.677.sroa.0.0.copyload.1 = load ptr, ptr %tmpv.677.sroa.0.0.cast.2082.sroa_idx.1, align 8
  %tmpv.677.sroa.3.0.cast.2082.sroa_idx3.1 = getelementptr i8, ptr %key1, i64 24
  %tmpv.677.sroa.3.0.copyload.1 = load i64, ptr %tmpv.677.sroa.3.0.cast.2082.sroa_idx3.1, align 8
  %tmpv.679.sroa.0.0.cast.2085.sroa_idx.1 = getelementptr i8, ptr %key2, i64 16
  %tmpv.679.sroa.0.0.copyload.1 = load ptr, ptr %tmpv.679.sroa.0.0.cast.2085.sroa_idx.1, align 8
  %tmpv.679.sroa.3.0.cast.2085.sroa_idx1.1 = getelementptr i8, ptr %key2, i64 24
  %tmpv.679.sroa.3.0.copyload.1 = load i64, ptr %tmpv.679.sroa.3.0.cast.2085.sroa_idx1.1, align 8
  %icmp.525.1 = icmp eq i64 %tmpv.677.sroa.3.0.copyload.1, %tmpv.679.sroa.3.0.copyload.1
  br i1 %icmp.525.1, label %then.470.1, label %then.472

then.470.1:                                       ; preds = %else.468.1
  %icmp.526.1 = icmp eq ptr %tmpv.677.sroa.0.0.copyload.1, %tmpv.679.sroa.0.0.copyload.1
  br i1 %icmp.526.1, label %else.468.2, label %else.471.1

else.471.1:                                       ; preds = %then.470.1
  %bcmp1 = call i32 @bcmp(ptr %tmpv.677.sroa.0.0.copyload.1, ptr %tmpv.679.sroa.0.0.copyload.1, i64 %tmpv.677.sroa.3.0.copyload.1)
  %icmp.527.1 = icmp eq i32 %bcmp1, 0
  br i1 %icmp.527.1, label %else.468.2, label %then.472

else.468.2:                                       ; preds = %then.470.1, %else.471.1
  %tmpv.677.sroa.0.0.cast.2082.sroa_idx.2 = getelementptr i8, ptr %key1, i64 32
  %tmpv.677.sroa.0.0.copyload.2 = load ptr, ptr %tmpv.677.sroa.0.0.cast.2082.sroa_idx.2, align 8
  %tmpv.677.sroa.3.0.cast.2082.sroa_idx3.2 = getelementptr i8, ptr %key1, i64 40
  %tmpv.677.sroa.3.0.copyload.2 = load i64, ptr %tmpv.677.sroa.3.0.cast.2082.sroa_idx3.2, align 8
  %tmpv.679.sroa.0.0.cast.2085.sroa_idx.2 = getelementptr i8, ptr %key2, i64 32
  %tmpv.679.sroa.0.0.copyload.2 = load ptr, ptr %tmpv.679.sroa.0.0.cast.2085.sroa_idx.2, align 8
  %tmpv.679.sroa.3.0.cast.2085.sroa_idx1.2 = getelementptr i8, ptr %key2, i64 40
  %tmpv.679.sroa.3.0.copyload.2 = load i64, ptr %tmpv.679.sroa.3.0.cast.2085.sroa_idx1.2, align 8
  %icmp.525.2 = icmp eq i64 %tmpv.677.sroa.3.0.copyload.2, %tmpv.679.sroa.3.0.copyload.2
  br i1 %icmp.525.2, label %then.470.2, label %then.472

then.470.2:                                       ; preds = %else.468.2
  %icmp.526.2 = icmp eq ptr %tmpv.677.sroa.0.0.copyload.2, %tmpv.679.sroa.0.0.copyload.2
  br i1 %icmp.526.2, label %else.468.3, label %else.471.2

else.471.2:                                       ; preds = %then.470.2
  %bcmp2 = call i32 @bcmp(ptr %tmpv.677.sroa.0.0.copyload.2, ptr %tmpv.679.sroa.0.0.copyload.2, i64 %tmpv.677.sroa.3.0.copyload.2)
  %icmp.527.2 = icmp eq i32 %bcmp2, 0
  br i1 %icmp.527.2, label %else.468.3, label %then.472

else.468.3:                                       ; preds = %then.470.2, %else.471.2
  %tmpv.677.sroa.0.0.cast.2082.sroa_idx.3 = getelementptr i8, ptr %key1, i64 48
  %tmpv.677.sroa.0.0.copyload.3 = load ptr, ptr %tmpv.677.sroa.0.0.cast.2082.sroa_idx.3, align 8
  %tmpv.677.sroa.3.0.cast.2082.sroa_idx3.3 = getelementptr i8, ptr %key1, i64 56
  %tmpv.677.sroa.3.0.copyload.3 = load i64, ptr %tmpv.677.sroa.3.0.cast.2082.sroa_idx3.3, align 8
  %tmpv.679.sroa.0.0.cast.2085.sroa_idx.3 = getelementptr i8, ptr %key2, i64 48
  %tmpv.679.sroa.0.0.copyload.3 = load ptr, ptr %tmpv.679.sroa.0.0.cast.2085.sroa_idx.3, align 8
  %tmpv.679.sroa.3.0.cast.2085.sroa_idx1.3 = getelementptr i8, ptr %key2, i64 56
  %tmpv.679.sroa.3.0.copyload.3 = load i64, ptr %tmpv.679.sroa.3.0.cast.2085.sroa_idx1.3, align 8
  %icmp.525.3 = icmp eq i64 %tmpv.677.sroa.3.0.copyload.3, %tmpv.679.sroa.3.0.copyload.3
  br i1 %icmp.525.3, label %then.470.3, label %then.472

then.470.3:                                       ; preds = %else.468.3
  %icmp.526.3 = icmp eq ptr %tmpv.677.sroa.0.0.copyload.3, %tmpv.679.sroa.0.0.copyload.3
  br i1 %icmp.526.3, label %else.468.4, label %else.471.3

else.471.3:                                       ; preds = %then.470.3
  %bcmp3 = call i32 @bcmp(ptr %tmpv.677.sroa.0.0.copyload.3, ptr %tmpv.679.sroa.0.0.copyload.3, i64 %tmpv.677.sroa.3.0.copyload.3)
  %icmp.527.3 = icmp eq i32 %bcmp3, 0
  br i1 %icmp.527.3, label %else.468.4, label %then.472

else.468.4:                                       ; preds = %then.470.3, %else.471.3
  %tmpv.677.sroa.0.0.cast.2082.sroa_idx.4 = getelementptr i8, ptr %key1, i64 64
  %tmpv.677.sroa.0.0.copyload.4 = load ptr, ptr %tmpv.677.sroa.0.0.cast.2082.sroa_idx.4, align 8
  %tmpv.677.sroa.3.0.cast.2082.sroa_idx3.4 = getelementptr i8, ptr %key1, i64 72
  %tmpv.677.sroa.3.0.copyload.4 = load i64, ptr %tmpv.677.sroa.3.0.cast.2082.sroa_idx3.4, align 8
  %tmpv.679.sroa.0.0.cast.2085.sroa_idx.4 = getelementptr i8, ptr %key2, i64 64
  %tmpv.679.sroa.0.0.copyload.4 = load ptr, ptr %tmpv.679.sroa.0.0.cast.2085.sroa_idx.4, align 8
  %tmpv.679.sroa.3.0.cast.2085.sroa_idx1.4 = getelementptr i8, ptr %key2, i64 72
  %tmpv.679.sroa.3.0.copyload.4 = load i64, ptr %tmpv.679.sroa.3.0.cast.2085.sroa_idx1.4, align 8
  %icmp.525.4 = icmp eq i64 %tmpv.677.sroa.3.0.copyload.4, %tmpv.679.sroa.3.0.copyload.4
  br i1 %icmp.525.4, label %then.470.4, label %then.472

then.470.4:                                       ; preds = %else.468.4
  %icmp.526.4 = icmp eq ptr %tmpv.677.sroa.0.0.copyload.4, %tmpv.679.sroa.0.0.copyload.4
  br i1 %icmp.526.4, label %then.472, label %else.471.4

else.471.4:                                       ; preds = %then.470.4
  %bcmp4 = call i32 @bcmp(ptr %tmpv.677.sroa.0.0.copyload.4, ptr %tmpv.679.sroa.0.0.copyload.4, i64 %tmpv.677.sroa.3.0.copyload.4)
  %icmp.527.4 = icmp eq i32 %bcmp4, 0
  %phi.cast = zext i1 %icmp.527.4 to i8
  br label %then.472
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._6128_7uint64..eq(ptr nest nocapture readnone %nest.89, ptr readonly %key1, ptr readonly %key2) #6 {
entry:
  %call.103 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 1024)
  ret i8 %call.103
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._665_7int8..eq(ptr nest nocapture readnone %nest.90, ptr readonly %key1, ptr readonly %key2) #6 {
entry:
  %call.104 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 65)
  ret i8 %call.104
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._613_7int32..eq(ptr nest nocapture readnone %nest.91, ptr readonly %key1, ptr readonly %key2) #6 {
entry:
  %call.105 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 52)
  ret i8 %call.105
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._6256_7uint8..eq(ptr nest nocapture readnone %nest.92, ptr readonly %key1, ptr readonly %key2) #6 {
entry:
  %call.106 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 256)
  ret i8 %call.106
}

declare i64 @internal_1bytealg.Compare(ptr, ptr, ptr) local_unnamed_addr #0

declare void @sync.rlocker.Lock(ptr, ptr) #0

declare void @sync.rlocker.Unlock(ptr, ptr) #0

declare void @runtime.registerGCRoots(ptr, ptr) local_unnamed_addr #0

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #8

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #9

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #9

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #10

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memmove.p0.p0.i64(ptr nocapture writeonly, ptr nocapture readonly, i64, i1 immarg) #8

; Function Attrs: nofree nounwind willreturn memory(argmem: read)
declare i32 @bcmp(ptr nocapture, ptr nocapture, i64) local_unnamed_addr #11