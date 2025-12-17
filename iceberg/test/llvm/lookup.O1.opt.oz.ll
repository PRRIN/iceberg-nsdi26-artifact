target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"

%StructType.0 = type { %_type.0, %IPST.43 }
%_type.0 = type { i64, i64, i32, i8, i8, i8, i8, ptr, ptr, ptr, ptr, ptr }
%IPST.43 = type { ptr, i64, i64 }
%functionDescriptor.0 = type { i64 }
%method.0 = type { ptr, ptr, ptr, ptr, ptr }
%uncommonType.0 = type { ptr, ptr, %IPST.41 }
%IPST.41 = type { ptr, i64, i64 }
%PtrType.0 = type { %_type.0, ptr }
%FuncType.0 = type { %_type.0, i8, %IPST.42, %IPST.42 }
%IPST.42 = type { ptr, i64, i64 }
%structField.0 = type { ptr, ptr, ptr, ptr, i64 }
%InterfaceType.0 = type { %_type.0, %IPST.44 }
%IPST.44 = type { ptr, i64, i64 }
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
%IPST.0 = type { ptr, i64, i64 }
%Zone.0 = type { { ptr, i64 }, i64, { ptr, i64 }, ptr, %Apex.0, i8, %RWMutex.0, %Once.0, %IPST.1, i64, ptr, ptr }
%Apex.0 = type { ptr, %IPST.0, %IPST.0, %IPST.0 }
%Once.0 = type { i32, %Mutex.0 }
%IPST.1 = type { ptr, i64, i64 }
%Request.0 = type { ptr, %ResponseWriter.0, { ptr, i64 }, i16, i8, i8, { ptr, i64 }, { ptr, i64 }, { ptr, i64 }, { ptr, i64 }, { ptr, i64 } }
%RR.0 = type { ptr, ptr }
%Msg.0 = type { %MsgHdr.0, i8, %IPST.2, %IPST.0, %IPST.0, %IPST.0 }
%MsgHdr.0 = type { i16, i8, i64, i8, i8, i8, i8, i8, i8, i8, i64 }
%IPST.2 = type { ptr, i64, i64 }
%NonWriter.0 = type { %ResponseWriter.0, ptr }

@go_0llvm.SOA..d = constant %StructType.0 { %_type.0 { i64 88, i64 56, i32 1879092663, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.SOA..eq..f, ptr @gcbits..rc, ptr @go..C1, ptr @go..C5, ptr @go_0llvm.SOA..p }, %IPST.43 { ptr @go..C73, i64 8, i64 8 } }
@go_0llvm.SOA..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.SOA..eq to i64) }
@gcbits..rc = weak constant [1 x i8] c"Q", comdat
@const.0 = private constant [18 x i8] c"\09go.llvm\09llvm.SOA\00", align 1
@go..C1 = internal constant { ptr, i64 } { ptr @const.0, i64 17 }
@const.1 = private constant [4 x i8] c"SOA\00", align 1
@go..C2 = internal constant { ptr, i64 } { ptr @const.1, i64 3 }
@const.2 = private constant [8 x i8] c"go.llvm\00", align 1
@go..C3 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C4 = internal constant [1 x %method.0] zeroinitializer
@go..C5 = internal constant %uncommonType.0 { ptr @go..C2, ptr @go..C3, %IPST.41 { ptr @go..C4, i64 0, i64 0 } }
@go_0llvm.SOA..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 711545, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C6, ptr @go..C61, ptr @type.._2_2go_0llvm_0SOA }, ptr @go_0llvm.SOA..d }, comdat
@runtime.memequal64..f = external constant %functionDescriptor.0
@gcbits..ba = weak constant [1 x i8] c"\01", comdat
@const.3 = private constant [19 x i8] c"*\09go.llvm\09llvm.SOA\00", align 1
@go..C6 = internal constant { ptr, i64 } { ptr @const.3, i64 18 }
@const.4 = private constant [7 x i8] c"Header\00", align 1
@go..C7 = internal constant { ptr, i64 } { ptr @const.4, i64 6 }
@type..func_8_9_8_2go_0llvm_0RR__Header_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -608253368, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C8, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C9, i64 0, i64 0 }, %IPST.42 { ptr @go..C38, i64 1, i64 1 } }, comdat
@const.5 = private constant [32 x i8] c"func() *\09go.llvm\09llvm.RR_Header\00", align 1
@go..C8 = internal constant { ptr, i64 } { ptr @const.5, i64 31 }
@go..C9 = internal constant [1 x ptr] zeroinitializer
@go_0llvm.RR__Header..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1553007831, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C10, ptr null, ptr null }, ptr @go_0llvm.RR__Header..d }, comdat
@const.6 = private constant [25 x i8] c"*\09go.llvm\09llvm.RR_Header\00", align 1
@go..C10 = internal constant { ptr, i64 } { ptr @const.6, i64 24 }
@go_0llvm.RR__Header..d = constant %StructType.0 { %_type.0 { i64 32, i64 8, i32 1245114290, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.RR__Header..eq..f, ptr @gcbits..ba, ptr @go..C11, ptr @go..C15, ptr @go_0llvm.RR__Header..p }, %IPST.43 { ptr @go..C37, i64 5, i64 5 } }
@go_0llvm.RR__Header..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.RR__Header..eq to i64) }
@const.7 = private constant [24 x i8] c"\09go.llvm\09llvm.RR_Header\00", align 1
@go..C11 = internal constant { ptr, i64 } { ptr @const.7, i64 23 }
@const.8 = private constant [10 x i8] c"RR_Header\00", align 1
@go..C12 = internal constant { ptr, i64 } { ptr @const.8, i64 9 }
@go..C13 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C14 = internal constant [1 x %method.0] zeroinitializer
@go..C15 = internal constant %uncommonType.0 { ptr @go..C12, ptr @go..C13, %IPST.41 { ptr @go..C14, i64 0, i64 0 } }
@const.9 = private constant [5 x i8] c"Name\00", align 1
@go..C16 = internal constant { ptr, i64 } { ptr @const.9, i64 4 }
@string..d = weak constant %_type.0 { i64 16, i64 8, i32 -1998952806, i8 0, i8 8, i8 8, i8 24, ptr @runtime.strequal..f, ptr @gcbits..ba, ptr @go..C17, ptr @go..C20, ptr @string..p }, comdat
@runtime.strequal..f = external constant %functionDescriptor.0
@const.10 = private constant [7 x i8] c"string\00", align 1
@go..C17 = internal constant { ptr, i64 } { ptr @const.10, i64 6 }
@go..C18 = internal constant { ptr, i64 } { ptr @const.10, i64 6 }
@go..C19 = internal constant [1 x %method.0] zeroinitializer
@go..C20 = internal constant %uncommonType.0 { ptr @go..C18, ptr null, %IPST.41 { ptr @go..C19, i64 0, i64 0 } }
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
@go..C27 = internal constant %uncommonType.0 { ptr @go..C25, ptr null, %IPST.41 { ptr @go..C26, i64 0, i64 0 } }
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
@go..C34 = internal constant %uncommonType.0 { ptr @go..C32, ptr null, %IPST.41 { ptr @go..C33, i64 0, i64 0 } }
@uint32..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 158759209, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C35, ptr null, ptr null }, ptr @uint32..d }, comdat
@const.19 = private constant [8 x i8] c"*uint32\00", align 1
@go..C35 = internal constant { ptr, i64 } { ptr @const.19, i64 7 }
@const.20 = private constant [9 x i8] c"Rdlength\00", align 1
@go..C36 = internal constant { ptr, i64 } { ptr @const.20, i64 8 }
@go..C37 = internal constant [5 x %structField.0] [%structField.0 { ptr @go..C16, ptr null, ptr @string..d, ptr @go..C22, i64 0 }, %structField.0 { ptr @go..C23, ptr null, ptr @uint16..d, ptr null, i64 32 }, %structField.0 { ptr @go..C29, ptr null, ptr @uint16..d, ptr null, i64 36 }, %structField.0 { ptr @go..C30, ptr null, ptr @uint32..d, ptr null, i64 40 }, %structField.0 { ptr @go..C36, ptr null, ptr @uint16..d, ptr null, i64 48 }]
@go..C38 = internal constant [1 x ptr] [ptr @go_0llvm.RR__Header..p]
@type..func_8_2go_0llvm_0SOA_9_8_2go_0llvm_0RR__Header_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -585483928, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C39, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C40, i64 1, i64 1 }, %IPST.42 { ptr @go..C41, i64 1, i64 1 } }, comdat
@const.21 = private constant [50 x i8] c"func(*\09go.llvm\09llvm.SOA) *\09go.llvm\09llvm.RR_Header\00", align 1
@go..C39 = internal constant { ptr, i64 } { ptr @const.21, i64 49 }
@go..C40 = internal constant [1 x ptr] [ptr @go_0llvm.SOA..p]
@go..C41 = internal constant [1 x ptr] [ptr @go_0llvm.RR__Header..p]
@const.22 = private constant [5 x i8] c"copy\00", align 1
@go..C42 = internal constant { ptr, i64 } { ptr @const.22, i64 4 }
@go..C43 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8_9_8go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1372692616, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C44, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C45, i64 0, i64 0 }, %IPST.42 { ptr @go..C56, i64 1, i64 1 } }, comdat
@const.23 = private constant [24 x i8] c"func() \09go.llvm\09llvm.RR\00", align 1
@go..C44 = internal constant { ptr, i64 } { ptr @const.23, i64 23 }
@go..C45 = internal constant [1 x ptr] zeroinitializer
@go_0llvm.RR..d = constant %InterfaceType.0 { %_type.0 { i64 16, i64 16, i32 -2058926462, i8 0, i8 8, i8 8, i8 20, ptr @runtime.interequal..f, ptr @gcbits..da, ptr @go..C46, ptr @go..C50, ptr @go_0llvm.RR..p }, %IPST.44 { ptr @go..C55, i64 2, i64 2 } }
@runtime.interequal..f = external constant %functionDescriptor.0
@gcbits..da = weak constant [1 x i8] c"\03", comdat
@const.24 = private constant [17 x i8] c"\09go.llvm\09llvm.RR\00", align 1
@go..C46 = internal constant { ptr, i64 } { ptr @const.24, i64 16 }
@const.25 = private constant [3 x i8] c"RR\00", align 1
@go..C47 = internal constant { ptr, i64 } { ptr @const.25, i64 2 }
@go..C48 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C49 = internal constant [1 x %method.0] zeroinitializer
@go..C50 = internal constant %uncommonType.0 { ptr @go..C47, ptr @go..C48, %IPST.41 { ptr @go..C49, i64 0, i64 0 } }
@go_0llvm.RR..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1416914985, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C51, ptr null, ptr null }, ptr @go_0llvm.RR..d }, comdat
@const.26 = private constant [18 x i8] c"*\09go.llvm\09llvm.RR\00", align 1
@go..C51 = internal constant { ptr, i64 } { ptr @const.26, i64 17 }
@go..C52 = internal constant { ptr, i64 } { ptr @const.4, i64 6 }
@go..C53 = internal constant { ptr, i64 } { ptr @const.22, i64 4 }
@go..C54 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C55 = internal constant [2 x %imethod.0] [%imethod.0 { ptr @go..C52, ptr null, ptr @type..func_8_9_8_2go_0llvm_0RR__Header_9 }, %imethod.0 { ptr @go..C53, ptr @go..C54, ptr @type..func_8_9_8go_0llvm_0RR_9 }]
@go..C56 = internal constant [1 x ptr] [ptr @go_0llvm.RR..d]
@type..func_8_2go_0llvm_0SOA_9_8go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1395462056, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C57, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C58, i64 1, i64 1 }, %IPST.42 { ptr @go..C59, i64 1, i64 1 } }, comdat
@const.27 = private constant [42 x i8] c"func(*\09go.llvm\09llvm.SOA) \09go.llvm\09llvm.RR\00", align 1
@go..C57 = internal constant { ptr, i64 } { ptr @const.27, i64 41 }
@go..C58 = internal constant [1 x ptr] [ptr @go_0llvm.SOA..p]
@go..C59 = internal constant [1 x ptr] [ptr @go_0llvm.RR..d]
@go..C60 = internal constant [2 x %method.0] [%method.0 { ptr @go..C7, ptr null, ptr @type..func_8_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0SOA_9_8_2go_0llvm_0RR__Header_9, ptr @go_0llvm.SOA.Header }, %method.0 { ptr @go..C42, ptr @go..C43, ptr @type..func_8_9_8go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0SOA_9_8go_0llvm_0RR_9, ptr @go_0llvm.SOA.copy }]
@go..C61 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.41 { ptr @go..C60, i64 2, i64 2 } }
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
@go_0llvm.DNAME..d = constant %StructType.0 { %_type.0 { i64 48, i64 40, i32 1378049777, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.DNAME..eq..f, ptr @gcbits..ra, ptr @go..C74, ptr @go..C78, ptr @go_0llvm.DNAME..p }, %IPST.43 { ptr @go..C95, i64 2, i64 2 } }
@go_0llvm.DNAME..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.DNAME..eq to i64) }
@gcbits..ra = weak constant [1 x i8] c"\11", comdat
@const.37 = private constant [20 x i8] c"\09go.llvm\09llvm.DNAME\00", align 1
@go..C74 = internal constant { ptr, i64 } { ptr @const.37, i64 19 }
@const.38 = private constant [6 x i8] c"DNAME\00", align 1
@go..C75 = internal constant { ptr, i64 } { ptr @const.38, i64 5 }
@go..C76 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C77 = internal constant [1 x %method.0] zeroinitializer
@go..C78 = internal constant %uncommonType.0 { ptr @go..C75, ptr @go..C76, %IPST.41 { ptr @go..C77, i64 0, i64 0 } }
@go_0llvm.DNAME..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 573959961, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C79, ptr @go..C90, ptr @type.._2_2go_0llvm_0DNAME }, ptr @go_0llvm.DNAME..d }, comdat
@const.39 = private constant [21 x i8] c"*\09go.llvm\09llvm.DNAME\00", align 1
@go..C79 = internal constant { ptr, i64 } { ptr @const.39, i64 20 }
@go..C80 = internal constant { ptr, i64 } { ptr @const.4, i64 6 }
@type..func_8_2go_0llvm_0DNAME_9_8_2go_0llvm_0RR__Header_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 578596200, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C81, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C82, i64 1, i64 1 }, %IPST.42 { ptr @go..C83, i64 1, i64 1 } }, comdat
@const.40 = private constant [52 x i8] c"func(*\09go.llvm\09llvm.DNAME) *\09go.llvm\09llvm.RR_Header\00", align 1
@go..C81 = internal constant { ptr, i64 } { ptr @const.40, i64 51 }
@go..C82 = internal constant [1 x ptr] [ptr @go_0llvm.DNAME..p]
@go..C83 = internal constant [1 x ptr] [ptr @go_0llvm.RR__Header..p]
@go..C84 = internal constant { ptr, i64 } { ptr @const.22, i64 4 }
@go..C85 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8_2go_0llvm_0DNAME_9_8go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1735425112, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C86, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C87, i64 1, i64 1 }, %IPST.42 { ptr @go..C88, i64 1, i64 1 } }, comdat
@const.41 = private constant [44 x i8] c"func(*\09go.llvm\09llvm.DNAME) \09go.llvm\09llvm.RR\00", align 1
@go..C86 = internal constant { ptr, i64 } { ptr @const.41, i64 43 }
@go..C87 = internal constant [1 x ptr] [ptr @go_0llvm.DNAME..p]
@go..C88 = internal constant [1 x ptr] [ptr @go_0llvm.RR..d]
@go..C89 = internal constant [2 x %method.0] [%method.0 { ptr @go..C80, ptr null, ptr @type..func_8_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0DNAME_9_8_2go_0llvm_0RR__Header_9, ptr @go_0llvm.DNAME.Header }, %method.0 { ptr @go..C84, ptr @go..C85, ptr @type..func_8_9_8go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0DNAME_9_8go_0llvm_0RR_9, ptr @go_0llvm.DNAME.copy }]
@go..C90 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.41 { ptr @go..C89, i64 2, i64 2 } }
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
@go_0llvm.CNAME..d = constant %StructType.0 { %_type.0 { i64 48, i64 40, i32 -2001375236, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.CNAME..eq..f, ptr @gcbits..ra, ptr @go..C96, ptr @go..C100, ptr @go_0llvm.CNAME..p }, %IPST.43 { ptr @go..C117, i64 2, i64 2 } }
@go_0llvm.CNAME..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.CNAME..eq to i64) }
@const.45 = private constant [20 x i8] c"\09go.llvm\09llvm.CNAME\00", align 1
@go..C96 = internal constant { ptr, i64 } { ptr @const.45, i64 19 }
@const.46 = private constant [6 x i8] c"CNAME\00", align 1
@go..C97 = internal constant { ptr, i64 } { ptr @const.46, i64 5 }
@go..C98 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C99 = internal constant [1 x %method.0] zeroinitializer
@go..C100 = internal constant %uncommonType.0 { ptr @go..C97, ptr @go..C98, %IPST.41 { ptr @go..C99, i64 0, i64 0 } }
@go_0llvm.CNAME..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1957232695, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C101, ptr @go..C112, ptr @type.._2_2go_0llvm_0CNAME }, ptr @go_0llvm.CNAME..d }, comdat
@const.47 = private constant [21 x i8] c"*\09go.llvm\09llvm.CNAME\00", align 1
@go..C101 = internal constant { ptr, i64 } { ptr @const.47, i64 20 }
@go..C102 = internal constant { ptr, i64 } { ptr @const.4, i64 6 }
@type..func_8_2go_0llvm_0CNAME_9_8_2go_0llvm_0RR__Header_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1184809832, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C103, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C104, i64 1, i64 1 }, %IPST.42 { ptr @go..C105, i64 1, i64 1 } }, comdat
@const.48 = private constant [52 x i8] c"func(*\09go.llvm\09llvm.CNAME) *\09go.llvm\09llvm.RR_Header\00", align 1
@go..C103 = internal constant { ptr, i64 } { ptr @const.48, i64 51 }
@go..C104 = internal constant [1 x ptr] [ptr @go_0llvm.CNAME..p]
@go..C105 = internal constant [1 x ptr] [ptr @go_0llvm.RR__Header..p]
@go..C106 = internal constant { ptr, i64 } { ptr @const.22, i64 4 }
@go..C107 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8_2go_0llvm_0CNAME_9_8go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1129211480, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C108, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C109, i64 1, i64 1 }, %IPST.42 { ptr @go..C110, i64 1, i64 1 } }, comdat
@const.49 = private constant [44 x i8] c"func(*\09go.llvm\09llvm.CNAME) \09go.llvm\09llvm.RR\00", align 1
@go..C108 = internal constant { ptr, i64 } { ptr @const.49, i64 43 }
@go..C109 = internal constant [1 x ptr] [ptr @go_0llvm.CNAME..p]
@go..C110 = internal constant [1 x ptr] [ptr @go_0llvm.RR..d]
@go..C111 = internal constant [2 x %method.0] [%method.0 { ptr @go..C102, ptr null, ptr @type..func_8_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0CNAME_9_8_2go_0llvm_0RR__Header_9, ptr @go_0llvm.CNAME.Header }, %method.0 { ptr @go..C106, ptr @go..C107, ptr @type..func_8_9_8go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0CNAME_9_8go_0llvm_0RR_9, ptr @go_0llvm.CNAME.copy }]
@go..C112 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.41 { ptr @go..C111, i64 2, i64 2 } }
@type.._2_2go_0llvm_0CNAME = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1250952039, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C113, ptr null, ptr null }, ptr @go_0llvm.CNAME..p }, comdat
@const.50 = private constant [22 x i8] c"**\09go.llvm\09llvm.CNAME\00", align 1
@go..C113 = internal constant { ptr, i64 } { ptr @const.50, i64 21 }
@go..C114 = internal constant { ptr, i64 } { ptr @const.29, i64 3 }
@go..C115 = internal constant { ptr, i64 } { ptr @const.43, i64 6 }
@go..C116 = internal constant { ptr, i64 } { ptr @const.12, i64 18 }
@go..C117 = internal constant [2 x %structField.0] [%structField.0 { ptr @go..C114, ptr null, ptr @go_0llvm.RR__Header..d, ptr null, i64 0 }, %structField.0 { ptr @go..C115, ptr null, ptr @string..d, ptr @go..C116, i64 64 }]
@imt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.CNAME = local_unnamed_addr constant { ptr, ptr, ptr } { ptr @go_0llvm.CNAME..d, ptr @go_0llvm.CNAME.Header, ptr @go_0llvm.CNAME.copy }
@pimt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.CNAME = constant { ptr, ptr, ptr } { ptr @go_0llvm.CNAME..p, ptr @go_0llvm.CNAME.Header, ptr @go_0llvm.CNAME.copy }
@go_0llvm.SRV..d = constant %StructType.0 { %_type.0 { i64 56, i64 48, i32 645114483, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.SRV..eq..f, ptr @gcbits..bb, ptr @go..C118, ptr @go..C122, ptr @go_0llvm.SRV..p }, %IPST.43 { ptr @go..C142, i64 5, i64 5 } }
@go_0llvm.SRV..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.SRV..eq to i64) }
@gcbits..bb = weak constant [1 x i8] c"!", comdat
@const.51 = private constant [18 x i8] c"\09go.llvm\09llvm.SRV\00", align 1
@go..C118 = internal constant { ptr, i64 } { ptr @const.51, i64 17 }
@const.52 = private constant [4 x i8] c"SRV\00", align 1
@go..C119 = internal constant { ptr, i64 } { ptr @const.52, i64 3 }
@go..C120 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C121 = internal constant [1 x %method.0] zeroinitializer
@go..C122 = internal constant %uncommonType.0 { ptr @go..C119, ptr @go..C120, %IPST.41 { ptr @go..C121, i64 0, i64 0 } }
@go_0llvm.SRV..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1731897145, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C123, ptr @go..C134, ptr @type.._2_2go_0llvm_0SRV }, ptr @go_0llvm.SRV..d }, comdat
@const.53 = private constant [19 x i8] c"*\09go.llvm\09llvm.SRV\00", align 1
@go..C123 = internal constant { ptr, i64 } { ptr @const.53, i64 18 }
@go..C124 = internal constant { ptr, i64 } { ptr @const.4, i64 6 }
@type..func_8_2go_0llvm_0SRV_9_8_2go_0llvm_0RR__Header_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1022119576, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C125, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C126, i64 1, i64 1 }, %IPST.42 { ptr @go..C127, i64 1, i64 1 } }, comdat
@const.54 = private constant [50 x i8] c"func(*\09go.llvm\09llvm.SRV) *\09go.llvm\09llvm.RR_Header\00", align 1
@go..C125 = internal constant { ptr, i64 } { ptr @const.54, i64 49 }
@go..C126 = internal constant [1 x ptr] [ptr @go_0llvm.SRV..p]
@go..C127 = internal constant [1 x ptr] [ptr @go_0llvm.RR__Header..p]
@go..C128 = internal constant { ptr, i64 } { ptr @const.22, i64 4 }
@go..C129 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8_2go_0llvm_0SRV_9_8go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 958826408, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C130, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C131, i64 1, i64 1 }, %IPST.42 { ptr @go..C132, i64 1, i64 1 } }, comdat
@const.55 = private constant [42 x i8] c"func(*\09go.llvm\09llvm.SRV) \09go.llvm\09llvm.RR\00", align 1
@go..C130 = internal constant { ptr, i64 } { ptr @const.55, i64 41 }
@go..C131 = internal constant [1 x ptr] [ptr @go_0llvm.SRV..p]
@go..C132 = internal constant [1 x ptr] [ptr @go_0llvm.RR..d]
@go..C133 = internal constant [2 x %method.0] [%method.0 { ptr @go..C124, ptr null, ptr @type..func_8_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0SRV_9_8_2go_0llvm_0RR__Header_9, ptr @go_0llvm.SRV.Header }, %method.0 { ptr @go..C128, ptr @go..C129, ptr @type..func_8_9_8go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0SRV_9_8go_0llvm_0RR_9, ptr @go_0llvm.SRV.copy }]
@go..C134 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.41 { ptr @go..C133, i64 2, i64 2 } }
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
@go_0llvm.MX..d = constant %StructType.0 { %_type.0 { i64 56, i64 48, i32 -525846277, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.MX..eq..f, ptr @gcbits..bb, ptr @go..C143, ptr @go..C147, ptr @go_0llvm.MX..p }, %IPST.43 { ptr @go..C165, i64 3, i64 3 } }
@go_0llvm.MX..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.MX..eq to i64) }
@const.60 = private constant [17 x i8] c"\09go.llvm\09llvm.MX\00", align 1
@go..C143 = internal constant { ptr, i64 } { ptr @const.60, i64 16 }
@const.61 = private constant [3 x i8] c"MX\00", align 1
@go..C144 = internal constant { ptr, i64 } { ptr @const.61, i64 2 }
@go..C145 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C146 = internal constant [1 x %method.0] zeroinitializer
@go..C147 = internal constant %uncommonType.0 { ptr @go..C144, ptr @go..C145, %IPST.41 { ptr @go..C146, i64 0, i64 0 } }
@go_0llvm.MX..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 176394169, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C148, ptr @go..C159, ptr @type.._2_2go_0llvm_0MX }, ptr @go_0llvm.MX..d }, comdat
@const.62 = private constant [18 x i8] c"*\09go.llvm\09llvm.MX\00", align 1
@go..C148 = internal constant { ptr, i64 } { ptr @const.62, i64 17 }
@go..C149 = internal constant { ptr, i64 } { ptr @const.4, i64 6 }
@type..func_8_2go_0llvm_0MX_9_8_2go_0llvm_0RR__Header_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 741392744, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C150, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C151, i64 1, i64 1 }, %IPST.42 { ptr @go..C152, i64 1, i64 1 } }, comdat
@const.63 = private constant [49 x i8] c"func(*\09go.llvm\09llvm.MX) *\09go.llvm\09llvm.RR_Header\00", align 1
@go..C150 = internal constant { ptr, i64 } { ptr @const.63, i64 48 }
@go..C151 = internal constant [1 x ptr] [ptr @go_0llvm.MX..p]
@go..C152 = internal constant [1 x ptr] [ptr @go_0llvm.RR__Header..p]
@go..C153 = internal constant { ptr, i64 } { ptr @const.22, i64 4 }
@go..C154 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8_2go_0llvm_0MX_9_8go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1572628568, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C155, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C156, i64 1, i64 1 }, %IPST.42 { ptr @go..C157, i64 1, i64 1 } }, comdat
@const.64 = private constant [41 x i8] c"func(*\09go.llvm\09llvm.MX) \09go.llvm\09llvm.RR\00", align 1
@go..C155 = internal constant { ptr, i64 } { ptr @const.64, i64 40 }
@go..C156 = internal constant [1 x ptr] [ptr @go_0llvm.MX..p]
@go..C157 = internal constant [1 x ptr] [ptr @go_0llvm.RR..d]
@go..C158 = internal constant [2 x %method.0] [%method.0 { ptr @go..C149, ptr null, ptr @type..func_8_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0MX_9_8_2go_0llvm_0RR__Header_9, ptr @go_0llvm.MX.Header }, %method.0 { ptr @go..C153, ptr @go..C154, ptr @type..func_8_9_8go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0MX_9_8go_0llvm_0RR_9, ptr @go_0llvm.MX.copy }]
@go..C159 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.41 { ptr @go..C158, i64 2, i64 2 } }
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
@go_0llvm.NS..d = constant %StructType.0 { %_type.0 { i64 48, i64 40, i32 663863557, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.NS..eq..f, ptr @gcbits..ra, ptr @go..C166, ptr @go..C170, ptr @go_0llvm.NS..p }, %IPST.43 { ptr @go..C187, i64 2, i64 2 } }
@go_0llvm.NS..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.NS..eq to i64) }
@const.68 = private constant [17 x i8] c"\09go.llvm\09llvm.NS\00", align 1
@go..C166 = internal constant { ptr, i64 } { ptr @const.68, i64 16 }
@const.69 = private constant [3 x i8] c"NS\00", align 1
@go..C167 = internal constant { ptr, i64 } { ptr @const.69, i64 2 }
@go..C168 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C169 = internal constant [1 x %method.0] zeroinitializer
@go..C170 = internal constant %uncommonType.0 { ptr @go..C167, ptr @go..C168, %IPST.41 { ptr @go..C169, i64 0, i64 0 } }
@go_0llvm.NS..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 2031882329, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C171, ptr @go..C182, ptr @type.._2_2go_0llvm_0NS }, ptr @go_0llvm.NS..d }, comdat
@const.70 = private constant [18 x i8] c"*\09go.llvm\09llvm.NS\00", align 1
@go..C171 = internal constant { ptr, i64 } { ptr @const.70, i64 17 }
@go..C172 = internal constant { ptr, i64 } { ptr @const.4, i64 6 }
@type..func_8_2go_0llvm_0NS_9_8_2go_0llvm_0RR__Header_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -12528280, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C173, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C174, i64 1, i64 1 }, %IPST.42 { ptr @go..C175, i64 1, i64 1 } }, comdat
@const.71 = private constant [49 x i8] c"func(*\09go.llvm\09llvm.NS) *\09go.llvm\09llvm.RR_Header\00", align 1
@go..C173 = internal constant { ptr, i64 } { ptr @const.71, i64 48 }
@go..C174 = internal constant [1 x ptr] [ptr @go_0llvm.NS..p]
@go..C175 = internal constant [1 x ptr] [ptr @go_0llvm.RR__Header..p]
@go..C176 = internal constant { ptr, i64 } { ptr @const.22, i64 4 }
@go..C177 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8_2go_0llvm_0NS_9_8go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1968417704, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C178, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C179, i64 1, i64 1 }, %IPST.42 { ptr @go..C180, i64 1, i64 1 } }, comdat
@const.72 = private constant [41 x i8] c"func(*\09go.llvm\09llvm.NS) \09go.llvm\09llvm.RR\00", align 1
@go..C178 = internal constant { ptr, i64 } { ptr @const.72, i64 40 }
@go..C179 = internal constant [1 x ptr] [ptr @go_0llvm.NS..p]
@go..C180 = internal constant [1 x ptr] [ptr @go_0llvm.RR..d]
@go..C181 = internal constant [2 x %method.0] [%method.0 { ptr @go..C172, ptr null, ptr @type..func_8_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0NS_9_8_2go_0llvm_0RR__Header_9, ptr @go_0llvm.NS.Header }, %method.0 { ptr @go..C176, ptr @go..C177, ptr @type..func_8_9_8go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0NS_9_8go_0llvm_0RR_9, ptr @go_0llvm.NS.copy }]
@go..C182 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.41 { ptr @go..C181, i64 2, i64 2 } }
@type.._2_2go_0llvm_0NS = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1849621095, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C183, ptr null, ptr null }, ptr @go_0llvm.NS..p }, comdat
@const.73 = private constant [19 x i8] c"**\09go.llvm\09llvm.NS\00", align 1
@go..C183 = internal constant { ptr, i64 } { ptr @const.73, i64 18 }
@go..C184 = internal constant { ptr, i64 } { ptr @const.29, i64 3 }
@go..C185 = internal constant { ptr, i64 } { ptr @const.30, i64 2 }
@go..C186 = internal constant { ptr, i64 } { ptr @const.12, i64 18 }
@go..C187 = internal constant [2 x %structField.0] [%structField.0 { ptr @go..C184, ptr null, ptr @go_0llvm.RR__Header..d, ptr null, i64 0 }, %structField.0 { ptr @go..C185, ptr null, ptr @string..d, ptr @go..C186, i64 64 }]
@imt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.NS = local_unnamed_addr constant { ptr, ptr, ptr } { ptr @go_0llvm.NS..d, ptr @go_0llvm.NS.Header, ptr @go_0llvm.NS.copy }
@pimt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.NS = constant { ptr, ptr, ptr } { ptr @go_0llvm.NS..p, ptr @go_0llvm.NS.Header, ptr @go_0llvm.NS.copy }
@go_0llvm.SetValueFunc..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.SetValueFunc to i64) }
@go_0llvm.IsSubDomain..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.IsSubDomain to i64) }
@go_0llvm.SubTypeSignature..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.SubTypeSignature to i64) }
@go_0llvm.ResponseWriter..d = constant %InterfaceType.0 { %_type.0 { i64 16, i64 16, i32 -1536056202, i8 0, i8 8, i8 8, i8 20, ptr @runtime.interequal..f, ptr @gcbits..da, ptr @go..C188, ptr @go..C192, ptr @go_0llvm.ResponseWriter..p }, %IPST.44 { ptr @go..C291, i64 8, i64 8 } }
@const.74 = private constant [29 x i8] c"\09go.llvm\09llvm.ResponseWriter\00", align 1
@go..C188 = internal constant { ptr, i64 } { ptr @const.74, i64 28 }
@const.75 = private constant [15 x i8] c"ResponseWriter\00", align 1
@go..C189 = internal constant { ptr, i64 } { ptr @const.75, i64 14 }
@go..C190 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C191 = internal constant [1 x %method.0] zeroinitializer
@go..C192 = internal constant %uncommonType.0 { ptr @go..C189, ptr @go..C190, %IPST.41 { ptr @go..C191, i64 0, i64 0 } }
@go_0llvm.ResponseWriter..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1192904553, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C193, ptr null, ptr null }, ptr @go_0llvm.ResponseWriter..d }, comdat
@const.76 = private constant [30 x i8] c"*\09go.llvm\09llvm.ResponseWriter\00", align 1
@go..C193 = internal constant { ptr, i64 } { ptr @const.76, i64 29 }
@const.77 = private constant [6 x i8] c"Close\00", align 1
@go..C194 = internal constant { ptr, i64 } { ptr @const.77, i64 5 }
@type..func_8_9_8error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1188738504, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C195, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C196, i64 0, i64 0 }, %IPST.42 { ptr @go..C207, i64 1, i64 1 } }, comdat
@const.78 = private constant [13 x i8] c"func() error\00", align 1
@go..C195 = internal constant { ptr, i64 } { ptr @const.78, i64 12 }
@go..C196 = internal constant [1 x ptr] zeroinitializer
@error..d = weak constant %InterfaceType.0 { %_type.0 { i64 16, i64 16, i32 -2128909609, i8 0, i8 8, i8 8, i8 20, ptr @runtime.interequal..f, ptr @gcbits..da, ptr @go..C197, ptr @go..C200, ptr @error..p }, %IPST.44 { ptr @go..C206, i64 1, i64 1 } }, comdat
@const.79 = private constant [6 x i8] c"error\00", align 1
@go..C197 = internal constant { ptr, i64 } { ptr @const.79, i64 5 }
@go..C198 = internal constant { ptr, i64 } { ptr @const.79, i64 5 }
@go..C199 = internal constant [1 x %method.0] zeroinitializer
@go..C200 = internal constant %uncommonType.0 { ptr @go..C198, ptr null, %IPST.41 { ptr @go..C199, i64 0, i64 0 } }
@error..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 297184633, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C201, ptr null, ptr null }, ptr @error..d }, comdat
@const.80 = private constant [7 x i8] c"*error\00", align 1
@go..C201 = internal constant { ptr, i64 } { ptr @const.80, i64 6 }
@const.81 = private constant [6 x i8] c"Error\00", align 1
@go..C202 = internal constant { ptr, i64 } { ptr @const.81, i64 5 }
@type..func_8_9_8string_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 916039304, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C203, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C204, i64 0, i64 0 }, %IPST.42 { ptr @go..C205, i64 1, i64 1 } }, comdat
@const.82 = private constant [14 x i8] c"func() string\00", align 1
@go..C203 = internal constant { ptr, i64 } { ptr @const.82, i64 13 }
@go..C204 = internal constant [1 x ptr] zeroinitializer
@go..C205 = internal constant [1 x ptr] [ptr @string..d]
@go..C206 = internal constant [1 x %imethod.0] [%imethod.0 { ptr @go..C202, ptr null, ptr @type..func_8_9_8string_9 }]
@go..C207 = internal constant [1 x ptr] [ptr @error..d]
@const.83 = private constant [7 x i8] c"Hijack\00", align 1
@go..C208 = internal constant { ptr, i64 } { ptr @const.83, i64 6 }
@type..func_8_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 8, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C209, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C210, i64 0, i64 0 }, %IPST.42 { ptr @go..C211, i64 0, i64 0 } }, comdat
@const.84 = private constant [7 x i8] c"func()\00", align 1
@go..C209 = internal constant { ptr, i64 } { ptr @const.84, i64 6 }
@go..C210 = internal constant [1 x ptr] zeroinitializer
@go..C211 = internal constant [1 x ptr] zeroinitializer
@const.85 = private constant [10 x i8] c"LocalAddr\00", align 1
@go..C212 = internal constant { ptr, i64 } { ptr @const.85, i64 9 }
@type..func_8_9_8net_0Addr_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 33758664, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C213, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C214, i64 0, i64 0 }, %IPST.42 { ptr @go..C215, i64 1, i64 1 } }, comdat
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
@type..func_8bool_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1966551592, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C219, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C225, i64 1, i64 1 }, %IPST.42 { ptr @go..C226, i64 0, i64 0 } }, comdat
@const.90 = private constant [11 x i8] c"func(bool)\00", align 1
@go..C219 = internal constant { ptr, i64 } { ptr @const.90, i64 10 }
@bool..d = weak constant %_type.0 { i64 1, i64 0, i32 1537849745, i8 8, i8 1, i8 1, i8 -127, ptr @runtime.memequal8..f, ptr null, ptr @go..C220, ptr @go..C223, ptr @bool..p }, comdat
@runtime.memequal8..f = external constant %functionDescriptor.0
@const.91 = private constant [5 x i8] c"bool\00", align 1
@go..C220 = internal constant { ptr, i64 } { ptr @const.91, i64 4 }
@go..C221 = internal constant { ptr, i64 } { ptr @const.91, i64 4 }
@go..C222 = internal constant [1 x %method.0] zeroinitializer
@go..C223 = internal constant %uncommonType.0 { ptr @go..C221, ptr null, %IPST.41 { ptr @go..C222, i64 0, i64 0 } }
@bool..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1164207847, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C224, ptr null, ptr null }, ptr @bool..d }, comdat
@const.92 = private constant [6 x i8] c"*bool\00", align 1
@go..C224 = internal constant { ptr, i64 } { ptr @const.92, i64 5 }
@go..C225 = internal constant [1 x ptr] [ptr @bool..d]
@go..C226 = internal constant [1 x ptr] zeroinitializer
@const.93 = private constant [6 x i8] c"Write\00", align 1
@go..C227 = internal constant { ptr, i64 } { ptr @const.93, i64 5 }
@type..func_8_6_7uint8_9_8int_3error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1764714264, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C228, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C235, i64 1, i64 1 }, %IPST.42 { ptr @go..C241, i64 2, i64 2 } }, comdat
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
@go..C233 = internal constant %uncommonType.0 { ptr @go..C231, ptr null, %IPST.41 { ptr @go..C232, i64 0, i64 0 } }
@uint8..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -60853863, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C234, ptr null, ptr null }, ptr @uint8..d }, comdat
@const.97 = private constant [7 x i8] c"*uint8\00", align 1
@go..C234 = internal constant { ptr, i64 } { ptr @const.97, i64 6 }
@go..C235 = internal constant [1 x ptr] [ptr @type.._6_7uint8]
@int..d = weak constant %_type.0 { i64 8, i64 0, i32 876704034, i8 8, i8 8, i8 8, i8 -126, ptr @runtime.memequal64..f, ptr null, ptr @go..C236, ptr @go..C239, ptr @int..p }, comdat
@const.98 = private constant [4 x i8] c"int\00", align 1
@go..C236 = internal constant { ptr, i64 } { ptr @const.98, i64 3 }
@go..C237 = internal constant { ptr, i64 } { ptr @const.98, i64 3 }
@go..C238 = internal constant [1 x %method.0] zeroinitializer
@go..C239 = internal constant %uncommonType.0 { ptr @go..C237, ptr null, %IPST.41 { ptr @go..C238, i64 0, i64 0 } }
@int..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1142362665, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C240, ptr null, ptr null }, ptr @int..d }, comdat
@const.99 = private constant [5 x i8] c"*int\00", align 1
@go..C240 = internal constant { ptr, i64 } { ptr @const.99, i64 4 }
@go..C241 = internal constant [2 x ptr] [ptr @int..d, ptr @error..d]
@const.100 = private constant [9 x i8] c"WriteMsg\00", align 1
@go..C242 = internal constant { ptr, i64 } { ptr @const.100, i64 8 }
@type..func_8_2go_0llvm_0Msg_9_8error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1007465704, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C243, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C289, i64 1, i64 1 }, %IPST.42 { ptr @go..C290, i64 1, i64 1 } }, comdat
@const.101 = private constant [31 x i8] c"func(*\09go.llvm\09llvm.Msg) error\00", align 1
@go..C243 = internal constant { ptr, i64 } { ptr @const.101, i64 30 }
@go_0llvm.Msg..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 799641593, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C244, ptr null, ptr null }, ptr @go_0llvm.Msg..d }, comdat
@const.102 = private constant [19 x i8] c"*\09go.llvm\09llvm.Msg\00", align 1
@go..C244 = internal constant { ptr, i64 } { ptr @const.102, i64 18 }
@go_0llvm.Msg..d = constant %StructType.0 { %_type.0 { i64 136, i64 120, i32 318413055, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..ajsa, ptr @go..C245, ptr @go..C249, ptr @go_0llvm.Msg..p }, %IPST.43 { ptr @go..C288, i64 6, i64 6 } }
@gcbits..ajsa = weak constant [2 x i8] c" I", comdat
@const.103 = private constant [18 x i8] c"\09go.llvm\09llvm.Msg\00", align 1
@go..C245 = internal constant { ptr, i64 } { ptr @const.103, i64 17 }
@const.104 = private constant [4 x i8] c"Msg\00", align 1
@go..C246 = internal constant { ptr, i64 } { ptr @const.104, i64 3 }
@go..C247 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C248 = internal constant [1 x %method.0] zeroinitializer
@go..C249 = internal constant %uncommonType.0 { ptr @go..C246, ptr @go..C247, %IPST.41 { ptr @go..C248, i64 0, i64 0 } }
@const.105 = private constant [7 x i8] c"MsgHdr\00", align 1
@go..C250 = internal constant { ptr, i64 } { ptr @const.105, i64 6 }
@go_0llvm.MsgHdr..d = constant %StructType.0 { %_type.0 { i64 32, i64 0, i32 1661415275, i8 0, i8 8, i8 8, i8 -103, ptr @go_0llvm.MsgHdr..eq..f, ptr null, ptr @go..C251, ptr @go..C255, ptr @go_0llvm.MsgHdr..p }, %IPST.43 { ptr @go..C268, i64 11, i64 11 } }
@go_0llvm.MsgHdr..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.MsgHdr..eq to i64) }
@const.106 = private constant [21 x i8] c"\09go.llvm\09llvm.MsgHdr\00", align 1
@go..C251 = internal constant { ptr, i64 } { ptr @const.106, i64 20 }
@go..C252 = internal constant { ptr, i64 } { ptr @const.105, i64 6 }
@go..C253 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C254 = internal constant [1 x %method.0] zeroinitializer
@go..C255 = internal constant %uncommonType.0 { ptr @go..C252, ptr @go..C253, %IPST.41 { ptr @go..C254, i64 0, i64 0 } }
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
@go_0llvm.Question..d = constant %StructType.0 { %_type.0 { i64 24, i64 8, i32 -768832750, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.Question..eq..f, ptr @gcbits..ba, ptr @go..C273, ptr @go..C277, ptr @go_0llvm.Question..p }, %IPST.43 { ptr @go..C283, i64 3, i64 3 } }
@go_0llvm.Question..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.Question..eq to i64) }
@const.123 = private constant [23 x i8] c"\09go.llvm\09llvm.Question\00", align 1
@go..C273 = internal constant { ptr, i64 } { ptr @const.123, i64 22 }
@go..C274 = internal constant { ptr, i64 } { ptr @const.121, i64 8 }
@go..C275 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C276 = internal constant [1 x %method.0] zeroinitializer
@go..C277 = internal constant %uncommonType.0 { ptr @go..C274, ptr @go..C275, %IPST.41 { ptr @go..C276, i64 0, i64 0 } }
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
@go_0llvm.compressionMap..d = constant %StructType.0 { %_type.0 { i64 16, i64 16, i32 618047032, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..da, ptr @go..C292, ptr @go..C296, ptr @go_0llvm.compressionMap..p }, %IPST.43 { ptr @go..C323, i64 2, i64 2 } }
@const.130 = private constant [29 x i8] c"\09go.llvm\09llvm.compressionMap\00", align 1
@go..C292 = internal constant { ptr, i64 } { ptr @const.130, i64 28 }
@const.131 = private constant [15 x i8] c"compressionMap\00", align 1
@go..C293 = internal constant { ptr, i64 } { ptr @const.131, i64 14 }
@go..C294 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C295 = internal constant [1 x %method.0] zeroinitializer
@go..C296 = internal constant %uncommonType.0 { ptr @go..C293, ptr @go..C294, %IPST.41 { ptr @go..C295, i64 0, i64 0 } }
@go_0llvm.compressionMap..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1298817929, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C297, ptr null, ptr null }, ptr @go_0llvm.compressionMap..d }, comdat
@const.132 = private constant [30 x i8] c"*\09go.llvm\09llvm.compressionMap\00", align 1
@go..C297 = internal constant { ptr, i64 } { ptr @const.132, i64 29 }
@const.133 = private constant [4 x i8] c"ext\00", align 1
@go..C298 = internal constant { ptr, i64 } { ptr @const.133, i64 3 }
@go..C299 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..map_6string_7int = weak constant %MapType.0 { %_type.0 { i64 8, i64 8, i32 -1122248756, i8 0, i8 8, i8 8, i8 53, ptr null, ptr @gcbits..ba, ptr @go..C300, ptr null, ptr null }, ptr @string..d, ptr @int..d, ptr @type..struct_4_4x_5topbits_b_68x_7uint8_ckeys_b_68x_7string_cvalues_b_68x_7int_coverflow_b_2_4void_5_5, ptr @runtime.strhash..f, i8 16, i8 8, i16 208, i32 12 }, comdat
@const.134 = private constant [15 x i8] c"map[string]int\00", align 1
@go..C300 = internal constant { ptr, i64 } { ptr @const.134, i64 14 }
@type..struct_4_4x_5topbits_b_68x_7uint8_ckeys_b_68x_7string_cvalues_b_68x_7int_coverflow_b_2_4void_5_5 = weak constant %StructType.0 { %_type.0 { i64 208, i64 208, i32 -1581031772, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..kvkbaba, ptr @go..C301, ptr null, ptr null }, %IPST.43 { ptr @go..C311, i64 4, i64 4 } }, comdat
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
@type..struct_4_4x_5topbits_b_68x_7uint8_ckeys_b_68x_7string_cvalues_b_68x_7uint16_coverflow_b_2_4void_5_5 = weak constant %StructType.0 { %_type.0 { i64 160, i64 160, i32 -1410323868, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..kvkra, ptr @go..C315, ptr null, ptr null }, %IPST.43 { ptr @go..C322, i64 4, i64 4 } }, comdat
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
@go_0llvm.Config..d = constant %StructType.0 { %_type.0 { i64 248, i64 248, i32 1742215688, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..ffncgFb, ptr @go..C324, ptr @go..C328, ptr @go_0llvm.Config..p }, %IPST.43 { ptr @go..C465, i64 19, i64 19 } }
@gcbits..ffncgFb = weak constant [4 x i8] c"\A54a~", comdat
@const.149 = private constant [21 x i8] c"\09go.llvm\09llvm.Config\00", align 1
@go..C324 = internal constant { ptr, i64 } { ptr @const.149, i64 20 }
@const.150 = private constant [7 x i8] c"Config\00", align 1
@go..C325 = internal constant { ptr, i64 } { ptr @const.150, i64 6 }
@go..C326 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C327 = internal constant [1 x %method.0] zeroinitializer
@go..C328 = internal constant %uncommonType.0 { ptr @go..C325, ptr @go..C326, %IPST.41 { ptr @go..C327, i64 0, i64 0 } }
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
@type..func_8_2net_1http_0Request_9_8bool_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 2015603048, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C338, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C339, i64 1, i64 1 }, %IPST.42 { ptr @go..C340, i64 1, i64 1 } }, comdat
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
@go_0llvm.FilterFunc..d = constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -2058011446, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C343, ptr @go..C347, ptr @go_0llvm.FilterFunc..p }, i8 0, %IPST.42 { ptr @go..C401, i64 2, i64 2 }, %IPST.42 { ptr @go..C402, i64 1, i64 1 } }
@const.162 = private constant [25 x i8] c"\09go.llvm\09llvm.FilterFunc\00", align 1
@go..C343 = internal constant { ptr, i64 } { ptr @const.162, i64 24 }
@const.163 = private constant [11 x i8] c"FilterFunc\00", align 1
@go..C344 = internal constant { ptr, i64 } { ptr @const.163, i64 10 }
@go..C345 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C346 = internal constant [1 x %method.0] zeroinitializer
@go..C347 = internal constant %uncommonType.0 { ptr @go..C344, ptr @go..C345, %IPST.41 { ptr @go..C346, i64 0, i64 0 } }
@go_0llvm.FilterFunc..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1431555241, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C348, ptr null, ptr null }, ptr @go_0llvm.FilterFunc..d }, comdat
@const.164 = private constant [26 x i8] c"*\09go.llvm\09llvm.FilterFunc\00", align 1
@go..C348 = internal constant { ptr, i64 } { ptr @const.164, i64 25 }
@context.Context..d = external constant %InterfaceType.0
@go_0llvm.Request..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1678514439, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C349, ptr @go..C369, ptr @type.._2_2go_0llvm_0Request }, ptr @go_0llvm.Request..d }, comdat
@const.165 = private constant [23 x i8] c"*\09go.llvm\09llvm.Request\00", align 1
@go..C349 = internal constant { ptr, i64 } { ptr @const.165, i64 22 }
@const.166 = private constant [3 x i8] c"Do\00", align 1
@go..C350 = internal constant { ptr, i64 } { ptr @const.166, i64 2 }
@type..func_8_9_8bool_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -361864120, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C351, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C352, i64 0, i64 0 }, %IPST.42 { ptr @go..C353, i64 1, i64 1 } }, comdat
@const.167 = private constant [12 x i8] c"func() bool\00", align 1
@go..C351 = internal constant { ptr, i64 } { ptr @const.167, i64 11 }
@go..C352 = internal constant [1 x ptr] zeroinitializer
@go..C353 = internal constant [1 x ptr] [ptr @bool..d]
@type..func_8_2go_0llvm_0Request_9_8bool_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1760248680, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C354, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C355, i64 1, i64 1 }, %IPST.42 { ptr @go..C356, i64 1, i64 1 } }, comdat
@const.168 = private constant [34 x i8] c"func(*\09go.llvm\09llvm.Request) bool\00", align 1
@go..C354 = internal constant { ptr, i64 } { ptr @const.168, i64 33 }
@go..C355 = internal constant [1 x ptr] [ptr @go_0llvm.Request..p]
@go..C356 = internal constant [1 x ptr] [ptr @bool..d]
@go..C357 = internal constant { ptr, i64 } { ptr @const.9, i64 4 }
@type..func_8_2go_0llvm_0Request_9_8string_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1256815192, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C358, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C359, i64 1, i64 1 }, %IPST.42 { ptr @go..C360, i64 1, i64 1 } }, comdat
@const.169 = private constant [36 x i8] c"func(*\09go.llvm\09llvm.Request) string\00", align 1
@go..C358 = internal constant { ptr, i64 } { ptr @const.169, i64 35 }
@go..C359 = internal constant [1 x ptr] [ptr @go_0llvm.Request..p]
@go..C360 = internal constant [1 x ptr] [ptr @string..d]
@const.170 = private constant [6 x i8] c"QType\00", align 1
@go..C361 = internal constant { ptr, i64 } { ptr @const.170, i64 5 }
@type..func_8_9_8uint16_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 615899144, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C362, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C363, i64 0, i64 0 }, %IPST.42 { ptr @go..C364, i64 1, i64 1 } }, comdat
@const.171 = private constant [14 x i8] c"func() uint16\00", align 1
@go..C362 = internal constant { ptr, i64 } { ptr @const.171, i64 13 }
@go..C363 = internal constant [1 x ptr] zeroinitializer
@go..C364 = internal constant [1 x ptr] [ptr @uint16..d]
@type..func_8_2go_0llvm_0Request_9_8uint16_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1556955352, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C365, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C366, i64 1, i64 1 }, %IPST.42 { ptr @go..C367, i64 1, i64 1 } }, comdat
@const.172 = private constant [36 x i8] c"func(*\09go.llvm\09llvm.Request) uint16\00", align 1
@go..C365 = internal constant { ptr, i64 } { ptr @const.172, i64 35 }
@go..C366 = internal constant [1 x ptr] [ptr @go_0llvm.Request..p]
@go..C367 = internal constant [1 x ptr] [ptr @uint16..d]
@go..C368 = internal constant [3 x %method.0] [%method.0 { ptr @go..C350, ptr null, ptr @type..func_8_9_8bool_9, ptr @type..func_8_2go_0llvm_0Request_9_8bool_9, ptr @go_0llvm.Request.Do }, %method.0 { ptr @go..C357, ptr null, ptr @type..func_8_9_8string_9, ptr @type..func_8_2go_0llvm_0Request_9_8string_9, ptr @go_0llvm.Request.Name }, %method.0 { ptr @go..C361, ptr null, ptr @type..func_8_9_8uint16_9, ptr @type..func_8_2go_0llvm_0Request_9_8uint16_9, ptr @go_0llvm.Request.QType }]
@go..C369 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.41 { ptr @go..C368, i64 3, i64 3 } }
@type.._2_2go_0llvm_0Request = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1086427239, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C370, ptr null, ptr null }, ptr @go_0llvm.Request..p }, comdat
@const.173 = private constant [24 x i8] c"**\09go.llvm\09llvm.Request\00", align 1
@go..C370 = internal constant { ptr, i64 } { ptr @const.173, i64 23 }
@go_0llvm.Request..d = constant %StructType.0 { %_type.0 { i64 128, i64 120, i32 -373342609, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.Request..eq..f, ptr @gcbits..pkva, ptr @go..C371, ptr @go..C375, ptr @go_0llvm.Request..p }, %IPST.43 { ptr @go..C400, i64 11, i64 11 } }
@go_0llvm.Request..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.Request..eq to i64) }
@gcbits..pkva = weak constant [2 x i8] c"OU", comdat
@const.174 = private constant [22 x i8] c"\09go.llvm\09llvm.Request\00", align 1
@go..C371 = internal constant { ptr, i64 } { ptr @const.174, i64 21 }
@const.175 = private constant [8 x i8] c"Request\00", align 1
@go..C372 = internal constant { ptr, i64 } { ptr @const.175, i64 7 }
@go..C373 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C374 = internal constant [1 x %method.0] zeroinitializer
@go..C375 = internal constant %uncommonType.0 { ptr @go..C372, ptr @go..C373, %IPST.41 { ptr @go..C374, i64 0, i64 0 } }
@const.176 = private constant [4 x i8] c"Req\00", align 1
@go..C376 = internal constant { ptr, i64 } { ptr @const.176, i64 3 }
@const.177 = private constant [2 x i8] c"W\00", align 1
@go..C377 = internal constant { ptr, i64 } { ptr @const.177, i64 1 }
@go..C378 = internal constant { ptr, i64 } { ptr @const.152, i64 4 }
@const.178 = private constant [5 x i8] c"size\00", align 1
@go..C379 = internal constant { ptr, i64 } { ptr @const.178, i64 4 }
@go..C380 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.179 = private constant [3 x i8] c"do\00", align 1
@go..C381 = internal constant { ptr, i64 } { ptr @const.179, i64 2 }
@go..C382 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.180 = private constant [7 x i8] c"family\00", align 1
@go..C383 = internal constant { ptr, i64 } { ptr @const.180, i64 6 }
@go..C384 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@int8..d = weak constant %_type.0 { i64 1, i64 0, i32 1812276124, i8 8, i8 1, i8 1, i8 -125, ptr @runtime.memequal8..f, ptr null, ptr @go..C385, ptr @go..C388, ptr @int8..p }, comdat
@const.181 = private constant [5 x i8] c"int8\00", align 1
@go..C385 = internal constant { ptr, i64 } { ptr @const.181, i64 4 }
@go..C386 = internal constant { ptr, i64 } { ptr @const.181, i64 4 }
@go..C387 = internal constant [1 x %method.0] zeroinitializer
@go..C388 = internal constant %uncommonType.0 { ptr @go..C386, ptr null, %IPST.41 { ptr @go..C387, i64 0, i64 0 } }
@int8..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1068353079, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C389, ptr null, ptr null }, ptr @int8..d }, comdat
@const.182 = private constant [6 x i8] c"*int8\00", align 1
@go..C389 = internal constant { ptr, i64 } { ptr @const.182, i64 5 }
@const.183 = private constant [5 x i8] c"name\00", align 1
@go..C390 = internal constant { ptr, i64 } { ptr @const.183, i64 4 }
@go..C391 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.184 = private constant [3 x i8] c"ip\00", align 1
@go..C392 = internal constant { ptr, i64 } { ptr @const.184, i64 2 }
@go..C393 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.185 = private constant [5 x i8] c"port\00", align 1
@go..C394 = internal constant { ptr, i64 } { ptr @const.185, i64 4 }
@go..C395 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.186 = private constant [10 x i8] c"localPort\00", align 1
@go..C396 = internal constant { ptr, i64 } { ptr @const.186, i64 9 }
@go..C397 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.187 = private constant [8 x i8] c"localIP\00", align 1
@go..C398 = internal constant { ptr, i64 } { ptr @const.187, i64 7 }
@go..C399 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C400 = internal constant [11 x %structField.0] [%structField.0 { ptr @go..C376, ptr null, ptr @go_0llvm.Msg..p, ptr null, i64 0 }, %structField.0 { ptr @go..C377, ptr null, ptr @go_0llvm.ResponseWriter..d, ptr null, i64 16 }, %structField.0 { ptr @go..C378, ptr null, ptr @string..d, ptr null, i64 48 }, %structField.0 { ptr @go..C379, ptr @go..C380, ptr @uint16..d, ptr null, i64 80 }, %structField.0 { ptr @go..C381, ptr @go..C382, ptr @bool..d, ptr null, i64 84 }, %structField.0 { ptr @go..C383, ptr @go..C384, ptr @int8..d, ptr null, i64 86 }, %structField.0 { ptr @go..C390, ptr @go..C391, ptr @string..d, ptr null, i64 96 }, %structField.0 { ptr @go..C392, ptr @go..C393, ptr @string..d, ptr null, i64 128 }, %structField.0 { ptr @go..C394, ptr @go..C395, ptr @string..d, ptr null, i64 160 }, %structField.0 { ptr @go..C396, ptr @go..C397, ptr @string..d, ptr null, i64 192 }, %structField.0 { ptr @go..C398, ptr @go..C399, ptr @string..d, ptr null, i64 224 }]
@go..C401 = internal constant [2 x ptr] [ptr @context.Context..d, ptr @go_0llvm.Request..p]
@go..C402 = internal constant [1 x ptr] [ptr @bool..d]
@const.188 = private constant [9 x i8] c"ViewName\00", align 1
@go..C403 = internal constant { ptr, i64 } { ptr @const.188, i64 8 }
@const.189 = private constant [12 x i8] c"ReadTimeout\00", align 1
@go..C404 = internal constant { ptr, i64 } { ptr @const.189, i64 11 }
@time.Duration..d = external constant %_type.0
@const.190 = private constant [13 x i8] c"WriteTimeout\00", align 1
@go..C405 = internal constant { ptr, i64 } { ptr @const.190, i64 12 }
@const.191 = private constant [12 x i8] c"IdleTimeout\00", align 1
@go..C406 = internal constant { ptr, i64 } { ptr @const.191, i64 11 }
@const.192 = private constant [11 x i8] c"TsigSecret\00", align 1
@go..C407 = internal constant { ptr, i64 } { ptr @const.192, i64 10 }
@type..map_6string_7string = weak constant %MapType.0 { %_type.0 { i64 8, i64 8, i32 297061700, i8 0, i8 8, i8 8, i8 53, ptr null, ptr @gcbits..ba, ptr @go..C408, ptr null, ptr null }, ptr @string..d, ptr @string..d, ptr @type..struct_4_4x_5topbits_b_68x_7uint8_ckeys_b_68x_7string_cvalues_b_68x_7string_coverflow_b_2_4void_5_5, ptr @runtime.strhash..f, i8 16, i8 16, i16 272, i32 12 }, comdat
@const.193 = private constant [18 x i8] c"map[string]string\00", align 1
@go..C408 = internal constant { ptr, i64 } { ptr @const.193, i64 17 }
@type..struct_4_4x_5topbits_b_68x_7uint8_ckeys_b_68x_7string_cvalues_b_68x_7string_coverflow_b_2_4void_5_5 = weak constant %StructType.0 { %_type.0 { i64 272, i64 272, i32 887229860, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..kvkvkvka, ptr @go..C409, ptr null, ptr null }, %IPST.43 { ptr @go..C414, i64 4, i64 4 } }, comdat
@gcbits..kvkvkvka = weak constant [5 x i8] c"\AA\AA\AA\AA\02", comdat
@const.194 = private constant [74 x i8] c"struct { topbits [8]uint8; keys [8]string; values [8]string; overflow * }\00", align 1
@go..C409 = internal constant { ptr, i64 } { ptr @const.194, i64 73 }
@go..C410 = internal constant { ptr, i64 } { ptr @const.136, i64 7 }
@go..C411 = internal constant { ptr, i64 } { ptr @const.138, i64 4 }
@go..C412 = internal constant { ptr, i64 } { ptr @const.141, i64 6 }
@go..C413 = internal constant { ptr, i64 } { ptr @const.144, i64 8 }
@go..C414 = internal constant [4 x %structField.0] [%structField.0 { ptr @go..C410, ptr null, ptr @type.._68x_7uint8, ptr null, i64 0 }, %structField.0 { ptr @go..C411, ptr null, ptr @type.._68x_7string, ptr null, i64 16 }, %structField.0 { ptr @go..C412, ptr null, ptr @type.._68x_7string, ptr null, i64 272 }, %structField.0 { ptr @go..C413, ptr null, ptr @unsafe.Pointer..d, ptr null, i64 528 }]
@const.195 = private constant [7 x i8] c"Plugin\00", align 1
@go..C415 = internal constant { ptr, i64 } { ptr @const.195, i64 6 }
@type.._6_7go_0llvm_0Plugin = weak constant %SliceType.0 { %_type.0 { i64 24, i64 8, i32 -1978908885, i8 0, i8 8, i8 8, i8 23, ptr null, ptr @gcbits..ba, ptr @go..C416, ptr null, ptr null }, ptr @go_0llvm.Plugin..d }, comdat
@const.196 = private constant [23 x i8] c"[]\09go.llvm\09llvm.Plugin\00", align 1
@go..C416 = internal constant { ptr, i64 } { ptr @const.196, i64 22 }
@go_0llvm.Plugin..d = constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1978908899, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C417, ptr @go..C421, ptr @go_0llvm.Plugin..p }, i8 0, %IPST.42 { ptr @go..C435, i64 1, i64 1 }, %IPST.42 { ptr @go..C436, i64 1, i64 1 } }
@const.197 = private constant [21 x i8] c"\09go.llvm\09llvm.Plugin\00", align 1
@go..C417 = internal constant { ptr, i64 } { ptr @const.197, i64 20 }
@go..C418 = internal constant { ptr, i64 } { ptr @const.195, i64 6 }
@go..C419 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C420 = internal constant [1 x %method.0] zeroinitializer
@go..C421 = internal constant %uncommonType.0 { ptr @go..C418, ptr @go..C419, %IPST.41 { ptr @go..C420, i64 0, i64 0 } }
@go_0llvm.Plugin..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1597771303, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C422, ptr null, ptr null }, ptr @go_0llvm.Plugin..d }, comdat
@const.198 = private constant [22 x i8] c"*\09go.llvm\09llvm.Plugin\00", align 1
@go..C422 = internal constant { ptr, i64 } { ptr @const.198, i64 21 }
@go_0llvm.Handler..d = constant %InterfaceType.0 { %_type.0 { i64 16, i64 16, i32 -1808603982, i8 0, i8 8, i8 8, i8 20, ptr @runtime.interequal..f, ptr @gcbits..da, ptr @go..C423, ptr @go..C427, ptr @go_0llvm.Handler..p }, %IPST.44 { ptr @go..C434, i64 2, i64 2 } }
@const.199 = private constant [22 x i8] c"\09go.llvm\09llvm.Handler\00", align 1
@go..C423 = internal constant { ptr, i64 } { ptr @const.199, i64 21 }
@const.200 = private constant [8 x i8] c"Handler\00", align 1
@go..C424 = internal constant { ptr, i64 } { ptr @const.200, i64 7 }
@go..C425 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C426 = internal constant [1 x %method.0] zeroinitializer
@go..C427 = internal constant %uncommonType.0 { ptr @go..C424, ptr @go..C425, %IPST.41 { ptr @go..C426, i64 0, i64 0 } }
@go_0llvm.Handler..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1127107369, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C428, ptr null, ptr null }, ptr @go_0llvm.Handler..d }, comdat
@const.201 = private constant [23 x i8] c"*\09go.llvm\09llvm.Handler\00", align 1
@go..C428 = internal constant { ptr, i64 } { ptr @const.201, i64 22 }
@go..C429 = internal constant { ptr, i64 } { ptr @const.9, i64 4 }
@const.202 = private constant [9 x i8] c"ServeDNS\00", align 1
@go..C430 = internal constant { ptr, i64 } { ptr @const.202, i64 8 }
@type..func_8context_0Context_3go_0llvm_0ResponseWriter_3_2go_0llvm_0Msg_9_8int_3error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -575564952, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C431, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C432, i64 3, i64 3 }, %IPST.42 { ptr @go..C433, i64 2, i64 2 } }, comdat
@const.203 = private constant [94 x i8] c"func(\09context\09context.Context, \09go.llvm\09llvm.ResponseWriter, *\09go.llvm\09llvm.Msg) (int, error)\00", align 1
@go..C431 = internal constant { ptr, i64 } { ptr @const.203, i64 93 }
@go..C432 = internal constant [3 x ptr] [ptr @context.Context..d, ptr @go_0llvm.ResponseWriter..d, ptr @go_0llvm.Msg..p]
@go..C433 = internal constant [2 x ptr] [ptr @int..d, ptr @error..d]
@go..C434 = internal constant [2 x %imethod.0] [%imethod.0 { ptr @go..C429, ptr null, ptr @type..func_8_9_8string_9 }, %imethod.0 { ptr @go..C430, ptr null, ptr @type..func_8context_0Context_3go_0llvm_0ResponseWriter_3_2go_0llvm_0Msg_9_8int_3error_9 }]
@go..C435 = internal constant [1 x ptr] [ptr @go_0llvm.Handler..d]
@go..C436 = internal constant [1 x ptr] [ptr @go_0llvm.Handler..d]
@const.204 = private constant [12 x i8] c"pluginChain\00", align 1
@go..C437 = internal constant { ptr, i64 } { ptr @const.204, i64 11 }
@go..C438 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.205 = private constant [9 x i8] c"registry\00", align 1
@go..C439 = internal constant { ptr, i64 } { ptr @const.205, i64 8 }
@go..C440 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..map_6string_7go_0llvm_0Handler = weak constant %MapType.0 { %_type.0 { i64 8, i64 8, i32 487410524, i8 0, i8 8, i8 8, i8 53, ptr null, ptr @gcbits..ba, ptr @go..C441, ptr null, ptr null }, ptr @string..d, ptr @go_0llvm.Handler..d, ptr @type..struct_4_4x_5topbits_b_68x_7uint8_ckeys_b_68x_7string_cvalues_b_68x_7go_0llvm_0Handler_coverflow_b_2_4void_5_5, ptr @runtime.strhash..f, i8 16, i8 16, i16 272, i32 12 }, comdat
@const.206 = private constant [33 x i8] c"map[string]\09go.llvm\09llvm.Handler\00", align 1
@go..C441 = internal constant { ptr, i64 } { ptr @const.206, i64 32 }
@type..struct_4_4x_5topbits_b_68x_7uint8_ckeys_b_68x_7string_cvalues_b_68x_7go_0llvm_0Handler_coverflow_b_2_4void_5_5 = weak constant %StructType.0 { %_type.0 { i64 272, i64 272, i32 -1611542364, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..kvkDFFpa, ptr @go..C442, ptr null, ptr null }, %IPST.43 { ptr @go..C449, i64 4, i64 4 } }, comdat
@gcbits..kvkDFFpa = weak constant [5 x i8] c"\AA\AA\FE\FF\03", comdat
@const.207 = private constant [89 x i8] c"struct { topbits [8]uint8; keys [8]string; values [8]\09go.llvm\09llvm.Handler; overflow * }\00", align 1
@go..C442 = internal constant { ptr, i64 } { ptr @const.207, i64 88 }
@go..C443 = internal constant { ptr, i64 } { ptr @const.136, i64 7 }
@go..C444 = internal constant { ptr, i64 } { ptr @const.138, i64 4 }
@go..C445 = internal constant { ptr, i64 } { ptr @const.141, i64 6 }
@type.._68x_7go_0llvm_0Handler = weak constant %ArrayType.0 { %_type.0 { i64 128, i64 128, i32 677759347, i8 0, i8 8, i8 8, i8 17, ptr null, ptr @gcbits..FFFb, ptr @go..C446, ptr null, ptr null }, ptr @go_0llvm.Handler..d, ptr @type.._6_7go_0llvm_0Handler, i64 8 }, comdat
@gcbits..FFFb = weak constant [2 x i8] c"\FF\FF", comdat
@const.208 = private constant [25 x i8] c"[8]\09go.llvm\09llvm.Handler\00", align 1
@go..C446 = internal constant { ptr, i64 } { ptr @const.208, i64 24 }
@type.._6_7go_0llvm_0Handler = weak constant %SliceType.0 { %_type.0 { i64 24, i64 8, i32 -1808603968, i8 0, i8 8, i8 8, i8 23, ptr null, ptr @gcbits..ba, ptr @go..C447, ptr null, ptr null }, ptr @go_0llvm.Handler..d }, comdat
@const.209 = private constant [24 x i8] c"[]\09go.llvm\09llvm.Handler\00", align 1
@go..C447 = internal constant { ptr, i64 } { ptr @const.209, i64 23 }
@go..C448 = internal constant { ptr, i64 } { ptr @const.144, i64 8 }
@go..C449 = internal constant [4 x %structField.0] [%structField.0 { ptr @go..C443, ptr null, ptr @type.._68x_7uint8, ptr null, i64 0 }, %structField.0 { ptr @go..C444, ptr null, ptr @type.._68x_7string, ptr null, i64 16 }, %structField.0 { ptr @go..C445, ptr null, ptr @type.._68x_7go_0llvm_0Handler, ptr null, i64 272 }, %structField.0 { ptr @go..C448, ptr null, ptr @unsafe.Pointer..d, ptr null, i64 528 }]
@const.210 = private constant [19 x i8] c"firstConfigInBlock\00", align 1
@go..C450 = internal constant { ptr, i64 } { ptr @const.210, i64 18 }
@go..C451 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.211 = private constant [14 x i8] c"metaCollector\00", align 1
@go..C452 = internal constant { ptr, i64 } { ptr @const.211, i64 13 }
@go..C453 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go_0llvm.MetadataCollector..d = constant %InterfaceType.0 { %_type.0 { i64 16, i64 16, i32 -1617574818, i8 0, i8 8, i8 8, i8 20, ptr @runtime.interequal..f, ptr @gcbits..da, ptr @go..C454, ptr @go..C458, ptr @go_0llvm.MetadataCollector..p }, %IPST.44 { ptr @go..C464, i64 1, i64 1 } }
@const.212 = private constant [32 x i8] c"\09go.llvm\09llvm.MetadataCollector\00", align 1
@go..C454 = internal constant { ptr, i64 } { ptr @const.212, i64 31 }
@const.213 = private constant [18 x i8] c"MetadataCollector\00", align 1
@go..C455 = internal constant { ptr, i64 } { ptr @const.213, i64 17 }
@go..C456 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C457 = internal constant [1 x %method.0] zeroinitializer
@go..C458 = internal constant %uncommonType.0 { ptr @go..C455, ptr @go..C456, %IPST.41 { ptr @go..C457, i64 0, i64 0 } }
@go_0llvm.MetadataCollector..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -111393303, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C459, ptr null, ptr null }, ptr @go_0llvm.MetadataCollector..d }, comdat
@const.214 = private constant [33 x i8] c"*\09go.llvm\09llvm.MetadataCollector\00", align 1
@go..C459 = internal constant { ptr, i64 } { ptr @const.214, i64 32 }
@const.215 = private constant [8 x i8] c"Collect\00", align 1
@go..C460 = internal constant { ptr, i64 } { ptr @const.215, i64 7 }
@type..func_8context_0Context_3go_0llvm_0Request_9_8context_0Context_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1528556520, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C461, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C462, i64 2, i64 2 }, %IPST.42 { ptr @go..C463, i64 1, i64 1 } }, comdat
@const.216 = private constant [79 x i8] c"func(\09context\09context.Context, \09go.llvm\09llvm.Request) \09context\09context.Context\00", align 1
@go..C461 = internal constant { ptr, i64 } { ptr @const.216, i64 78 }
@go..C462 = internal constant [2 x ptr] [ptr @context.Context..d, ptr @go_0llvm.Request..d]
@go..C463 = internal constant [1 x ptr] [ptr @context.Context..d]
@go..C464 = internal constant [1 x %imethod.0] [%imethod.0 { ptr @go..C460, ptr null, ptr @type..func_8context_0Context_3go_0llvm_0Request_9_8context_0Context_9 }]
@go..C465 = internal constant [19 x %structField.0] [%structField.0 { ptr @go..C330, ptr null, ptr @string..d, ptr null, i64 0 }, %structField.0 { ptr @go..C331, ptr null, ptr @type.._6_7string, ptr null, i64 32 }, %structField.0 { ptr @go..C332, ptr null, ptr @string..d, ptr null, i64 80 }, %structField.0 { ptr @go..C333, ptr null, ptr @string..d, ptr null, i64 112 }, %structField.0 { ptr @go..C334, ptr null, ptr @bool..d, ptr null, i64 144 }, %structField.0 { ptr @go..C335, ptr null, ptr @bool..d, ptr null, i64 146 }, %structField.0 { ptr @go..C336, ptr null, ptr @string..d, ptr null, i64 160 }, %structField.0 { ptr @go..C337, ptr null, ptr @type..func_8_2net_1http_0Request_9_8bool_9, ptr null, i64 192 }, %structField.0 { ptr @go..C341, ptr null, ptr @type.._6_7go_0llvm_0FilterFunc, ptr null, i64 208 }, %structField.0 { ptr @go..C403, ptr null, ptr @string..d, ptr null, i64 256 }, %structField.0 { ptr @go..C404, ptr null, ptr @time.Duration..d, ptr null, i64 288 }, %structField.0 { ptr @go..C405, ptr null, ptr @time.Duration..d, ptr null, i64 304 }, %structField.0 { ptr @go..C406, ptr null, ptr @time.Duration..d, ptr null, i64 320 }, %structField.0 { ptr @go..C407, ptr null, ptr @type..map_6string_7string, ptr null, i64 336 }, %structField.0 { ptr @go..C415, ptr null, ptr @type.._6_7go_0llvm_0Plugin, ptr null, i64 352 }, %structField.0 { ptr @go..C437, ptr @go..C438, ptr @go_0llvm.Handler..d, ptr null, i64 400 }, %structField.0 { ptr @go..C439, ptr @go..C440, ptr @type..map_6string_7go_0llvm_0Handler, ptr null, i64 432 }, %structField.0 { ptr @go..C450, ptr @go..C451, ptr @go_0llvm.Config..p, ptr null, i64 448 }, %structField.0 { ptr @go..C452, ptr @go..C453, ptr @go_0llvm.MetadataCollector..d, ptr null, i64 464 }]
@go_0llvm.HandlerFunc..d = constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1244774564, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C466, ptr @go..C470, ptr @go_0llvm.HandlerFunc..p }, i8 0, %IPST.42 { ptr @go..C472, i64 3, i64 3 }, %IPST.42 { ptr @go..C473, i64 2, i64 2 } }
@const.217 = private constant [26 x i8] c"\09go.llvm\09llvm.HandlerFunc\00", align 1
@go..C466 = internal constant { ptr, i64 } { ptr @const.217, i64 25 }
@const.218 = private constant [12 x i8] c"HandlerFunc\00", align 1
@go..C467 = internal constant { ptr, i64 } { ptr @const.218, i64 11 }
@go..C468 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C469 = internal constant [1 x %method.0] zeroinitializer
@go..C470 = internal constant %uncommonType.0 { ptr @go..C467, ptr @go..C468, %IPST.41 { ptr @go..C469, i64 0, i64 0 } }
@go_0llvm.HandlerFunc..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1558443447, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C471, ptr null, ptr null }, ptr @go_0llvm.HandlerFunc..d }, comdat
@const.219 = private constant [27 x i8] c"*\09go.llvm\09llvm.HandlerFunc\00", align 1
@go..C471 = internal constant { ptr, i64 } { ptr @const.219, i64 26 }
@go..C472 = internal constant [3 x ptr] [ptr @context.Context..d, ptr @go_0llvm.ResponseWriter..d, ptr @go_0llvm.Msg..p]
@go..C473 = internal constant [2 x ptr] [ptr @int..d, ptr @error..d]
@go_0llvm.ScrubWriter..d = constant %StructType.0 { %_type.0 { i64 24, i64 24, i32 834123378, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.ScrubWriter..eq..f, ptr @gcbits..ha, ptr @go..C474, ptr @go..C504, ptr @go_0llvm.ScrubWriter..p }, %IPST.43 { ptr @go..C538, i64 2, i64 2 } }
@go_0llvm.ScrubWriter..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.ScrubWriter..eq to i64) }
@gcbits..ha = weak constant [1 x i8] c"\07", comdat
@const.220 = private constant [26 x i8] c"\09go.llvm\09llvm.ScrubWriter\00", align 1
@go..C474 = internal constant { ptr, i64 } { ptr @const.220, i64 25 }
@const.221 = private constant [12 x i8] c"ScrubWriter\00", align 1
@go..C475 = internal constant { ptr, i64 } { ptr @const.221, i64 11 }
@go..C476 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C477 = internal constant { ptr, i64 } { ptr @const.77, i64 5 }
@type..func_8go_0llvm_0ScrubWriter_9_8error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 2110882824, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C478, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C479, i64 1, i64 1 }, %IPST.42 { ptr @go..C480, i64 1, i64 1 } }, comdat
@const.222 = private constant [38 x i8] c"func(\09go.llvm\09llvm.ScrubWriter) error\00", align 1
@go..C478 = internal constant { ptr, i64 } { ptr @const.222, i64 37 }
@go..C479 = internal constant [1 x ptr] [ptr @go_0llvm.ScrubWriter..d]
@go..C480 = internal constant [1 x ptr] [ptr @error..d]
@go..C481 = internal constant { ptr, i64 } { ptr @const.83, i64 6 }
@type..func_8go_0llvm_0ScrubWriter_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 922144328, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C482, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C483, i64 1, i64 1 }, %IPST.42 { ptr @go..C484, i64 0, i64 0 } }, comdat
@const.223 = private constant [32 x i8] c"func(\09go.llvm\09llvm.ScrubWriter)\00", align 1
@go..C482 = internal constant { ptr, i64 } { ptr @const.223, i64 31 }
@go..C483 = internal constant [1 x ptr] [ptr @go_0llvm.ScrubWriter..d]
@go..C484 = internal constant [1 x ptr] zeroinitializer
@go..C485 = internal constant { ptr, i64 } { ptr @const.85, i64 9 }
@type..func_8go_0llvm_0ScrubWriter_9_8net_0Addr_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 955902984, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C486, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C487, i64 1, i64 1 }, %IPST.42 { ptr @go..C488, i64 1, i64 1 } }, comdat
@const.224 = private constant [46 x i8] c"func(\09go.llvm\09llvm.ScrubWriter) \09net\09net.Addr\00", align 1
@go..C486 = internal constant { ptr, i64 } { ptr @const.224, i64 45 }
@go..C487 = internal constant [1 x ptr] [ptr @go_0llvm.ScrubWriter..d]
@go..C488 = internal constant [1 x ptr] [ptr @net.Addr..d]
@go..C489 = internal constant { ptr, i64 } { ptr @const.87, i64 10 }
@go..C490 = internal constant { ptr, i64 } { ptr @const.88, i64 10 }
@go..C491 = internal constant { ptr, i64 } { ptr @const.89, i64 14 }
@type..func_8go_0llvm_0ScrubWriter_3bool_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 560280200, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C492, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C493, i64 2, i64 2 }, %IPST.42 { ptr @go..C494, i64 0, i64 0 } }, comdat
@const.225 = private constant [38 x i8] c"func(\09go.llvm\09llvm.ScrubWriter, bool)\00", align 1
@go..C492 = internal constant { ptr, i64 } { ptr @const.225, i64 37 }
@go..C493 = internal constant [2 x ptr] [ptr @go_0llvm.ScrubWriter..d, ptr @bool..d]
@go..C494 = internal constant [1 x ptr] zeroinitializer
@go..C495 = internal constant { ptr, i64 } { ptr @const.93, i64 5 }
@type..func_8go_0llvm_0ScrubWriter_3_6_7uint8_9_8int_3error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -964277240, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C496, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C497, i64 2, i64 2 }, %IPST.42 { ptr @go..C498, i64 2, i64 2 } }, comdat
@const.226 = private constant [54 x i8] c"func(\09go.llvm\09llvm.ScrubWriter, []uint8) (int, error)\00", align 1
@go..C496 = internal constant { ptr, i64 } { ptr @const.226, i64 53 }
@go..C497 = internal constant [2 x ptr] [ptr @go_0llvm.ScrubWriter..d, ptr @type.._6_7uint8]
@go..C498 = internal constant [2 x ptr] [ptr @int..d, ptr @error..d]
@go..C499 = internal constant { ptr, i64 } { ptr @const.100, i64 8 }
@type..func_8go_0llvm_0ScrubWriter_3_2go_0llvm_0Msg_9_8error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1748337224, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C500, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C501, i64 2, i64 2 }, %IPST.42 { ptr @go..C502, i64 1, i64 1 } }, comdat
@const.227 = private constant [58 x i8] c"func(\09go.llvm\09llvm.ScrubWriter, *\09go.llvm\09llvm.Msg) error\00", align 1
@go..C500 = internal constant { ptr, i64 } { ptr @const.227, i64 57 }
@go..C501 = internal constant [2 x ptr] [ptr @go_0llvm.ScrubWriter..d, ptr @go_0llvm.Msg..p]
@go..C502 = internal constant [1 x ptr] [ptr @error..d]
@go..C503 = internal constant [8 x %method.0] [%method.0 { ptr @go..C477, ptr null, ptr @type..func_8_9_8error_9, ptr @type..func_8go_0llvm_0ScrubWriter_9_8error_9, ptr @go_0llvm.ScrubWriter.Close..stub }, %method.0 { ptr @go..C481, ptr null, ptr @type..func_8_9_8_9, ptr @type..func_8go_0llvm_0ScrubWriter_9_8_9, ptr @go_0llvm.ScrubWriter.Hijack..stub }, %method.0 { ptr @go..C485, ptr null, ptr @type..func_8_9_8net_0Addr_9, ptr @type..func_8go_0llvm_0ScrubWriter_9_8net_0Addr_9, ptr @go_0llvm.ScrubWriter.LocalAddr..stub }, %method.0 { ptr @go..C489, ptr null, ptr @type..func_8_9_8net_0Addr_9, ptr @type..func_8go_0llvm_0ScrubWriter_9_8net_0Addr_9, ptr @go_0llvm.ScrubWriter.RemoteAddr..stub }, %method.0 { ptr @go..C490, ptr null, ptr @type..func_8_9_8error_9, ptr @type..func_8go_0llvm_0ScrubWriter_9_8error_9, ptr @go_0llvm.ScrubWriter.TsigStatus..stub }, %method.0 { ptr @go..C491, ptr null, ptr @type..func_8bool_9_8_9, ptr @type..func_8go_0llvm_0ScrubWriter_3bool_9_8_9, ptr @go_0llvm.ScrubWriter.TsigTimersOnly..stub }, %method.0 { ptr @go..C495, ptr null, ptr @type..func_8_6_7uint8_9_8int_3error_9, ptr @type..func_8go_0llvm_0ScrubWriter_3_6_7uint8_9_8int_3error_9, ptr @go_0llvm.ScrubWriter.Write..stub }, %method.0 { ptr @go..C499, ptr null, ptr @type..func_8_2go_0llvm_0Msg_9_8error_9, ptr @type..func_8go_0llvm_0ScrubWriter_3_2go_0llvm_0Msg_9_8error_9, ptr @go_0llvm.ScrubWriter.WriteMsg..stub }]
@go..C504 = internal constant %uncommonType.0 { ptr @go..C475, ptr @go..C476, %IPST.41 { ptr @go..C503, i64 8, i64 8 } }
@go_0llvm.ScrubWriter..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 461072169, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C505, ptr @go..C533, ptr @type.._2_2go_0llvm_0ScrubWriter }, ptr @go_0llvm.ScrubWriter..d }, comdat
@const.228 = private constant [27 x i8] c"*\09go.llvm\09llvm.ScrubWriter\00", align 1
@go..C505 = internal constant { ptr, i64 } { ptr @const.228, i64 26 }
@go..C506 = internal constant { ptr, i64 } { ptr @const.77, i64 5 }
@type..func_8_2go_0llvm_0ScrubWriter_9_8error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1236821272, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C507, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C508, i64 1, i64 1 }, %IPST.42 { ptr @go..C509, i64 1, i64 1 } }, comdat
@const.229 = private constant [39 x i8] c"func(*\09go.llvm\09llvm.ScrubWriter) error\00", align 1
@go..C507 = internal constant { ptr, i64 } { ptr @const.229, i64 38 }
@go..C508 = internal constant [1 x ptr] [ptr @go_0llvm.ScrubWriter..p]
@go..C509 = internal constant [1 x ptr] [ptr @error..d]
@go..C510 = internal constant { ptr, i64 } { ptr @const.83, i64 6 }
@type..func_8_2go_0llvm_0ScrubWriter_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1869407528, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C511, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C512, i64 1, i64 1 }, %IPST.42 { ptr @go..C513, i64 0, i64 0 } }, comdat
@const.230 = private constant [33 x i8] c"func(*\09go.llvm\09llvm.ScrubWriter)\00", align 1
@go..C511 = internal constant { ptr, i64 } { ptr @const.230, i64 32 }
@go..C512 = internal constant [1 x ptr] [ptr @go_0llvm.ScrubWriter..p]
@go..C513 = internal constant [1 x ptr] zeroinitializer
@go..C514 = internal constant { ptr, i64 } { ptr @const.85, i64 9 }
@type..func_8_2go_0llvm_0ScrubWriter_9_8net_0Addr_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1903166184, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C515, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C516, i64 1, i64 1 }, %IPST.42 { ptr @go..C517, i64 1, i64 1 } }, comdat
@const.231 = private constant [47 x i8] c"func(*\09go.llvm\09llvm.ScrubWriter) \09net\09net.Addr\00", align 1
@go..C515 = internal constant { ptr, i64 } { ptr @const.231, i64 46 }
@go..C516 = internal constant [1 x ptr] [ptr @go_0llvm.ScrubWriter..p]
@go..C517 = internal constant [1 x ptr] [ptr @net.Addr..d]
@go..C518 = internal constant { ptr, i64 } { ptr @const.87, i64 10 }
@go..C519 = internal constant { ptr, i64 } { ptr @const.88, i64 10 }
@go..C520 = internal constant { ptr, i64 } { ptr @const.89, i64 14 }
@type..func_8_2go_0llvm_0ScrubWriter_3bool_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1507543400, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C521, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C522, i64 2, i64 2 }, %IPST.42 { ptr @go..C523, i64 0, i64 0 } }, comdat
@const.232 = private constant [39 x i8] c"func(*\09go.llvm\09llvm.ScrubWriter, bool)\00", align 1
@go..C521 = internal constant { ptr, i64 } { ptr @const.232, i64 38 }
@go..C522 = internal constant [2 x ptr] [ptr @go_0llvm.ScrubWriter..p, ptr @bool..d]
@go..C523 = internal constant [1 x ptr] zeroinitializer
@go..C524 = internal constant { ptr, i64 } { ptr @const.93, i64 5 }
@type..func_8_2go_0llvm_0ScrubWriter_3_6_7uint8_9_8int_3error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -17014040, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C525, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C526, i64 2, i64 2 }, %IPST.42 { ptr @go..C527, i64 2, i64 2 } }, comdat
@const.233 = private constant [55 x i8] c"func(*\09go.llvm\09llvm.ScrubWriter, []uint8) (int, error)\00", align 1
@go..C525 = internal constant { ptr, i64 } { ptr @const.233, i64 54 }
@go..C526 = internal constant [2 x ptr] [ptr @go_0llvm.ScrubWriter..p, ptr @type.._6_7uint8]
@go..C527 = internal constant [2 x ptr] [ptr @int..d, ptr @error..d]
@go..C528 = internal constant { ptr, i64 } { ptr @const.100, i64 8 }
@type..func_8_2go_0llvm_0ScrubWriter_3_2go_0llvm_0Msg_9_8error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1599366872, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C529, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C530, i64 2, i64 2 }, %IPST.42 { ptr @go..C531, i64 1, i64 1 } }, comdat
@const.234 = private constant [59 x i8] c"func(*\09go.llvm\09llvm.ScrubWriter, *\09go.llvm\09llvm.Msg) error\00", align 1
@go..C529 = internal constant { ptr, i64 } { ptr @const.234, i64 58 }
@go..C530 = internal constant [2 x ptr] [ptr @go_0llvm.ScrubWriter..p, ptr @go_0llvm.Msg..p]
@go..C531 = internal constant [1 x ptr] [ptr @error..d]
@go..C532 = internal constant [8 x %method.0] [%method.0 { ptr @go..C506, ptr null, ptr @type..func_8_9_8error_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_9_8error_9, ptr @go_0llvm.ScrubWriter.Close..stub }, %method.0 { ptr @go..C510, ptr null, ptr @type..func_8_9_8_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_9_8_9, ptr @go_0llvm.ScrubWriter.Hijack..stub }, %method.0 { ptr @go..C514, ptr null, ptr @type..func_8_9_8net_0Addr_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_9_8net_0Addr_9, ptr @go_0llvm.ScrubWriter.LocalAddr..stub }, %method.0 { ptr @go..C518, ptr null, ptr @type..func_8_9_8net_0Addr_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_9_8net_0Addr_9, ptr @go_0llvm.ScrubWriter.RemoteAddr..stub }, %method.0 { ptr @go..C519, ptr null, ptr @type..func_8_9_8error_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_9_8error_9, ptr @go_0llvm.ScrubWriter.TsigStatus..stub }, %method.0 { ptr @go..C520, ptr null, ptr @type..func_8bool_9_8_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_3bool_9_8_9, ptr @go_0llvm.ScrubWriter.TsigTimersOnly..stub }, %method.0 { ptr @go..C524, ptr null, ptr @type..func_8_6_7uint8_9_8int_3error_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_3_6_7uint8_9_8int_3error_9, ptr @go_0llvm.ScrubWriter.Write..stub }, %method.0 { ptr @go..C528, ptr null, ptr @type..func_8_2go_0llvm_0Msg_9_8error_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_3_2go_0llvm_0Msg_9_8error_9, ptr @go_0llvm.ScrubWriter.WriteMsg..stub }]
@go..C533 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.41 { ptr @go..C532, i64 8, i64 8 } }
@type.._2_2go_0llvm_0ScrubWriter = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1212779879, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C534, ptr null, ptr null }, ptr @go_0llvm.ScrubWriter..p }, comdat
@const.235 = private constant [28 x i8] c"**\09go.llvm\09llvm.ScrubWriter\00", align 1
@go..C534 = internal constant { ptr, i64 } { ptr @const.235, i64 27 }
@go..C535 = internal constant { ptr, i64 } { ptr @const.75, i64 14 }
@const.236 = private constant [4 x i8] c"req\00", align 1
@go..C536 = internal constant { ptr, i64 } { ptr @const.236, i64 3 }
@go..C537 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C538 = internal constant [2 x %structField.0] [%structField.0 { ptr @go..C535, ptr null, ptr @go_0llvm.ResponseWriter..d, ptr null, i64 1 }, %structField.0 { ptr @go..C536, ptr @go..C537, ptr @go_0llvm.Msg..p, ptr null, i64 32 }]
@go_0llvm.OPT..d = constant %StructType.0 { %_type.0 { i64 56, i64 40, i32 -1484427225, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..ra, ptr @go..C539, ptr @go..C543, ptr @go_0llvm.OPT..p }, %IPST.43 { ptr @go..C573, i64 2, i64 2 } }
@const.237 = private constant [18 x i8] c"\09go.llvm\09llvm.OPT\00", align 1
@go..C539 = internal constant { ptr, i64 } { ptr @const.237, i64 17 }
@const.238 = private constant [4 x i8] c"OPT\00", align 1
@go..C540 = internal constant { ptr, i64 } { ptr @const.238, i64 3 }
@go..C541 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C542 = internal constant [1 x %method.0] zeroinitializer
@go..C543 = internal constant %uncommonType.0 { ptr @go..C540, ptr @go..C541, %IPST.41 { ptr @go..C542, i64 0, i64 0 } }
@go_0llvm.OPT..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 2018968185, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C544, ptr null, ptr null }, ptr @go_0llvm.OPT..d }, comdat
@const.239 = private constant [19 x i8] c"*\09go.llvm\09llvm.OPT\00", align 1
@go..C544 = internal constant { ptr, i64 } { ptr @const.239, i64 18 }
@go..C545 = internal constant { ptr, i64 } { ptr @const.29, i64 3 }
@const.240 = private constant [7 x i8] c"Option\00", align 1
@go..C546 = internal constant { ptr, i64 } { ptr @const.240, i64 6 }
@type.._6_7go_0llvm_0EDNS0 = weak constant %SliceType.0 { %_type.0 { i64 24, i64 8, i32 -1540696682, i8 0, i8 8, i8 8, i8 23, ptr null, ptr @gcbits..ba, ptr @go..C547, ptr null, ptr null }, ptr @go_0llvm.EDNS0..d }, comdat
@const.241 = private constant [22 x i8] c"[]\09go.llvm\09llvm.EDNS0\00", align 1
@go..C547 = internal constant { ptr, i64 } { ptr @const.241, i64 21 }
@go_0llvm.EDNS0..d = constant %InterfaceType.0 { %_type.0 { i64 16, i64 16, i32 -1540696696, i8 0, i8 8, i8 8, i8 20, ptr @runtime.interequal..f, ptr @gcbits..da, ptr @go..C548, ptr @go..C552, ptr @go_0llvm.EDNS0..p }, %IPST.44 { ptr @go..C571, i64 5, i64 5 } }
@const.242 = private constant [20 x i8] c"\09go.llvm\09llvm.EDNS0\00", align 1
@go..C548 = internal constant { ptr, i64 } { ptr @const.242, i64 19 }
@const.243 = private constant [6 x i8] c"EDNS0\00", align 1
@go..C549 = internal constant { ptr, i64 } { ptr @const.243, i64 5 }
@go..C550 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C551 = internal constant [1 x %method.0] zeroinitializer
@go..C552 = internal constant %uncommonType.0 { ptr @go..C549, ptr @go..C550, %IPST.41 { ptr @go..C551, i64 0, i64 0 } }
@go_0llvm.EDNS0..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1118656649, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C553, ptr null, ptr null }, ptr @go_0llvm.EDNS0..d }, comdat
@const.244 = private constant [21 x i8] c"*\09go.llvm\09llvm.EDNS0\00", align 1
@go..C553 = internal constant { ptr, i64 } { ptr @const.244, i64 20 }
@go..C554 = internal constant { ptr, i64 } { ptr @const.240, i64 6 }
@const.245 = private constant [7 x i8] c"String\00", align 1
@go..C555 = internal constant { ptr, i64 } { ptr @const.245, i64 6 }
@go..C556 = internal constant { ptr, i64 } { ptr @const.22, i64 4 }
@go..C557 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8_9_8go_0llvm_0EDNS0_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 179659272, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C558, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C559, i64 0, i64 0 }, %IPST.42 { ptr @go..C560, i64 1, i64 1 } }, comdat
@const.246 = private constant [27 x i8] c"func() \09go.llvm\09llvm.EDNS0\00", align 1
@go..C558 = internal constant { ptr, i64 } { ptr @const.246, i64 26 }
@go..C559 = internal constant [1 x ptr] zeroinitializer
@go..C560 = internal constant [1 x ptr] [ptr @go_0llvm.EDNS0..d]
@const.247 = private constant [5 x i8] c"pack\00", align 1
@go..C561 = internal constant { ptr, i64 } { ptr @const.247, i64 4 }
@go..C562 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8_9_8_6_7uint8_3error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 2134062408, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C563, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C564, i64 0, i64 0 }, %IPST.42 { ptr @go..C565, i64 2, i64 2 } }, comdat
@const.248 = private constant [24 x i8] c"func() ([]uint8, error)\00", align 1
@go..C563 = internal constant { ptr, i64 } { ptr @const.248, i64 23 }
@go..C564 = internal constant [1 x ptr] zeroinitializer
@go..C565 = internal constant [2 x ptr] [ptr @type.._6_7uint8, ptr @error..d]
@const.249 = private constant [7 x i8] c"unpack\00", align 1
@go..C566 = internal constant { ptr, i64 } { ptr @const.249, i64 6 }
@go..C567 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8_6_7uint8_9_8error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1067031208, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C568, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C569, i64 1, i64 1 }, %IPST.42 { ptr @go..C570, i64 1, i64 1 } }, comdat
@const.250 = private constant [20 x i8] c"func([]uint8) error\00", align 1
@go..C568 = internal constant { ptr, i64 } { ptr @const.250, i64 19 }
@go..C569 = internal constant [1 x ptr] [ptr @type.._6_7uint8]
@go..C570 = internal constant [1 x ptr] [ptr @error..d]
@go..C571 = internal constant [5 x %imethod.0] [%imethod.0 { ptr @go..C554, ptr null, ptr @type..func_8_9_8uint16_9 }, %imethod.0 { ptr @go..C555, ptr null, ptr @type..func_8_9_8string_9 }, %imethod.0 { ptr @go..C556, ptr @go..C557, ptr @type..func_8_9_8go_0llvm_0EDNS0_9 }, %imethod.0 { ptr @go..C561, ptr @go..C562, ptr @type..func_8_9_8_6_7uint8_3error_9 }, %imethod.0 { ptr @go..C566, ptr @go..C567, ptr @type..func_8_6_7uint8_9_8error_9 }]
@const.251 = private constant [10 x i8] c"dns:\22opt\22\00", align 1
@go..C572 = internal constant { ptr, i64 } { ptr @const.251, i64 9 }
@go..C573 = internal constant [2 x %structField.0] [%structField.0 { ptr @go..C545, ptr null, ptr @go_0llvm.RR__Header..d, ptr null, i64 0 }, %structField.0 { ptr @go..C546, ptr null, ptr @type.._6_7go_0llvm_0EDNS0, ptr @go..C572, i64 64 }]
@go_0llvm.supported..d = constant %StructType.0 { %_type.0 { i64 32, i64 8, i32 -1967664972, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..ba, ptr @go..C574, ptr @go..C578, ptr @go_0llvm.supported..p }, %IPST.43 { ptr @go..C629, i64 2, i64 2 } }
@const.252 = private constant [24 x i8] c"\09go.llvm\09llvm.supported\00", align 1
@go..C574 = internal constant { ptr, i64 } { ptr @const.252, i64 23 }
@const.253 = private constant [10 x i8] c"supported\00", align 1
@go..C575 = internal constant { ptr, i64 } { ptr @const.253, i64 9 }
@go..C576 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C577 = internal constant [1 x %method.0] zeroinitializer
@go..C578 = internal constant %uncommonType.0 { ptr @go..C575, ptr @go..C576, %IPST.41 { ptr @go..C577, i64 0, i64 0 } }
@go_0llvm.supported..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1417868471, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C579, ptr @go..C608, ptr @type.._2_2go_0llvm_0supported }, ptr @go_0llvm.supported..d }, comdat
@const.254 = private constant [25 x i8] c"*\09go.llvm\09llvm.supported\00", align 1
@go..C579 = internal constant { ptr, i64 } { ptr @const.254, i64 24 }
@const.255 = private constant [5 x i8] c"Lock\00", align 1
@go..C580 = internal constant { ptr, i64 } { ptr @const.255, i64 4 }
@type..func_8_2go_0llvm_0supported_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1872849192, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C581, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C582, i64 1, i64 1 }, %IPST.42 { ptr @go..C583, i64 0, i64 0 } }, comdat
@const.256 = private constant [31 x i8] c"func(*\09go.llvm\09llvm.supported)\00", align 1
@go..C581 = internal constant { ptr, i64 } { ptr @const.256, i64 30 }
@go..C582 = internal constant [1 x ptr] [ptr @go_0llvm.supported..p]
@go..C583 = internal constant [1 x ptr] zeroinitializer
@const.257 = private constant [6 x i8] c"RLock\00", align 1
@go..C584 = internal constant { ptr, i64 } { ptr @const.257, i64 5 }
@const.258 = private constant [8 x i8] c"RLocker\00", align 1
@go..C585 = internal constant { ptr, i64 } { ptr @const.258, i64 7 }
@type..func_8_9_8sync_0Locker_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -854692856, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C586, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C587, i64 0, i64 0 }, %IPST.42 { ptr @go..C588, i64 1, i64 1 } }, comdat
@const.259 = private constant [25 x i8] c"func() \09sync\09sync.Locker\00", align 1
@go..C586 = internal constant { ptr, i64 } { ptr @const.259, i64 24 }
@go..C587 = internal constant [1 x ptr] zeroinitializer
@sync.Locker..d = external constant %InterfaceType.0
@go..C588 = internal constant [1 x ptr] [ptr @sync.Locker..d]
@type..func_8_2go_0llvm_0supported_9_8sync_0Locker_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1018156328, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C589, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C590, i64 1, i64 1 }, %IPST.42 { ptr @go..C591, i64 1, i64 1 } }, comdat
@const.260 = private constant [49 x i8] c"func(*\09go.llvm\09llvm.supported) \09sync\09sync.Locker\00", align 1
@go..C589 = internal constant { ptr, i64 } { ptr @const.260, i64 48 }
@go..C590 = internal constant [1 x ptr] [ptr @go_0llvm.supported..p]
@go..C591 = internal constant [1 x ptr] [ptr @sync.Locker..d]
@const.261 = private constant [8 x i8] c"RUnlock\00", align 1
@go..C592 = internal constant { ptr, i64 } { ptr @const.261, i64 7 }
@const.262 = private constant [7 x i8] c"Unlock\00", align 1
@go..C593 = internal constant { ptr, i64 } { ptr @const.262, i64 6 }
@const.263 = private constant [12 x i8] c"rUnlockSlow\00", align 1
@go..C594 = internal constant { ptr, i64 } { ptr @const.263, i64 11 }
@const.264 = private constant [5 x i8] c"sync\00", align 1
@go..C595 = internal constant { ptr, i64 } { ptr @const.264, i64 4 }
@type..func_8int32_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1622961576, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C596, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C602, i64 1, i64 1 }, %IPST.42 { ptr @go..C603, i64 0, i64 0 } }, comdat
@const.265 = private constant [12 x i8] c"func(int32)\00", align 1
@go..C596 = internal constant { ptr, i64 } { ptr @const.265, i64 11 }
@int32..d = weak constant %_type.0 { i64 4, i64 0, i32 -1157242003, i8 8, i8 4, i8 4, i8 -123, ptr @runtime.memequal32..f, ptr null, ptr @go..C597, ptr @go..C600, ptr @int32..p }, comdat
@const.266 = private constant [6 x i8] c"int32\00", align 1
@go..C597 = internal constant { ptr, i64 } { ptr @const.266, i64 5 }
@go..C598 = internal constant { ptr, i64 } { ptr @const.266, i64 5 }
@go..C599 = internal constant [1 x %method.0] zeroinitializer
@go..C600 = internal constant %uncommonType.0 { ptr @go..C598, ptr null, %IPST.41 { ptr @go..C599, i64 0, i64 0 } }
@int32..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1336002855, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C601, ptr null, ptr null }, ptr @int32..d }, comdat
@const.267 = private constant [7 x i8] c"*int32\00", align 1
@go..C601 = internal constant { ptr, i64 } { ptr @const.267, i64 6 }
@go..C602 = internal constant [1 x ptr] [ptr @int32..d]
@go..C603 = internal constant [1 x ptr] zeroinitializer
@type..func_8_2go_0llvm_0supported_3int32_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 823805032, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C604, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C605, i64 2, i64 2 }, %IPST.42 { ptr @go..C606, i64 0, i64 0 } }, comdat
@const.268 = private constant [38 x i8] c"func(*\09go.llvm\09llvm.supported, int32)\00", align 1
@go..C604 = internal constant { ptr, i64 } { ptr @const.268, i64 37 }
@go..C605 = internal constant [2 x ptr] [ptr @go_0llvm.supported..p, ptr @int32..d]
@go..C606 = internal constant [1 x ptr] zeroinitializer
@go..C607 = internal constant [6 x %method.0] [%method.0 { ptr @go..C580, ptr null, ptr @type..func_8_9_8_9, ptr @type..func_8_2go_0llvm_0supported_9_8_9, ptr @go_0llvm.supported.Lock..stub }, %method.0 { ptr @go..C584, ptr null, ptr @type..func_8_9_8_9, ptr @type..func_8_2go_0llvm_0supported_9_8_9, ptr @go_0llvm.supported.RLock..stub }, %method.0 { ptr @go..C585, ptr null, ptr @type..func_8_9_8sync_0Locker_9, ptr @type..func_8_2go_0llvm_0supported_9_8sync_0Locker_9, ptr @go_0llvm.supported.RLocker..stub }, %method.0 { ptr @go..C592, ptr null, ptr @type..func_8_9_8_9, ptr @type..func_8_2go_0llvm_0supported_9_8_9, ptr @go_0llvm.supported.RUnlock..stub }, %method.0 { ptr @go..C593, ptr null, ptr @type..func_8_9_8_9, ptr @type..func_8_2go_0llvm_0supported_9_8_9, ptr @go_0llvm.supported.Unlock..stub }, %method.0 { ptr @go..C594, ptr @go..C595, ptr @type..func_8int32_9_8_9, ptr @type..func_8_2go_0llvm_0supported_3int32_9_8_9, ptr @go_0llvm.supported.sync_0rUnlockSlow..stub }]
@go..C608 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.41 { ptr @go..C607, i64 6, i64 6 } }
@type.._2_2go_0llvm_0supported = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1211059047, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C609, ptr null, ptr null }, ptr @go_0llvm.supported..p }, comdat
@const.269 = private constant [26 x i8] c"**\09go.llvm\09llvm.supported\00", align 1
@go..C609 = internal constant { ptr, i64 } { ptr @const.269, i64 25 }
@const.270 = private constant [2 x i8] c"m\00", align 1
@go..C610 = internal constant { ptr, i64 } { ptr @const.270, i64 1 }
@go..C611 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..map_6uint16_7struct_4_5 = weak constant %MapType.0 { %_type.0 { i64 8, i64 8, i32 76732316, i8 0, i8 8, i8 8, i8 53, ptr null, ptr @gcbits..ba, ptr @go..C612, ptr null, ptr null }, ptr @uint16..d, ptr @type..struct_4_5, ptr @type..struct_4_4x_5topbits_b_68x_7uint8_ckeys_b_68x_7uint16_cvalues_b_68x_7struct_4_5_coverflow_buintptr_5, ptr @runtime.memhash16..f, i8 2, i8 0, i16 32, i32 4 }, comdat
@const.271 = private constant [21 x i8] c"map[uint16]struct {}\00", align 1
@go..C612 = internal constant { ptr, i64 } { ptr @const.271, i64 20 }
@type..struct_4_5 = weak constant %StructType.0 { %_type.0 { i64 0, i64 0, i32 12, i8 8, i8 1, i8 1, i8 -103, ptr @runtime.memequal0..f, ptr null, ptr @go..C613, ptr null, ptr null }, %IPST.43 { ptr @go..C614, i64 0, i64 0 } }, comdat
@runtime.memequal0..f = external constant %functionDescriptor.0
@const.272 = private constant [10 x i8] c"struct {}\00", align 1
@go..C613 = internal constant { ptr, i64 } { ptr @const.272, i64 9 }
@go..C614 = internal constant [1 x %structField.0] zeroinitializer
@type..struct_4_4x_5topbits_b_68x_7uint8_ckeys_b_68x_7uint16_cvalues_b_68x_7struct_4_5_coverflow_buintptr_5 = weak constant %StructType.0 { %_type.0 { i64 32, i64 0, i32 1108425716, i8 8, i8 8, i8 8, i8 -103, ptr null, ptr null, ptr @go..C615, ptr null, ptr null }, %IPST.43 { ptr @go..C627, i64 4, i64 4 } }, comdat
@const.273 = private constant [83 x i8] c"struct { topbits [8]uint8; keys [8]uint16; values [8]struct {}; overflow uintptr }\00", align 1
@go..C615 = internal constant { ptr, i64 } { ptr @const.273, i64 82 }
@go..C616 = internal constant { ptr, i64 } { ptr @const.136, i64 7 }
@go..C617 = internal constant { ptr, i64 } { ptr @const.138, i64 4 }
@go..C618 = internal constant { ptr, i64 } { ptr @const.141, i64 6 }
@type.._68x_7struct_4_5 = weak constant %ArrayType.0 { %_type.0 { i64 0, i64 0, i32 39, i8 8, i8 1, i8 1, i8 -111, ptr null, ptr null, ptr @go..C619, ptr null, ptr null }, ptr @type..struct_4_5, ptr @type.._6_7struct_4_5, i64 8 }, comdat
@const.274 = private constant [13 x i8] c"[8]struct {}\00", align 1
@go..C619 = internal constant { ptr, i64 } { ptr @const.274, i64 12 }
@type.._6_7struct_4_5 = weak constant %SliceType.0 { %_type.0 { i64 24, i64 8, i32 26, i8 0, i8 8, i8 8, i8 23, ptr null, ptr @gcbits..ba, ptr @go..C620, ptr null, ptr null }, ptr @type..struct_4_5 }, comdat
@const.275 = private constant [12 x i8] c"[]struct {}\00", align 1
@go..C620 = internal constant { ptr, i64 } { ptr @const.275, i64 11 }
@go..C621 = internal constant { ptr, i64 } { ptr @const.144, i64 8 }
@uintptr..d = weak constant %_type.0 { i64 8, i64 0, i32 -1488193301, i8 8, i8 8, i8 8, i8 -116, ptr @runtime.memequal64..f, ptr null, ptr @go..C622, ptr @go..C625, ptr @uintptr..p }, comdat
@const.276 = private constant [8 x i8] c"uintptr\00", align 1
@go..C622 = internal constant { ptr, i64 } { ptr @const.276, i64 7 }
@go..C623 = internal constant { ptr, i64 } { ptr @const.276, i64 7 }
@go..C624 = internal constant [1 x %method.0] zeroinitializer
@go..C625 = internal constant %uncommonType.0 { ptr @go..C623, ptr null, %IPST.41 { ptr @go..C624, i64 0, i64 0 } }
@uintptr..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1958710969, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C626, ptr null, ptr null }, ptr @uintptr..d }, comdat
@const.277 = private constant [9 x i8] c"*uintptr\00", align 1
@go..C626 = internal constant { ptr, i64 } { ptr @const.277, i64 8 }
@go..C627 = internal constant [4 x %structField.0] [%structField.0 { ptr @go..C616, ptr null, ptr @type.._68x_7uint8, ptr null, i64 0 }, %structField.0 { ptr @go..C617, ptr null, ptr @type.._68x_7uint16, ptr null, i64 16 }, %structField.0 { ptr @go..C618, ptr null, ptr @type.._68x_7struct_4_5, ptr null, i64 48 }, %structField.0 { ptr @go..C621, ptr null, ptr @uintptr..d, ptr null, i64 48 }]
@runtime.memhash16..f = external constant %functionDescriptor.0
@const.278 = private constant [8 x i8] c"RWMutex\00", align 1
@go..C628 = internal constant { ptr, i64 } { ptr @const.278, i64 7 }
@sync.RWMutex..d = external constant %StructType.0
@go..C629 = internal constant [2 x %structField.0] [%structField.0 { ptr @go..C610, ptr @go..C611, ptr @type..map_6uint16_7struct_4_5, ptr null, i64 0 }, %structField.0 { ptr @go..C628, ptr null, ptr @sync.RWMutex..d, ptr null, i64 17 }]
@go_0llvm.sup = internal global ptr null
@runtime.writeBarrier = external local_unnamed_addr externally_initialized global { i8, [3 x i8], i8, i8, i64 }
@go_0llvm.Transfer..d = constant %StructType.0 { %_type.0 { i64 48, i64 48, i32 297583693, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..zb, ptr @go..C630, ptr @go..C634, ptr @go_0llvm.Transfer..p }, %IPST.43 { ptr @go..C653, i64 3, i64 3 } }
@gcbits..zb = weak constant [1 x i8] c"9", comdat
@const.280 = private constant [23 x i8] c"\09go.llvm\09llvm.Transfer\00", align 1
@go..C630 = internal constant { ptr, i64 } { ptr @const.280, i64 22 }
@const.281 = private constant [9 x i8] c"Transfer\00", align 1
@go..C631 = internal constant { ptr, i64 } { ptr @const.281, i64 8 }
@go..C632 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C633 = internal constant [1 x %method.0] zeroinitializer
@go..C634 = internal constant %uncommonType.0 { ptr @go..C631, ptr @go..C632, %IPST.41 { ptr @go..C633, i64 0, i64 0 } }
@go_0llvm.Transfer..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 466371801, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C635, ptr null, ptr null }, ptr @go_0llvm.Transfer..d }, comdat
@const.282 = private constant [24 x i8] c"*\09go.llvm\09llvm.Transfer\00", align 1
@go..C635 = internal constant { ptr, i64 } { ptr @const.282, i64 23 }
@const.283 = private constant [12 x i8] c"Transferers\00", align 1
@go..C636 = internal constant { ptr, i64 } { ptr @const.283, i64 11 }
@type.._6_7go_0llvm_0Transferer = weak constant %SliceType.0 { %_type.0 { i64 24, i64 8, i32 597710164, i8 0, i8 8, i8 8, i8 23, ptr null, ptr @gcbits..ba, ptr @go..C637, ptr null, ptr null }, ptr @go_0llvm.Transferer..d }, comdat
@const.284 = private constant [27 x i8] c"[]\09go.llvm\09llvm.Transferer\00", align 1
@go..C637 = internal constant { ptr, i64 } { ptr @const.284, i64 26 }
@go_0llvm.Transferer..d = constant %InterfaceType.0 { %_type.0 { i64 16, i64 16, i32 597710150, i8 0, i8 8, i8 8, i8 20, ptr @runtime.interequal..f, ptr @gcbits..da, ptr @go..C638, ptr @go..C642, ptr @go_0llvm.Transferer..p }, %IPST.44 { ptr @go..C649, i64 1, i64 1 } }
@const.285 = private constant [25 x i8] c"\09go.llvm\09llvm.Transferer\00", align 1
@go..C638 = internal constant { ptr, i64 } { ptr @const.285, i64 24 }
@const.286 = private constant [11 x i8] c"Transferer\00", align 1
@go..C639 = internal constant { ptr, i64 } { ptr @const.286, i64 10 }
@go..C640 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C641 = internal constant [1 x %method.0] zeroinitializer
@go..C642 = internal constant %uncommonType.0 { ptr @go..C639, ptr @go..C640, %IPST.41 { ptr @go..C641, i64 0, i64 0 } }
@go_0llvm.Transferer..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 973427817, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C643, ptr null, ptr null }, ptr @go_0llvm.Transferer..d }, comdat
@const.287 = private constant [26 x i8] c"*\09go.llvm\09llvm.Transferer\00", align 1
@go..C643 = internal constant { ptr, i64 } { ptr @const.287, i64 25 }
@go..C644 = internal constant { ptr, i64 } { ptr @const.281, i64 8 }
@type..func_8string_3uint32_9_8_x3c_x2dchan_b_6_7go_0llvm_0RR_3error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 152087304, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C645, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C646, i64 2, i64 2 }, %IPST.42 { ptr @go..C648, i64 2, i64 2 } }, comdat
@const.288 = private constant [56 x i8] c"func(string, uint32) (<-chan []\09go.llvm\09llvm.RR, error)\00", align 1
@go..C645 = internal constant { ptr, i64 } { ptr @const.288, i64 55 }
@go..C646 = internal constant [2 x ptr] [ptr @string..d, ptr @uint32..d]
@type.._x3c_x2dchan_b_6_7go_0llvm_0RR = weak constant %ChanType.0 { %_type.0 { i64 8, i64 8, i32 -1461136865, i8 8, i8 8, i8 8, i8 50, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C647, ptr null, ptr null }, ptr @type.._6_7go_0llvm_0RR, i64 1 }, comdat
@const.289 = private constant [26 x i8] c"<-chan []\09go.llvm\09llvm.RR\00", align 1
@go..C647 = internal constant { ptr, i64 } { ptr @const.289, i64 25 }
@go..C648 = internal constant [2 x ptr] [ptr @type.._x3c_x2dchan_b_6_7go_0llvm_0RR, ptr @error..d]
@go..C649 = internal constant [1 x %imethod.0] [%imethod.0 { ptr @go..C644, ptr null, ptr @type..func_8string_3uint32_9_8_x3c_x2dchan_b_6_7go_0llvm_0RR_3error_9 }]
@const.290 = private constant [11 x i8] c"tsigSecret\00", align 1
@go..C650 = internal constant { ptr, i64 } { ptr @const.290, i64 10 }
@go..C651 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.291 = private constant [5 x i8] c"Next\00", align 1
@go..C652 = internal constant { ptr, i64 } { ptr @const.291, i64 4 }
@go..C653 = internal constant [3 x %structField.0] [%structField.0 { ptr @go..C636, ptr null, ptr @type.._6_7go_0llvm_0Transferer, ptr null, i64 0 }, %structField.0 { ptr @go..C650, ptr @go..C651, ptr @type..map_6string_7string, ptr null, i64 48 }, %structField.0 { ptr @go..C652, ptr null, ptr @go_0llvm.Handler..d, ptr null, i64 64 }]
@go_0llvm.Zones..d = constant %SliceType.0 { %_type.0 { i64 24, i64 8, i32 496200441, i8 0, i8 8, i8 8, i8 23, ptr null, ptr @gcbits..ba, ptr @go..C654, ptr @go..C658, ptr @go_0llvm.Zones..p }, ptr @string..d }
@const.292 = private constant [20 x i8] c"\09go.llvm\09llvm.Zones\00", align 1
@go..C654 = internal constant { ptr, i64 } { ptr @const.292, i64 19 }
@const.293 = private constant [6 x i8] c"Zones\00", align 1
@go..C655 = internal constant { ptr, i64 } { ptr @const.293, i64 5 }
@go..C656 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C657 = internal constant [1 x %method.0] zeroinitializer
@go..C658 = internal constant %uncommonType.0 { ptr @go..C655, ptr @go..C656, %IPST.41 { ptr @go..C657, i64 0, i64 0 } }
@go_0llvm.Zones..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -650727527, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C659, ptr null, ptr null }, ptr @go_0llvm.Zones..d }, comdat
@const.294 = private constant [21 x i8] c"*\09go.llvm\09llvm.Zones\00", align 1
@go..C659 = internal constant { ptr, i64 } { ptr @const.294, i64 20 }
@go_0llvm.Zone..d = constant %StructType.0 { %_type.0 { i64 216, i64 216, i32 -1880618080, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..jhjacda, ptr @go..C660, ptr @go..C731, ptr @go_0llvm.Zone..p }, %IPST.43 { ptr @go..C910, i64 12, i64 12 } }
@gcbits..jhjacda = weak constant [4 x i8] c"\E9$ \06", comdat
@const.295 = private constant [19 x i8] c"\09go.llvm\09llvm.Zone\00", align 1
@go..C660 = internal constant { ptr, i64 } { ptr @const.295, i64 18 }
@go..C661 = internal constant { ptr, i64 } { ptr @const.152, i64 4 }
@go..C662 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.296 = private constant [5 x i8] c"Glue\00", align 1
@go..C663 = internal constant { ptr, i64 } { ptr @const.296, i64 4 }
@type..func_8_6_7go_0llvm_0RR_3bool_9_8_6_7go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -450307512, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C664, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C665, i64 2, i64 2 }, %IPST.42 { ptr @go..C666, i64 1, i64 1 } }, comdat
@const.297 = private constant [50 x i8] c"func([]\09go.llvm\09llvm.RR, bool) []\09go.llvm\09llvm.RR\00", align 1
@go..C664 = internal constant { ptr, i64 } { ptr @const.297, i64 49 }
@go..C665 = internal constant [2 x ptr] [ptr @type.._6_7go_0llvm_0RR, ptr @bool..d]
@go..C666 = internal constant [1 x ptr] [ptr @type.._6_7go_0llvm_0RR]
@type..func_8go_0llvm_0Zone_3_6_7go_0llvm_0RR_3bool_9_8_6_7go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1971422344, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C667, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C668, i64 3, i64 3 }, %IPST.42 { ptr @go..C669, i64 1, i64 1 } }, comdat
@const.298 = private constant [70 x i8] c"func(\09go.llvm\09llvm.Zone, []\09go.llvm\09llvm.RR, bool) []\09go.llvm\09llvm.RR\00", align 1
@go..C667 = internal constant { ptr, i64 } { ptr @const.298, i64 69 }
@go..C668 = internal constant [3 x ptr] [ptr @go_0llvm.Zone..d, ptr @type.._6_7go_0llvm_0RR, ptr @bool..d]
@go..C669 = internal constant [1 x ptr] [ptr @type.._6_7go_0llvm_0RR]
@go..C670 = internal constant { ptr, i64 } { ptr @const.291, i64 4 }
@type..func_8string_9_8_2go_0llvm_0Elem_3bool_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 773419528, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C671, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C672, i64 1, i64 1 }, %IPST.42 { ptr @go..C714, i64 2, i64 2 } }, comdat
@const.299 = private constant [41 x i8] c"func(string) (*\09go.llvm\09llvm.Elem, bool)\00", align 1
@go..C671 = internal constant { ptr, i64 } { ptr @const.299, i64 40 }
@go..C672 = internal constant [1 x ptr] [ptr @string..d]
@go_0llvm.Elem..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 485998425, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C673, ptr @go..C693, ptr @type.._2_2go_0llvm_0Elem }, ptr @go_0llvm.Elem..d }, comdat
@const.300 = private constant [20 x i8] c"*\09go.llvm\09llvm.Elem\00", align 1
@go..C673 = internal constant { ptr, i64 } { ptr @const.300, i64 19 }
@go..C674 = internal constant { ptr, i64 } { ptr @const.9, i64 4 }
@type..func_8_2go_0llvm_0Elem_9_8string_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -711880280, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C675, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C676, i64 1, i64 1 }, %IPST.42 { ptr @go..C677, i64 1, i64 1 } }, comdat
@const.301 = private constant [33 x i8] c"func(*\09go.llvm\09llvm.Elem) string\00", align 1
@go..C675 = internal constant { ptr, i64 } { ptr @const.301, i64 32 }
@go..C676 = internal constant [1 x ptr] [ptr @go_0llvm.Elem..p]
@go..C677 = internal constant [1 x ptr] [ptr @string..d]
@const.302 = private constant [5 x i8] c"Type\00", align 1
@go..C678 = internal constant { ptr, i64 } { ptr @const.302, i64 4 }
@type..func_8uint16_9_8_6_7go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -466840568, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C679, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C680, i64 1, i64 1 }, %IPST.42 { ptr @go..C681, i64 1, i64 1 } }, comdat
@const.303 = private constant [32 x i8] c"func(uint16) []\09go.llvm\09llvm.RR\00", align 1
@go..C679 = internal constant { ptr, i64 } { ptr @const.303, i64 31 }
@go..C680 = internal constant [1 x ptr] [ptr @uint16..d]
@go..C681 = internal constant [1 x ptr] [ptr @type.._6_7go_0llvm_0RR]
@type..func_8_2go_0llvm_0Elem_3uint16_9_8_6_7go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 360673064, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C682, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C683, i64 2, i64 2 }, %IPST.42 { ptr @go..C684, i64 1, i64 1 } }, comdat
@const.304 = private constant [53 x i8] c"func(*\09go.llvm\09llvm.Elem, uint16) []\09go.llvm\09llvm.RR\00", align 1
@go..C682 = internal constant { ptr, i64 } { ptr @const.304, i64 52 }
@go..C683 = internal constant [2 x ptr] [ptr @go_0llvm.Elem..p, ptr @uint16..d]
@go..C684 = internal constant [1 x ptr] [ptr @type.._6_7go_0llvm_0RR]
@const.305 = private constant [16 x i8] c"TypeForWildcard\00", align 1
@go..C685 = internal constant { ptr, i64 } { ptr @const.305, i64 15 }
@type..func_8uint16_3string_9_8_6_7go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 449198728, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C686, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C687, i64 2, i64 2 }, %IPST.42 { ptr @go..C688, i64 1, i64 1 } }, comdat
@const.306 = private constant [40 x i8] c"func(uint16, string) []\09go.llvm\09llvm.RR\00", align 1
@go..C686 = internal constant { ptr, i64 } { ptr @const.306, i64 39 }
@go..C687 = internal constant [2 x ptr] [ptr @uint16..d, ptr @string..d]
@go..C688 = internal constant [1 x ptr] [ptr @type.._6_7go_0llvm_0RR]
@type..func_8_2go_0llvm_0Elem_3uint16_3string_9_8_6_7go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -2102215640, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C689, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C690, i64 3, i64 3 }, %IPST.42 { ptr @go..C691, i64 1, i64 1 } }, comdat
@const.307 = private constant [61 x i8] c"func(*\09go.llvm\09llvm.Elem, uint16, string) []\09go.llvm\09llvm.RR\00", align 1
@go..C689 = internal constant { ptr, i64 } { ptr @const.307, i64 60 }
@go..C690 = internal constant [3 x ptr] [ptr @go_0llvm.Elem..p, ptr @uint16..d, ptr @string..d]
@go..C691 = internal constant [1 x ptr] [ptr @type.._6_7go_0llvm_0RR]
@go..C692 = internal constant [3 x %method.0] [%method.0 { ptr @go..C674, ptr null, ptr @type..func_8_9_8string_9, ptr @type..func_8_2go_0llvm_0Elem_9_8string_9, ptr @go_0llvm.Elem.Name }, %method.0 { ptr @go..C678, ptr null, ptr @type..func_8uint16_9_8_6_7go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0Elem_3uint16_9_8_6_7go_0llvm_0RR_9, ptr @go_0llvm.Elem.Type }, %method.0 { ptr @go..C685, ptr null, ptr @type..func_8uint16_3string_9_8_6_7go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0Elem_3uint16_3string_9_8_6_7go_0llvm_0RR_9, ptr @go_0llvm.Elem.TypeForWildcard }]
@go..C693 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.41 { ptr @go..C692, i64 3, i64 3 } }
@type.._2_2go_0llvm_0Elem = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -813959783, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C694, ptr null, ptr null }, ptr @go_0llvm.Elem..p }, comdat
@const.308 = private constant [21 x i8] c"**\09go.llvm\09llvm.Elem\00", align 1
@go..C694 = internal constant { ptr, i64 } { ptr @const.308, i64 20 }
@go_0llvm.Elem..d = constant %StructType.0 { %_type.0 { i64 24, i64 16, i32 -1848673291, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..da, ptr @go..C695, ptr @go..C699, ptr @go_0llvm.Elem..p }, %IPST.43 { ptr @go..C713, i64 2, i64 2 } }
@const.309 = private constant [19 x i8] c"\09go.llvm\09llvm.Elem\00", align 1
@go..C695 = internal constant { ptr, i64 } { ptr @const.309, i64 18 }
@const.310 = private constant [5 x i8] c"Elem\00", align 1
@go..C696 = internal constant { ptr, i64 } { ptr @const.310, i64 4 }
@go..C697 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C698 = internal constant [1 x %method.0] zeroinitializer
@go..C699 = internal constant %uncommonType.0 { ptr @go..C696, ptr @go..C697, %IPST.41 { ptr @go..C698, i64 0, i64 0 } }
@go..C700 = internal constant { ptr, i64 } { ptr @const.270, i64 1 }
@go..C701 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..map_6uint16_7_6_7go_0llvm_0RR = weak constant %MapType.0 { %_type.0 { i64 8, i64 8, i32 -1982194144, i8 0, i8 8, i8 8, i8 53, ptr null, ptr @gcbits..ba, ptr @go..C702, ptr null, ptr null }, ptr @uint16..d, ptr @type.._6_7go_0llvm_0RR, ptr @type..struct_4_4x_5topbits_b_68x_7uint8_ckeys_b_68x_7uint16_cvalues_b_68x_7_6_7go_0llvm_0RR_coverflow_b_2_4void_5_5, ptr @runtime.memhash16..f, i8 2, i8 24, i16 224, i32 4 }, comdat
@const.311 = private constant [30 x i8] c"map[uint16][]\09go.llvm\09llvm.RR\00", align 1
@go..C702 = internal constant { ptr, i64 } { ptr @const.311, i64 29 }
@type..struct_4_4x_5topbits_b_68x_7uint8_ckeys_b_68x_7uint16_cvalues_b_68x_7_6_7go_0llvm_0RR_coverflow_b_2_4void_5_5 = weak constant %StructType.0 { %_type.0 { i64 224, i64 224, i32 -1332066844, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..isejsea, ptr @go..C703, ptr null, ptr null }, %IPST.43 { ptr @go..C710, i64 4, i64 4 } }, comdat
@gcbits..isejsea = weak constant [4 x i8] c"H\92$\09", comdat
@const.312 = private constant [86 x i8] c"struct { topbits [8]uint8; keys [8]uint16; values [8][]\09go.llvm\09llvm.RR; overflow * }\00", align 1
@go..C703 = internal constant { ptr, i64 } { ptr @const.312, i64 85 }
@go..C704 = internal constant { ptr, i64 } { ptr @const.136, i64 7 }
@go..C705 = internal constant { ptr, i64 } { ptr @const.138, i64 4 }
@go..C706 = internal constant { ptr, i64 } { ptr @const.141, i64 6 }
@type.._68x_7_6_7go_0llvm_0RR = weak constant %ArrayType.0 { %_type.0 { i64 192, i64 176, i32 177114415, i8 0, i8 8, i8 8, i8 17, ptr null, ptr @gcbits..jsejc, ptr @go..C707, ptr null, ptr null }, ptr @type.._6_7go_0llvm_0RR, ptr @type.._6_7_6_7go_0llvm_0RR, i64 8 }, comdat
@gcbits..jsejc = weak constant [3 x i8] c"I\92$", comdat
@const.313 = private constant [22 x i8] c"[8][]\09go.llvm\09llvm.RR\00", align 1
@go..C707 = internal constant { ptr, i64 } { ptr @const.313, i64 21 }
@type.._6_7_6_7go_0llvm_0RR = weak constant %SliceType.0 { %_type.0 { i64 24, i64 8, i32 -2058926434, i8 0, i8 8, i8 8, i8 23, ptr null, ptr @gcbits..ba, ptr @go..C708, ptr null, ptr null }, ptr @type.._6_7go_0llvm_0RR }, comdat
@const.314 = private constant [21 x i8] c"[][]\09go.llvm\09llvm.RR\00", align 1
@go..C708 = internal constant { ptr, i64 } { ptr @const.314, i64 20 }
@go..C709 = internal constant { ptr, i64 } { ptr @const.144, i64 8 }
@go..C710 = internal constant [4 x %structField.0] [%structField.0 { ptr @go..C704, ptr null, ptr @type.._68x_7uint8, ptr null, i64 0 }, %structField.0 { ptr @go..C705, ptr null, ptr @type.._68x_7uint16, ptr null, i64 16 }, %structField.0 { ptr @go..C706, ptr null, ptr @type.._68x_7_6_7go_0llvm_0RR, ptr null, i64 48 }, %structField.0 { ptr @go..C709, ptr null, ptr @unsafe.Pointer..d, ptr null, i64 432 }]
@go..C711 = internal constant { ptr, i64 } { ptr @const.183, i64 4 }
@go..C712 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C713 = internal constant [2 x %structField.0] [%structField.0 { ptr @go..C700, ptr @go..C701, ptr @type..map_6uint16_7_6_7go_0llvm_0RR, ptr null, i64 0 }, %structField.0 { ptr @go..C711, ptr @go..C712, ptr @string..d, ptr null, i64 16 }]
@go..C714 = internal constant [2 x ptr] [ptr @go_0llvm.Elem..p, ptr @bool..d]
@type..func_8go_0llvm_0Zone_3string_9_8_2go_0llvm_0Elem_3bool_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1181202760, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C715, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C716, i64 2, i64 2 }, %IPST.42 { ptr @go..C717, i64 2, i64 2 } }, comdat
@const.315 = private constant [61 x i8] c"func(\09go.llvm\09llvm.Zone, string) (*\09go.llvm\09llvm.Elem, bool)\00", align 1
@go..C715 = internal constant { ptr, i64 } { ptr @const.315, i64 60 }
@go..C716 = internal constant [2 x ptr] [ptr @go_0llvm.Zone..d, ptr @string..d]
@go..C717 = internal constant [2 x ptr] [ptr @go_0llvm.Elem..p, ptr @bool..d]
@const.316 = private constant [5 x i8] c"Prev\00", align 1
@go..C718 = internal constant { ptr, i64 } { ptr @const.316, i64 4 }
@const.317 = private constant [7 x i8] c"Search\00", align 1
@go..C719 = internal constant { ptr, i64 } { ptr @const.317, i64 6 }
@const.318 = private constant [3 x i8] c"ns\00", align 1
@go..C720 = internal constant { ptr, i64 } { ptr @const.318, i64 2 }
@go..C721 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8bool_9_8_6_7go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -955722200, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C722, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C723, i64 1, i64 1 }, %IPST.42 { ptr @go..C724, i64 1, i64 1 } }, comdat
@const.319 = private constant [30 x i8] c"func(bool) []\09go.llvm\09llvm.RR\00", align 1
@go..C722 = internal constant { ptr, i64 } { ptr @const.319, i64 29 }
@go..C723 = internal constant [1 x ptr] [ptr @bool..d]
@go..C724 = internal constant [1 x ptr] [ptr @type.._6_7go_0llvm_0RR]
@type..func_8go_0llvm_0Zone_3bool_9_8_6_7go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 960592968, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C725, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C726, i64 2, i64 2 }, %IPST.42 { ptr @go..C727, i64 1, i64 1 } }, comdat
@const.320 = private constant [50 x i8] c"func(\09go.llvm\09llvm.Zone, bool) []\09go.llvm\09llvm.RR\00", align 1
@go..C725 = internal constant { ptr, i64 } { ptr @const.320, i64 49 }
@go..C726 = internal constant [2 x ptr] [ptr @go_0llvm.Zone..d, ptr @bool..d]
@go..C727 = internal constant [1 x ptr] [ptr @type.._6_7go_0llvm_0RR]
@const.321 = private constant [4 x i8] c"soa\00", align 1
@go..C728 = internal constant { ptr, i64 } { ptr @const.321, i64 3 }
@go..C729 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C730 = internal constant [6 x %method.0] [%method.0 { ptr @go..C663, ptr null, ptr @type..func_8_6_7go_0llvm_0RR_3bool_9_8_6_7go_0llvm_0RR_9, ptr @type..func_8go_0llvm_0Zone_3_6_7go_0llvm_0RR_3bool_9_8_6_7go_0llvm_0RR_9, ptr @go_0llvm.Zone.Glue..stub }, %method.0 { ptr @go..C670, ptr null, ptr @type..func_8string_9_8_2go_0llvm_0Elem_3bool_9, ptr @type..func_8go_0llvm_0Zone_3string_9_8_2go_0llvm_0Elem_3bool_9, ptr @go_0llvm.Zone.Next..stub }, %method.0 { ptr @go..C718, ptr null, ptr @type..func_8string_9_8_2go_0llvm_0Elem_3bool_9, ptr @type..func_8go_0llvm_0Zone_3string_9_8_2go_0llvm_0Elem_3bool_9, ptr @go_0llvm.Zone.Prev..stub }, %method.0 { ptr @go..C719, ptr null, ptr @type..func_8string_9_8_2go_0llvm_0Elem_3bool_9, ptr @type..func_8go_0llvm_0Zone_3string_9_8_2go_0llvm_0Elem_3bool_9, ptr @go_0llvm.Zone.Search..stub }, %method.0 { ptr @go..C720, ptr @go..C721, ptr @type..func_8bool_9_8_6_7go_0llvm_0RR_9, ptr @type..func_8go_0llvm_0Zone_3bool_9_8_6_7go_0llvm_0RR_9, ptr @go_0llvm.Zone.ns..stub }, %method.0 { ptr @go..C728, ptr @go..C729, ptr @type..func_8bool_9_8_6_7go_0llvm_0RR_9, ptr @type..func_8go_0llvm_0Zone_3bool_9_8_6_7go_0llvm_0RR_9, ptr @go_0llvm.Zone.soa..stub }]
@go..C731 = internal constant %uncommonType.0 { ptr @go..C661, ptr @go..C662, %IPST.41 { ptr @go..C730, i64 6, i64 6 } }
@go_0llvm.Zone..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -25118199, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C732, ptr @go..C807, ptr @type.._2_2go_0llvm_0Zone }, ptr @go_0llvm.Zone..d }, comdat
@const.322 = private constant [20 x i8] c"*\09go.llvm\09llvm.Zone\00", align 1
@go..C732 = internal constant { ptr, i64 } { ptr @const.322, i64 19 }
@const.323 = private constant [16 x i8] c"ClosestEncloser\00", align 1
@go..C733 = internal constant { ptr, i64 } { ptr @const.323, i64 15 }
@type..func_8_2go_0llvm_0Zone_3string_9_8_2go_0llvm_0Elem_3bool_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 427656808, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C734, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C735, i64 2, i64 2 }, %IPST.42 { ptr @go..C736, i64 2, i64 2 } }, comdat
@const.324 = private constant [62 x i8] c"func(*\09go.llvm\09llvm.Zone, string) (*\09go.llvm\09llvm.Elem, bool)\00", align 1
@go..C734 = internal constant { ptr, i64 } { ptr @const.324, i64 61 }
@go..C735 = internal constant [2 x ptr] [ptr @go_0llvm.Zone..p, ptr @string..d]
@go..C736 = internal constant [2 x ptr] [ptr @go_0llvm.Elem..p, ptr @bool..d]
@go..C737 = internal constant { ptr, i64 } { ptr @const.296, i64 4 }
@type..func_8_2go_0llvm_0Zone_3_6_7go_0llvm_0RR_3bool_9_8_6_7go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1217876392, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C738, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C739, i64 3, i64 3 }, %IPST.42 { ptr @go..C740, i64 1, i64 1 } }, comdat
@const.325 = private constant [71 x i8] c"func(*\09go.llvm\09llvm.Zone, []\09go.llvm\09llvm.RR, bool) []\09go.llvm\09llvm.RR\00", align 1
@go..C738 = internal constant { ptr, i64 } { ptr @const.325, i64 70 }
@go..C739 = internal constant [3 x ptr] [ptr @go_0llvm.Zone..p, ptr @type.._6_7go_0llvm_0RR, ptr @bool..d]
@go..C740 = internal constant [1 x ptr] [ptr @type.._6_7go_0llvm_0RR]
@go..C741 = internal constant { ptr, i64 } { ptr @const.255, i64 4 }
@type..func_8_2go_0llvm_0Zone_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -803782360, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C742, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C743, i64 1, i64 1 }, %IPST.42 { ptr @go..C744, i64 0, i64 0 } }, comdat
@const.326 = private constant [26 x i8] c"func(*\09go.llvm\09llvm.Zone)\00", align 1
@go..C742 = internal constant { ptr, i64 } { ptr @const.326, i64 25 }
@go..C743 = internal constant [1 x ptr] [ptr @go_0llvm.Zone..p]
@go..C744 = internal constant [1 x ptr] zeroinitializer
@const.327 = private constant [7 x i8] c"Lookup\00", align 1
@go..C745 = internal constant { ptr, i64 } { ptr @const.327, i64 6 }
@type..func_8context_0Context_3go_0llvm_0Request_3string_9_8_6_7go_0llvm_0RR_3_6_7go_0llvm_0RR_3_6_7go_0llvm_0RR_3go_0llvm_0Result_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -2062403544, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C746, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C747, i64 3, i64 3 }, %IPST.42 { ptr @go..C754, i64 4, i64 4 } }, comdat
@const.328 = private constant [145 x i8] c"func(\09context\09context.Context, \09go.llvm\09llvm.Request, string) ([]\09go.llvm\09llvm.RR, []\09go.llvm\09llvm.RR, []\09go.llvm\09llvm.RR, \09go.llvm\09llvm.Result)\00", align 1
@go..C746 = internal constant { ptr, i64 } { ptr @const.328, i64 144 }
@go..C747 = internal constant [3 x ptr] [ptr @context.Context..d, ptr @go_0llvm.Request..d, ptr @string..d]
@go_0llvm.Result..d = constant %_type.0 { i64 8, i64 0, i32 -2104593785, i8 8, i8 8, i8 8, i8 -126, ptr @runtime.memequal64..f, ptr null, ptr @go..C748, ptr @go..C752, ptr @go_0llvm.Result..p }
@const.329 = private constant [21 x i8] c"\09go.llvm\09llvm.Result\00", align 1
@go..C748 = internal constant { ptr, i64 } { ptr @const.329, i64 20 }
@const.330 = private constant [7 x i8] c"Result\00", align 1
@go..C749 = internal constant { ptr, i64 } { ptr @const.330, i64 6 }
@go..C750 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C751 = internal constant [1 x %method.0] zeroinitializer
@go..C752 = internal constant %uncommonType.0 { ptr @go..C749, ptr @go..C750, %IPST.41 { ptr @go..C751, i64 0, i64 0 } }
@go_0llvm.Result..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 686237817, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C753, ptr null, ptr null }, ptr @go_0llvm.Result..d }, comdat
@const.331 = private constant [22 x i8] c"*\09go.llvm\09llvm.Result\00", align 1
@go..C753 = internal constant { ptr, i64 } { ptr @const.331, i64 21 }
@go..C754 = internal constant [4 x ptr] [ptr @type.._6_7go_0llvm_0RR, ptr @type.._6_7go_0llvm_0RR, ptr @type.._6_7go_0llvm_0RR, ptr @go_0llvm.Result..d]
@type..func_8_2go_0llvm_0Zone_3context_0Context_3go_0llvm_0Request_3string_9_8_6_7go_0llvm_0RR_3_6_7go_0llvm_0RR_3_6_7go_0llvm_0RR_3go_0llvm_0Result_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -2137315480, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C755, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C756, i64 4, i64 4 }, %IPST.42 { ptr @go..C757, i64 4, i64 4 } }, comdat
@const.332 = private constant [166 x i8] c"func(*\09go.llvm\09llvm.Zone, \09context\09context.Context, \09go.llvm\09llvm.Request, string) ([]\09go.llvm\09llvm.RR, []\09go.llvm\09llvm.RR, []\09go.llvm\09llvm.RR, \09go.llvm\09llvm.Result)\00", align 1
@go..C755 = internal constant { ptr, i64 } { ptr @const.332, i64 165 }
@go..C756 = internal constant [4 x ptr] [ptr @go_0llvm.Zone..p, ptr @context.Context..d, ptr @go_0llvm.Request..d, ptr @string..d]
@go..C757 = internal constant [4 x ptr] [ptr @type.._6_7go_0llvm_0RR, ptr @type.._6_7go_0llvm_0RR, ptr @type.._6_7go_0llvm_0RR, ptr @go_0llvm.Result..d]
@go..C758 = internal constant { ptr, i64 } { ptr @const.291, i64 4 }
@go..C759 = internal constant { ptr, i64 } { ptr @const.316, i64 4 }
@go..C760 = internal constant { ptr, i64 } { ptr @const.257, i64 5 }
@go..C761 = internal constant { ptr, i64 } { ptr @const.258, i64 7 }
@type..func_8_2go_0llvm_0Zone_9_8sync_0Locker_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1658475224, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C762, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C763, i64 1, i64 1 }, %IPST.42 { ptr @go..C764, i64 1, i64 1 } }, comdat
@const.333 = private constant [44 x i8] c"func(*\09go.llvm\09llvm.Zone) \09sync\09sync.Locker\00", align 1
@go..C762 = internal constant { ptr, i64 } { ptr @const.333, i64 43 }
@go..C763 = internal constant [1 x ptr] [ptr @go_0llvm.Zone..p]
@go..C764 = internal constant [1 x ptr] [ptr @sync.Locker..d]
@go..C765 = internal constant { ptr, i64 } { ptr @const.261, i64 7 }
@go..C766 = internal constant { ptr, i64 } { ptr @const.317, i64 6 }
@go..C767 = internal constant { ptr, i64 } { ptr @const.262, i64 6 }
@const.334 = private constant [21 x i8] c"additionalProcessing\00", align 1
@go..C768 = internal constant { ptr, i64 } { ptr @const.334, i64 20 }
@go..C769 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.335 = private constant [9 x i8] c"doLookup\00", align 1
@go..C770 = internal constant { ptr, i64 } { ptr @const.335, i64 8 }
@go..C771 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8context_0Context_3go_0llvm_0Request_3string_3uint16_9_8_6_7go_0llvm_0RR_3go_0llvm_0Result_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1465128360, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C772, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C773, i64 4, i64 4 }, %IPST.42 { ptr @go..C774, i64 2, i64 2 } }, comdat
@const.336 = private constant [113 x i8] c"func(\09context\09context.Context, \09go.llvm\09llvm.Request, string, uint16) ([]\09go.llvm\09llvm.RR, \09go.llvm\09llvm.Result)\00", align 1
@go..C772 = internal constant { ptr, i64 } { ptr @const.336, i64 112 }
@go..C773 = internal constant [4 x ptr] [ptr @context.Context..d, ptr @go_0llvm.Request..d, ptr @string..d, ptr @uint16..d]
@go..C774 = internal constant [2 x ptr] [ptr @type.._6_7go_0llvm_0RR, ptr @go_0llvm.Result..d]
@type..func_8_2go_0llvm_0Zone_3context_0Context_3go_0llvm_0Request_3string_3uint16_9_8_6_7go_0llvm_0RR_3go_0llvm_0Result_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -441154328, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C775, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C776, i64 5, i64 5 }, %IPST.42 { ptr @go..C777, i64 2, i64 2 } }, comdat
@const.337 = private constant [134 x i8] c"func(*\09go.llvm\09llvm.Zone, \09context\09context.Context, \09go.llvm\09llvm.Request, string, uint16) ([]\09go.llvm\09llvm.RR, \09go.llvm\09llvm.Result)\00", align 1
@go..C775 = internal constant { ptr, i64 } { ptr @const.337, i64 133 }
@go..C776 = internal constant [5 x ptr] [ptr @go_0llvm.Zone..p, ptr @context.Context..d, ptr @go_0llvm.Request..d, ptr @string..d, ptr @uint16..d]
@go..C777 = internal constant [2 x ptr] [ptr @type.._6_7go_0llvm_0RR, ptr @go_0llvm.Result..d]
@const.338 = private constant [15 x i8] c"externalLookup\00", align 1
@go..C778 = internal constant { ptr, i64 } { ptr @const.338, i64 14 }
@go..C779 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8context_0Context_3go_0llvm_0Request_3_2go_0llvm_0Elem_3_6_7go_0llvm_0RR_9_8_6_7go_0llvm_0RR_3_6_7go_0llvm_0RR_3_6_7go_0llvm_0RR_3go_0llvm_0Result_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -620419160, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C780, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C781, i64 4, i64 4 }, %IPST.42 { ptr @go..C782, i64 4, i64 4 } }, comdat
@const.339 = private constant [178 x i8] c"func(\09context\09context.Context, \09go.llvm\09llvm.Request, *\09go.llvm\09llvm.Elem, []\09go.llvm\09llvm.RR) ([]\09go.llvm\09llvm.RR, []\09go.llvm\09llvm.RR, []\09go.llvm\09llvm.RR, \09go.llvm\09llvm.Result)\00", align 1
@go..C780 = internal constant { ptr, i64 } { ptr @const.339, i64 177 }
@go..C781 = internal constant [4 x ptr] [ptr @context.Context..d, ptr @go_0llvm.Request..d, ptr @go_0llvm.Elem..p, ptr @type.._6_7go_0llvm_0RR]
@go..C782 = internal constant [4 x ptr] [ptr @type.._6_7go_0llvm_0RR, ptr @type.._6_7go_0llvm_0RR, ptr @type.._6_7go_0llvm_0RR, ptr @go_0llvm.Result..d]
@type..func_8_2go_0llvm_0Zone_3context_0Context_3go_0llvm_0Request_3_2go_0llvm_0Elem_3_6_7go_0llvm_0RR_9_8_6_7go_0llvm_0RR_3_6_7go_0llvm_0RR_3_6_7go_0llvm_0RR_3go_0llvm_0Result_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 746653288, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C783, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C784, i64 5, i64 5 }, %IPST.42 { ptr @go..C785, i64 4, i64 4 } }, comdat
@const.340 = private constant [199 x i8] c"func(*\09go.llvm\09llvm.Zone, \09context\09context.Context, \09go.llvm\09llvm.Request, *\09go.llvm\09llvm.Elem, []\09go.llvm\09llvm.RR) ([]\09go.llvm\09llvm.RR, []\09go.llvm\09llvm.RR, []\09go.llvm\09llvm.RR, \09go.llvm\09llvm.Result)\00", align 1
@go..C783 = internal constant { ptr, i64 } { ptr @const.340, i64 198 }
@go..C784 = internal constant [5 x ptr] [ptr @go_0llvm.Zone..p, ptr @context.Context..d, ptr @go_0llvm.Request..d, ptr @go_0llvm.Elem..p, ptr @type.._6_7go_0llvm_0RR]
@go..C785 = internal constant [4 x ptr] [ptr @type.._6_7go_0llvm_0RR, ptr @type.._6_7go_0llvm_0RR, ptr @type.._6_7go_0llvm_0RR, ptr @go_0llvm.Result..d]
@const.341 = private constant [14 x i8] c"nameFromRight\00", align 1
@go..C786 = internal constant { ptr, i64 } { ptr @const.341, i64 13 }
@go..C787 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8string_3int_9_8string_3bool_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 924814024, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C788, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C789, i64 2, i64 2 }, %IPST.42 { ptr @go..C790, i64 2, i64 2 } }, comdat
@const.342 = private constant [33 x i8] c"func(string, int) (string, bool)\00", align 1
@go..C788 = internal constant { ptr, i64 } { ptr @const.342, i64 32 }
@go..C789 = internal constant [2 x ptr] [ptr @string..d, ptr @int..d]
@go..C790 = internal constant [2 x ptr] [ptr @string..d, ptr @bool..d]
@type..func_8_2go_0llvm_0Zone_3string_3int_9_8string_3bool_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 853534632, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C791, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C792, i64 3, i64 3 }, %IPST.42 { ptr @go..C793, i64 2, i64 2 } }, comdat
@const.343 = private constant [54 x i8] c"func(*\09go.llvm\09llvm.Zone, string, int) (string, bool)\00", align 1
@go..C791 = internal constant { ptr, i64 } { ptr @const.343, i64 53 }
@go..C792 = internal constant [3 x ptr] [ptr @go_0llvm.Zone..p, ptr @string..d, ptr @int..d]
@go..C793 = internal constant [2 x ptr] [ptr @string..d, ptr @bool..d]
@go..C794 = internal constant { ptr, i64 } { ptr @const.318, i64 2 }
@go..C795 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8_2go_0llvm_0Zone_3bool_9_8_6_7go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 207047016, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C796, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C797, i64 2, i64 2 }, %IPST.42 { ptr @go..C798, i64 1, i64 1 } }, comdat
@const.344 = private constant [51 x i8] c"func(*\09go.llvm\09llvm.Zone, bool) []\09go.llvm\09llvm.RR\00", align 1
@go..C796 = internal constant { ptr, i64 } { ptr @const.344, i64 50 }
@go..C797 = internal constant [2 x ptr] [ptr @go_0llvm.Zone..p, ptr @bool..d]
@go..C798 = internal constant [1 x ptr] [ptr @type.._6_7go_0llvm_0RR]
@go..C799 = internal constant { ptr, i64 } { ptr @const.263, i64 11 }
@go..C800 = internal constant { ptr, i64 } { ptr @const.264, i64 4 }
@type..func_8_2go_0llvm_0Zone_3int32_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1852826520, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C801, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C802, i64 2, i64 2 }, %IPST.42 { ptr @go..C803, i64 0, i64 0 } }, comdat
@const.345 = private constant [33 x i8] c"func(*\09go.llvm\09llvm.Zone, int32)\00", align 1
@go..C801 = internal constant { ptr, i64 } { ptr @const.345, i64 32 }
@go..C802 = internal constant [2 x ptr] [ptr @go_0llvm.Zone..p, ptr @int32..d]
@go..C803 = internal constant [1 x ptr] zeroinitializer
@go..C804 = internal constant { ptr, i64 } { ptr @const.321, i64 3 }
@go..C805 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C806 = internal constant [18 x %method.0] [%method.0 { ptr @go..C733, ptr null, ptr @type..func_8string_9_8_2go_0llvm_0Elem_3bool_9, ptr @type..func_8_2go_0llvm_0Zone_3string_9_8_2go_0llvm_0Elem_3bool_9, ptr @go_0llvm.Zone.ClosestEncloser }, %method.0 { ptr @go..C737, ptr null, ptr @type..func_8_6_7go_0llvm_0RR_3bool_9_8_6_7go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0Zone_3_6_7go_0llvm_0RR_3bool_9_8_6_7go_0llvm_0RR_9, ptr @go_0llvm.Zone.Glue..stub }, %method.0 { ptr @go..C741, ptr null, ptr @type..func_8_9_8_9, ptr @type..func_8_2go_0llvm_0Zone_9_8_9, ptr @go_0llvm.Zone.Lock..stub }, %method.0 { ptr @go..C745, ptr null, ptr @type..func_8context_0Context_3go_0llvm_0Request_3string_9_8_6_7go_0llvm_0RR_3_6_7go_0llvm_0RR_3_6_7go_0llvm_0RR_3go_0llvm_0Result_9, ptr @type..func_8_2go_0llvm_0Zone_3context_0Context_3go_0llvm_0Request_3string_9_8_6_7go_0llvm_0RR_3_6_7go_0llvm_0RR_3_6_7go_0llvm_0RR_3go_0llvm_0Result_9, ptr @go_0llvm.Zone.Lookup }, %method.0 { ptr @go..C758, ptr null, ptr @type..func_8string_9_8_2go_0llvm_0Elem_3bool_9, ptr @type..func_8_2go_0llvm_0Zone_3string_9_8_2go_0llvm_0Elem_3bool_9, ptr @go_0llvm.Zone.Next..stub }, %method.0 { ptr @go..C759, ptr null, ptr @type..func_8string_9_8_2go_0llvm_0Elem_3bool_9, ptr @type..func_8_2go_0llvm_0Zone_3string_9_8_2go_0llvm_0Elem_3bool_9, ptr @go_0llvm.Zone.Prev..stub }, %method.0 { ptr @go..C760, ptr null, ptr @type..func_8_9_8_9, ptr @type..func_8_2go_0llvm_0Zone_9_8_9, ptr @go_0llvm.Zone.RLock..stub }, %method.0 { ptr @go..C761, ptr null, ptr @type..func_8_9_8sync_0Locker_9, ptr @type..func_8_2go_0llvm_0Zone_9_8sync_0Locker_9, ptr @go_0llvm.Zone.RLocker..stub }, %method.0 { ptr @go..C765, ptr null, ptr @type..func_8_9_8_9, ptr @type..func_8_2go_0llvm_0Zone_9_8_9, ptr @go_0llvm.Zone.RUnlock..stub }, %method.0 { ptr @go..C766, ptr null, ptr @type..func_8string_9_8_2go_0llvm_0Elem_3bool_9, ptr @type..func_8_2go_0llvm_0Zone_3string_9_8_2go_0llvm_0Elem_3bool_9, ptr @go_0llvm.Zone.Search..stub }, %method.0 { ptr @go..C767, ptr null, ptr @type..func_8_9_8_9, ptr @type..func_8_2go_0llvm_0Zone_9_8_9, ptr @go_0llvm.Zone.Unlock..stub }, %method.0 { ptr @go..C768, ptr @go..C769, ptr @type..func_8_6_7go_0llvm_0RR_3bool_9_8_6_7go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0Zone_3_6_7go_0llvm_0RR_3bool_9_8_6_7go_0llvm_0RR_9, ptr @go_0llvm.Zone.additionalProcessing }, %method.0 { ptr @go..C770, ptr @go..C771, ptr @type..func_8context_0Context_3go_0llvm_0Request_3string_3uint16_9_8_6_7go_0llvm_0RR_3go_0llvm_0Result_9, ptr @type..func_8_2go_0llvm_0Zone_3context_0Context_3go_0llvm_0Request_3string_3uint16_9_8_6_7go_0llvm_0RR_3go_0llvm_0Result_9, ptr @go_0llvm.Zone.doLookup }, %method.0 { ptr @go..C778, ptr @go..C779, ptr @type..func_8context_0Context_3go_0llvm_0Request_3_2go_0llvm_0Elem_3_6_7go_0llvm_0RR_9_8_6_7go_0llvm_0RR_3_6_7go_0llvm_0RR_3_6_7go_0llvm_0RR_3go_0llvm_0Result_9, ptr @type..func_8_2go_0llvm_0Zone_3context_0Context_3go_0llvm_0Request_3_2go_0llvm_0Elem_3_6_7go_0llvm_0RR_9_8_6_7go_0llvm_0RR_3_6_7go_0llvm_0RR_3_6_7go_0llvm_0RR_3go_0llvm_0Result_9, ptr @go_0llvm.Zone.externalLookup }, %method.0 { ptr @go..C786, ptr @go..C787, ptr @type..func_8string_3int_9_8string_3bool_9, ptr @type..func_8_2go_0llvm_0Zone_3string_3int_9_8string_3bool_9, ptr @go_0llvm.Zone.nameFromRight }, %method.0 { ptr @go..C794, ptr @go..C795, ptr @type..func_8bool_9_8_6_7go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0Zone_3bool_9_8_6_7go_0llvm_0RR_9, ptr @go_0llvm.Zone.ns..stub }, %method.0 { ptr @go..C799, ptr @go..C800, ptr @type..func_8int32_9_8_9, ptr @type..func_8_2go_0llvm_0Zone_3int32_9_8_9, ptr @go_0llvm.Zone.sync_0rUnlockSlow..stub }, %method.0 { ptr @go..C804, ptr @go..C805, ptr @type..func_8bool_9_8_6_7go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0Zone_3bool_9_8_6_7go_0llvm_0RR_9, ptr @go_0llvm.Zone.soa..stub }]
@go..C807 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.41 { ptr @go..C806, i64 18, i64 18 } }
@type.._2_2go_0llvm_0Zone = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -401891175, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C808, ptr null, ptr null }, ptr @go_0llvm.Zone..p }, comdat
@const.346 = private constant [21 x i8] c"**\09go.llvm\09llvm.Zone\00", align 1
@go..C808 = internal constant { ptr, i64 } { ptr @const.346, i64 20 }
@const.347 = private constant [7 x i8] c"origin\00", align 1
@go..C809 = internal constant { ptr, i64 } { ptr @const.347, i64 6 }
@go..C810 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.348 = private constant [8 x i8] c"origLen\00", align 1
@go..C811 = internal constant { ptr, i64 } { ptr @const.348, i64 7 }
@go..C812 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.349 = private constant [5 x i8] c"file\00", align 1
@go..C813 = internal constant { ptr, i64 } { ptr @const.349, i64 4 }
@go..C814 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.350 = private constant [5 x i8] c"Tree\00", align 1
@go..C815 = internal constant { ptr, i64 } { ptr @const.350, i64 4 }
@go_0llvm.Tree..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -318703895, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C816, ptr @go..C828, ptr @type.._2_2go_0llvm_0Tree }, ptr @go_0llvm.Tree..d }, comdat
@const.351 = private constant [20 x i8] c"*\09go.llvm\09llvm.Tree\00", align 1
@go..C816 = internal constant { ptr, i64 } { ptr @const.351, i64 19 }
@go..C817 = internal constant { ptr, i64 } { ptr @const.296, i64 4 }
@type..func_8_2go_0llvm_0Tree_3_6_7go_0llvm_0RR_3bool_9_8_6_7go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 413068712, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C818, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C819, i64 3, i64 3 }, %IPST.42 { ptr @go..C820, i64 1, i64 1 } }, comdat
@const.352 = private constant [71 x i8] c"func(*\09go.llvm\09llvm.Tree, []\09go.llvm\09llvm.RR, bool) []\09go.llvm\09llvm.RR\00", align 1
@go..C818 = internal constant { ptr, i64 } { ptr @const.352, i64 70 }
@go..C819 = internal constant [3 x ptr] [ptr @go_0llvm.Tree..p, ptr @type.._6_7go_0llvm_0RR, ptr @bool..d]
@go..C820 = internal constant [1 x ptr] [ptr @type.._6_7go_0llvm_0RR]
@go..C821 = internal constant { ptr, i64 } { ptr @const.291, i64 4 }
@type..func_8_2go_0llvm_0Tree_3string_9_8_2go_0llvm_0Elem_3bool_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -377150872, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C822, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C823, i64 2, i64 2 }, %IPST.42 { ptr @go..C824, i64 2, i64 2 } }, comdat
@const.353 = private constant [62 x i8] c"func(*\09go.llvm\09llvm.Tree, string) (*\09go.llvm\09llvm.Elem, bool)\00", align 1
@go..C822 = internal constant { ptr, i64 } { ptr @const.353, i64 61 }
@go..C823 = internal constant [2 x ptr] [ptr @go_0llvm.Tree..p, ptr @string..d]
@go..C824 = internal constant [2 x ptr] [ptr @go_0llvm.Elem..p, ptr @bool..d]
@go..C825 = internal constant { ptr, i64 } { ptr @const.316, i64 4 }
@go..C826 = internal constant { ptr, i64 } { ptr @const.317, i64 6 }
@go..C827 = internal constant [4 x %method.0] [%method.0 { ptr @go..C817, ptr null, ptr @type..func_8_6_7go_0llvm_0RR_3bool_9_8_6_7go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0Tree_3_6_7go_0llvm_0RR_3bool_9_8_6_7go_0llvm_0RR_9, ptr @go_0llvm.Tree.Glue }, %method.0 { ptr @go..C821, ptr null, ptr @type..func_8string_9_8_2go_0llvm_0Elem_3bool_9, ptr @type..func_8_2go_0llvm_0Tree_3string_9_8_2go_0llvm_0Elem_3bool_9, ptr @go_0llvm.Tree.Next }, %method.0 { ptr @go..C825, ptr null, ptr @type..func_8string_9_8_2go_0llvm_0Elem_3bool_9, ptr @type..func_8_2go_0llvm_0Tree_3string_9_8_2go_0llvm_0Elem_3bool_9, ptr @go_0llvm.Tree.Prev }, %method.0 { ptr @go..C826, ptr null, ptr @type..func_8string_9_8_2go_0llvm_0Elem_3bool_9, ptr @type..func_8_2go_0llvm_0Tree_3string_9_8_2go_0llvm_0Elem_3bool_9, ptr @go_0llvm.Tree.Search }]
@go..C828 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.41 { ptr @go..C827, i64 4, i64 4 } }
@type.._2_2go_0llvm_0Tree = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -804295015, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C829, ptr null, ptr null }, ptr @go_0llvm.Tree..p }, comdat
@const.354 = private constant [21 x i8] c"**\09go.llvm\09llvm.Tree\00", align 1
@go..C829 = internal constant { ptr, i64 } { ptr @const.354, i64 20 }
@go_0llvm.Tree..d = constant %StructType.0 { %_type.0 { i64 16, i64 8, i32 1859129198, i8 8, i8 8, i8 8, i8 25, ptr @runtime.memequal128..f, ptr @gcbits..ba, ptr @go..C830, ptr @go..C834, ptr @go_0llvm.Tree..p }, %IPST.43 { ptr @go..C854, i64 2, i64 2 } }
@runtime.memequal128..f = external constant %functionDescriptor.0
@const.355 = private constant [19 x i8] c"\09go.llvm\09llvm.Tree\00", align 1
@go..C830 = internal constant { ptr, i64 } { ptr @const.355, i64 18 }
@go..C831 = internal constant { ptr, i64 } { ptr @const.350, i64 4 }
@go..C832 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C833 = internal constant [1 x %method.0] zeroinitializer
@go..C834 = internal constant %uncommonType.0 { ptr @go..C831, ptr @go..C832, %IPST.41 { ptr @go..C833, i64 0, i64 0 } }
@go..C835 = internal constant { ptr, i64 } { ptr @const.154, i64 4 }
@go_0llvm.Node..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -391165399, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C836, ptr null, ptr null }, ptr @go_0llvm.Node..d }, comdat
@const.356 = private constant [20 x i8] c"*\09go.llvm\09llvm.Node\00", align 1
@go..C836 = internal constant { ptr, i64 } { ptr @const.356, i64 19 }
@go_0llvm.Node..d = constant %StructType.0 { %_type.0 { i64 32, i64 24, i32 512423074, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.Node..eq..f, ptr @gcbits..ha, ptr @go..C837, ptr @go..C841, ptr @go_0llvm.Node..p }, %IPST.43 { ptr @go..C852, i64 4, i64 4 } }
@go_0llvm.Node..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.Node..eq to i64) }
@const.357 = private constant [19 x i8] c"\09go.llvm\09llvm.Node\00", align 1
@go..C837 = internal constant { ptr, i64 } { ptr @const.357, i64 18 }
@const.358 = private constant [5 x i8] c"Node\00", align 1
@go..C838 = internal constant { ptr, i64 } { ptr @const.358, i64 4 }
@go..C839 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C840 = internal constant [1 x %method.0] zeroinitializer
@go..C841 = internal constant %uncommonType.0 { ptr @go..C838, ptr @go..C839, %IPST.41 { ptr @go..C840, i64 0, i64 0 } }
@go..C842 = internal constant { ptr, i64 } { ptr @const.310, i64 4 }
@const.359 = private constant [5 x i8] c"Left\00", align 1
@go..C843 = internal constant { ptr, i64 } { ptr @const.359, i64 4 }
@const.360 = private constant [6 x i8] c"Right\00", align 1
@go..C844 = internal constant { ptr, i64 } { ptr @const.360, i64 5 }
@const.361 = private constant [6 x i8] c"Color\00", align 1
@go..C845 = internal constant { ptr, i64 } { ptr @const.361, i64 5 }
@go_0llvm.Color..d = constant %_type.0 { i64 1, i64 0, i32 1235516833, i8 8, i8 1, i8 1, i8 -127, ptr @runtime.memequal8..f, ptr null, ptr @go..C846, ptr @go..C850, ptr @go_0llvm.Color..p }
@const.362 = private constant [20 x i8] c"\09go.llvm\09llvm.Color\00", align 1
@go..C846 = internal constant { ptr, i64 } { ptr @const.362, i64 19 }
@go..C847 = internal constant { ptr, i64 } { ptr @const.361, i64 5 }
@go..C848 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C849 = internal constant [1 x %method.0] zeroinitializer
@go..C850 = internal constant %uncommonType.0 { ptr @go..C847, ptr @go..C848, %IPST.41 { ptr @go..C849, i64 0, i64 0 } }
@go_0llvm.Color..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1706567143, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C851, ptr null, ptr null }, ptr @go_0llvm.Color..d }, comdat
@const.363 = private constant [21 x i8] c"*\09go.llvm\09llvm.Color\00", align 1
@go..C851 = internal constant { ptr, i64 } { ptr @const.363, i64 20 }
@go..C852 = internal constant [4 x %structField.0] [%structField.0 { ptr @go..C842, ptr null, ptr @go_0llvm.Elem..p, ptr null, i64 0 }, %structField.0 { ptr @go..C843, ptr null, ptr @go_0llvm.Node..p, ptr null, i64 16 }, %structField.0 { ptr @go..C844, ptr null, ptr @go_0llvm.Node..p, ptr null, i64 32 }, %structField.0 { ptr @go..C845, ptr null, ptr @go_0llvm.Color..d, ptr null, i64 48 }]
@const.364 = private constant [6 x i8] c"Count\00", align 1
@go..C853 = internal constant { ptr, i64 } { ptr @const.364, i64 5 }
@go..C854 = internal constant [2 x %structField.0] [%structField.0 { ptr @go..C835, ptr null, ptr @go_0llvm.Node..p, ptr null, i64 0 }, %structField.0 { ptr @go..C853, ptr null, ptr @int..d, ptr null, i64 16 }]
@const.365 = private constant [5 x i8] c"Apex\00", align 1
@go..C855 = internal constant { ptr, i64 } { ptr @const.365, i64 4 }
@go_0llvm.Apex..d = constant %StructType.0 { %_type.0 { i64 80, i64 64, i32 2100767578, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..te, ptr @go..C856, ptr @go..C867, ptr @go_0llvm.Apex..p }, %IPST.43 { ptr @go..C883, i64 4, i64 4 } }
@gcbits..te = weak constant [1 x i8] c"\93", comdat
@const.366 = private constant [19 x i8] c"\09go.llvm\09llvm.Apex\00", align 1
@go..C856 = internal constant { ptr, i64 } { ptr @const.366, i64 18 }
@go..C857 = internal constant { ptr, i64 } { ptr @const.365, i64 4 }
@go..C858 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C859 = internal constant { ptr, i64 } { ptr @const.318, i64 2 }
@go..C860 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8go_0llvm_0Apex_3bool_9_8_6_7go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -484084856, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C861, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C862, i64 2, i64 2 }, %IPST.42 { ptr @go..C863, i64 1, i64 1 } }, comdat
@const.367 = private constant [50 x i8] c"func(\09go.llvm\09llvm.Apex, bool) []\09go.llvm\09llvm.RR\00", align 1
@go..C861 = internal constant { ptr, i64 } { ptr @const.367, i64 49 }
@go..C862 = internal constant [2 x ptr] [ptr @go_0llvm.Apex..d, ptr @bool..d]
@go..C863 = internal constant [1 x ptr] [ptr @type.._6_7go_0llvm_0RR]
@go..C864 = internal constant { ptr, i64 } { ptr @const.321, i64 3 }
@go..C865 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C866 = internal constant [2 x %method.0] [%method.0 { ptr @go..C859, ptr @go..C860, ptr @type..func_8bool_9_8_6_7go_0llvm_0RR_9, ptr @type..func_8go_0llvm_0Apex_3bool_9_8_6_7go_0llvm_0RR_9, ptr @go_0llvm.Apex.ns }, %method.0 { ptr @go..C864, ptr @go..C865, ptr @type..func_8bool_9_8_6_7go_0llvm_0RR_9, ptr @type..func_8go_0llvm_0Apex_3bool_9_8_6_7go_0llvm_0RR_9, ptr @go_0llvm.Apex.soa }]
@go..C867 = internal constant %uncommonType.0 { ptr @go..C857, ptr @go..C858, %IPST.41 { ptr @go..C866, i64 2, i64 2 } }
@go_0llvm.Apex..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -747457111, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C868, ptr @go..C877, ptr @type.._2_2go_0llvm_0Apex }, ptr @go_0llvm.Apex..d }, comdat
@const.368 = private constant [20 x i8] c"*\09go.llvm\09llvm.Apex\00", align 1
@go..C868 = internal constant { ptr, i64 } { ptr @const.368, i64 19 }
@go..C869 = internal constant { ptr, i64 } { ptr @const.318, i64 2 }
@go..C870 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8_2go_0llvm_0Apex_3bool_9_8_6_7go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1432961688, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C871, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C872, i64 2, i64 2 }, %IPST.42 { ptr @go..C873, i64 1, i64 1 } }, comdat
@const.369 = private constant [51 x i8] c"func(*\09go.llvm\09llvm.Apex, bool) []\09go.llvm\09llvm.RR\00", align 1
@go..C871 = internal constant { ptr, i64 } { ptr @const.369, i64 50 }
@go..C872 = internal constant [2 x ptr] [ptr @go_0llvm.Apex..p, ptr @bool..d]
@go..C873 = internal constant [1 x ptr] [ptr @type.._6_7go_0llvm_0RR]
@go..C874 = internal constant { ptr, i64 } { ptr @const.321, i64 3 }
@go..C875 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C876 = internal constant [2 x %method.0] [%method.0 { ptr @go..C869, ptr @go..C870, ptr @type..func_8bool_9_8_6_7go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0Apex_3bool_9_8_6_7go_0llvm_0RR_9, ptr @go_0llvm.Apex.ns }, %method.0 { ptr @go..C874, ptr @go..C875, ptr @type..func_8bool_9_8_6_7go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0Apex_3bool_9_8_6_7go_0llvm_0RR_9, ptr @go_0llvm.Apex.soa }]
@go..C877 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.41 { ptr @go..C876, i64 2, i64 2 } }
@type.._2_2go_0llvm_0Apex = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 925588121, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C878, ptr null, ptr null }, ptr @go_0llvm.Apex..p }, comdat
@const.370 = private constant [21 x i8] c"**\09go.llvm\09llvm.Apex\00", align 1
@go..C878 = internal constant { ptr, i64 } { ptr @const.370, i64 20 }
@go..C879 = internal constant { ptr, i64 } { ptr @const.1, i64 3 }
@go..C880 = internal constant { ptr, i64 } { ptr @const.69, i64 2 }
@const.371 = private constant [7 x i8] c"SIGSOA\00", align 1
@go..C881 = internal constant { ptr, i64 } { ptr @const.371, i64 6 }
@const.372 = private constant [6 x i8] c"SIGNS\00", align 1
@go..C882 = internal constant { ptr, i64 } { ptr @const.372, i64 5 }
@go..C883 = internal constant [4 x %structField.0] [%structField.0 { ptr @go..C879, ptr null, ptr @go_0llvm.SOA..p, ptr null, i64 0 }, %structField.0 { ptr @go..C880, ptr null, ptr @type.._6_7go_0llvm_0RR, ptr null, i64 16 }, %structField.0 { ptr @go..C881, ptr null, ptr @type.._6_7go_0llvm_0RR, ptr null, i64 64 }, %structField.0 { ptr @go..C882, ptr null, ptr @type.._6_7go_0llvm_0RR, ptr null, i64 112 }]
@const.373 = private constant [8 x i8] c"Expired\00", align 1
@go..C884 = internal constant { ptr, i64 } { ptr @const.373, i64 7 }
@go..C885 = internal constant { ptr, i64 } { ptr @const.278, i64 7 }
@const.374 = private constant [12 x i8] c"StartupOnce\00", align 1
@go..C886 = internal constant { ptr, i64 } { ptr @const.374, i64 11 }
@sync.Once..d = external constant %StructType.0
@const.375 = private constant [13 x i8] c"TransferFrom\00", align 1
@go..C887 = internal constant { ptr, i64 } { ptr @const.375, i64 12 }
@const.376 = private constant [15 x i8] c"ReloadInterval\00", align 1
@go..C888 = internal constant { ptr, i64 } { ptr @const.376, i64 14 }
@const.377 = private constant [15 x i8] c"reloadShutdown\00", align 1
@go..C889 = internal constant { ptr, i64 } { ptr @const.377, i64 14 }
@go..C890 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..chan_bbool = weak constant %ChanType.0 { %_type.0 { i64 8, i64 8, i32 1966551623, i8 8, i8 8, i8 8, i8 50, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C891, ptr null, ptr null }, ptr @bool..d, i64 3 }, comdat
@const.378 = private constant [10 x i8] c"chan bool\00", align 1
@go..C891 = internal constant { ptr, i64 } { ptr @const.378, i64 9 }
@const.379 = private constant [9 x i8] c"Upstream\00", align 1
@go..C892 = internal constant { ptr, i64 } { ptr @const.379, i64 8 }
@go_0llvm.Upstream..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1322975673, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C893, ptr @go..C902, ptr @type.._2_2go_0llvm_0Upstream }, ptr @go_0llvm.Upstream..d }, comdat
@const.380 = private constant [24 x i8] c"*\09go.llvm\09llvm.Upstream\00", align 1
@go..C893 = internal constant { ptr, i64 } { ptr @const.380, i64 23 }
@go..C894 = internal constant { ptr, i64 } { ptr @const.327, i64 6 }
@type..func_8context_0Context_3go_0llvm_0Request_3string_3uint16_9_8_2go_0llvm_0Msg_3error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 912431080, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C895, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C896, i64 4, i64 4 }, %IPST.42 { ptr @go..C897, i64 2, i64 2 } }, comdat
@const.381 = private constant [98 x i8] c"func(\09context\09context.Context, \09go.llvm\09llvm.Request, string, uint16) (*\09go.llvm\09llvm.Msg, error)\00", align 1
@go..C895 = internal constant { ptr, i64 } { ptr @const.381, i64 97 }
@go..C896 = internal constant [4 x ptr] [ptr @context.Context..d, ptr @go_0llvm.Request..d, ptr @string..d, ptr @uint16..d]
@go..C897 = internal constant [2 x ptr] [ptr @go_0llvm.Msg..p, ptr @error..d]
@type..func_8_2go_0llvm_0Upstream_3context_0Context_3go_0llvm_0Request_3string_3uint16_9_8_2go_0llvm_0Msg_3error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -804520664, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C898, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C899, i64 5, i64 5 }, %IPST.42 { ptr @go..C900, i64 2, i64 2 } }, comdat
@const.382 = private constant [123 x i8] c"func(*\09go.llvm\09llvm.Upstream, \09context\09context.Context, \09go.llvm\09llvm.Request, string, uint16) (*\09go.llvm\09llvm.Msg, error)\00", align 1
@go..C898 = internal constant { ptr, i64 } { ptr @const.382, i64 122 }
@go..C899 = internal constant [5 x ptr] [ptr @go_0llvm.Upstream..p, ptr @context.Context..d, ptr @go_0llvm.Request..d, ptr @string..d, ptr @uint16..d]
@go..C900 = internal constant [2 x ptr] [ptr @go_0llvm.Msg..p, ptr @error..d]
@go..C901 = internal constant [1 x %method.0] [%method.0 { ptr @go..C894, ptr null, ptr @type..func_8context_0Context_3go_0llvm_0Request_3string_3uint16_9_8_2go_0llvm_0Msg_3error_9, ptr @type..func_8_2go_0llvm_0Upstream_3context_0Context_3go_0llvm_0Request_3string_3uint16_9_8_2go_0llvm_0Msg_3error_9, ptr @go_0llvm.Upstream.Lookup }]
@go..C902 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.41 { ptr @go..C901, i64 1, i64 1 } }
@type.._2_2go_0llvm_0Upstream = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -307225703, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C903, ptr null, ptr null }, ptr @go_0llvm.Upstream..p }, comdat
@const.383 = private constant [25 x i8] c"**\09go.llvm\09llvm.Upstream\00", align 1
@go..C903 = internal constant { ptr, i64 } { ptr @const.383, i64 24 }
@go_0llvm.Upstream..d = constant %StructType.0 { %_type.0 { i64 0, i64 0, i32 -1796362213, i8 8, i8 1, i8 1, i8 -103, ptr @runtime.memequal0..f, ptr null, ptr @go..C904, ptr @go..C908, ptr @go_0llvm.Upstream..p }, %IPST.43 { ptr @go..C909, i64 0, i64 0 } }
@const.384 = private constant [23 x i8] c"\09go.llvm\09llvm.Upstream\00", align 1
@go..C904 = internal constant { ptr, i64 } { ptr @const.384, i64 22 }
@go..C905 = internal constant { ptr, i64 } { ptr @const.379, i64 8 }
@go..C906 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C907 = internal constant [1 x %method.0] zeroinitializer
@go..C908 = internal constant %uncommonType.0 { ptr @go..C905, ptr @go..C906, %IPST.41 { ptr @go..C907, i64 0, i64 0 } }
@go..C909 = internal constant [1 x %structField.0] zeroinitializer
@go..C910 = internal constant [12 x %structField.0] [%structField.0 { ptr @go..C809, ptr @go..C810, ptr @string..d, ptr null, i64 0 }, %structField.0 { ptr @go..C811, ptr @go..C812, ptr @int..d, ptr null, i64 32 }, %structField.0 { ptr @go..C813, ptr @go..C814, ptr @string..d, ptr null, i64 48 }, %structField.0 { ptr @go..C815, ptr null, ptr @go_0llvm.Tree..p, ptr null, i64 81 }, %structField.0 { ptr @go..C855, ptr null, ptr @go_0llvm.Apex..d, ptr null, i64 97 }, %structField.0 { ptr @go..C884, ptr null, ptr @bool..d, ptr null, i64 256 }, %structField.0 { ptr @go..C885, ptr null, ptr @sync.RWMutex..d, ptr null, i64 265 }, %structField.0 { ptr @go..C886, ptr null, ptr @sync.Once..d, ptr null, i64 312 }, %structField.0 { ptr @go..C887, ptr null, ptr @type.._6_7string, ptr null, i64 336 }, %structField.0 { ptr @go..C888, ptr null, ptr @time.Duration..d, ptr null, i64 384 }, %structField.0 { ptr @go..C889, ptr @go..C890, ptr @type..chan_bbool, ptr null, i64 400 }, %structField.0 { ptr @go..C892, ptr null, ptr @go_0llvm.Upstream..p, ptr null, i64 416 }]
@go_0llvm.Key..d = constant %StructType.0 { %_type.0 { i64 0, i64 0, i32 -974766839, i8 8, i8 1, i8 1, i8 -103, ptr @runtime.memequal0..f, ptr null, ptr @go..C911, ptr @go..C915, ptr @go_0llvm.Key..p }, %IPST.43 { ptr @go..C917, i64 0, i64 0 } }
@const.385 = private constant [18 x i8] c"\09go.llvm\09llvm.Key\00", align 1
@go..C911 = internal constant { ptr, i64 } { ptr @const.385, i64 17 }
@const.386 = private constant [4 x i8] c"Key\00", align 1
@go..C912 = internal constant { ptr, i64 } { ptr @const.386, i64 3 }
@go..C913 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C914 = internal constant [1 x %method.0] zeroinitializer
@go..C915 = internal constant %uncommonType.0 { ptr @go..C912, ptr @go..C913, %IPST.41 { ptr @go..C914, i64 0, i64 0 } }
@go_0llvm.Key..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1583599769, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C916, ptr null, ptr null }, ptr @go_0llvm.Key..d }, comdat
@const.387 = private constant [19 x i8] c"*\09go.llvm\09llvm.Key\00", align 1
@go..C916 = internal constant { ptr, i64 } { ptr @const.387, i64 18 }
@go..C917 = internal constant [1 x %structField.0] zeroinitializer
@go_0llvm.LoopKey..d = constant %StructType.0 { %_type.0 { i64 0, i64 0, i32 -1961596669, i8 8, i8 1, i8 1, i8 -103, ptr @runtime.memequal0..f, ptr null, ptr @go..C918, ptr @go..C922, ptr @go_0llvm.LoopKey..p }, %IPST.43 { ptr @go..C924, i64 0, i64 0 } }
@const.388 = private constant [22 x i8] c"\09go.llvm\09llvm.LoopKey\00", align 1
@go..C918 = internal constant { ptr, i64 } { ptr @const.388, i64 21 }
@const.389 = private constant [8 x i8] c"LoopKey\00", align 1
@go..C919 = internal constant { ptr, i64 } { ptr @const.389, i64 7 }
@go..C920 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C921 = internal constant [1 x %method.0] zeroinitializer
@go..C922 = internal constant %uncommonType.0 { ptr @go..C919, ptr @go..C920, %IPST.41 { ptr @go..C921, i64 0, i64 0 } }
@go_0llvm.LoopKey..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1320775623, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C923, ptr null, ptr null }, ptr @go_0llvm.LoopKey..d }, comdat
@const.390 = private constant [23 x i8] c"*\09go.llvm\09llvm.LoopKey\00", align 1
@go..C923 = internal constant { ptr, i64 } { ptr @const.390, i64 22 }
@go..C924 = internal constant [1 x %structField.0] zeroinitializer
@go_0llvm.ViewKey..d = constant %StructType.0 { %_type.0 { i64 0, i64 0, i32 1546472894, i8 8, i8 1, i8 1, i8 -103, ptr @runtime.memequal0..f, ptr null, ptr @go..C925, ptr @go..C929, ptr @go_0llvm.ViewKey..p }, %IPST.43 { ptr @go..C931, i64 0, i64 0 } }
@const.391 = private constant [22 x i8] c"\09go.llvm\09llvm.ViewKey\00", align 1
@go..C925 = internal constant { ptr, i64 } { ptr @const.391, i64 21 }
@const.392 = private constant [8 x i8] c"ViewKey\00", align 1
@go..C926 = internal constant { ptr, i64 } { ptr @const.392, i64 7 }
@go..C927 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C928 = internal constant [1 x %method.0] zeroinitializer
@go..C929 = internal constant %uncommonType.0 { ptr @go..C926, ptr @go..C927, %IPST.41 { ptr @go..C928, i64 0, i64 0 } }
@go_0llvm.ViewKey..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1026237463, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C930, ptr null, ptr null }, ptr @go_0llvm.ViewKey..d }, comdat
@const.393 = private constant [23 x i8] c"*\09go.llvm\09llvm.ViewKey\00", align 1
@go..C930 = internal constant { ptr, i64 } { ptr @const.393, i64 22 }
@go..C931 = internal constant [1 x %structField.0] zeroinitializer
@go_0llvm.NonWriter..d = constant %StructType.0 { %_type.0 { i64 24, i64 24, i32 -728878526, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.NonWriter..eq..f, ptr @gcbits..ha, ptr @go..C932, ptr @go..C962, ptr @go_0llvm.NonWriter..p }, %IPST.43 { ptr @go..C995, i64 2, i64 2 } }
@go_0llvm.NonWriter..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.NonWriter..eq to i64) }
@const.394 = private constant [24 x i8] c"\09go.llvm\09llvm.NonWriter\00", align 1
@go..C932 = internal constant { ptr, i64 } { ptr @const.394, i64 23 }
@const.395 = private constant [10 x i8] c"NonWriter\00", align 1
@go..C933 = internal constant { ptr, i64 } { ptr @const.395, i64 9 }
@go..C934 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C935 = internal constant { ptr, i64 } { ptr @const.77, i64 5 }
@type..func_8go_0llvm_0NonWriter_9_8error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -660537848, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C936, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C937, i64 1, i64 1 }, %IPST.42 { ptr @go..C938, i64 1, i64 1 } }, comdat
@const.396 = private constant [36 x i8] c"func(\09go.llvm\09llvm.NonWriter) error\00", align 1
@go..C936 = internal constant { ptr, i64 } { ptr @const.396, i64 35 }
@go..C937 = internal constant [1 x ptr] [ptr @go_0llvm.NonWriter..d]
@go..C938 = internal constant [1 x ptr] [ptr @error..d]
@go..C939 = internal constant { ptr, i64 } { ptr @const.83, i64 6 }
@type..func_8go_0llvm_0NonWriter_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1849276344, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C940, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C941, i64 1, i64 1 }, %IPST.42 { ptr @go..C942, i64 0, i64 0 } }, comdat
@const.397 = private constant [30 x i8] c"func(\09go.llvm\09llvm.NonWriter)\00", align 1
@go..C940 = internal constant { ptr, i64 } { ptr @const.397, i64 29 }
@go..C941 = internal constant [1 x ptr] [ptr @go_0llvm.NonWriter..d]
@go..C942 = internal constant [1 x ptr] zeroinitializer
@go..C943 = internal constant { ptr, i64 } { ptr @const.85, i64 9 }
@type..func_8go_0llvm_0NonWriter_9_8net_0Addr_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1815517688, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C944, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C945, i64 1, i64 1 }, %IPST.42 { ptr @go..C946, i64 1, i64 1 } }, comdat
@const.398 = private constant [44 x i8] c"func(\09go.llvm\09llvm.NonWriter) \09net\09net.Addr\00", align 1
@go..C944 = internal constant { ptr, i64 } { ptr @const.398, i64 43 }
@go..C945 = internal constant [1 x ptr] [ptr @go_0llvm.NonWriter..d]
@go..C946 = internal constant [1 x ptr] [ptr @net.Addr..d]
@go..C947 = internal constant { ptr, i64 } { ptr @const.87, i64 10 }
@go..C948 = internal constant { ptr, i64 } { ptr @const.88, i64 10 }
@go..C949 = internal constant { ptr, i64 } { ptr @const.89, i64 14 }
@type..func_8go_0llvm_0NonWriter_3bool_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 2083826824, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C950, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C951, i64 2, i64 2 }, %IPST.42 { ptr @go..C952, i64 0, i64 0 } }, comdat
@const.399 = private constant [36 x i8] c"func(\09go.llvm\09llvm.NonWriter, bool)\00", align 1
@go..C950 = internal constant { ptr, i64 } { ptr @const.399, i64 35 }
@go..C951 = internal constant [2 x ptr] [ptr @go_0llvm.NonWriter..d, ptr @bool..d]
@go..C952 = internal constant [1 x ptr] zeroinitializer
@go..C953 = internal constant { ptr, i64 } { ptr @const.93, i64 5 }
@type..func_8go_0llvm_0NonWriter_3_6_7uint8_9_8int_3error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 559269384, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C954, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C955, i64 2, i64 2 }, %IPST.42 { ptr @go..C956, i64 2, i64 2 } }, comdat
@const.400 = private constant [52 x i8] c"func(\09go.llvm\09llvm.NonWriter, []uint8) (int, error)\00", align 1
@go..C954 = internal constant { ptr, i64 } { ptr @const.400, i64 51 }
@go..C955 = internal constant [2 x ptr] [ptr @go_0llvm.NonWriter..d, ptr @type.._6_7uint8]
@go..C956 = internal constant [2 x ptr] [ptr @int..d, ptr @error..d]
@go..C957 = internal constant { ptr, i64 } { ptr @const.100, i64 8 }
@type..func_8go_0llvm_0NonWriter_3_2go_0llvm_0Msg_9_8error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1023083448, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C958, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C959, i64 2, i64 2 }, %IPST.42 { ptr @go..C960, i64 1, i64 1 } }, comdat
@const.401 = private constant [56 x i8] c"func(\09go.llvm\09llvm.NonWriter, *\09go.llvm\09llvm.Msg) error\00", align 1
@go..C958 = internal constant { ptr, i64 } { ptr @const.401, i64 55 }
@go..C959 = internal constant [2 x ptr] [ptr @go_0llvm.NonWriter..d, ptr @go_0llvm.Msg..p]
@go..C960 = internal constant [1 x ptr] [ptr @error..d]
@go..C961 = internal constant [8 x %method.0] [%method.0 { ptr @go..C935, ptr null, ptr @type..func_8_9_8error_9, ptr @type..func_8go_0llvm_0NonWriter_9_8error_9, ptr @go_0llvm.NonWriter.Close..stub }, %method.0 { ptr @go..C939, ptr null, ptr @type..func_8_9_8_9, ptr @type..func_8go_0llvm_0NonWriter_9_8_9, ptr @go_0llvm.NonWriter.Hijack..stub }, %method.0 { ptr @go..C943, ptr null, ptr @type..func_8_9_8net_0Addr_9, ptr @type..func_8go_0llvm_0NonWriter_9_8net_0Addr_9, ptr @go_0llvm.NonWriter.LocalAddr..stub }, %method.0 { ptr @go..C947, ptr null, ptr @type..func_8_9_8net_0Addr_9, ptr @type..func_8go_0llvm_0NonWriter_9_8net_0Addr_9, ptr @go_0llvm.NonWriter.RemoteAddr..stub }, %method.0 { ptr @go..C948, ptr null, ptr @type..func_8_9_8error_9, ptr @type..func_8go_0llvm_0NonWriter_9_8error_9, ptr @go_0llvm.NonWriter.TsigStatus..stub }, %method.0 { ptr @go..C949, ptr null, ptr @type..func_8bool_9_8_9, ptr @type..func_8go_0llvm_0NonWriter_3bool_9_8_9, ptr @go_0llvm.NonWriter.TsigTimersOnly..stub }, %method.0 { ptr @go..C953, ptr null, ptr @type..func_8_6_7uint8_9_8int_3error_9, ptr @type..func_8go_0llvm_0NonWriter_3_6_7uint8_9_8int_3error_9, ptr @go_0llvm.NonWriter.Write..stub }, %method.0 { ptr @go..C957, ptr null, ptr @type..func_8_2go_0llvm_0Msg_9_8error_9, ptr @type..func_8go_0llvm_0NonWriter_3_2go_0llvm_0Msg_9_8error_9, ptr @go_0llvm.NonWriter.WriteMsg..stub }]
@go..C962 = internal constant %uncommonType.0 { ptr @go..C933, ptr @go..C934, %IPST.41 { ptr @go..C961, i64 8, i64 8 } }
@go_0llvm.NonWriter..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1222845481, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C963, ptr @go..C991, ptr @type.._2_2go_0llvm_0NonWriter }, ptr @go_0llvm.NonWriter..d }, comdat
@const.402 = private constant [25 x i8] c"*\09go.llvm\09llvm.NonWriter\00", align 1
@go..C963 = internal constant { ptr, i64 } { ptr @const.402, i64 24 }
@go..C964 = internal constant { ptr, i64 } { ptr @const.77, i64 5 }
@type..func_8_2go_0llvm_0NonWriter_9_8error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1665088232, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C965, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C966, i64 1, i64 1 }, %IPST.42 { ptr @go..C967, i64 1, i64 1 } }, comdat
@const.403 = private constant [37 x i8] c"func(*\09go.llvm\09llvm.NonWriter) error\00", align 1
@go..C965 = internal constant { ptr, i64 } { ptr @const.403, i64 36 }
@go..C966 = internal constant [1 x ptr] [ptr @go_0llvm.NonWriter..p]
@go..C967 = internal constant [1 x ptr] [ptr @error..d]
@go..C968 = internal constant { ptr, i64 } { ptr @const.83, i64 6 }
@type..func_8_2go_0llvm_0NonWriter_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 476349736, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C969, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C970, i64 1, i64 1 }, %IPST.42 { ptr @go..C971, i64 0, i64 0 } }, comdat
@const.404 = private constant [31 x i8] c"func(*\09go.llvm\09llvm.NonWriter)\00", align 1
@go..C969 = internal constant { ptr, i64 } { ptr @const.404, i64 30 }
@go..C970 = internal constant [1 x ptr] [ptr @go_0llvm.NonWriter..p]
@go..C971 = internal constant [1 x ptr] zeroinitializer
@go..C972 = internal constant { ptr, i64 } { ptr @const.85, i64 9 }
@type..func_8_2go_0llvm_0NonWriter_9_8net_0Addr_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 510108392, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C973, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C974, i64 1, i64 1 }, %IPST.42 { ptr @go..C975, i64 1, i64 1 } }, comdat
@const.405 = private constant [45 x i8] c"func(*\09go.llvm\09llvm.NonWriter) \09net\09net.Addr\00", align 1
@go..C973 = internal constant { ptr, i64 } { ptr @const.405, i64 44 }
@go..C974 = internal constant [1 x ptr] [ptr @go_0llvm.NonWriter..p]
@go..C975 = internal constant [1 x ptr] [ptr @net.Addr..d]
@go..C976 = internal constant { ptr, i64 } { ptr @const.87, i64 10 }
@go..C977 = internal constant { ptr, i64 } { ptr @const.88, i64 10 }
@go..C978 = internal constant { ptr, i64 } { ptr @const.89, i64 14 }
@type..func_8_2go_0llvm_0NonWriter_3bool_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 114485608, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C979, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C980, i64 2, i64 2 }, %IPST.42 { ptr @go..C981, i64 0, i64 0 } }, comdat
@const.406 = private constant [37 x i8] c"func(*\09go.llvm\09llvm.NonWriter, bool)\00", align 1
@go..C979 = internal constant { ptr, i64 } { ptr @const.406, i64 36 }
@go..C980 = internal constant [2 x ptr] [ptr @go_0llvm.NonWriter..p, ptr @bool..d]
@go..C981 = internal constant [1 x ptr] zeroinitializer
@go..C982 = internal constant { ptr, i64 } { ptr @const.93, i64 5 }
@type..func_8_2go_0llvm_0NonWriter_3_6_7uint8_9_8int_3error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1410071832, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C983, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C984, i64 2, i64 2 }, %IPST.42 { ptr @go..C985, i64 2, i64 2 } }, comdat
@const.407 = private constant [53 x i8] c"func(*\09go.llvm\09llvm.NonWriter, []uint8) (int, error)\00", align 1
@go..C983 = internal constant { ptr, i64 } { ptr @const.407, i64 52 }
@go..C984 = internal constant [2 x ptr] [ptr @go_0llvm.NonWriter..p, ptr @type.._6_7uint8]
@go..C985 = internal constant [2 x ptr] [ptr @int..d, ptr @error..d]
@go..C986 = internal constant { ptr, i64 } { ptr @const.100, i64 8 }
@type..func_8_2go_0llvm_0NonWriter_3_2go_0llvm_0Msg_9_8error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1302542632, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C987, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C988, i64 2, i64 2 }, %IPST.42 { ptr @go..C989, i64 1, i64 1 } }, comdat
@const.408 = private constant [57 x i8] c"func(*\09go.llvm\09llvm.NonWriter, *\09go.llvm\09llvm.Msg) error\00", align 1
@go..C987 = internal constant { ptr, i64 } { ptr @const.408, i64 56 }
@go..C988 = internal constant [2 x ptr] [ptr @go_0llvm.NonWriter..p, ptr @go_0llvm.Msg..p]
@go..C989 = internal constant [1 x ptr] [ptr @error..d]
@go..C990 = internal constant [8 x %method.0] [%method.0 { ptr @go..C964, ptr null, ptr @type..func_8_9_8error_9, ptr @type..func_8_2go_0llvm_0NonWriter_9_8error_9, ptr @go_0llvm.NonWriter.Close..stub }, %method.0 { ptr @go..C968, ptr null, ptr @type..func_8_9_8_9, ptr @type..func_8_2go_0llvm_0NonWriter_9_8_9, ptr @go_0llvm.NonWriter.Hijack..stub }, %method.0 { ptr @go..C972, ptr null, ptr @type..func_8_9_8net_0Addr_9, ptr @type..func_8_2go_0llvm_0NonWriter_9_8net_0Addr_9, ptr @go_0llvm.NonWriter.LocalAddr..stub }, %method.0 { ptr @go..C976, ptr null, ptr @type..func_8_9_8net_0Addr_9, ptr @type..func_8_2go_0llvm_0NonWriter_9_8net_0Addr_9, ptr @go_0llvm.NonWriter.RemoteAddr..stub }, %method.0 { ptr @go..C977, ptr null, ptr @type..func_8_9_8error_9, ptr @type..func_8_2go_0llvm_0NonWriter_9_8error_9, ptr @go_0llvm.NonWriter.TsigStatus..stub }, %method.0 { ptr @go..C978, ptr null, ptr @type..func_8bool_9_8_9, ptr @type..func_8_2go_0llvm_0NonWriter_3bool_9_8_9, ptr @go_0llvm.NonWriter.TsigTimersOnly..stub }, %method.0 { ptr @go..C982, ptr null, ptr @type..func_8_6_7uint8_9_8int_3error_9, ptr @type..func_8_2go_0llvm_0NonWriter_3_6_7uint8_9_8int_3error_9, ptr @go_0llvm.NonWriter.Write..stub }, %method.0 { ptr @go..C986, ptr null, ptr @type..func_8_2go_0llvm_0Msg_9_8error_9, ptr @type..func_8_2go_0llvm_0NonWriter_3_2go_0llvm_0Msg_9_8error_9, ptr @go_0llvm.NonWriter.WriteMsg..stub }]
@go..C991 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.41 { ptr @go..C990, i64 8, i64 8 } }
@type.._2_2go_0llvm_0NonWriter = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1909308775, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C992, ptr null, ptr null }, ptr @go_0llvm.NonWriter..p }, comdat
@const.409 = private constant [26 x i8] c"**\09go.llvm\09llvm.NonWriter\00", align 1
@go..C992 = internal constant { ptr, i64 } { ptr @const.409, i64 25 }
@go..C993 = internal constant { ptr, i64 } { ptr @const.75, i64 14 }
@go..C994 = internal constant { ptr, i64 } { ptr @const.104, i64 3 }
@go..C995 = internal constant [2 x %structField.0] [%structField.0 { ptr @go..C993, ptr null, ptr @go_0llvm.ResponseWriter..d, ptr null, i64 1 }, %structField.0 { ptr @go..C994, ptr null, ptr @go_0llvm.Msg..p, ptr null, i64 32 }]
@go_0llvm.Func..d = constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -793423952, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C996, ptr @go..C1000, ptr @go_0llvm.Func..p }, i8 0, %IPST.42 { ptr @go..C1002, i64 0, i64 0 }, %IPST.42 { ptr @go..C1003, i64 1, i64 1 } }
@const.410 = private constant [19 x i8] c"\09go.llvm\09llvm.Func\00", align 1
@go..C996 = internal constant { ptr, i64 } { ptr @const.410, i64 18 }
@const.411 = private constant [5 x i8] c"Func\00", align 1
@go..C997 = internal constant { ptr, i64 } { ptr @const.411, i64 4 }
@go..C998 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C999 = internal constant [1 x %method.0] zeroinitializer
@go..C1000 = internal constant %uncommonType.0 { ptr @go..C997, ptr @go..C998, %IPST.41 { ptr @go..C999, i64 0, i64 0 } }
@go_0llvm.Func..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 190118665, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C1001, ptr null, ptr null }, ptr @go_0llvm.Func..d }, comdat
@const.412 = private constant [20 x i8] c"*\09go.llvm\09llvm.Func\00", align 1
@go..C1001 = internal constant { ptr, i64 } { ptr @const.412, i64 19 }
@go..C1002 = internal constant [1 x ptr] zeroinitializer
@go..C1003 = internal constant [1 x ptr] [ptr @string..d]
@type.._61x_7go_0llvm_0RR = weak constant %ArrayType.0 { %_type.0 { i64 16, i64 16, i32 177114387, i8 0, i8 8, i8 8, i8 17, ptr null, ptr @gcbits..da, ptr @go..C1004, ptr null, ptr null }, ptr @go_0llvm.RR..d, ptr @type.._6_7go_0llvm_0RR, i64 1 }, comdat
@const.416 = private constant [20 x i8] c"[1]\09go.llvm\09llvm.RR\00", align 1
@go..C1004 = internal constant { ptr, i64 } { ptr @const.416, i64 19 }
@type..struct_4_4x_5f_b_2_4void_5_cgo_0llvm_0wildElem1_b_2_2go_0llvm_0Elem_5 = weak constant %StructType.0 { %_type.0 { i64 16, i64 16, i32 2078256740, i8 8, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..da, ptr @go..C1005, ptr null, ptr null }, %IPST.43 { ptr @go..C1010, i64 2, i64 2 } }, comdat
@const.417 = private constant [47 x i8] c"struct { f *; wildElem1 **\09go.llvm\09llvm.Elem }\00", align 1
@go..C1005 = internal constant { ptr, i64 } { ptr @const.417, i64 46 }
@const.418 = private constant [2 x i8] c"f\00", align 1
@go..C1006 = internal constant { ptr, i64 } { ptr @const.418, i64 1 }
@go..C1007 = internal constant { ptr, i64 } { ptr @const.418, i64 1 }
@const.419 = private constant [10 x i8] c"wildElem1\00", align 1
@go..C1008 = internal constant { ptr, i64 } { ptr @const.419, i64 9 }
@go..C1009 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C1010 = internal constant [2 x %structField.0] [%structField.0 { ptr @go..C1006, ptr @go..C1007, ptr @unsafe.Pointer..d, ptr null, i64 0 }, %structField.0 { ptr @go..C1008, ptr @go..C1009, ptr @type.._2_2go_0llvm_0Elem, ptr null, i64 16 }]
@const.420 = private constant [14 x i8] c"zone/wildcard\00", align 1
@const.422 = private constant [3 x i8] c"*.\00", align 1
@const.423 = private unnamed_addr constant { ptr, i64 } { ptr @const.422, i64 2 }
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
@sync.rlocker..p = external constant %PtrType.0
@pimt..interface_4Lock_bfunc_8_9_8_9_cUnlock_bfunc_8_9_8_9_5..sync.rlocker = internal constant { ptr, ptr, ptr } { ptr @sync.rlocker..p, ptr @sync.rlocker.Lock, ptr @sync.rlocker.Unlock }
@go.llvm..types = local_unnamed_addr constant { i64, [180 x ptr] } { i64 180, [180 x ptr] [ptr @string..p, ptr @uint16..p, ptr @uint32..p, ptr @go_0llvm.RR__Header..p, ptr @type..func_8_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0SOA_9_8_2go_0llvm_0RR__Header_9, ptr @go_0llvm.RR..p, ptr @type..func_8_9_8go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0SOA_9_8go_0llvm_0RR_9, ptr @type.._2_2go_0llvm_0SOA, ptr @go_0llvm.SOA..p, ptr @type..func_8_2go_0llvm_0DNAME_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0DNAME_9_8go_0llvm_0RR_9, ptr @type.._2_2go_0llvm_0DNAME, ptr @go_0llvm.DNAME..p, ptr @type..func_8_2go_0llvm_0CNAME_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0CNAME_9_8go_0llvm_0RR_9, ptr @type.._2_2go_0llvm_0CNAME, ptr @go_0llvm.CNAME..p, ptr @type..func_8_2go_0llvm_0SRV_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0SRV_9_8go_0llvm_0RR_9, ptr @type.._2_2go_0llvm_0SRV, ptr @go_0llvm.SRV..p, ptr @type..func_8_2go_0llvm_0MX_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0MX_9_8go_0llvm_0RR_9, ptr @type.._2_2go_0llvm_0MX, ptr @go_0llvm.MX..p, ptr @type..func_8_2go_0llvm_0NS_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0NS_9_8go_0llvm_0RR_9, ptr @type.._2_2go_0llvm_0NS, ptr @go_0llvm.NS..p, ptr @go_0llvm.ResponseWriter..p, ptr @error..p, ptr @type..func_8_9_8string_9, ptr @type..func_8_9_8error_9, ptr @type..func_8_9_8_9, ptr @type..func_8_9_8net_0Addr_9, ptr @bool..p, ptr @type..func_8bool_9_8_9, ptr @uint8..p, ptr @type.._6_7uint8, ptr @int..p, ptr @type..func_8_6_7uint8_9_8int_3error_9, ptr @go_0llvm.MsgHdr..p, ptr @go_0llvm.Question..p, ptr @type.._6_7go_0llvm_0Question, ptr @type.._6_7go_0llvm_0RR, ptr @go_0llvm.Msg..p, ptr @type..func_8_2go_0llvm_0Msg_9_8error_9, ptr @go_0llvm.compressionMap..p, ptr @type.._6_7string, ptr @type.._6_7int, ptr @type..map_6string_7int, ptr @type.._6_7uint16, ptr @type..map_6string_7uint16, ptr @go_0llvm.Config..p, ptr @type..func_8_2net_1http_0Request_9_8bool_9, ptr @go_0llvm.FilterFunc..p, ptr @type..func_8_9_8bool_9, ptr @type..func_8_2go_0llvm_0Request_9_8bool_9, ptr @type..func_8_2go_0llvm_0Request_9_8string_9, ptr @type..func_8_9_8uint16_9, ptr @type..func_8_2go_0llvm_0Request_9_8uint16_9, ptr @type.._2_2go_0llvm_0Request, ptr @int8..p, ptr @go_0llvm.Request..p, ptr @type.._6_7go_0llvm_0FilterFunc, ptr @type..map_6string_7string, ptr @go_0llvm.Plugin..p, ptr @go_0llvm.Handler..p, ptr @type..func_8context_0Context_3go_0llvm_0ResponseWriter_3_2go_0llvm_0Msg_9_8int_3error_9, ptr @type.._6_7go_0llvm_0Plugin, ptr @type.._6_7go_0llvm_0Handler, ptr @type..map_6string_7go_0llvm_0Handler, ptr @go_0llvm.MetadataCollector..p, ptr @type..func_8context_0Context_3go_0llvm_0Request_9_8context_0Context_9, ptr @go_0llvm.HandlerFunc..p, ptr @type..func_8go_0llvm_0ScrubWriter_9_8error_9, ptr @type..func_8go_0llvm_0ScrubWriter_9_8_9, ptr @type..func_8go_0llvm_0ScrubWriter_9_8net_0Addr_9, ptr @type..func_8go_0llvm_0ScrubWriter_3bool_9_8_9, ptr @type..func_8go_0llvm_0ScrubWriter_3_6_7uint8_9_8int_3error_9, ptr @type..func_8go_0llvm_0ScrubWriter_3_2go_0llvm_0Msg_9_8error_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_9_8error_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_9_8_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_9_8net_0Addr_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_3bool_9_8_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_3_6_7uint8_9_8int_3error_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_3_2go_0llvm_0Msg_9_8error_9, ptr @type.._2_2go_0llvm_0ScrubWriter, ptr @go_0llvm.ScrubWriter..p, ptr @go_0llvm.OPT..p, ptr @go_0llvm.EDNS0..p, ptr @type..func_8_9_8go_0llvm_0EDNS0_9, ptr @type..func_8_9_8_6_7uint8_3error_9, ptr @type..func_8_6_7uint8_9_8error_9, ptr @type.._6_7go_0llvm_0EDNS0, ptr @type..func_8_2go_0llvm_0supported_9_8_9, ptr @type..func_8_9_8sync_0Locker_9, ptr @type..func_8_2go_0llvm_0supported_9_8sync_0Locker_9, ptr @int32..p, ptr @type..func_8int32_9_8_9, ptr @type..func_8_2go_0llvm_0supported_3int32_9_8_9, ptr @type.._2_2go_0llvm_0supported, ptr @go_0llvm.supported..p, ptr @type..struct_4_5, ptr @type.._6_7struct_4_5, ptr @uintptr..p, ptr @type..map_6uint16_7struct_4_5, ptr @go_0llvm.Transfer..p, ptr @go_0llvm.Transferer..p, ptr @type.._x3c_x2dchan_b_6_7go_0llvm_0RR, ptr @type..func_8string_3uint32_9_8_x3c_x2dchan_b_6_7go_0llvm_0RR_3error_9, ptr @type.._6_7go_0llvm_0Transferer, ptr @go_0llvm.Zones..p, ptr @type..func_8_6_7go_0llvm_0RR_3bool_9_8_6_7go_0llvm_0RR_9, ptr @type..func_8go_0llvm_0Zone_3_6_7go_0llvm_0RR_3bool_9_8_6_7go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0Elem_9_8string_9, ptr @type..func_8uint16_9_8_6_7go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0Elem_3uint16_9_8_6_7go_0llvm_0RR_9, ptr @type..func_8uint16_3string_9_8_6_7go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0Elem_3uint16_3string_9_8_6_7go_0llvm_0RR_9, ptr @type.._2_2go_0llvm_0Elem, ptr @type.._6_7_6_7go_0llvm_0RR, ptr @type..map_6uint16_7_6_7go_0llvm_0RR, ptr @go_0llvm.Elem..p, ptr @type..func_8string_9_8_2go_0llvm_0Elem_3bool_9, ptr @type..func_8go_0llvm_0Zone_3string_9_8_2go_0llvm_0Elem_3bool_9, ptr @type..func_8bool_9_8_6_7go_0llvm_0RR_9, ptr @type..func_8go_0llvm_0Zone_3bool_9_8_6_7go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0Zone_3string_9_8_2go_0llvm_0Elem_3bool_9, ptr @type..func_8_2go_0llvm_0Zone_3_6_7go_0llvm_0RR_3bool_9_8_6_7go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0Zone_9_8_9, ptr @go_0llvm.Result..p, ptr @type..func_8context_0Context_3go_0llvm_0Request_3string_9_8_6_7go_0llvm_0RR_3_6_7go_0llvm_0RR_3_6_7go_0llvm_0RR_3go_0llvm_0Result_9, ptr @type..func_8_2go_0llvm_0Zone_3context_0Context_3go_0llvm_0Request_3string_9_8_6_7go_0llvm_0RR_3_6_7go_0llvm_0RR_3_6_7go_0llvm_0RR_3go_0llvm_0Result_9, ptr @type..func_8_2go_0llvm_0Zone_9_8sync_0Locker_9, ptr @type..func_8context_0Context_3go_0llvm_0Request_3string_3uint16_9_8_6_7go_0llvm_0RR_3go_0llvm_0Result_9, ptr @type..func_8_2go_0llvm_0Zone_3context_0Context_3go_0llvm_0Request_3string_3uint16_9_8_6_7go_0llvm_0RR_3go_0llvm_0Result_9, ptr @type..func_8context_0Context_3go_0llvm_0Request_3_2go_0llvm_0Elem_3_6_7go_0llvm_0RR_9_8_6_7go_0llvm_0RR_3_6_7go_0llvm_0RR_3_6_7go_0llvm_0RR_3go_0llvm_0Result_9, ptr @type..func_8_2go_0llvm_0Zone_3context_0Context_3go_0llvm_0Request_3_2go_0llvm_0Elem_3_6_7go_0llvm_0RR_9_8_6_7go_0llvm_0RR_3_6_7go_0llvm_0RR_3_6_7go_0llvm_0RR_3go_0llvm_0Result_9, ptr @type..func_8string_3int_9_8string_3bool_9, ptr @type..func_8_2go_0llvm_0Zone_3string_3int_9_8string_3bool_9, ptr @type..func_8_2go_0llvm_0Zone_3bool_9_8_6_7go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0Zone_3int32_9_8_9, ptr @type.._2_2go_0llvm_0Zone, ptr @go_0llvm.Zone..p, ptr @type..func_8_2go_0llvm_0Tree_3_6_7go_0llvm_0RR_3bool_9_8_6_7go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0Tree_3string_9_8_2go_0llvm_0Elem_3bool_9, ptr @type.._2_2go_0llvm_0Tree, ptr @go_0llvm.Color..p, ptr @go_0llvm.Node..p, ptr @go_0llvm.Tree..p, ptr @type..func_8go_0llvm_0Apex_3bool_9_8_6_7go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0Apex_3bool_9_8_6_7go_0llvm_0RR_9, ptr @type.._2_2go_0llvm_0Apex, ptr @go_0llvm.Apex..p, ptr @type..chan_bbool, ptr @type..func_8context_0Context_3go_0llvm_0Request_3string_3uint16_9_8_2go_0llvm_0Msg_3error_9, ptr @type..func_8_2go_0llvm_0Upstream_3context_0Context_3go_0llvm_0Request_3string_3uint16_9_8_2go_0llvm_0Msg_3error_9, ptr @type.._2_2go_0llvm_0Upstream, ptr @go_0llvm.Upstream..p, ptr @go_0llvm.Key..p, ptr @go_0llvm.LoopKey..p, ptr @go_0llvm.ViewKey..p, ptr @type..func_8go_0llvm_0NonWriter_9_8error_9, ptr @type..func_8go_0llvm_0NonWriter_9_8_9, ptr @type..func_8go_0llvm_0NonWriter_9_8net_0Addr_9, ptr @type..func_8go_0llvm_0NonWriter_3bool_9_8_9, ptr @type..func_8go_0llvm_0NonWriter_3_6_7uint8_9_8int_3error_9, ptr @type..func_8go_0llvm_0NonWriter_3_2go_0llvm_0Msg_9_8error_9, ptr @type..func_8_2go_0llvm_0NonWriter_9_8error_9, ptr @type..func_8_2go_0llvm_0NonWriter_9_8_9, ptr @type..func_8_2go_0llvm_0NonWriter_9_8net_0Addr_9, ptr @type..func_8_2go_0llvm_0NonWriter_3bool_9_8_9, ptr @type..func_8_2go_0llvm_0NonWriter_3_6_7uint8_9_8int_3error_9, ptr @type..func_8_2go_0llvm_0NonWriter_3_2go_0llvm_0Msg_9_8error_9, ptr @type.._2_2go_0llvm_0NonWriter, ptr @go_0llvm.NonWriter..p, ptr @go_0llvm.Func..p] }
@go..C0 = internal global { ptr, i64, [1 x { ptr, i64, i64, ptr }] } { ptr null, i64 1, [1 x { ptr, i64, i64, ptr }] [{ ptr, i64, i64, ptr } { ptr @go_0llvm.sup, i64 8, i64 8, ptr @gcbits..ba }] }

define i8 @go_0llvm.SOA..eq(ptr nest nocapture readnone %nest.61, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.430 = icmp eq ptr %key1, null
  br i1 %icmp.430, label %then.433, label %else.433, !make.implicit !3

then.433:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.433:                                         ; preds = %entry
  %tmpv.832.sroa.0.0.copyload = load ptr, ptr %key1, align 8
  %tmpv.832.sroa.3.0.cast.3162.sroa_idx23 = getelementptr inbounds i8, ptr %key1, i64 16
  %tmpv.832.sroa.3.0.copyload = load i16, ptr %tmpv.832.sroa.3.0.cast.3162.sroa_idx23, align 8
  %tmpv.832.sroa.5.0.cast.3162.sroa_idx24 = getelementptr inbounds i8, ptr %key1, i64 18
  %tmpv.832.sroa.5.0.copyload = load i16, ptr %tmpv.832.sroa.5.0.cast.3162.sroa_idx24, align 2
  %tmpv.832.sroa.6.0.cast.3162.sroa_idx25 = getelementptr inbounds i8, ptr %key1, i64 20
  %tmpv.832.sroa.6.0.copyload = load i32, ptr %tmpv.832.sroa.6.0.cast.3162.sroa_idx25, align 4
  %tmpv.832.sroa.7.0.cast.3162.sroa_idx26 = getelementptr inbounds i8, ptr %key1, i64 24
  %tmpv.832.sroa.7.0.copyload = load i16, ptr %tmpv.832.sroa.7.0.cast.3162.sroa_idx26, align 8
  %icmp.431 = icmp eq ptr %key2, null
  br i1 %icmp.431, label %then.434, label %else.434, !make.implicit !3

then.434:                                         ; preds = %else.433
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.434:                                         ; preds = %else.433
  %tmpv.832.sroa.2.0.cast.3162.sroa_idx22 = getelementptr inbounds i8, ptr %key1, i64 8
  %tmpv.832.sroa.2.0.copyload = load i64, ptr %tmpv.832.sroa.2.0.cast.3162.sroa_idx22, align 8
  %tmpv.833.sroa.0.0.copyload = load ptr, ptr %key2, align 8
  %tmpv.833.sroa.2.0.cast.3167.sroa_idx17 = getelementptr inbounds i8, ptr %key2, i64 8
  %tmpv.833.sroa.2.0.copyload = load i64, ptr %tmpv.833.sroa.2.0.cast.3167.sroa_idx17, align 8
  %tmpv.833.sroa.3.0.cast.3167.sroa_idx18 = getelementptr inbounds i8, ptr %key2, i64 16
  %tmpv.833.sroa.3.0.copyload = load i16, ptr %tmpv.833.sroa.3.0.cast.3167.sroa_idx18, align 8
  %tmpv.833.sroa.5.0.cast.3167.sroa_idx19 = getelementptr inbounds i8, ptr %key2, i64 18
  %tmpv.833.sroa.5.0.copyload = load i16, ptr %tmpv.833.sroa.5.0.cast.3167.sroa_idx19, align 2
  %tmpv.833.sroa.6.0.cast.3167.sroa_idx20 = getelementptr inbounds i8, ptr %key2, i64 20
  %tmpv.833.sroa.6.0.copyload = load i32, ptr %tmpv.833.sroa.6.0.cast.3167.sroa_idx20, align 4
  %tmpv.833.sroa.7.0.cast.3167.sroa_idx21 = getelementptr inbounds i8, ptr %key2, i64 24
  %tmpv.833.sroa.7.0.copyload = load i16, ptr %tmpv.833.sroa.7.0.cast.3167.sroa_idx21, align 8
  %icmp.432 = icmp eq i64 %tmpv.832.sroa.2.0.copyload, %tmpv.833.sroa.2.0.copyload
  br i1 %icmp.432, label %then.435, label %fallthrough.435

then.435:                                         ; preds = %else.434
  %icmp.433 = icmp eq ptr %tmpv.832.sroa.0.0.copyload, %tmpv.833.sroa.0.0.copyload
  br i1 %icmp.433, label %fallthrough.435, label %else.436

fallthrough.435:                                  ; preds = %else.436, %then.435, %else.434
  %tmpv.842.0 = phi i1 [ false, %else.434 ], [ %icmp.434, %else.436 ], [ true, %then.435 ]
  %icmp.436 = icmp eq i16 %tmpv.832.sroa.3.0.copyload, %tmpv.833.sroa.3.0.copyload
  %spec.select = select i1 %tmpv.842.0, i1 %icmp.436, i1 false
  %icmp.437 = icmp eq i16 %tmpv.832.sroa.5.0.copyload, %tmpv.833.sroa.5.0.copyload
  %tmpv.844.0.in = select i1 %spec.select, i1 %icmp.437, i1 false
  %icmp.438 = icmp eq i32 %tmpv.832.sroa.6.0.copyload, %tmpv.833.sroa.6.0.copyload
  %spec.select35 = select i1 %tmpv.844.0.in, i1 %icmp.438, i1 false
  %icmp.439 = icmp eq i16 %tmpv.832.sroa.7.0.copyload, %tmpv.833.sroa.7.0.copyload
  %tmpv.846.0.in = select i1 %spec.select35, i1 %icmp.439, i1 false
  br i1 %tmpv.846.0.in, label %else.442, label %common.ret

else.436:                                         ; preds = %then.435
  %bcmp2 = call i32 @bcmp(ptr %tmpv.832.sroa.0.0.copyload, ptr %tmpv.833.sroa.0.0.copyload, i64 %tmpv.832.sroa.2.0.copyload)
  %icmp.434 = icmp eq i32 %bcmp2, 0
  br label %fallthrough.435

common.ret:                                       ; preds = %fallthrough.435, %else.442, %else.445, %else.447, %else.450, %else.453, %else.456, %else.459, %else.462, %else.465
  %common.ret.op = phi i8 [ %spec.select36, %else.465 ], [ 0, %else.462 ], [ 0, %else.459 ], [ 0, %else.456 ], [ 0, %else.453 ], [ 0, %else.450 ], [ 0, %else.447 ], [ 0, %else.445 ], [ 0, %else.442 ], [ 0, %fallthrough.435 ]
  ret i8 %common.ret.op

else.442:                                         ; preds = %fallthrough.435
  %tmpv.847.sroa.0.0.cast.3176.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 32
  %tmpv.847.sroa.0.0.copyload = load ptr, ptr %tmpv.847.sroa.0.0.cast.3176.sroa_idx, align 8
  %tmpv.847.sroa.3.0.cast.3176.sroa_idx6 = getelementptr inbounds i8, ptr %key1, i64 40
  %tmpv.847.sroa.3.0.copyload = load i64, ptr %tmpv.847.sroa.3.0.cast.3176.sroa_idx6, align 8
  %tmpv.849.sroa.0.0.cast.3179.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 32
  %tmpv.849.sroa.0.0.copyload = load ptr, ptr %tmpv.849.sroa.0.0.cast.3179.sroa_idx, align 8
  %tmpv.849.sroa.3.0.cast.3179.sroa_idx4 = getelementptr inbounds i8, ptr %key2, i64 40
  %tmpv.849.sroa.3.0.copyload = load i64, ptr %tmpv.849.sroa.3.0.cast.3179.sroa_idx4, align 8
  %icmp.443 = icmp eq i64 %tmpv.847.sroa.3.0.copyload, %tmpv.849.sroa.3.0.copyload
  br i1 %icmp.443, label %then.444, label %common.ret

then.444:                                         ; preds = %else.442
  %icmp.444 = icmp eq ptr %tmpv.847.sroa.0.0.copyload, %tmpv.849.sroa.0.0.copyload
  br i1 %icmp.444, label %else.447, label %else.445

else.445:                                         ; preds = %then.444
  %bcmp = call i32 @bcmp(ptr %tmpv.847.sroa.0.0.copyload, ptr %tmpv.849.sroa.0.0.copyload, i64 %tmpv.847.sroa.3.0.copyload)
  %icmp.445 = icmp eq i32 %bcmp, 0
  br i1 %icmp.445, label %else.447, label %common.ret

else.447:                                         ; preds = %else.445, %then.444
  %tmpv.853.sroa.0.0.cast.3182.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 48
  %tmpv.853.sroa.0.0.copyload = load ptr, ptr %tmpv.853.sroa.0.0.cast.3182.sroa_idx, align 8
  %tmpv.853.sroa.3.0.cast.3182.sroa_idx3 = getelementptr inbounds i8, ptr %key1, i64 56
  %tmpv.853.sroa.3.0.copyload = load i64, ptr %tmpv.853.sroa.3.0.cast.3182.sroa_idx3, align 8
  %tmpv.855.sroa.0.0.cast.3185.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 48
  %tmpv.855.sroa.0.0.copyload = load ptr, ptr %tmpv.855.sroa.0.0.cast.3185.sroa_idx, align 8
  %tmpv.855.sroa.3.0.cast.3185.sroa_idx1 = getelementptr inbounds i8, ptr %key2, i64 56
  %tmpv.855.sroa.3.0.copyload = load i64, ptr %tmpv.855.sroa.3.0.cast.3185.sroa_idx1, align 8
  %icmp.449 = icmp eq i64 %tmpv.853.sroa.3.0.copyload, %tmpv.855.sroa.3.0.copyload
  br i1 %icmp.449, label %then.449, label %common.ret

then.449:                                         ; preds = %else.447
  %icmp.450 = icmp eq ptr %tmpv.853.sroa.0.0.copyload, %tmpv.855.sroa.0.0.copyload
  br i1 %icmp.450, label %else.453, label %else.450

else.450:                                         ; preds = %then.449
  %bcmp1 = call i32 @bcmp(ptr %tmpv.853.sroa.0.0.copyload, ptr %tmpv.855.sroa.0.0.copyload, i64 %tmpv.853.sroa.3.0.copyload)
  %icmp.451 = icmp eq i32 %bcmp1, 0
  br i1 %icmp.451, label %else.453, label %common.ret

else.453:                                         ; preds = %else.450, %then.449
  %field.1082 = getelementptr inbounds i8, ptr %key1, i64 64
  %.field.ld.171 = load i32, ptr %field.1082, align 4
  %field.1083 = getelementptr inbounds i8, ptr %key2, i64 64
  %.field.ld.172 = load i32, ptr %field.1083, align 4
  %icmp.455.not = icmp eq i32 %.field.ld.171, %.field.ld.172
  br i1 %icmp.455.not, label %else.456, label %common.ret

else.456:                                         ; preds = %else.453
  %field.1084 = getelementptr inbounds i8, ptr %key1, i64 68
  %.field.ld.173 = load i32, ptr %field.1084, align 4
  %field.1085 = getelementptr inbounds i8, ptr %key2, i64 68
  %.field.ld.174 = load i32, ptr %field.1085, align 4
  %icmp.458.not = icmp eq i32 %.field.ld.173, %.field.ld.174
  br i1 %icmp.458.not, label %else.459, label %common.ret

else.459:                                         ; preds = %else.456
  %field.1086 = getelementptr inbounds i8, ptr %key1, i64 72
  %.field.ld.175 = load i32, ptr %field.1086, align 4
  %field.1087 = getelementptr inbounds i8, ptr %key2, i64 72
  %.field.ld.176 = load i32, ptr %field.1087, align 4
  %icmp.461.not = icmp eq i32 %.field.ld.175, %.field.ld.176
  br i1 %icmp.461.not, label %else.462, label %common.ret

else.462:                                         ; preds = %else.459
  %field.1088 = getelementptr inbounds i8, ptr %key1, i64 76
  %.field.ld.177 = load i32, ptr %field.1088, align 4
  %field.1089 = getelementptr inbounds i8, ptr %key2, i64 76
  %.field.ld.178 = load i32, ptr %field.1089, align 4
  %icmp.464.not = icmp eq i32 %.field.ld.177, %.field.ld.178
  br i1 %icmp.464.not, label %else.465, label %common.ret

else.465:                                         ; preds = %else.462
  %field.1090 = getelementptr inbounds i8, ptr %key1, i64 80
  %.field.ld.179 = load i32, ptr %field.1090, align 4
  %field.1091 = getelementptr inbounds i8, ptr %key2, i64 80
  %.field.ld.180 = load i32, ptr %field.1091, align 4
  %icmp.467.not = icmp eq i32 %.field.ld.179, %.field.ld.180
  %spec.select36 = zext i1 %icmp.467.not to i8
  br label %common.ret
}

define i8 @go_0llvm.RR__Header..eq(ptr nest nocapture readnone %nest.57, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.343 = icmp eq ptr %key1, null
  br i1 %icmp.343, label %then.352, label %else.352, !make.implicit !3

then.352:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.352:                                         ; preds = %entry
  %tmpv.752.sroa.0.0.copyload = load ptr, ptr %key1, align 8
  %icmp.344 = icmp eq ptr %key2, null
  br i1 %icmp.344, label %then.353, label %else.353, !make.implicit !3

then.353:                                         ; preds = %else.352
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.353:                                         ; preds = %else.352
  %tmpv.752.sroa.3.0.cast.3074.sroa_idx3 = getelementptr inbounds i8, ptr %key1, i64 8
  %tmpv.752.sroa.3.0.copyload = load i64, ptr %tmpv.752.sroa.3.0.cast.3074.sroa_idx3, align 8
  %tmpv.754.sroa.0.0.copyload = load ptr, ptr %key2, align 8
  %tmpv.754.sroa.3.0.cast.3077.sroa_idx1 = getelementptr inbounds i8, ptr %key2, i64 8
  %tmpv.754.sroa.3.0.copyload = load i64, ptr %tmpv.754.sroa.3.0.cast.3077.sroa_idx1, align 8
  %icmp.345 = icmp eq i64 %tmpv.752.sroa.3.0.copyload, %tmpv.754.sroa.3.0.copyload
  br i1 %icmp.345, label %then.354, label %common.ret

then.354:                                         ; preds = %else.353
  %icmp.346 = icmp eq ptr %tmpv.752.sroa.0.0.copyload, %tmpv.754.sroa.0.0.copyload
  br i1 %icmp.346, label %else.358, label %else.355

else.355:                                         ; preds = %then.354
  %bcmp = call i32 @bcmp(ptr %tmpv.752.sroa.0.0.copyload, ptr %tmpv.754.sroa.0.0.copyload, i64 %tmpv.752.sroa.3.0.copyload)
  %icmp.347 = icmp eq i32 %bcmp, 0
  br i1 %icmp.347, label %else.358, label %common.ret

common.ret:                                       ; preds = %else.353, %else.355, %else.358, %else.361, %else.364, %else.367
  %common.ret.op = phi i8 [ %spec.select, %else.367 ], [ 0, %else.364 ], [ 0, %else.361 ], [ 0, %else.358 ], [ 0, %else.355 ], [ 0, %else.353 ]
  ret i8 %common.ret.op

else.358:                                         ; preds = %else.355, %then.354
  %field.961 = getelementptr inbounds i8, ptr %key1, i64 16
  %.field.ld.145 = load i16, ptr %field.961, align 2
  %field.962 = getelementptr inbounds i8, ptr %key2, i64 16
  %.field.ld.146 = load i16, ptr %field.962, align 2
  %icmp.351.not = icmp eq i16 %.field.ld.145, %.field.ld.146
  br i1 %icmp.351.not, label %else.361, label %common.ret

else.361:                                         ; preds = %else.358
  %field.963 = getelementptr inbounds i8, ptr %key1, i64 18
  %.field.ld.147 = load i16, ptr %field.963, align 2
  %field.964 = getelementptr inbounds i8, ptr %key2, i64 18
  %.field.ld.148 = load i16, ptr %field.964, align 2
  %icmp.354.not = icmp eq i16 %.field.ld.147, %.field.ld.148
  br i1 %icmp.354.not, label %else.364, label %common.ret

else.364:                                         ; preds = %else.361
  %field.965 = getelementptr inbounds i8, ptr %key1, i64 20
  %.field.ld.149 = load i32, ptr %field.965, align 4
  %field.966 = getelementptr inbounds i8, ptr %key2, i64 20
  %.field.ld.150 = load i32, ptr %field.966, align 4
  %icmp.357.not = icmp eq i32 %.field.ld.149, %.field.ld.150
  br i1 %icmp.357.not, label %else.367, label %common.ret

else.367:                                         ; preds = %else.364
  %field.967 = getelementptr inbounds i8, ptr %key1, i64 24
  %.field.ld.151 = load i16, ptr %field.967, align 2
  %field.968 = getelementptr inbounds i8, ptr %key2, i64 24
  %.field.ld.152 = load i16, ptr %field.968, align 2
  %icmp.360.not = icmp eq i16 %.field.ld.151, %.field.ld.152
  %spec.select = zext i1 %icmp.360.not to i8
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

define i8 @go_0llvm.DNAME..eq(ptr nest nocapture readnone %nest.63, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.474 = icmp eq ptr %key1, null
  br i1 %icmp.474, label %then.474, label %else.474, !make.implicit !3

then.474:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.474:                                         ; preds = %entry
  %tmpv.877.sroa.0.0.copyload = load ptr, ptr %key1, align 8
  %tmpv.877.sroa.3.0.cast.3210.sroa_idx20 = getelementptr inbounds i8, ptr %key1, i64 16
  %tmpv.877.sroa.3.0.copyload = load i16, ptr %tmpv.877.sroa.3.0.cast.3210.sroa_idx20, align 8
  %tmpv.877.sroa.5.0.cast.3210.sroa_idx21 = getelementptr inbounds i8, ptr %key1, i64 18
  %tmpv.877.sroa.5.0.copyload = load i16, ptr %tmpv.877.sroa.5.0.cast.3210.sroa_idx21, align 2
  %tmpv.877.sroa.6.0.cast.3210.sroa_idx22 = getelementptr inbounds i8, ptr %key1, i64 20
  %tmpv.877.sroa.6.0.copyload = load i32, ptr %tmpv.877.sroa.6.0.cast.3210.sroa_idx22, align 4
  %tmpv.877.sroa.7.0.cast.3210.sroa_idx23 = getelementptr inbounds i8, ptr %key1, i64 24
  %tmpv.877.sroa.7.0.copyload = load i16, ptr %tmpv.877.sroa.7.0.cast.3210.sroa_idx23, align 8
  %icmp.475 = icmp eq ptr %key2, null
  br i1 %icmp.475, label %then.475, label %else.475, !make.implicit !3

then.475:                                         ; preds = %else.474
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.475:                                         ; preds = %else.474
  %tmpv.877.sroa.2.0.cast.3210.sroa_idx19 = getelementptr inbounds i8, ptr %key1, i64 8
  %tmpv.877.sroa.2.0.copyload = load i64, ptr %tmpv.877.sroa.2.0.cast.3210.sroa_idx19, align 8
  %tmpv.878.sroa.0.0.copyload = load ptr, ptr %key2, align 8
  %tmpv.878.sroa.2.0.cast.3215.sroa_idx14 = getelementptr inbounds i8, ptr %key2, i64 8
  %tmpv.878.sroa.2.0.copyload = load i64, ptr %tmpv.878.sroa.2.0.cast.3215.sroa_idx14, align 8
  %tmpv.878.sroa.3.0.cast.3215.sroa_idx15 = getelementptr inbounds i8, ptr %key2, i64 16
  %tmpv.878.sroa.3.0.copyload = load i16, ptr %tmpv.878.sroa.3.0.cast.3215.sroa_idx15, align 8
  %tmpv.878.sroa.5.0.cast.3215.sroa_idx16 = getelementptr inbounds i8, ptr %key2, i64 18
  %tmpv.878.sroa.5.0.copyload = load i16, ptr %tmpv.878.sroa.5.0.cast.3215.sroa_idx16, align 2
  %tmpv.878.sroa.6.0.cast.3215.sroa_idx17 = getelementptr inbounds i8, ptr %key2, i64 20
  %tmpv.878.sroa.6.0.copyload = load i32, ptr %tmpv.878.sroa.6.0.cast.3215.sroa_idx17, align 4
  %tmpv.878.sroa.7.0.cast.3215.sroa_idx18 = getelementptr inbounds i8, ptr %key2, i64 24
  %tmpv.878.sroa.7.0.copyload = load i16, ptr %tmpv.878.sroa.7.0.cast.3215.sroa_idx18, align 8
  %icmp.476 = icmp eq i64 %tmpv.877.sroa.2.0.copyload, %tmpv.878.sroa.2.0.copyload
  br i1 %icmp.476, label %then.476, label %fallthrough.476

then.476:                                         ; preds = %else.475
  %icmp.477 = icmp eq ptr %tmpv.877.sroa.0.0.copyload, %tmpv.878.sroa.0.0.copyload
  br i1 %icmp.477, label %fallthrough.476, label %else.477

fallthrough.476:                                  ; preds = %else.477, %then.476, %else.475
  %tmpv.887.0 = phi i1 [ false, %else.475 ], [ %icmp.478, %else.477 ], [ true, %then.476 ]
  %icmp.480 = icmp eq i16 %tmpv.877.sroa.3.0.copyload, %tmpv.878.sroa.3.0.copyload
  %spec.select = select i1 %tmpv.887.0, i1 %icmp.480, i1 false
  %icmp.481 = icmp eq i16 %tmpv.877.sroa.5.0.copyload, %tmpv.878.sroa.5.0.copyload
  %tmpv.889.0.in = select i1 %spec.select, i1 %icmp.481, i1 false
  %icmp.482 = icmp eq i32 %tmpv.877.sroa.6.0.copyload, %tmpv.878.sroa.6.0.copyload
  %spec.select26 = select i1 %tmpv.889.0.in, i1 %icmp.482, i1 false
  %icmp.483 = icmp eq i16 %tmpv.877.sroa.7.0.copyload, %tmpv.878.sroa.7.0.copyload
  %tmpv.891.0.in = select i1 %spec.select26, i1 %icmp.483, i1 false
  br i1 %tmpv.891.0.in, label %else.483, label %then.482

else.477:                                         ; preds = %then.476
  %bcmp1 = call i32 @bcmp(ptr %tmpv.877.sroa.0.0.copyload, ptr %tmpv.878.sroa.0.0.copyload, i64 %tmpv.877.sroa.2.0.copyload)
  %icmp.478 = icmp eq i32 %bcmp1, 0
  br label %fallthrough.476

then.482:                                         ; preds = %else.486, %then.485, %else.483, %fallthrough.476
  %merge = phi i8 [ 0, %fallthrough.476 ], [ 0, %else.483 ], [ %phi.cast, %else.486 ], [ 1, %then.485 ]
  ret i8 %merge

else.483:                                         ; preds = %fallthrough.476
  %tmpv.892.sroa.0.0.cast.3224.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 32
  %tmpv.892.sroa.0.0.copyload = load ptr, ptr %tmpv.892.sroa.0.0.cast.3224.sroa_idx, align 8
  %tmpv.892.sroa.3.0.cast.3224.sroa_idx3 = getelementptr inbounds i8, ptr %key1, i64 40
  %tmpv.892.sroa.3.0.copyload = load i64, ptr %tmpv.892.sroa.3.0.cast.3224.sroa_idx3, align 8
  %tmpv.894.sroa.0.0.cast.3227.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 32
  %tmpv.894.sroa.0.0.copyload = load ptr, ptr %tmpv.894.sroa.0.0.cast.3227.sroa_idx, align 8
  %tmpv.894.sroa.3.0.cast.3227.sroa_idx1 = getelementptr inbounds i8, ptr %key2, i64 40
  %tmpv.894.sroa.3.0.copyload = load i64, ptr %tmpv.894.sroa.3.0.cast.3227.sroa_idx1, align 8
  %icmp.487 = icmp eq i64 %tmpv.892.sroa.3.0.copyload, %tmpv.894.sroa.3.0.copyload
  br i1 %icmp.487, label %then.485, label %then.482

then.485:                                         ; preds = %else.483
  %icmp.488 = icmp eq ptr %tmpv.892.sroa.0.0.copyload, %tmpv.894.sroa.0.0.copyload
  br i1 %icmp.488, label %then.482, label %else.486

else.486:                                         ; preds = %then.485
  %bcmp = call i32 @bcmp(ptr %tmpv.892.sroa.0.0.copyload, ptr %tmpv.894.sroa.0.0.copyload, i64 %tmpv.892.sroa.3.0.copyload)
  %icmp.489 = icmp eq i32 %bcmp, 0
  %phi.cast = zext i1 %icmp.489 to i8
  br label %then.482
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

define i8 @go_0llvm.CNAME..eq(ptr nest nocapture readnone %nest.64, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.491 = icmp eq ptr %key1, null
  br i1 %icmp.491, label %then.489, label %else.489, !make.implicit !3

then.489:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.489:                                         ; preds = %entry
  %tmpv.900.sroa.0.0.copyload = load ptr, ptr %key1, align 8
  %tmpv.900.sroa.3.0.cast.3232.sroa_idx20 = getelementptr inbounds i8, ptr %key1, i64 16
  %tmpv.900.sroa.3.0.copyload = load i16, ptr %tmpv.900.sroa.3.0.cast.3232.sroa_idx20, align 8
  %tmpv.900.sroa.5.0.cast.3232.sroa_idx21 = getelementptr inbounds i8, ptr %key1, i64 18
  %tmpv.900.sroa.5.0.copyload = load i16, ptr %tmpv.900.sroa.5.0.cast.3232.sroa_idx21, align 2
  %tmpv.900.sroa.6.0.cast.3232.sroa_idx22 = getelementptr inbounds i8, ptr %key1, i64 20
  %tmpv.900.sroa.6.0.copyload = load i32, ptr %tmpv.900.sroa.6.0.cast.3232.sroa_idx22, align 4
  %tmpv.900.sroa.7.0.cast.3232.sroa_idx23 = getelementptr inbounds i8, ptr %key1, i64 24
  %tmpv.900.sroa.7.0.copyload = load i16, ptr %tmpv.900.sroa.7.0.cast.3232.sroa_idx23, align 8
  %icmp.492 = icmp eq ptr %key2, null
  br i1 %icmp.492, label %then.490, label %else.490, !make.implicit !3

then.490:                                         ; preds = %else.489
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.490:                                         ; preds = %else.489
  %tmpv.900.sroa.2.0.cast.3232.sroa_idx19 = getelementptr inbounds i8, ptr %key1, i64 8
  %tmpv.900.sroa.2.0.copyload = load i64, ptr %tmpv.900.sroa.2.0.cast.3232.sroa_idx19, align 8
  %tmpv.901.sroa.0.0.copyload = load ptr, ptr %key2, align 8
  %tmpv.901.sroa.2.0.cast.3237.sroa_idx14 = getelementptr inbounds i8, ptr %key2, i64 8
  %tmpv.901.sroa.2.0.copyload = load i64, ptr %tmpv.901.sroa.2.0.cast.3237.sroa_idx14, align 8
  %tmpv.901.sroa.3.0.cast.3237.sroa_idx15 = getelementptr inbounds i8, ptr %key2, i64 16
  %tmpv.901.sroa.3.0.copyload = load i16, ptr %tmpv.901.sroa.3.0.cast.3237.sroa_idx15, align 8
  %tmpv.901.sroa.5.0.cast.3237.sroa_idx16 = getelementptr inbounds i8, ptr %key2, i64 18
  %tmpv.901.sroa.5.0.copyload = load i16, ptr %tmpv.901.sroa.5.0.cast.3237.sroa_idx16, align 2
  %tmpv.901.sroa.6.0.cast.3237.sroa_idx17 = getelementptr inbounds i8, ptr %key2, i64 20
  %tmpv.901.sroa.6.0.copyload = load i32, ptr %tmpv.901.sroa.6.0.cast.3237.sroa_idx17, align 4
  %tmpv.901.sroa.7.0.cast.3237.sroa_idx18 = getelementptr inbounds i8, ptr %key2, i64 24
  %tmpv.901.sroa.7.0.copyload = load i16, ptr %tmpv.901.sroa.7.0.cast.3237.sroa_idx18, align 8
  %icmp.493 = icmp eq i64 %tmpv.900.sroa.2.0.copyload, %tmpv.901.sroa.2.0.copyload
  br i1 %icmp.493, label %then.491, label %fallthrough.491

then.491:                                         ; preds = %else.490
  %icmp.494 = icmp eq ptr %tmpv.900.sroa.0.0.copyload, %tmpv.901.sroa.0.0.copyload
  br i1 %icmp.494, label %fallthrough.491, label %else.492

fallthrough.491:                                  ; preds = %else.492, %then.491, %else.490
  %tmpv.910.0 = phi i1 [ false, %else.490 ], [ %icmp.495, %else.492 ], [ true, %then.491 ]
  %icmp.497 = icmp eq i16 %tmpv.900.sroa.3.0.copyload, %tmpv.901.sroa.3.0.copyload
  %spec.select = select i1 %tmpv.910.0, i1 %icmp.497, i1 false
  %icmp.498 = icmp eq i16 %tmpv.900.sroa.5.0.copyload, %tmpv.901.sroa.5.0.copyload
  %tmpv.912.0.in = select i1 %spec.select, i1 %icmp.498, i1 false
  %icmp.499 = icmp eq i32 %tmpv.900.sroa.6.0.copyload, %tmpv.901.sroa.6.0.copyload
  %spec.select26 = select i1 %tmpv.912.0.in, i1 %icmp.499, i1 false
  %icmp.500 = icmp eq i16 %tmpv.900.sroa.7.0.copyload, %tmpv.901.sroa.7.0.copyload
  %tmpv.914.0.in = select i1 %spec.select26, i1 %icmp.500, i1 false
  br i1 %tmpv.914.0.in, label %else.498, label %then.497

else.492:                                         ; preds = %then.491
  %bcmp1 = call i32 @bcmp(ptr %tmpv.900.sroa.0.0.copyload, ptr %tmpv.901.sroa.0.0.copyload, i64 %tmpv.900.sroa.2.0.copyload)
  %icmp.495 = icmp eq i32 %bcmp1, 0
  br label %fallthrough.491

then.497:                                         ; preds = %else.501, %then.500, %else.498, %fallthrough.491
  %merge = phi i8 [ 0, %fallthrough.491 ], [ 0, %else.498 ], [ %phi.cast, %else.501 ], [ 1, %then.500 ]
  ret i8 %merge

else.498:                                         ; preds = %fallthrough.491
  %tmpv.915.sroa.0.0.cast.3246.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 32
  %tmpv.915.sroa.0.0.copyload = load ptr, ptr %tmpv.915.sroa.0.0.cast.3246.sroa_idx, align 8
  %tmpv.915.sroa.3.0.cast.3246.sroa_idx3 = getelementptr inbounds i8, ptr %key1, i64 40
  %tmpv.915.sroa.3.0.copyload = load i64, ptr %tmpv.915.sroa.3.0.cast.3246.sroa_idx3, align 8
  %tmpv.917.sroa.0.0.cast.3249.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 32
  %tmpv.917.sroa.0.0.copyload = load ptr, ptr %tmpv.917.sroa.0.0.cast.3249.sroa_idx, align 8
  %tmpv.917.sroa.3.0.cast.3249.sroa_idx1 = getelementptr inbounds i8, ptr %key2, i64 40
  %tmpv.917.sroa.3.0.copyload = load i64, ptr %tmpv.917.sroa.3.0.cast.3249.sroa_idx1, align 8
  %icmp.504 = icmp eq i64 %tmpv.915.sroa.3.0.copyload, %tmpv.917.sroa.3.0.copyload
  br i1 %icmp.504, label %then.500, label %then.497

then.500:                                         ; preds = %else.498
  %icmp.505 = icmp eq ptr %tmpv.915.sroa.0.0.copyload, %tmpv.917.sroa.0.0.copyload
  br i1 %icmp.505, label %then.497, label %else.501

else.501:                                         ; preds = %then.500
  %bcmp = call i32 @bcmp(ptr %tmpv.915.sroa.0.0.copyload, ptr %tmpv.917.sroa.0.0.copyload, i64 %tmpv.915.sroa.3.0.copyload)
  %icmp.506 = icmp eq i32 %bcmp, 0
  %phi.cast = zext i1 %icmp.506 to i8
  br label %then.497
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

define i8 @go_0llvm.SRV..eq(ptr nest nocapture readnone %nest.65, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.508 = icmp eq ptr %key1, null
  br i1 %icmp.508, label %then.504, label %else.504, !make.implicit !3

then.504:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.504:                                         ; preds = %entry
  %tmpv.923.sroa.0.0.copyload = load ptr, ptr %key1, align 8
  %tmpv.923.sroa.3.0.cast.3254.sroa_idx20 = getelementptr inbounds i8, ptr %key1, i64 16
  %tmpv.923.sroa.3.0.copyload = load i16, ptr %tmpv.923.sroa.3.0.cast.3254.sroa_idx20, align 8
  %tmpv.923.sroa.5.0.cast.3254.sroa_idx21 = getelementptr inbounds i8, ptr %key1, i64 18
  %tmpv.923.sroa.5.0.copyload = load i16, ptr %tmpv.923.sroa.5.0.cast.3254.sroa_idx21, align 2
  %tmpv.923.sroa.6.0.cast.3254.sroa_idx22 = getelementptr inbounds i8, ptr %key1, i64 20
  %tmpv.923.sroa.6.0.copyload = load i32, ptr %tmpv.923.sroa.6.0.cast.3254.sroa_idx22, align 4
  %tmpv.923.sroa.7.0.cast.3254.sroa_idx23 = getelementptr inbounds i8, ptr %key1, i64 24
  %tmpv.923.sroa.7.0.copyload = load i16, ptr %tmpv.923.sroa.7.0.cast.3254.sroa_idx23, align 8
  %icmp.509 = icmp eq ptr %key2, null
  br i1 %icmp.509, label %then.505, label %else.505, !make.implicit !3

then.505:                                         ; preds = %else.504
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.505:                                         ; preds = %else.504
  %tmpv.923.sroa.2.0.cast.3254.sroa_idx19 = getelementptr inbounds i8, ptr %key1, i64 8
  %tmpv.923.sroa.2.0.copyload = load i64, ptr %tmpv.923.sroa.2.0.cast.3254.sroa_idx19, align 8
  %tmpv.924.sroa.0.0.copyload = load ptr, ptr %key2, align 8
  %tmpv.924.sroa.2.0.cast.3259.sroa_idx14 = getelementptr inbounds i8, ptr %key2, i64 8
  %tmpv.924.sroa.2.0.copyload = load i64, ptr %tmpv.924.sroa.2.0.cast.3259.sroa_idx14, align 8
  %tmpv.924.sroa.3.0.cast.3259.sroa_idx15 = getelementptr inbounds i8, ptr %key2, i64 16
  %tmpv.924.sroa.3.0.copyload = load i16, ptr %tmpv.924.sroa.3.0.cast.3259.sroa_idx15, align 8
  %tmpv.924.sroa.5.0.cast.3259.sroa_idx16 = getelementptr inbounds i8, ptr %key2, i64 18
  %tmpv.924.sroa.5.0.copyload = load i16, ptr %tmpv.924.sroa.5.0.cast.3259.sroa_idx16, align 2
  %tmpv.924.sroa.6.0.cast.3259.sroa_idx17 = getelementptr inbounds i8, ptr %key2, i64 20
  %tmpv.924.sroa.6.0.copyload = load i32, ptr %tmpv.924.sroa.6.0.cast.3259.sroa_idx17, align 4
  %tmpv.924.sroa.7.0.cast.3259.sroa_idx18 = getelementptr inbounds i8, ptr %key2, i64 24
  %tmpv.924.sroa.7.0.copyload = load i16, ptr %tmpv.924.sroa.7.0.cast.3259.sroa_idx18, align 8
  %icmp.510 = icmp eq i64 %tmpv.923.sroa.2.0.copyload, %tmpv.924.sroa.2.0.copyload
  br i1 %icmp.510, label %then.506, label %fallthrough.506

then.506:                                         ; preds = %else.505
  %icmp.511 = icmp eq ptr %tmpv.923.sroa.0.0.copyload, %tmpv.924.sroa.0.0.copyload
  br i1 %icmp.511, label %fallthrough.506, label %else.507

fallthrough.506:                                  ; preds = %else.507, %then.506, %else.505
  %tmpv.933.0 = phi i1 [ false, %else.505 ], [ %icmp.512, %else.507 ], [ true, %then.506 ]
  %icmp.514 = icmp eq i16 %tmpv.923.sroa.3.0.copyload, %tmpv.924.sroa.3.0.copyload
  %spec.select = select i1 %tmpv.933.0, i1 %icmp.514, i1 false
  %icmp.515 = icmp eq i16 %tmpv.923.sroa.5.0.copyload, %tmpv.924.sroa.5.0.copyload
  %tmpv.935.0.in = select i1 %spec.select, i1 %icmp.515, i1 false
  %icmp.516 = icmp eq i32 %tmpv.923.sroa.6.0.copyload, %tmpv.924.sroa.6.0.copyload
  %spec.select29 = select i1 %tmpv.935.0.in, i1 %icmp.516, i1 false
  %icmp.517 = icmp eq i16 %tmpv.923.sroa.7.0.copyload, %tmpv.924.sroa.7.0.copyload
  %tmpv.937.0.in = select i1 %spec.select29, i1 %icmp.517, i1 false
  br i1 %tmpv.937.0.in, label %else.514, label %then.512

else.507:                                         ; preds = %then.506
  %bcmp1 = call i32 @bcmp(ptr %tmpv.923.sroa.0.0.copyload, ptr %tmpv.924.sroa.0.0.copyload, i64 %tmpv.923.sroa.2.0.copyload)
  %icmp.512 = icmp eq i32 %bcmp1, 0
  br label %fallthrough.506

then.512:                                         ; preds = %else.525, %then.524, %else.522, %else.520, %else.517, %else.514, %fallthrough.506
  %merge = phi i8 [ 0, %else.520 ], [ 0, %else.517 ], [ 0, %else.514 ], [ 0, %fallthrough.506 ], [ 0, %else.522 ], [ %phi.cast, %else.525 ], [ 1, %then.524 ]
  ret i8 %merge

else.514:                                         ; preds = %fallthrough.506
  %field.1171 = getelementptr inbounds i8, ptr %key1, i64 32
  %.field.ld.183 = load i16, ptr %field.1171, align 2
  %field.1172 = getelementptr inbounds i8, ptr %key2, i64 32
  %.field.ld.184 = load i16, ptr %field.1172, align 2
  %icmp.521.not = icmp eq i16 %.field.ld.183, %.field.ld.184
  br i1 %icmp.521.not, label %else.517, label %then.512

else.517:                                         ; preds = %else.514
  %field.1173 = getelementptr inbounds i8, ptr %key1, i64 34
  %.field.ld.185 = load i16, ptr %field.1173, align 2
  %field.1174 = getelementptr inbounds i8, ptr %key2, i64 34
  %.field.ld.186 = load i16, ptr %field.1174, align 2
  %icmp.524.not = icmp eq i16 %.field.ld.185, %.field.ld.186
  br i1 %icmp.524.not, label %else.520, label %then.512

else.520:                                         ; preds = %else.517
  %field.1175 = getelementptr inbounds i8, ptr %key1, i64 36
  %.field.ld.187 = load i16, ptr %field.1175, align 2
  %field.1176 = getelementptr inbounds i8, ptr %key2, i64 36
  %.field.ld.188 = load i16, ptr %field.1176, align 2
  %icmp.527.not = icmp eq i16 %.field.ld.187, %.field.ld.188
  br i1 %icmp.527.not, label %else.522, label %then.512

else.522:                                         ; preds = %else.520
  %tmpv.944.sroa.0.0.cast.3274.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 40
  %tmpv.944.sroa.0.0.copyload = load ptr, ptr %tmpv.944.sroa.0.0.cast.3274.sroa_idx, align 8
  %tmpv.944.sroa.3.0.cast.3274.sroa_idx3 = getelementptr inbounds i8, ptr %key1, i64 48
  %tmpv.944.sroa.3.0.copyload = load i64, ptr %tmpv.944.sroa.3.0.cast.3274.sroa_idx3, align 8
  %tmpv.946.sroa.0.0.cast.3277.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 40
  %tmpv.946.sroa.0.0.copyload = load ptr, ptr %tmpv.946.sroa.0.0.cast.3277.sroa_idx, align 8
  %tmpv.946.sroa.3.0.cast.3277.sroa_idx1 = getelementptr inbounds i8, ptr %key2, i64 48
  %tmpv.946.sroa.3.0.copyload = load i64, ptr %tmpv.946.sroa.3.0.cast.3277.sroa_idx1, align 8
  %icmp.530 = icmp eq i64 %tmpv.944.sroa.3.0.copyload, %tmpv.946.sroa.3.0.copyload
  br i1 %icmp.530, label %then.524, label %then.512

then.524:                                         ; preds = %else.522
  %icmp.531 = icmp eq ptr %tmpv.944.sroa.0.0.copyload, %tmpv.946.sroa.0.0.copyload
  br i1 %icmp.531, label %then.512, label %else.525

else.525:                                         ; preds = %then.524
  %bcmp = call i32 @bcmp(ptr %tmpv.944.sroa.0.0.copyload, ptr %tmpv.946.sroa.0.0.copyload, i64 %tmpv.944.sroa.3.0.copyload)
  %icmp.532 = icmp eq i32 %bcmp, 0
  %phi.cast = zext i1 %icmp.532 to i8
  br label %then.512
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

define i8 @go_0llvm.MX..eq(ptr nest nocapture readnone %nest.66, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.534 = icmp eq ptr %key1, null
  br i1 %icmp.534, label %then.528, label %else.528, !make.implicit !3

then.528:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.528:                                         ; preds = %entry
  %tmpv.952.sroa.0.0.copyload = load ptr, ptr %key1, align 8
  %tmpv.952.sroa.3.0.cast.3282.sroa_idx20 = getelementptr inbounds i8, ptr %key1, i64 16
  %tmpv.952.sroa.3.0.copyload = load i16, ptr %tmpv.952.sroa.3.0.cast.3282.sroa_idx20, align 8
  %tmpv.952.sroa.5.0.cast.3282.sroa_idx21 = getelementptr inbounds i8, ptr %key1, i64 18
  %tmpv.952.sroa.5.0.copyload = load i16, ptr %tmpv.952.sroa.5.0.cast.3282.sroa_idx21, align 2
  %tmpv.952.sroa.6.0.cast.3282.sroa_idx22 = getelementptr inbounds i8, ptr %key1, i64 20
  %tmpv.952.sroa.6.0.copyload = load i32, ptr %tmpv.952.sroa.6.0.cast.3282.sroa_idx22, align 4
  %tmpv.952.sroa.7.0.cast.3282.sroa_idx23 = getelementptr inbounds i8, ptr %key1, i64 24
  %tmpv.952.sroa.7.0.copyload = load i16, ptr %tmpv.952.sroa.7.0.cast.3282.sroa_idx23, align 8
  %icmp.535 = icmp eq ptr %key2, null
  br i1 %icmp.535, label %then.529, label %else.529, !make.implicit !3

then.529:                                         ; preds = %else.528
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.529:                                         ; preds = %else.528
  %tmpv.952.sroa.2.0.cast.3282.sroa_idx19 = getelementptr inbounds i8, ptr %key1, i64 8
  %tmpv.952.sroa.2.0.copyload = load i64, ptr %tmpv.952.sroa.2.0.cast.3282.sroa_idx19, align 8
  %tmpv.953.sroa.0.0.copyload = load ptr, ptr %key2, align 8
  %tmpv.953.sroa.2.0.cast.3287.sroa_idx14 = getelementptr inbounds i8, ptr %key2, i64 8
  %tmpv.953.sroa.2.0.copyload = load i64, ptr %tmpv.953.sroa.2.0.cast.3287.sroa_idx14, align 8
  %tmpv.953.sroa.3.0.cast.3287.sroa_idx15 = getelementptr inbounds i8, ptr %key2, i64 16
  %tmpv.953.sroa.3.0.copyload = load i16, ptr %tmpv.953.sroa.3.0.cast.3287.sroa_idx15, align 8
  %tmpv.953.sroa.5.0.cast.3287.sroa_idx16 = getelementptr inbounds i8, ptr %key2, i64 18
  %tmpv.953.sroa.5.0.copyload = load i16, ptr %tmpv.953.sroa.5.0.cast.3287.sroa_idx16, align 2
  %tmpv.953.sroa.6.0.cast.3287.sroa_idx17 = getelementptr inbounds i8, ptr %key2, i64 20
  %tmpv.953.sroa.6.0.copyload = load i32, ptr %tmpv.953.sroa.6.0.cast.3287.sroa_idx17, align 4
  %tmpv.953.sroa.7.0.cast.3287.sroa_idx18 = getelementptr inbounds i8, ptr %key2, i64 24
  %tmpv.953.sroa.7.0.copyload = load i16, ptr %tmpv.953.sroa.7.0.cast.3287.sroa_idx18, align 8
  %icmp.536 = icmp eq i64 %tmpv.952.sroa.2.0.copyload, %tmpv.953.sroa.2.0.copyload
  br i1 %icmp.536, label %then.530, label %fallthrough.530

then.530:                                         ; preds = %else.529
  %icmp.537 = icmp eq ptr %tmpv.952.sroa.0.0.copyload, %tmpv.953.sroa.0.0.copyload
  br i1 %icmp.537, label %fallthrough.530, label %else.531

fallthrough.530:                                  ; preds = %else.531, %then.530, %else.529
  %tmpv.962.0 = phi i1 [ false, %else.529 ], [ %icmp.538, %else.531 ], [ true, %then.530 ]
  %icmp.540 = icmp eq i16 %tmpv.952.sroa.3.0.copyload, %tmpv.953.sroa.3.0.copyload
  %spec.select = select i1 %tmpv.962.0, i1 %icmp.540, i1 false
  %icmp.541 = icmp eq i16 %tmpv.952.sroa.5.0.copyload, %tmpv.953.sroa.5.0.copyload
  %tmpv.964.0.in = select i1 %spec.select, i1 %icmp.541, i1 false
  %icmp.542 = icmp eq i32 %tmpv.952.sroa.6.0.copyload, %tmpv.953.sroa.6.0.copyload
  %spec.select27 = select i1 %tmpv.964.0.in, i1 %icmp.542, i1 false
  %icmp.543 = icmp eq i16 %tmpv.952.sroa.7.0.copyload, %tmpv.953.sroa.7.0.copyload
  %tmpv.966.0.in = select i1 %spec.select27, i1 %icmp.543, i1 false
  br i1 %tmpv.966.0.in, label %else.538, label %then.536

else.531:                                         ; preds = %then.530
  %bcmp1 = call i32 @bcmp(ptr %tmpv.952.sroa.0.0.copyload, ptr %tmpv.953.sroa.0.0.copyload, i64 %tmpv.952.sroa.2.0.copyload)
  %icmp.538 = icmp eq i32 %bcmp1, 0
  br label %fallthrough.530

then.536:                                         ; preds = %else.543, %then.542, %else.540, %else.538, %fallthrough.530
  %merge = phi i8 [ 0, %else.538 ], [ 0, %fallthrough.530 ], [ 0, %else.540 ], [ %phi.cast, %else.543 ], [ 1, %then.542 ]
  ret i8 %merge

else.538:                                         ; preds = %fallthrough.530
  %field.1205 = getelementptr inbounds i8, ptr %key1, i64 32
  %.field.ld.189 = load i16, ptr %field.1205, align 2
  %field.1206 = getelementptr inbounds i8, ptr %key2, i64 32
  %.field.ld.190 = load i16, ptr %field.1206, align 2
  %icmp.547.not = icmp eq i16 %.field.ld.189, %.field.ld.190
  br i1 %icmp.547.not, label %else.540, label %then.536

else.540:                                         ; preds = %else.538
  %tmpv.969.sroa.0.0.cast.3298.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 40
  %tmpv.969.sroa.0.0.copyload = load ptr, ptr %tmpv.969.sroa.0.0.cast.3298.sroa_idx, align 8
  %tmpv.969.sroa.3.0.cast.3298.sroa_idx3 = getelementptr inbounds i8, ptr %key1, i64 48
  %tmpv.969.sroa.3.0.copyload = load i64, ptr %tmpv.969.sroa.3.0.cast.3298.sroa_idx3, align 8
  %tmpv.971.sroa.0.0.cast.3301.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 40
  %tmpv.971.sroa.0.0.copyload = load ptr, ptr %tmpv.971.sroa.0.0.cast.3301.sroa_idx, align 8
  %tmpv.971.sroa.3.0.cast.3301.sroa_idx1 = getelementptr inbounds i8, ptr %key2, i64 48
  %tmpv.971.sroa.3.0.copyload = load i64, ptr %tmpv.971.sroa.3.0.cast.3301.sroa_idx1, align 8
  %icmp.550 = icmp eq i64 %tmpv.969.sroa.3.0.copyload, %tmpv.971.sroa.3.0.copyload
  br i1 %icmp.550, label %then.542, label %then.536

then.542:                                         ; preds = %else.540
  %icmp.551 = icmp eq ptr %tmpv.969.sroa.0.0.copyload, %tmpv.971.sroa.0.0.copyload
  br i1 %icmp.551, label %then.536, label %else.543

else.543:                                         ; preds = %then.542
  %bcmp = call i32 @bcmp(ptr %tmpv.969.sroa.0.0.copyload, ptr %tmpv.971.sroa.0.0.copyload, i64 %tmpv.969.sroa.3.0.copyload)
  %icmp.552 = icmp eq i32 %bcmp, 0
  %phi.cast = zext i1 %icmp.552 to i8
  br label %then.536
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

define i8 @go_0llvm.NS..eq(ptr nest nocapture readnone %nest.67, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.554 = icmp eq ptr %key1, null
  br i1 %icmp.554, label %then.546, label %else.546, !make.implicit !3

then.546:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.546:                                         ; preds = %entry
  %tmpv.977.sroa.0.0.copyload = load ptr, ptr %key1, align 8
  %tmpv.977.sroa.3.0.cast.3306.sroa_idx20 = getelementptr inbounds i8, ptr %key1, i64 16
  %tmpv.977.sroa.3.0.copyload = load i16, ptr %tmpv.977.sroa.3.0.cast.3306.sroa_idx20, align 8
  %tmpv.977.sroa.5.0.cast.3306.sroa_idx21 = getelementptr inbounds i8, ptr %key1, i64 18
  %tmpv.977.sroa.5.0.copyload = load i16, ptr %tmpv.977.sroa.5.0.cast.3306.sroa_idx21, align 2
  %tmpv.977.sroa.6.0.cast.3306.sroa_idx22 = getelementptr inbounds i8, ptr %key1, i64 20
  %tmpv.977.sroa.6.0.copyload = load i32, ptr %tmpv.977.sroa.6.0.cast.3306.sroa_idx22, align 4
  %tmpv.977.sroa.7.0.cast.3306.sroa_idx23 = getelementptr inbounds i8, ptr %key1, i64 24
  %tmpv.977.sroa.7.0.copyload = load i16, ptr %tmpv.977.sroa.7.0.cast.3306.sroa_idx23, align 8
  %icmp.555 = icmp eq ptr %key2, null
  br i1 %icmp.555, label %then.547, label %else.547, !make.implicit !3

then.547:                                         ; preds = %else.546
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.547:                                         ; preds = %else.546
  %tmpv.977.sroa.2.0.cast.3306.sroa_idx19 = getelementptr inbounds i8, ptr %key1, i64 8
  %tmpv.977.sroa.2.0.copyload = load i64, ptr %tmpv.977.sroa.2.0.cast.3306.sroa_idx19, align 8
  %tmpv.978.sroa.0.0.copyload = load ptr, ptr %key2, align 8
  %tmpv.978.sroa.2.0.cast.3311.sroa_idx14 = getelementptr inbounds i8, ptr %key2, i64 8
  %tmpv.978.sroa.2.0.copyload = load i64, ptr %tmpv.978.sroa.2.0.cast.3311.sroa_idx14, align 8
  %tmpv.978.sroa.3.0.cast.3311.sroa_idx15 = getelementptr inbounds i8, ptr %key2, i64 16
  %tmpv.978.sroa.3.0.copyload = load i16, ptr %tmpv.978.sroa.3.0.cast.3311.sroa_idx15, align 8
  %tmpv.978.sroa.5.0.cast.3311.sroa_idx16 = getelementptr inbounds i8, ptr %key2, i64 18
  %tmpv.978.sroa.5.0.copyload = load i16, ptr %tmpv.978.sroa.5.0.cast.3311.sroa_idx16, align 2
  %tmpv.978.sroa.6.0.cast.3311.sroa_idx17 = getelementptr inbounds i8, ptr %key2, i64 20
  %tmpv.978.sroa.6.0.copyload = load i32, ptr %tmpv.978.sroa.6.0.cast.3311.sroa_idx17, align 4
  %tmpv.978.sroa.7.0.cast.3311.sroa_idx18 = getelementptr inbounds i8, ptr %key2, i64 24
  %tmpv.978.sroa.7.0.copyload = load i16, ptr %tmpv.978.sroa.7.0.cast.3311.sroa_idx18, align 8
  %icmp.556 = icmp eq i64 %tmpv.977.sroa.2.0.copyload, %tmpv.978.sroa.2.0.copyload
  br i1 %icmp.556, label %then.548, label %fallthrough.548

then.548:                                         ; preds = %else.547
  %icmp.557 = icmp eq ptr %tmpv.977.sroa.0.0.copyload, %tmpv.978.sroa.0.0.copyload
  br i1 %icmp.557, label %fallthrough.548, label %else.549

fallthrough.548:                                  ; preds = %else.549, %then.548, %else.547
  %tmpv.987.0 = phi i1 [ false, %else.547 ], [ %icmp.558, %else.549 ], [ true, %then.548 ]
  %icmp.560 = icmp eq i16 %tmpv.977.sroa.3.0.copyload, %tmpv.978.sroa.3.0.copyload
  %spec.select = select i1 %tmpv.987.0, i1 %icmp.560, i1 false
  %icmp.561 = icmp eq i16 %tmpv.977.sroa.5.0.copyload, %tmpv.978.sroa.5.0.copyload
  %tmpv.989.0.in = select i1 %spec.select, i1 %icmp.561, i1 false
  %icmp.562 = icmp eq i32 %tmpv.977.sroa.6.0.copyload, %tmpv.978.sroa.6.0.copyload
  %spec.select26 = select i1 %tmpv.989.0.in, i1 %icmp.562, i1 false
  %icmp.563 = icmp eq i16 %tmpv.977.sroa.7.0.copyload, %tmpv.978.sroa.7.0.copyload
  %tmpv.991.0.in = select i1 %spec.select26, i1 %icmp.563, i1 false
  br i1 %tmpv.991.0.in, label %else.555, label %then.554

else.549:                                         ; preds = %then.548
  %bcmp1 = call i32 @bcmp(ptr %tmpv.977.sroa.0.0.copyload, ptr %tmpv.978.sroa.0.0.copyload, i64 %tmpv.977.sroa.2.0.copyload)
  %icmp.558 = icmp eq i32 %bcmp1, 0
  br label %fallthrough.548

then.554:                                         ; preds = %else.558, %then.557, %else.555, %fallthrough.548
  %merge = phi i8 [ 0, %fallthrough.548 ], [ 0, %else.555 ], [ %phi.cast, %else.558 ], [ 1, %then.557 ]
  ret i8 %merge

else.555:                                         ; preds = %fallthrough.548
  %tmpv.992.sroa.0.0.cast.3320.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 32
  %tmpv.992.sroa.0.0.copyload = load ptr, ptr %tmpv.992.sroa.0.0.cast.3320.sroa_idx, align 8
  %tmpv.992.sroa.3.0.cast.3320.sroa_idx3 = getelementptr inbounds i8, ptr %key1, i64 40
  %tmpv.992.sroa.3.0.copyload = load i64, ptr %tmpv.992.sroa.3.0.cast.3320.sroa_idx3, align 8
  %tmpv.994.sroa.0.0.cast.3323.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 32
  %tmpv.994.sroa.0.0.copyload = load ptr, ptr %tmpv.994.sroa.0.0.cast.3323.sroa_idx, align 8
  %tmpv.994.sroa.3.0.cast.3323.sroa_idx1 = getelementptr inbounds i8, ptr %key2, i64 40
  %tmpv.994.sroa.3.0.copyload = load i64, ptr %tmpv.994.sroa.3.0.cast.3323.sroa_idx1, align 8
  %icmp.567 = icmp eq i64 %tmpv.992.sroa.3.0.copyload, %tmpv.994.sroa.3.0.copyload
  br i1 %icmp.567, label %then.557, label %then.554

then.557:                                         ; preds = %else.555
  %icmp.568 = icmp eq ptr %tmpv.992.sroa.0.0.copyload, %tmpv.994.sroa.0.0.copyload
  br i1 %icmp.568, label %then.554, label %else.558

else.558:                                         ; preds = %then.557
  %bcmp = call i32 @bcmp(ptr %tmpv.992.sroa.0.0.copyload, ptr %tmpv.994.sroa.0.0.copyload, i64 %tmpv.992.sroa.3.0.copyload)
  %icmp.569 = icmp eq i32 %bcmp, 0
  %phi.cast = zext i1 %icmp.569 to i8
  br label %then.554
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

declare i8 @go_0llvm.SetValueFunc(ptr, ptr, ptr, ptr, i64, ptr) #0

declare i8 @go_0llvm.IsSubDomain(ptr, ptr, i64, ptr, i64) #0

declare void @go_0llvm.SubTypeSignature(ptr, ptr, ptr, i16) #0

define i8 @go_0llvm.MsgHdr..eq(ptr nest nocapture readnone %nest.55, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.298 = icmp eq ptr %key1, null
  br i1 %icmp.298, label %then.308, label %else.308, !make.implicit !3

then.308:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.308:                                         ; preds = %entry
  %icmp.299 = icmp eq ptr %key2, null
  br i1 %icmp.299, label %then.309, label %else.309, !make.implicit !3

then.309:                                         ; preds = %else.308
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.309:                                         ; preds = %else.308
  %.field.ld.119 = load i16, ptr %key1, align 2
  %.field.ld.120 = load i16, ptr %key2, align 2
  %icmp.300.not = icmp eq i16 %.field.ld.119, %.field.ld.120
  br i1 %icmp.300.not, label %else.312, label %common.ret

common.ret:                                       ; preds = %else.309, %else.312, %else.315, %else.318, %else.321, %else.324, %else.327, %else.330, %else.333, %else.336, %else.339
  %common.ret.op = phi i8 [ %spec.select, %else.339 ], [ 0, %else.336 ], [ 0, %else.333 ], [ 0, %else.330 ], [ 0, %else.327 ], [ 0, %else.324 ], [ 0, %else.321 ], [ 0, %else.318 ], [ 0, %else.315 ], [ 0, %else.312 ], [ 0, %else.309 ]
  ret i8 %common.ret.op

else.312:                                         ; preds = %else.309
  %0 = getelementptr inbounds i8, ptr %key1, i64 2
  %.field.ld.121 = load i8, ptr %0, align 1
  %1 = getelementptr inbounds i8, ptr %key2, i64 2
  %.field.ld.122 = load i8, ptr %1, align 1
  %icmp.303.not = icmp eq i8 %.field.ld.121, %.field.ld.122
  br i1 %icmp.303.not, label %else.315, label %common.ret

else.315:                                         ; preds = %else.312
  %field.921 = getelementptr inbounds i8, ptr %key1, i64 8
  %.field.ld.123 = load i64, ptr %field.921, align 8
  %field.922 = getelementptr inbounds i8, ptr %key2, i64 8
  %.field.ld.124 = load i64, ptr %field.922, align 8
  %icmp.306.not = icmp eq i64 %.field.ld.123, %.field.ld.124
  br i1 %icmp.306.not, label %else.318, label %common.ret

else.318:                                         ; preds = %else.315
  %2 = getelementptr inbounds i8, ptr %key1, i64 16
  %.field.ld.125 = load i8, ptr %2, align 1
  %3 = getelementptr inbounds i8, ptr %key2, i64 16
  %.field.ld.126 = load i8, ptr %3, align 1
  %icmp.309.not = icmp eq i8 %.field.ld.125, %.field.ld.126
  br i1 %icmp.309.not, label %else.321, label %common.ret

else.321:                                         ; preds = %else.318
  %4 = getelementptr inbounds i8, ptr %key1, i64 17
  %.field.ld.127 = load i8, ptr %4, align 1
  %5 = getelementptr inbounds i8, ptr %key2, i64 17
  %.field.ld.128 = load i8, ptr %5, align 1
  %icmp.312.not = icmp eq i8 %.field.ld.127, %.field.ld.128
  br i1 %icmp.312.not, label %else.324, label %common.ret

else.324:                                         ; preds = %else.321
  %6 = getelementptr inbounds i8, ptr %key1, i64 18
  %.field.ld.129 = load i8, ptr %6, align 1
  %7 = getelementptr inbounds i8, ptr %key2, i64 18
  %.field.ld.130 = load i8, ptr %7, align 1
  %icmp.315.not = icmp eq i8 %.field.ld.129, %.field.ld.130
  br i1 %icmp.315.not, label %else.327, label %common.ret

else.327:                                         ; preds = %else.324
  %8 = getelementptr inbounds i8, ptr %key1, i64 19
  %.field.ld.131 = load i8, ptr %8, align 1
  %9 = getelementptr inbounds i8, ptr %key2, i64 19
  %.field.ld.132 = load i8, ptr %9, align 1
  %icmp.318.not = icmp eq i8 %.field.ld.131, %.field.ld.132
  br i1 %icmp.318.not, label %else.330, label %common.ret

else.330:                                         ; preds = %else.327
  %10 = getelementptr inbounds i8, ptr %key1, i64 20
  %.field.ld.133 = load i8, ptr %10, align 1
  %11 = getelementptr inbounds i8, ptr %key2, i64 20
  %.field.ld.134 = load i8, ptr %11, align 1
  %icmp.321.not = icmp eq i8 %.field.ld.133, %.field.ld.134
  br i1 %icmp.321.not, label %else.333, label %common.ret

else.333:                                         ; preds = %else.330
  %12 = getelementptr inbounds i8, ptr %key1, i64 21
  %.field.ld.135 = load i8, ptr %12, align 1
  %13 = getelementptr inbounds i8, ptr %key2, i64 21
  %.field.ld.136 = load i8, ptr %13, align 1
  %icmp.324.not = icmp eq i8 %.field.ld.135, %.field.ld.136
  br i1 %icmp.324.not, label %else.336, label %common.ret

else.336:                                         ; preds = %else.333
  %14 = getelementptr inbounds i8, ptr %key1, i64 22
  %.field.ld.137 = load i8, ptr %14, align 1
  %15 = getelementptr inbounds i8, ptr %key2, i64 22
  %.field.ld.138 = load i8, ptr %15, align 1
  %icmp.327.not = icmp eq i8 %.field.ld.137, %.field.ld.138
  br i1 %icmp.327.not, label %else.339, label %common.ret

else.339:                                         ; preds = %else.336
  %field.937 = getelementptr inbounds i8, ptr %key1, i64 24
  %.field.ld.139 = load i64, ptr %field.937, align 8
  %field.938 = getelementptr inbounds i8, ptr %key2, i64 24
  %.field.ld.140 = load i64, ptr %field.938, align 8
  %icmp.330.not = icmp eq i64 %.field.ld.139, %.field.ld.140
  %spec.select = zext i1 %icmp.330.not to i8
  br label %common.ret
}

define i8 @go_0llvm.Question..eq(ptr nest nocapture readnone %nest.56, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.331 = icmp eq ptr %key1, null
  br i1 %icmp.331, label %then.341, label %else.341, !make.implicit !3

then.341:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.341:                                         ; preds = %entry
  %tmpv.740.sroa.0.0.copyload = load ptr, ptr %key1, align 8
  %icmp.332 = icmp eq ptr %key2, null
  br i1 %icmp.332, label %then.342, label %else.342, !make.implicit !3

then.342:                                         ; preds = %else.341
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.342:                                         ; preds = %else.341
  %tmpv.740.sroa.3.0.cast.3062.sroa_idx3 = getelementptr inbounds i8, ptr %key1, i64 8
  %tmpv.740.sroa.3.0.copyload = load i64, ptr %tmpv.740.sroa.3.0.cast.3062.sroa_idx3, align 8
  %tmpv.742.sroa.0.0.copyload = load ptr, ptr %key2, align 8
  %tmpv.742.sroa.3.0.cast.3065.sroa_idx1 = getelementptr inbounds i8, ptr %key2, i64 8
  %tmpv.742.sroa.3.0.copyload = load i64, ptr %tmpv.742.sroa.3.0.cast.3065.sroa_idx1, align 8
  %icmp.333 = icmp eq i64 %tmpv.740.sroa.3.0.copyload, %tmpv.742.sroa.3.0.copyload
  br i1 %icmp.333, label %then.343, label %common.ret

then.343:                                         ; preds = %else.342
  %icmp.334 = icmp eq ptr %tmpv.740.sroa.0.0.copyload, %tmpv.742.sroa.0.0.copyload
  br i1 %icmp.334, label %else.347, label %else.344

else.344:                                         ; preds = %then.343
  %bcmp = call i32 @bcmp(ptr %tmpv.740.sroa.0.0.copyload, ptr %tmpv.742.sroa.0.0.copyload, i64 %tmpv.740.sroa.3.0.copyload)
  %icmp.335 = icmp eq i32 %bcmp, 0
  br i1 %icmp.335, label %else.347, label %common.ret

common.ret:                                       ; preds = %else.342, %else.344, %else.347, %else.350
  %common.ret.op = phi i8 [ %spec.select, %else.350 ], [ 0, %else.347 ], [ 0, %else.344 ], [ 0, %else.342 ]
  ret i8 %common.ret.op

else.347:                                         ; preds = %else.344, %then.343
  %field.948 = getelementptr inbounds i8, ptr %key1, i64 16
  %.field.ld.141 = load i16, ptr %field.948, align 2
  %field.949 = getelementptr inbounds i8, ptr %key2, i64 16
  %.field.ld.142 = load i16, ptr %field.949, align 2
  %icmp.339.not = icmp eq i16 %.field.ld.141, %.field.ld.142
  br i1 %icmp.339.not, label %else.350, label %common.ret

else.350:                                         ; preds = %else.347
  %field.950 = getelementptr inbounds i8, ptr %key1, i64 18
  %.field.ld.143 = load i16, ptr %field.950, align 2
  %field.951 = getelementptr inbounds i8, ptr %key2, i64 18
  %.field.ld.144 = load i16, ptr %field.951, align 2
  %icmp.342.not = icmp eq i16 %.field.ld.143, %.field.ld.144
  %spec.select = zext i1 %icmp.342.not to i8
  br label %common.ret
}

declare i8 @go_0llvm.Request.Do(ptr, ptr) #0

declare { ptr, i64 } @go_0llvm.Request.Name(ptr, ptr) #0

declare i16 @go_0llvm.Request.QType(ptr, ptr) #0

define i8 @go_0llvm.Request..eq(ptr nest nocapture readnone %nest.58, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.361 = icmp eq ptr %key1, null
  br i1 %icmp.361, label %then.369, label %else.369, !make.implicit !3

then.369:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.369:                                         ; preds = %entry
  %icmp.362 = icmp eq ptr %key2, null
  br i1 %icmp.362, label %then.370, label %else.370, !make.implicit !3

then.370:                                         ; preds = %else.369
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.370:                                         ; preds = %else.369
  %.field.ld.153 = load ptr, ptr %key1, align 8
  %.field.ld.154 = load ptr, ptr %key2, align 8
  %icmp.363.not = icmp eq ptr %.field.ld.153, %.field.ld.154
  br i1 %icmp.363.not, label %else.373, label %then.371

then.371:                                         ; preds = %else.412, %then.411, %else.409, %else.407, %else.404, %else.402, %else.399, %else.397, %else.394, %else.392, %else.389, %else.387, %else.384, %else.381, %else.378, %else.375, %else.373, %else.370
  %merge = phi i8 [ 0, %else.407 ], [ 0, %else.402 ], [ 0, %else.397 ], [ 0, %else.392 ], [ 0, %else.387 ], [ 0, %else.384 ], [ 0, %else.381 ], [ 0, %else.378 ], [ 0, %else.373 ], [ 0, %else.370 ], [ 0, %else.409 ], [ %phi.cast, %else.412 ], [ 1, %then.411 ], [ 0, %else.375 ], [ 0, %else.389 ], [ 0, %else.394 ], [ 0, %else.399 ], [ 0, %else.404 ]
  ret i8 %merge

else.373:                                         ; preds = %else.370
  %field.971 = getelementptr inbounds i8, ptr %key1, i64 8
  %field.972 = getelementptr inbounds i8, ptr %key2, i64 8
  %ld.112 = load ptr, ptr %field.971, align 8
  %field1.53 = getelementptr inbounds i8, ptr %key1, i64 16
  %ld.113 = load ptr, ptr %field1.53, align 8
  %ld.114 = load ptr, ptr %field.972, align 8
  %field1.54 = getelementptr inbounds i8, ptr %key2, i64 16
  %ld.115 = load ptr, ptr %field1.54, align 8
  %call.113 = call i8 @runtime.ifaceeq(ptr nest undef, ptr %ld.112, ptr %ld.113, ptr %ld.114, ptr %ld.115)
  %icmp.366.not = icmp eq i8 %call.113, 1
  br i1 %icmp.366.not, label %else.375, label %then.371

else.375:                                         ; preds = %else.373
  %tmpv.772.sroa.0.0.cast.3098.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 24
  %tmpv.772.sroa.0.0.copyload = load ptr, ptr %tmpv.772.sroa.0.0.cast.3098.sroa_idx, align 8
  %tmpv.772.sroa.3.0.cast.3098.sroa_idx18 = getelementptr inbounds i8, ptr %key1, i64 32
  %tmpv.772.sroa.3.0.copyload = load i64, ptr %tmpv.772.sroa.3.0.cast.3098.sroa_idx18, align 8
  %tmpv.774.sroa.0.0.cast.3101.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 24
  %tmpv.774.sroa.0.0.copyload = load ptr, ptr %tmpv.774.sroa.0.0.cast.3101.sroa_idx, align 8
  %tmpv.774.sroa.3.0.cast.3101.sroa_idx16 = getelementptr inbounds i8, ptr %key2, i64 32
  %tmpv.774.sroa.3.0.copyload = load i64, ptr %tmpv.774.sroa.3.0.cast.3101.sroa_idx16, align 8
  %icmp.369 = icmp eq i64 %tmpv.772.sroa.3.0.copyload, %tmpv.774.sroa.3.0.copyload
  br i1 %icmp.369, label %then.377, label %then.371

then.377:                                         ; preds = %else.375
  %icmp.370 = icmp eq ptr %tmpv.772.sroa.0.0.copyload, %tmpv.774.sroa.0.0.copyload
  br i1 %icmp.370, label %else.381, label %else.378

else.378:                                         ; preds = %then.377
  %bcmp = call i32 @bcmp(ptr %tmpv.772.sroa.0.0.copyload, ptr %tmpv.774.sroa.0.0.copyload, i64 %tmpv.772.sroa.3.0.copyload)
  %icmp.371 = icmp eq i32 %bcmp, 0
  br i1 %icmp.371, label %else.381, label %then.371

else.381:                                         ; preds = %else.378, %then.377
  %field.982 = getelementptr inbounds i8, ptr %key1, i64 40
  %.field.ld.155 = load i16, ptr %field.982, align 2
  %field.983 = getelementptr inbounds i8, ptr %key2, i64 40
  %.field.ld.156 = load i16, ptr %field.983, align 2
  %icmp.375.not = icmp eq i16 %.field.ld.155, %.field.ld.156
  br i1 %icmp.375.not, label %else.384, label %then.371

else.384:                                         ; preds = %else.381
  %0 = getelementptr inbounds i8, ptr %key1, i64 42
  %.field.ld.157 = load i8, ptr %0, align 1
  %1 = getelementptr inbounds i8, ptr %key2, i64 42
  %.field.ld.158 = load i8, ptr %1, align 1
  %icmp.378.not = icmp eq i8 %.field.ld.157, %.field.ld.158
  br i1 %icmp.378.not, label %else.387, label %then.371

else.387:                                         ; preds = %else.384
  %2 = getelementptr inbounds i8, ptr %key1, i64 43
  %.field.ld.159 = load i8, ptr %2, align 1
  %3 = getelementptr inbounds i8, ptr %key2, i64 43
  %.field.ld.160 = load i8, ptr %3, align 1
  %icmp.381.not = icmp eq i8 %.field.ld.159, %.field.ld.160
  br i1 %icmp.381.not, label %else.389, label %then.371

else.389:                                         ; preds = %else.387
  %tmpv.784.sroa.0.0.cast.3110.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 48
  %tmpv.784.sroa.0.0.copyload = load ptr, ptr %tmpv.784.sroa.0.0.cast.3110.sroa_idx, align 8
  %tmpv.784.sroa.3.0.cast.3110.sroa_idx15 = getelementptr inbounds i8, ptr %key1, i64 56
  %tmpv.784.sroa.3.0.copyload = load i64, ptr %tmpv.784.sroa.3.0.cast.3110.sroa_idx15, align 8
  %tmpv.786.sroa.0.0.cast.3113.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 48
  %tmpv.786.sroa.0.0.copyload = load ptr, ptr %tmpv.786.sroa.0.0.cast.3113.sroa_idx, align 8
  %tmpv.786.sroa.3.0.cast.3113.sroa_idx13 = getelementptr inbounds i8, ptr %key2, i64 56
  %tmpv.786.sroa.3.0.copyload = load i64, ptr %tmpv.786.sroa.3.0.cast.3113.sroa_idx13, align 8
  %icmp.384 = icmp eq i64 %tmpv.784.sroa.3.0.copyload, %tmpv.786.sroa.3.0.copyload
  br i1 %icmp.384, label %then.391, label %then.371

then.391:                                         ; preds = %else.389
  %icmp.385 = icmp eq ptr %tmpv.784.sroa.0.0.copyload, %tmpv.786.sroa.0.0.copyload
  br i1 %icmp.385, label %else.394, label %else.392

else.392:                                         ; preds = %then.391
  %bcmp1 = call i32 @bcmp(ptr %tmpv.784.sroa.0.0.copyload, ptr %tmpv.786.sroa.0.0.copyload, i64 %tmpv.784.sroa.3.0.copyload)
  %icmp.386 = icmp eq i32 %bcmp1, 0
  br i1 %icmp.386, label %else.394, label %then.371

else.394:                                         ; preds = %else.392, %then.391
  %tmpv.790.sroa.0.0.cast.3116.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 64
  %tmpv.790.sroa.0.0.copyload = load ptr, ptr %tmpv.790.sroa.0.0.cast.3116.sroa_idx, align 8
  %tmpv.790.sroa.3.0.cast.3116.sroa_idx12 = getelementptr inbounds i8, ptr %key1, i64 72
  %tmpv.790.sroa.3.0.copyload = load i64, ptr %tmpv.790.sroa.3.0.cast.3116.sroa_idx12, align 8
  %tmpv.792.sroa.0.0.cast.3119.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 64
  %tmpv.792.sroa.0.0.copyload = load ptr, ptr %tmpv.792.sroa.0.0.cast.3119.sroa_idx, align 8
  %tmpv.792.sroa.3.0.cast.3119.sroa_idx10 = getelementptr inbounds i8, ptr %key2, i64 72
  %tmpv.792.sroa.3.0.copyload = load i64, ptr %tmpv.792.sroa.3.0.cast.3119.sroa_idx10, align 8
  %icmp.390 = icmp eq i64 %tmpv.790.sroa.3.0.copyload, %tmpv.792.sroa.3.0.copyload
  br i1 %icmp.390, label %then.396, label %then.371

then.396:                                         ; preds = %else.394
  %icmp.391 = icmp eq ptr %tmpv.790.sroa.0.0.copyload, %tmpv.792.sroa.0.0.copyload
  br i1 %icmp.391, label %else.399, label %else.397

else.397:                                         ; preds = %then.396
  %bcmp2 = call i32 @bcmp(ptr %tmpv.790.sroa.0.0.copyload, ptr %tmpv.792.sroa.0.0.copyload, i64 %tmpv.790.sroa.3.0.copyload)
  %icmp.392 = icmp eq i32 %bcmp2, 0
  br i1 %icmp.392, label %else.399, label %then.371

else.399:                                         ; preds = %else.397, %then.396
  %tmpv.796.sroa.0.0.cast.3122.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 80
  %tmpv.796.sroa.0.0.copyload = load ptr, ptr %tmpv.796.sroa.0.0.cast.3122.sroa_idx, align 8
  %tmpv.796.sroa.3.0.cast.3122.sroa_idx9 = getelementptr inbounds i8, ptr %key1, i64 88
  %tmpv.796.sroa.3.0.copyload = load i64, ptr %tmpv.796.sroa.3.0.cast.3122.sroa_idx9, align 8
  %tmpv.798.sroa.0.0.cast.3125.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 80
  %tmpv.798.sroa.0.0.copyload = load ptr, ptr %tmpv.798.sroa.0.0.cast.3125.sroa_idx, align 8
  %tmpv.798.sroa.3.0.cast.3125.sroa_idx7 = getelementptr inbounds i8, ptr %key2, i64 88
  %tmpv.798.sroa.3.0.copyload = load i64, ptr %tmpv.798.sroa.3.0.cast.3125.sroa_idx7, align 8
  %icmp.396 = icmp eq i64 %tmpv.796.sroa.3.0.copyload, %tmpv.798.sroa.3.0.copyload
  br i1 %icmp.396, label %then.401, label %then.371

then.401:                                         ; preds = %else.399
  %icmp.397 = icmp eq ptr %tmpv.796.sroa.0.0.copyload, %tmpv.798.sroa.0.0.copyload
  br i1 %icmp.397, label %else.404, label %else.402

else.402:                                         ; preds = %then.401
  %bcmp3 = call i32 @bcmp(ptr %tmpv.796.sroa.0.0.copyload, ptr %tmpv.798.sroa.0.0.copyload, i64 %tmpv.796.sroa.3.0.copyload)
  %icmp.398 = icmp eq i32 %bcmp3, 0
  br i1 %icmp.398, label %else.404, label %then.371

else.404:                                         ; preds = %else.402, %then.401
  %tmpv.802.sroa.0.0.cast.3128.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 96
  %tmpv.802.sroa.0.0.copyload = load ptr, ptr %tmpv.802.sroa.0.0.cast.3128.sroa_idx, align 8
  %tmpv.802.sroa.3.0.cast.3128.sroa_idx6 = getelementptr inbounds i8, ptr %key1, i64 104
  %tmpv.802.sroa.3.0.copyload = load i64, ptr %tmpv.802.sroa.3.0.cast.3128.sroa_idx6, align 8
  %tmpv.804.sroa.0.0.cast.3131.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 96
  %tmpv.804.sroa.0.0.copyload = load ptr, ptr %tmpv.804.sroa.0.0.cast.3131.sroa_idx, align 8
  %tmpv.804.sroa.3.0.cast.3131.sroa_idx4 = getelementptr inbounds i8, ptr %key2, i64 104
  %tmpv.804.sroa.3.0.copyload = load i64, ptr %tmpv.804.sroa.3.0.cast.3131.sroa_idx4, align 8
  %icmp.402 = icmp eq i64 %tmpv.802.sroa.3.0.copyload, %tmpv.804.sroa.3.0.copyload
  br i1 %icmp.402, label %then.406, label %then.371

then.406:                                         ; preds = %else.404
  %icmp.403 = icmp eq ptr %tmpv.802.sroa.0.0.copyload, %tmpv.804.sroa.0.0.copyload
  br i1 %icmp.403, label %else.409, label %else.407

else.407:                                         ; preds = %then.406
  %bcmp4 = call i32 @bcmp(ptr %tmpv.802.sroa.0.0.copyload, ptr %tmpv.804.sroa.0.0.copyload, i64 %tmpv.802.sroa.3.0.copyload)
  %icmp.404 = icmp eq i32 %bcmp4, 0
  br i1 %icmp.404, label %else.409, label %then.371

else.409:                                         ; preds = %else.407, %then.406
  %tmpv.808.sroa.0.0.cast.3134.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 112
  %tmpv.808.sroa.0.0.copyload = load ptr, ptr %tmpv.808.sroa.0.0.cast.3134.sroa_idx, align 8
  %tmpv.808.sroa.3.0.cast.3134.sroa_idx3 = getelementptr inbounds i8, ptr %key1, i64 120
  %tmpv.808.sroa.3.0.copyload = load i64, ptr %tmpv.808.sroa.3.0.cast.3134.sroa_idx3, align 8
  %tmpv.810.sroa.0.0.cast.3137.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 112
  %tmpv.810.sroa.0.0.copyload = load ptr, ptr %tmpv.810.sroa.0.0.cast.3137.sroa_idx, align 8
  %tmpv.810.sroa.3.0.cast.3137.sroa_idx1 = getelementptr inbounds i8, ptr %key2, i64 120
  %tmpv.810.sroa.3.0.copyload = load i64, ptr %tmpv.810.sroa.3.0.cast.3137.sroa_idx1, align 8
  %icmp.408 = icmp eq i64 %tmpv.808.sroa.3.0.copyload, %tmpv.810.sroa.3.0.copyload
  br i1 %icmp.408, label %then.411, label %then.371

then.411:                                         ; preds = %else.409
  %icmp.409 = icmp eq ptr %tmpv.808.sroa.0.0.copyload, %tmpv.810.sroa.0.0.copyload
  br i1 %icmp.409, label %then.371, label %else.412

else.412:                                         ; preds = %then.411
  %bcmp5 = call i32 @bcmp(ptr %tmpv.808.sroa.0.0.copyload, ptr %tmpv.810.sroa.0.0.copyload, i64 %tmpv.808.sroa.3.0.copyload)
  %icmp.410 = icmp eq i32 %bcmp5, 0
  %phi.cast = zext i1 %icmp.410 to i8
  br label %then.371
}

define i8 @go_0llvm.ScrubWriter..eq(ptr nest nocapture readnone %nest.59, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.412 = icmp eq ptr %key1, null
  br i1 %icmp.412, label %then.414, label %else.414, !make.implicit !3

then.414:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.414:                                         ; preds = %entry
  %icmp.413 = icmp eq ptr %key2, null
  br i1 %icmp.413, label %then.415, label %else.415, !make.implicit !3

then.415:                                         ; preds = %else.414
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.415:                                         ; preds = %else.414
  %ld.116 = load ptr, ptr %key1, align 8
  %field1.55 = getelementptr inbounds i8, ptr %key1, i64 8
  %ld.117 = load ptr, ptr %field1.55, align 8
  %ld.118 = load ptr, ptr %key2, align 8
  %field1.56 = getelementptr inbounds i8, ptr %key2, i64 8
  %ld.119 = load ptr, ptr %field1.56, align 8
  %call.120 = call i8 @runtime.ifaceeq(ptr nest undef, ptr %ld.116, ptr %ld.117, ptr %ld.118, ptr %ld.119)
  %icmp.414.not = icmp eq i8 %call.120, 1
  br i1 %icmp.414.not, label %else.418, label %common.ret

common.ret:                                       ; preds = %else.415, %else.418
  %common.ret.op = phi i8 [ %spec.select, %else.418 ], [ 0, %else.415 ]
  ret i8 %common.ret.op

else.418:                                         ; preds = %else.415
  %field.1035 = getelementptr inbounds i8, ptr %key1, i64 16
  %.field.ld.161 = load ptr, ptr %field.1035, align 8
  %field.1036 = getelementptr inbounds i8, ptr %key2, i64 16
  %.field.ld.162 = load ptr, ptr %field.1036, align 8
  %icmp.417.not = icmp eq ptr %.field.ld.161, %.field.ld.162
  %spec.select = zext i1 %icmp.417.not to i8
  br label %common.ret
}

define { ptr, ptr } @go_0llvm.ScrubWriter.Close..stub(ptr nest nocapture readnone %nest.21, ptr readonly %"$this255.pointer") #0 {
entry:
  %tmpv.565 = alloca %ScrubWriter.0, align 8, !go_addrtaken !3
  %call.81 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d)
  %icmp.218 = icmp eq ptr %"$this255.pointer", null
  br i1 %icmp.218, label %then.226, label %else.226, !make.implicit !3

then.226:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.226:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.565, ptr noundef nonnull align 8 dereferenceable(24) %"$this255.pointer", i64 24, i1 false)
  %deref.ld.16 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.219 = icmp eq i32 %deref.ld.16, 0
  br i1 %icmp.219, label %then.227, label %else.227

then.227:                                         ; preds = %else.226
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.81, ptr noundef nonnull align 8 dereferenceable(24) %"$this255.pointer", i64 24, i1 false)
  br label %else.229

else.227:                                         ; preds = %else.226
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d, ptr nonnull %call.81, ptr nonnull %tmpv.565)
  br label %else.229

else.229:                                         ; preds = %else.227, %then.227
  %.field.ld.71 = load ptr, ptr %call.81, align 8
  %field.817 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.71, i64 0, i32 1
  %.field.ld.72 = load ptr, ptr %field.817, align 8
  %field.818 = getelementptr inbounds i8, ptr %call.81, i64 8
  %.field.ld.73 = load ptr, ptr %field.818, align 8
  %call.80 = call { ptr, ptr } %.field.ld.72(ptr nest undef, ptr %.field.ld.73)
  ret { ptr, ptr } %call.80
}

define void @go_0llvm.ScrubWriter.Hijack..stub(ptr nest nocapture readnone %nest.22, ptr readonly %"$this256.pointer") #0 {
entry:
  %tmpv.571 = alloca %ScrubWriter.0, align 8, !go_addrtaken !3
  %call.82 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d)
  %icmp.222 = icmp eq ptr %"$this256.pointer", null
  br i1 %icmp.222, label %then.230, label %else.230, !make.implicit !3

then.230:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.230:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.571, ptr noundef nonnull align 8 dereferenceable(24) %"$this256.pointer", i64 24, i1 false)
  %deref.ld.17 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.223 = icmp eq i32 %deref.ld.17, 0
  br i1 %icmp.223, label %then.231, label %else.231

then.231:                                         ; preds = %else.230
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.82, ptr noundef nonnull align 8 dereferenceable(24) %"$this256.pointer", i64 24, i1 false)
  br label %else.233

else.231:                                         ; preds = %else.230
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d, ptr nonnull %call.82, ptr nonnull %tmpv.571)
  br label %else.233

else.233:                                         ; preds = %else.231, %then.231
  %.field.ld.74 = load ptr, ptr %call.82, align 8
  %field.821 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.74, i64 0, i32 2
  %.field.ld.75 = load ptr, ptr %field.821, align 8
  %field.822 = getelementptr inbounds i8, ptr %call.82, i64 8
  %.field.ld.76 = load ptr, ptr %field.822, align 8
  call void %.field.ld.75(ptr nest undef, ptr %.field.ld.76)
  ret void
}

define { ptr, ptr } @go_0llvm.ScrubWriter.LocalAddr..stub(ptr nest nocapture readnone %nest.23, ptr readonly %"$this257.pointer") #0 {
entry:
  %tmpv.578 = alloca %ScrubWriter.0, align 8, !go_addrtaken !3
  %call.84 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d)
  %icmp.226 = icmp eq ptr %"$this257.pointer", null
  br i1 %icmp.226, label %then.234, label %else.234, !make.implicit !3

then.234:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.234:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.578, ptr noundef nonnull align 8 dereferenceable(24) %"$this257.pointer", i64 24, i1 false)
  %deref.ld.18 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.227 = icmp eq i32 %deref.ld.18, 0
  br i1 %icmp.227, label %then.235, label %else.235

then.235:                                         ; preds = %else.234
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.84, ptr noundef nonnull align 8 dereferenceable(24) %"$this257.pointer", i64 24, i1 false)
  br label %else.237

else.235:                                         ; preds = %else.234
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d, ptr nonnull %call.84, ptr nonnull %tmpv.578)
  br label %else.237

else.237:                                         ; preds = %else.235, %then.235
  %.field.ld.77 = load ptr, ptr %call.84, align 8
  %field.825 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.77, i64 0, i32 3
  %.field.ld.78 = load ptr, ptr %field.825, align 8
  %field.826 = getelementptr inbounds i8, ptr %call.84, i64 8
  %.field.ld.79 = load ptr, ptr %field.826, align 8
  %call.83 = call { ptr, ptr } %.field.ld.78(ptr nest undef, ptr %.field.ld.79)
  ret { ptr, ptr } %call.83
}

define { ptr, ptr } @go_0llvm.ScrubWriter.RemoteAddr..stub(ptr nest nocapture readnone %nest.24, ptr readonly %"$this258.pointer") #0 {
entry:
  %tmpv.585 = alloca %ScrubWriter.0, align 8, !go_addrtaken !3
  %call.86 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d)
  %icmp.230 = icmp eq ptr %"$this258.pointer", null
  br i1 %icmp.230, label %then.238, label %else.238, !make.implicit !3

then.238:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.238:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.585, ptr noundef nonnull align 8 dereferenceable(24) %"$this258.pointer", i64 24, i1 false)
  %deref.ld.19 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.231 = icmp eq i32 %deref.ld.19, 0
  br i1 %icmp.231, label %then.239, label %else.239

then.239:                                         ; preds = %else.238
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.86, ptr noundef nonnull align 8 dereferenceable(24) %"$this258.pointer", i64 24, i1 false)
  br label %else.241

else.239:                                         ; preds = %else.238
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d, ptr nonnull %call.86, ptr nonnull %tmpv.585)
  br label %else.241

else.241:                                         ; preds = %else.239, %then.239
  %.field.ld.80 = load ptr, ptr %call.86, align 8
  %field.829 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.80, i64 0, i32 4
  %.field.ld.81 = load ptr, ptr %field.829, align 8
  %field.830 = getelementptr inbounds i8, ptr %call.86, i64 8
  %.field.ld.82 = load ptr, ptr %field.830, align 8
  %call.85 = call { ptr, ptr } %.field.ld.81(ptr nest undef, ptr %.field.ld.82)
  ret { ptr, ptr } %call.85
}

define { ptr, ptr } @go_0llvm.ScrubWriter.TsigStatus..stub(ptr nest nocapture readnone %nest.25, ptr readonly %"$this259.pointer") #0 {
entry:
  %tmpv.592 = alloca %ScrubWriter.0, align 8, !go_addrtaken !3
  %call.88 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d)
  %icmp.234 = icmp eq ptr %"$this259.pointer", null
  br i1 %icmp.234, label %then.242, label %else.242, !make.implicit !3

then.242:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.242:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.592, ptr noundef nonnull align 8 dereferenceable(24) %"$this259.pointer", i64 24, i1 false)
  %deref.ld.20 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.235 = icmp eq i32 %deref.ld.20, 0
  br i1 %icmp.235, label %then.243, label %else.243

then.243:                                         ; preds = %else.242
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.88, ptr noundef nonnull align 8 dereferenceable(24) %"$this259.pointer", i64 24, i1 false)
  br label %else.245

else.243:                                         ; preds = %else.242
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d, ptr nonnull %call.88, ptr nonnull %tmpv.592)
  br label %else.245

else.245:                                         ; preds = %else.243, %then.243
  %.field.ld.83 = load ptr, ptr %call.88, align 8
  %field.833 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.83, i64 0, i32 5
  %.field.ld.84 = load ptr, ptr %field.833, align 8
  %field.834 = getelementptr inbounds i8, ptr %call.88, i64 8
  %.field.ld.85 = load ptr, ptr %field.834, align 8
  %call.87 = call { ptr, ptr } %.field.ld.84(ptr nest undef, ptr %.field.ld.85)
  ret { ptr, ptr } %call.87
}

define void @go_0llvm.ScrubWriter.TsigTimersOnly..stub(ptr nest nocapture readnone %nest.26, ptr readonly %"$this260.pointer", i8 zeroext %"$p261") #0 {
entry:
  %tmpv.598 = alloca %ScrubWriter.0, align 8, !go_addrtaken !3
  %call.89 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d)
  %icmp.238 = icmp eq ptr %"$this260.pointer", null
  br i1 %icmp.238, label %then.246, label %else.246, !make.implicit !3

then.246:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.246:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.598, ptr noundef nonnull align 8 dereferenceable(24) %"$this260.pointer", i64 24, i1 false)
  %deref.ld.21 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.239 = icmp eq i32 %deref.ld.21, 0
  br i1 %icmp.239, label %then.247, label %else.247

then.247:                                         ; preds = %else.246
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.89, ptr noundef nonnull align 8 dereferenceable(24) %"$this260.pointer", i64 24, i1 false)
  br label %else.249

else.247:                                         ; preds = %else.246
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d, ptr nonnull %call.89, ptr nonnull %tmpv.598)
  br label %else.249

else.249:                                         ; preds = %else.247, %then.247
  %.field.ld.86 = load ptr, ptr %call.89, align 8
  %field.837 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.86, i64 0, i32 6
  %.field.ld.87 = load ptr, ptr %field.837, align 8
  %field.838 = getelementptr inbounds i8, ptr %call.89, i64 8
  %.field.ld.88 = load ptr, ptr %field.838, align 8
  call void %.field.ld.87(ptr nest undef, ptr %.field.ld.88, i8 zeroext %"$p261")
  ret void
}

define void @go_0llvm.ScrubWriter.Write..stub(ptr nocapture writeonly sret({ i64, %error.0 }) %sret.formal.7, ptr nest nocapture readnone %nest.27, ptr readonly %"$this262.pointer", ptr byval({ ptr, i64, i64 }) %"$p263") #0 {
entry:
  %sret.actual.104 = alloca { i64, %error.0 }, align 8
  %tmpv.609 = alloca %ScrubWriter.0, align 8, !go_addrtaken !3
  %call.90 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d)
  %icmp.242 = icmp eq ptr %"$this262.pointer", null
  br i1 %icmp.242, label %then.250, label %else.250, !make.implicit !3

then.250:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.250:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.609, ptr noundef nonnull align 8 dereferenceable(24) %"$this262.pointer", i64 24, i1 false)
  %deref.ld.22 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.243 = icmp eq i32 %deref.ld.22, 0
  br i1 %icmp.243, label %then.251, label %else.251

then.251:                                         ; preds = %else.250
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.90, ptr noundef nonnull align 8 dereferenceable(24) %"$this262.pointer", i64 24, i1 false)
  br label %fallthrough.251

fallthrough.251:                                  ; preds = %else.251, %then.251
  %.field.ld.89 = load ptr, ptr %call.90, align 8
  %field.841 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.89, i64 0, i32 7
  %.field.ld.90 = load ptr, ptr %field.841, align 8
  %field.842 = getelementptr inbounds i8, ptr %call.90, i64 8
  %.field.ld.91 = load ptr, ptr %field.842, align 8
  call void %.field.ld.90(ptr nonnull %sret.actual.104, ptr nest undef, ptr %.field.ld.91, ptr nonnull byval({ ptr, i64, i64 }) %"$p263")
  %tmpv.600.sroa.0.0.copyload = load i64, ptr %sret.actual.104, align 8
  %tmpv.600.sroa.2.0.cast.2746.sroa_idx = getelementptr inbounds { i64, %error.0 }, ptr %sret.actual.104, i64 0, i32 1
  %tmp.35.sroa.2.0.cast.2755.sroa_idx = getelementptr inbounds { i64, %error.0 }, ptr %sret.formal.7, i64 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %tmp.35.sroa.2.0.cast.2755.sroa_idx, ptr noundef nonnull align 8 dereferenceable(16) %tmpv.600.sroa.2.0.cast.2746.sroa_idx, i64 16, i1 false)
  store i64 %tmpv.600.sroa.0.0.copyload, ptr %sret.formal.7, align 8
  ret void

else.251:                                         ; preds = %else.250
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d, ptr nonnull %call.90, ptr nonnull %tmpv.609)
  br label %fallthrough.251
}

define { ptr, ptr } @go_0llvm.ScrubWriter.WriteMsg..stub(ptr nest nocapture readnone %nest.28, ptr readonly %"$this264.pointer", ptr %"$p265") #0 {
entry:
  %tmpv.616 = alloca %ScrubWriter.0, align 8, !go_addrtaken !3
  %call.92 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d)
  %icmp.246 = icmp eq ptr %"$this264.pointer", null
  br i1 %icmp.246, label %then.254, label %else.254, !make.implicit !3

then.254:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.254:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.616, ptr noundef nonnull align 8 dereferenceable(24) %"$this264.pointer", i64 24, i1 false)
  %deref.ld.23 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.247 = icmp eq i32 %deref.ld.23, 0
  br i1 %icmp.247, label %then.255, label %else.255

then.255:                                         ; preds = %else.254
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.92, ptr noundef nonnull align 8 dereferenceable(24) %"$this264.pointer", i64 24, i1 false)
  br label %else.257

else.255:                                         ; preds = %else.254
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d, ptr nonnull %call.92, ptr nonnull %tmpv.616)
  br label %else.257

else.257:                                         ; preds = %else.255, %then.255
  %.field.ld.92 = load ptr, ptr %call.92, align 8
  %field.849 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.92, i64 0, i32 8
  %.field.ld.93 = load ptr, ptr %field.849, align 8
  %field.850 = getelementptr inbounds i8, ptr %call.92, i64 8
  %.field.ld.94 = load ptr, ptr %field.850, align 8
  %call.91 = call { ptr, ptr } %.field.ld.93(ptr nest undef, ptr %.field.ld.94, ptr %"$p265")
  ret { ptr, ptr } %call.91
}

define void @go_0llvm.supported.Lock..stub(ptr nest nocapture readnone %nest.31, ptr %"$this268") #0 {
entry:
  %icmp.250 = icmp eq ptr %"$this268", null
  br i1 %icmp.250, label %then.260, label %else.260, !make.implicit !3

then.260:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.260:                                         ; preds = %entry
  %field.853 = getelementptr inbounds %.go.llvm.supported.0, ptr %"$this268", i64 0, i32 1
  call void @sync.RWMutex.Lock(ptr nest undef, ptr nonnull %field.853)
  ret void
}

define void @go_0llvm.supported.RLock..stub(ptr nest nocapture readnone %nest.34, ptr %"$this272") #0 {
entry:
  %icmp.253 = icmp eq ptr %"$this272", null
  br i1 %icmp.253, label %then.263, label %else.263, !make.implicit !3

then.263:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.263:                                         ; preds = %entry
  %field.856 = getelementptr inbounds %.go.llvm.supported.0, ptr %"$this272", i64 0, i32 1
  call void @sync.RWMutex.RLock(ptr nest undef, ptr nonnull %field.856)
  ret void
}

define { ptr, ptr } @go_0llvm.supported.RLocker..stub(ptr nest nocapture readnone %nest.29, ptr %"$this266") #0 {
entry:
  %icmp.248 = icmp eq ptr %"$this266", null
  br i1 %icmp.248, label %then.258, label %else.258, !make.implicit !3

then.258:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.258:                                         ; preds = %entry
  %field.851 = getelementptr inbounds %.go.llvm.supported.0, ptr %"$this266", i64 0, i32 1
  %ld.124.fca.1.insert.i = insertvalue { ptr, ptr } { ptr @pimt..interface_4Lock_bfunc_8_9_8_9_cUnlock_bfunc_8_9_8_9_5..sync.rlocker, ptr undef }, ptr %field.851, 1
  ret { ptr, ptr } %ld.124.fca.1.insert.i
}

define void @go_0llvm.supported.RUnlock..stub(ptr nest nocapture readnone %nest.33, ptr %"$this271") #0 {
entry:
  %icmp.252 = icmp eq ptr %"$this271", null
  br i1 %icmp.252, label %then.262, label %else.262, !make.implicit !3

then.262:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.262:                                         ; preds = %entry
  %field.855 = getelementptr inbounds %.go.llvm.supported.0, ptr %"$this271", i64 0, i32 1
  call void @sync.RWMutex.RUnlock(ptr nest undef, ptr nonnull %field.855)
  ret void
}

define void @go_0llvm.supported.Unlock..stub(ptr nest nocapture readnone %nest.30, ptr %"$this267") #0 {
entry:
  %icmp.249 = icmp eq ptr %"$this267", null
  br i1 %icmp.249, label %then.259, label %else.259, !make.implicit !3

then.259:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.259:                                         ; preds = %entry
  %field.852 = getelementptr inbounds %.go.llvm.supported.0, ptr %"$this267", i64 0, i32 1
  call void @sync.RWMutex.Unlock(ptr nest undef, ptr nonnull %field.852)
  ret void
}

define void @go_0llvm.supported.sync_0rUnlockSlow..stub(ptr nest nocapture readnone %nest.32, ptr %"$this269", i32 %"$p270") #0 {
entry:
  %icmp.251 = icmp eq ptr %"$this269", null
  br i1 %icmp.251, label %then.261, label %else.261, !make.implicit !3

then.261:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.261:                                         ; preds = %entry
  %field.854 = getelementptr inbounds %.go.llvm.supported.0, ptr %"$this269", i64 0, i32 1
  call void @sync.RWMutex.rUnlockSlow(ptr nest undef, ptr nonnull %field.854, i32 %"$p270")
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
  br i1 %icmp.0, label %fallthrough.568.thread, label %fallthrough.568

fallthrough.568.thread:                           ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %call.1, ptr noundef nonnull align 8 dereferenceable(32) %tmpv.3, i64 32, i1 false)
  br label %else.570

fallthrough.568:                                  ; preds = %entry
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.supported..d, ptr nonnull %call.1, ptr nonnull %tmpv.3)
  %deref.ld.1.pr = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.2 = icmp eq i32 %deref.ld.1.pr, 0
  br i1 %icmp.2, label %else.570, label %else.569

fallthrough.569:                                  ; preds = %else.570, %else.569
  ret void

else.569:                                         ; preds = %fallthrough.568
  %pticast.14 = ptrtoint ptr %call.1 to i64
  call void @runtime.gcWriteBarrier(ptr nest undef, ptr nonnull @go_0llvm.sup, i64 %pticast.14)
  br label %fallthrough.569

else.570:                                         ; preds = %fallthrough.568.thread, %fallthrough.568
  store ptr %call.1, ptr @go_0llvm.sup, align 8
  br label %fallthrough.569
}

declare ptr @runtime.makemap__small(ptr) local_unnamed_addr #0

declare noalias nonnull ptr @runtime.newobject(ptr, ptr) local_unnamed_addr #0

; Function Attrs: cold
declare void @runtime.typedmemmove(ptr, ptr, ptr, ptr) local_unnamed_addr #1

; Function Attrs: noreturn
declare void @runtime.panicmem(ptr) local_unnamed_addr #2

; Function Attrs: cold
declare void @runtime.gcWriteBarrier(ptr, ptr, i64) local_unnamed_addr #1

define void @go_0llvm.Zone.Glue..stub(ptr nocapture writeonly sret(%IPST.0) %sret.formal.8, ptr nest nocapture readnone %nest.39, ptr readonly %"$this278.pointer", ptr byval(%IPST.0) %"$p279", i8 zeroext %"$p280") #0 {
entry:
  %sret.actual.108 = alloca %IPST.0, align 8
  %icmp.258 = icmp eq ptr %"$this278.pointer", null
  br i1 %icmp.258, label %then.268, label %else.268, !make.implicit !3

then.268:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.268:                                         ; preds = %entry
  %"$this278.sroa.3.0.cast.2823.sroa_idx4" = getelementptr inbounds %Zone.0, ptr %"$this278.pointer", i64 0, i32 3
  %"$this278.sroa.3.0.copyload" = load ptr, ptr %"$this278.sroa.3.0.cast.2823.sroa_idx4", align 8
  call void @go_0llvm.Tree.Glue(ptr nonnull %sret.actual.108, ptr nest undef, ptr %"$this278.sroa.3.0.copyload", ptr nonnull byval(%IPST.0) %"$p279", i8 zeroext %"$p280")
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %sret.formal.8, ptr noundef nonnull align 8 dereferenceable(24) %sret.actual.108, i64 24, i1 false)
  ret void
}

declare { ptr, i64 } @go_0llvm.Elem.Name(ptr, ptr) #0

declare void @go_0llvm.Elem.Type(ptr, ptr, ptr, i16) #0

declare void @go_0llvm.Elem.TypeForWildcard(ptr, ptr, ptr, i16, ptr, i64) #0

define { ptr, i8 } @go_0llvm.Zone.Next..stub(ptr nest nocapture readnone %nest.44, ptr readonly %"$this288.pointer", ptr %"$p289.chunk0", i64 %"$p289.chunk1") #0 {
entry:
  %icmp.263 = icmp eq ptr %"$this288.pointer", null
  br i1 %icmp.263, label %then.273, label %else.273, !make.implicit !3

then.273:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.273:                                         ; preds = %entry
  %"$this288.sroa.3.0.cast.2861.sroa_idx4" = getelementptr inbounds %Zone.0, ptr %"$this288.pointer", i64 0, i32 3
  %"$this288.sroa.3.0.copyload" = load ptr, ptr %"$this288.sroa.3.0.cast.2861.sroa_idx4", align 8
  %call.97 = call { ptr, i8 } @go_0llvm.Tree.Next(ptr nest undef, ptr %"$this288.sroa.3.0.copyload", ptr %"$p289.chunk0", i64 %"$p289.chunk1")
  ret { ptr, i8 } %call.97
}

define { ptr, i8 } @go_0llvm.Zone.Prev..stub(ptr nest nocapture readnone %nest.42, ptr readonly %"$this284.pointer", ptr %"$p285.chunk0", i64 %"$p285.chunk1") #0 {
entry:
  %icmp.261 = icmp eq ptr %"$this284.pointer", null
  br i1 %icmp.261, label %then.271, label %else.271, !make.implicit !3

then.271:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.271:                                         ; preds = %entry
  %"$this284.sroa.3.0.cast.2842.sroa_idx4" = getelementptr inbounds %Zone.0, ptr %"$this284.pointer", i64 0, i32 3
  %"$this284.sroa.3.0.copyload" = load ptr, ptr %"$this284.sroa.3.0.cast.2842.sroa_idx4", align 8
  %call.96 = call { ptr, i8 } @go_0llvm.Tree.Prev(ptr nest undef, ptr %"$this284.sroa.3.0.copyload", ptr %"$p285.chunk0", i64 %"$p285.chunk1")
  ret { ptr, i8 } %call.96
}

define { ptr, i8 } @go_0llvm.Zone.Search..stub(ptr nest nocapture readnone %nest.40, ptr readonly %"$this281.pointer", ptr %"$p282.chunk0", i64 %"$p282.chunk1") #0 {
entry:
  %icmp.259 = icmp eq ptr %"$this281.pointer", null
  br i1 %icmp.259, label %then.269, label %else.269, !make.implicit !3

then.269:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.269:                                         ; preds = %entry
  %"$this281.sroa.3.0.cast.2832.sroa_idx4" = getelementptr inbounds %Zone.0, ptr %"$this281.pointer", i64 0, i32 3
  %"$this281.sroa.3.0.copyload" = load ptr, ptr %"$this281.sroa.3.0.cast.2832.sroa_idx4", align 8
  %call.95 = call { ptr, i8 } @go_0llvm.Tree.Search(ptr nest undef, ptr %"$this281.sroa.3.0.copyload", ptr %"$p282.chunk0", i64 %"$p282.chunk1")
  ret { ptr, i8 } %call.95
}

define void @go_0llvm.Zone.ns..stub(ptr nocapture writeonly sret(%IPST.0) %sret.formal.10, ptr nest nocapture readnone %nest.46, ptr readonly %"$this291.pointer", i8 zeroext %"$p292") #0 {
entry:
  %"$this291" = alloca %Zone.0, align 8, !go_addrtaken !3
  %"$ret43" = alloca %IPST.0, align 8
  call void @llvm.lifetime.start.p0(i64 216, ptr nonnull %"$this291")
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %"$ret43")
  %icmp.265 = icmp eq ptr %"$this291.pointer", null
  br i1 %icmp.265, label %then.275, label %else.275, !make.implicit !3

then.275:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.275:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(216) %"$this291", ptr noundef nonnull align 8 dereferenceable(216) %"$this291.pointer", i64 216, i1 false)
  %field.880 = getelementptr inbounds %Zone.0, ptr %"$this291", i64 0, i32 4
  call void @go_0llvm.Apex.ns(ptr nonnull %"$ret43", ptr nest poison, ptr nonnull %field.880, i8 zeroext %"$p292")
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %sret.formal.10, ptr noundef nonnull align 8 dereferenceable(24) %"$ret43", i64 24, i1 false)
  call void @llvm.lifetime.end.p0(i64 216, ptr nonnull %"$this291")
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %"$ret43")
  ret void
}

define void @go_0llvm.Zone.soa..stub(ptr nocapture writeonly sret(%IPST.0) %sret.formal.9, ptr nest nocapture readnone %nest.43, ptr readonly %"$this286.pointer", i8 zeroext %"$p287") #0 {
entry:
  %"$this286" = alloca %Zone.0, align 8, !go_addrtaken !3
  %"$ret40" = alloca %IPST.0, align 8
  call void @llvm.lifetime.start.p0(i64 216, ptr nonnull %"$this286")
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %"$ret40")
  %icmp.262 = icmp eq ptr %"$this286.pointer", null
  br i1 %icmp.262, label %then.272, label %else.272, !make.implicit !3

then.272:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.272:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(216) %"$this286", ptr noundef nonnull align 8 dereferenceable(216) %"$this286.pointer", i64 216, i1 false)
  %field.873 = getelementptr inbounds %Zone.0, ptr %"$this286", i64 0, i32 4
  call void @go_0llvm.Apex.soa(ptr nonnull %"$ret40", ptr nest poison, ptr nonnull %field.873, i8 zeroext %"$p287")
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %sret.formal.9, ptr noundef nonnull align 8 dereferenceable(24) %"$ret40", i64 24, i1 false)
  call void @llvm.lifetime.end.p0(i64 216, ptr nonnull %"$this286")
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %"$ret40")
  ret void
}

declare { ptr, i8 } @go_0llvm.Zone.ClosestEncloser(ptr, ptr, ptr, i64) #0

define void @go_0llvm.Zone.Lock..stub(ptr nest nocapture readnone %nest.37, ptr %"$this275") #0 {
entry:
  %icmp.256 = icmp eq ptr %"$this275", null
  br i1 %icmp.256, label %then.266, label %else.266, !make.implicit !3

then.266:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.266:                                         ; preds = %entry
  %field.859 = getelementptr inbounds %Zone.0, ptr %"$this275", i64 0, i32 6
  call void @sync.RWMutex.Lock(ptr nest undef, ptr nonnull %field.859)
  ret void
}

define void @go_0llvm.Zone.Lookup(ptr writeonly sret({ %IPST.0, %IPST.0, %IPST.0, i64 }) %sret.formal.0, ptr nest nocapture readnone %nest.13, ptr %z, ptr %ctx.chunk0, ptr %ctx.chunk1, ptr nocapture readonly byval(%Request.0) %param, ptr %qname.chunk0, i64 %qname.chunk1) #0 {
entry:
  %tmp.7 = alloca %IPST.0, align 8
  %ap = alloca %Apex.0, align 8, !go_addrtaken !3
  %sret.actual.0 = alloca %IPST.0, align 8
  %sret.actual.1 = alloca %IPST.0, align 8
  %nsrrs = alloca %IPST.0, align 8
  %sret.actual.3 = alloca %IPST.0, align 8
  %tmpv.87 = alloca i64, align 8, !go_addrtaken !3
  %sret.actual.5 = alloca { { ptr, i64 }, i8 }, align 8
  %sret.actual.9 = alloca %IPST.0, align 8
  %extra = alloca %IPST.0, align 8
  %tmpv.118 = alloca [1 x %RR.0], align 8, !go_addrtaken !3
  %sret.actual.11 = alloca %IPST.0, align 8
  %tmpv.126 = alloca [1 x %RR.0], align 8, !go_addrtaken !3
  %sret.actual.13 = alloca { %IPST.0, %IPST.0, %IPST.0, i64 }, align 8
  %sigs = alloca %IPST.0, align 8
  %sret.actual.14 = alloca %IPST.0, align 8
  %sret.actual.15 = alloca %IPST.0, align 8
  %sret.actual.16 = alloca { ptr, i64, i64 }, align 8
  %sret.actual.17 = alloca { ptr, i64, i64 }, align 8
  %nsrrs3 = alloca %IPST.0, align 8
  %sret.actual.18 = alloca %IPST.0, align 8
  %glue4 = alloca %IPST.0, align 8
  %sret.actual.20 = alloca %IPST.0, align 8
  %sret.actual.21 = alloca %IPST.0, align 8
  %sret.actual.22 = alloca { ptr, i64, i64 }, align 8
  %rrs = alloca %IPST.0, align 8
  %additional = alloca %IPST.0, align 8
  %rrs5 = alloca %IPST.0, align 8
  %sret.actual.23 = alloca %IPST.0, align 8
  %sret.actual.25 = alloca { %IPST.0, %IPST.0, %IPST.0, i64 }, align 8
  %sret.actual.26 = alloca %IPST.0, align 8
  %sret.actual.27 = alloca %IPST.0, align 8
  %sret.actual.28 = alloca %IPST.0, align 8
  %sret.actual.29 = alloca { ptr, i64, i64 }, align 8
  %sigs7 = alloca %IPST.0, align 8
  %sret.actual.31 = alloca %IPST.0, align 8
  %sret.actual.32 = alloca %IPST.0, align 8
  %sret.actual.33 = alloca { ptr, i64, i64 }, align 8
  %sret.actual.34 = alloca %IPST.0, align 8
  %tmpv.225 = alloca { ptr, ptr }, align 8, !go_addrtaken !3
  %rrs9 = alloca %IPST.0, align 8
  %sret.actual.35 = alloca %IPST.0, align 8
  %sret.actual.37 = alloca { %IPST.0, %IPST.0, %IPST.0, i64 }, align 8
  %sret.actual.38 = alloca %IPST.0, align 8
  %sret.actual.39 = alloca %IPST.0, align 8
  %sret.actual.40 = alloca %IPST.0, align 8
  %sret.actual.41 = alloca { ptr, i64, i64 }, align 8
  %sret.actual.42 = alloca %IPST.0, align 8
  %sigs12 = alloca %IPST.0, align 8
  %sret.actual.44 = alloca %IPST.0, align 8
  %sret.actual.45 = alloca { ptr, i64, i64 }, align 8
  %sret.actual.46 = alloca %IPST.0, align 8
  %sret.actual.47 = alloca %IPST.0, align 8
  %sret.actual.48 = alloca { ptr, i64, i64 }, align 8
  %sret.actual.51 = alloca %IPST.0, align 8
  %sret.actual.53 = alloca %IPST.0, align 8
  %sret.actual.54 = alloca { ptr, i64, i64 }, align 8
  %tmpv.299 = alloca [2 x { ptr, i64 }], align 8
  %sret.actual.61 = alloca %IPST.0, align 8
  %sret.actual.62 = alloca { ptr, i64, i64 }, align 8
  %tmpv.321 = alloca %Request.0, align 8, !go_addrtaken !3
  %call.57 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.Request..d)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(128) %tmpv.321, ptr noundef nonnull align 8 dereferenceable(128) %param, i64 128, i1 false)
  %deref.ld.12 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.110 = icmp eq i32 %deref.ld.12, 0
  br i1 %icmp.110, label %then.34, label %else.34

then.34:                                          ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(128) %call.57, ptr noundef nonnull align 8 dereferenceable(128) %param, i64 128, i1 false)
  br label %fallthrough.34

fallthrough.34:                                   ; preds = %else.34, %then.34
  call void @llvm.lifetime.start.p0(i64 80, ptr nonnull %ap)
  %call.8 = call i16 @go_0llvm.Request.QType(ptr nest undef, ptr nonnull %call.57)
  %call.9 = call i8 @go_0llvm.Request.Do(ptr nest undef, ptr nonnull %call.57)
  call void @go_0llvm.Zone.RLock..stub(ptr nest poison, ptr %z)
  %icmp.37 = icmp eq ptr %z, null
  br i1 %icmp.37, label %then.35, label %else.35, !make.implicit !3

else.34:                                          ; preds = %entry
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.Request..d, ptr nonnull %call.57, ptr nonnull %tmpv.321)
  br label %fallthrough.34

then.35:                                          ; preds = %fallthrough.34
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.35:                                          ; preds = %fallthrough.34
  %field.64 = getelementptr inbounds %Zone.0, ptr %z, i64 0, i32 4
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(80) %ap, ptr noundef nonnull align 8 dereferenceable(80) %field.64, i64 80, i1 false)
  %field.65 = getelementptr inbounds %Zone.0, ptr %z, i64 0, i32 3
  %.field.ld.9 = load ptr, ptr %field.65, align 8
  %field.867.i = getelementptr inbounds %Zone.0, ptr %z, i64 0, i32 6
  call void @sync.RWMutex.RUnlock(ptr nest undef, ptr nonnull %field.867.i)
  %ap.field.ld.0 = load ptr, ptr %ap, align 8
  %icmp.39 = icmp eq ptr %ap.field.ld.0, null
  br i1 %icmp.39, label %then.37, label %else.38

common.ret:                                       ; preds = %label.4, %fallthrough.97, %fallthrough.93, %then.91, %fallthrough.84, %fallthrough.80, %then.78, %fallthrough.69, %fallthrough.61, %then.42, %case.1, %case.0, %then.37
  ret void

then.37:                                          ; preds = %else.35
  %tmp.0.sroa.8.0.cast.1367.sroa_idx1160 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 3
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(72) %sret.formal.0, i8 0, i64 72, i1 false)
  store i64 4, ptr %tmp.0.sroa.8.0.cast.1367.sroa_idx1160, align 8
  call void @llvm.lifetime.end.p0(i64 80, ptr nonnull %ap)
  br label %common.ret

else.38:                                          ; preds = %else.35
  %tmpv.74.sroa.0.0.copyload = load ptr, ptr %z, align 8
  %tmpv.74.sroa.3.0.cast.1372.sroa_idx450 = getelementptr inbounds %Zone.0, ptr %z, i64 0, i32 0, i32 1
  %tmpv.74.sroa.3.0.copyload = load i64, ptr %tmpv.74.sroa.3.0.cast.1372.sroa_idx450, align 8
  %icmp.41 = icmp eq i64 %tmpv.74.sroa.3.0.copyload, %qname.chunk1
  br i1 %icmp.41, label %then.39, label %fallthrough.41

then.39:                                          ; preds = %else.38
  %icmp.42 = icmp eq ptr %tmpv.74.sroa.0.0.copyload, %qname.chunk0
  br i1 %icmp.42, label %then.41, label %fallthrough.39

fallthrough.39:                                   ; preds = %then.39
  %bcmp2 = call i32 @bcmp(ptr %qname.chunk0, ptr %tmpv.74.sroa.0.0.copyload, i64 %qname.chunk1)
  %icmp.43.not = icmp eq i32 %bcmp2, 0
  br i1 %icmp.43.not, label %then.41, label %fallthrough.41

then.41:                                          ; preds = %then.39, %fallthrough.39
  switch i16 %call.8, label %fallthrough.41 [
    i16 6, label %case.0
    i16 2, label %case.1
  ]

fallthrough.41:                                   ; preds = %else.38, %then.41, %fallthrough.39
  %call.11 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.Elem..p)
  %field.88 = getelementptr inbounds i8, ptr %ctx.chunk0, i64 32
  %.field.ld.10 = load ptr, ptr %field.88, align 8
  %call.12 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.LoopKey..d)
  %call.13 = call { ptr, ptr } %.field.ld.10(ptr nest undef, ptr %ctx.chunk1, ptr nonnull @go_0llvm.LoopKey..d, ptr nonnull %call.12)
  %call.13.fca.0.extract = extractvalue { ptr, ptr } %call.13, 0
  %call.13.fca.1.extract = extractvalue { ptr, ptr } %call.13, 1
  %call.14 = call i8 @runtime.ifaceE2T2(ptr nest undef, ptr nonnull @int..d, ptr %call.13.fca.0.extract, ptr %call.13.fca.1.extract, ptr nonnull %tmpv.87)
  %tmpv.87.ld.0 = load i64, ptr %tmpv.87, align 8
  %icmp.45 = icmp sgt i64 %tmpv.87.ld.0, 8
  br i1 %icmp.45, label %then.42, label %label.1.preheader

label.1.preheader:                                ; preds = %fallthrough.41
  %tmpv.95.sroa.0.sroa.2.0.tmpv.95.sroa.0.0.cast.1447.sroa_cast.sroa_idx627 = getelementptr inbounds { { ptr, i64 }, i8 }, ptr %sret.actual.5, i64 0, i32 0, i32 1
  %tmpv.95.sroa.2.0.cast.1447.sroa_idx = getelementptr inbounds { { ptr, i64 }, i8 }, ptr %sret.actual.5, i64 0, i32 1
  %dnamerrs.sroa.11.0.cast.1471.sroa_idx432 = getelementptr inbounds %IPST.0, ptr %sret.actual.9, i64 0, i32 1
  %dnamerrs.sroa.16.0.cast.1471.sroa_idx437 = getelementptr inbounds %IPST.0, ptr %sret.actual.9, i64 0, i32 2
  %icmp.65 = icmp eq i16 %call.8, 43
  call void @go_0llvm.Zone.nameFromRight(ptr nonnull %sret.actual.5, ptr nest undef, ptr nonnull %z, ptr %qname.chunk0, i64 %qname.chunk1, i64 0)
  %tmpv.95.sroa.2.0.copyload1516 = load i8, ptr %tmpv.95.sroa.2.0.cast.1447.sroa_idx, align 8
  %0 = and i8 %tmpv.95.sroa.2.0.copyload1516, 1
  %trunc.45.not1517 = icmp eq i8 %0, 0
  br i1 %trunc.45.not1517, label %else.43.preheader, label %else.74

else.43.preheader:                                ; preds = %label.1.preheader
  %tmpv.95.sroa.0.sroa.2.0.copyload1515 = load i64, ptr %tmpv.95.sroa.0.sroa.2.0.tmpv.95.sroa.0.0.cast.1447.sroa_cast.sroa_idx627, align 8
  br label %else.43

case.0:                                           ; preds = %then.41
  call void @go_0llvm.Apex.soa(ptr nonnull %sret.actual.0, ptr nest poison, ptr nonnull %ap, i8 zeroext %call.9)
  %tmpv.76.sroa.0.0.copyload = load ptr, ptr %sret.actual.0, align 8
  %tmpv.76.sroa.2.0.cast.1374.sroa_idx1128 = getelementptr inbounds %IPST.0, ptr %sret.actual.0, i64 0, i32 1
  %tmpv.76.sroa.2.0.copyload = load i64, ptr %tmpv.76.sroa.2.0.cast.1374.sroa_idx1128, align 8
  %tmpv.76.sroa.3.0.cast.1374.sroa_idx1129 = getelementptr inbounds %IPST.0, ptr %sret.actual.0, i64 0, i32 2
  %tmpv.76.sroa.3.0.copyload = load i64, ptr %tmpv.76.sroa.3.0.cast.1374.sroa_idx1129, align 8
  call void @go_0llvm.Apex.ns(ptr nonnull %sret.actual.1, ptr nest poison, ptr nonnull %ap, i8 zeroext %call.9)
  %tmpv.77.sroa.0.0.copyload = load ptr, ptr %sret.actual.1, align 8
  %tmpv.77.sroa.2.0.cast.1376.sroa_idx938 = getelementptr inbounds %IPST.0, ptr %sret.actual.1, i64 0, i32 1
  %tmpv.77.sroa.2.0.copyload = load i64, ptr %tmpv.77.sroa.2.0.cast.1376.sroa_idx938, align 8
  %tmpv.77.sroa.3.0.cast.1376.sroa_idx939 = getelementptr inbounds %IPST.0, ptr %sret.actual.1, i64 0, i32 2
  %tmpv.77.sroa.3.0.copyload = load i64, ptr %tmpv.77.sroa.3.0.cast.1376.sroa_idx939, align 8
  %tmp.1.sroa.7.0.cast.1390.sroa_idx = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 2
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmp.1.sroa.7.0.cast.1390.sroa_idx, i8 0, i64 24, i1 false)
  store ptr %tmpv.76.sroa.0.0.copyload, ptr %sret.formal.0, align 8
  %tmp.1.sroa.2.0.cast.1390.sroa_idx1176 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 0, i32 1
  store i64 %tmpv.76.sroa.2.0.copyload, ptr %tmp.1.sroa.2.0.cast.1390.sroa_idx1176, align 8
  %tmp.1.sroa.3.0.cast.1390.sroa_idx1177 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 0, i32 2
  store i64 %tmpv.76.sroa.3.0.copyload, ptr %tmp.1.sroa.3.0.cast.1390.sroa_idx1177, align 8
  %tmp.1.sroa.4.0.cast.1390.sroa_idx1178 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 1, i32 0
  store ptr %tmpv.77.sroa.0.0.copyload, ptr %tmp.1.sroa.4.0.cast.1390.sroa_idx1178, align 8
  %tmp.1.sroa.5.0.cast.1390.sroa_idx1179 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 1, i32 1
  store i64 %tmpv.77.sroa.2.0.copyload, ptr %tmp.1.sroa.5.0.cast.1390.sroa_idx1179, align 8
  %tmp.1.sroa.6.0.cast.1390.sroa_idx1180 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 1, i32 2
  store i64 %tmpv.77.sroa.3.0.copyload, ptr %tmp.1.sroa.6.0.cast.1390.sroa_idx1180, align 8
  %tmp.1.sroa.8.0.cast.1390.sroa_idx1181 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 3
  store i64 0, ptr %tmp.1.sroa.8.0.cast.1390.sroa_idx1181, align 8
  call void @llvm.lifetime.end.p0(i64 80, ptr nonnull %ap)
  br label %common.ret

case.1:                                           ; preds = %then.41
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %nsrrs)
  call void @go_0llvm.Apex.ns(ptr nonnull %nsrrs, ptr nest poison, ptr nonnull %ap, i8 zeroext %call.9)
  call void @go_0llvm.Tree.Glue(ptr nonnull %sret.actual.3, ptr nest undef, ptr %.field.ld.9, ptr nonnull byval(%IPST.0) %nsrrs, i8 zeroext %call.9)
  %tmpv.80.sroa.0.0.copyload = load ptr, ptr %nsrrs, align 8
  %tmpv.80.sroa.2.0.cast.1397.sroa_idx1126 = getelementptr inbounds %IPST.0, ptr %nsrrs, i64 0, i32 1
  %tmpv.80.sroa.2.0.copyload = load i64, ptr %tmpv.80.sroa.2.0.cast.1397.sroa_idx1126, align 8
  %tmpv.80.sroa.3.0.cast.1397.sroa_idx1127 = getelementptr inbounds %IPST.0, ptr %nsrrs, i64 0, i32 2
  %tmpv.80.sroa.3.0.copyload = load i64, ptr %tmpv.80.sroa.3.0.cast.1397.sroa_idx1127, align 8
  %tmp.2.sroa.7.0.cast.1413.sroa_idx = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 2
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmp.2.sroa.7.0.cast.1413.sroa_idx, ptr noundef nonnull align 8 dereferenceable(24) %sret.actual.3, i64 24, i1 false)
  store ptr %tmpv.80.sroa.0.0.copyload, ptr %sret.formal.0, align 8
  %tmp.2.sroa.2.0.cast.1413.sroa_idx1196 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 0, i32 1
  store i64 %tmpv.80.sroa.2.0.copyload, ptr %tmp.2.sroa.2.0.cast.1413.sroa_idx1196, align 8
  %tmp.2.sroa.3.0.cast.1413.sroa_idx1197 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 0, i32 2
  store i64 %tmpv.80.sroa.3.0.copyload, ptr %tmp.2.sroa.3.0.cast.1413.sroa_idx1197, align 8
  %tmp.2.sroa.4.0.cast.1413.sroa_idx1198 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 1, i32 0
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmp.2.sroa.4.0.cast.1413.sroa_idx1198, i8 0, i64 24, i1 false)
  %tmp.2.sroa.8.0.cast.1413.sroa_idx1201 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 3
  store i64 0, ptr %tmp.2.sroa.8.0.cast.1413.sroa_idx1201, align 8
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %nsrrs)
  call void @llvm.lifetime.end.p0(i64 80, ptr nonnull %ap)
  br label %common.ret

then.42:                                          ; preds = %fallthrough.41
  %tmp.4.sroa.8.0.cast.1443.sroa_idx1222 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 3
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(72) %sret.formal.0, i8 0, i64 72, i1 false)
  store i64 4, ptr %tmp.4.sroa.8.0.cast.1443.sroa_idx1222, align 8
  call void @llvm.lifetime.end.p0(i64 80, ptr nonnull %ap)
  br label %common.ret

else.43:                                          ; preds = %label.3, %else.43.preheader
  %tmpv.95.sroa.0.sroa.2.0.copyload1520 = phi i64 [ %tmpv.95.sroa.0.sroa.2.0.copyload, %label.3 ], [ %tmpv.95.sroa.0.sroa.2.0.copyload1515, %else.43.preheader ]
  %i.01518 = phi i64 [ %i.1, %label.3 ], [ 0, %else.43.preheader ]
  %tmpv.95.sroa.0.sroa.0.0.copyload1519 = load ptr, ptr %sret.actual.5, align 8
  %call.15 = call { ptr, i8 } @go_0llvm.Tree.Search(ptr nest undef, ptr %.field.ld.9, ptr %tmpv.95.sroa.0.sroa.0.0.copyload1519, i64 %tmpv.95.sroa.0.sroa.2.0.copyload1520)
  %call.15.fca.0.extract = extractvalue { ptr, i8 } %call.15, 0
  %call.15.fca.1.extract = extractvalue { ptr, i8 } %call.15, 1
  %icmp.48.not = icmp eq i8 %call.15.fca.1.extract, 0
  br i1 %icmp.48.not, label %then.44, label %else.44

then.44:                                          ; preds = %else.43
  %call.16 = call { ptr, i64 } @go_0llvm.replaceWithAsteriskLabel(ptr nest undef, ptr %tmpv.95.sroa.0.sroa.0.0.copyload1519, i64 %tmpv.95.sroa.0.sroa.2.0.copyload1520)
  %call.16.fca.0.extract = extractvalue { ptr, i64 } %call.16, 0
  %call.16.fca.1.extract = extractvalue { ptr, i64 } %call.16, 1
  %call.17 = call { ptr, i8 } @go_0llvm.Tree.Search(ptr nest undef, ptr %.field.ld.9, ptr %call.16.fca.0.extract, i64 %call.16.fca.1.extract)
  %call.17.fca.0.extract = extractvalue { ptr, i8 } %call.17, 0
  %call.17.fca.1.extract = extractvalue { ptr, i8 } %call.17, 1
  %1 = and i8 %call.17.fca.1.extract, 1
  %trunc.48.not = icmp eq i8 %1, 0
  br i1 %trunc.48.not, label %label.3, label %then.45

else.44:                                          ; preds = %else.43
  call void @go_0llvm.Elem.Type(ptr nonnull %sret.actual.9, ptr nest undef, ptr %call.15.fca.0.extract, i16 zeroext 39)
  %dnamerrs.sroa.0.0.copyload = load ptr, ptr %sret.actual.9, align 8
  %dnamerrs.sroa.11.0.copyload = load i64, ptr %dnamerrs.sroa.11.0.cast.1471.sroa_idx432, align 8
  %dnamerrs.sroa.16.0.copyload = load i64, ptr %dnamerrs.sroa.16.0.cast.1471.sroa_idx437, align 8
  %icmp.64.not = icmp eq ptr %dnamerrs.sroa.0.0.copyload, null
  br i1 %icmp.64.not, label %fallthrough.48, label %then.48

then.45:                                          ; preds = %then.44
  %deref.ld.8 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.47 = icmp eq i32 %deref.ld.8, 0
  br i1 %icmp.47, label %else.47, label %else.46

else.46:                                          ; preds = %then.45
  %pticast.17 = ptrtoint ptr %call.17.fca.0.extract to i64
  call void @runtime.gcWriteBarrier(ptr nest undef, ptr nonnull %call.11, i64 %pticast.17)
  br label %label.3

else.47:                                          ; preds = %then.45
  store ptr %call.17.fca.0.extract, ptr %call.11, align 8
  br label %label.3

label.3:                                          ; preds = %then.66, %else.67, %else.64, %else.47, %else.46, %then.44
  %i.1 = add i64 %i.01518, 1
  call void @go_0llvm.Zone.nameFromRight(ptr nonnull %sret.actual.5, ptr nest undef, ptr nonnull %z, ptr %qname.chunk0, i64 %qname.chunk1, i64 %i.1)
  %tmpv.95.sroa.0.sroa.2.0.copyload = load i64, ptr %tmpv.95.sroa.0.sroa.2.0.tmpv.95.sroa.0.0.cast.1447.sroa_cast.sroa_idx627, align 8
  %tmpv.95.sroa.2.0.copyload = load i8, ptr %tmpv.95.sroa.2.0.cast.1447.sroa_idx, align 8
  %2 = and i8 %tmpv.95.sroa.2.0.copyload, 1
  %trunc.45.not = icmp eq i8 %2, 0
  br i1 %trunc.45.not, label %else.43, label %else.74.loopexit

then.48:                                          ; preds = %else.44
  %icmp.50 = icmp sgt i64 %dnamerrs.sroa.11.0.copyload, 0
  br i1 %icmp.50, label %fallthrough.49, label %else.49

fallthrough.48:                                   ; preds = %fallthrough.51, %else.44
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %nsrrs3)
  call void @go_0llvm.Elem.Type(ptr nonnull %sret.actual.18, ptr nest undef, ptr %call.15.fca.0.extract, i16 zeroext 2)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %nsrrs3, ptr noundef nonnull align 8 dereferenceable(24) %sret.actual.18, i64 24, i1 false)
  %nsrrs.field.ld.0 = load ptr, ptr %nsrrs3, align 8
  %icmp.73.not = icmp eq ptr %nsrrs.field.ld.0, null
  br i1 %icmp.73.not, label %else.64, label %then.64

fallthrough.49:                                   ; preds = %then.48
  %dname.sroa.0.0.copyload = load ptr, ptr %dnamerrs.sroa.0.0.copyload, align 8
  %dname.sroa.8.0.cast.1473.sroa_idx426 = getelementptr inbounds %RR.0, ptr %dnamerrs.sroa.0.0.copyload, i64 0, i32 1
  %dname.sroa.8.0.copyload1443 = load ptr, ptr %dname.sroa.8.0.cast.1473.sroa_idx426, align 8
  %call.18 = call { ptr, i64 } @go_0llvm.Request.Name(ptr nest undef, ptr nonnull %call.57)
  %call.18.fca.0.extract = extractvalue { ptr, i64 } %call.18, 0
  %call.18.fca.1.extract = extractvalue { ptr, i64 } %call.18, 1
  %icmp.51 = icmp eq ptr %dname.sroa.0.0.copyload, null
  br i1 %icmp.51, label %fallthrough.52, label %fallthrough.50

else.49:                                          ; preds = %then.48
  call void @runtime.goPanicIndex(ptr nest undef, i64 0, i64 %dnamerrs.sroa.11.0.copyload)
  unreachable

fallthrough.50:                                   ; preds = %fallthrough.49
  %.field.ld.11 = load ptr, ptr %dname.sroa.0.0.copyload, align 8
  %icmp.52 = icmp eq ptr %.field.ld.11, @go_0llvm.DNAME..p
  br i1 %icmp.52, label %fallthrough.51, label %fallthrough.52

fallthrough.51:                                   ; preds = %fallthrough.50
  %call.19 = call ptr @go_0llvm.synthesizeCNAME(ptr nest undef, ptr %call.18.fca.0.extract, i64 %call.18.fca.1.extract, ptr %dname.sroa.8.0.copyload1443)
  %icmp.63.not = icmp eq ptr %call.19, null
  br i1 %icmp.63.not, label %fallthrough.48, label %then.53

fallthrough.52:                                   ; preds = %fallthrough.50, %fallthrough.49
  %tmpv.114.0 = phi ptr [ null, %fallthrough.49 ], [ %.field.ld.11, %fallthrough.50 ]
  call void @runtime.panicdottype(ptr nest undef, ptr nonnull @go_0llvm.DNAME..p, ptr %tmpv.114.0, ptr nonnull @go_0llvm.RR..d)
  unreachable

then.53:                                          ; preds = %fallthrough.51
  %call.15.fca.0.extract.le90 = extractvalue { ptr, i8 } %call.15, 0
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %extra)
  %icmp.56 = icmp eq i16 %call.8, 5
  br i1 %icmp.56, label %then.54, label %else.54

then.54:                                          ; preds = %then.53
  %call.20 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @type.._61x_7go_0llvm_0RR)
  store ptr @pimt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.CNAME, ptr %tmpv.118, align 8
  %tmpv.116.sroa.2.0.cast.1496.sroa_idx395 = getelementptr inbounds [1 x %RR.0], ptr %tmpv.118, i64 0, i64 0, i32 1
  store ptr %call.19, ptr %tmpv.116.sroa.2.0.cast.1496.sroa_idx395, align 8
  %deref.ld.9 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.54 = icmp eq i32 %deref.ld.9, 0
  br i1 %icmp.54, label %then.55, label %else.55

fallthrough.54:                                   ; preds = %fallthrough.56, %fallthrough.55
  %rcode2.0 = phi i64 [ 0, %fallthrough.55 ], [ %tmpv.123.sroa.4.0.copyload, %fallthrough.56 ]
  %3 = phi ptr [ %call.20, %fallthrough.55 ], [ %tmpv.123.sroa.0.sroa.0.0.copyload1452, %fallthrough.56 ]
  %answer.sroa.8.0 = phi i64 [ 1, %fallthrough.55 ], [ %tmpv.123.sroa.0.sroa.2.0.copyload, %fallthrough.56 ]
  %ns.sroa.0.0 = phi ptr [ %tmpv.119.sroa.0.0.copyload, %fallthrough.55 ], [ %tmpv.123.sroa.0.sroa.4.sroa.0.0.copyload, %fallthrough.56 ]
  %ns.sroa.6.0 = phi i64 [ %tmpv.119.sroa.2.0.copyload, %fallthrough.55 ], [ %tmpv.123.sroa.0.sroa.4.sroa.2.0.copyload, %fallthrough.56 ]
  %ns.sroa.7.0 = phi i64 [ %tmpv.119.sroa.3.0.copyload, %fallthrough.55 ], [ %tmpv.123.sroa.0.sroa.4.sroa.3.0.copyload, %fallthrough.56 ]
  %4 = and i8 %call.9, 1
  %trunc.60.not = icmp eq i8 %4, 0
  br i1 %trunc.60.not, label %fallthrough.57, label %then.57

else.54:                                          ; preds = %then.53
  %call.21 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.LoopKey..d)
  %call.22 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @int..d)
  %add.1 = add i64 %tmpv.87.ld.0, 1
  store i64 %add.1, ptr %call.22, align 8
  %call.23 = call { ptr, ptr } @context.WithValue(ptr nest undef, ptr %ctx.chunk0, ptr %ctx.chunk1, ptr nonnull @go_0llvm.LoopKey..d, ptr nonnull %call.21, ptr nonnull @int..d, ptr nonnull %call.22)
  %call.23.fca.0.extract = extractvalue { ptr, ptr } %call.23, 0
  %call.23.fca.1.extract = extractvalue { ptr, ptr } %call.23, 1
  %call.24 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @type.._61x_7go_0llvm_0RR)
  store ptr @pimt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.CNAME, ptr %tmpv.126, align 8
  %tmpv.124.sroa.2.0.cast.1529.sroa_idx390 = getelementptr inbounds [1 x %RR.0], ptr %tmpv.126, i64 0, i64 0, i32 1
  store ptr %call.19, ptr %tmpv.124.sroa.2.0.cast.1529.sroa_idx390, align 8
  %deref.ld.10 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.55 = icmp eq i32 %deref.ld.10, 0
  br i1 %icmp.55, label %then.56, label %else.56

then.55:                                          ; preds = %then.54
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %call.20, ptr noundef nonnull align 8 dereferenceable(16) %tmpv.118, i64 16, i1 false)
  br label %fallthrough.55

fallthrough.55:                                   ; preds = %else.55, %then.55
  call void @go_0llvm.Apex.ns(ptr nonnull %sret.actual.11, ptr nest poison, ptr nonnull %ap, i8 zeroext %call.9)
  %tmpv.119.sroa.0.0.copyload = load ptr, ptr %sret.actual.11, align 8
  %tmpv.119.sroa.2.0.cast.1507.sroa_idx936 = getelementptr inbounds %IPST.0, ptr %sret.actual.11, i64 0, i32 1
  %tmpv.119.sroa.2.0.copyload = load i64, ptr %tmpv.119.sroa.2.0.cast.1507.sroa_idx936, align 8
  %tmpv.119.sroa.3.0.cast.1507.sroa_idx937 = getelementptr inbounds %IPST.0, ptr %sret.actual.11, i64 0, i32 2
  %tmpv.119.sroa.3.0.copyload = load i64, ptr %tmpv.119.sroa.3.0.cast.1507.sroa_idx937, align 8
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %extra, i8 0, i64 24, i1 false)
  br label %fallthrough.54

else.55:                                          ; preds = %then.54
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @type.._61x_7go_0llvm_0RR, ptr nonnull %call.20, ptr nonnull %tmpv.118)
  br label %fallthrough.55

then.56:                                          ; preds = %else.54
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %call.24, ptr noundef nonnull align 8 dereferenceable(16) %tmpv.126, i64 16, i1 false)
  br label %fallthrough.56

fallthrough.56:                                   ; preds = %else.56, %then.56
  store ptr %call.24, ptr %tmp.7, align 8
  %field.124 = getelementptr inbounds %IPST.0, ptr %tmp.7, i64 0, i32 1
  store i64 1, ptr %field.124, align 8
  %field.125 = getelementptr inbounds %IPST.0, ptr %tmp.7, i64 0, i32 2
  store i64 1, ptr %field.125, align 8
  call void @go_0llvm.Zone.externalLookup(ptr nonnull %sret.actual.13, ptr nest poison, ptr nonnull %z, ptr %call.23.fca.0.extract, ptr %call.23.fca.1.extract, ptr nonnull byval(%Request.0) %call.57, ptr %call.15.fca.0.extract.le90, ptr nonnull byval(%IPST.0) %tmp.7)
  %tmpv.123.sroa.0.sroa.0.0.copyload1452 = load ptr, ptr %sret.actual.13, align 8
  %tmpv.123.sroa.0.sroa.2.0.tmpv.123.sroa.0.0.cast.1541.sroa_cast.sroa_idx418 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.actual.13, i64 0, i32 0, i32 1
  %tmpv.123.sroa.0.sroa.2.0.copyload = load i64, ptr %tmpv.123.sroa.0.sroa.2.0.tmpv.123.sroa.0.0.cast.1541.sroa_cast.sroa_idx418, align 8
  %tmpv.123.sroa.0.sroa.4.sroa.0.0.tmpv.123.sroa.0.sroa.4.0.tmpv.123.sroa.0.0.cast.1541.sroa_cast.sroa_cast.sroa_idx = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.actual.13, i64 0, i32 1, i32 0
  %tmpv.123.sroa.0.sroa.4.sroa.0.0.copyload = load ptr, ptr %tmpv.123.sroa.0.sroa.4.sroa.0.0.tmpv.123.sroa.0.sroa.4.0.tmpv.123.sroa.0.0.cast.1541.sroa_cast.sroa_cast.sroa_idx, align 8
  %tmpv.123.sroa.0.sroa.4.sroa.2.0.tmpv.123.sroa.0.sroa.4.0.tmpv.123.sroa.0.0.cast.1541.sroa_cast.sroa_cast.sroa_idx934 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.actual.13, i64 0, i32 1, i32 1
  %tmpv.123.sroa.0.sroa.4.sroa.2.0.copyload = load i64, ptr %tmpv.123.sroa.0.sroa.4.sroa.2.0.tmpv.123.sroa.0.sroa.4.0.tmpv.123.sroa.0.0.cast.1541.sroa_cast.sroa_cast.sroa_idx934, align 8
  %tmpv.123.sroa.0.sroa.4.sroa.3.0.tmpv.123.sroa.0.sroa.4.0.tmpv.123.sroa.0.0.cast.1541.sroa_cast.sroa_cast.sroa_idx935 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.actual.13, i64 0, i32 1, i32 2
  %tmpv.123.sroa.0.sroa.4.sroa.3.0.copyload = load i64, ptr %tmpv.123.sroa.0.sroa.4.sroa.3.0.tmpv.123.sroa.0.sroa.4.0.tmpv.123.sroa.0.0.cast.1541.sroa_cast.sroa_cast.sroa_idx935, align 8
  %tmpv.123.sroa.0.sroa.5.0.tmpv.123.sroa.0.0.cast.1541.sroa_cast.sroa_idx = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.actual.13, i64 0, i32 2
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %extra, ptr noundef nonnull align 8 dereferenceable(24) %tmpv.123.sroa.0.sroa.5.0.tmpv.123.sroa.0.0.cast.1541.sroa_cast.sroa_idx, i64 24, i1 false)
  %tmpv.123.sroa.4.0.cast.1541.sroa_idx392 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.actual.13, i64 0, i32 3
  %tmpv.123.sroa.4.0.copyload = load i64, ptr %tmpv.123.sroa.4.0.cast.1541.sroa_idx392, align 8
  br label %fallthrough.54

else.56:                                          ; preds = %else.54
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @type.._61x_7go_0llvm_0RR, ptr nonnull %call.24, ptr nonnull %tmpv.126)
  br label %fallthrough.56

then.57:                                          ; preds = %fallthrough.54
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %sigs)
  call void @go_0llvm.Elem.Type(ptr nonnull %sret.actual.14, ptr nest undef, ptr %call.15.fca.0.extract.le90, i16 zeroext 46)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %sigs, ptr noundef nonnull align 8 dereferenceable(24) %sret.actual.14, i64 24, i1 false)
  call void @go_0llvm.SubTypeSignature(ptr nonnull %sret.actual.15, ptr nest undef, ptr nonnull byval(%IPST.0) %sigs, i16 zeroext 39)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %sigs, ptr noundef nonnull align 8 dereferenceable(24) %sret.actual.15, i64 24, i1 false)
  %tmpv.138.sroa.0.0.copyload1444 = load ptr, ptr %sigs, align 8
  %tmpv.138.sroa.2.0.cast.1569.sroa_idx372 = getelementptr inbounds %IPST.0, ptr %sigs, i64 0, i32 1
  %tmpv.138.sroa.2.0.copyload = load i64, ptr %tmpv.138.sroa.2.0.cast.1569.sroa_idx372, align 8
  %add.2 = add i64 %tmpv.138.sroa.2.0.copyload, %dnamerrs.sroa.11.0.copyload
  %icmp.58 = icmp ugt i64 %add.2, %dnamerrs.sroa.16.0.copyload
  br i1 %icmp.58, label %then.58, label %fallthrough.58

fallthrough.57:                                   ; preds = %fallthrough.58, %fallthrough.54
  %dnamerrs.sroa.0.0 = phi ptr [ %dnamerrs.sroa.0.1, %fallthrough.58 ], [ %dnamerrs.sroa.0.0.copyload, %fallthrough.54 ]
  %dnamerrs.sroa.11.0 = phi i64 [ %dnamerrs.sroa.11.1, %fallthrough.58 ], [ %dnamerrs.sroa.11.0.copyload, %fallthrough.54 ]
  %dnamerrs.sroa.16.0 = phi i64 [ %dnamerrs.sroa.16.1, %fallthrough.58 ], [ %dnamerrs.sroa.16.0.copyload, %fallthrough.54 ]
  %add.3 = add i64 %dnamerrs.sroa.11.0, %answer.sroa.8.0
  %icmp.60 = icmp ugt i64 %add.3, %dnamerrs.sroa.16.0
  br i1 %icmp.60, label %then.61, label %fallthrough.61

then.58:                                          ; preds = %then.57
  call void @runtime.growslice(ptr nonnull %sret.actual.16, ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr nonnull %dnamerrs.sroa.0.0.copyload, i64 %dnamerrs.sroa.11.0.copyload, i64 %dnamerrs.sroa.16.0.copyload, i64 %add.2)
  %dnamerrs.sroa.0.0.copyload429 = load ptr, ptr %sret.actual.16, align 8
  %5 = getelementptr inbounds { ptr, i64, i64 }, ptr %sret.actual.16, i64 0, i32 1
  %dnamerrs.sroa.11.0.copyload434 = load i64, ptr %5, align 8
  %6 = getelementptr inbounds { ptr, i64, i64 }, ptr %sret.actual.16, i64 0, i32 2
  %dnamerrs.sroa.16.0.copyload439 = load i64, ptr %6, align 8
  br label %fallthrough.58

fallthrough.58:                                   ; preds = %then.58, %then.57
  %dnamerrs.sroa.0.1 = phi ptr [ %dnamerrs.sroa.0.0.copyload429, %then.58 ], [ %dnamerrs.sroa.0.0.copyload, %then.57 ]
  %dnamerrs.sroa.11.1 = phi i64 [ %dnamerrs.sroa.11.0.copyload434, %then.58 ], [ %add.2, %then.57 ]
  %dnamerrs.sroa.16.1 = phi i64 [ %dnamerrs.sroa.16.0.copyload439, %then.58 ], [ %dnamerrs.sroa.16.0.copyload, %then.57 ]
  %icmp.59 = icmp eq i64 %dnamerrs.sroa.16.1, %dnamerrs.sroa.11.0.copyload
  %.dnamerrs.sroa.11.0.copyload = select i1 %icmp.59, i64 0, i64 %dnamerrs.sroa.11.0.copyload
  %ptroff.2 = getelementptr %RR.0, ptr %dnamerrs.sroa.0.1, i64 %.dnamerrs.sroa.11.0.copyload
  %sub.4 = sub i64 %dnamerrs.sroa.11.1, %dnamerrs.sroa.11.0.copyload
  %call.25 = call i64 @runtime.typedslicecopy(ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %ptroff.2, i64 %sub.4, ptr %tmpv.138.sroa.0.0.copyload1444, i64 %tmpv.138.sroa.2.0.copyload)
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %sigs)
  br label %fallthrough.57

then.61:                                          ; preds = %fallthrough.57
  call void @runtime.growslice(ptr nonnull %sret.actual.17, ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %dnamerrs.sroa.0.0, i64 %dnamerrs.sroa.11.0, i64 %dnamerrs.sroa.16.0, i64 %add.3)
  %tmpv.152.sroa.0.0.copyload = load ptr, ptr %sret.actual.17, align 8
  %7 = getelementptr inbounds { ptr, i64, i64 }, ptr %sret.actual.17, i64 0, i32 1
  %tmpv.152.sroa.3.0.copyload = load i64, ptr %7, align 8
  %8 = getelementptr inbounds { ptr, i64, i64 }, ptr %sret.actual.17, i64 0, i32 2
  %tmpv.152.sroa.4.0.copyload = load i64, ptr %8, align 8
  br label %fallthrough.61

fallthrough.61:                                   ; preds = %then.61, %fallthrough.57
  %tmpv.152.sroa.0.0 = phi ptr [ %tmpv.152.sroa.0.0.copyload, %then.61 ], [ %dnamerrs.sroa.0.0, %fallthrough.57 ]
  %tmpv.152.sroa.3.0 = phi i64 [ %tmpv.152.sroa.3.0.copyload, %then.61 ], [ %add.3, %fallthrough.57 ]
  %tmpv.152.sroa.4.0 = phi i64 [ %tmpv.152.sroa.4.0.copyload, %then.61 ], [ %dnamerrs.sroa.16.0, %fallthrough.57 ]
  %icmp.62 = icmp eq i64 %tmpv.152.sroa.4.0, %dnamerrs.sroa.11.0
  %.dnamerrs.sroa.11.0 = select i1 %icmp.62, i64 0, i64 %dnamerrs.sroa.11.0
  %ptroff.4 = getelementptr %RR.0, ptr %tmpv.152.sroa.0.0, i64 %.dnamerrs.sroa.11.0
  %sub.10 = sub i64 %tmpv.152.sroa.3.0, %dnamerrs.sroa.11.0
  %call.26 = call i64 @runtime.typedslicecopy(ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %ptroff.4, i64 %sub.10, ptr %3, i64 %answer.sroa.8.0)
  %tmp.9.sroa.7.0.cast.1616.sroa_idx = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 2
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmp.9.sroa.7.0.cast.1616.sroa_idx, ptr noundef nonnull align 8 dereferenceable(24) %extra, i64 24, i1 false)
  store ptr %tmpv.152.sroa.0.0, ptr %sret.formal.0, align 8
  %tmp.9.sroa.2.0.cast.1616.sroa_idx1237 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 0, i32 1
  store i64 %tmpv.152.sroa.3.0, ptr %tmp.9.sroa.2.0.cast.1616.sroa_idx1237, align 8
  %tmp.9.sroa.3.0.cast.1616.sroa_idx1238 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 0, i32 2
  store i64 %tmpv.152.sroa.4.0, ptr %tmp.9.sroa.3.0.cast.1616.sroa_idx1238, align 8
  %tmp.9.sroa.4.0.cast.1616.sroa_idx1239 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 1, i32 0
  store ptr %ns.sroa.0.0, ptr %tmp.9.sroa.4.0.cast.1616.sroa_idx1239, align 8
  %tmp.9.sroa.5.0.cast.1616.sroa_idx1240 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 1, i32 1
  store i64 %ns.sroa.6.0, ptr %tmp.9.sroa.5.0.cast.1616.sroa_idx1240, align 8
  %tmp.9.sroa.6.0.cast.1616.sroa_idx1241 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 1, i32 2
  store i64 %ns.sroa.7.0, ptr %tmp.9.sroa.6.0.cast.1616.sroa_idx1241, align 8
  %tmp.9.sroa.8.0.cast.1616.sroa_idx1242 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 3
  store i64 %rcode2.0, ptr %tmp.9.sroa.8.0.cast.1616.sroa_idx1242, align 8
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %extra)
  call void @llvm.lifetime.end.p0(i64 80, ptr nonnull %ap)
  br label %common.ret

then.64:                                          ; preds = %fallthrough.48
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %glue4)
  br i1 %icmp.65, label %then.65, label %else.68

else.64:                                          ; preds = %fallthrough.48
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %nsrrs3)
  br label %label.3

then.65:                                          ; preds = %then.64
  %call.27 = call { ptr, i64 } @go_0llvm.Elem.Name(ptr nest undef, ptr %call.15.fca.0.extract)
  %call.27.fca.0.extract = extractvalue { ptr, i64 } %call.27, 0
  %call.27.fca.1.extract = extractvalue { ptr, i64 } %call.27, 1
  %icmp.66 = icmp eq i64 %call.27.fca.1.extract, %qname.chunk1
  br i1 %icmp.66, label %then.66, label %else.68

then.66:                                          ; preds = %then.65
  %icmp.67 = icmp eq ptr %call.27.fca.0.extract, %qname.chunk0
  br i1 %icmp.67, label %label.3, label %else.67

else.67:                                          ; preds = %then.66
  %bcmp1 = call i32 @bcmp(ptr %call.27.fca.0.extract, ptr %qname.chunk0, i64 %qname.chunk1)
  %icmp.68 = icmp eq i32 %bcmp1, 0
  br i1 %icmp.68, label %label.3, label %else.68

else.68:                                          ; preds = %then.65, %then.64, %else.67
  call void @go_0llvm.Tree.Glue(ptr nonnull %sret.actual.20, ptr nest undef, ptr %.field.ld.9, ptr nonnull byval(%IPST.0) %nsrrs3, i8 zeroext %call.9)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %glue4, ptr noundef nonnull align 8 dereferenceable(24) %sret.actual.20, i64 24, i1 false)
  %9 = and i8 %call.9, 1
  %trunc.73.not = icmp eq i8 %9, 0
  br i1 %trunc.73.not, label %fallthrough.69, label %then.69

then.69:                                          ; preds = %else.68
  %call.15.fca.0.extract.le88 = extractvalue { ptr, i8 } %call.15, 0
  call fastcc void @go_0llvm.typeFromElem(ptr nonnull %sret.actual.21, ptr %call.15.fca.0.extract.le88, i16 zeroext 43, i8 zeroext %call.9)
  %dss.sroa.0.0.copyload1442 = load ptr, ptr %sret.actual.21, align 8
  %dss.sroa.4.0.cast.1628.sroa_idx329 = getelementptr inbounds %IPST.0, ptr %sret.actual.21, i64 0, i32 1
  %dss.sroa.4.0.copyload = load i64, ptr %dss.sroa.4.0.cast.1628.sroa_idx329, align 8
  %tmpv.163.sroa.5.0.cast.1630.sroa_idx318 = getelementptr inbounds %IPST.0, ptr %nsrrs3, i64 0, i32 1
  %tmpv.163.sroa.5.0.copyload = load i64, ptr %tmpv.163.sroa.5.0.cast.1630.sroa_idx318, align 8
  %tmpv.163.sroa.7.0.cast.1630.sroa_idx321 = getelementptr inbounds %IPST.0, ptr %nsrrs3, i64 0, i32 2
  %tmpv.163.sroa.7.0.copyload = load i64, ptr %tmpv.163.sroa.7.0.cast.1630.sroa_idx321, align 8
  %add.5 = add i64 %tmpv.163.sroa.5.0.copyload, %dss.sroa.4.0.copyload
  %icmp.71 = icmp ugt i64 %add.5, %tmpv.163.sroa.7.0.copyload
  br i1 %icmp.71, label %then.70, label %fallthrough.71

fallthrough.69:                                   ; preds = %fallthrough.70, %else.68
  %tmpv.173.sroa.0.0.copyload = load ptr, ptr %nsrrs3, align 8
  %tmpv.173.sroa.2.0.cast.1645.sroa_idx913 = getelementptr inbounds %IPST.0, ptr %nsrrs3, i64 0, i32 1
  %tmpv.173.sroa.2.0.copyload = load i64, ptr %tmpv.173.sroa.2.0.cast.1645.sroa_idx913, align 8
  %tmpv.173.sroa.3.0.cast.1645.sroa_idx914 = getelementptr inbounds %IPST.0, ptr %nsrrs3, i64 0, i32 2
  %tmpv.173.sroa.3.0.copyload = load i64, ptr %tmpv.173.sroa.3.0.cast.1645.sroa_idx914, align 8
  %tmp.10.sroa.7.0.cast.1660.sroa_idx = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 2
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmp.10.sroa.7.0.cast.1660.sroa_idx, ptr noundef nonnull align 8 dereferenceable(24) %glue4, i64 24, i1 false)
  %tmp.10.sroa.4.0.cast.1660.sroa_idx1260 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 1, i32 0
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %sret.formal.0, i8 0, i64 24, i1 false)
  store ptr %tmpv.173.sroa.0.0.copyload, ptr %tmp.10.sroa.4.0.cast.1660.sroa_idx1260, align 8
  %tmp.10.sroa.5.0.cast.1660.sroa_idx1261 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 1, i32 1
  store i64 %tmpv.173.sroa.2.0.copyload, ptr %tmp.10.sroa.5.0.cast.1660.sroa_idx1261, align 8
  %tmp.10.sroa.6.0.cast.1660.sroa_idx1262 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 1, i32 2
  store i64 %tmpv.173.sroa.3.0.copyload, ptr %tmp.10.sroa.6.0.cast.1660.sroa_idx1262, align 8
  %tmp.10.sroa.8.0.cast.1660.sroa_idx1263 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 3
  store i64 2, ptr %tmp.10.sroa.8.0.cast.1660.sroa_idx1263, align 8
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %glue4)
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %nsrrs3)
  call void @llvm.lifetime.end.p0(i64 80, ptr nonnull %ap)
  br label %common.ret

then.70:                                          ; preds = %then.69
  %tmpv.163.sroa.0.0.copyload1483 = load ptr, ptr %nsrrs3, align 8
  call void @runtime.growslice(ptr nonnull %sret.actual.22, ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %tmpv.163.sroa.0.0.copyload1483, i64 %tmpv.163.sroa.5.0.copyload, i64 %tmpv.163.sroa.7.0.copyload, i64 %add.5)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %nsrrs3, ptr noundef nonnull align 8 dereferenceable(24) %sret.actual.22, i64 24, i1 false)
  %tmpv.163.sroa.5.0.copyload320.pre = load i64, ptr %tmpv.163.sroa.5.0.cast.1630.sroa_idx318, align 8
  %tmpv.163.sroa.7.0.copyload323.pre = load i64, ptr %tmpv.163.sroa.7.0.cast.1630.sroa_idx321, align 8
  br label %fallthrough.70

fallthrough.70:                                   ; preds = %fallthrough.71, %then.70
  %tmpv.163.sroa.7.0.copyload323 = phi i64 [ %tmpv.163.sroa.7.0.copyload, %fallthrough.71 ], [ %tmpv.163.sroa.7.0.copyload323.pre, %then.70 ]
  %tmpv.163.sroa.5.0.copyload320 = phi i64 [ %add.5, %fallthrough.71 ], [ %tmpv.163.sroa.5.0.copyload320.pre, %then.70 ]
  %tmpv.163.sroa.0.0.copyload317 = load ptr, ptr %nsrrs3, align 8
  %icmp.72 = icmp eq i64 %tmpv.163.sroa.7.0.copyload323, %tmpv.163.sroa.5.0.copyload
  %.tmpv.163.sroa.5.0.copyload = select i1 %icmp.72, i64 0, i64 %tmpv.163.sroa.5.0.copyload
  %ptroff.6 = getelementptr %RR.0, ptr %tmpv.163.sroa.0.0.copyload317, i64 %.tmpv.163.sroa.5.0.copyload
  %sub.16 = sub i64 %tmpv.163.sroa.5.0.copyload320, %tmpv.163.sroa.5.0.copyload
  %call.29 = call i64 @runtime.typedslicecopy(ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %ptroff.6, i64 %sub.16, ptr %dss.sroa.0.0.copyload1442, i64 %dss.sroa.4.0.copyload)
  br label %fallthrough.69

fallthrough.71:                                   ; preds = %then.69
  store i64 %add.5, ptr %tmpv.163.sroa.5.0.cast.1630.sroa_idx318, align 8
  br label %fallthrough.70

else.74.loopexit:                                 ; preds = %label.3
  %call.15.fca.0.extract.le = extractvalue { ptr, i8 } %call.15, 0
  %call.15.fca.1.extract.le = extractvalue { ptr, i8 } %call.15, 1
  br label %else.74

else.74:                                          ; preds = %else.74.loopexit, %label.1.preheader
  %elem.0.lcssa = phi ptr [ null, %label.1.preheader ], [ %call.15.fca.0.extract.le, %else.74.loopexit ]
  %found.0.lcssa = phi i8 [ 0, %label.1.preheader ], [ %call.15.fca.1.extract.le, %else.74.loopexit ]
  %tmpv.95.sroa.2.0.copyload.lcssa = phi i8 [ %tmpv.95.sroa.2.0.copyload1516, %label.1.preheader ], [ %tmpv.95.sroa.2.0.copyload, %else.74.loopexit ]
  %10 = and i8 %found.0.lcssa, 1
  %trunc.75.not.not = icmp eq i8 %10, 0
  %spec.select = select i1 %trunc.75.not.not, i8 %found.0.lcssa, i8 %tmpv.95.sroa.2.0.copyload.lcssa
  %11 = and i8 %spec.select, 1
  %trunc.89.not = icmp eq i8 %11, 0
  br i1 %trunc.89.not, label %else.76, label %then.76

then.76:                                          ; preds = %else.74
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %rrs)
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %additional)
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %rrs5)
  call void @go_0llvm.Elem.Type(ptr nonnull %sret.actual.23, ptr nest undef, ptr %elem.0.lcssa, i16 zeroext 5)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %rrs5, ptr noundef nonnull align 8 dereferenceable(24) %sret.actual.23, i64 24, i1 false)
  %field.214 = getelementptr inbounds %IPST.0, ptr %rrs5, i64 0, i32 1
  %rrs.field.ld.0 = load i64, ptr %field.214, align 8
  %icmp.75 = icmp sgt i64 %rrs.field.ld.0, 0
  %icmp.76 = icmp ne i16 %call.8, 5
  %spec.select1453 = select i1 %icmp.75, i1 %icmp.76, i1 false
  br i1 %spec.select1453, label %then.78, label %else.78

else.76:                                          ; preds = %else.74
  %.ld.62 = load ptr, ptr %call.11, align 8
  %icmp.97.not = icmp eq ptr %.ld.62, null
  br i1 %icmp.97.not, label %else.88, label %then.88

then.78:                                          ; preds = %then.76
  %call.30 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.LoopKey..d)
  %call.31 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @int..d)
  %add.7 = add i64 %tmpv.87.ld.0, 1
  store i64 %add.7, ptr %call.31, align 8
  %call.32 = call { ptr, ptr } @context.WithValue(ptr nest undef, ptr %ctx.chunk0, ptr %ctx.chunk1, ptr nonnull @go_0llvm.LoopKey..d, ptr nonnull %call.30, ptr nonnull @int..d, ptr nonnull %call.31)
  %call.32.fca.0.extract = extractvalue { ptr, ptr } %call.32, 0
  %call.32.fca.1.extract = extractvalue { ptr, ptr } %call.32, 1
  call void @go_0llvm.Zone.externalLookup(ptr nonnull %sret.actual.25, ptr nest poison, ptr nonnull %z, ptr %call.32.fca.0.extract, ptr %call.32.fca.1.extract, ptr nonnull byval(%Request.0) %call.57, ptr %elem.0.lcssa, ptr nonnull byval(%IPST.0) %rrs5)
  %tmpv.186.sroa.0.sroa.0.sroa.0.0.copyload = load ptr, ptr %sret.actual.25, align 8
  %tmpv.186.sroa.0.sroa.0.sroa.2.0.tmpv.186.sroa.0.sroa.0.0.tmpv.186.sroa.0.0.cast.1698.sroa_cast.sroa_cast.sroa_idx1124 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.actual.25, i64 0, i32 0, i32 1
  %tmpv.186.sroa.0.sroa.0.sroa.2.0.copyload = load i64, ptr %tmpv.186.sroa.0.sroa.0.sroa.2.0.tmpv.186.sroa.0.sroa.0.0.tmpv.186.sroa.0.0.cast.1698.sroa_cast.sroa_cast.sroa_idx1124, align 8
  %tmpv.186.sroa.0.sroa.0.sroa.3.0.tmpv.186.sroa.0.sroa.0.0.tmpv.186.sroa.0.0.cast.1698.sroa_cast.sroa_cast.sroa_idx1125 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.actual.25, i64 0, i32 0, i32 2
  %tmpv.186.sroa.0.sroa.0.sroa.3.0.copyload = load i64, ptr %tmpv.186.sroa.0.sroa.0.sroa.3.0.tmpv.186.sroa.0.sroa.0.0.tmpv.186.sroa.0.0.cast.1698.sroa_cast.sroa_cast.sroa_idx1125, align 8
  %tmpv.186.sroa.0.sroa.2.0.tmpv.186.sroa.0.0.cast.1698.sroa_cast.sroa_idx910 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.actual.25, i64 0, i32 1, i32 0
  %tmpv.186.sroa.0.sroa.2.0.copyload = load ptr, ptr %tmpv.186.sroa.0.sroa.2.0.tmpv.186.sroa.0.0.cast.1698.sroa_cast.sroa_idx910, align 8
  %tmpv.186.sroa.0.sroa.3.0.tmpv.186.sroa.0.0.cast.1698.sroa_cast.sroa_idx911 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.actual.25, i64 0, i32 1, i32 1
  %tmpv.186.sroa.0.sroa.3.0.copyload = load i64, ptr %tmpv.186.sroa.0.sroa.3.0.tmpv.186.sroa.0.0.cast.1698.sroa_cast.sroa_idx911, align 8
  %tmpv.186.sroa.0.sroa.4.0.tmpv.186.sroa.0.0.cast.1698.sroa_cast.sroa_idx912 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.actual.25, i64 0, i32 1, i32 2
  %tmpv.186.sroa.0.sroa.4.0.copyload = load i64, ptr %tmpv.186.sroa.0.sroa.4.0.tmpv.186.sroa.0.0.cast.1698.sroa_cast.sroa_idx912, align 8
  %tmpv.186.sroa.0.sroa.5.0.tmpv.186.sroa.0.0.cast.1698.sroa_cast.sroa_idx = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.actual.25, i64 0, i32 2
  %tmpv.186.sroa.4.0.cast.1698.sroa_idx298 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.actual.25, i64 0, i32 3
  %tmpv.186.sroa.4.0.copyload = load i64, ptr %tmpv.186.sroa.4.0.cast.1698.sroa_idx298, align 8
  %tmp.14.sroa.7.0.cast.1723.sroa_idx = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 2
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmp.14.sroa.7.0.cast.1723.sroa_idx, ptr noundef nonnull align 8 dereferenceable(24) %tmpv.186.sroa.0.sroa.5.0.tmpv.186.sroa.0.0.cast.1698.sroa_cast.sroa_idx, i64 24, i1 false)
  store ptr %tmpv.186.sroa.0.sroa.0.sroa.0.0.copyload, ptr %sret.formal.0, align 8
  %tmp.14.sroa.2.0.cast.1723.sroa_idx1299 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 0, i32 1
  store i64 %tmpv.186.sroa.0.sroa.0.sroa.2.0.copyload, ptr %tmp.14.sroa.2.0.cast.1723.sroa_idx1299, align 8
  %tmp.14.sroa.3.0.cast.1723.sroa_idx1300 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 0, i32 2
  store i64 %tmpv.186.sroa.0.sroa.0.sroa.3.0.copyload, ptr %tmp.14.sroa.3.0.cast.1723.sroa_idx1300, align 8
  %tmp.14.sroa.4.0.cast.1723.sroa_idx1301 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 1, i32 0
  store ptr %tmpv.186.sroa.0.sroa.2.0.copyload, ptr %tmp.14.sroa.4.0.cast.1723.sroa_idx1301, align 8
  %tmp.14.sroa.5.0.cast.1723.sroa_idx1302 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 1, i32 1
  store i64 %tmpv.186.sroa.0.sroa.3.0.copyload, ptr %tmp.14.sroa.5.0.cast.1723.sroa_idx1302, align 8
  %tmp.14.sroa.6.0.cast.1723.sroa_idx1303 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 1, i32 2
  store i64 %tmpv.186.sroa.0.sroa.4.0.copyload, ptr %tmp.14.sroa.6.0.cast.1723.sroa_idx1303, align 8
  %tmp.14.sroa.8.0.cast.1723.sroa_idx1304 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 3
  store i64 %tmpv.186.sroa.4.0.copyload, ptr %tmp.14.sroa.8.0.cast.1723.sroa_idx1304, align 8
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %rrs5)
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %rrs)
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %additional)
  call void @llvm.lifetime.end.p0(i64 80, ptr nonnull %ap)
  br label %common.ret

else.78:                                          ; preds = %then.76
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %rrs5)
  call void @go_0llvm.Elem.Type(ptr nonnull %sret.actual.26, ptr nest undef, ptr %elem.0.lcssa, i16 zeroext %call.8)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %rrs, ptr noundef nonnull align 8 dereferenceable(24) %sret.actual.26, i64 24, i1 false)
  %field.252 = getelementptr inbounds %IPST.0, ptr %rrs, i64 0, i32 1
  %rrs.field.ld.1 = load i64, ptr %field.252, align 8
  %icmp.80 = icmp eq i64 %rrs.field.ld.1, 0
  br i1 %icmp.80, label %then.79, label %else.79

then.79:                                          ; preds = %else.78
  call void @go_0llvm.Apex.soa(ptr nonnull %sret.actual.27, ptr nest poison, ptr nonnull %ap, i8 zeroext %call.9)
  %ret6.sroa.0.0.copyload = load ptr, ptr %sret.actual.27, align 8
  %ret6.sroa.8.0.cast.1728.sroa_idx282 = getelementptr inbounds %IPST.0, ptr %sret.actual.27, i64 0, i32 1
  %ret6.sroa.8.0.copyload = load i64, ptr %ret6.sroa.8.0.cast.1728.sroa_idx282, align 8
  %ret6.sroa.11.0.cast.1728.sroa_idx288 = getelementptr inbounds %IPST.0, ptr %sret.actual.27, i64 0, i32 2
  %ret6.sroa.11.0.copyload = load i64, ptr %ret6.sroa.11.0.cast.1728.sroa_idx288, align 8
  %12 = and i8 %call.9, 1
  %trunc.83.not = icmp eq i8 %12, 0
  br i1 %trunc.83.not, label %fallthrough.80, label %then.80

else.79:                                          ; preds = %else.78
  call void @go_0llvm.Zone.additionalProcessing(ptr nonnull %additional, ptr nest poison, ptr nonnull %z, ptr nonnull byval(%IPST.0) %rrs, i8 zeroext %call.9)
  %13 = and i8 %call.9, 1
  %trunc.88.not = icmp eq i8 %13, 0
  br i1 %trunc.88.not, label %else.79.fallthrough.84_crit_edge, label %then.84

else.79.fallthrough.84_crit_edge:                 ; preds = %else.79
  %tmpv.218.sroa.0.0.copyload.pre = load ptr, ptr %rrs, align 8
  %tmpv.218.sroa.3.0.cast.1786.sroa_idx1119.phi.trans.insert = getelementptr inbounds %IPST.0, ptr %rrs, i64 0, i32 2
  %tmpv.218.sroa.3.0.copyload.pre = load i64, ptr %tmpv.218.sroa.3.0.cast.1786.sroa_idx1119.phi.trans.insert, align 8
  br label %fallthrough.84

then.80:                                          ; preds = %then.79
  call fastcc void @go_0llvm.typeFromElem(ptr nonnull %sret.actual.28, ptr %elem.0.lcssa, i16 zeroext 47, i8 zeroext %call.9)
  %nsec.sroa.0.0.copyload1451 = load ptr, ptr %sret.actual.28, align 8
  %nsec.sroa.4.0.cast.1730.sroa_idx275 = getelementptr inbounds %IPST.0, ptr %sret.actual.28, i64 0, i32 1
  %nsec.sroa.4.0.copyload = load i64, ptr %nsec.sroa.4.0.cast.1730.sroa_idx275, align 8
  %add.8 = add i64 %nsec.sroa.4.0.copyload, %ret6.sroa.8.0.copyload
  %icmp.78 = icmp ugt i64 %add.8, %ret6.sroa.11.0.copyload
  br i1 %icmp.78, label %then.81, label %fallthrough.81

fallthrough.80:                                   ; preds = %fallthrough.81, %then.79
  %ret6.sroa.0.0 = phi ptr [ %ret6.sroa.0.1, %fallthrough.81 ], [ %ret6.sroa.0.0.copyload, %then.79 ]
  %ret6.sroa.8.0 = phi i64 [ %ret6.sroa.8.1, %fallthrough.81 ], [ %ret6.sroa.8.0.copyload, %then.79 ]
  %ret6.sroa.11.0 = phi i64 [ %ret6.sroa.11.1, %fallthrough.81 ], [ %ret6.sroa.11.0.copyload, %then.79 ]
  %tmp.15.sroa.7.0.cast.1761.sroa_idx = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 2
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmp.15.sroa.7.0.cast.1761.sroa_idx, i8 0, i64 24, i1 false)
  %tmp.15.sroa.4.0.cast.1761.sroa_idx1321 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 1, i32 0
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %sret.formal.0, i8 0, i64 24, i1 false)
  store ptr %ret6.sroa.0.0, ptr %tmp.15.sroa.4.0.cast.1761.sroa_idx1321, align 8
  %tmp.15.sroa.5.0.cast.1761.sroa_idx1322 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 1, i32 1
  store i64 %ret6.sroa.8.0, ptr %tmp.15.sroa.5.0.cast.1761.sroa_idx1322, align 8
  %tmp.15.sroa.6.0.cast.1761.sroa_idx1323 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 1, i32 2
  store i64 %ret6.sroa.11.0, ptr %tmp.15.sroa.6.0.cast.1761.sroa_idx1323, align 8
  %tmp.15.sroa.8.0.cast.1761.sroa_idx1324 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 3
  store i64 3, ptr %tmp.15.sroa.8.0.cast.1761.sroa_idx1324, align 8
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %rrs)
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %additional)
  call void @llvm.lifetime.end.p0(i64 80, ptr nonnull %ap)
  br label %common.ret

then.81:                                          ; preds = %then.80
  call void @runtime.growslice(ptr nonnull %sret.actual.29, ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %ret6.sroa.0.0.copyload, i64 %ret6.sroa.8.0.copyload, i64 %ret6.sroa.11.0.copyload, i64 %add.8)
  %ret6.sroa.0.0.copyload279 = load ptr, ptr %sret.actual.29, align 8
  %14 = getelementptr inbounds { ptr, i64, i64 }, ptr %sret.actual.29, i64 0, i32 1
  %ret6.sroa.8.0.copyload284 = load i64, ptr %14, align 8
  %15 = getelementptr inbounds { ptr, i64, i64 }, ptr %sret.actual.29, i64 0, i32 2
  %ret6.sroa.11.0.copyload290 = load i64, ptr %15, align 8
  br label %fallthrough.81

fallthrough.81:                                   ; preds = %then.81, %then.80
  %ret6.sroa.0.1 = phi ptr [ %ret6.sroa.0.0.copyload279, %then.81 ], [ %ret6.sroa.0.0.copyload, %then.80 ]
  %ret6.sroa.8.1 = phi i64 [ %ret6.sroa.8.0.copyload284, %then.81 ], [ %add.8, %then.80 ]
  %ret6.sroa.11.1 = phi i64 [ %ret6.sroa.11.0.copyload290, %then.81 ], [ %ret6.sroa.11.0.copyload, %then.80 ]
  %icmp.79 = icmp eq i64 %ret6.sroa.11.1, %ret6.sroa.8.0.copyload
  %.ret6.sroa.8.0.copyload = select i1 %icmp.79, i64 0, i64 %ret6.sroa.8.0.copyload
  %ptroff.8 = getelementptr %RR.0, ptr %ret6.sroa.0.1, i64 %.ret6.sroa.8.0.copyload
  %sub.22 = sub i64 %ret6.sroa.8.1, %ret6.sroa.8.0.copyload
  %call.33 = call i64 @runtime.typedslicecopy(ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %ptroff.8, i64 %sub.22, ptr %nsec.sroa.0.0.copyload1451, i64 %nsec.sroa.4.0.copyload)
  br label %fallthrough.80

then.84:                                          ; preds = %else.79
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %sigs7)
  call void @go_0llvm.Elem.Type(ptr nonnull %sret.actual.31, ptr nest undef, ptr %elem.0.lcssa, i16 zeroext 46)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %sigs7, ptr noundef nonnull align 8 dereferenceable(24) %sret.actual.31, i64 24, i1 false)
  call void @go_0llvm.SubTypeSignature(ptr nonnull %sret.actual.32, ptr nest undef, ptr nonnull byval(%IPST.0) %sigs7, i16 zeroext %call.8)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %sigs7, ptr noundef nonnull align 8 dereferenceable(24) %sret.actual.32, i64 24, i1 false)
  %tmpv.209.sroa.7.0.cast.1772.sroa_idx246 = getelementptr inbounds %IPST.0, ptr %rrs, i64 0, i32 2
  %tmpv.209.sroa.7.0.copyload = load i64, ptr %tmpv.209.sroa.7.0.cast.1772.sroa_idx246, align 8
  %tmpv.211.sroa.0.0.copyload1450 = load ptr, ptr %sigs7, align 8
  %tmpv.211.sroa.2.0.cast.1774.sroa_idx235 = getelementptr inbounds %IPST.0, ptr %sigs7, i64 0, i32 1
  %tmpv.211.sroa.2.0.copyload = load i64, ptr %tmpv.211.sroa.2.0.cast.1774.sroa_idx235, align 8
  %add.9 = add i64 %tmpv.211.sroa.2.0.copyload, %rrs.field.ld.1
  %icmp.82 = icmp ugt i64 %add.9, %tmpv.209.sroa.7.0.copyload
  br i1 %icmp.82, label %then.85, label %fallthrough.85

fallthrough.84:                                   ; preds = %else.79.fallthrough.84_crit_edge, %fallthrough.85
  %tmpv.218.sroa.3.0.copyload = phi i64 [ %tmpv.218.sroa.3.0.copyload.pre, %else.79.fallthrough.84_crit_edge ], [ %tmpv.209.sroa.7.0.copyload248, %fallthrough.85 ]
  %tmpv.218.sroa.2.0.copyload = phi i64 [ %rrs.field.ld.1, %else.79.fallthrough.84_crit_edge ], [ %tmpv.209.sroa.5.0.copyload245, %fallthrough.85 ]
  %tmpv.218.sroa.0.0.copyload = phi ptr [ %tmpv.218.sroa.0.0.copyload.pre, %else.79.fallthrough.84_crit_edge ], [ %tmpv.209.sroa.0.0.copyload242, %fallthrough.85 ]
  call void @go_0llvm.Apex.ns(ptr nonnull %sret.actual.34, ptr nest poison, ptr nonnull %ap, i8 zeroext %call.9)
  %tmpv.219.sroa.0.0.copyload = load ptr, ptr %sret.actual.34, align 8
  %tmpv.219.sroa.2.0.cast.1788.sroa_idx903 = getelementptr inbounds %IPST.0, ptr %sret.actual.34, i64 0, i32 1
  %tmpv.219.sroa.2.0.copyload = load i64, ptr %tmpv.219.sroa.2.0.cast.1788.sroa_idx903, align 8
  %tmpv.219.sroa.3.0.cast.1788.sroa_idx904 = getelementptr inbounds %IPST.0, ptr %sret.actual.34, i64 0, i32 2
  %tmpv.219.sroa.3.0.copyload = load i64, ptr %tmpv.219.sroa.3.0.cast.1788.sroa_idx904, align 8
  %tmp.16.sroa.7.0.cast.1803.sroa_idx = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 2
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmp.16.sroa.7.0.cast.1803.sroa_idx, ptr noundef nonnull align 8 dereferenceable(24) %additional, i64 24, i1 false)
  store ptr %tmpv.218.sroa.0.0.copyload, ptr %sret.formal.0, align 8
  %tmp.16.sroa.2.0.cast.1803.sroa_idx1340 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 0, i32 1
  store i64 %tmpv.218.sroa.2.0.copyload, ptr %tmp.16.sroa.2.0.cast.1803.sroa_idx1340, align 8
  %tmp.16.sroa.3.0.cast.1803.sroa_idx1341 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 0, i32 2
  store i64 %tmpv.218.sroa.3.0.copyload, ptr %tmp.16.sroa.3.0.cast.1803.sroa_idx1341, align 8
  %tmp.16.sroa.4.0.cast.1803.sroa_idx1342 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 1, i32 0
  store ptr %tmpv.219.sroa.0.0.copyload, ptr %tmp.16.sroa.4.0.cast.1803.sroa_idx1342, align 8
  %tmp.16.sroa.5.0.cast.1803.sroa_idx1343 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 1, i32 1
  store i64 %tmpv.219.sroa.2.0.copyload, ptr %tmp.16.sroa.5.0.cast.1803.sroa_idx1343, align 8
  %tmp.16.sroa.6.0.cast.1803.sroa_idx1344 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 1, i32 2
  store i64 %tmpv.219.sroa.3.0.copyload, ptr %tmp.16.sroa.6.0.cast.1803.sroa_idx1344, align 8
  %tmp.16.sroa.8.0.cast.1803.sroa_idx1345 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 3
  store i64 0, ptr %tmp.16.sroa.8.0.cast.1803.sroa_idx1345, align 8
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %rrs)
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %additional)
  call void @llvm.lifetime.end.p0(i64 80, ptr nonnull %ap)
  br label %common.ret

then.85:                                          ; preds = %then.84
  %tmpv.209.sroa.0.0.copyload1482 = load ptr, ptr %rrs, align 8
  call void @runtime.growslice(ptr nonnull %sret.actual.33, ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %tmpv.209.sroa.0.0.copyload1482, i64 %rrs.field.ld.1, i64 %tmpv.209.sroa.7.0.copyload, i64 %add.9)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %rrs, ptr noundef nonnull align 8 dereferenceable(24) %sret.actual.33, i64 24, i1 false)
  %tmpv.209.sroa.5.0.copyload245.pre = load i64, ptr %field.252, align 8
  %tmpv.209.sroa.7.0.copyload248.pre = load i64, ptr %tmpv.209.sroa.7.0.cast.1772.sroa_idx246, align 8
  br label %fallthrough.85

fallthrough.85:                                   ; preds = %then.84, %then.85
  %tmpv.209.sroa.7.0.copyload248 = phi i64 [ %tmpv.209.sroa.7.0.copyload248.pre, %then.85 ], [ %tmpv.209.sroa.7.0.copyload, %then.84 ]
  %tmpv.209.sroa.5.0.copyload245 = phi i64 [ %tmpv.209.sroa.5.0.copyload245.pre, %then.85 ], [ %add.9, %then.84 ]
  %tmpv.209.sroa.0.0.copyload242 = load ptr, ptr %rrs, align 8
  %icmp.83 = icmp eq i64 %tmpv.209.sroa.7.0.copyload248, %rrs.field.ld.1
  %.tmpv.209.sroa.5.0.copyload = select i1 %icmp.83, i64 0, i64 %rrs.field.ld.1
  %ptroff.10 = getelementptr %RR.0, ptr %tmpv.209.sroa.0.0.copyload242, i64 %.tmpv.209.sroa.5.0.copyload
  %sub.28 = sub i64 %tmpv.209.sroa.5.0.copyload245, %rrs.field.ld.1
  %call.34 = call i64 @runtime.typedslicecopy(ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %ptroff.10, i64 %sub.28, ptr %tmpv.211.sroa.0.0.copyload1450, i64 %tmpv.211.sroa.2.0.copyload)
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %sigs7)
  br label %fallthrough.84

then.88:                                          ; preds = %else.76
  %call.35 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @type..struct_4_4x_5f_b_2_4void_5_cgo_0llvm_0wildElem1_b_2_2go_0llvm_0Elem_5)
  store ptr @go_0llvm.Zone.Lookup..func1, ptr %tmpv.225, align 8
  %field.279 = getelementptr inbounds { ptr, ptr }, ptr %tmpv.225, i64 0, i32 1
  store ptr %call.11, ptr %field.279, align 8
  %deref.ld.11 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.84 = icmp eq i32 %deref.ld.11, 0
  br i1 %icmp.84, label %then.89, label %else.89

else.88:                                          ; preds = %else.76
  %call.44 = call { ptr, i8 } @go_0llvm.Tree.Next(ptr nest undef, ptr %.field.ld.9, ptr %qname.chunk0, i64 %qname.chunk1)
  %call.44.fca.1.extract = extractvalue { ptr, i8 } %call.44, 1
  %16 = and i8 %call.44.fca.1.extract, 1
  %trunc.108.not = icmp eq i8 %16, 0
  br i1 %trunc.108.not, label %fallthrough.105, label %then.105

then.89:                                          ; preds = %then.88
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %call.35, ptr noundef nonnull align 8 dereferenceable(16) %tmpv.225, i64 16, i1 false)
  br label %fallthrough.89

fallthrough.89:                                   ; preds = %else.89, %then.89
  %call.36 = call i8 @go_0llvm.SetValueFunc(ptr nest undef, ptr %ctx.chunk0, ptr %ctx.chunk1, ptr nonnull @const.420, i64 13, ptr nonnull %call.35)
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %rrs9)
  %.ld.48 = load ptr, ptr %call.11, align 8
  call void @go_0llvm.Elem.TypeForWildcard(ptr nonnull %sret.actual.35, ptr nest undef, ptr %.ld.48, i16 zeroext 5, ptr %qname.chunk0, i64 %qname.chunk1)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %rrs9, ptr noundef nonnull align 8 dereferenceable(24) %sret.actual.35, i64 24, i1 false)
  %field.280 = getelementptr inbounds %IPST.0, ptr %rrs9, i64 0, i32 1
  %rrs.field.ld.2 = load i64, ptr %field.280, align 8
  %icmp.85 = icmp sgt i64 %rrs.field.ld.2, 0
  %icmp.86 = icmp ne i16 %call.8, 5
  %spec.select1454 = select i1 %icmp.85, i1 %icmp.86, i1 false
  br i1 %spec.select1454, label %then.91, label %else.91

else.89:                                          ; preds = %then.88
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @type..struct_4_4x_5f_b_2_4void_5_cgo_0llvm_0wildElem1_b_2_2go_0llvm_0Elem_5, ptr nonnull %call.35, ptr nonnull %tmpv.225)
  br label %fallthrough.89

then.91:                                          ; preds = %fallthrough.89
  %call.37 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.LoopKey..d)
  %call.38 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @int..d)
  %add.10 = add i64 %tmpv.87.ld.0, 1
  store i64 %add.10, ptr %call.38, align 8
  %call.39 = call { ptr, ptr } @context.WithValue(ptr nest undef, ptr %ctx.chunk0, ptr %ctx.chunk1, ptr nonnull @go_0llvm.LoopKey..d, ptr nonnull %call.37, ptr nonnull @int..d, ptr nonnull %call.38)
  %call.39.fca.0.extract = extractvalue { ptr, ptr } %call.39, 0
  %call.39.fca.1.extract = extractvalue { ptr, ptr } %call.39, 1
  %.ld.49 = load ptr, ptr %call.11, align 8
  call void @go_0llvm.Zone.externalLookup(ptr nonnull %sret.actual.37, ptr nest poison, ptr nonnull %z, ptr %call.39.fca.0.extract, ptr %call.39.fca.1.extract, ptr nonnull byval(%Request.0) %call.57, ptr %.ld.49, ptr nonnull byval(%IPST.0) %rrs9)
  %tmpv.231.sroa.0.sroa.0.sroa.0.0.copyload = load ptr, ptr %sret.actual.37, align 8
  %tmpv.231.sroa.0.sroa.0.sroa.2.0.tmpv.231.sroa.0.sroa.0.0.tmpv.231.sroa.0.0.cast.1841.sroa_cast.sroa_cast.sroa_idx1116 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.actual.37, i64 0, i32 0, i32 1
  %tmpv.231.sroa.0.sroa.0.sroa.2.0.copyload = load i64, ptr %tmpv.231.sroa.0.sroa.0.sroa.2.0.tmpv.231.sroa.0.sroa.0.0.tmpv.231.sroa.0.0.cast.1841.sroa_cast.sroa_cast.sroa_idx1116, align 8
  %tmpv.231.sroa.0.sroa.0.sroa.3.0.tmpv.231.sroa.0.sroa.0.0.tmpv.231.sroa.0.0.cast.1841.sroa_cast.sroa_cast.sroa_idx1117 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.actual.37, i64 0, i32 0, i32 2
  %tmpv.231.sroa.0.sroa.0.sroa.3.0.copyload = load i64, ptr %tmpv.231.sroa.0.sroa.0.sroa.3.0.tmpv.231.sroa.0.sroa.0.0.tmpv.231.sroa.0.0.cast.1841.sroa_cast.sroa_cast.sroa_idx1117, align 8
  %tmpv.231.sroa.0.sroa.2.0.tmpv.231.sroa.0.0.cast.1841.sroa_cast.sroa_idx900 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.actual.37, i64 0, i32 1, i32 0
  %tmpv.231.sroa.0.sroa.2.0.copyload = load ptr, ptr %tmpv.231.sroa.0.sroa.2.0.tmpv.231.sroa.0.0.cast.1841.sroa_cast.sroa_idx900, align 8
  %tmpv.231.sroa.0.sroa.3.0.tmpv.231.sroa.0.0.cast.1841.sroa_cast.sroa_idx901 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.actual.37, i64 0, i32 1, i32 1
  %tmpv.231.sroa.0.sroa.3.0.copyload = load i64, ptr %tmpv.231.sroa.0.sroa.3.0.tmpv.231.sroa.0.0.cast.1841.sroa_cast.sroa_idx901, align 8
  %tmpv.231.sroa.0.sroa.4.0.tmpv.231.sroa.0.0.cast.1841.sroa_cast.sroa_idx902 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.actual.37, i64 0, i32 1, i32 2
  %tmpv.231.sroa.0.sroa.4.0.copyload = load i64, ptr %tmpv.231.sroa.0.sroa.4.0.tmpv.231.sroa.0.0.cast.1841.sroa_cast.sroa_idx902, align 8
  %tmpv.231.sroa.0.sroa.5.0.tmpv.231.sroa.0.0.cast.1841.sroa_cast.sroa_idx = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.actual.37, i64 0, i32 2
  %tmpv.231.sroa.4.0.cast.1841.sroa_idx180 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.actual.37, i64 0, i32 3
  %tmpv.231.sroa.4.0.copyload = load i64, ptr %tmpv.231.sroa.4.0.cast.1841.sroa_idx180, align 8
  %tmp.19.sroa.7.0.cast.1866.sroa_idx = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 2
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmp.19.sroa.7.0.cast.1866.sroa_idx, ptr noundef nonnull align 8 dereferenceable(24) %tmpv.231.sroa.0.sroa.5.0.tmpv.231.sroa.0.0.cast.1841.sroa_cast.sroa_idx, i64 24, i1 false)
  store ptr %tmpv.231.sroa.0.sroa.0.sroa.0.0.copyload, ptr %sret.formal.0, align 8
  %tmp.19.sroa.2.0.cast.1866.sroa_idx1360 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 0, i32 1
  store i64 %tmpv.231.sroa.0.sroa.0.sroa.2.0.copyload, ptr %tmp.19.sroa.2.0.cast.1866.sroa_idx1360, align 8
  %tmp.19.sroa.3.0.cast.1866.sroa_idx1361 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 0, i32 2
  store i64 %tmpv.231.sroa.0.sroa.0.sroa.3.0.copyload, ptr %tmp.19.sroa.3.0.cast.1866.sroa_idx1361, align 8
  %tmp.19.sroa.4.0.cast.1866.sroa_idx1362 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 1, i32 0
  store ptr %tmpv.231.sroa.0.sroa.2.0.copyload, ptr %tmp.19.sroa.4.0.cast.1866.sroa_idx1362, align 8
  %tmp.19.sroa.5.0.cast.1866.sroa_idx1363 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 1, i32 1
  store i64 %tmpv.231.sroa.0.sroa.3.0.copyload, ptr %tmp.19.sroa.5.0.cast.1866.sroa_idx1363, align 8
  %tmp.19.sroa.6.0.cast.1866.sroa_idx1364 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 1, i32 2
  store i64 %tmpv.231.sroa.0.sroa.4.0.copyload, ptr %tmp.19.sroa.6.0.cast.1866.sroa_idx1364, align 8
  %tmp.19.sroa.8.0.cast.1866.sroa_idx1365 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 3
  store i64 %tmpv.231.sroa.4.0.copyload, ptr %tmp.19.sroa.8.0.cast.1866.sroa_idx1365, align 8
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %rrs9)
  call void @llvm.lifetime.end.p0(i64 80, ptr nonnull %ap)
  br label %common.ret

else.91:                                          ; preds = %fallthrough.89
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %rrs9)
  %.ld.50 = load ptr, ptr %call.11, align 8
  call void @go_0llvm.Elem.TypeForWildcard(ptr nonnull %sret.actual.38, ptr nest undef, ptr %.ld.50, i16 zeroext %call.8, ptr %qname.chunk0, i64 %qname.chunk1)
  %rrs8.sroa.0.0.copyload = load ptr, ptr %sret.actual.38, align 8
  %rrs8.sroa.10.0.cast.1870.sroa_idx213 = getelementptr inbounds %IPST.0, ptr %sret.actual.38, i64 0, i32 1
  %rrs8.sroa.10.0.copyload = load i64, ptr %rrs8.sroa.10.0.cast.1870.sroa_idx213, align 8
  %rrs8.sroa.14.0.cast.1870.sroa_idx221 = getelementptr inbounds %IPST.0, ptr %sret.actual.38, i64 0, i32 2
  %rrs8.sroa.14.0.copyload = load i64, ptr %rrs8.sroa.14.0.cast.1870.sroa_idx221, align 8
  %icmp.90 = icmp eq i64 %rrs8.sroa.10.0.copyload, 0
  %17 = and i8 %call.9, 1
  %trunc.96.not = icmp eq i8 %17, 0
  br i1 %icmp.90, label %then.92, label %else.92

then.92:                                          ; preds = %else.91
  call void @go_0llvm.Apex.soa(ptr nonnull %sret.actual.39, ptr nest poison, ptr nonnull %ap, i8 zeroext %call.9)
  %ret10.sroa.0.0.copyload = load ptr, ptr %sret.actual.39, align 8
  %ret10.sroa.8.0.cast.1872.sroa_idx164 = getelementptr inbounds %IPST.0, ptr %sret.actual.39, i64 0, i32 1
  %ret10.sroa.8.0.copyload = load i64, ptr %ret10.sroa.8.0.cast.1872.sroa_idx164, align 8
  %ret10.sroa.11.0.cast.1872.sroa_idx170 = getelementptr inbounds %IPST.0, ptr %sret.actual.39, i64 0, i32 2
  %ret10.sroa.11.0.copyload = load i64, ptr %ret10.sroa.11.0.cast.1872.sroa_idx170, align 8
  br i1 %trunc.96.not, label %fallthrough.93, label %then.93

else.92:                                          ; preds = %else.91
  call void @go_0llvm.Apex.ns(ptr nonnull %sret.actual.42, ptr nest poison, ptr nonnull %ap, i8 zeroext %call.9)
  %auth.sroa.0.0.copyload = load ptr, ptr %sret.actual.42, align 8
  %auth.sroa.10.0.cast.1908.sroa_idx189 = getelementptr inbounds %IPST.0, ptr %sret.actual.42, i64 0, i32 1
  %auth.sroa.10.0.copyload = load i64, ptr %auth.sroa.10.0.cast.1908.sroa_idx189, align 8
  %auth.sroa.13.0.cast.1908.sroa_idx197 = getelementptr inbounds %IPST.0, ptr %sret.actual.42, i64 0, i32 2
  %auth.sroa.13.0.copyload = load i64, ptr %auth.sroa.13.0.cast.1908.sroa_idx197, align 8
  br i1 %trunc.96.not, label %fallthrough.97, label %then.97

then.93:                                          ; preds = %then.92
  %.ld.51 = load ptr, ptr %call.11, align 8
  call fastcc void @go_0llvm.typeFromElem(ptr nonnull %sret.actual.40, ptr %.ld.51, i16 zeroext 47, i8 zeroext %call.9)
  %nsec11.sroa.0.0.copyload1449 = load ptr, ptr %sret.actual.40, align 8
  %nsec11.sroa.4.0.cast.1874.sroa_idx157 = getelementptr inbounds %IPST.0, ptr %sret.actual.40, i64 0, i32 1
  %nsec11.sroa.4.0.copyload = load i64, ptr %nsec11.sroa.4.0.cast.1874.sroa_idx157, align 8
  %add.11 = add i64 %nsec11.sroa.4.0.copyload, %ret10.sroa.8.0.copyload
  %icmp.88 = icmp ugt i64 %add.11, %ret10.sroa.11.0.copyload
  br i1 %icmp.88, label %then.94, label %fallthrough.94

fallthrough.93:                                   ; preds = %fallthrough.94, %then.92
  %ret10.sroa.0.0 = phi ptr [ %ret10.sroa.0.1, %fallthrough.94 ], [ %ret10.sroa.0.0.copyload, %then.92 ]
  %ret10.sroa.8.0 = phi i64 [ %ret10.sroa.8.1, %fallthrough.94 ], [ %ret10.sroa.8.0.copyload, %then.92 ]
  %ret10.sroa.11.0 = phi i64 [ %ret10.sroa.11.1, %fallthrough.94 ], [ %ret10.sroa.11.0.copyload, %then.92 ]
  %tmp.20.sroa.7.0.cast.1905.sroa_idx = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 2
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmp.20.sroa.7.0.cast.1905.sroa_idx, i8 0, i64 24, i1 false)
  %tmp.20.sroa.4.0.cast.1905.sroa_idx1383 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 1, i32 0
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %sret.formal.0, i8 0, i64 24, i1 false)
  store ptr %ret10.sroa.0.0, ptr %tmp.20.sroa.4.0.cast.1905.sroa_idx1383, align 8
  %tmp.20.sroa.5.0.cast.1905.sroa_idx1384 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 1, i32 1
  store i64 %ret10.sroa.8.0, ptr %tmp.20.sroa.5.0.cast.1905.sroa_idx1384, align 8
  %tmp.20.sroa.6.0.cast.1905.sroa_idx1385 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 1, i32 2
  store i64 %ret10.sroa.11.0, ptr %tmp.20.sroa.6.0.cast.1905.sroa_idx1385, align 8
  %tmp.20.sroa.8.0.cast.1905.sroa_idx1386 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 3
  store i64 3, ptr %tmp.20.sroa.8.0.cast.1905.sroa_idx1386, align 8
  call void @llvm.lifetime.end.p0(i64 80, ptr nonnull %ap)
  br label %common.ret

then.94:                                          ; preds = %then.93
  call void @runtime.growslice(ptr nonnull %sret.actual.41, ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %ret10.sroa.0.0.copyload, i64 %ret10.sroa.8.0.copyload, i64 %ret10.sroa.11.0.copyload, i64 %add.11)
  %ret10.sroa.0.0.copyload161 = load ptr, ptr %sret.actual.41, align 8
  %18 = getelementptr inbounds { ptr, i64, i64 }, ptr %sret.actual.41, i64 0, i32 1
  %ret10.sroa.8.0.copyload166 = load i64, ptr %18, align 8
  %19 = getelementptr inbounds { ptr, i64, i64 }, ptr %sret.actual.41, i64 0, i32 2
  %ret10.sroa.11.0.copyload172 = load i64, ptr %19, align 8
  br label %fallthrough.94

fallthrough.94:                                   ; preds = %then.94, %then.93
  %ret10.sroa.0.1 = phi ptr [ %ret10.sroa.0.0.copyload161, %then.94 ], [ %ret10.sroa.0.0.copyload, %then.93 ]
  %ret10.sroa.8.1 = phi i64 [ %ret10.sroa.8.0.copyload166, %then.94 ], [ %add.11, %then.93 ]
  %ret10.sroa.11.1 = phi i64 [ %ret10.sroa.11.0.copyload172, %then.94 ], [ %ret10.sroa.11.0.copyload, %then.93 ]
  %icmp.89 = icmp eq i64 %ret10.sroa.11.1, %ret10.sroa.8.0.copyload
  %.ret10.sroa.8.0.copyload = select i1 %icmp.89, i64 0, i64 %ret10.sroa.8.0.copyload
  %ptroff.12 = getelementptr %RR.0, ptr %ret10.sroa.0.1, i64 %.ret10.sroa.8.0.copyload
  %sub.34 = sub i64 %ret10.sroa.8.1, %ret10.sroa.8.0.copyload
  %call.40 = call i64 @runtime.typedslicecopy(ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %ptroff.12, i64 %sub.34, ptr %nsec11.sroa.0.0.copyload1449, i64 %nsec11.sroa.4.0.copyload)
  br label %fallthrough.93

then.97:                                          ; preds = %else.92
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %sigs12)
  %call.41 = call { ptr, i8 } @go_0llvm.Tree.Prev(ptr nest undef, ptr %.field.ld.9, ptr %qname.chunk0, i64 %qname.chunk1)
  %call.41.fca.1.extract = extractvalue { ptr, i8 } %call.41, 1
  %20 = and i8 %call.41.fca.1.extract, 1
  %trunc.101.not = icmp eq i8 %20, 0
  br i1 %trunc.101.not, label %fallthrough.98, label %then.98

fallthrough.97:                                   ; preds = %fallthrough.102, %else.92
  %auth.sroa.0.0 = phi ptr [ %auth.sroa.0.1, %fallthrough.102 ], [ %auth.sroa.0.0.copyload, %else.92 ]
  %auth.sroa.10.0 = phi i64 [ %auth.sroa.10.1, %fallthrough.102 ], [ %auth.sroa.10.0.copyload, %else.92 ]
  %auth.sroa.13.0 = phi i64 [ %auth.sroa.13.1, %fallthrough.102 ], [ %auth.sroa.13.0.copyload, %else.92 ]
  %rrs8.sroa.0.0 = phi ptr [ %rrs8.sroa.0.1, %fallthrough.102 ], [ %rrs8.sroa.0.0.copyload, %else.92 ]
  %rrs8.sroa.10.0 = phi i64 [ %rrs8.sroa.10.1, %fallthrough.102 ], [ %rrs8.sroa.10.0.copyload, %else.92 ]
  %rrs8.sroa.14.0 = phi i64 [ %rrs8.sroa.14.1, %fallthrough.102 ], [ %rrs8.sroa.14.0.copyload, %else.92 ]
  %tmp.21.sroa.7.0.cast.1967.sroa_idx = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 2
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmp.21.sroa.7.0.cast.1967.sroa_idx, i8 0, i64 24, i1 false)
  store ptr %rrs8.sroa.0.0, ptr %sret.formal.0, align 8
  %tmp.21.sroa.2.0.cast.1967.sroa_idx1401 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 0, i32 1
  store i64 %rrs8.sroa.10.0, ptr %tmp.21.sroa.2.0.cast.1967.sroa_idx1401, align 8
  %tmp.21.sroa.3.0.cast.1967.sroa_idx1402 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 0, i32 2
  store i64 %rrs8.sroa.14.0, ptr %tmp.21.sroa.3.0.cast.1967.sroa_idx1402, align 8
  %tmp.21.sroa.4.0.cast.1967.sroa_idx1403 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 1, i32 0
  store ptr %auth.sroa.0.0, ptr %tmp.21.sroa.4.0.cast.1967.sroa_idx1403, align 8
  %tmp.21.sroa.5.0.cast.1967.sroa_idx1404 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 1, i32 1
  store i64 %auth.sroa.10.0, ptr %tmp.21.sroa.5.0.cast.1967.sroa_idx1404, align 8
  %tmp.21.sroa.6.0.cast.1967.sroa_idx1405 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 1, i32 2
  store i64 %auth.sroa.13.0, ptr %tmp.21.sroa.6.0.cast.1967.sroa_idx1405, align 8
  %tmp.21.sroa.8.0.cast.1967.sroa_idx1406 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 3
  store i64 0, ptr %tmp.21.sroa.8.0.cast.1967.sroa_idx1406, align 8
  call void @llvm.lifetime.end.p0(i64 80, ptr nonnull %ap)
  br label %common.ret

then.98:                                          ; preds = %then.97
  %call.41.fca.0.extract = extractvalue { ptr, i8 } %call.41, 0
  call fastcc void @go_0llvm.typeFromElem(ptr nonnull %sret.actual.44, ptr %call.41.fca.0.extract, i16 zeroext 47, i8 zeroext %call.9)
  %nsec14.sroa.0.0.copyload1448 = load ptr, ptr %sret.actual.44, align 8
  %nsec14.sroa.4.0.cast.1914.sroa_idx130 = getelementptr inbounds %IPST.0, ptr %sret.actual.44, i64 0, i32 1
  %nsec14.sroa.4.0.copyload = load i64, ptr %nsec14.sroa.4.0.cast.1914.sroa_idx130, align 8
  %add.12 = add i64 %nsec14.sroa.4.0.copyload, %auth.sroa.10.0.copyload
  %icmp.92 = icmp ugt i64 %add.12, %auth.sroa.13.0.copyload
  br i1 %icmp.92, label %then.99, label %fallthrough.99

fallthrough.98:                                   ; preds = %fallthrough.99, %then.97
  %auth.sroa.0.1 = phi ptr [ %auth.sroa.0.2, %fallthrough.99 ], [ %auth.sroa.0.0.copyload, %then.97 ]
  %auth.sroa.10.1 = phi i64 [ %auth.sroa.10.2, %fallthrough.99 ], [ %auth.sroa.10.0.copyload, %then.97 ]
  %auth.sroa.13.1 = phi i64 [ %auth.sroa.13.2, %fallthrough.99 ], [ %auth.sroa.13.0.copyload, %then.97 ]
  %.ld.58 = load ptr, ptr %call.11, align 8
  call void @go_0llvm.Elem.TypeForWildcard(ptr nonnull %sret.actual.46, ptr nest undef, ptr %.ld.58, i16 zeroext 46, ptr %qname.chunk0, i64 %qname.chunk1)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %sigs12, ptr noundef nonnull align 8 dereferenceable(24) %sret.actual.46, i64 24, i1 false)
  call void @go_0llvm.SubTypeSignature(ptr nonnull %sret.actual.47, ptr nest undef, ptr nonnull byval(%IPST.0) %sigs12, i16 zeroext %call.8)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %sigs12, ptr noundef nonnull align 8 dereferenceable(24) %sret.actual.47, i64 24, i1 false)
  %tmpv.268.sroa.0.0.copyload1447 = load ptr, ptr %sigs12, align 8
  %tmpv.268.sroa.2.0.cast.1939.sroa_idx90 = getelementptr inbounds %IPST.0, ptr %sigs12, i64 0, i32 1
  %tmpv.268.sroa.2.0.copyload = load i64, ptr %tmpv.268.sroa.2.0.cast.1939.sroa_idx90, align 8
  %add.13 = add i64 %tmpv.268.sroa.2.0.copyload, %rrs8.sroa.10.0.copyload
  %icmp.95 = icmp ugt i64 %add.13, %rrs8.sroa.14.0.copyload
  br i1 %icmp.95, label %then.102, label %fallthrough.102

then.99:                                          ; preds = %then.98
  call void @runtime.growslice(ptr nonnull %sret.actual.45, ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %auth.sroa.0.0.copyload, i64 %auth.sroa.10.0.copyload, i64 %auth.sroa.13.0.copyload, i64 %add.12)
  %auth.sroa.0.0.copyload184 = load ptr, ptr %sret.actual.45, align 8
  %21 = getelementptr inbounds { ptr, i64, i64 }, ptr %sret.actual.45, i64 0, i32 1
  %auth.sroa.10.0.copyload191 = load i64, ptr %21, align 8
  %22 = getelementptr inbounds { ptr, i64, i64 }, ptr %sret.actual.45, i64 0, i32 2
  %auth.sroa.13.0.copyload199 = load i64, ptr %22, align 8
  br label %fallthrough.99

fallthrough.99:                                   ; preds = %then.99, %then.98
  %auth.sroa.0.2 = phi ptr [ %auth.sroa.0.0.copyload184, %then.99 ], [ %auth.sroa.0.0.copyload, %then.98 ]
  %auth.sroa.10.2 = phi i64 [ %auth.sroa.10.0.copyload191, %then.99 ], [ %add.12, %then.98 ]
  %auth.sroa.13.2 = phi i64 [ %auth.sroa.13.0.copyload199, %then.99 ], [ %auth.sroa.13.0.copyload, %then.98 ]
  %icmp.93 = icmp eq i64 %auth.sroa.13.2, %auth.sroa.10.0.copyload
  %.auth.sroa.10.0.copyload = select i1 %icmp.93, i64 0, i64 %auth.sroa.10.0.copyload
  %ptroff.14 = getelementptr %RR.0, ptr %auth.sroa.0.2, i64 %.auth.sroa.10.0.copyload
  %sub.40 = sub i64 %auth.sroa.10.2, %auth.sroa.10.0.copyload
  %call.42 = call i64 @runtime.typedslicecopy(ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %ptroff.14, i64 %sub.40, ptr %nsec14.sroa.0.0.copyload1448, i64 %nsec14.sroa.4.0.copyload)
  br label %fallthrough.98

then.102:                                         ; preds = %fallthrough.98
  call void @runtime.growslice(ptr nonnull %sret.actual.48, ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %rrs8.sroa.0.0.copyload, i64 %rrs8.sroa.10.0.copyload, i64 %rrs8.sroa.14.0.copyload, i64 %add.13)
  %rrs8.sroa.0.0.copyload208 = load ptr, ptr %sret.actual.48, align 8
  %23 = getelementptr inbounds { ptr, i64, i64 }, ptr %sret.actual.48, i64 0, i32 1
  %rrs8.sroa.10.0.copyload215 = load i64, ptr %23, align 8
  %24 = getelementptr inbounds { ptr, i64, i64 }, ptr %sret.actual.48, i64 0, i32 2
  %rrs8.sroa.14.0.copyload223 = load i64, ptr %24, align 8
  br label %fallthrough.102

fallthrough.102:                                  ; preds = %then.102, %fallthrough.98
  %rrs8.sroa.0.1 = phi ptr [ %rrs8.sroa.0.0.copyload208, %then.102 ], [ %rrs8.sroa.0.0.copyload, %fallthrough.98 ]
  %rrs8.sroa.10.1 = phi i64 [ %rrs8.sroa.10.0.copyload215, %then.102 ], [ %add.13, %fallthrough.98 ]
  %rrs8.sroa.14.1 = phi i64 [ %rrs8.sroa.14.0.copyload223, %then.102 ], [ %rrs8.sroa.14.0.copyload, %fallthrough.98 ]
  %icmp.96 = icmp eq i64 %rrs8.sroa.14.1, %rrs8.sroa.10.0.copyload
  %.rrs8.sroa.10.0.copyload = select i1 %icmp.96, i64 0, i64 %rrs8.sroa.10.0.copyload
  %ptroff.16 = getelementptr %RR.0, ptr %rrs8.sroa.0.1, i64 %.rrs8.sroa.10.0.copyload
  %sub.46 = sub i64 %rrs8.sroa.10.1, %rrs8.sroa.10.0.copyload
  %call.43 = call i64 @runtime.typedslicecopy(ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %ptroff.16, i64 %sub.46, ptr %tmpv.268.sroa.0.0.copyload1447, i64 %tmpv.268.sroa.2.0.copyload)
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %sigs12)
  br label %fallthrough.97

then.105:                                         ; preds = %else.88
  %call.44.fca.0.extract = extractvalue { ptr, i8 } %call.44, 0
  %call.45 = call { ptr, i64 } @go_0llvm.Elem.Name(ptr nest undef, ptr %call.44.fca.0.extract)
  %call.45.fca.0.extract = extractvalue { ptr, i64 } %call.45, 0
  %call.45.fca.1.extract = extractvalue { ptr, i64 } %call.45, 1
  %call.46 = call i8 @go_0llvm.IsSubDomain(ptr nest undef, ptr %qname.chunk0, i64 %qname.chunk1, ptr %call.45.fca.0.extract, i64 %call.45.fca.1.extract)
  %25 = and i8 %call.46, 1
  %trunc.107.not = icmp eq i8 %25, 0
  %26 = xor i8 %25, 1
  %27 = zext i8 %26 to i64
  br label %fallthrough.105

fallthrough.105:                                  ; preds = %then.105, %else.88
  %icmp.102.not = phi i1 [ true, %else.88 ], [ %trunc.107.not, %then.105 ]
  %rcode.0 = phi i64 [ 1, %else.88 ], [ %27, %then.105 ]
  call void @go_0llvm.Apex.soa(ptr nonnull %sret.actual.51, ptr nest poison, ptr nonnull %ap, i8 zeroext %call.9)
  %ret.sroa.0.0.copyload = load ptr, ptr %sret.actual.51, align 8
  %ret.sroa.25.0.cast.1980.sroa_idx469 = getelementptr inbounds %IPST.0, ptr %sret.actual.51, i64 0, i32 1
  %ret.sroa.25.0.copyload = load i64, ptr %ret.sroa.25.0.cast.1980.sroa_idx469, align 8
  %ret.sroa.31.0.cast.1980.sroa_idx490 = getelementptr inbounds %IPST.0, ptr %sret.actual.51, i64 0, i32 2
  %ret.sroa.31.0.copyload = load i64, ptr %ret.sroa.31.0.cast.1980.sroa_idx490, align 8
  %28 = and i8 %call.9, 1
  %trunc.122.not = icmp eq i8 %28, 0
  br i1 %trunc.122.not, label %label.4, label %then.107

then.107:                                         ; preds = %fallthrough.105
  %call.47 = call { ptr, i8 } @go_0llvm.Tree.Prev(ptr nest undef, ptr %.field.ld.9, ptr %qname.chunk0, i64 %qname.chunk1)
  %call.47.fca.0.extract = extractvalue { ptr, i8 } %call.47, 0
  %call.47.fca.1.extract = extractvalue { ptr, i8 } %call.47, 1
  %icmp.98.not = icmp eq i8 %call.47.fca.1.extract, 0
  br i1 %icmp.98.not, label %label.4, label %else.108

else.108:                                         ; preds = %then.107
  call fastcc void @go_0llvm.typeFromElem(ptr nonnull %sret.actual.53, ptr %call.47.fca.0.extract, i16 zeroext 47, i8 zeroext %call.9)
  %nsec18.sroa.0.0.copyload1445 = load ptr, ptr %sret.actual.53, align 8
  %nsec18.sroa.4.0.cast.1986.sroa_idx79 = getelementptr inbounds %IPST.0, ptr %sret.actual.53, i64 0, i32 1
  %nsec18.sroa.4.0.copyload = load i64, ptr %nsec18.sroa.4.0.cast.1986.sroa_idx79, align 8
  %add.14 = add i64 %nsec18.sroa.4.0.copyload, %ret.sroa.25.0.copyload
  %icmp.100 = icmp ugt i64 %add.14, %ret.sroa.31.0.copyload
  br i1 %icmp.100, label %then.109, label %fallthrough.109

label.4:                                          ; preds = %fallthrough.118, %else.116, %then.115, %then.113, %else.112, %fallthrough.109, %then.107, %fallthrough.105
  %ret.sroa.0.0 = phi ptr [ %ret.sroa.0.0.copyload, %then.107 ], [ %ret.sroa.0.1, %fallthrough.109 ], [ %ret.sroa.0.0.copyload, %fallthrough.105 ], [ %ret.sroa.0.1, %else.112 ], [ %ret.sroa.0.4, %fallthrough.118 ], [ %ret.sroa.0.1, %else.116 ], [ %ret.sroa.0.1, %then.113 ], [ %ret.sroa.0.1, %then.115 ]
  %ret.sroa.25.0 = phi i64 [ %ret.sroa.25.0.copyload, %then.107 ], [ %ret.sroa.25.1, %fallthrough.109 ], [ %ret.sroa.25.0.copyload, %fallthrough.105 ], [ %ret.sroa.25.1, %else.112 ], [ %ret.sroa.25.4, %fallthrough.118 ], [ %ret.sroa.25.1, %else.116 ], [ %ret.sroa.25.1, %then.113 ], [ %ret.sroa.25.1, %then.115 ]
  %ret.sroa.31.0 = phi i64 [ %ret.sroa.31.0.copyload, %then.107 ], [ %ret.sroa.31.1, %fallthrough.109 ], [ %ret.sroa.31.0.copyload, %fallthrough.105 ], [ %ret.sroa.31.1, %else.112 ], [ %ret.sroa.31.4, %fallthrough.118 ], [ %ret.sroa.31.1, %else.116 ], [ %ret.sroa.31.1, %then.113 ], [ %ret.sroa.31.1, %then.115 ]
  %tmp.22.sroa.7.0.cast.2056.sroa_idx = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 2
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmp.22.sroa.7.0.cast.2056.sroa_idx, i8 0, i64 24, i1 false)
  %tmp.22.sroa.4.0.cast.2056.sroa_idx1424 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 1, i32 0
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %sret.formal.0, i8 0, i64 24, i1 false)
  store ptr %ret.sroa.0.0, ptr %tmp.22.sroa.4.0.cast.2056.sroa_idx1424, align 8
  %tmp.22.sroa.5.0.cast.2056.sroa_idx1425 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 1, i32 1
  store i64 %ret.sroa.25.0, ptr %tmp.22.sroa.5.0.cast.2056.sroa_idx1425, align 8
  %tmp.22.sroa.6.0.cast.2056.sroa_idx1426 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 1, i32 2
  store i64 %ret.sroa.31.0, ptr %tmp.22.sroa.6.0.cast.2056.sroa_idx1426, align 8
  %tmp.22.sroa.8.0.cast.2056.sroa_idx1427 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.0, i64 0, i32 3
  store i64 %rcode.0, ptr %tmp.22.sroa.8.0.cast.2056.sroa_idx1427, align 8
  call void @llvm.lifetime.end.p0(i64 80, ptr nonnull %ap)
  br label %common.ret

then.109:                                         ; preds = %else.108
  call void @runtime.growslice(ptr nonnull %sret.actual.54, ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %ret.sroa.0.0.copyload, i64 %ret.sroa.25.0.copyload, i64 %ret.sroa.31.0.copyload, i64 %add.14)
  %ret.sroa.0.0.copyload452 = load ptr, ptr %sret.actual.54, align 8
  %29 = getelementptr inbounds { ptr, i64, i64 }, ptr %sret.actual.54, i64 0, i32 1
  %ret.sroa.25.0.copyload471 = load i64, ptr %29, align 8
  %30 = getelementptr inbounds { ptr, i64, i64 }, ptr %sret.actual.54, i64 0, i32 2
  %ret.sroa.31.0.copyload492 = load i64, ptr %30, align 8
  br label %fallthrough.109

fallthrough.109:                                  ; preds = %then.109, %else.108
  %ret.sroa.0.1 = phi ptr [ %ret.sroa.0.0.copyload452, %then.109 ], [ %ret.sroa.0.0.copyload, %else.108 ]
  %ret.sroa.25.1 = phi i64 [ %ret.sroa.25.0.copyload471, %then.109 ], [ %add.14, %else.108 ]
  %ret.sroa.31.1 = phi i64 [ %ret.sroa.31.0.copyload492, %then.109 ], [ %ret.sroa.31.0.copyload, %else.108 ]
  %icmp.101 = icmp eq i64 %ret.sroa.31.1, %ret.sroa.25.0.copyload
  %.ret.sroa.25.0.copyload = select i1 %icmp.101, i64 0, i64 %ret.sroa.25.0.copyload
  %ptroff.18 = getelementptr %RR.0, ptr %ret.sroa.0.1, i64 %.ret.sroa.25.0.copyload
  %sub.52 = sub i64 %ret.sroa.25.1, %ret.sroa.25.0.copyload
  %call.48 = call i64 @runtime.typedslicecopy(ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %ptroff.18, i64 %sub.52, ptr %nsec18.sroa.0.0.copyload1445, i64 %nsec18.sroa.4.0.copyload)
  br i1 %icmp.102.not, label %else.112, label %label.4

else.112:                                         ; preds = %fallthrough.109
  %call.49 = call { ptr, i8 } @go_0llvm.Zone.ClosestEncloser(ptr nest undef, ptr nonnull %z, ptr %qname.chunk0, i64 %qname.chunk1)
  %call.49.fca.1.extract = extractvalue { ptr, i8 } %call.49, 1
  %31 = and i8 %call.49.fca.1.extract, 1
  %trunc.121.not = icmp eq i8 %31, 0
  br i1 %trunc.121.not, label %label.4, label %then.113

then.113:                                         ; preds = %else.112
  %call.49.fca.0.extract = extractvalue { ptr, i8 } %call.49, 0
  %call.50 = call { ptr, i64 } @go_0llvm.Elem.Name(ptr nest undef, ptr %call.49.fca.0.extract)
  %call.50.fca.0.extract = extractvalue { ptr, i64 } %call.50, 0
  %call.50.fca.1.extract = extractvalue { ptr, i64 } %call.50, 1
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %tmpv.299, ptr noundef nonnull align 8 dereferenceable(16) @const.423, i64 16, i1 false)
  %sret.actual.56.sroa.0.0.cast.2007.sroa_idx = getelementptr inbounds [2 x { ptr, i64 }], ptr %tmpv.299, i64 0, i64 1, i32 0
  store ptr %call.50.fca.0.extract, ptr %sret.actual.56.sroa.0.0.cast.2007.sroa_idx, align 8
  %sret.actual.56.sroa.2.0.cast.2007.sroa_idx53 = getelementptr inbounds [2 x { ptr, i64 }], ptr %tmpv.299, i64 0, i64 1, i32 1
  store i64 %call.50.fca.1.extract, ptr %sret.actual.56.sroa.2.0.cast.2007.sroa_idx53, align 8
  %call.51 = call { ptr, i64 } @runtime.concatstrings(ptr nest undef, ptr null, ptr nonnull %tmpv.299, i64 2)
  %call.51.fca.0.extract = extractvalue { ptr, i64 } %call.51, 0
  %call.51.fca.1.extract = extractvalue { ptr, i64 } %call.51, 1
  %call.52 = call { ptr, i8 } @go_0llvm.Tree.Prev(ptr nest undef, ptr %.field.ld.9, ptr %call.51.fca.0.extract, i64 %call.51.fca.1.extract)
  %call.52.fca.0.extract = extractvalue { ptr, i8 } %call.52, 0
  %call.52.fca.1.extract = extractvalue { ptr, i8 } %call.52, 1
  %32 = and i8 %call.52.fca.1.extract, 1
  %trunc.120.not = icmp eq i8 %32, 0
  br i1 %trunc.120.not, label %label.4, label %then.114

then.114:                                         ; preds = %then.113
  %call.53 = call { ptr, i64 } @go_0llvm.Elem.Name(ptr nest undef, ptr %call.52.fca.0.extract)
  %call.53.fca.0.extract = extractvalue { ptr, i64 } %call.53, 0
  %call.53.fca.1.extract = extractvalue { ptr, i64 } %call.53, 1
  %call.54 = call { ptr, i64 } @go_0llvm.Elem.Name(ptr nest undef, ptr %call.47.fca.0.extract)
  %call.54.fca.0.extract = extractvalue { ptr, i64 } %call.54, 0
  %call.54.fca.1.extract = extractvalue { ptr, i64 } %call.54, 1
  %icmp.106 = icmp eq i64 %call.53.fca.1.extract, %call.54.fca.1.extract
  br i1 %icmp.106, label %then.115, label %then.117

then.115:                                         ; preds = %then.114
  %icmp.107 = icmp eq ptr %call.53.fca.0.extract, %call.54.fca.0.extract
  br i1 %icmp.107, label %label.4, label %else.116

else.116:                                         ; preds = %then.115
  %bcmp = call i32 @bcmp(ptr %call.53.fca.0.extract, ptr %call.54.fca.0.extract, i64 %call.53.fca.1.extract)
  %icmp.108 = icmp eq i32 %bcmp, 0
  br i1 %icmp.108, label %label.4, label %then.117

then.117:                                         ; preds = %else.116, %then.114
  call fastcc void @go_0llvm.typeFromElem(ptr nonnull %sret.actual.61, ptr %call.52.fca.0.extract, i16 zeroext 47, i8 zeroext %call.9)
  %nsec21.sroa.0.0.copyload1446 = load ptr, ptr %sret.actual.61, align 8
  %nsec21.sroa.4.0.cast.2025.sroa_idx44 = getelementptr inbounds %IPST.0, ptr %sret.actual.61, i64 0, i32 1
  %nsec21.sroa.4.0.copyload = load i64, ptr %nsec21.sroa.4.0.cast.2025.sroa_idx44, align 8
  %add.15 = add i64 %nsec21.sroa.4.0.copyload, %ret.sroa.25.1
  %icmp.104 = icmp ugt i64 %add.15, %ret.sroa.31.1
  br i1 %icmp.104, label %then.118, label %fallthrough.118

then.118:                                         ; preds = %then.117
  call void @runtime.growslice(ptr nonnull %sret.actual.62, ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %ret.sroa.0.1, i64 %ret.sroa.25.1, i64 %ret.sroa.31.1, i64 %add.15)
  %ret.sroa.0.0.copyload453 = load ptr, ptr %sret.actual.62, align 8
  %33 = getelementptr inbounds { ptr, i64, i64 }, ptr %sret.actual.62, i64 0, i32 1
  %ret.sroa.25.0.copyload473 = load i64, ptr %33, align 8
  %34 = getelementptr inbounds { ptr, i64, i64 }, ptr %sret.actual.62, i64 0, i32 2
  %ret.sroa.31.0.copyload494 = load i64, ptr %34, align 8
  br label %fallthrough.118

fallthrough.118:                                  ; preds = %then.118, %then.117
  %ret.sroa.0.4 = phi ptr [ %ret.sroa.0.0.copyload453, %then.118 ], [ %ret.sroa.0.1, %then.117 ]
  %ret.sroa.25.4 = phi i64 [ %ret.sroa.25.0.copyload473, %then.118 ], [ %add.15, %then.117 ]
  %ret.sroa.31.4 = phi i64 [ %ret.sroa.31.0.copyload494, %then.118 ], [ %ret.sroa.31.1, %then.117 ]
  %icmp.105 = icmp eq i64 %ret.sroa.31.4, %ret.sroa.25.1
  %.ret.sroa.25.1 = select i1 %icmp.105, i64 0, i64 %ret.sroa.25.1
  %ptroff.20 = getelementptr %RR.0, ptr %ret.sroa.0.4, i64 %.ret.sroa.25.1
  %sub.58 = sub i64 %ret.sroa.25.4, %ret.sroa.25.1
  %call.55 = call i64 @runtime.typedslicecopy(ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %ptroff.20, i64 %sub.58, ptr %nsec21.sroa.0.0.copyload1446, i64 %nsec21.sroa.4.0.copyload)
  br label %label.4
}

define void @go_0llvm.Zone.RLock..stub(ptr nest nocapture readnone %nest.45, ptr %"$this290") #0 {
entry:
  %icmp.264 = icmp eq ptr %"$this290", null
  br i1 %icmp.264, label %then.274, label %else.274, !make.implicit !3

then.274:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.274:                                         ; preds = %entry
  %field.879 = getelementptr inbounds %Zone.0, ptr %"$this290", i64 0, i32 6
  call void @sync.RWMutex.RLock(ptr nest undef, ptr nonnull %field.879)
  ret void
}

define { ptr, ptr } @go_0llvm.Zone.RLocker..stub(ptr nest nocapture readnone %nest.36, ptr %"$this274") #0 {
entry:
  %icmp.255 = icmp eq ptr %"$this274", null
  br i1 %icmp.255, label %then.265, label %else.265, !make.implicit !3

then.265:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.265:                                         ; preds = %entry
  %field.858 = getelementptr inbounds %Zone.0, ptr %"$this274", i64 0, i32 6
  %ld.124.fca.1.insert.i = insertvalue { ptr, ptr } { ptr @pimt..interface_4Lock_bfunc_8_9_8_9_cUnlock_bfunc_8_9_8_9_5..sync.rlocker, ptr undef }, ptr %field.858, 1
  ret { ptr, ptr } %ld.124.fca.1.insert.i
}

define void @go_0llvm.Zone.RUnlock..stub(ptr nest nocapture readnone %nest.41, ptr %"$this283") #0 {
entry:
  %icmp.260 = icmp eq ptr %"$this283", null
  br i1 %icmp.260, label %then.270, label %else.270, !make.implicit !3

then.270:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.270:                                         ; preds = %entry
  %field.867 = getelementptr inbounds %Zone.0, ptr %"$this283", i64 0, i32 6
  call void @sync.RWMutex.RUnlock(ptr nest undef, ptr nonnull %field.867)
  ret void
}

define void @go_0llvm.Zone.Unlock..stub(ptr nest nocapture readnone %nest.35, ptr %"$this273") #0 {
entry:
  %icmp.254 = icmp eq ptr %"$this273", null
  br i1 %icmp.254, label %then.264, label %else.264, !make.implicit !3

then.264:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.264:                                         ; preds = %entry
  %field.857 = getelementptr inbounds %Zone.0, ptr %"$this273", i64 0, i32 6
  call void @sync.RWMutex.Unlock(ptr nest undef, ptr nonnull %field.857)
  ret void
}

define void @go_0llvm.Zone.additionalProcessing(ptr nocapture writeonly sret(%IPST.0) %sret.formal.6, ptr nest nocapture readnone %nest.20, ptr readonly %z, ptr nocapture readonly byval(%IPST.0) %answer, i8 zeroext %do) #0 {
entry:
  %sigs = alloca %IPST.0, align 8
  %sret.actual.95 = alloca %IPST.0, align 8
  %sret.actual.96 = alloca %IPST.0, align 8
  %sret.actual.97 = alloca { ptr, i64, i64 }, align 8
  %sret.actual.98 = alloca %IPST.0, align 8
  %sret.actual.99 = alloca { ptr, i64, i64 }, align 8
  %tmpv.511.sroa.0.0.copyload = load ptr, ptr %answer, align 8
  %tmpv.511.sroa.2.0.cast.2540.sroa_idx82 = getelementptr inbounds %IPST.0, ptr %answer, i64 0, i32 1
  %tmpv.511.sroa.2.0.copyload = load i64, ptr %tmpv.511.sroa.2.0.cast.2540.sroa_idx82, align 8
  %icmp.200 = icmp eq ptr %z, null
  %field1.44 = getelementptr inbounds %Zone.0, ptr %z, i64 0, i32 0, i32 1
  %field.762 = getelementptr inbounds %Zone.0, ptr %z, i64 0, i32 3
  %a.sroa.5.0.cast.2594.sroa_idx50 = getelementptr inbounds %IPST.0, ptr %sret.actual.96, i64 0, i32 1
  %0 = getelementptr inbounds { ptr, i64, i64 }, ptr %sret.actual.97, i64 0, i32 1
  %1 = getelementptr inbounds { ptr, i64, i64 }, ptr %sret.actual.97, i64 0, i32 2
  %2 = and i8 %do, 1
  %trunc.225.not = icmp eq i8 %2, 0
  %sig.sroa.4.0.cast.2610.sroa_idx24 = getelementptr inbounds %IPST.0, ptr %sret.actual.98, i64 0, i32 1
  %3 = getelementptr inbounds { ptr, i64, i64 }, ptr %sret.actual.99, i64 0, i32 1
  %4 = getelementptr inbounds { ptr, i64, i64 }, ptr %sret.actual.99, i64 0, i32 2
  %icmp.215161 = icmp sgt i64 %tmpv.511.sroa.2.0.copyload, 0
  br i1 %icmp.215161, label %then.225, label %else.225

fallthrough.199:                                  ; preds = %then.225
  %.field.ld.61 = load ptr, ptr %tmpv.510.sroa.0.0.copyload, align 8
  %icmp.187.not = icmp eq ptr %.field.ld.61, @go_0llvm.SRV..p
  br i1 %icmp.187.not, label %fallthrough.202, label %label.2

label.2:                                          ; preds = %fallthrough.199
  %icmp.193.not = icmp eq ptr %.field.ld.61, @go_0llvm.MX..p
  br i1 %icmp.193.not, label %fallthrough.207, label %label.5

fallthrough.202:                                  ; preds = %fallthrough.199
  %icmp.192 = icmp eq ptr %tmpv.510.sroa.2.0.copyload, null
  br i1 %icmp.192, label %then.204, label %label.3, !make.implicit !3

then.204:                                         ; preds = %fallthrough.202
  call void @runtime.panicmem(ptr nest undef)
  unreachable

label.3:                                          ; preds = %fallthrough.202, %fallthrough.207
  %name.sroa.0.0.cast.2577.sroa_idx = getelementptr inbounds i8, ptr %tmpv.510.sroa.2.0.copyload, i64 40
  %name.sroa.0.0.copyload72 = load ptr, ptr %name.sroa.0.0.cast.2577.sroa_idx, align 8
  %name.sroa.7.0.cast.2577.sroa_idx76 = getelementptr inbounds i8, ptr %tmpv.510.sroa.2.0.copyload, i64 48
  %name.sroa.7.0.copyload77 = load i64, ptr %name.sroa.7.0.cast.2577.sroa_idx76, align 8
  %icmp.199 = icmp eq i64 %name.sroa.7.0.copyload77, 0
  br i1 %icmp.199, label %label.5, label %then.210

fallthrough.207:                                  ; preds = %label.2
  %icmp.198 = icmp eq ptr %tmpv.510.sroa.2.0.copyload, null
  br i1 %icmp.198, label %then.209, label %label.3, !make.implicit !3

then.209:                                         ; preds = %fallthrough.207
  call void @runtime.panicmem(ptr nest undef)
  unreachable

then.210:                                         ; preds = %label.3
  br i1 %icmp.200, label %then.211, label %else.211, !make.implicit !3

then.211:                                         ; preds = %then.210
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.211:                                         ; preds = %then.210
  %ld.85 = load ptr, ptr %z, align 8
  %ld.86 = load i64, ptr %field1.44, align 8
  %call.76 = call i8 @go_0llvm.IsSubDomain(ptr nest undef, ptr %ld.85, i64 %ld.86, ptr %name.sroa.0.0.copyload72, i64 %name.sroa.7.0.copyload77)
  %icmp.201.not = icmp eq i8 %call.76, 0
  br i1 %icmp.201.not, label %label.5, label %else.213

label.5:                                          ; preds = %then.225, %label.2, %label.3, %fallthrough.216.1, %else.213, %else.211
  %extra.sroa.0.1 = phi ptr [ %extra.sroa.0.0163, %else.211 ], [ %extra.sroa.0.0163, %else.213 ], [ %extra.sroa.0.3.1, %fallthrough.216.1 ], [ %extra.sroa.0.0163, %label.3 ], [ %extra.sroa.0.0163, %label.2 ], [ %extra.sroa.0.0163, %then.225 ]
  %extra.sroa.12.1 = phi i64 [ %extra.sroa.12.0164, %else.211 ], [ %extra.sroa.12.0164, %else.213 ], [ %extra.sroa.12.3.1, %fallthrough.216.1 ], [ %extra.sroa.12.0164, %label.3 ], [ %extra.sroa.12.0164, %label.2 ], [ %extra.sroa.12.0164, %then.225 ]
  %extra.sroa.18.1 = phi i64 [ %extra.sroa.18.0165, %else.211 ], [ %extra.sroa.18.0165, %else.213 ], [ %extra.sroa.18.3.1, %fallthrough.216.1 ], [ %extra.sroa.18.0165, %label.3 ], [ %extra.sroa.18.0165, %label.2 ], [ %extra.sroa.18.0165, %then.225 ]
  %add.30 = add nuw nsw i64 %tmpv.509.0162, 1
  %exitcond.not = icmp eq i64 %add.30, %tmpv.511.sroa.2.0.copyload
  br i1 %exitcond.not, label %else.225, label %then.225

else.213:                                         ; preds = %else.211
  %.field.ld.66 = load ptr, ptr %field.762, align 8
  %call.77 = call { ptr, i8 } @go_0llvm.Tree.Search(ptr nest undef, ptr %.field.ld.66, ptr %name.sroa.0.0.copyload72, i64 %name.sroa.7.0.copyload77)
  %call.77.fca.0.extract = extractvalue { ptr, i8 } %call.77, 0
  %icmp.204 = icmp eq ptr %call.77.fca.0.extract, null
  br i1 %icmp.204, label %label.5, label %else.214

else.214:                                         ; preds = %else.213
  call void @go_0llvm.Elem.Type(ptr nonnull %sret.actual.95, ptr nest undef, ptr nonnull %call.77.fca.0.extract, i16 zeroext 46)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %sigs, ptr noundef nonnull align 8 dereferenceable(24) %sret.actual.95, i64 24, i1 false)
  call void @go_0llvm.Elem.Type(ptr nonnull %sret.actual.96, ptr nest undef, ptr nonnull %call.77.fca.0.extract, i16 zeroext 1)
  %a.sroa.0.0.copyload = load ptr, ptr %sret.actual.96, align 8
  %a.sroa.5.0.copyload = load i64, ptr %a.sroa.5.0.cast.2594.sroa_idx50, align 8
  %icmp.213.not = icmp eq ptr %a.sroa.0.0.copyload, null
  br i1 %icmp.213.not, label %fallthrough.216, label %then.216

then.216:                                         ; preds = %else.214
  %add.27 = add i64 %a.sroa.5.0.copyload, %extra.sroa.12.0164
  %icmp.208 = icmp ugt i64 %add.27, %extra.sroa.18.0165
  br i1 %icmp.208, label %then.217, label %fallthrough.217

fallthrough.216:                                  ; preds = %fallthrough.221, %fallthrough.217, %else.214
  %extra.sroa.0.3 = phi ptr [ %extra.sroa.0.5, %fallthrough.221 ], [ %extra.sroa.0.4, %fallthrough.217 ], [ %extra.sroa.0.0163, %else.214 ]
  %extra.sroa.12.3 = phi i64 [ %extra.sroa.12.5, %fallthrough.221 ], [ %extra.sroa.12.4, %fallthrough.217 ], [ %extra.sroa.12.0164, %else.214 ]
  %extra.sroa.18.3 = phi i64 [ %extra.sroa.18.5, %fallthrough.221 ], [ %extra.sroa.18.4, %fallthrough.217 ], [ %extra.sroa.18.0165, %else.214 ]
  call void @go_0llvm.Elem.Type(ptr nonnull %sret.actual.96, ptr nest undef, ptr nonnull %call.77.fca.0.extract, i16 zeroext 28)
  %a.sroa.0.0.copyload.1 = load ptr, ptr %sret.actual.96, align 8
  %a.sroa.5.0.copyload.1 = load i64, ptr %a.sroa.5.0.cast.2594.sroa_idx50, align 8
  %icmp.213.not.1 = icmp eq ptr %a.sroa.0.0.copyload.1, null
  br i1 %icmp.213.not.1, label %fallthrough.216.1, label %then.216.1

then.217:                                         ; preds = %then.216
  call void @runtime.growslice(ptr nonnull %sret.actual.97, ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %extra.sroa.0.0163, i64 %extra.sroa.12.0164, i64 %extra.sroa.18.0165, i64 %add.27)
  %extra.sroa.0.0.copyload = load ptr, ptr %sret.actual.97, align 8
  %extra.sroa.12.0.copyload = load i64, ptr %0, align 8
  %extra.sroa.18.0.copyload = load i64, ptr %1, align 8
  br label %fallthrough.217

fallthrough.217:                                  ; preds = %then.217, %then.216
  %extra.sroa.0.4 = phi ptr [ %extra.sroa.0.0.copyload, %then.217 ], [ %extra.sroa.0.0163, %then.216 ]
  %extra.sroa.12.4 = phi i64 [ %extra.sroa.12.0.copyload, %then.217 ], [ %add.27, %then.216 ]
  %extra.sroa.18.4 = phi i64 [ %extra.sroa.18.0.copyload, %then.217 ], [ %extra.sroa.18.0165, %then.216 ]
  %icmp.209 = icmp eq i64 %extra.sroa.18.4, %extra.sroa.12.0164
  %.extra.sroa.12.2 = select i1 %icmp.209, i64 0, i64 %extra.sroa.12.0164
  %ptroff.46 = getelementptr %RR.0, ptr %extra.sroa.0.4, i64 %.extra.sroa.12.2
  %sub.124 = sub i64 %extra.sroa.12.4, %extra.sroa.12.0164
  %call.78 = call i64 @runtime.typedslicecopy(ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %ptroff.46, i64 %sub.124, ptr nonnull %a.sroa.0.0.copyload, i64 %a.sroa.5.0.copyload)
  br i1 %trunc.225.not, label %fallthrough.216, label %then.220

then.220:                                         ; preds = %fallthrough.217
  call void @go_0llvm.SubTypeSignature(ptr nonnull %sret.actual.98, ptr nest undef, ptr nonnull byval(%IPST.0) %sigs, i16 zeroext 1)
  %sig.sroa.0.0.copyload118 = load ptr, ptr %sret.actual.98, align 8
  %sig.sroa.4.0.copyload = load i64, ptr %sig.sroa.4.0.cast.2610.sroa_idx24, align 8
  %add.28 = add i64 %sig.sroa.4.0.copyload, %extra.sroa.12.4
  %icmp.211 = icmp ugt i64 %add.28, %extra.sroa.18.4
  br i1 %icmp.211, label %then.221, label %fallthrough.221

then.221:                                         ; preds = %then.220
  call void @runtime.growslice(ptr nonnull %sret.actual.99, ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %extra.sroa.0.4, i64 %extra.sroa.12.4, i64 %extra.sroa.18.4, i64 %add.28)
  %extra.sroa.0.0.copyload97 = load ptr, ptr %sret.actual.99, align 8
  %extra.sroa.12.0.copyload103 = load i64, ptr %3, align 8
  %extra.sroa.18.0.copyload110 = load i64, ptr %4, align 8
  br label %fallthrough.221

fallthrough.221:                                  ; preds = %then.221, %then.220
  %extra.sroa.0.5 = phi ptr [ %extra.sroa.0.0.copyload97, %then.221 ], [ %extra.sroa.0.4, %then.220 ]
  %extra.sroa.12.5 = phi i64 [ %extra.sroa.12.0.copyload103, %then.221 ], [ %add.28, %then.220 ]
  %extra.sroa.18.5 = phi i64 [ %extra.sroa.18.0.copyload110, %then.221 ], [ %extra.sroa.18.4, %then.220 ]
  %icmp.212 = icmp eq i64 %extra.sroa.18.5, %extra.sroa.12.4
  %.extra.sroa.12.4 = select i1 %icmp.212, i64 0, i64 %extra.sroa.12.4
  %ptroff.48 = getelementptr %RR.0, ptr %extra.sroa.0.5, i64 %.extra.sroa.12.4
  %sub.130 = sub i64 %extra.sroa.12.5, %extra.sroa.12.4
  %call.79 = call i64 @runtime.typedslicecopy(ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %ptroff.48, i64 %sub.130, ptr %sig.sroa.0.0.copyload118, i64 %sig.sroa.4.0.copyload)
  br label %fallthrough.216

then.225:                                         ; preds = %entry, %label.5
  %extra.sroa.18.0165 = phi i64 [ %extra.sroa.18.1, %label.5 ], [ 0, %entry ]
  %extra.sroa.12.0164 = phi i64 [ %extra.sroa.12.1, %label.5 ], [ 0, %entry ]
  %extra.sroa.0.0163 = phi ptr [ %extra.sroa.0.1, %label.5 ], [ null, %entry ]
  %tmpv.509.0162 = phi i64 [ %add.30, %label.5 ], [ 0, %entry ]
  %tmpv.510.sroa.0.0.cast.2542.sroa_idx = getelementptr %RR.0, ptr %tmpv.511.sroa.0.0.copyload, i64 %tmpv.509.0162, i32 0
  %tmpv.510.sroa.0.0.copyload = load ptr, ptr %tmpv.510.sroa.0.0.cast.2542.sroa_idx, align 8
  %tmpv.510.sroa.2.0.cast.2542.sroa_idx96 = getelementptr %RR.0, ptr %tmpv.511.sroa.0.0.copyload, i64 %tmpv.509.0162, i32 1
  %tmpv.510.sroa.2.0.copyload = load ptr, ptr %tmpv.510.sroa.2.0.cast.2542.sroa_idx96, align 8
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %sigs)
  %icmp.186 = icmp eq ptr %tmpv.510.sroa.0.0.copyload, null
  br i1 %icmp.186, label %label.5, label %fallthrough.199

else.225:                                         ; preds = %label.5, %entry
  %extra.sroa.0.0.lcssa = phi ptr [ null, %entry ], [ %extra.sroa.0.1, %label.5 ]
  %extra.sroa.12.0.lcssa = phi i64 [ 0, %entry ], [ %extra.sroa.12.1, %label.5 ]
  %extra.sroa.18.0.lcssa = phi i64 [ 0, %entry ], [ %extra.sroa.18.1, %label.5 ]
  store ptr %extra.sroa.0.0.lcssa, ptr %sret.formal.6, align 8
  %extra.sroa.12.0.cast.2628.sroa_idx104 = getelementptr inbounds %IPST.0, ptr %sret.formal.6, i64 0, i32 1
  store i64 %extra.sroa.12.0.lcssa, ptr %extra.sroa.12.0.cast.2628.sroa_idx104, align 8
  %extra.sroa.18.0.cast.2628.sroa_idx111 = getelementptr inbounds %IPST.0, ptr %sret.formal.6, i64 0, i32 2
  store i64 %extra.sroa.18.0.lcssa, ptr %extra.sroa.18.0.cast.2628.sroa_idx111, align 8
  ret void

then.216.1:                                       ; preds = %fallthrough.216
  %add.27.1 = add i64 %a.sroa.5.0.copyload.1, %extra.sroa.12.3
  %icmp.208.1 = icmp ugt i64 %add.27.1, %extra.sroa.18.3
  br i1 %icmp.208.1, label %then.217.1, label %fallthrough.217.1

then.217.1:                                       ; preds = %then.216.1
  call void @runtime.growslice(ptr nonnull %sret.actual.97, ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %extra.sroa.0.3, i64 %extra.sroa.12.3, i64 %extra.sroa.18.3, i64 %add.27.1)
  %extra.sroa.0.0.copyload.1 = load ptr, ptr %sret.actual.97, align 8
  %extra.sroa.12.0.copyload.1 = load i64, ptr %0, align 8
  %extra.sroa.18.0.copyload.1 = load i64, ptr %1, align 8
  br label %fallthrough.217.1

fallthrough.217.1:                                ; preds = %then.217.1, %then.216.1
  %extra.sroa.0.4.1 = phi ptr [ %extra.sroa.0.0.copyload.1, %then.217.1 ], [ %extra.sroa.0.3, %then.216.1 ]
  %extra.sroa.12.4.1 = phi i64 [ %extra.sroa.12.0.copyload.1, %then.217.1 ], [ %add.27.1, %then.216.1 ]
  %extra.sroa.18.4.1 = phi i64 [ %extra.sroa.18.0.copyload.1, %then.217.1 ], [ %extra.sroa.18.3, %then.216.1 ]
  %icmp.209.1 = icmp eq i64 %extra.sroa.18.4.1, %extra.sroa.12.3
  %.extra.sroa.12.2.1 = select i1 %icmp.209.1, i64 0, i64 %extra.sroa.12.3
  %ptroff.46.1 = getelementptr %RR.0, ptr %extra.sroa.0.4.1, i64 %.extra.sroa.12.2.1
  %sub.124.1 = sub i64 %extra.sroa.12.4.1, %extra.sroa.12.3
  %call.78.1 = call i64 @runtime.typedslicecopy(ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %ptroff.46.1, i64 %sub.124.1, ptr nonnull %a.sroa.0.0.copyload.1, i64 %a.sroa.5.0.copyload.1)
  br i1 %trunc.225.not, label %fallthrough.216.1, label %then.220.1

then.220.1:                                       ; preds = %fallthrough.217.1
  call void @go_0llvm.SubTypeSignature(ptr nonnull %sret.actual.98, ptr nest undef, ptr nonnull byval(%IPST.0) %sigs, i16 zeroext 28)
  %sig.sroa.0.0.copyload118.1 = load ptr, ptr %sret.actual.98, align 8
  %sig.sroa.4.0.copyload.1 = load i64, ptr %sig.sroa.4.0.cast.2610.sroa_idx24, align 8
  %add.28.1 = add i64 %sig.sroa.4.0.copyload.1, %extra.sroa.12.4.1
  %icmp.211.1 = icmp ugt i64 %add.28.1, %extra.sroa.18.4.1
  br i1 %icmp.211.1, label %then.221.1, label %fallthrough.221.1

then.221.1:                                       ; preds = %then.220.1
  call void @runtime.growslice(ptr nonnull %sret.actual.99, ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %extra.sroa.0.4.1, i64 %extra.sroa.12.4.1, i64 %extra.sroa.18.4.1, i64 %add.28.1)
  %extra.sroa.0.0.copyload97.1 = load ptr, ptr %sret.actual.99, align 8
  %extra.sroa.12.0.copyload103.1 = load i64, ptr %3, align 8
  %extra.sroa.18.0.copyload110.1 = load i64, ptr %4, align 8
  br label %fallthrough.221.1

fallthrough.221.1:                                ; preds = %then.221.1, %then.220.1
  %extra.sroa.0.5.1 = phi ptr [ %extra.sroa.0.0.copyload97.1, %then.221.1 ], [ %extra.sroa.0.4.1, %then.220.1 ]
  %extra.sroa.12.5.1 = phi i64 [ %extra.sroa.12.0.copyload103.1, %then.221.1 ], [ %add.28.1, %then.220.1 ]
  %extra.sroa.18.5.1 = phi i64 [ %extra.sroa.18.0.copyload110.1, %then.221.1 ], [ %extra.sroa.18.4.1, %then.220.1 ]
  %icmp.212.1 = icmp eq i64 %extra.sroa.18.5.1, %extra.sroa.12.4.1
  %.extra.sroa.12.4.1 = select i1 %icmp.212.1, i64 0, i64 %extra.sroa.12.4.1
  %ptroff.48.1 = getelementptr %RR.0, ptr %extra.sroa.0.5.1, i64 %.extra.sroa.12.4.1
  %sub.130.1 = sub i64 %extra.sroa.12.5.1, %extra.sroa.12.4.1
  %call.79.1 = call i64 @runtime.typedslicecopy(ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %ptroff.48.1, i64 %sub.130.1, ptr %sig.sroa.0.0.copyload118.1, i64 %sig.sroa.4.0.copyload.1)
  br label %fallthrough.216.1

fallthrough.216.1:                                ; preds = %fallthrough.221.1, %fallthrough.217.1, %fallthrough.216
  %extra.sroa.0.3.1 = phi ptr [ %extra.sroa.0.5.1, %fallthrough.221.1 ], [ %extra.sroa.0.4.1, %fallthrough.217.1 ], [ %extra.sroa.0.3, %fallthrough.216 ]
  %extra.sroa.12.3.1 = phi i64 [ %extra.sroa.12.5.1, %fallthrough.221.1 ], [ %extra.sroa.12.4.1, %fallthrough.217.1 ], [ %extra.sroa.12.3, %fallthrough.216 ]
  %extra.sroa.18.3.1 = phi i64 [ %extra.sroa.18.5.1, %fallthrough.221.1 ], [ %extra.sroa.18.4.1, %fallthrough.217.1 ], [ %extra.sroa.18.3, %fallthrough.216 ]
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %sigs)
  br label %label.5
}

define void @go_0llvm.Zone.doLookup(ptr nocapture writeonly sret({ %IPST.0, i64 }) %sret.formal.5, ptr nest nocapture readnone %nest.19, ptr readonly %z, ptr %ctx.chunk0, ptr %ctx.chunk1, ptr byval(%Request.0) %state, ptr %target.chunk0, i64 %target.chunk1, i16 zeroext %qtype) #0 {
entry:
  %sret.actual.93 = alloca { ptr, %error.0 }, align 8
  %icmp.169 = icmp eq ptr %z, null
  br i1 %icmp.169, label %then.183, label %else.183, !make.implicit !3

then.183:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.183:                                         ; preds = %entry
  %field.709 = getelementptr inbounds %Zone.0, ptr %z, i64 0, i32 11
  %.field.ld.60 = load ptr, ptr %field.709, align 8
  call void @go_0llvm.Upstream.Lookup(ptr nonnull %sret.actual.93, ptr nest undef, ptr %.field.ld.60, ptr %ctx.chunk0, ptr %ctx.chunk1, ptr nonnull byval(%Request.0) %state, ptr %target.chunk0, i64 %target.chunk1, i16 zeroext %qtype)
  %tmpv.483.sroa.0.0.copyload = load ptr, ptr %sret.actual.93, align 8
  %tmpv.483.sroa.2.sroa.0.0.tmpv.483.sroa.2.0.cast.2474.sroa_cast.sroa_idx = getelementptr inbounds { ptr, %error.0 }, ptr %sret.actual.93, i64 0, i32 1, i32 0
  %tmpv.483.sroa.2.sroa.0.0.copyload = load ptr, ptr %tmpv.483.sroa.2.sroa.0.0.tmpv.483.sroa.2.0.cast.2474.sroa_cast.sroa_idx, align 8
  %icmp.170.not = icmp eq ptr %tmpv.483.sroa.2.sroa.0.0.copyload, null
  br i1 %icmp.170.not, label %else.184, label %then.184

common.ret:                                       ; preds = %else.197, %else.196, %else.191, %else.188, %then.185, %then.184
  ret void

then.184:                                         ; preds = %else.183
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %sret.formal.5, i8 0, i64 24, i1 false)
  %tmp.29.sroa.2.0.cast.2484.sroa_idx41 = getelementptr inbounds { %IPST.0, i64 }, ptr %sret.formal.5, i64 0, i32 1
  store i64 4, ptr %tmp.29.sroa.2.0.cast.2484.sroa_idx41, align 8
  br label %common.ret

else.184:                                         ; preds = %else.183
  %icmp.171 = icmp eq ptr %tmpv.483.sroa.0.0.copyload, null
  br i1 %icmp.171, label %then.185, label %else.186

then.185:                                         ; preds = %else.184
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %sret.formal.5, i8 0, i64 32, i1 false)
  br label %common.ret

else.186:                                         ; preds = %else.184
  %field.721 = getelementptr inbounds %Msg.0, ptr %tmpv.483.sroa.0.0.copyload, i64 0, i32 0, i32 10
  %.field.field.ld.0 = load i64, ptr %field.721, align 8
  switch i64 %.field.field.ld.0, label %fallthrough.193.thread [
    i64 3, label %else.188
    i64 2, label %else.191
    i64 0, label %fallthrough.193
  ]

fallthrough.193.thread:                           ; preds = %else.186
  %field.7312 = getelementptr inbounds %Msg.0, ptr %tmpv.483.sroa.0.0.copyload, i64 0, i32 3
  call void @llvm.memmove.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %sret.formal.5, ptr noundef nonnull align 8 dereferenceable(24) %field.7312, i64 24, i1 false)
  %tmp.33.sroa.2.0.cast.2524.sroa_idx753 = getelementptr inbounds { %IPST.0, i64 }, ptr %sret.formal.5, i64 0, i32 1
  br label %else.197

else.188:                                         ; preds = %else.186
  %field.717 = getelementptr inbounds %Msg.0, ptr %tmpv.483.sroa.0.0.copyload, i64 0, i32 3
  call void @llvm.memmove.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %sret.formal.5, ptr noundef nonnull align 8 dereferenceable(24) %field.717, i64 24, i1 false)
  %tmp.31.sroa.2.0.cast.2502.sroa_idx58 = getelementptr inbounds { %IPST.0, i64 }, ptr %sret.formal.5, i64 0, i32 1
  store i64 1, ptr %tmp.31.sroa.2.0.cast.2502.sroa_idx58, align 8
  br label %common.ret

else.191:                                         ; preds = %else.186
  %field.722 = getelementptr inbounds %Msg.0, ptr %tmpv.483.sroa.0.0.copyload, i64 0, i32 3
  call void @llvm.memmove.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %sret.formal.5, ptr noundef nonnull align 8 dereferenceable(24) %field.722, i64 24, i1 false)
  %tmp.32.sroa.2.0.cast.2512.sroa_idx67 = getelementptr inbounds { %IPST.0, i64 }, ptr %sret.formal.5, i64 0, i32 1
  store i64 4, ptr %tmp.32.sroa.2.0.cast.2512.sroa_idx67, align 8
  br label %common.ret

fallthrough.193:                                  ; preds = %else.186
  %field.730 = getelementptr inbounds %Msg.0, ptr %tmpv.483.sroa.0.0.copyload, i64 0, i32 3, i32 1
  %.field.field.ld.3 = load i64, ptr %field.730, align 8
  %icmp.181 = icmp eq i64 %.field.field.ld.3, 0
  %field.731 = getelementptr inbounds %Msg.0, ptr %tmpv.483.sroa.0.0.copyload, i64 0, i32 3
  call void @llvm.memmove.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %sret.formal.5, ptr noundef nonnull align 8 dereferenceable(24) %field.731, i64 24, i1 false)
  %tmp.33.sroa.2.0.cast.2524.sroa_idx75 = getelementptr inbounds { %IPST.0, i64 }, ptr %sret.formal.5, i64 0, i32 1
  br i1 %icmp.181, label %else.196, label %else.197

else.196:                                         ; preds = %fallthrough.193
  store i64 3, ptr %tmp.33.sroa.2.0.cast.2524.sroa_idx75, align 8
  br label %common.ret

else.197:                                         ; preds = %fallthrough.193.thread, %fallthrough.193
  %tmp.33.sroa.2.0.cast.2524.sroa_idx754 = phi ptr [ %tmp.33.sroa.2.0.cast.2524.sroa_idx753, %fallthrough.193.thread ], [ %tmp.33.sroa.2.0.cast.2524.sroa_idx75, %fallthrough.193 ]
  store i64 0, ptr %tmp.33.sroa.2.0.cast.2524.sroa_idx754, align 8
  br label %common.ret
}

define void @go_0llvm.Zone.externalLookup(ptr nocapture writeonly sret({ %IPST.0, %IPST.0, %IPST.0, i64 }) %sret.formal.4, ptr nest nocapture readnone %nest.18, ptr readonly %z, ptr %ctx.chunk0, ptr %ctx.chunk1, ptr nocapture readonly byval(%Request.0) %param, ptr %elem, ptr nocapture byval(%IPST.0) %rrs) #0 {
entry:
  %tmp.28.sroa.0 = alloca { %IPST.0, %IPST.0, %IPST.0 }, align 8
  %tmp.27.sroa.0 = alloca { %IPST.0, %IPST.0, %IPST.0 }, align 8
  %tmp.26.sroa.0 = alloca { %IPST.0, %IPST.0, %IPST.0 }, align 8
  %tmp.25.sroa.0 = alloca { %IPST.0, %IPST.0, %IPST.0 }, align 8
  %"$ret21" = alloca %IPST.0, align 8
  %sigs = alloca %IPST.0, align 8
  %sret.actual.70 = alloca %IPST.0, align 8
  %sret.actual.71 = alloca %IPST.0, align 8
  %sret.actual.72 = alloca { ptr, i64, i64 }, align 8
  %sret.actual.74 = alloca { %IPST.0, i64 }, align 8
  %sret.actual.75 = alloca { ptr, i64, i64 }, align 8
  %tmpv.396 = alloca %Apex.0, align 8
  %sret.actual.77 = alloca %IPST.0, align 8
  %sret.actual.78 = alloca { ptr, i64, i64 }, align 8
  %sigs2 = alloca %IPST.0, align 8
  %sret.actual.79 = alloca %IPST.0, align 8
  %sret.actual.80 = alloca %IPST.0, align 8
  %sret.actual.81 = alloca { ptr, i64, i64 }, align 8
  %sret.actual.83 = alloca { %IPST.0, i64 }, align 8
  %sret.actual.84 = alloca { ptr, i64, i64 }, align 8
  %tmpv.445 = alloca %Apex.0, align 8
  %tmpv.451 = alloca %Apex.0, align 8
  %sret.actual.87 = alloca %IPST.0, align 8
  %sret.actual.88 = alloca { ptr, i64, i64 }, align 8
  %sigs5 = alloca %IPST.0, align 8
  %sret.actual.89 = alloca %IPST.0, align 8
  %sret.actual.90 = alloca %IPST.0, align 8
  %sret.actual.91 = alloca { ptr, i64, i64 }, align 8
  %tmpv.476 = alloca %Apex.0, align 8
  %tmpv.482 = alloca %Request.0, align 8, !go_addrtaken !3
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %"$ret21")
  %call.75 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.Request..d)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(128) %tmpv.482, ptr noundef nonnull align 8 dereferenceable(128) %param, i64 128, i1 false)
  %deref.ld.15 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.168 = icmp eq i32 %deref.ld.15, 0
  br i1 %icmp.168, label %then.137, label %else.137

then.137:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(128) %call.75, ptr noundef nonnull align 8 dereferenceable(128) %param, i64 128, i1 false)
  br label %fallthrough.137

fallthrough.137:                                  ; preds = %else.137, %then.137
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %"$ret21", i8 0, i64 24, i1 false)
  %call.64 = call i16 @go_0llvm.Request.QType(ptr nest undef, ptr nonnull %call.75)
  %call.65 = call i8 @go_0llvm.Request.Do(ptr nest undef, ptr nonnull %call.75)
  %0 = and i8 %call.65, 1
  %trunc.143.not = icmp eq i8 %0, 0
  br i1 %trunc.143.not, label %fallthrough.137.fallthrough.138_crit_edge, label %then.138

fallthrough.137.fallthrough.138_crit_edge:        ; preds = %fallthrough.137
  %field.529.phi.trans.insert = getelementptr inbounds %IPST.0, ptr %rrs, i64 0, i32 1
  %rrs.field.ld.4.pre = load i64, ptr %field.529.phi.trans.insert, align 8
  br label %fallthrough.138

else.137:                                         ; preds = %entry
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.Request..d, ptr nonnull %call.75, ptr nonnull %tmpv.482)
  br label %fallthrough.137

then.138:                                         ; preds = %fallthrough.137
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %sigs)
  call void @go_0llvm.Elem.Type(ptr nonnull %sret.actual.70, ptr nest undef, ptr %elem, i16 zeroext 46)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %sigs, ptr noundef nonnull align 8 dereferenceable(24) %sret.actual.70, i64 24, i1 false)
  call void @go_0llvm.SubTypeSignature(ptr nonnull %sret.actual.71, ptr nest undef, ptr nonnull byval(%IPST.0) %sigs, i16 zeroext 5)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %sigs, ptr noundef nonnull align 8 dereferenceable(24) %sret.actual.71, i64 24, i1 false)
  %tmpv.362.sroa.5.0.cast.2200.sroa_idx177 = getelementptr inbounds %IPST.0, ptr %rrs, i64 0, i32 1
  %tmpv.362.sroa.5.0.copyload = load i64, ptr %tmpv.362.sroa.5.0.cast.2200.sroa_idx177, align 8
  %tmpv.362.sroa.7.0.cast.2200.sroa_idx180 = getelementptr inbounds %IPST.0, ptr %rrs, i64 0, i32 2
  %tmpv.362.sroa.7.0.copyload = load i64, ptr %tmpv.362.sroa.7.0.cast.2200.sroa_idx180, align 8
  %tmpv.364.sroa.0.0.copyload337 = load ptr, ptr %sigs, align 8
  %tmpv.364.sroa.2.0.cast.2202.sroa_idx169 = getelementptr inbounds %IPST.0, ptr %sigs, i64 0, i32 1
  %tmpv.364.sroa.2.0.copyload = load i64, ptr %tmpv.364.sroa.2.0.cast.2202.sroa_idx169, align 8
  %add.19 = add i64 %tmpv.364.sroa.2.0.copyload, %tmpv.362.sroa.5.0.copyload
  %icmp.125 = icmp ugt i64 %add.19, %tmpv.362.sroa.7.0.copyload
  br i1 %icmp.125, label %then.139, label %fallthrough.140

fallthrough.138:                                  ; preds = %fallthrough.137.fallthrough.138_crit_edge, %fallthrough.139
  %rrs.field.ld.4 = phi i64 [ %rrs.field.ld.4.pre, %fallthrough.137.fallthrough.138_crit_edge ], [ %tmpv.362.sroa.5.0.copyload179, %fallthrough.139 ]
  %field.529 = getelementptr inbounds %IPST.0, ptr %rrs, i64 0, i32 1
  %field.530 = getelementptr inbounds %IPST.0, ptr %rrs, i64 0, i32 2
  %icmp.128 = icmp sgt i64 %rrs.field.ld.4, 0
  br i1 %icmp.128, label %fallthrough.142, label %else.142

then.139:                                         ; preds = %then.138
  %tmpv.362.sroa.0.0.copyload353 = load ptr, ptr %rrs, align 8
  call void @runtime.growslice(ptr nonnull %sret.actual.72, ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %tmpv.362.sroa.0.0.copyload353, i64 %tmpv.362.sroa.5.0.copyload, i64 %tmpv.362.sroa.7.0.copyload, i64 %add.19)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %rrs, ptr noundef nonnull align 8 dereferenceable(24) %sret.actual.72, i64 24, i1 false)
  %tmpv.362.sroa.5.0.copyload179.pre = load i64, ptr %tmpv.362.sroa.5.0.cast.2200.sroa_idx177, align 8
  %tmpv.362.sroa.7.0.copyload182.pre = load i64, ptr %tmpv.362.sroa.7.0.cast.2200.sroa_idx180, align 8
  br label %fallthrough.139

fallthrough.139:                                  ; preds = %fallthrough.140, %then.139
  %tmpv.362.sroa.7.0.copyload182 = phi i64 [ %tmpv.362.sroa.7.0.copyload, %fallthrough.140 ], [ %tmpv.362.sroa.7.0.copyload182.pre, %then.139 ]
  %tmpv.362.sroa.5.0.copyload179 = phi i64 [ %add.19, %fallthrough.140 ], [ %tmpv.362.sroa.5.0.copyload179.pre, %then.139 ]
  %tmpv.362.sroa.0.0.copyload176 = load ptr, ptr %rrs, align 8
  %icmp.126 = icmp eq i64 %tmpv.362.sroa.7.0.copyload182, %tmpv.362.sroa.5.0.copyload
  %.tmpv.362.sroa.5.0.copyload = select i1 %icmp.126, i64 0, i64 %tmpv.362.sroa.5.0.copyload
  %ptroff.28 = getelementptr %RR.0, ptr %tmpv.362.sroa.0.0.copyload176, i64 %.tmpv.362.sroa.5.0.copyload
  %sub.82 = sub i64 %tmpv.362.sroa.5.0.copyload179, %tmpv.362.sroa.5.0.copyload
  %call.66 = call i64 @runtime.typedslicecopy(ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %ptroff.28, i64 %sub.82, ptr %tmpv.364.sroa.0.0.copyload337, i64 %tmpv.364.sroa.2.0.copyload)
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %sigs)
  br label %fallthrough.138

fallthrough.140:                                  ; preds = %then.138
  store i64 %add.19, ptr %tmpv.362.sroa.5.0.cast.2200.sroa_idx177, align 8
  br label %fallthrough.139

fallthrough.142:                                  ; preds = %fallthrough.138
  %rrs.field.ld.6 = load ptr, ptr %rrs, align 8
  %tmpv.373.sroa.0.0.copyload = load ptr, ptr %rrs.field.ld.6, align 8
  %tmpv.373.sroa.5.0.cast.2214.sroa_idx164 = getelementptr inbounds %RR.0, ptr %rrs.field.ld.6, i64 0, i32 1
  %tmpv.373.sroa.5.0.copyload330 = load ptr, ptr %tmpv.373.sroa.5.0.cast.2214.sroa_idx164, align 8
  %icmp.129 = icmp eq ptr %tmpv.373.sroa.0.0.copyload, null
  br i1 %icmp.129, label %fallthrough.145, label %fallthrough.143

else.142:                                         ; preds = %fallthrough.138
  call void @runtime.goPanicIndex(ptr nest undef, i64 0, i64 %rrs.field.ld.4)
  unreachable

fallthrough.143:                                  ; preds = %fallthrough.142
  %.field.ld.42 = load ptr, ptr %tmpv.373.sroa.0.0.copyload, align 8
  %icmp.130 = icmp eq ptr %.field.ld.42, @go_0llvm.CNAME..p
  br i1 %icmp.130, label %fallthrough.144, label %fallthrough.145

fallthrough.144:                                  ; preds = %fallthrough.143
  %icmp.132 = icmp eq ptr %tmpv.373.sroa.5.0.copyload330, null
  br i1 %icmp.132, label %then.146, label %else.146, !make.implicit !3

fallthrough.145:                                  ; preds = %fallthrough.143, %fallthrough.142
  %tmpv.375.0 = phi ptr [ null, %fallthrough.142 ], [ %.field.ld.42, %fallthrough.143 ]
  call void @runtime.panicdottype(ptr nest undef, ptr nonnull @go_0llvm.CNAME..p, ptr %tmpv.375.0, ptr nonnull @go_0llvm.RR..d)
  unreachable

then.146:                                         ; preds = %fallthrough.144
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.146:                                         ; preds = %fallthrough.144
  %targetName.sroa.0.0.cast.2225.sroa_idx = getelementptr inbounds %CNAME.0, ptr %tmpv.373.sroa.5.0.copyload330, i64 0, i32 1, i32 0
  %targetName.sroa.0.0.copyload = load ptr, ptr %targetName.sroa.0.0.cast.2225.sroa_idx, align 8
  %targetName.sroa.8.0.cast.2225.sroa_idx225 = getelementptr inbounds %CNAME.0, ptr %tmpv.373.sroa.5.0.copyload330, i64 0, i32 1, i32 1
  %targetName.sroa.8.0.copyload = load i64, ptr %targetName.sroa.8.0.cast.2225.sroa_idx225, align 8
  %icmp.133 = icmp eq ptr %z, null
  br i1 %icmp.133, label %then.147, label %else.147, !make.implicit !3

then.147:                                         ; preds = %else.146
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.147:                                         ; preds = %else.146
  %field.540 = getelementptr inbounds %Zone.0, ptr %z, i64 0, i32 3
  %.field.ld.44 = load ptr, ptr %field.540, align 8
  %call.67 = call { ptr, i8 } @go_0llvm.Tree.Search(ptr nest undef, ptr %.field.ld.44, ptr %targetName.sroa.0.0.copyload, i64 %targetName.sroa.8.0.copyload)
  %call.67.fca.0.extract = extractvalue { ptr, i8 } %call.67, 0
  %icmp.138 = icmp eq ptr %call.67.fca.0.extract, null
  br i1 %icmp.138, label %then.148, label %label.0.preheader

label.0.preheader:                                ; preds = %else.147
  %cname.sroa.8.0.cast.2277.sroa_idx205 = getelementptr inbounds %IPST.0, ptr %sret.actual.77, i64 0, i32 1
  %tmpv.413.sroa.2.0.cast.2301.sroa_idx86 = getelementptr inbounds %IPST.0, ptr %sigs2, i64 0, i32 1
  br label %label.0

then.148:                                         ; preds = %else.147
  call void @go_0llvm.Zone.doLookup(ptr nonnull %sret.actual.74, ptr nest poison, ptr nonnull %z, ptr %ctx.chunk0, ptr %ctx.chunk1, ptr nonnull byval(%Request.0) %call.75, ptr %targetName.sroa.0.0.copyload, i64 %targetName.sroa.8.0.copyload, i16 zeroext %call.64)
  %tmpv.383.sroa.0.sroa.0.0.copyload336 = load ptr, ptr %sret.actual.74, align 8
  %tmpv.383.sroa.0.sroa.2.0.tmpv.383.sroa.0.0.cast.2234.sroa_cast.sroa_idx162 = getelementptr inbounds { %IPST.0, i64 }, ptr %sret.actual.74, i64 0, i32 0, i32 1
  %tmpv.383.sroa.0.sroa.2.0.copyload = load i64, ptr %tmpv.383.sroa.0.sroa.2.0.tmpv.383.sroa.0.0.cast.2234.sroa_cast.sroa_idx162, align 8
  %tmpv.383.sroa.2.0.cast.2234.sroa_idx153 = getelementptr inbounds { %IPST.0, i64 }, ptr %sret.actual.74, i64 0, i32 1
  %tmpv.383.sroa.2.0.copyload = load i64, ptr %tmpv.383.sroa.2.0.cast.2234.sroa_idx153, align 8
  %tmpv.386.sroa.7.0.copyload = load i64, ptr %field.530, align 8
  %add.20 = add i64 %tmpv.383.sroa.0.sroa.2.0.copyload, %rrs.field.ld.4
  %icmp.135 = icmp ugt i64 %add.20, %tmpv.386.sroa.7.0.copyload
  br i1 %icmp.135, label %then.149, label %fallthrough.150

then.149:                                         ; preds = %then.148
  call void @runtime.growslice(ptr nonnull %sret.actual.75, ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr nonnull %rrs.field.ld.6, i64 %rrs.field.ld.4, i64 %tmpv.386.sroa.7.0.copyload, i64 %add.20)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %rrs, ptr noundef nonnull align 8 dereferenceable(24) %sret.actual.75, i64 24, i1 false)
  %tmpv.386.sroa.0.0.copyload141.pre = load ptr, ptr %rrs, align 8
  %tmpv.386.sroa.5.0.copyload144.pre = load i64, ptr %field.529, align 8
  %tmpv.386.sroa.7.0.copyload147.pre = load i64, ptr %field.530, align 8
  br label %fallthrough.149

common.ret:                                       ; preds = %fallthrough.174, %then.172, %fallthrough.168, %fallthrough.149
  ret void

fallthrough.149:                                  ; preds = %fallthrough.150, %then.149
  %tmpv.386.sroa.7.0.copyload147 = phi i64 [ %tmpv.386.sroa.7.0.copyload, %fallthrough.150 ], [ %tmpv.386.sroa.7.0.copyload147.pre, %then.149 ]
  %tmpv.386.sroa.5.0.copyload144 = phi i64 [ %add.20, %fallthrough.150 ], [ %tmpv.386.sroa.5.0.copyload144.pre, %then.149 ]
  %tmpv.386.sroa.0.0.copyload141 = phi ptr [ %rrs.field.ld.6, %fallthrough.150 ], [ %tmpv.386.sroa.0.0.copyload141.pre, %then.149 ]
  %icmp.136 = icmp eq i64 %tmpv.386.sroa.7.0.copyload147, %rrs.field.ld.4
  %.tmpv.386.sroa.5.0.copyload = select i1 %icmp.136, i64 0, i64 %rrs.field.ld.4
  %ptroff.31 = getelementptr %RR.0, ptr %tmpv.386.sroa.0.0.copyload141, i64 %.tmpv.386.sroa.5.0.copyload
  %sub.88 = sub i64 %tmpv.386.sroa.5.0.copyload144, %rrs.field.ld.4
  %call.68 = call i64 @runtime.typedslicecopy(ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %ptroff.31, i64 %sub.88, ptr %tmpv.383.sroa.0.sroa.0.0.copyload336, i64 %tmpv.383.sroa.0.sroa.2.0.copyload)
  %field.566 = getelementptr inbounds %Zone.0, ptr %z, i64 0, i32 4
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(80) %tmpv.396, ptr noundef nonnull align 8 dereferenceable(80) %field.566, i64 80, i1 false)
  call void @go_0llvm.Apex.ns(ptr nonnull %"$ret21", ptr nest poison, ptr nonnull %tmpv.396, i8 zeroext %call.65)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmp.25.sroa.0, ptr noundef nonnull align 8 dereferenceable(24) %rrs, i64 24, i1 false)
  %tmp.25.sroa.0.24.sroa_idx = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0 }, ptr %tmp.25.sroa.0, i64 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmp.25.sroa.0.24.sroa_idx, ptr noundef nonnull align 8 dereferenceable(24) %"$ret21", i64 24, i1 false)
  %tmp.25.sroa.0.48.sroa_idx = getelementptr inbounds i8, ptr %tmp.25.sroa.0, i64 48
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmp.25.sroa.0.48.sroa_idx, i8 0, i64 24, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(72) %sret.formal.4, ptr noundef nonnull align 8 dereferenceable(72) %tmp.25.sroa.0, i64 72, i1 false)
  %tmp.25.sroa.4.0.cast.2273.sroa_idx268 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.4, i64 0, i32 3
  store i64 %tmpv.383.sroa.2.0.copyload, ptr %tmp.25.sroa.4.0.cast.2273.sroa_idx268, align 8
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %"$ret21")
  br label %common.ret

fallthrough.150:                                  ; preds = %then.148
  store i64 %add.20, ptr %field.529, align 8
  br label %fallthrough.149

label.0:                                          ; preds = %else.167, %label.0.preheader
  %tmpv.411.sroa.0.0.copyload9354 = phi ptr [ %tmpv.435.sroa.0.0.copyload358, %else.167 ], [ %rrs.field.ld.6, %label.0.preheader ]
  %tmpv.401.sroa.0.0.copyload11448 = phi ptr [ %tmpv.401.sroa.0.0.copyload11449, %else.167 ], [ %rrs.field.ld.6, %label.0.preheader ]
  %tmpv.401.sroa.5.0.copyload = phi i64 [ %tmpv.435.sroa.5.0.copyload, %else.167 ], [ %rrs.field.ld.4, %label.0.preheader ]
  %i.0 = phi i64 [ %add.24, %else.167 ], [ 0, %label.0.preheader ]
  %elem.addr.0.in = phi ptr [ %call.71.fca.0.extract, %else.167 ], [ %call.67.fca.0.extract, %label.0.preheader ]
  call void @go_0llvm.Elem.Type(ptr nonnull %sret.actual.77, ptr nest undef, ptr nonnull %elem.addr.0.in, i16 zeroext 5)
  %cname.sroa.0.0.copyload = load ptr, ptr %sret.actual.77, align 8
  %cname.sroa.8.0.copyload = load i64, ptr %cname.sroa.8.0.cast.2277.sroa_idx205, align 8
  %icmp.159 = icmp sgt i64 %cname.sroa.8.0.copyload, 0
  br i1 %icmp.159, label %then.153, label %else.153

then.153:                                         ; preds = %label.0
  %tmpv.401.sroa.7.0.copyload = load i64, ptr %field.530, align 8
  %add.21 = add i64 %tmpv.401.sroa.5.0.copyload, %cname.sroa.8.0.copyload
  %icmp.140 = icmp ugt i64 %add.21, %tmpv.401.sroa.7.0.copyload
  br i1 %icmp.140, label %then.154, label %fallthrough.155

else.153:                                         ; preds = %label.0
  call void @go_0llvm.Elem.Type(ptr nonnull %sret.actual.87, ptr nest undef, ptr nonnull %elem.addr.0.in, i16 zeroext %call.64)
  %targets.sroa.0.0.copyload331 = load ptr, ptr %sret.actual.87, align 8
  %targets.sroa.7.0.cast.2398.sroa_idx191 = getelementptr inbounds %IPST.0, ptr %sret.actual.87, i64 0, i32 1
  %targets.sroa.7.0.copyload = load i64, ptr %targets.sroa.7.0.cast.2398.sroa_idx191, align 8
  %icmp.166 = icmp sgt i64 %targets.sroa.7.0.copyload, 0
  br i1 %icmp.166, label %then.174, label %fallthrough.174

then.154:                                         ; preds = %then.153
  call void @runtime.growslice(ptr nonnull %sret.actual.78, ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %tmpv.401.sroa.0.0.copyload11448, i64 %tmpv.401.sroa.5.0.copyload, i64 %tmpv.401.sroa.7.0.copyload, i64 %add.21)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %rrs, ptr noundef nonnull align 8 dereferenceable(24) %sret.actual.78, i64 24, i1 false)
  %tmpv.401.sroa.0.0.copyload114.pre = load ptr, ptr %rrs, align 8
  %tmpv.401.sroa.5.0.copyload117.pre = load i64, ptr %field.529, align 8
  %tmpv.401.sroa.7.0.copyload120.pre = load i64, ptr %field.530, align 8
  br label %fallthrough.154

fallthrough.154:                                  ; preds = %fallthrough.155, %then.154
  %tmpv.411.sroa.0.0.copyload9353 = phi ptr [ %tmpv.411.sroa.0.0.copyload9354, %fallthrough.155 ], [ %tmpv.401.sroa.0.0.copyload114.pre, %then.154 ]
  %tmpv.401.sroa.7.0.copyload120 = phi i64 [ %tmpv.401.sroa.7.0.copyload, %fallthrough.155 ], [ %tmpv.401.sroa.7.0.copyload120.pre, %then.154 ]
  %tmpv.401.sroa.5.0.copyload117 = phi i64 [ %add.21, %fallthrough.155 ], [ %tmpv.401.sroa.5.0.copyload117.pre, %then.154 ]
  %tmpv.401.sroa.0.0.copyload114 = phi ptr [ %tmpv.401.sroa.0.0.copyload11448, %fallthrough.155 ], [ %tmpv.401.sroa.0.0.copyload114.pre, %then.154 ]
  %icmp.141 = icmp eq i64 %tmpv.401.sroa.7.0.copyload120, %tmpv.401.sroa.5.0.copyload
  %.tmpv.401.sroa.5.0.copyload = select i1 %icmp.141, i64 0, i64 %tmpv.401.sroa.5.0.copyload
  %ptroff.33 = getelementptr %RR.0, ptr %tmpv.401.sroa.0.0.copyload114, i64 %.tmpv.401.sroa.5.0.copyload
  %sub.94 = sub i64 %tmpv.401.sroa.5.0.copyload117, %tmpv.401.sroa.5.0.copyload
  %call.69 = call i64 @runtime.typedslicecopy(ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %ptroff.33, i64 %sub.94, ptr %cname.sroa.0.0.copyload, i64 %cname.sroa.8.0.copyload)
  br i1 %trunc.143.not, label %fallthrough.161, label %then.157

fallthrough.155:                                  ; preds = %then.153
  store i64 %add.21, ptr %field.529, align 8
  br label %fallthrough.154

then.157:                                         ; preds = %fallthrough.154
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %sigs2)
  call void @go_0llvm.Elem.Type(ptr nonnull %sret.actual.79, ptr nest undef, ptr nonnull %elem.addr.0.in, i16 zeroext 46)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %sigs2, ptr noundef nonnull align 8 dereferenceable(24) %sret.actual.79, i64 24, i1 false)
  call void @go_0llvm.SubTypeSignature(ptr nonnull %sret.actual.80, ptr nest undef, ptr nonnull byval(%IPST.0) %sigs2, i16 zeroext 5)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %sigs2, ptr noundef nonnull align 8 dereferenceable(24) %sret.actual.80, i64 24, i1 false)
  %tmpv.413.sroa.0.0.copyload335 = load ptr, ptr %sigs2, align 8
  %tmpv.413.sroa.2.0.copyload = load i64, ptr %tmpv.413.sroa.2.0.cast.2301.sroa_idx86, align 8
  %add.22 = add i64 %tmpv.413.sroa.2.0.copyload, %tmpv.401.sroa.5.0.copyload117
  %icmp.143 = icmp ugt i64 %add.22, %tmpv.401.sroa.7.0.copyload120
  br i1 %icmp.143, label %then.158, label %fallthrough.159

then.158:                                         ; preds = %then.157
  call void @runtime.growslice(ptr nonnull %sret.actual.81, ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %tmpv.401.sroa.0.0.copyload114, i64 %tmpv.401.sroa.5.0.copyload117, i64 %tmpv.401.sroa.7.0.copyload120, i64 %add.22)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %rrs, ptr noundef nonnull align 8 dereferenceable(24) %sret.actual.81, i64 24, i1 false)
  %tmpv.411.sroa.0.0.copyload93.pre = load ptr, ptr %rrs, align 8
  %tmpv.411.sroa.5.0.copyload96.pre = load i64, ptr %field.529, align 8
  %tmpv.411.sroa.7.0.copyload99.pre = load i64, ptr %field.530, align 8
  br label %fallthrough.158

fallthrough.158:                                  ; preds = %fallthrough.159, %then.158
  %tmpv.411.sroa.7.0.copyload99 = phi i64 [ %tmpv.401.sroa.7.0.copyload120, %fallthrough.159 ], [ %tmpv.411.sroa.7.0.copyload99.pre, %then.158 ]
  %tmpv.411.sroa.5.0.copyload96 = phi i64 [ %add.22, %fallthrough.159 ], [ %tmpv.411.sroa.5.0.copyload96.pre, %then.158 ]
  %tmpv.411.sroa.0.0.copyload93 = phi ptr [ %tmpv.411.sroa.0.0.copyload9353, %fallthrough.159 ], [ %tmpv.411.sroa.0.0.copyload93.pre, %then.158 ]
  %icmp.144 = icmp eq i64 %tmpv.411.sroa.7.0.copyload99, %tmpv.401.sroa.5.0.copyload117
  %.tmpv.411.sroa.5.0.copyload = select i1 %icmp.144, i64 0, i64 %tmpv.401.sroa.5.0.copyload117
  %ptroff.35 = getelementptr %RR.0, ptr %tmpv.411.sroa.0.0.copyload93, i64 %.tmpv.411.sroa.5.0.copyload
  %sub.100 = sub i64 %tmpv.411.sroa.5.0.copyload96, %tmpv.401.sroa.5.0.copyload117
  %call.70 = call i64 @runtime.typedslicecopy(ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %ptroff.35, i64 %sub.100, ptr %tmpv.413.sroa.0.0.copyload335, i64 %tmpv.413.sroa.2.0.copyload)
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %sigs2)
  br label %fallthrough.161

fallthrough.159:                                  ; preds = %then.157
  store i64 %add.22, ptr %field.529, align 8
  br label %fallthrough.158

fallthrough.161:                                  ; preds = %fallthrough.158, %fallthrough.154
  %tmpv.435.sroa.7.0.copyload = phi i64 [ %tmpv.411.sroa.7.0.copyload99, %fallthrough.158 ], [ %tmpv.401.sroa.7.0.copyload120, %fallthrough.154 ]
  %tmpv.435.sroa.0.0.copyload358 = phi ptr [ %tmpv.411.sroa.0.0.copyload93, %fallthrough.158 ], [ %tmpv.411.sroa.0.0.copyload9353, %fallthrough.154 ]
  %tmpv.401.sroa.0.0.copyload11449 = phi ptr [ %tmpv.411.sroa.0.0.copyload93, %fallthrough.158 ], [ %tmpv.401.sroa.0.0.copyload114, %fallthrough.154 ]
  %tmpv.435.sroa.5.0.copyload = phi i64 [ %tmpv.411.sroa.5.0.copyload96, %fallthrough.158 ], [ %tmpv.401.sroa.5.0.copyload117, %fallthrough.154 ]
  %tmpv.422.sroa.0.0.copyload = load ptr, ptr %cname.sroa.0.0.copyload, align 8
  %tmpv.422.sroa.5.0.cast.2313.sroa_idx81 = getelementptr inbounds %RR.0, ptr %cname.sroa.0.0.copyload, i64 0, i32 1
  %tmpv.422.sroa.5.0.copyload333 = load ptr, ptr %tmpv.422.sroa.5.0.cast.2313.sroa_idx81, align 8
  %icmp.147 = icmp eq ptr %tmpv.422.sroa.0.0.copyload, null
  br i1 %icmp.147, label %fallthrough.164, label %fallthrough.162

fallthrough.162:                                  ; preds = %fallthrough.161
  %.field.ld.51 = load ptr, ptr %tmpv.422.sroa.0.0.copyload, align 8
  %icmp.148 = icmp eq ptr %.field.ld.51, @go_0llvm.CNAME..p
  br i1 %icmp.148, label %fallthrough.163, label %fallthrough.164

fallthrough.163:                                  ; preds = %fallthrough.162
  %icmp.150 = icmp eq ptr %tmpv.422.sroa.5.0.copyload333, null
  br i1 %icmp.150, label %then.165, label %else.165, !make.implicit !3

fallthrough.164:                                  ; preds = %fallthrough.162, %fallthrough.161
  %tmpv.424.0 = phi ptr [ null, %fallthrough.161 ], [ %.field.ld.51, %fallthrough.162 ]
  call void @runtime.panicdottype(ptr nest undef, ptr nonnull @go_0llvm.CNAME..p, ptr %tmpv.424.0, ptr nonnull @go_0llvm.RR..d)
  unreachable

then.165:                                         ; preds = %fallthrough.163
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.165:                                         ; preds = %fallthrough.163
  %targetName1.sroa.0.0.cast.2324.sroa_idx = getelementptr inbounds %CNAME.0, ptr %tmpv.422.sroa.5.0.copyload333, i64 0, i32 1, i32 0
  %targetName1.sroa.0.0.copyload = load ptr, ptr %targetName1.sroa.0.0.cast.2324.sroa_idx, align 8
  %targetName1.sroa.6.0.cast.2324.sroa_idx127 = getelementptr inbounds %CNAME.0, ptr %tmpv.422.sroa.5.0.copyload333, i64 0, i32 1, i32 1
  %targetName1.sroa.6.0.copyload = load i64, ptr %targetName1.sroa.6.0.cast.2324.sroa_idx127, align 8
  %.field.ld.53 = load ptr, ptr %field.540, align 8
  %call.71 = call { ptr, i8 } @go_0llvm.Tree.Search(ptr nest undef, ptr %.field.ld.53, ptr %targetName1.sroa.0.0.copyload, i64 %targetName1.sroa.6.0.copyload)
  %call.71.fca.0.extract = extractvalue { ptr, i8 } %call.71, 0
  %icmp.156 = icmp eq ptr %call.71.fca.0.extract, null
  br i1 %icmp.156, label %then.167, label %else.167

then.167:                                         ; preds = %else.165
  call void @go_0llvm.Zone.doLookup(ptr nonnull %sret.actual.83, ptr nest poison, ptr nonnull %z, ptr %ctx.chunk0, ptr %ctx.chunk1, ptr nonnull byval(%Request.0) %call.75, ptr %targetName1.sroa.0.0.copyload, i64 %targetName1.sroa.6.0.copyload, i16 zeroext %call.64)
  %tmpv.432.sroa.0.sroa.0.0.copyload334 = load ptr, ptr %sret.actual.83, align 8
  %tmpv.432.sroa.0.sroa.2.0.tmpv.432.sroa.0.0.cast.2333.sroa_cast.sroa_idx79 = getelementptr inbounds { %IPST.0, i64 }, ptr %sret.actual.83, i64 0, i32 0, i32 1
  %tmpv.432.sroa.0.sroa.2.0.copyload = load i64, ptr %tmpv.432.sroa.0.sroa.2.0.tmpv.432.sroa.0.0.cast.2333.sroa_cast.sroa_idx79, align 8
  %tmpv.432.sroa.2.0.cast.2333.sroa_idx70 = getelementptr inbounds { %IPST.0, i64 }, ptr %sret.actual.83, i64 0, i32 1
  %tmpv.432.sroa.2.0.copyload = load i64, ptr %tmpv.432.sroa.2.0.cast.2333.sroa_idx70, align 8
  %add.23 = add i64 %tmpv.435.sroa.5.0.copyload, %tmpv.432.sroa.0.sroa.2.0.copyload
  %icmp.153 = icmp ugt i64 %add.23, %tmpv.435.sroa.7.0.copyload
  br i1 %icmp.153, label %then.168, label %fallthrough.169

else.167:                                         ; preds = %else.165
  %add.24 = add nuw nsw i64 %i.0, 1
  %exitcond = icmp eq i64 %add.24, 9
  br i1 %exitcond, label %then.172, label %label.0

then.168:                                         ; preds = %then.167
  call void @runtime.growslice(ptr nonnull %sret.actual.84, ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %tmpv.435.sroa.0.0.copyload358, i64 %tmpv.435.sroa.5.0.copyload, i64 %tmpv.435.sroa.7.0.copyload, i64 %add.23)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %rrs, ptr noundef nonnull align 8 dereferenceable(24) %sret.actual.84, i64 24, i1 false)
  %tmpv.435.sroa.0.0.copyload58.pre = load ptr, ptr %rrs, align 8
  %tmpv.435.sroa.5.0.copyload61.pre = load i64, ptr %field.529, align 8
  %tmpv.435.sroa.7.0.copyload64.pre = load i64, ptr %field.530, align 8
  br label %fallthrough.168

fallthrough.168:                                  ; preds = %fallthrough.169, %then.168
  %tmpv.435.sroa.7.0.copyload64 = phi i64 [ %tmpv.435.sroa.7.0.copyload, %fallthrough.169 ], [ %tmpv.435.sroa.7.0.copyload64.pre, %then.168 ]
  %tmpv.435.sroa.5.0.copyload61 = phi i64 [ %add.23, %fallthrough.169 ], [ %tmpv.435.sroa.5.0.copyload61.pre, %then.168 ]
  %tmpv.435.sroa.0.0.copyload58 = phi ptr [ %tmpv.435.sroa.0.0.copyload358, %fallthrough.169 ], [ %tmpv.435.sroa.0.0.copyload58.pre, %then.168 ]
  %icmp.154 = icmp eq i64 %tmpv.435.sroa.7.0.copyload64, %tmpv.435.sroa.5.0.copyload
  %.tmpv.435.sroa.5.0.copyload = select i1 %icmp.154, i64 0, i64 %tmpv.435.sroa.5.0.copyload
  %ptroff.38 = getelementptr %RR.0, ptr %tmpv.435.sroa.0.0.copyload58, i64 %.tmpv.435.sroa.5.0.copyload
  %sub.106 = sub i64 %tmpv.435.sroa.5.0.copyload61, %tmpv.435.sroa.5.0.copyload
  %call.72 = call i64 @runtime.typedslicecopy(ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %ptroff.38, i64 %sub.106, ptr %tmpv.432.sroa.0.sroa.0.0.copyload334, i64 %tmpv.432.sroa.0.sroa.2.0.copyload)
  %field.650 = getelementptr inbounds %Zone.0, ptr %z, i64 0, i32 4
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(80) %tmpv.445, ptr noundef nonnull align 8 dereferenceable(80) %field.650, i64 80, i1 false)
  call void @go_0llvm.Apex.ns(ptr nonnull %"$ret21", ptr nest poison, ptr nonnull %tmpv.445, i8 zeroext %call.65)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmp.26.sroa.0, ptr noundef nonnull align 8 dereferenceable(24) %rrs, i64 24, i1 false)
  %tmp.26.sroa.0.24.sroa_idx = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0 }, ptr %tmp.26.sroa.0, i64 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmp.26.sroa.0.24.sroa_idx, ptr noundef nonnull align 8 dereferenceable(24) %"$ret21", i64 24, i1 false)
  %tmp.26.sroa.0.48.sroa_idx = getelementptr inbounds i8, ptr %tmp.26.sroa.0, i64 48
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmp.26.sroa.0.48.sroa_idx, i8 0, i64 24, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(72) %sret.formal.4, ptr noundef nonnull align 8 dereferenceable(72) %tmp.26.sroa.0, i64 72, i1 false)
  %tmp.26.sroa.4.0.cast.2372.sroa_idx285 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.4, i64 0, i32 3
  store i64 %tmpv.432.sroa.2.0.copyload, ptr %tmp.26.sroa.4.0.cast.2372.sroa_idx285, align 8
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %"$ret21")
  br label %common.ret

fallthrough.169:                                  ; preds = %then.167
  store i64 %add.23, ptr %field.529, align 8
  br label %fallthrough.168

then.172:                                         ; preds = %else.167
  %field.655 = getelementptr inbounds %Zone.0, ptr %z, i64 0, i32 4
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(80) %tmpv.451, ptr noundef nonnull align 8 dereferenceable(80) %field.655, i64 80, i1 false)
  call void @go_0llvm.Apex.ns(ptr nonnull %"$ret21", ptr nest poison, ptr nonnull %tmpv.451, i8 zeroext %call.65)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmp.27.sroa.0, ptr noundef nonnull align 8 dereferenceable(24) %rrs, i64 24, i1 false)
  %tmp.27.sroa.0.24.sroa_idx = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0 }, ptr %tmp.27.sroa.0, i64 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmp.27.sroa.0.24.sroa_idx, ptr noundef nonnull align 8 dereferenceable(24) %"$ret21", i64 24, i1 false)
  %tmp.27.sroa.0.48.sroa_idx = getelementptr inbounds i8, ptr %tmp.27.sroa.0, i64 48
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmp.27.sroa.0.48.sroa_idx, i8 0, i64 24, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(72) %sret.formal.4, ptr noundef nonnull align 8 dereferenceable(72) %tmp.27.sroa.0, i64 72, i1 false)
  %tmp.27.sroa.4.0.cast.2395.sroa_idx299 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.4, i64 0, i32 3
  store i64 0, ptr %tmp.27.sroa.4.0.cast.2395.sroa_idx299, align 8
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %"$ret21")
  br label %common.ret

then.174:                                         ; preds = %else.153
  %tmpv.456.sroa.7.0.copyload = load i64, ptr %field.530, align 8
  %add.25 = add i64 %tmpv.401.sroa.5.0.copyload, %targets.sroa.7.0.copyload
  %icmp.161 = icmp ugt i64 %add.25, %tmpv.456.sroa.7.0.copyload
  br i1 %icmp.161, label %then.175, label %fallthrough.176

fallthrough.174:                                  ; preds = %fallthrough.179, %fallthrough.175, %else.153
  %field.704 = getelementptr inbounds %Zone.0, ptr %z, i64 0, i32 4
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(80) %tmpv.476, ptr noundef nonnull align 8 dereferenceable(80) %field.704, i64 80, i1 false)
  call void @go_0llvm.Apex.ns(ptr nonnull %"$ret21", ptr nest poison, ptr nonnull %tmpv.476, i8 zeroext %call.65)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmp.28.sroa.0, ptr noundef nonnull align 8 dereferenceable(24) %rrs, i64 24, i1 false)
  %tmp.28.sroa.0.24.sroa_idx = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0 }, ptr %tmp.28.sroa.0, i64 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmp.28.sroa.0.24.sroa_idx, ptr noundef nonnull align 8 dereferenceable(24) %"$ret21", i64 24, i1 false)
  %tmp.28.sroa.0.48.sroa_idx = getelementptr inbounds i8, ptr %tmp.28.sroa.0, i64 48
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmp.28.sroa.0.48.sroa_idx, i8 0, i64 24, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(72) %sret.formal.4, ptr noundef nonnull align 8 dereferenceable(72) %tmp.28.sroa.0, i64 72, i1 false)
  %tmp.28.sroa.4.0.cast.2453.sroa_idx316 = getelementptr inbounds { %IPST.0, %IPST.0, %IPST.0, i64 }, ptr %sret.formal.4, i64 0, i32 3
  store i64 0, ptr %tmp.28.sroa.4.0.cast.2453.sroa_idx316, align 8
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %"$ret21")
  br label %common.ret

then.175:                                         ; preds = %then.174
  call void @runtime.growslice(ptr nonnull %sret.actual.88, ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %tmpv.401.sroa.0.0.copyload11448, i64 %tmpv.401.sroa.5.0.copyload, i64 %tmpv.456.sroa.7.0.copyload, i64 %add.25)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %rrs, ptr noundef nonnull align 8 dereferenceable(24) %sret.actual.88, i64 24, i1 false)
  %tmpv.456.sroa.0.0.copyload37.pre = load ptr, ptr %rrs, align 8
  %tmpv.456.sroa.5.0.copyload40.pre = load i64, ptr %field.529, align 8
  %tmpv.456.sroa.7.0.copyload43.pre = load i64, ptr %field.530, align 8
  br label %fallthrough.175

fallthrough.175:                                  ; preds = %fallthrough.176, %then.175
  %tmpv.456.sroa.7.0.copyload43 = phi i64 [ %tmpv.456.sroa.7.0.copyload, %fallthrough.176 ], [ %tmpv.456.sroa.7.0.copyload43.pre, %then.175 ]
  %tmpv.456.sroa.5.0.copyload40 = phi i64 [ %add.25, %fallthrough.176 ], [ %tmpv.456.sroa.5.0.copyload40.pre, %then.175 ]
  %tmpv.456.sroa.0.0.copyload37 = phi ptr [ %tmpv.401.sroa.0.0.copyload11448, %fallthrough.176 ], [ %tmpv.456.sroa.0.0.copyload37.pre, %then.175 ]
  %icmp.162 = icmp eq i64 %tmpv.456.sroa.7.0.copyload43, %tmpv.401.sroa.5.0.copyload
  %.tmpv.456.sroa.5.0.copyload = select i1 %icmp.162, i64 0, i64 %tmpv.401.sroa.5.0.copyload
  %ptroff.40 = getelementptr %RR.0, ptr %tmpv.456.sroa.0.0.copyload37, i64 %.tmpv.456.sroa.5.0.copyload
  %sub.112 = sub i64 %tmpv.456.sroa.5.0.copyload40, %tmpv.401.sroa.5.0.copyload
  %call.73 = call i64 @runtime.typedslicecopy(ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %ptroff.40, i64 %sub.112, ptr %targets.sroa.0.0.copyload331, i64 %targets.sroa.7.0.copyload)
  br i1 %trunc.143.not, label %fallthrough.174, label %then.178

fallthrough.176:                                  ; preds = %then.174
  store i64 %add.25, ptr %field.529, align 8
  br label %fallthrough.175

then.178:                                         ; preds = %fallthrough.175
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %sigs5)
  call void @go_0llvm.Elem.Type(ptr nonnull %sret.actual.89, ptr nest undef, ptr nonnull %elem.addr.0.in, i16 zeroext 46)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %sigs5, ptr noundef nonnull align 8 dereferenceable(24) %sret.actual.89, i64 24, i1 false)
  call void @go_0llvm.SubTypeSignature(ptr nonnull %sret.actual.90, ptr nest undef, ptr nonnull byval(%IPST.0) %sigs5, i16 zeroext %call.64)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %sigs5, ptr noundef nonnull align 8 dereferenceable(24) %sret.actual.90, i64 24, i1 false)
  %tmpv.468.sroa.0.0.copyload332 = load ptr, ptr %sigs5, align 8
  %tmpv.468.sroa.2.0.cast.2422.sroa_idx9 = getelementptr inbounds %IPST.0, ptr %sigs5, i64 0, i32 1
  %tmpv.468.sroa.2.0.copyload = load i64, ptr %tmpv.468.sroa.2.0.cast.2422.sroa_idx9, align 8
  %add.26 = add i64 %tmpv.468.sroa.2.0.copyload, %tmpv.456.sroa.5.0.copyload40
  %icmp.164 = icmp ugt i64 %add.26, %tmpv.456.sroa.7.0.copyload43
  br i1 %icmp.164, label %then.179, label %fallthrough.180

then.179:                                         ; preds = %then.178
  call void @runtime.growslice(ptr nonnull %sret.actual.91, ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %tmpv.456.sroa.0.0.copyload37, i64 %tmpv.456.sroa.5.0.copyload40, i64 %tmpv.456.sroa.7.0.copyload43, i64 %add.26)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %rrs, ptr noundef nonnull align 8 dereferenceable(24) %sret.actual.91, i64 24, i1 false)
  %tmpv.466.sroa.0.0.copyload16.pre = load ptr, ptr %rrs, align 8
  %tmpv.466.sroa.5.0.copyload19.pre = load i64, ptr %field.529, align 8
  %tmpv.466.sroa.7.0.copyload22.pre = load i64, ptr %field.530, align 8
  br label %fallthrough.179

fallthrough.179:                                  ; preds = %fallthrough.180, %then.179
  %tmpv.466.sroa.7.0.copyload22 = phi i64 [ %tmpv.456.sroa.7.0.copyload43, %fallthrough.180 ], [ %tmpv.466.sroa.7.0.copyload22.pre, %then.179 ]
  %tmpv.466.sroa.5.0.copyload19 = phi i64 [ %add.26, %fallthrough.180 ], [ %tmpv.466.sroa.5.0.copyload19.pre, %then.179 ]
  %tmpv.466.sroa.0.0.copyload16 = phi ptr [ %tmpv.456.sroa.0.0.copyload37, %fallthrough.180 ], [ %tmpv.466.sroa.0.0.copyload16.pre, %then.179 ]
  %icmp.165 = icmp eq i64 %tmpv.466.sroa.7.0.copyload22, %tmpv.456.sroa.5.0.copyload40
  %.tmpv.466.sroa.5.0.copyload = select i1 %icmp.165, i64 0, i64 %tmpv.456.sroa.5.0.copyload40
  %ptroff.42 = getelementptr %RR.0, ptr %tmpv.466.sroa.0.0.copyload16, i64 %.tmpv.466.sroa.5.0.copyload
  %sub.118 = sub i64 %tmpv.466.sroa.5.0.copyload19, %tmpv.456.sroa.5.0.copyload40
  %call.74 = call i64 @runtime.typedslicecopy(ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %ptroff.42, i64 %sub.118, ptr %tmpv.468.sroa.0.0.copyload332, i64 %tmpv.468.sroa.2.0.copyload)
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %sigs5)
  br label %fallthrough.174

fallthrough.180:                                  ; preds = %then.178
  store i64 %add.26, ptr %field.529, align 8
  br label %fallthrough.179
}

declare void @go_0llvm.Zone.nameFromRight(ptr, ptr, ptr, ptr, i64, i64) #0

define void @go_0llvm.Zone.sync_0rUnlockSlow..stub(ptr nest nocapture readnone %nest.38, ptr %"$this276", i32 %"$p277") #0 {
entry:
  %icmp.257 = icmp eq ptr %"$this276", null
  br i1 %icmp.257, label %then.267, label %else.267, !make.implicit !3

then.267:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.267:                                         ; preds = %entry
  %field.860 = getelementptr inbounds %Zone.0, ptr %"$this276", i64 0, i32 6
  call void @sync.RWMutex.rUnlockSlow(ptr nest undef, ptr nonnull %field.860, i32 %"$p277")
  ret void
}

declare void @go_0llvm.Tree.Glue(ptr, ptr, ptr, ptr, i8) #0

declare { ptr, i8 } @go_0llvm.Tree.Next(ptr, ptr, ptr, i64) #0

declare { ptr, i8 } @go_0llvm.Tree.Prev(ptr, ptr, ptr, i64) #0

declare { ptr, i8 } @go_0llvm.Tree.Search(ptr, ptr, ptr, i64) #0

define i8 @go_0llvm.Node..eq(ptr nest nocapture readnone %nest.60, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.418 = icmp eq ptr %key1, null
  br i1 %icmp.418, label %then.420, label %else.420, !make.implicit !3

then.420:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.420:                                         ; preds = %entry
  %icmp.419 = icmp eq ptr %key2, null
  br i1 %icmp.419, label %then.421, label %else.421, !make.implicit !3

then.421:                                         ; preds = %else.420
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.421:                                         ; preds = %else.420
  %.field.ld.163 = load ptr, ptr %key1, align 8
  %.field.ld.164 = load ptr, ptr %key2, align 8
  %icmp.420.not = icmp eq ptr %.field.ld.163, %.field.ld.164
  br i1 %icmp.420.not, label %else.424, label %common.ret

common.ret:                                       ; preds = %else.421, %else.424, %else.427, %else.430
  %common.ret.op = phi i8 [ %spec.select, %else.430 ], [ 0, %else.427 ], [ 0, %else.424 ], [ 0, %else.421 ]
  ret i8 %common.ret.op

else.424:                                         ; preds = %else.421
  %field.1039 = getelementptr inbounds i8, ptr %key1, i64 8
  %.field.ld.165 = load ptr, ptr %field.1039, align 8
  %field.1040 = getelementptr inbounds i8, ptr %key2, i64 8
  %.field.ld.166 = load ptr, ptr %field.1040, align 8
  %icmp.423.not = icmp eq ptr %.field.ld.165, %.field.ld.166
  br i1 %icmp.423.not, label %else.427, label %common.ret

else.427:                                         ; preds = %else.424
  %field.1041 = getelementptr inbounds i8, ptr %key1, i64 16
  %.field.ld.167 = load ptr, ptr %field.1041, align 8
  %field.1042 = getelementptr inbounds i8, ptr %key2, i64 16
  %.field.ld.168 = load ptr, ptr %field.1042, align 8
  %icmp.426.not = icmp eq ptr %.field.ld.167, %.field.ld.168
  br i1 %icmp.426.not, label %else.430, label %common.ret

else.430:                                         ; preds = %else.427
  %0 = getelementptr inbounds i8, ptr %key1, i64 24
  %.field.ld.169 = load i8, ptr %0, align 1
  %1 = getelementptr inbounds i8, ptr %key2, i64 24
  %.field.ld.170 = load i8, ptr %1, align 1
  %icmp.429.not = icmp eq i8 %.field.ld.169, %.field.ld.170
  %spec.select = zext i1 %icmp.429.not to i8
  br label %common.ret
}

define void @go_0llvm.Apex.ns(ptr nocapture writeonly sret(%IPST.0) %sret.formal.3, ptr nest nocapture readnone %nest.17, ptr readonly %pointer, i8 zeroext %do) #0 {
entry:
  %sret.actual.69 = alloca { ptr, i64, i64 }, align 8
  %icmp.123 = icmp eq ptr %pointer, null
  br i1 %icmp.123, label %then.132, label %else.132, !make.implicit !3

then.132:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.132:                                         ; preds = %entry
  %a.sroa.4.0.cast.2191.sroa_idx62 = getelementptr inbounds %Apex.0, ptr %pointer, i64 0, i32 1, i32 0
  %a.sroa.4.0.copyload = load ptr, ptr %a.sroa.4.0.cast.2191.sroa_idx62, align 8
  %a.sroa.6.0.cast.2191.sroa_idx65 = getelementptr inbounds %Apex.0, ptr %pointer, i64 0, i32 1, i32 1
  %a.sroa.6.0.copyload = load i64, ptr %a.sroa.6.0.cast.2191.sroa_idx65, align 8
  %a.sroa.8.0.cast.2191.sroa_idx68 = getelementptr inbounds %Apex.0, ptr %pointer, i64 0, i32 1, i32 2
  %a.sroa.8.0.copyload = load i64, ptr %a.sroa.8.0.cast.2191.sroa_idx68, align 8
  %a.sroa.1074.0.cast.2191.sroa_idx75 = getelementptr inbounds %Apex.0, ptr %pointer, i64 0, i32 3, i32 0
  %a.sroa.1074.0.copyload87 = load ptr, ptr %a.sroa.1074.0.cast.2191.sroa_idx75, align 8
  %a.sroa.11.0.cast.2191.sroa_idx78 = getelementptr inbounds %Apex.0, ptr %pointer, i64 0, i32 3, i32 1
  %a.sroa.11.0.copyload = load i64, ptr %a.sroa.11.0.cast.2191.sroa_idx78, align 8
  %0 = and i8 %do, 1
  %trunc.138.not = icmp eq i8 %0, 0
  br i1 %trunc.138.not, label %common.ret, label %then.133

then.133:                                         ; preds = %else.132
  %add.18 = add i64 %a.sroa.11.0.copyload, %a.sroa.6.0.copyload
  %icmp.120 = icmp ugt i64 %add.18, %a.sroa.8.0.copyload
  br i1 %icmp.120, label %then.134, label %fallthrough.134

common.ret:                                       ; preds = %else.132, %fallthrough.134
  %tmpv.357.sroa.0.0.sink = phi ptr [ %tmpv.357.sroa.0.0, %fallthrough.134 ], [ %a.sroa.4.0.copyload, %else.132 ]
  %tmpv.357.sroa.3.0.sink = phi i64 [ %tmpv.357.sroa.3.0, %fallthrough.134 ], [ %a.sroa.6.0.copyload, %else.132 ]
  %tmpv.357.sroa.4.0.sink = phi i64 [ %tmpv.357.sroa.4.0, %fallthrough.134 ], [ %a.sroa.8.0.copyload, %else.132 ]
  store ptr %tmpv.357.sroa.0.0.sink, ptr %sret.formal.3, align 8
  %"$ret19.sroa.8.0.cast.2183.sroa_idx44" = getelementptr inbounds %IPST.0, ptr %sret.formal.3, i64 0, i32 1
  store i64 %tmpv.357.sroa.3.0.sink, ptr %"$ret19.sroa.8.0.cast.2183.sroa_idx44", align 8
  %"$ret19.sroa.9.0.cast.2183.sroa_idx52" = getelementptr inbounds %IPST.0, ptr %sret.formal.3, i64 0, i32 2
  store i64 %tmpv.357.sroa.4.0.sink, ptr %"$ret19.sroa.9.0.cast.2183.sroa_idx52", align 8
  ret void

then.134:                                         ; preds = %then.133
  call void @runtime.growslice(ptr nonnull %sret.actual.69, ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %a.sroa.4.0.copyload, i64 %a.sroa.6.0.copyload, i64 %a.sroa.8.0.copyload, i64 %add.18)
  %tmpv.357.sroa.0.0.copyload = load ptr, ptr %sret.actual.69, align 8
  %1 = getelementptr inbounds { ptr, i64, i64 }, ptr %sret.actual.69, i64 0, i32 1
  %tmpv.357.sroa.3.0.copyload = load i64, ptr %1, align 8
  %2 = getelementptr inbounds { ptr, i64, i64 }, ptr %sret.actual.69, i64 0, i32 2
  %tmpv.357.sroa.4.0.copyload = load i64, ptr %2, align 8
  br label %fallthrough.134

fallthrough.134:                                  ; preds = %then.134, %then.133
  %tmpv.357.sroa.0.0 = phi ptr [ %tmpv.357.sroa.0.0.copyload, %then.134 ], [ %a.sroa.4.0.copyload, %then.133 ]
  %tmpv.357.sroa.3.0 = phi i64 [ %tmpv.357.sroa.3.0.copyload, %then.134 ], [ %add.18, %then.133 ]
  %tmpv.357.sroa.4.0 = phi i64 [ %tmpv.357.sroa.4.0.copyload, %then.134 ], [ %a.sroa.8.0.copyload, %then.133 ]
  %icmp.122 = icmp eq i64 %tmpv.357.sroa.4.0, %a.sroa.6.0.copyload
  %.a.sroa.6.0.copyload = select i1 %icmp.122, i64 0, i64 %a.sroa.6.0.copyload
  %ptroff.26 = getelementptr %RR.0, ptr %tmpv.357.sroa.0.0, i64 %.a.sroa.6.0.copyload
  %sub.76 = sub i64 %tmpv.357.sroa.3.0, %a.sroa.6.0.copyload
  %call.63 = call i64 @runtime.typedslicecopy(ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %ptroff.26, i64 %sub.76, ptr %a.sroa.1074.0.copyload87, i64 %a.sroa.11.0.copyload)
  br label %common.ret
}

define void @go_0llvm.Apex.soa(ptr nocapture writeonly sret(%IPST.0) %sret.formal.2, ptr nest nocapture readnone %nest.16, ptr readonly %pointer, i8 zeroext %do) #0 {
entry:
  %tmpv.335 = alloca [1 x %RR.0], align 8, !go_addrtaken !3
  %sret.actual.68 = alloca { ptr, i64, i64 }, align 8
  %tmpv.348 = alloca [1 x %RR.0], align 8, !go_addrtaken !3
  %icmp.119 = icmp eq ptr %pointer, null
  br i1 %icmp.119, label %then.125, label %else.125, !make.implicit !3

then.125:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.125:                                         ; preds = %entry
  %a.sroa.0.0.copyload = load ptr, ptr %pointer, align 8
  %a.sroa.657.0.cast.2161.sroa_idx58 = getelementptr inbounds %Apex.0, ptr %pointer, i64 0, i32 2, i32 0
  %a.sroa.657.0.copyload76 = load ptr, ptr %a.sroa.657.0.cast.2161.sroa_idx58, align 8
  %a.sroa.7.0.cast.2161.sroa_idx61 = getelementptr inbounds %Apex.0, ptr %pointer, i64 0, i32 2, i32 1
  %a.sroa.7.0.copyload = load i64, ptr %a.sroa.7.0.cast.2161.sroa_idx61, align 8
  %0 = and i8 %do, 1
  %trunc.132.not = icmp eq i8 %0, 0
  %call.62 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @type.._61x_7go_0llvm_0RR)
  br i1 %trunc.132.not, label %else.126, label %then.126

then.126:                                         ; preds = %else.125
  store ptr @pimt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.SOA, ptr %tmpv.335, align 8
  %tmpv.333.sroa.2.0.cast.2113.sroa_idx30 = getelementptr inbounds [1 x %RR.0], ptr %tmpv.335, i64 0, i64 0, i32 1
  store ptr %a.sroa.0.0.copyload, ptr %tmpv.333.sroa.2.0.cast.2113.sroa_idx30, align 8
  %deref.ld.13 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.114 = icmp eq i32 %deref.ld.13, 0
  br i1 %icmp.114, label %then.127, label %else.127

else.126:                                         ; preds = %else.125
  store ptr @pimt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.SOA, ptr %tmpv.348, align 8
  %tmpv.346.sroa.2.0.cast.2147.sroa_idx1 = getelementptr inbounds [1 x %RR.0], ptr %tmpv.348, i64 0, i64 0, i32 1
  store ptr %a.sroa.0.0.copyload, ptr %tmpv.346.sroa.2.0.cast.2147.sroa_idx1, align 8
  %deref.ld.14 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.118 = icmp eq i32 %deref.ld.14, 0
  br i1 %icmp.118, label %then.131, label %else.131

then.127:                                         ; preds = %then.126
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %call.62, ptr noundef nonnull align 8 dereferenceable(16) %tmpv.335, i64 16, i1 false)
  br label %fallthrough.127

fallthrough.127:                                  ; preds = %else.127, %then.127
  %add.17 = add i64 %a.sroa.7.0.copyload, 1
  %icmp.115 = icmp ugt i64 %add.17, 1
  br i1 %icmp.115, label %then.128, label %fallthrough.128

else.127:                                         ; preds = %then.126
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @type.._61x_7go_0llvm_0RR, ptr nonnull %call.62, ptr nonnull %tmpv.335)
  br label %fallthrough.127

then.128:                                         ; preds = %fallthrough.127
  call void @runtime.growslice(ptr nonnull %sret.actual.68, ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr nonnull %call.62, i64 1, i64 1, i64 %add.17)
  %tmpv.343.sroa.0.0.copyload = load ptr, ptr %sret.actual.68, align 8
  %1 = getelementptr inbounds { ptr, i64, i64 }, ptr %sret.actual.68, i64 0, i32 1
  %tmpv.343.sroa.3.0.copyload = load i64, ptr %1, align 8
  %2 = getelementptr inbounds { ptr, i64, i64 }, ptr %sret.actual.68, i64 0, i32 2
  %tmpv.343.sroa.4.0.copyload = load i64, ptr %2, align 8
  br label %fallthrough.128

common.ret:                                       ; preds = %then.131, %else.131, %fallthrough.128
  %call.62.sink = phi ptr [ %tmpv.343.sroa.0.0, %fallthrough.128 ], [ %call.62, %else.131 ], [ %call.62, %then.131 ]
  %.sink1 = phi i64 [ %tmpv.343.sroa.3.0, %fallthrough.128 ], [ 1, %else.131 ], [ 1, %then.131 ]
  %.sink = phi i64 [ %tmpv.343.sroa.4.0, %fallthrough.128 ], [ 1, %else.131 ], [ 1, %then.131 ]
  store ptr %call.62.sink, ptr %sret.formal.2, align 8
  %"$ret18.sroa.8.0.cast.2157.sroa_idx41" = getelementptr inbounds %IPST.0, ptr %sret.formal.2, i64 0, i32 1
  store i64 %.sink1, ptr %"$ret18.sroa.8.0.cast.2157.sroa_idx41", align 8
  %"$ret18.sroa.10.0.cast.2157.sroa_idx47" = getelementptr inbounds %IPST.0, ptr %sret.formal.2, i64 0, i32 2
  store i64 %.sink, ptr %"$ret18.sroa.10.0.cast.2157.sroa_idx47", align 8
  ret void

fallthrough.128:                                  ; preds = %then.128, %fallthrough.127
  %tmpv.343.sroa.0.0 = phi ptr [ %tmpv.343.sroa.0.0.copyload, %then.128 ], [ %call.62, %fallthrough.127 ]
  %tmpv.343.sroa.3.0 = phi i64 [ %tmpv.343.sroa.3.0.copyload, %then.128 ], [ %add.17, %fallthrough.127 ]
  %tmpv.343.sroa.4.0 = phi i64 [ %tmpv.343.sroa.4.0.copyload, %then.128 ], [ 1, %fallthrough.127 ]
  %icmp.117 = icmp ne i64 %tmpv.343.sroa.4.0, 1
  %. = zext i1 %icmp.117 to i64
  %ptroff.24 = getelementptr %RR.0, ptr %tmpv.343.sroa.0.0, i64 %.
  %sub.70 = add i64 %tmpv.343.sroa.3.0, -1
  %call.61 = call i64 @runtime.typedslicecopy(ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %ptroff.24, i64 %sub.70, ptr %a.sroa.657.0.copyload76, i64 %a.sroa.7.0.copyload)
  br label %common.ret

then.131:                                         ; preds = %else.126
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %call.62, ptr noundef nonnull align 8 dereferenceable(16) %tmpv.348, i64 16, i1 false)
  br label %common.ret

else.131:                                         ; preds = %else.126
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @type.._61x_7go_0llvm_0RR, ptr nonnull %call.62, ptr nonnull %tmpv.348)
  br label %common.ret
}

declare void @go_0llvm.Upstream.Lookup(ptr, ptr, ptr, ptr, ptr, ptr, ptr, i64, i16) #0

define i8 @go_0llvm.NonWriter..eq(ptr nest nocapture readnone %nest.62, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.468 = icmp eq ptr %key1, null
  br i1 %icmp.468, label %then.467, label %else.467, !make.implicit !3

then.467:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.467:                                         ; preds = %entry
  %icmp.469 = icmp eq ptr %key2, null
  br i1 %icmp.469, label %then.468, label %else.468, !make.implicit !3

then.468:                                         ; preds = %else.467
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.468:                                         ; preds = %else.467
  %ld.120 = load ptr, ptr %key1, align 8
  %field1.57 = getelementptr inbounds i8, ptr %key1, i64 8
  %ld.121 = load ptr, ptr %field1.57, align 8
  %ld.122 = load ptr, ptr %key2, align 8
  %field1.58 = getelementptr inbounds i8, ptr %key2, i64 8
  %ld.123 = load ptr, ptr %field1.58, align 8
  %call.124 = call i8 @runtime.ifaceeq(ptr nest undef, ptr %ld.120, ptr %ld.121, ptr %ld.122, ptr %ld.123)
  %icmp.470.not = icmp eq i8 %call.124, 1
  br i1 %icmp.470.not, label %else.471, label %common.ret

common.ret:                                       ; preds = %else.468, %else.471
  %common.ret.op = phi i8 [ %spec.select, %else.471 ], [ 0, %else.468 ]
  ret i8 %common.ret.op

else.471:                                         ; preds = %else.468
  %field.1094 = getelementptr inbounds i8, ptr %key1, i64 16
  %.field.ld.181 = load ptr, ptr %field.1094, align 8
  %field.1095 = getelementptr inbounds i8, ptr %key2, i64 16
  %.field.ld.182 = load ptr, ptr %field.1095, align 8
  %icmp.473.not = icmp eq ptr %.field.ld.181, %.field.ld.182
  %spec.select = zext i1 %icmp.473.not to i8
  br label %common.ret
}

define { ptr, ptr } @go_0llvm.NonWriter.Close..stub(ptr nest nocapture readnone %nest.47, ptr readonly %"$this293.pointer") #0 {
entry:
  %tmpv.661 = alloca %NonWriter.0, align 8, !go_addrtaken !3
  %call.99 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d)
  %icmp.268 = icmp eq ptr %"$this293.pointer", null
  br i1 %icmp.268, label %then.276, label %else.276, !make.implicit !3

then.276:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.276:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.661, ptr noundef nonnull align 8 dereferenceable(24) %"$this293.pointer", i64 24, i1 false)
  %deref.ld.24 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.269 = icmp eq i32 %deref.ld.24, 0
  br i1 %icmp.269, label %then.277, label %else.277

then.277:                                         ; preds = %else.276
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.99, ptr noundef nonnull align 8 dereferenceable(24) %"$this293.pointer", i64 24, i1 false)
  br label %else.279

else.277:                                         ; preds = %else.276
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d, ptr nonnull %call.99, ptr nonnull %tmpv.661)
  br label %else.279

else.279:                                         ; preds = %else.277, %then.277
  %.field.ld.95 = load ptr, ptr %call.99, align 8
  %field.883 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.95, i64 0, i32 1
  %.field.ld.96 = load ptr, ptr %field.883, align 8
  %field.884 = getelementptr inbounds i8, ptr %call.99, i64 8
  %.field.ld.97 = load ptr, ptr %field.884, align 8
  %call.98 = call { ptr, ptr } %.field.ld.96(ptr nest undef, ptr %.field.ld.97)
  ret { ptr, ptr } %call.98
}

define void @go_0llvm.NonWriter.Hijack..stub(ptr nest nocapture readnone %nest.48, ptr readonly %"$this294.pointer") #0 {
entry:
  %tmpv.667 = alloca %NonWriter.0, align 8, !go_addrtaken !3
  %call.100 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d)
  %icmp.272 = icmp eq ptr %"$this294.pointer", null
  br i1 %icmp.272, label %then.280, label %else.280, !make.implicit !3

then.280:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.280:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.667, ptr noundef nonnull align 8 dereferenceable(24) %"$this294.pointer", i64 24, i1 false)
  %deref.ld.25 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.273 = icmp eq i32 %deref.ld.25, 0
  br i1 %icmp.273, label %then.281, label %else.281

then.281:                                         ; preds = %else.280
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.100, ptr noundef nonnull align 8 dereferenceable(24) %"$this294.pointer", i64 24, i1 false)
  br label %else.283

else.281:                                         ; preds = %else.280
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d, ptr nonnull %call.100, ptr nonnull %tmpv.667)
  br label %else.283

else.283:                                         ; preds = %else.281, %then.281
  %.field.ld.98 = load ptr, ptr %call.100, align 8
  %field.887 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.98, i64 0, i32 2
  %.field.ld.99 = load ptr, ptr %field.887, align 8
  %field.888 = getelementptr inbounds i8, ptr %call.100, i64 8
  %.field.ld.100 = load ptr, ptr %field.888, align 8
  call void %.field.ld.99(ptr nest undef, ptr %.field.ld.100)
  ret void
}

define { ptr, ptr } @go_0llvm.NonWriter.LocalAddr..stub(ptr nest nocapture readnone %nest.49, ptr readonly %"$this295.pointer") #0 {
entry:
  %tmpv.674 = alloca %NonWriter.0, align 8, !go_addrtaken !3
  %call.102 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d)
  %icmp.276 = icmp eq ptr %"$this295.pointer", null
  br i1 %icmp.276, label %then.284, label %else.284, !make.implicit !3

then.284:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.284:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.674, ptr noundef nonnull align 8 dereferenceable(24) %"$this295.pointer", i64 24, i1 false)
  %deref.ld.26 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.277 = icmp eq i32 %deref.ld.26, 0
  br i1 %icmp.277, label %then.285, label %else.285

then.285:                                         ; preds = %else.284
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.102, ptr noundef nonnull align 8 dereferenceable(24) %"$this295.pointer", i64 24, i1 false)
  br label %else.287

else.285:                                         ; preds = %else.284
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d, ptr nonnull %call.102, ptr nonnull %tmpv.674)
  br label %else.287

else.287:                                         ; preds = %else.285, %then.285
  %.field.ld.101 = load ptr, ptr %call.102, align 8
  %field.891 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.101, i64 0, i32 3
  %.field.ld.102 = load ptr, ptr %field.891, align 8
  %field.892 = getelementptr inbounds i8, ptr %call.102, i64 8
  %.field.ld.103 = load ptr, ptr %field.892, align 8
  %call.101 = call { ptr, ptr } %.field.ld.102(ptr nest undef, ptr %.field.ld.103)
  ret { ptr, ptr } %call.101
}

define { ptr, ptr } @go_0llvm.NonWriter.RemoteAddr..stub(ptr nest nocapture readnone %nest.50, ptr readonly %"$this296.pointer") #0 {
entry:
  %tmpv.681 = alloca %NonWriter.0, align 8, !go_addrtaken !3
  %call.104 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d)
  %icmp.280 = icmp eq ptr %"$this296.pointer", null
  br i1 %icmp.280, label %then.288, label %else.288, !make.implicit !3

then.288:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.288:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.681, ptr noundef nonnull align 8 dereferenceable(24) %"$this296.pointer", i64 24, i1 false)
  %deref.ld.27 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.281 = icmp eq i32 %deref.ld.27, 0
  br i1 %icmp.281, label %then.289, label %else.289

then.289:                                         ; preds = %else.288
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.104, ptr noundef nonnull align 8 dereferenceable(24) %"$this296.pointer", i64 24, i1 false)
  br label %else.291

else.289:                                         ; preds = %else.288
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d, ptr nonnull %call.104, ptr nonnull %tmpv.681)
  br label %else.291

else.291:                                         ; preds = %else.289, %then.289
  %.field.ld.104 = load ptr, ptr %call.104, align 8
  %field.895 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.104, i64 0, i32 4
  %.field.ld.105 = load ptr, ptr %field.895, align 8
  %field.896 = getelementptr inbounds i8, ptr %call.104, i64 8
  %.field.ld.106 = load ptr, ptr %field.896, align 8
  %call.103 = call { ptr, ptr } %.field.ld.105(ptr nest undef, ptr %.field.ld.106)
  ret { ptr, ptr } %call.103
}

define { ptr, ptr } @go_0llvm.NonWriter.TsigStatus..stub(ptr nest nocapture readnone %nest.51, ptr readonly %"$this297.pointer") #0 {
entry:
  %tmpv.688 = alloca %NonWriter.0, align 8, !go_addrtaken !3
  %call.106 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d)
  %icmp.284 = icmp eq ptr %"$this297.pointer", null
  br i1 %icmp.284, label %then.292, label %else.292, !make.implicit !3

then.292:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.292:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.688, ptr noundef nonnull align 8 dereferenceable(24) %"$this297.pointer", i64 24, i1 false)
  %deref.ld.28 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.285 = icmp eq i32 %deref.ld.28, 0
  br i1 %icmp.285, label %then.293, label %else.293

then.293:                                         ; preds = %else.292
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.106, ptr noundef nonnull align 8 dereferenceable(24) %"$this297.pointer", i64 24, i1 false)
  br label %else.295

else.293:                                         ; preds = %else.292
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d, ptr nonnull %call.106, ptr nonnull %tmpv.688)
  br label %else.295

else.295:                                         ; preds = %else.293, %then.293
  %.field.ld.107 = load ptr, ptr %call.106, align 8
  %field.899 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.107, i64 0, i32 5
  %.field.ld.108 = load ptr, ptr %field.899, align 8
  %field.900 = getelementptr inbounds i8, ptr %call.106, i64 8
  %.field.ld.109 = load ptr, ptr %field.900, align 8
  %call.105 = call { ptr, ptr } %.field.ld.108(ptr nest undef, ptr %.field.ld.109)
  ret { ptr, ptr } %call.105
}

define void @go_0llvm.NonWriter.TsigTimersOnly..stub(ptr nest nocapture readnone %nest.52, ptr readonly %"$this298.pointer", i8 zeroext %"$p299") #0 {
entry:
  %tmpv.694 = alloca %NonWriter.0, align 8, !go_addrtaken !3
  %call.107 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d)
  %icmp.288 = icmp eq ptr %"$this298.pointer", null
  br i1 %icmp.288, label %then.296, label %else.296, !make.implicit !3

then.296:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.296:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.694, ptr noundef nonnull align 8 dereferenceable(24) %"$this298.pointer", i64 24, i1 false)
  %deref.ld.29 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.289 = icmp eq i32 %deref.ld.29, 0
  br i1 %icmp.289, label %then.297, label %else.297

then.297:                                         ; preds = %else.296
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.107, ptr noundef nonnull align 8 dereferenceable(24) %"$this298.pointer", i64 24, i1 false)
  br label %else.299

else.297:                                         ; preds = %else.296
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d, ptr nonnull %call.107, ptr nonnull %tmpv.694)
  br label %else.299

else.299:                                         ; preds = %else.297, %then.297
  %.field.ld.110 = load ptr, ptr %call.107, align 8
  %field.903 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.110, i64 0, i32 6
  %.field.ld.111 = load ptr, ptr %field.903, align 8
  %field.904 = getelementptr inbounds i8, ptr %call.107, i64 8
  %.field.ld.112 = load ptr, ptr %field.904, align 8
  call void %.field.ld.111(ptr nest undef, ptr %.field.ld.112, i8 zeroext %"$p299")
  ret void
}

define void @go_0llvm.NonWriter.Write..stub(ptr nocapture writeonly sret({ i64, %error.0 }) %sret.formal.11, ptr nest nocapture readnone %nest.53, ptr readonly %"$this300.pointer", ptr byval({ ptr, i64, i64 }) %"$p301") #0 {
entry:
  %sret.actual.118 = alloca { i64, %error.0 }, align 8
  %tmpv.705 = alloca %NonWriter.0, align 8, !go_addrtaken !3
  %call.108 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d)
  %icmp.292 = icmp eq ptr %"$this300.pointer", null
  br i1 %icmp.292, label %then.300, label %else.300, !make.implicit !3

then.300:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.300:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.705, ptr noundef nonnull align 8 dereferenceable(24) %"$this300.pointer", i64 24, i1 false)
  %deref.ld.30 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.293 = icmp eq i32 %deref.ld.30, 0
  br i1 %icmp.293, label %then.301, label %else.301

then.301:                                         ; preds = %else.300
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.108, ptr noundef nonnull align 8 dereferenceable(24) %"$this300.pointer", i64 24, i1 false)
  br label %fallthrough.301

fallthrough.301:                                  ; preds = %else.301, %then.301
  %.field.ld.113 = load ptr, ptr %call.108, align 8
  %field.907 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.113, i64 0, i32 7
  %.field.ld.114 = load ptr, ptr %field.907, align 8
  %field.908 = getelementptr inbounds i8, ptr %call.108, i64 8
  %.field.ld.115 = load ptr, ptr %field.908, align 8
  call void %.field.ld.114(ptr nonnull %sret.actual.118, ptr nest undef, ptr %.field.ld.115, ptr nonnull byval({ ptr, i64, i64 }) %"$p301")
  %tmpv.696.sroa.0.0.copyload = load i64, ptr %sret.actual.118, align 8
  %tmpv.696.sroa.2.0.cast.2989.sroa_idx = getelementptr inbounds { i64, %error.0 }, ptr %sret.actual.118, i64 0, i32 1
  %tmp.39.sroa.2.0.cast.2998.sroa_idx = getelementptr inbounds { i64, %error.0 }, ptr %sret.formal.11, i64 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %tmp.39.sroa.2.0.cast.2998.sroa_idx, ptr noundef nonnull align 8 dereferenceable(16) %tmpv.696.sroa.2.0.cast.2989.sroa_idx, i64 16, i1 false)
  store i64 %tmpv.696.sroa.0.0.copyload, ptr %sret.formal.11, align 8
  ret void

else.301:                                         ; preds = %else.300
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d, ptr nonnull %call.108, ptr nonnull %tmpv.705)
  br label %fallthrough.301
}

define { ptr, ptr } @go_0llvm.NonWriter.WriteMsg..stub(ptr nest nocapture readnone %nest.54, ptr readonly %"$this302.pointer", ptr %"$p303") #0 {
entry:
  %tmpv.712 = alloca %NonWriter.0, align 8, !go_addrtaken !3
  %call.110 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d)
  %icmp.296 = icmp eq ptr %"$this302.pointer", null
  br i1 %icmp.296, label %then.304, label %else.304, !make.implicit !3

then.304:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.304:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.712, ptr noundef nonnull align 8 dereferenceable(24) %"$this302.pointer", i64 24, i1 false)
  %deref.ld.31 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.297 = icmp eq i32 %deref.ld.31, 0
  br i1 %icmp.297, label %then.305, label %else.305

then.305:                                         ; preds = %else.304
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.110, ptr noundef nonnull align 8 dereferenceable(24) %"$this302.pointer", i64 24, i1 false)
  br label %else.307

else.305:                                         ; preds = %else.304
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d, ptr nonnull %call.110, ptr nonnull %tmpv.712)
  br label %else.307

else.307:                                         ; preds = %else.305, %then.305
  %.field.ld.116 = load ptr, ptr %call.110, align 8
  %field.915 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.116, i64 0, i32 8
  %.field.ld.117 = load ptr, ptr %field.915, align 8
  %field.916 = getelementptr inbounds i8, ptr %call.110, i64 8
  %.field.ld.118 = load ptr, ptr %field.916, align 8
  %call.109 = call { ptr, ptr } %.field.ld.117(ptr nest undef, ptr %.field.ld.118, ptr %"$p303")
  ret { ptr, ptr } %call.109
}

declare i8 @runtime.ifaceE2T2(ptr, ptr, ptr, ptr, ptr) local_unnamed_addr #0

declare { ptr, i64 } @go_0llvm.replaceWithAsteriskLabel(ptr, ptr, i64) local_unnamed_addr #0

; Function Attrs: noreturn
declare void @runtime.goPanicIndex(ptr, i64, i64) local_unnamed_addr #2

; Function Attrs: noreturn
declare void @runtime.panicdottype(ptr, ptr, ptr, ptr) local_unnamed_addr #2

declare ptr @go_0llvm.synthesizeCNAME(ptr, ptr, i64, ptr) local_unnamed_addr #0

declare { ptr, ptr } @context.WithValue(ptr, ptr, ptr, ptr, ptr, ptr, ptr) local_unnamed_addr #0

; Function Attrs: cold
declare void @runtime.growslice(ptr, ptr, ptr, ptr, i64, i64, i64) local_unnamed_addr #3

declare i64 @runtime.typedslicecopy(ptr, ptr, ptr, i64, ptr, i64) local_unnamed_addr #0

define internal fastcc void @go_0llvm.typeFromElem(ptr nocapture writeonly sret(%IPST.0) %sret.formal.1, ptr %elem, i16 zeroext %tp, i8 zeroext %do) unnamed_addr #0 {
entry:
  %sret.actual.64 = alloca %IPST.0, align 8
  %sigs = alloca %IPST.0, align 8
  %sret.actual.65 = alloca %IPST.0, align 8
  %sret.actual.66 = alloca %IPST.0, align 8
  %sret.actual.67 = alloca { ptr, i64, i64 }, align 8
  call void @go_0llvm.Elem.Type(ptr nonnull %sret.actual.64, ptr nest undef, ptr %elem, i16 zeroext %tp)
  %rrs.sroa.0.0.copyload = load ptr, ptr %sret.actual.64, align 8
  %rrs.sroa.8.0.cast.2083.sroa_idx25 = getelementptr inbounds %IPST.0, ptr %sret.actual.64, i64 0, i32 1
  %rrs.sroa.8.0.copyload = load i64, ptr %rrs.sroa.8.0.cast.2083.sroa_idx25, align 8
  %rrs.sroa.11.0.cast.2083.sroa_idx31 = getelementptr inbounds %IPST.0, ptr %sret.actual.64, i64 0, i32 2
  %rrs.sroa.11.0.copyload = load i64, ptr %rrs.sroa.11.0.cast.2083.sroa_idx31, align 8
  %0 = and i8 %do, 1
  %trunc.127.not = icmp eq i8 %0, 0
  br i1 %trunc.127.not, label %fallthrough.121, label %then.121

then.121:                                         ; preds = %entry
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %sigs)
  call void @go_0llvm.Elem.Type(ptr nonnull %sret.actual.65, ptr nest undef, ptr %elem, i16 zeroext 46)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %sigs, ptr noundef nonnull align 8 dereferenceable(24) %sret.actual.65, i64 24, i1 false)
  call void @go_0llvm.SubTypeSignature(ptr nonnull %sret.actual.66, ptr nest undef, ptr nonnull byval(%IPST.0) %sigs, i16 zeroext %tp)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %sigs, ptr noundef nonnull align 8 dereferenceable(24) %sret.actual.66, i64 24, i1 false)
  %tmpv.326.sroa.0.0.copyload1 = load ptr, ptr %sigs, align 8
  %tmpv.326.sroa.2.0.cast.2093.sroa_idx4 = getelementptr inbounds %IPST.0, ptr %sigs, i64 0, i32 1
  %tmpv.326.sroa.2.0.copyload = load i64, ptr %tmpv.326.sroa.2.0.cast.2093.sroa_idx4, align 8
  %add.16 = add i64 %tmpv.326.sroa.2.0.copyload, %rrs.sroa.8.0.copyload
  %icmp.112 = icmp ugt i64 %add.16, %rrs.sroa.11.0.copyload
  br i1 %icmp.112, label %then.122, label %fallthrough.122

fallthrough.121:                                  ; preds = %fallthrough.122, %entry
  %rrs.sroa.0.0 = phi ptr [ %rrs.sroa.0.1, %fallthrough.122 ], [ %rrs.sroa.0.0.copyload, %entry ]
  %rrs.sroa.8.0 = phi i64 [ %rrs.sroa.8.1, %fallthrough.122 ], [ %rrs.sroa.8.0.copyload, %entry ]
  %rrs.sroa.11.0 = phi i64 [ %rrs.sroa.11.1, %fallthrough.122 ], [ %rrs.sroa.11.0.copyload, %entry ]
  store ptr %rrs.sroa.0.0, ptr %sret.formal.1, align 8
  %"$ret17.sroa.5.0.cast.2106.sroa_idx40" = getelementptr inbounds %IPST.0, ptr %sret.formal.1, i64 0, i32 1
  store i64 %rrs.sroa.8.0, ptr %"$ret17.sroa.5.0.cast.2106.sroa_idx40", align 8
  %"$ret17.sroa.6.0.cast.2106.sroa_idx43" = getelementptr inbounds %IPST.0, ptr %sret.formal.1, i64 0, i32 2
  store i64 %rrs.sroa.11.0, ptr %"$ret17.sroa.6.0.cast.2106.sroa_idx43", align 8
  ret void

then.122:                                         ; preds = %then.121
  call void @runtime.growslice(ptr nonnull %sret.actual.67, ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %rrs.sroa.0.0.copyload, i64 %rrs.sroa.8.0.copyload, i64 %rrs.sroa.11.0.copyload, i64 %add.16)
  %rrs.sroa.0.0.copyload22 = load ptr, ptr %sret.actual.67, align 8
  %1 = getelementptr inbounds { ptr, i64, i64 }, ptr %sret.actual.67, i64 0, i32 1
  %rrs.sroa.8.0.copyload27 = load i64, ptr %1, align 8
  %2 = getelementptr inbounds { ptr, i64, i64 }, ptr %sret.actual.67, i64 0, i32 2
  %rrs.sroa.11.0.copyload33 = load i64, ptr %2, align 8
  br label %fallthrough.122

fallthrough.122:                                  ; preds = %then.122, %then.121
  %rrs.sroa.0.1 = phi ptr [ %rrs.sroa.0.0.copyload22, %then.122 ], [ %rrs.sroa.0.0.copyload, %then.121 ]
  %rrs.sroa.8.1 = phi i64 [ %rrs.sroa.8.0.copyload27, %then.122 ], [ %add.16, %then.121 ]
  %rrs.sroa.11.1 = phi i64 [ %rrs.sroa.11.0.copyload33, %then.122 ], [ %rrs.sroa.11.0.copyload, %then.121 ]
  %icmp.113 = icmp eq i64 %rrs.sroa.11.1, %rrs.sroa.8.0.copyload
  %.rrs.sroa.8.0.copyload = select i1 %icmp.113, i64 0, i64 %rrs.sroa.8.0.copyload
  %ptroff.22 = getelementptr %RR.0, ptr %rrs.sroa.0.1, i64 %.rrs.sroa.8.0.copyload
  %sub.64 = sub i64 %rrs.sroa.8.1, %rrs.sroa.8.0.copyload
  %call.59 = call i64 @runtime.typedslicecopy(ptr nest undef, ptr nonnull @go_0llvm.RR..d, ptr %ptroff.22, i64 %sub.64, ptr %tmpv.326.sroa.0.0.copyload1, i64 %tmpv.326.sroa.2.0.copyload)
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %sigs)
  br label %fallthrough.121
}

define internal { ptr, i64 } @go_0llvm.Zone.Lookup..func1(ptr nest nocapture readonly %"$closure") #0 {
entry:
  %field.428 = getelementptr inbounds i8, ptr %"$closure", i64 8
  %.field.ld.33 = load ptr, ptr %field.428, align 8
  %.ld.69 = load ptr, ptr %.field.ld.33, align 8
  %call.58 = call { ptr, i64 } @go_0llvm.Elem.Name(ptr nest undef, ptr %.ld.69)
  ret { ptr, i64 } %call.58
}

declare { ptr, i64 } @runtime.concatstrings(ptr, ptr, ptr, i64) local_unnamed_addr #0

declare void @sync.RWMutex.Unlock(ptr, ptr) local_unnamed_addr #0

declare void @sync.RWMutex.Lock(ptr, ptr) local_unnamed_addr #0

declare void @sync.RWMutex.rUnlockSlow(ptr, ptr, i32) local_unnamed_addr #0

declare void @sync.RWMutex.RUnlock(ptr, ptr) local_unnamed_addr #0

declare void @sync.RWMutex.RLock(ptr, ptr) local_unnamed_addr #0

declare i8 @runtime.ifaceeq(ptr, ptr, ptr, ptr, ptr) local_unnamed_addr #0

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._632_7uint8..eq(ptr nest nocapture readnone %nest.68, ptr readonly %key1, ptr readonly %key2) #4 {
entry:
  %call.135 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 32)
  ret i8 %call.135
}

; Function Attrs: nofree memory(argmem: read)
declare i8 @runtime.memequal(ptr, ptr, ptr, i64) local_unnamed_addr #5

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._65_7uint8..eq(ptr nest nocapture readnone %nest.69, ptr readonly %key1, ptr readonly %key2) #4 {
entry:
  %call.136 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 5)
  ret i8 %call.136
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._628_7uint8..eq(ptr nest nocapture readnone %nest.70, ptr readonly %key1, ptr readonly %key2) #4 {
entry:
  %call.137 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 28)
  ret i8 %call.137
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._6255_7uint8..eq(ptr nest nocapture readnone %nest.71, ptr readonly %key1, ptr readonly %key2) #4 {
entry:
  %call.138 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 255)
  ret i8 %call.138
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._616_7uint8..eq(ptr nest nocapture readnone %nest.72, ptr readonly %key1, ptr readonly %key2) #4 {
entry:
  %call.139 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 16)
  ret i8 %call.139
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._64_7uint8..eq(ptr nest nocapture readnone %nest.73, ptr readonly %key1, ptr readonly %key2) #4 {
entry:
  %call.140 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 4)
  ret i8 %call.140
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._6127_7bool..eq(ptr nest nocapture readnone %nest.74, ptr readonly %key1, ptr readonly %key2) #4 {
entry:
  %call.141 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 127)
  ret i8 %call.141
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._6256_7bool..eq(ptr nest nocapture readnone %nest.75, ptr readonly %key1, ptr readonly %key2) #4 {
entry:
  %call.142 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 256)
  ret i8 %call.142
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._614_7int8..eq(ptr nest nocapture readnone %nest.76, ptr readonly %key1, ptr readonly %key2) #4 {
entry:
  %call.143 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 14)
  ret i8 %call.143
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._696_7int8..eq(ptr nest nocapture readnone %nest.77, ptr readonly %key1, ptr readonly %key2) #4 {
entry:
  %call.144 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 96)
  ret i8 %call.144
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._68_7uint8..eq(ptr nest nocapture readnone %nest.78, ptr readonly %key1, ptr readonly %key2) #4 {
entry:
  %call.145 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 8)
  ret i8 %call.145
}

define i8 @go_0llvm._65_7string..eq(ptr nest nocapture readnone %nest.79, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.575 = icmp eq ptr %key1, null
  br i1 %icmp.575, label %then.562, label %else.562, !make.implicit !3

then.562:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.562:                                         ; preds = %entry
  %icmp.576 = icmp eq ptr %key2, null
  %tmpv.1014.sroa.0.0.copyload = load ptr, ptr %key1, align 8
  br i1 %icmp.576, label %then.563, label %else.563, !make.implicit !3

then.563:                                         ; preds = %else.562
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.563:                                         ; preds = %else.562
  %tmpv.1014.sroa.3.0.cast.3328.sroa_idx3 = getelementptr i8, ptr %key1, i64 8
  %tmpv.1014.sroa.3.0.copyload = load i64, ptr %tmpv.1014.sroa.3.0.cast.3328.sroa_idx3, align 8
  %tmpv.1016.sroa.0.0.copyload = load ptr, ptr %key2, align 8
  %tmpv.1016.sroa.3.0.cast.3331.sroa_idx1 = getelementptr i8, ptr %key2, i64 8
  %tmpv.1016.sroa.3.0.copyload = load i64, ptr %tmpv.1016.sroa.3.0.cast.3331.sroa_idx1, align 8
  %icmp.577 = icmp eq i64 %tmpv.1014.sroa.3.0.copyload, %tmpv.1016.sroa.3.0.copyload
  br i1 %icmp.577, label %then.564, label %then.566

then.564:                                         ; preds = %else.563
  %icmp.578 = icmp eq ptr %tmpv.1014.sroa.0.0.copyload, %tmpv.1016.sroa.0.0.copyload
  br i1 %icmp.578, label %else.562.1, label %else.565

else.565:                                         ; preds = %then.564
  %bcmp = call i32 @bcmp(ptr %tmpv.1014.sroa.0.0.copyload, ptr %tmpv.1016.sroa.0.0.copyload, i64 %tmpv.1014.sroa.3.0.copyload)
  %icmp.579 = icmp eq i32 %bcmp, 0
  br i1 %icmp.579, label %else.562.1, label %then.566

then.566:                                         ; preds = %else.565.4, %then.564.4, %else.562.4, %else.565.3, %else.562.3, %else.565.2, %else.562.2, %else.565.1, %else.562.1, %else.565, %else.563
  %merge = phi i8 [ 0, %else.562.3 ], [ 0, %else.562.2 ], [ 0, %else.562.1 ], [ 0, %else.565.3 ], [ 0, %else.565.2 ], [ 0, %else.565.1 ], [ 0, %else.565 ], [ 0, %else.563 ], [ 0, %else.562.4 ], [ %phi.cast, %else.565.4 ], [ 1, %then.564.4 ]
  ret i8 %merge

else.562.1:                                       ; preds = %then.564, %else.565
  %tmpv.1014.sroa.0.0.cast.3328.sroa_idx.1 = getelementptr i8, ptr %key1, i64 16
  %tmpv.1014.sroa.0.0.copyload.1 = load ptr, ptr %tmpv.1014.sroa.0.0.cast.3328.sroa_idx.1, align 8
  %tmpv.1014.sroa.3.0.cast.3328.sroa_idx3.1 = getelementptr i8, ptr %key1, i64 24
  %tmpv.1014.sroa.3.0.copyload.1 = load i64, ptr %tmpv.1014.sroa.3.0.cast.3328.sroa_idx3.1, align 8
  %tmpv.1016.sroa.0.0.cast.3331.sroa_idx.1 = getelementptr i8, ptr %key2, i64 16
  %tmpv.1016.sroa.0.0.copyload.1 = load ptr, ptr %tmpv.1016.sroa.0.0.cast.3331.sroa_idx.1, align 8
  %tmpv.1016.sroa.3.0.cast.3331.sroa_idx1.1 = getelementptr i8, ptr %key2, i64 24
  %tmpv.1016.sroa.3.0.copyload.1 = load i64, ptr %tmpv.1016.sroa.3.0.cast.3331.sroa_idx1.1, align 8
  %icmp.577.1 = icmp eq i64 %tmpv.1014.sroa.3.0.copyload.1, %tmpv.1016.sroa.3.0.copyload.1
  br i1 %icmp.577.1, label %then.564.1, label %then.566

then.564.1:                                       ; preds = %else.562.1
  %icmp.578.1 = icmp eq ptr %tmpv.1014.sroa.0.0.copyload.1, %tmpv.1016.sroa.0.0.copyload.1
  br i1 %icmp.578.1, label %else.562.2, label %else.565.1

else.565.1:                                       ; preds = %then.564.1
  %bcmp1 = call i32 @bcmp(ptr %tmpv.1014.sroa.0.0.copyload.1, ptr %tmpv.1016.sroa.0.0.copyload.1, i64 %tmpv.1014.sroa.3.0.copyload.1)
  %icmp.579.1 = icmp eq i32 %bcmp1, 0
  br i1 %icmp.579.1, label %else.562.2, label %then.566

else.562.2:                                       ; preds = %then.564.1, %else.565.1
  %tmpv.1014.sroa.0.0.cast.3328.sroa_idx.2 = getelementptr i8, ptr %key1, i64 32
  %tmpv.1014.sroa.0.0.copyload.2 = load ptr, ptr %tmpv.1014.sroa.0.0.cast.3328.sroa_idx.2, align 8
  %tmpv.1014.sroa.3.0.cast.3328.sroa_idx3.2 = getelementptr i8, ptr %key1, i64 40
  %tmpv.1014.sroa.3.0.copyload.2 = load i64, ptr %tmpv.1014.sroa.3.0.cast.3328.sroa_idx3.2, align 8
  %tmpv.1016.sroa.0.0.cast.3331.sroa_idx.2 = getelementptr i8, ptr %key2, i64 32
  %tmpv.1016.sroa.0.0.copyload.2 = load ptr, ptr %tmpv.1016.sroa.0.0.cast.3331.sroa_idx.2, align 8
  %tmpv.1016.sroa.3.0.cast.3331.sroa_idx1.2 = getelementptr i8, ptr %key2, i64 40
  %tmpv.1016.sroa.3.0.copyload.2 = load i64, ptr %tmpv.1016.sroa.3.0.cast.3331.sroa_idx1.2, align 8
  %icmp.577.2 = icmp eq i64 %tmpv.1014.sroa.3.0.copyload.2, %tmpv.1016.sroa.3.0.copyload.2
  br i1 %icmp.577.2, label %then.564.2, label %then.566

then.564.2:                                       ; preds = %else.562.2
  %icmp.578.2 = icmp eq ptr %tmpv.1014.sroa.0.0.copyload.2, %tmpv.1016.sroa.0.0.copyload.2
  br i1 %icmp.578.2, label %else.562.3, label %else.565.2

else.565.2:                                       ; preds = %then.564.2
  %bcmp2 = call i32 @bcmp(ptr %tmpv.1014.sroa.0.0.copyload.2, ptr %tmpv.1016.sroa.0.0.copyload.2, i64 %tmpv.1014.sroa.3.0.copyload.2)
  %icmp.579.2 = icmp eq i32 %bcmp2, 0
  br i1 %icmp.579.2, label %else.562.3, label %then.566

else.562.3:                                       ; preds = %then.564.2, %else.565.2
  %tmpv.1014.sroa.0.0.cast.3328.sroa_idx.3 = getelementptr i8, ptr %key1, i64 48
  %tmpv.1014.sroa.0.0.copyload.3 = load ptr, ptr %tmpv.1014.sroa.0.0.cast.3328.sroa_idx.3, align 8
  %tmpv.1014.sroa.3.0.cast.3328.sroa_idx3.3 = getelementptr i8, ptr %key1, i64 56
  %tmpv.1014.sroa.3.0.copyload.3 = load i64, ptr %tmpv.1014.sroa.3.0.cast.3328.sroa_idx3.3, align 8
  %tmpv.1016.sroa.0.0.cast.3331.sroa_idx.3 = getelementptr i8, ptr %key2, i64 48
  %tmpv.1016.sroa.0.0.copyload.3 = load ptr, ptr %tmpv.1016.sroa.0.0.cast.3331.sroa_idx.3, align 8
  %tmpv.1016.sroa.3.0.cast.3331.sroa_idx1.3 = getelementptr i8, ptr %key2, i64 56
  %tmpv.1016.sroa.3.0.copyload.3 = load i64, ptr %tmpv.1016.sroa.3.0.cast.3331.sroa_idx1.3, align 8
  %icmp.577.3 = icmp eq i64 %tmpv.1014.sroa.3.0.copyload.3, %tmpv.1016.sroa.3.0.copyload.3
  br i1 %icmp.577.3, label %then.564.3, label %then.566

then.564.3:                                       ; preds = %else.562.3
  %icmp.578.3 = icmp eq ptr %tmpv.1014.sroa.0.0.copyload.3, %tmpv.1016.sroa.0.0.copyload.3
  br i1 %icmp.578.3, label %else.562.4, label %else.565.3

else.565.3:                                       ; preds = %then.564.3
  %bcmp3 = call i32 @bcmp(ptr %tmpv.1014.sroa.0.0.copyload.3, ptr %tmpv.1016.sroa.0.0.copyload.3, i64 %tmpv.1014.sroa.3.0.copyload.3)
  %icmp.579.3 = icmp eq i32 %bcmp3, 0
  br i1 %icmp.579.3, label %else.562.4, label %then.566

else.562.4:                                       ; preds = %then.564.3, %else.565.3
  %tmpv.1014.sroa.0.0.cast.3328.sroa_idx.4 = getelementptr i8, ptr %key1, i64 64
  %tmpv.1014.sroa.0.0.copyload.4 = load ptr, ptr %tmpv.1014.sroa.0.0.cast.3328.sroa_idx.4, align 8
  %tmpv.1014.sroa.3.0.cast.3328.sroa_idx3.4 = getelementptr i8, ptr %key1, i64 72
  %tmpv.1014.sroa.3.0.copyload.4 = load i64, ptr %tmpv.1014.sroa.3.0.cast.3328.sroa_idx3.4, align 8
  %tmpv.1016.sroa.0.0.cast.3331.sroa_idx.4 = getelementptr i8, ptr %key2, i64 64
  %tmpv.1016.sroa.0.0.copyload.4 = load ptr, ptr %tmpv.1016.sroa.0.0.cast.3331.sroa_idx.4, align 8
  %tmpv.1016.sroa.3.0.cast.3331.sroa_idx1.4 = getelementptr i8, ptr %key2, i64 72
  %tmpv.1016.sroa.3.0.copyload.4 = load i64, ptr %tmpv.1016.sroa.3.0.cast.3331.sroa_idx1.4, align 8
  %icmp.577.4 = icmp eq i64 %tmpv.1014.sroa.3.0.copyload.4, %tmpv.1016.sroa.3.0.copyload.4
  br i1 %icmp.577.4, label %then.564.4, label %then.566

then.564.4:                                       ; preds = %else.562.4
  %icmp.578.4 = icmp eq ptr %tmpv.1014.sroa.0.0.copyload.4, %tmpv.1016.sroa.0.0.copyload.4
  br i1 %icmp.578.4, label %then.566, label %else.565.4

else.565.4:                                       ; preds = %then.564.4
  %bcmp4 = call i32 @bcmp(ptr %tmpv.1014.sroa.0.0.copyload.4, ptr %tmpv.1016.sroa.0.0.copyload.4, i64 %tmpv.1014.sroa.3.0.copyload.4)
  %icmp.579.4 = icmp eq i32 %bcmp4, 0
  %phi.cast = zext i1 %icmp.579.4 to i8
  br label %then.566
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._6128_7uint64..eq(ptr nest nocapture readnone %nest.80, ptr readonly %key1, ptr readonly %key2) #4 {
entry:
  %call.147 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 1024)
  ret i8 %call.147
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._665_7int8..eq(ptr nest nocapture readnone %nest.81, ptr readonly %key1, ptr readonly %key2) #4 {
entry:
  %call.148 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 65)
  ret i8 %call.148
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._613_7int32..eq(ptr nest nocapture readnone %nest.82, ptr readonly %key1, ptr readonly %key2) #4 {
entry:
  %call.149 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 52)
  ret i8 %call.149
}

declare void @sync.rlocker.Lock(ptr, ptr) #0

declare void @sync.rlocker.Unlock(ptr, ptr) #0

declare void @runtime.registerGCRoots(ptr, ptr) local_unnamed_addr #0

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #6

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #7

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #7

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #8

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memmove.p0.p0.i64(ptr nocapture writeonly, ptr nocapture readonly, i64, i1 immarg) #6

; Function Attrs: nofree nounwind willreturn memory(argmem: read)
declare i32 @bcmp(ptr nocapture, ptr nocapture, i64) local_unnamed_addr #9

