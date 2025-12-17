target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"

%StructType.0 = type { %_type.0, %IPST.43 }
%_type.0 = type { i64, i64, i32, i8, i8, i8, i8, ptr, ptr, ptr, ptr, ptr }
%IPST.43 = type { ptr, i64, i64 }
%method.0 = type { ptr, ptr, ptr, ptr, ptr }
%uncommonType.0 = type { ptr, ptr, %IPST.41 }
%IPST.41 = type { ptr, i64, i64 }
%PtrType.0 = type { %_type.0, ptr }
%functionDescriptor.0 = type { i64 }
%FuncType.0 = type { %_type.0, i8, %IPST.42, %IPST.42 }
%IPST.42 = type { ptr, i64, i64 }
%structField.0 = type { ptr, ptr, ptr, ptr, i64 }
%SliceType.0 = type { %_type.0, ptr }
%InterfaceType.0 = type { %_type.0, %IPST.44 }
%IPST.44 = type { ptr, i64, i64 }
%imethod.0 = type { ptr, ptr, ptr }
%MapType.0 = type { %_type.0, ptr, ptr, ptr, ptr, i8, i8, i16, i32 }
%ArrayType.0 = type { %_type.0, ptr, ptr, i64 }
%ChanType.0 = type { %_type.0, ptr, i64 }
%OPT.0 = type { %RR_Header.0, %IPST.0 }
%RR_Header.0 = type { { ptr, i64 }, i16, i16, i32, i16 }
%IPST.0 = type { ptr, i64, i64 }
%EDNS0.0 = type { ptr, ptr }
%SOA.0 = type { %RR_Header.0, { ptr, i64 }, { ptr, i64 }, i32, i32, i32, i32, i32 }
%DNAME.0 = type { %RR_Header.0, { ptr, i64 } }
%CNAME.0 = type { %RR_Header.0, { ptr, i64 } }
%SRV.0 = type { %RR_Header.0, i16, i16, i16, { ptr, i64 } }
%MX.0 = type { %RR_Header.0, i16, { ptr, i64 } }
%NS.0 = type { %RR_Header.0, { ptr, i64 } }
%RRSIG.0 = type { %RR_Header.0, i16, i8, i8, i32, i32, i32, i16, { ptr, i64 }, { ptr, i64 } }
%ScrubWriter.0 = type { %ResponseWriter.0, ptr }
%ResponseWriter.0 = type { ptr, ptr }
%error.0 = type { ptr, ptr }
%.go.llvm.supported.0 = type { ptr, %RWMutex.0 }
%RWMutex.0 = type { %Mutex.0, i32, i32, i32, i32 }
%Mutex.0 = type { i32, i32 }
%Zone.0 = type { { ptr, i64 }, i64, { ptr, i64 }, ptr, %Apex.0, i8, %RWMutex.0, %Once.0, %IPST.2, i64, ptr, ptr }
%Apex.0 = type { ptr, %IPST.1, %IPST.1, %IPST.1 }
%IPST.1 = type { ptr, i64, i64 }
%Once.0 = type { i32, %Mutex.0 }
%IPST.2 = type { ptr, i64, i64 }
%NonWriter.0 = type { %ResponseWriter.0, ptr }
%IPST.35 = type { ptr, i64, i64 }


@go_0llvm.OPT..d = constant %StructType.0 { %_type.0 { i64 56, i64 40, i32 -1484427225, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..ra, ptr @go..C1, ptr @go..C5, ptr @go_0llvm.OPT..p }, %IPST.43 { ptr @go..C148, i64 2, i64 2 } }
@gcbits..ra = weak constant [1 x i8] c"\11", comdat
@const.0 = private constant [18 x i8] c"\09go.llvm\09llvm.OPT\00", align 1
@go..C1 = internal constant { ptr, i64 } { ptr @const.0, i64 17 }
@const.1 = private constant [4 x i8] c"OPT\00", align 1
@go..C2 = internal constant { ptr, i64 } { ptr @const.1, i64 3 }
@const.2 = private constant [8 x i8] c"go.llvm\00", align 1
@go..C3 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C4 = internal constant [1 x %method.0] zeroinitializer
@go..C5 = internal constant %uncommonType.0 { ptr @go..C2, ptr @go..C3, %IPST.41 { ptr @go..C4, i64 0, i64 0 } }
@go_0llvm.OPT..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 2018968185, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C6, ptr @go..C107, ptr @type.._2_2go_0llvm_0OPT }, ptr @go_0llvm.OPT..d }, comdat
@runtime.memequal64..f = external constant %functionDescriptor.0
@gcbits..ba = weak constant [1 x i8] c"\01", comdat
@const.3 = private constant [19 x i8] c"*\09go.llvm\09llvm.OPT\00", align 1
@go..C6 = internal constant { ptr, i64 } { ptr @const.3, i64 18 }
@const.4 = private constant [3 x i8] c"Do\00", align 1
@go..C7 = internal constant { ptr, i64 } { ptr @const.4, i64 2 }
@type..func_8_9_8bool_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -361864120, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C8, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C9, i64 0, i64 0 }, %IPST.42 { ptr @go..C15, i64 1, i64 1 } }, comdat
@const.5 = private constant [12 x i8] c"func() bool\00", align 1
@go..C8 = internal constant { ptr, i64 } { ptr @const.5, i64 11 }
@go..C9 = internal constant [1 x ptr] zeroinitializer
@bool..d = weak constant %_type.0 { i64 1, i64 0, i32 1537849745, i8 8, i8 1, i8 1, i8 -127, ptr @runtime.memequal8..f, ptr null, ptr @go..C10, ptr @go..C13, ptr @bool..p }, comdat
@runtime.memequal8..f = external constant %functionDescriptor.0
@const.6 = private constant [5 x i8] c"bool\00", align 1
@go..C10 = internal constant { ptr, i64 } { ptr @const.6, i64 4 }
@go..C11 = internal constant { ptr, i64 } { ptr @const.6, i64 4 }
@go..C12 = internal constant [1 x %method.0] zeroinitializer
@go..C13 = internal constant %uncommonType.0 { ptr @go..C11, ptr null, %IPST.41 { ptr @go..C12, i64 0, i64 0 } }
@bool..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1164207847, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C14, ptr null, ptr null }, ptr @bool..d }, comdat
@const.7 = private constant [6 x i8] c"*bool\00", align 1
@go..C14 = internal constant { ptr, i64 } { ptr @const.7, i64 5 }
@go..C15 = internal constant [1 x ptr] [ptr @bool..d]
@type..func_8_2go_0llvm_0OPT_9_8bool_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -179391640, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C16, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C17, i64 1, i64 1 }, %IPST.42 { ptr @go..C18, i64 1, i64 1 } }, comdat
@const.8 = private constant [30 x i8] c"func(*\09go.llvm\09llvm.OPT) bool\00", align 1
@go..C16 = internal constant { ptr, i64 } { ptr @const.8, i64 29 }
@go..C17 = internal constant [1 x ptr] [ptr @go_0llvm.OPT..p]
@go..C18 = internal constant [1 x ptr] [ptr @bool..d]
@const.9 = private constant [7 x i8] c"Header\00", align 1
@go..C19 = internal constant { ptr, i64 } { ptr @const.9, i64 6 }
@type..func_8_9_8_2go_0llvm_0RR__Header_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -608253368, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C20, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C21, i64 0, i64 0 }, %IPST.42 { ptr @go..C50, i64 1, i64 1 } }, comdat
@const.10 = private constant [32 x i8] c"func() *\09go.llvm\09llvm.RR_Header\00", align 1
@go..C20 = internal constant { ptr, i64 } { ptr @const.10, i64 31 }
@go..C21 = internal constant [1 x ptr] zeroinitializer
@go_0llvm.RR__Header..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1553007831, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C22, ptr null, ptr null }, ptr @go_0llvm.RR__Header..d }, comdat
@const.11 = private constant [25 x i8] c"*\09go.llvm\09llvm.RR_Header\00", align 1
@go..C22 = internal constant { ptr, i64 } { ptr @const.11, i64 24 }
@go_0llvm.RR__Header..d = constant %StructType.0 { %_type.0 { i64 32, i64 8, i32 1245114290, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.RR__Header..eq..f, ptr @gcbits..ba, ptr @go..C23, ptr @go..C27, ptr @go_0llvm.RR__Header..p }, %IPST.43 { ptr @go..C49, i64 5, i64 5 } }
@go_0llvm.RR__Header..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.RR__Header..eq to i64) }
@const.12 = private constant [24 x i8] c"\09go.llvm\09llvm.RR_Header\00", align 1
@go..C23 = internal constant { ptr, i64 } { ptr @const.12, i64 23 }
@const.13 = private constant [10 x i8] c"RR_Header\00", align 1
@go..C24 = internal constant { ptr, i64 } { ptr @const.13, i64 9 }
@go..C25 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C26 = internal constant [1 x %method.0] zeroinitializer
@go..C27 = internal constant %uncommonType.0 { ptr @go..C24, ptr @go..C25, %IPST.41 { ptr @go..C26, i64 0, i64 0 } }
@const.14 = private constant [5 x i8] c"Name\00", align 1
@go..C28 = internal constant { ptr, i64 } { ptr @const.14, i64 4 }
@string..d = weak constant %_type.0 { i64 16, i64 8, i32 -1998952806, i8 0, i8 8, i8 8, i8 24, ptr @runtime.strequal..f, ptr @gcbits..ba, ptr @go..C29, ptr @go..C32, ptr @string..p }, comdat
@runtime.strequal..f = external constant %functionDescriptor.0
@const.15 = private constant [7 x i8] c"string\00", align 1
@go..C29 = internal constant { ptr, i64 } { ptr @const.15, i64 6 }
@go..C30 = internal constant { ptr, i64 } { ptr @const.15, i64 6 }
@go..C31 = internal constant [1 x %method.0] zeroinitializer
@go..C32 = internal constant %uncommonType.0 { ptr @go..C30, ptr null, %IPST.41 { ptr @go..C31, i64 0, i64 0 } }
@string..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1918473815, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C33, ptr null, ptr null }, ptr @string..d }, comdat
@const.16 = private constant [8 x i8] c"*string\00", align 1
@go..C33 = internal constant { ptr, i64 } { ptr @const.16, i64 7 }
@const.17 = private constant [19 x i8] c"dns:\22cdomain-name\22\00", align 1
@go..C34 = internal constant { ptr, i64 } { ptr @const.17, i64 18 }
@const.18 = private constant [7 x i8] c"Rrtype\00", align 1
@go..C35 = internal constant { ptr, i64 } { ptr @const.18, i64 6 }
@uint16..d = weak constant %_type.0 { i64 2, i64 0, i32 76732288, i8 8, i8 2, i8 2, i8 -119, ptr @runtime.memequal16..f, ptr null, ptr @go..C36, ptr @go..C39, ptr @uint16..p }, comdat
@runtime.memequal16..f = external constant %functionDescriptor.0
@const.19 = private constant [7 x i8] c"uint16\00", align 1
@go..C36 = internal constant { ptr, i64 } { ptr @const.19, i64 6 }
@go..C37 = internal constant { ptr, i64 } { ptr @const.19, i64 6 }
@go..C38 = internal constant [1 x %method.0] zeroinitializer
@go..C39 = internal constant %uncommonType.0 { ptr @go..C37, ptr null, %IPST.41 { ptr @go..C38, i64 0, i64 0 } }
@uint16..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1227716617, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C40, ptr null, ptr null }, ptr @uint16..d }, comdat
@const.20 = private constant [8 x i8] c"*uint16\00", align 1
@go..C40 = internal constant { ptr, i64 } { ptr @const.20, i64 7 }
@const.21 = private constant [6 x i8] c"Class\00", align 1
@go..C41 = internal constant { ptr, i64 } { ptr @const.21, i64 5 }
@const.22 = private constant [4 x i8] c"Ttl\00", align 1
@go..C42 = internal constant { ptr, i64 } { ptr @const.22, i64 3 }
@uint32..d = weak constant %_type.0 { i64 4, i64 0, i32 278357906, i8 8, i8 4, i8 4, i8 -118, ptr @runtime.memequal32..f, ptr null, ptr @go..C43, ptr @go..C46, ptr @uint32..p }, comdat
@runtime.memequal32..f = external constant %functionDescriptor.0
@const.23 = private constant [7 x i8] c"uint32\00", align 1
@go..C43 = internal constant { ptr, i64 } { ptr @const.23, i64 6 }
@go..C44 = internal constant { ptr, i64 } { ptr @const.23, i64 6 }
@go..C45 = internal constant [1 x %method.0] zeroinitializer
@go..C46 = internal constant %uncommonType.0 { ptr @go..C44, ptr null, %IPST.41 { ptr @go..C45, i64 0, i64 0 } }
@uint32..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 158759209, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C47, ptr null, ptr null }, ptr @uint32..d }, comdat
@const.24 = private constant [8 x i8] c"*uint32\00", align 1
@go..C47 = internal constant { ptr, i64 } { ptr @const.24, i64 7 }
@const.25 = private constant [9 x i8] c"Rdlength\00", align 1
@go..C48 = internal constant { ptr, i64 } { ptr @const.25, i64 8 }
@go..C49 = internal constant [5 x %structField.0] [%structField.0 { ptr @go..C28, ptr null, ptr @string..d, ptr @go..C34, i64 0 }, %structField.0 { ptr @go..C35, ptr null, ptr @uint16..d, ptr null, i64 32 }, %structField.0 { ptr @go..C41, ptr null, ptr @uint16..d, ptr null, i64 36 }, %structField.0 { ptr @go..C42, ptr null, ptr @uint32..d, ptr null, i64 40 }, %structField.0 { ptr @go..C48, ptr null, ptr @uint16..d, ptr null, i64 48 }]
@go..C50 = internal constant [1 x ptr] [ptr @go_0llvm.RR__Header..p]
@type..func_8_2go_0llvm_0OPT_9_8_2go_0llvm_0RR__Header_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -425780888, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C51, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C52, i64 1, i64 1 }, %IPST.42 { ptr @go..C53, i64 1, i64 1 } }, comdat
@const.26 = private constant [50 x i8] c"func(*\09go.llvm\09llvm.OPT) *\09go.llvm\09llvm.RR_Header\00", align 1
@go..C51 = internal constant { ptr, i64 } { ptr @const.26, i64 49 }
@go..C52 = internal constant [1 x ptr] [ptr @go_0llvm.OPT..p]
@go..C53 = internal constant [1 x ptr] [ptr @go_0llvm.RR__Header..p]
@const.27 = private constant [6 x i8] c"SetDo\00", align 1
@go..C54 = internal constant { ptr, i64 } { ptr @const.27, i64 5 }
@type..func_8_0_0_0_6_7bool_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1966552056, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C55, ptr null, ptr null }, i8 1, %IPST.42 { ptr @go..C57, i64 1, i64 1 }, %IPST.42 { ptr @go..C58, i64 0, i64 0 } }, comdat
@const.28 = private constant [14 x i8] c"func(...bool)\00", align 1
@go..C55 = internal constant { ptr, i64 } { ptr @const.28, i64 13 }
@type.._6_7bool = weak constant %SliceType.0 { %_type.0 { i64 24, i64 8, i32 1537849759, i8 0, i8 8, i8 8, i8 23, ptr null, ptr @gcbits..ba, ptr @go..C56, ptr null, ptr null }, ptr @bool..d }, comdat
@const.29 = private constant [7 x i8] c"[]bool\00", align 1
@go..C56 = internal constant { ptr, i64 } { ptr @const.29, i64 6 }
@go..C57 = internal constant [1 x ptr] [ptr @type.._6_7bool]
@go..C58 = internal constant [1 x ptr] zeroinitializer
@type..func_8_2go_0llvm_0OPT_3_0_0_0_6_7bool_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -179390728, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C59, ptr null, ptr null }, i8 1, %IPST.42 { ptr @go..C60, i64 2, i64 2 }, %IPST.42 { ptr @go..C61, i64 0, i64 0 } }, comdat
@const.30 = private constant [34 x i8] c"func(*\09go.llvm\09llvm.OPT, ...bool)\00", align 1
@go..C59 = internal constant { ptr, i64 } { ptr @const.30, i64 33 }
@go..C60 = internal constant [2 x ptr] [ptr @go_0llvm.OPT..p, ptr @type.._6_7bool]
@go..C61 = internal constant [1 x ptr] zeroinitializer
@const.31 = private constant [11 x i8] c"SetUDPSize\00", align 1
@go..C62 = internal constant { ptr, i64 } { ptr @const.31, i64 10 }
@type..func_8uint16_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1839534072, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C63, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C64, i64 1, i64 1 }, %IPST.42 { ptr @go..C65, i64 0, i64 0 } }, comdat
@const.32 = private constant [13 x i8] c"func(uint16)\00", align 1
@go..C63 = internal constant { ptr, i64 } { ptr @const.32, i64 12 }
@go..C64 = internal constant [1 x ptr] [ptr @uint16..d]
@go..C65 = internal constant [1 x ptr] zeroinitializer
@type..func_8_2go_0llvm_0OPT_3uint16_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 798371624, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C66, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C67, i64 2, i64 2 }, %IPST.42 { ptr @go..C68, i64 0, i64 0 } }, comdat
@const.33 = private constant [33 x i8] c"func(*\09go.llvm\09llvm.OPT, uint16)\00", align 1
@go..C66 = internal constant { ptr, i64 } { ptr @const.33, i64 32 }
@go..C67 = internal constant [2 x ptr] [ptr @go_0llvm.OPT..p, ptr @uint16..d]
@go..C68 = internal constant [1 x ptr] zeroinitializer
@const.34 = private constant [11 x i8] c"SetVersion\00", align 1
@go..C69 = internal constant { ptr, i64 } { ptr @const.34, i64 10 }
@type..func_8uint8_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -121707736, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C70, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C76, i64 1, i64 1 }, %IPST.42 { ptr @go..C77, i64 0, i64 0 } }, comdat
@const.35 = private constant [12 x i8] c"func(uint8)\00", align 1
@go..C70 = internal constant { ptr, i64 } { ptr @const.35, i64 11 }
@uint8..d = weak constant %_type.0 { i64 1, i64 0, i32 264632089, i8 8, i8 1, i8 1, i8 -120, ptr @runtime.memequal8..f, ptr null, ptr @go..C71, ptr @go..C74, ptr @uint8..p }, comdat
@const.36 = private constant [6 x i8] c"uint8\00", align 1
@go..C71 = internal constant { ptr, i64 } { ptr @const.36, i64 5 }
@go..C72 = internal constant { ptr, i64 } { ptr @const.36, i64 5 }
@go..C73 = internal constant [1 x %method.0] zeroinitializer
@go..C74 = internal constant %uncommonType.0 { ptr @go..C72, ptr null, %IPST.41 { ptr @go..C73, i64 0, i64 0 } }
@uint8..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -60853863, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C75, ptr null, ptr null }, ptr @uint8..d }, comdat
@const.37 = private constant [7 x i8] c"*uint8\00", align 1
@go..C75 = internal constant { ptr, i64 } { ptr @const.37, i64 6 }
@go..C76 = internal constant [1 x ptr] [ptr @uint8..d]
@go..C77 = internal constant [1 x ptr] zeroinitializer
@type..func_8_2go_0llvm_0OPT_3uint8_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -60943000, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C78, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C79, i64 2, i64 2 }, %IPST.42 { ptr @go..C80, i64 0, i64 0 } }, comdat
@const.38 = private constant [32 x i8] c"func(*\09go.llvm\09llvm.OPT, uint8)\00", align 1
@go..C78 = internal constant { ptr, i64 } { ptr @const.38, i64 31 }
@go..C79 = internal constant [2 x ptr] [ptr @go_0llvm.OPT..p, ptr @uint8..d]
@go..C80 = internal constant [1 x ptr] zeroinitializer
@const.39 = private constant [8 x i8] c"UDPSize\00", align 1
@go..C81 = internal constant { ptr, i64 } { ptr @const.39, i64 7 }
@type..func_8_9_8uint16_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 615899144, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C82, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C83, i64 0, i64 0 }, %IPST.42 { ptr @go..C84, i64 1, i64 1 } }, comdat
@const.40 = private constant [14 x i8] c"func() uint16\00", align 1
@go..C82 = internal constant { ptr, i64 } { ptr @const.40, i64 13 }
@go..C83 = internal constant [1 x ptr] zeroinitializer
@go..C84 = internal constant [1 x ptr] [ptr @uint16..d]
@type..func_8_2go_0llvm_0OPT_9_8uint16_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 798371624, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C85, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C86, i64 1, i64 1 }, %IPST.42 { ptr @go..C87, i64 1, i64 1 } }, comdat
@const.41 = private constant [32 x i8] c"func(*\09go.llvm\09llvm.OPT) uint16\00", align 1
@go..C85 = internal constant { ptr, i64 } { ptr @const.41, i64 31 }
@go..C86 = internal constant [1 x ptr] [ptr @go_0llvm.OPT..p]
@go..C87 = internal constant [1 x ptr] [ptr @uint16..d]
@const.42 = private constant [5 x i8] c"copy\00", align 1
@go..C88 = internal constant { ptr, i64 } { ptr @const.42, i64 4 }
@go..C89 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8_9_8go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1372692616, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C90, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C91, i64 0, i64 0 }, %IPST.42 { ptr @go..C102, i64 1, i64 1 } }, comdat
@const.43 = private constant [24 x i8] c"func() \09go.llvm\09llvm.RR\00", align 1
@go..C90 = internal constant { ptr, i64 } { ptr @const.43, i64 23 }
@go..C91 = internal constant [1 x ptr] zeroinitializer
@go_0llvm.RR..d = constant %InterfaceType.0 { %_type.0 { i64 16, i64 16, i32 -2058926462, i8 0, i8 8, i8 8, i8 20, ptr @runtime.interequal..f, ptr @gcbits..da, ptr @go..C92, ptr @go..C96, ptr @go_0llvm.RR..p }, %IPST.44 { ptr @go..C101, i64 2, i64 2 } }
@runtime.interequal..f = external constant %functionDescriptor.0
@gcbits..da = weak constant [1 x i8] c"\03", comdat
@const.44 = private constant [17 x i8] c"\09go.llvm\09llvm.RR\00", align 1
@go..C92 = internal constant { ptr, i64 } { ptr @const.44, i64 16 }
@const.45 = private constant [3 x i8] c"RR\00", align 1
@go..C93 = internal constant { ptr, i64 } { ptr @const.45, i64 2 }
@go..C94 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C95 = internal constant [1 x %method.0] zeroinitializer
@go..C96 = internal constant %uncommonType.0 { ptr @go..C93, ptr @go..C94, %IPST.41 { ptr @go..C95, i64 0, i64 0 } }
@go_0llvm.RR..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1416914985, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C97, ptr null, ptr null }, ptr @go_0llvm.RR..d }, comdat
@const.46 = private constant [18 x i8] c"*\09go.llvm\09llvm.RR\00", align 1
@go..C97 = internal constant { ptr, i64 } { ptr @const.46, i64 17 }
@go..C98 = internal constant { ptr, i64 } { ptr @const.9, i64 6 }
@go..C99 = internal constant { ptr, i64 } { ptr @const.42, i64 4 }
@go..C100 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C101 = internal constant [2 x %imethod.0] [%imethod.0 { ptr @go..C98, ptr null, ptr @type..func_8_9_8_2go_0llvm_0RR__Header_9 }, %imethod.0 { ptr @go..C99, ptr @go..C100, ptr @type..func_8_9_8go_0llvm_0RR_9 }]
@go..C102 = internal constant [1 x ptr] [ptr @go_0llvm.RR..d]
@type..func_8_2go_0llvm_0OPT_9_8go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1555165096, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C103, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C104, i64 1, i64 1 }, %IPST.42 { ptr @go..C105, i64 1, i64 1 } }, comdat
@const.47 = private constant [42 x i8] c"func(*\09go.llvm\09llvm.OPT) \09go.llvm\09llvm.RR\00", align 1
@go..C103 = internal constant { ptr, i64 } { ptr @const.47, i64 41 }
@go..C104 = internal constant [1 x ptr] [ptr @go_0llvm.OPT..p]
@go..C105 = internal constant [1 x ptr] [ptr @go_0llvm.RR..d]
@go..C106 = internal constant [7 x %method.0] [%method.0 { ptr @go..C7, ptr null, ptr @type..func_8_9_8bool_9, ptr @type..func_8_2go_0llvm_0OPT_9_8bool_9, ptr @go_0llvm.OPT.Do }, %method.0 { ptr @go..C19, ptr null, ptr @type..func_8_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0OPT_9_8_2go_0llvm_0RR__Header_9, ptr @go_0llvm.OPT.Header }, %method.0 { ptr @go..C54, ptr null, ptr @type..func_8_0_0_0_6_7bool_9_8_9, ptr @type..func_8_2go_0llvm_0OPT_3_0_0_0_6_7bool_9_8_9, ptr @go_0llvm.OPT.SetDo }, %method.0 { ptr @go..C62, ptr null, ptr @type..func_8uint16_9_8_9, ptr @type..func_8_2go_0llvm_0OPT_3uint16_9_8_9, ptr @go_0llvm.OPT.SetUDPSize }, %method.0 { ptr @go..C69, ptr null, ptr @type..func_8uint8_9_8_9, ptr @type..func_8_2go_0llvm_0OPT_3uint8_9_8_9, ptr @go_0llvm.OPT.SetVersion }, %method.0 { ptr @go..C81, ptr null, ptr @type..func_8_9_8uint16_9, ptr @type..func_8_2go_0llvm_0OPT_9_8uint16_9, ptr @go_0llvm.OPT.UDPSize }, %method.0 { ptr @go..C88, ptr @go..C89, ptr @type..func_8_9_8go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0OPT_9_8go_0llvm_0RR_9, ptr @go_0llvm.OPT.copy }]
@go..C107 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.41 { ptr @go..C106, i64 7, i64 7 } }
@type.._2_2go_0llvm_0OPT = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -2056247399, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C108, ptr null, ptr null }, ptr @go_0llvm.OPT..p }, comdat
@const.48 = private constant [20 x i8] c"**\09go.llvm\09llvm.OPT\00", align 1
@go..C108 = internal constant { ptr, i64 } { ptr @const.48, i64 19 }
@const.49 = private constant [4 x i8] c"Hdr\00", align 1
@go..C109 = internal constant { ptr, i64 } { ptr @const.49, i64 3 }
@const.50 = private constant [7 x i8] c"Option\00", align 1
@go..C110 = internal constant { ptr, i64 } { ptr @const.50, i64 6 }
@type.._6_7go_0llvm_0EDNS0 = weak constant %SliceType.0 { %_type.0 { i64 24, i64 8, i32 -1540696682, i8 0, i8 8, i8 8, i8 23, ptr null, ptr @gcbits..ba, ptr @go..C111, ptr null, ptr null }, ptr @go_0llvm.EDNS0..d }, comdat
@const.51 = private constant [22 x i8] c"[]\09go.llvm\09llvm.EDNS0\00", align 1
@go..C111 = internal constant { ptr, i64 } { ptr @const.51, i64 21 }
@go_0llvm.EDNS0..d = constant %InterfaceType.0 { %_type.0 { i64 16, i64 16, i32 -1540696696, i8 0, i8 8, i8 8, i8 20, ptr @runtime.interequal..f, ptr @gcbits..da, ptr @go..C112, ptr @go..C116, ptr @go_0llvm.EDNS0..p }, %IPST.44 { ptr @go..C146, i64 5, i64 5 } }
@const.52 = private constant [20 x i8] c"\09go.llvm\09llvm.EDNS0\00", align 1
@go..C112 = internal constant { ptr, i64 } { ptr @const.52, i64 19 }
@const.53 = private constant [6 x i8] c"EDNS0\00", align 1
@go..C113 = internal constant { ptr, i64 } { ptr @const.53, i64 5 }
@go..C114 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C115 = internal constant [1 x %method.0] zeroinitializer
@go..C116 = internal constant %uncommonType.0 { ptr @go..C113, ptr @go..C114, %IPST.41 { ptr @go..C115, i64 0, i64 0 } }
@go_0llvm.EDNS0..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1118656649, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C117, ptr null, ptr null }, ptr @go_0llvm.EDNS0..d }, comdat
@const.54 = private constant [21 x i8] c"*\09go.llvm\09llvm.EDNS0\00", align 1
@go..C117 = internal constant { ptr, i64 } { ptr @const.54, i64 20 }
@go..C118 = internal constant { ptr, i64 } { ptr @const.50, i64 6 }
@const.55 = private constant [7 x i8] c"String\00", align 1
@go..C119 = internal constant { ptr, i64 } { ptr @const.55, i64 6 }
@type..func_8_9_8string_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 916039304, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C120, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C121, i64 0, i64 0 }, %IPST.42 { ptr @go..C122, i64 1, i64 1 } }, comdat
@const.56 = private constant [14 x i8] c"func() string\00", align 1
@go..C120 = internal constant { ptr, i64 } { ptr @const.56, i64 13 }
@go..C121 = internal constant [1 x ptr] zeroinitializer
@go..C122 = internal constant [1 x ptr] [ptr @string..d]
@go..C123 = internal constant { ptr, i64 } { ptr @const.42, i64 4 }
@go..C124 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8_9_8go_0llvm_0EDNS0_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 179659272, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C125, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C126, i64 0, i64 0 }, %IPST.42 { ptr @go..C127, i64 1, i64 1 } }, comdat
@const.57 = private constant [27 x i8] c"func() \09go.llvm\09llvm.EDNS0\00", align 1
@go..C125 = internal constant { ptr, i64 } { ptr @const.57, i64 26 }
@go..C126 = internal constant [1 x ptr] zeroinitializer
@go..C127 = internal constant [1 x ptr] [ptr @go_0llvm.EDNS0..d]
@const.58 = private constant [5 x i8] c"pack\00", align 1
@go..C128 = internal constant { ptr, i64 } { ptr @const.58, i64 4 }
@go..C129 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8_9_8_6_7uint8_3error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 2134062408, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C130, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C131, i64 0, i64 0 }, %IPST.42 { ptr @go..C140, i64 2, i64 2 } }, comdat
@const.59 = private constant [24 x i8] c"func() ([]uint8, error)\00", align 1
@go..C130 = internal constant { ptr, i64 } { ptr @const.59, i64 23 }
@go..C131 = internal constant [1 x ptr] zeroinitializer
@type.._6_7uint8 = weak constant %SliceType.0 { %_type.0 { i64 24, i64 8, i32 264632103, i8 0, i8 8, i8 8, i8 23, ptr null, ptr @gcbits..ba, ptr @go..C132, ptr null, ptr null }, ptr @uint8..d }, comdat
@const.60 = private constant [8 x i8] c"[]uint8\00", align 1
@go..C132 = internal constant { ptr, i64 } { ptr @const.60, i64 7 }
@error..d = weak constant %InterfaceType.0 { %_type.0 { i64 16, i64 16, i32 -2128909609, i8 0, i8 8, i8 8, i8 20, ptr @runtime.interequal..f, ptr @gcbits..da, ptr @go..C133, ptr @go..C136, ptr @error..p }, %IPST.44 { ptr @go..C139, i64 1, i64 1 } }, comdat
@const.61 = private constant [6 x i8] c"error\00", align 1
@go..C133 = internal constant { ptr, i64 } { ptr @const.61, i64 5 }
@go..C134 = internal constant { ptr, i64 } { ptr @const.61, i64 5 }
@go..C135 = internal constant [1 x %method.0] zeroinitializer
@go..C136 = internal constant %uncommonType.0 { ptr @go..C134, ptr null, %IPST.41 { ptr @go..C135, i64 0, i64 0 } }
@error..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 297184633, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C137, ptr null, ptr null }, ptr @error..d }, comdat
@const.62 = private constant [7 x i8] c"*error\00", align 1
@go..C137 = internal constant { ptr, i64 } { ptr @const.62, i64 6 }
@const.63 = private constant [6 x i8] c"Error\00", align 1
@go..C138 = internal constant { ptr, i64 } { ptr @const.63, i64 5 }
@go..C139 = internal constant [1 x %imethod.0] [%imethod.0 { ptr @go..C138, ptr null, ptr @type..func_8_9_8string_9 }]
@go..C140 = internal constant [2 x ptr] [ptr @type.._6_7uint8, ptr @error..d]
@const.64 = private constant [7 x i8] c"unpack\00", align 1
@go..C141 = internal constant { ptr, i64 } { ptr @const.64, i64 6 }
@go..C142 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8_6_7uint8_9_8error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1067031208, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C143, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C144, i64 1, i64 1 }, %IPST.42 { ptr @go..C145, i64 1, i64 1 } }, comdat
@const.65 = private constant [20 x i8] c"func([]uint8) error\00", align 1
@go..C143 = internal constant { ptr, i64 } { ptr @const.65, i64 19 }
@go..C144 = internal constant [1 x ptr] [ptr @type.._6_7uint8]
@go..C145 = internal constant [1 x ptr] [ptr @error..d]
@go..C146 = internal constant [5 x %imethod.0] [%imethod.0 { ptr @go..C118, ptr null, ptr @type..func_8_9_8uint16_9 }, %imethod.0 { ptr @go..C119, ptr null, ptr @type..func_8_9_8string_9 }, %imethod.0 { ptr @go..C123, ptr @go..C124, ptr @type..func_8_9_8go_0llvm_0EDNS0_9 }, %imethod.0 { ptr @go..C128, ptr @go..C129, ptr @type..func_8_9_8_6_7uint8_3error_9 }, %imethod.0 { ptr @go..C141, ptr @go..C142, ptr @type..func_8_6_7uint8_9_8error_9 }]
@const.66 = private constant [10 x i8] c"dns:\22opt\22\00", align 1
@go..C147 = internal constant { ptr, i64 } { ptr @const.66, i64 9 }
@go..C148 = internal constant [2 x %structField.0] [%structField.0 { ptr @go..C109, ptr null, ptr @go_0llvm.RR__Header..d, ptr null, i64 0 }, %structField.0 { ptr @go..C110, ptr null, ptr @type.._6_7go_0llvm_0EDNS0, ptr @go..C147, i64 64 }]
@imt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.OPT = local_unnamed_addr constant { ptr, ptr, ptr } { ptr @go_0llvm.OPT..d, ptr @go_0llvm.OPT.Header, ptr @go_0llvm.OPT.copy }
@pimt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.OPT = constant { ptr, ptr, ptr } { ptr @go_0llvm.OPT..p, ptr @go_0llvm.OPT.Header, ptr @go_0llvm.OPT.copy }
@go_0llvm.SOA..d = constant %StructType.0 { %_type.0 { i64 88, i64 56, i32 1879092663, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.SOA..eq..f, ptr @gcbits..rc, ptr @go..C149, ptr @go..C153, ptr @go_0llvm.SOA..p }, %IPST.43 { ptr @go..C177, i64 8, i64 8 } }
@go_0llvm.SOA..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.SOA..eq to i64) }
@gcbits..rc = weak constant [1 x i8] c"Q", comdat
@const.67 = private constant [18 x i8] c"\09go.llvm\09llvm.SOA\00", align 1
@go..C149 = internal constant { ptr, i64 } { ptr @const.67, i64 17 }
@const.68 = private constant [4 x i8] c"SOA\00", align 1
@go..C150 = internal constant { ptr, i64 } { ptr @const.68, i64 3 }
@go..C151 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C152 = internal constant [1 x %method.0] zeroinitializer
@go..C153 = internal constant %uncommonType.0 { ptr @go..C150, ptr @go..C151, %IPST.41 { ptr @go..C152, i64 0, i64 0 } }
@go_0llvm.SOA..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 711545, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C154, ptr @go..C165, ptr @type.._2_2go_0llvm_0SOA }, ptr @go_0llvm.SOA..d }, comdat
@const.69 = private constant [19 x i8] c"*\09go.llvm\09llvm.SOA\00", align 1
@go..C154 = internal constant { ptr, i64 } { ptr @const.69, i64 18 }
@go..C155 = internal constant { ptr, i64 } { ptr @const.9, i64 6 }
@type..func_8_2go_0llvm_0SOA_9_8_2go_0llvm_0RR__Header_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -585483928, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C156, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C157, i64 1, i64 1 }, %IPST.42 { ptr @go..C158, i64 1, i64 1 } }, comdat
@const.70 = private constant [50 x i8] c"func(*\09go.llvm\09llvm.SOA) *\09go.llvm\09llvm.RR_Header\00", align 1
@go..C156 = internal constant { ptr, i64 } { ptr @const.70, i64 49 }
@go..C157 = internal constant [1 x ptr] [ptr @go_0llvm.SOA..p]
@go..C158 = internal constant [1 x ptr] [ptr @go_0llvm.RR__Header..p]
@go..C159 = internal constant { ptr, i64 } { ptr @const.42, i64 4 }
@go..C160 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8_2go_0llvm_0SOA_9_8go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1395462056, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C161, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C162, i64 1, i64 1 }, %IPST.42 { ptr @go..C163, i64 1, i64 1 } }, comdat
@const.71 = private constant [42 x i8] c"func(*\09go.llvm\09llvm.SOA) \09go.llvm\09llvm.RR\00", align 1
@go..C161 = internal constant { ptr, i64 } { ptr @const.71, i64 41 }
@go..C162 = internal constant [1 x ptr] [ptr @go_0llvm.SOA..p]
@go..C163 = internal constant [1 x ptr] [ptr @go_0llvm.RR..d]
@go..C164 = internal constant [2 x %method.0] [%method.0 { ptr @go..C155, ptr null, ptr @type..func_8_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0SOA_9_8_2go_0llvm_0RR__Header_9, ptr @go_0llvm.SOA.Header }, %method.0 { ptr @go..C159, ptr @go..C160, ptr @type..func_8_9_8go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0SOA_9_8go_0llvm_0RR_9, ptr @go_0llvm.SOA.copy }]
@go..C165 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.41 { ptr @go..C164, i64 2, i64 2 } }
@type.._2_2go_0llvm_0SOA = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 11384729, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C166, ptr null, ptr null }, ptr @go_0llvm.SOA..p }, comdat
@const.72 = private constant [20 x i8] c"**\09go.llvm\09llvm.SOA\00", align 1
@go..C166 = internal constant { ptr, i64 } { ptr @const.72, i64 19 }
@go..C167 = internal constant { ptr, i64 } { ptr @const.49, i64 3 }
@const.73 = private constant [3 x i8] c"Ns\00", align 1
@go..C168 = internal constant { ptr, i64 } { ptr @const.73, i64 2 }
@go..C169 = internal constant { ptr, i64 } { ptr @const.17, i64 18 }
@const.74 = private constant [5 x i8] c"Mbox\00", align 1
@go..C170 = internal constant { ptr, i64 } { ptr @const.74, i64 4 }
@go..C171 = internal constant { ptr, i64 } { ptr @const.17, i64 18 }
@const.75 = private constant [7 x i8] c"Serial\00", align 1
@go..C172 = internal constant { ptr, i64 } { ptr @const.75, i64 6 }
@const.76 = private constant [8 x i8] c"Refresh\00", align 1
@go..C173 = internal constant { ptr, i64 } { ptr @const.76, i64 7 }
@const.77 = private constant [6 x i8] c"Retry\00", align 1
@go..C174 = internal constant { ptr, i64 } { ptr @const.77, i64 5 }
@const.78 = private constant [7 x i8] c"Expire\00", align 1
@go..C175 = internal constant { ptr, i64 } { ptr @const.78, i64 6 }
@const.79 = private constant [7 x i8] c"Minttl\00", align 1
@go..C176 = internal constant { ptr, i64 } { ptr @const.79, i64 6 }
@go..C177 = internal constant [8 x %structField.0] [%structField.0 { ptr @go..C167, ptr null, ptr @go_0llvm.RR__Header..d, ptr null, i64 0 }, %structField.0 { ptr @go..C168, ptr null, ptr @string..d, ptr @go..C169, i64 64 }, %structField.0 { ptr @go..C170, ptr null, ptr @string..d, ptr @go..C171, i64 96 }, %structField.0 { ptr @go..C172, ptr null, ptr @uint32..d, ptr null, i64 128 }, %structField.0 { ptr @go..C173, ptr null, ptr @uint32..d, ptr null, i64 136 }, %structField.0 { ptr @go..C174, ptr null, ptr @uint32..d, ptr null, i64 144 }, %structField.0 { ptr @go..C175, ptr null, ptr @uint32..d, ptr null, i64 152 }, %structField.0 { ptr @go..C176, ptr null, ptr @uint32..d, ptr null, i64 160 }]
@imt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.SOA = local_unnamed_addr constant { ptr, ptr, ptr } { ptr @go_0llvm.SOA..d, ptr @go_0llvm.SOA.Header, ptr @go_0llvm.SOA.copy }
@pimt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.SOA = constant { ptr, ptr, ptr } { ptr @go_0llvm.SOA..p, ptr @go_0llvm.SOA.Header, ptr @go_0llvm.SOA.copy }
@go_0llvm.DNAME..d = constant %StructType.0 { %_type.0 { i64 48, i64 40, i32 1378049777, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.DNAME..eq..f, ptr @gcbits..ra, ptr @go..C178, ptr @go..C182, ptr @go_0llvm.DNAME..p }, %IPST.43 { ptr @go..C199, i64 2, i64 2 } }
@go_0llvm.DNAME..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.DNAME..eq to i64) }
@const.80 = private constant [20 x i8] c"\09go.llvm\09llvm.DNAME\00", align 1
@go..C178 = internal constant { ptr, i64 } { ptr @const.80, i64 19 }
@const.81 = private constant [6 x i8] c"DNAME\00", align 1
@go..C179 = internal constant { ptr, i64 } { ptr @const.81, i64 5 }
@go..C180 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C181 = internal constant [1 x %method.0] zeroinitializer
@go..C182 = internal constant %uncommonType.0 { ptr @go..C179, ptr @go..C180, %IPST.41 { ptr @go..C181, i64 0, i64 0 } }
@go_0llvm.DNAME..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 573959961, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C183, ptr @go..C194, ptr @type.._2_2go_0llvm_0DNAME }, ptr @go_0llvm.DNAME..d }, comdat
@const.82 = private constant [21 x i8] c"*\09go.llvm\09llvm.DNAME\00", align 1
@go..C183 = internal constant { ptr, i64 } { ptr @const.82, i64 20 }
@go..C184 = internal constant { ptr, i64 } { ptr @const.9, i64 6 }
@type..func_8_2go_0llvm_0DNAME_9_8_2go_0llvm_0RR__Header_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 578596200, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C185, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C186, i64 1, i64 1 }, %IPST.42 { ptr @go..C187, i64 1, i64 1 } }, comdat
@const.83 = private constant [52 x i8] c"func(*\09go.llvm\09llvm.DNAME) *\09go.llvm\09llvm.RR_Header\00", align 1
@go..C185 = internal constant { ptr, i64 } { ptr @const.83, i64 51 }
@go..C186 = internal constant [1 x ptr] [ptr @go_0llvm.DNAME..p]
@go..C187 = internal constant [1 x ptr] [ptr @go_0llvm.RR__Header..p]
@go..C188 = internal constant { ptr, i64 } { ptr @const.42, i64 4 }
@go..C189 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8_2go_0llvm_0DNAME_9_8go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1735425112, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C190, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C191, i64 1, i64 1 }, %IPST.42 { ptr @go..C192, i64 1, i64 1 } }, comdat
@const.84 = private constant [44 x i8] c"func(*\09go.llvm\09llvm.DNAME) \09go.llvm\09llvm.RR\00", align 1
@go..C190 = internal constant { ptr, i64 } { ptr @const.84, i64 43 }
@go..C191 = internal constant [1 x ptr] [ptr @go_0llvm.DNAME..p]
@go..C192 = internal constant [1 x ptr] [ptr @go_0llvm.RR..d]
@go..C193 = internal constant [2 x %method.0] [%method.0 { ptr @go..C184, ptr null, ptr @type..func_8_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0DNAME_9_8_2go_0llvm_0RR__Header_9, ptr @go_0llvm.DNAME.Header }, %method.0 { ptr @go..C188, ptr @go..C189, ptr @type..func_8_9_8go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0DNAME_9_8go_0llvm_0RR_9, ptr @go_0llvm.DNAME.copy }]
@go..C194 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.41 { ptr @go..C193, i64 2, i64 2 } }
@type.._2_2go_0llvm_0DNAME = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 593424793, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C195, ptr null, ptr null }, ptr @go_0llvm.DNAME..p }, comdat
@const.85 = private constant [22 x i8] c"**\09go.llvm\09llvm.DNAME\00", align 1
@go..C195 = internal constant { ptr, i64 } { ptr @const.85, i64 21 }
@go..C196 = internal constant { ptr, i64 } { ptr @const.49, i64 3 }
@const.86 = private constant [7 x i8] c"Target\00", align 1
@go..C197 = internal constant { ptr, i64 } { ptr @const.86, i64 6 }
@const.87 = private constant [18 x i8] c"dns:\22domain-name\22\00", align 1
@go..C198 = internal constant { ptr, i64 } { ptr @const.87, i64 17 }
@go..C199 = internal constant [2 x %structField.0] [%structField.0 { ptr @go..C196, ptr null, ptr @go_0llvm.RR__Header..d, ptr null, i64 0 }, %structField.0 { ptr @go..C197, ptr null, ptr @string..d, ptr @go..C198, i64 64 }]
@imt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.DNAME = local_unnamed_addr constant { ptr, ptr, ptr } { ptr @go_0llvm.DNAME..d, ptr @go_0llvm.DNAME.Header, ptr @go_0llvm.DNAME.copy }
@pimt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.DNAME = constant { ptr, ptr, ptr } { ptr @go_0llvm.DNAME..p, ptr @go_0llvm.DNAME.Header, ptr @go_0llvm.DNAME.copy }
@go_0llvm.CNAME..d = constant %StructType.0 { %_type.0 { i64 48, i64 40, i32 -2001375236, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.CNAME..eq..f, ptr @gcbits..ra, ptr @go..C200, ptr @go..C204, ptr @go_0llvm.CNAME..p }, %IPST.43 { ptr @go..C221, i64 2, i64 2 } }
@go_0llvm.CNAME..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.CNAME..eq to i64) }
@const.88 = private constant [20 x i8] c"\09go.llvm\09llvm.CNAME\00", align 1
@go..C200 = internal constant { ptr, i64 } { ptr @const.88, i64 19 }
@const.89 = private constant [6 x i8] c"CNAME\00", align 1
@go..C201 = internal constant { ptr, i64 } { ptr @const.89, i64 5 }
@go..C202 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C203 = internal constant [1 x %method.0] zeroinitializer
@go..C204 = internal constant %uncommonType.0 { ptr @go..C201, ptr @go..C202, %IPST.41 { ptr @go..C203, i64 0, i64 0 } }
@go_0llvm.CNAME..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1957232695, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C205, ptr @go..C216, ptr @type.._2_2go_0llvm_0CNAME }, ptr @go_0llvm.CNAME..d }, comdat
@const.90 = private constant [21 x i8] c"*\09go.llvm\09llvm.CNAME\00", align 1
@go..C205 = internal constant { ptr, i64 } { ptr @const.90, i64 20 }
@go..C206 = internal constant { ptr, i64 } { ptr @const.9, i64 6 }
@type..func_8_2go_0llvm_0CNAME_9_8_2go_0llvm_0RR__Header_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1184809832, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C207, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C208, i64 1, i64 1 }, %IPST.42 { ptr @go..C209, i64 1, i64 1 } }, comdat
@const.91 = private constant [52 x i8] c"func(*\09go.llvm\09llvm.CNAME) *\09go.llvm\09llvm.RR_Header\00", align 1
@go..C207 = internal constant { ptr, i64 } { ptr @const.91, i64 51 }
@go..C208 = internal constant [1 x ptr] [ptr @go_0llvm.CNAME..p]
@go..C209 = internal constant [1 x ptr] [ptr @go_0llvm.RR__Header..p]
@go..C210 = internal constant { ptr, i64 } { ptr @const.42, i64 4 }
@go..C211 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8_2go_0llvm_0CNAME_9_8go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1129211480, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C212, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C213, i64 1, i64 1 }, %IPST.42 { ptr @go..C214, i64 1, i64 1 } }, comdat
@const.92 = private constant [44 x i8] c"func(*\09go.llvm\09llvm.CNAME) \09go.llvm\09llvm.RR\00", align 1
@go..C212 = internal constant { ptr, i64 } { ptr @const.92, i64 43 }
@go..C213 = internal constant [1 x ptr] [ptr @go_0llvm.CNAME..p]
@go..C214 = internal constant [1 x ptr] [ptr @go_0llvm.RR..d]
@go..C215 = internal constant [2 x %method.0] [%method.0 { ptr @go..C206, ptr null, ptr @type..func_8_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0CNAME_9_8_2go_0llvm_0RR__Header_9, ptr @go_0llvm.CNAME.Header }, %method.0 { ptr @go..C210, ptr @go..C211, ptr @type..func_8_9_8go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0CNAME_9_8go_0llvm_0RR_9, ptr @go_0llvm.CNAME.copy }]
@go..C216 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.41 { ptr @go..C215, i64 2, i64 2 } }
@type.._2_2go_0llvm_0CNAME = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1250952039, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C217, ptr null, ptr null }, ptr @go_0llvm.CNAME..p }, comdat
@const.93 = private constant [22 x i8] c"**\09go.llvm\09llvm.CNAME\00", align 1
@go..C217 = internal constant { ptr, i64 } { ptr @const.93, i64 21 }
@go..C218 = internal constant { ptr, i64 } { ptr @const.49, i64 3 }
@go..C219 = internal constant { ptr, i64 } { ptr @const.86, i64 6 }
@go..C220 = internal constant { ptr, i64 } { ptr @const.17, i64 18 }
@go..C221 = internal constant [2 x %structField.0] [%structField.0 { ptr @go..C218, ptr null, ptr @go_0llvm.RR__Header..d, ptr null, i64 0 }, %structField.0 { ptr @go..C219, ptr null, ptr @string..d, ptr @go..C220, i64 64 }]
@imt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.CNAME = local_unnamed_addr constant { ptr, ptr, ptr } { ptr @go_0llvm.CNAME..d, ptr @go_0llvm.CNAME.Header, ptr @go_0llvm.CNAME.copy }
@pimt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.CNAME = constant { ptr, ptr, ptr } { ptr @go_0llvm.CNAME..p, ptr @go_0llvm.CNAME.Header, ptr @go_0llvm.CNAME.copy }
@go_0llvm.SRV..d = constant %StructType.0 { %_type.0 { i64 56, i64 48, i32 645114483, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.SRV..eq..f, ptr @gcbits..bb, ptr @go..C222, ptr @go..C226, ptr @go_0llvm.SRV..p }, %IPST.43 { ptr @go..C246, i64 5, i64 5 } }
@go_0llvm.SRV..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.SRV..eq to i64) }
@gcbits..bb = weak constant [1 x i8] c"!", comdat
@const.94 = private constant [18 x i8] c"\09go.llvm\09llvm.SRV\00", align 1
@go..C222 = internal constant { ptr, i64 } { ptr @const.94, i64 17 }
@const.95 = private constant [4 x i8] c"SRV\00", align 1
@go..C223 = internal constant { ptr, i64 } { ptr @const.95, i64 3 }
@go..C224 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C225 = internal constant [1 x %method.0] zeroinitializer
@go..C226 = internal constant %uncommonType.0 { ptr @go..C223, ptr @go..C224, %IPST.41 { ptr @go..C225, i64 0, i64 0 } }
@go_0llvm.SRV..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1731897145, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C227, ptr @go..C238, ptr @type.._2_2go_0llvm_0SRV }, ptr @go_0llvm.SRV..d }, comdat
@const.96 = private constant [19 x i8] c"*\09go.llvm\09llvm.SRV\00", align 1
@go..C227 = internal constant { ptr, i64 } { ptr @const.96, i64 18 }
@go..C228 = internal constant { ptr, i64 } { ptr @const.9, i64 6 }
@type..func_8_2go_0llvm_0SRV_9_8_2go_0llvm_0RR__Header_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1022119576, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C229, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C230, i64 1, i64 1 }, %IPST.42 { ptr @go..C231, i64 1, i64 1 } }, comdat
@const.97 = private constant [50 x i8] c"func(*\09go.llvm\09llvm.SRV) *\09go.llvm\09llvm.RR_Header\00", align 1
@go..C229 = internal constant { ptr, i64 } { ptr @const.97, i64 49 }
@go..C230 = internal constant [1 x ptr] [ptr @go_0llvm.SRV..p]
@go..C231 = internal constant [1 x ptr] [ptr @go_0llvm.RR__Header..p]
@go..C232 = internal constant { ptr, i64 } { ptr @const.42, i64 4 }
@go..C233 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8_2go_0llvm_0SRV_9_8go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 958826408, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C234, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C235, i64 1, i64 1 }, %IPST.42 { ptr @go..C236, i64 1, i64 1 } }, comdat
@const.98 = private constant [42 x i8] c"func(*\09go.llvm\09llvm.SRV) \09go.llvm\09llvm.RR\00", align 1
@go..C234 = internal constant { ptr, i64 } { ptr @const.98, i64 41 }
@go..C235 = internal constant [1 x ptr] [ptr @go_0llvm.SRV..p]
@go..C236 = internal constant [1 x ptr] [ptr @go_0llvm.RR..d]
@go..C237 = internal constant [2 x %method.0] [%method.0 { ptr @go..C228, ptr null, ptr @type..func_8_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0SRV_9_8_2go_0llvm_0RR__Header_9, ptr @go_0llvm.SRV.Header }, %method.0 { ptr @go..C232, ptr @go..C233, ptr @type..func_8_9_8go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0SRV_9_8go_0llvm_0RR_9, ptr @go_0llvm.SRV.copy }]
@go..C238 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.41 { ptr @go..C237, i64 2, i64 2 } }
@type.._2_2go_0llvm_0SRV = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1940550553, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C239, ptr null, ptr null }, ptr @go_0llvm.SRV..p }, comdat
@const.99 = private constant [20 x i8] c"**\09go.llvm\09llvm.SRV\00", align 1
@go..C239 = internal constant { ptr, i64 } { ptr @const.99, i64 19 }
@go..C240 = internal constant { ptr, i64 } { ptr @const.49, i64 3 }
@const.100 = private constant [9 x i8] c"Priority\00", align 1
@go..C241 = internal constant { ptr, i64 } { ptr @const.100, i64 8 }
@const.101 = private constant [7 x i8] c"Weight\00", align 1
@go..C242 = internal constant { ptr, i64 } { ptr @const.101, i64 6 }
@const.102 = private constant [5 x i8] c"Port\00", align 1
@go..C243 = internal constant { ptr, i64 } { ptr @const.102, i64 4 }
@go..C244 = internal constant { ptr, i64 } { ptr @const.86, i64 6 }
@go..C245 = internal constant { ptr, i64 } { ptr @const.87, i64 17 }
@go..C246 = internal constant [5 x %structField.0] [%structField.0 { ptr @go..C240, ptr null, ptr @go_0llvm.RR__Header..d, ptr null, i64 0 }, %structField.0 { ptr @go..C241, ptr null, ptr @uint16..d, ptr null, i64 64 }, %structField.0 { ptr @go..C242, ptr null, ptr @uint16..d, ptr null, i64 68 }, %structField.0 { ptr @go..C243, ptr null, ptr @uint16..d, ptr null, i64 72 }, %structField.0 { ptr @go..C244, ptr null, ptr @string..d, ptr @go..C245, i64 80 }]
@imt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.SRV = local_unnamed_addr constant { ptr, ptr, ptr } { ptr @go_0llvm.SRV..d, ptr @go_0llvm.SRV.Header, ptr @go_0llvm.SRV.copy }
@pimt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.SRV = constant { ptr, ptr, ptr } { ptr @go_0llvm.SRV..p, ptr @go_0llvm.SRV.Header, ptr @go_0llvm.SRV.copy }
@go_0llvm.MX..d = constant %StructType.0 { %_type.0 { i64 56, i64 48, i32 -525846277, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.MX..eq..f, ptr @gcbits..bb, ptr @go..C247, ptr @go..C251, ptr @go_0llvm.MX..p }, %IPST.43 { ptr @go..C269, i64 3, i64 3 } }
@go_0llvm.MX..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.MX..eq to i64) }
@const.103 = private constant [17 x i8] c"\09go.llvm\09llvm.MX\00", align 1
@go..C247 = internal constant { ptr, i64 } { ptr @const.103, i64 16 }
@const.104 = private constant [3 x i8] c"MX\00", align 1
@go..C248 = internal constant { ptr, i64 } { ptr @const.104, i64 2 }
@go..C249 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C250 = internal constant [1 x %method.0] zeroinitializer
@go..C251 = internal constant %uncommonType.0 { ptr @go..C248, ptr @go..C249, %IPST.41 { ptr @go..C250, i64 0, i64 0 } }
@go_0llvm.MX..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 176394169, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C252, ptr @go..C263, ptr @type.._2_2go_0llvm_0MX }, ptr @go_0llvm.MX..d }, comdat
@const.105 = private constant [18 x i8] c"*\09go.llvm\09llvm.MX\00", align 1
@go..C252 = internal constant { ptr, i64 } { ptr @const.105, i64 17 }
@go..C253 = internal constant { ptr, i64 } { ptr @const.9, i64 6 }
@type..func_8_2go_0llvm_0MX_9_8_2go_0llvm_0RR__Header_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 741392744, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C254, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C255, i64 1, i64 1 }, %IPST.42 { ptr @go..C256, i64 1, i64 1 } }, comdat
@const.106 = private constant [49 x i8] c"func(*\09go.llvm\09llvm.MX) *\09go.llvm\09llvm.RR_Header\00", align 1
@go..C254 = internal constant { ptr, i64 } { ptr @const.106, i64 48 }
@go..C255 = internal constant [1 x ptr] [ptr @go_0llvm.MX..p]
@go..C256 = internal constant [1 x ptr] [ptr @go_0llvm.RR__Header..p]
@go..C257 = internal constant { ptr, i64 } { ptr @const.42, i64 4 }
@go..C258 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8_2go_0llvm_0MX_9_8go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1572628568, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C259, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C260, i64 1, i64 1 }, %IPST.42 { ptr @go..C261, i64 1, i64 1 } }, comdat
@const.107 = private constant [41 x i8] c"func(*\09go.llvm\09llvm.MX) \09go.llvm\09llvm.RR\00", align 1
@go..C259 = internal constant { ptr, i64 } { ptr @const.107, i64 40 }
@go..C260 = internal constant [1 x ptr] [ptr @go_0llvm.MX..p]
@go..C261 = internal constant [1 x ptr] [ptr @go_0llvm.RR..d]
@go..C262 = internal constant [2 x %method.0] [%method.0 { ptr @go..C253, ptr null, ptr @type..func_8_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0MX_9_8_2go_0llvm_0RR__Header_9, ptr @go_0llvm.MX.Header }, %method.0 { ptr @go..C257, ptr @go..C258, ptr @type..func_8_9_8go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0MX_9_8go_0llvm_0RR_9, ptr @go_0llvm.MX.copy }]
@go..C263 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.41 { ptr @go..C262, i64 2, i64 2 } }
@type.._2_2go_0llvm_0MX = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1472660583, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C264, ptr null, ptr null }, ptr @go_0llvm.MX..p }, comdat
@const.108 = private constant [19 x i8] c"**\09go.llvm\09llvm.MX\00", align 1
@go..C264 = internal constant { ptr, i64 } { ptr @const.108, i64 18 }
@go..C265 = internal constant { ptr, i64 } { ptr @const.49, i64 3 }
@const.109 = private constant [11 x i8] c"Preference\00", align 1
@go..C266 = internal constant { ptr, i64 } { ptr @const.109, i64 10 }
@const.110 = private constant [3 x i8] c"Mx\00", align 1
@go..C267 = internal constant { ptr, i64 } { ptr @const.110, i64 2 }
@go..C268 = internal constant { ptr, i64 } { ptr @const.17, i64 18 }
@go..C269 = internal constant [3 x %structField.0] [%structField.0 { ptr @go..C265, ptr null, ptr @go_0llvm.RR__Header..d, ptr null, i64 0 }, %structField.0 { ptr @go..C266, ptr null, ptr @uint16..d, ptr null, i64 64 }, %structField.0 { ptr @go..C267, ptr null, ptr @string..d, ptr @go..C268, i64 80 }]
@imt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.MX = local_unnamed_addr constant { ptr, ptr, ptr } { ptr @go_0llvm.MX..d, ptr @go_0llvm.MX.Header, ptr @go_0llvm.MX.copy }
@pimt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.MX = constant { ptr, ptr, ptr } { ptr @go_0llvm.MX..p, ptr @go_0llvm.MX.Header, ptr @go_0llvm.MX.copy }
@go_0llvm.NS..d = constant %StructType.0 { %_type.0 { i64 48, i64 40, i32 663863557, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.NS..eq..f, ptr @gcbits..ra, ptr @go..C270, ptr @go..C274, ptr @go_0llvm.NS..p }, %IPST.43 { ptr @go..C291, i64 2, i64 2 } }
@go_0llvm.NS..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.NS..eq to i64) }
@const.111 = private constant [17 x i8] c"\09go.llvm\09llvm.NS\00", align 1
@go..C270 = internal constant { ptr, i64 } { ptr @const.111, i64 16 }
@const.112 = private constant [3 x i8] c"NS\00", align 1
@go..C271 = internal constant { ptr, i64 } { ptr @const.112, i64 2 }
@go..C272 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C273 = internal constant [1 x %method.0] zeroinitializer
@go..C274 = internal constant %uncommonType.0 { ptr @go..C271, ptr @go..C272, %IPST.41 { ptr @go..C273, i64 0, i64 0 } }
@go_0llvm.NS..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 2031882329, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C275, ptr @go..C286, ptr @type.._2_2go_0llvm_0NS }, ptr @go_0llvm.NS..d }, comdat
@const.113 = private constant [18 x i8] c"*\09go.llvm\09llvm.NS\00", align 1
@go..C275 = internal constant { ptr, i64 } { ptr @const.113, i64 17 }
@go..C276 = internal constant { ptr, i64 } { ptr @const.9, i64 6 }
@type..func_8_2go_0llvm_0NS_9_8_2go_0llvm_0RR__Header_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -12528280, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C277, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C278, i64 1, i64 1 }, %IPST.42 { ptr @go..C279, i64 1, i64 1 } }, comdat
@const.114 = private constant [49 x i8] c"func(*\09go.llvm\09llvm.NS) *\09go.llvm\09llvm.RR_Header\00", align 1
@go..C277 = internal constant { ptr, i64 } { ptr @const.114, i64 48 }
@go..C278 = internal constant [1 x ptr] [ptr @go_0llvm.NS..p]
@go..C279 = internal constant [1 x ptr] [ptr @go_0llvm.RR__Header..p]
@go..C280 = internal constant { ptr, i64 } { ptr @const.42, i64 4 }
@go..C281 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8_2go_0llvm_0NS_9_8go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1968417704, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C282, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C283, i64 1, i64 1 }, %IPST.42 { ptr @go..C284, i64 1, i64 1 } }, comdat
@const.115 = private constant [41 x i8] c"func(*\09go.llvm\09llvm.NS) \09go.llvm\09llvm.RR\00", align 1
@go..C282 = internal constant { ptr, i64 } { ptr @const.115, i64 40 }
@go..C283 = internal constant [1 x ptr] [ptr @go_0llvm.NS..p]
@go..C284 = internal constant [1 x ptr] [ptr @go_0llvm.RR..d]
@go..C285 = internal constant [2 x %method.0] [%method.0 { ptr @go..C276, ptr null, ptr @type..func_8_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0NS_9_8_2go_0llvm_0RR__Header_9, ptr @go_0llvm.NS.Header }, %method.0 { ptr @go..C280, ptr @go..C281, ptr @type..func_8_9_8go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0NS_9_8go_0llvm_0RR_9, ptr @go_0llvm.NS.copy }]
@go..C286 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.41 { ptr @go..C285, i64 2, i64 2 } }
@type.._2_2go_0llvm_0NS = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1849621095, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C287, ptr null, ptr null }, ptr @go_0llvm.NS..p }, comdat
@const.116 = private constant [19 x i8] c"**\09go.llvm\09llvm.NS\00", align 1
@go..C287 = internal constant { ptr, i64 } { ptr @const.116, i64 18 }
@go..C288 = internal constant { ptr, i64 } { ptr @const.49, i64 3 }
@go..C289 = internal constant { ptr, i64 } { ptr @const.73, i64 2 }
@go..C290 = internal constant { ptr, i64 } { ptr @const.17, i64 18 }
@go..C291 = internal constant [2 x %structField.0] [%structField.0 { ptr @go..C288, ptr null, ptr @go_0llvm.RR__Header..d, ptr null, i64 0 }, %structField.0 { ptr @go..C289, ptr null, ptr @string..d, ptr @go..C290, i64 64 }]
@imt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.NS = local_unnamed_addr constant { ptr, ptr, ptr } { ptr @go_0llvm.NS..d, ptr @go_0llvm.NS.Header, ptr @go_0llvm.NS.copy }
@pimt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.NS = constant { ptr, ptr, ptr } { ptr @go_0llvm.NS..p, ptr @go_0llvm.NS.Header, ptr @go_0llvm.NS.copy }
@go_0llvm.RRSIG..d = constant %StructType.0 { %_type.0 { i64 88, i64 80, i32 2016298271, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.RRSIG..eq..f, ptr @gcbits..buaa, ptr @go..C292, ptr @go..C296, ptr @go_0llvm.RRSIG..p }, %IPST.43 { ptr @go..C322, i64 10, i64 10 } }
@go_0llvm.RRSIG..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.RRSIG..eq to i64) }
@gcbits..buaa = weak constant [2 x i8] c"\81\02", comdat
@const.117 = private constant [20 x i8] c"\09go.llvm\09llvm.RRSIG\00", align 1
@go..C292 = internal constant { ptr, i64 } { ptr @const.117, i64 19 }
@const.118 = private constant [6 x i8] c"RRSIG\00", align 1
@go..C293 = internal constant { ptr, i64 } { ptr @const.118, i64 5 }
@go..C294 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C295 = internal constant [1 x %method.0] zeroinitializer
@go..C296 = internal constant %uncommonType.0 { ptr @go..C293, ptr @go..C294, %IPST.41 { ptr @go..C295, i64 0, i64 0 } }
@go_0llvm.RRSIG..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -2098966023, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C297, ptr @go..C308, ptr @type.._2_2go_0llvm_0RRSIG }, ptr @go_0llvm.RRSIG..d }, comdat
@const.119 = private constant [21 x i8] c"*\09go.llvm\09llvm.RRSIG\00", align 1
@go..C297 = internal constant { ptr, i64 } { ptr @const.119, i64 20 }
@go..C298 = internal constant { ptr, i64 } { ptr @const.9, i64 6 }
@type..func_8_2go_0llvm_0RRSIG_9_8_2go_0llvm_0RR__Header_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 944310632, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C299, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C300, i64 1, i64 1 }, %IPST.42 { ptr @go..C301, i64 1, i64 1 } }, comdat
@const.120 = private constant [52 x i8] c"func(*\09go.llvm\09llvm.RRSIG) *\09go.llvm\09llvm.RR_Header\00", align 1
@go..C299 = internal constant { ptr, i64 } { ptr @const.120, i64 51 }
@go..C300 = internal constant [1 x ptr] [ptr @go_0llvm.RRSIG..p]
@go..C301 = internal constant [1 x ptr] [ptr @go_0llvm.RR__Header..p]
@go..C302 = internal constant { ptr, i64 } { ptr @const.42, i64 4 }
@go..C303 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..func_8_2go_0llvm_0RRSIG_9_8go_0llvm_0RR_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1369710680, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C304, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C305, i64 1, i64 1 }, %IPST.42 { ptr @go..C306, i64 1, i64 1 } }, comdat
@const.121 = private constant [44 x i8] c"func(*\09go.llvm\09llvm.RRSIG) \09go.llvm\09llvm.RR\00", align 1
@go..C304 = internal constant { ptr, i64 } { ptr @const.121, i64 43 }
@go..C305 = internal constant [1 x ptr] [ptr @go_0llvm.RRSIG..p]
@go..C306 = internal constant [1 x ptr] [ptr @go_0llvm.RR..d]
@go..C307 = internal constant [2 x %method.0] [%method.0 { ptr @go..C298, ptr null, ptr @type..func_8_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0RRSIG_9_8_2go_0llvm_0RR__Header_9, ptr @go_0llvm.RRSIG.Header }, %method.0 { ptr @go..C302, ptr @go..C303, ptr @type..func_8_9_8go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0RRSIG_9_8go_0llvm_0RR_9, ptr @go_0llvm.RRSIG.copy }]
@go..C308 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.41 { ptr @go..C307, i64 2, i64 2 } }
@type.._2_2go_0llvm_0RRSIG = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 776282009, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C309, ptr null, ptr null }, ptr @go_0llvm.RRSIG..p }, comdat
@const.122 = private constant [22 x i8] c"**\09go.llvm\09llvm.RRSIG\00", align 1
@go..C309 = internal constant { ptr, i64 } { ptr @const.122, i64 21 }
@go..C310 = internal constant { ptr, i64 } { ptr @const.49, i64 3 }
@const.123 = private constant [12 x i8] c"TypeCovered\00", align 1
@go..C311 = internal constant { ptr, i64 } { ptr @const.123, i64 11 }
@const.124 = private constant [10 x i8] c"Algorithm\00", align 1
@go..C312 = internal constant { ptr, i64 } { ptr @const.124, i64 9 }
@const.125 = private constant [7 x i8] c"Labels\00", align 1
@go..C313 = internal constant { ptr, i64 } { ptr @const.125, i64 6 }
@const.126 = private constant [8 x i8] c"OrigTtl\00", align 1
@go..C314 = internal constant { ptr, i64 } { ptr @const.126, i64 7 }
@const.127 = private constant [11 x i8] c"Expiration\00", align 1
@go..C315 = internal constant { ptr, i64 } { ptr @const.127, i64 10 }
@const.128 = private constant [10 x i8] c"Inception\00", align 1
@go..C316 = internal constant { ptr, i64 } { ptr @const.128, i64 9 }
@const.129 = private constant [7 x i8] c"KeyTag\00", align 1
@go..C317 = internal constant { ptr, i64 } { ptr @const.129, i64 6 }
@const.130 = private constant [11 x i8] c"SignerName\00", align 1
@go..C318 = internal constant { ptr, i64 } { ptr @const.130, i64 10 }
@go..C319 = internal constant { ptr, i64 } { ptr @const.87, i64 17 }
@const.131 = private constant [10 x i8] c"Signature\00", align 1
@go..C320 = internal constant { ptr, i64 } { ptr @const.131, i64 9 }
@const.132 = private constant [13 x i8] c"dns:\22base64\22\00", align 1
@go..C321 = internal constant { ptr, i64 } { ptr @const.132, i64 12 }
@go..C322 = internal constant [10 x %structField.0] [%structField.0 { ptr @go..C310, ptr null, ptr @go_0llvm.RR__Header..d, ptr null, i64 0 }, %structField.0 { ptr @go..C311, ptr null, ptr @uint16..d, ptr null, i64 64 }, %structField.0 { ptr @go..C312, ptr null, ptr @uint8..d, ptr null, i64 68 }, %structField.0 { ptr @go..C313, ptr null, ptr @uint8..d, ptr null, i64 70 }, %structField.0 { ptr @go..C314, ptr null, ptr @uint32..d, ptr null, i64 72 }, %structField.0 { ptr @go..C315, ptr null, ptr @uint32..d, ptr null, i64 80 }, %structField.0 { ptr @go..C316, ptr null, ptr @uint32..d, ptr null, i64 88 }, %structField.0 { ptr @go..C317, ptr null, ptr @uint16..d, ptr null, i64 96 }, %structField.0 { ptr @go..C318, ptr null, ptr @string..d, ptr @go..C319, i64 112 }, %structField.0 { ptr @go..C320, ptr null, ptr @string..d, ptr @go..C321, i64 144 }]
@imt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.RRSIG = local_unnamed_addr constant { ptr, ptr, ptr } { ptr @go_0llvm.RRSIG..d, ptr @go_0llvm.RRSIG.Header, ptr @go_0llvm.RRSIG.copy }
@pimt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.RRSIG = constant { ptr, ptr, ptr } { ptr @go_0llvm.RRSIG..p, ptr @go_0llvm.RRSIG.Header, ptr @go_0llvm.RRSIG.copy }
@go_0llvm.ResponseWriter..d = constant %InterfaceType.0 { %_type.0 { i64 16, i64 16, i32 -1536056202, i8 0, i8 8, i8 8, i8 20, ptr @runtime.interequal..f, ptr @gcbits..da, ptr @go..C323, ptr @go..C327, ptr @go_0llvm.ResponseWriter..p }, %IPST.44 { ptr @go..C405, i64 8, i64 8 } }
@const.133 = private constant [29 x i8] c"\09go.llvm\09llvm.ResponseWriter\00", align 1
@go..C323 = internal constant { ptr, i64 } { ptr @const.133, i64 28 }
@const.134 = private constant [15 x i8] c"ResponseWriter\00", align 1
@go..C324 = internal constant { ptr, i64 } { ptr @const.134, i64 14 }
@go..C325 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C326 = internal constant [1 x %method.0] zeroinitializer
@go..C327 = internal constant %uncommonType.0 { ptr @go..C324, ptr @go..C325, %IPST.41 { ptr @go..C326, i64 0, i64 0 } }
@go_0llvm.ResponseWriter..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1192904553, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C328, ptr null, ptr null }, ptr @go_0llvm.ResponseWriter..d }, comdat
@const.135 = private constant [30 x i8] c"*\09go.llvm\09llvm.ResponseWriter\00", align 1
@go..C328 = internal constant { ptr, i64 } { ptr @const.135, i64 29 }
@const.136 = private constant [6 x i8] c"Close\00", align 1
@go..C329 = internal constant { ptr, i64 } { ptr @const.136, i64 5 }
@type..func_8_9_8error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1188738504, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C330, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C331, i64 0, i64 0 }, %IPST.42 { ptr @go..C332, i64 1, i64 1 } }, comdat
@const.137 = private constant [13 x i8] c"func() error\00", align 1
@go..C330 = internal constant { ptr, i64 } { ptr @const.137, i64 12 }
@go..C331 = internal constant [1 x ptr] zeroinitializer
@go..C332 = internal constant [1 x ptr] [ptr @error..d]
@const.138 = private constant [7 x i8] c"Hijack\00", align 1
@go..C333 = internal constant { ptr, i64 } { ptr @const.138, i64 6 }
@type..func_8_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 8, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C334, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C335, i64 0, i64 0 }, %IPST.42 { ptr @go..C336, i64 0, i64 0 } }, comdat
@const.139 = private constant [7 x i8] c"func()\00", align 1
@go..C334 = internal constant { ptr, i64 } { ptr @const.139, i64 6 }
@go..C335 = internal constant [1 x ptr] zeroinitializer
@go..C336 = internal constant [1 x ptr] zeroinitializer
@const.140 = private constant [10 x i8] c"LocalAddr\00", align 1
@go..C337 = internal constant { ptr, i64 } { ptr @const.140, i64 9 }
@type..func_8_9_8net_0Addr_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 33758664, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C338, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C339, i64 0, i64 0 }, %IPST.42 { ptr @go..C340, i64 1, i64 1 } }, comdat
@const.141 = private constant [21 x i8] c"func() \09net\09net.Addr\00", align 1
@go..C338 = internal constant { ptr, i64 } { ptr @const.141, i64 20 }
@go..C339 = internal constant [1 x ptr] zeroinitializer
@net.Addr..d = external constant %InterfaceType.0
@go..C340 = internal constant [1 x ptr] [ptr @net.Addr..d]
@const.142 = private constant [11 x i8] c"RemoteAddr\00", align 1
@go..C341 = internal constant { ptr, i64 } { ptr @const.142, i64 10 }
@const.143 = private constant [11 x i8] c"TsigStatus\00", align 1
@go..C342 = internal constant { ptr, i64 } { ptr @const.143, i64 10 }
@const.144 = private constant [15 x i8] c"TsigTimersOnly\00", align 1
@go..C343 = internal constant { ptr, i64 } { ptr @const.144, i64 14 }
@type..func_8bool_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1966551592, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C344, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C345, i64 1, i64 1 }, %IPST.42 { ptr @go..C346, i64 0, i64 0 } }, comdat
@const.145 = private constant [11 x i8] c"func(bool)\00", align 1
@go..C344 = internal constant { ptr, i64 } { ptr @const.145, i64 10 }
@go..C345 = internal constant [1 x ptr] [ptr @bool..d]
@go..C346 = internal constant [1 x ptr] zeroinitializer
@const.146 = private constant [6 x i8] c"Write\00", align 1
@go..C347 = internal constant { ptr, i64 } { ptr @const.146, i64 5 }
@type..func_8_6_7uint8_9_8int_3error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1764714264, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C348, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C349, i64 1, i64 1 }, %IPST.42 { ptr @go..C355, i64 2, i64 2 } }, comdat
@const.147 = private constant [27 x i8] c"func([]uint8) (int, error)\00", align 1
@go..C348 = internal constant { ptr, i64 } { ptr @const.147, i64 26 }
@go..C349 = internal constant [1 x ptr] [ptr @type.._6_7uint8]
@int..d = weak constant %_type.0 { i64 8, i64 0, i32 876704034, i8 8, i8 8, i8 8, i8 -126, ptr @runtime.memequal64..f, ptr null, ptr @go..C350, ptr @go..C353, ptr @int..p }, comdat
@const.148 = private constant [4 x i8] c"int\00", align 1
@go..C350 = internal constant { ptr, i64 } { ptr @const.148, i64 3 }
@go..C351 = internal constant { ptr, i64 } { ptr @const.148, i64 3 }
@go..C352 = internal constant [1 x %method.0] zeroinitializer
@go..C353 = internal constant %uncommonType.0 { ptr @go..C351, ptr null, %IPST.41 { ptr @go..C352, i64 0, i64 0 } }
@int..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1142362665, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C354, ptr null, ptr null }, ptr @int..d }, comdat
@const.149 = private constant [5 x i8] c"*int\00", align 1
@go..C354 = internal constant { ptr, i64 } { ptr @const.149, i64 4 }
@go..C355 = internal constant [2 x ptr] [ptr @int..d, ptr @error..d]
@const.150 = private constant [9 x i8] c"WriteMsg\00", align 1
@go..C356 = internal constant { ptr, i64 } { ptr @const.150, i64 8 }
@type..func_8_2go_0llvm_0Msg_9_8error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1007465704, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C357, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C403, i64 1, i64 1 }, %IPST.42 { ptr @go..C404, i64 1, i64 1 } }, comdat
@const.151 = private constant [31 x i8] c"func(*\09go.llvm\09llvm.Msg) error\00", align 1
@go..C357 = internal constant { ptr, i64 } { ptr @const.151, i64 30 }
@go_0llvm.Msg..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 799641593, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C358, ptr null, ptr null }, ptr @go_0llvm.Msg..d }, comdat
@const.152 = private constant [19 x i8] c"*\09go.llvm\09llvm.Msg\00", align 1
@go..C358 = internal constant { ptr, i64 } { ptr @const.152, i64 18 }
@go_0llvm.Msg..d = constant %StructType.0 { %_type.0 { i64 136, i64 120, i32 318413055, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..ajsa, ptr @go..C359, ptr @go..C363, ptr @go_0llvm.Msg..p }, %IPST.43 { ptr @go..C402, i64 6, i64 6 } }
@gcbits..ajsa = weak constant [2 x i8] c" I", comdat
@const.153 = private constant [18 x i8] c"\09go.llvm\09llvm.Msg\00", align 1
@go..C359 = internal constant { ptr, i64 } { ptr @const.153, i64 17 }
@const.154 = private constant [4 x i8] c"Msg\00", align 1
@go..C360 = internal constant { ptr, i64 } { ptr @const.154, i64 3 }
@go..C361 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C362 = internal constant [1 x %method.0] zeroinitializer
@go..C363 = internal constant %uncommonType.0 { ptr @go..C360, ptr @go..C361, %IPST.41 { ptr @go..C362, i64 0, i64 0 } }
@const.155 = private constant [7 x i8] c"MsgHdr\00", align 1
@go..C364 = internal constant { ptr, i64 } { ptr @const.155, i64 6 }
@go_0llvm.MsgHdr..d = constant %StructType.0 { %_type.0 { i64 32, i64 0, i32 1661415275, i8 0, i8 8, i8 8, i8 -103, ptr @go_0llvm.MsgHdr..eq..f, ptr null, ptr @go..C365, ptr @go..C369, ptr @go_0llvm.MsgHdr..p }, %IPST.43 { ptr @go..C382, i64 11, i64 11 } }
@go_0llvm.MsgHdr..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.MsgHdr..eq to i64) }
@const.156 = private constant [21 x i8] c"\09go.llvm\09llvm.MsgHdr\00", align 1
@go..C365 = internal constant { ptr, i64 } { ptr @const.156, i64 20 }
@go..C366 = internal constant { ptr, i64 } { ptr @const.155, i64 6 }
@go..C367 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C368 = internal constant [1 x %method.0] zeroinitializer
@go..C369 = internal constant %uncommonType.0 { ptr @go..C366, ptr @go..C367, %IPST.41 { ptr @go..C368, i64 0, i64 0 } }
@go_0llvm.MsgHdr..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 812840633, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C370, ptr null, ptr null }, ptr @go_0llvm.MsgHdr..d }, comdat
@const.157 = private constant [22 x i8] c"*\09go.llvm\09llvm.MsgHdr\00", align 1
@go..C370 = internal constant { ptr, i64 } { ptr @const.157, i64 21 }
@const.158 = private constant [3 x i8] c"Id\00", align 1
@go..C371 = internal constant { ptr, i64 } { ptr @const.158, i64 2 }
@const.159 = private constant [9 x i8] c"Response\00", align 1
@go..C372 = internal constant { ptr, i64 } { ptr @const.159, i64 8 }
@const.160 = private constant [7 x i8] c"Opcode\00", align 1
@go..C373 = internal constant { ptr, i64 } { ptr @const.160, i64 6 }
@const.161 = private constant [14 x i8] c"Authoritative\00", align 1
@go..C374 = internal constant { ptr, i64 } { ptr @const.161, i64 13 }
@const.162 = private constant [10 x i8] c"Truncated\00", align 1
@go..C375 = internal constant { ptr, i64 } { ptr @const.162, i64 9 }
@const.163 = private constant [17 x i8] c"RecursionDesired\00", align 1
@go..C376 = internal constant { ptr, i64 } { ptr @const.163, i64 16 }
@const.164 = private constant [19 x i8] c"RecursionAvailable\00", align 1
@go..C377 = internal constant { ptr, i64 } { ptr @const.164, i64 18 }
@const.165 = private constant [5 x i8] c"Zero\00", align 1
@go..C378 = internal constant { ptr, i64 } { ptr @const.165, i64 4 }
@const.166 = private constant [18 x i8] c"AuthenticatedData\00", align 1
@go..C379 = internal constant { ptr, i64 } { ptr @const.166, i64 17 }
@const.167 = private constant [17 x i8] c"CheckingDisabled\00", align 1
@go..C380 = internal constant { ptr, i64 } { ptr @const.167, i64 16 }
@const.168 = private constant [6 x i8] c"Rcode\00", align 1
@go..C381 = internal constant { ptr, i64 } { ptr @const.168, i64 5 }
@go..C382 = internal constant [11 x %structField.0] [%structField.0 { ptr @go..C371, ptr null, ptr @uint16..d, ptr null, i64 0 }, %structField.0 { ptr @go..C372, ptr null, ptr @bool..d, ptr null, i64 4 }, %structField.0 { ptr @go..C373, ptr null, ptr @int..d, ptr null, i64 16 }, %structField.0 { ptr @go..C374, ptr null, ptr @bool..d, ptr null, i64 32 }, %structField.0 { ptr @go..C375, ptr null, ptr @bool..d, ptr null, i64 34 }, %structField.0 { ptr @go..C376, ptr null, ptr @bool..d, ptr null, i64 36 }, %structField.0 { ptr @go..C377, ptr null, ptr @bool..d, ptr null, i64 38 }, %structField.0 { ptr @go..C378, ptr null, ptr @bool..d, ptr null, i64 40 }, %structField.0 { ptr @go..C379, ptr null, ptr @bool..d, ptr null, i64 42 }, %structField.0 { ptr @go..C380, ptr null, ptr @bool..d, ptr null, i64 44 }, %structField.0 { ptr @go..C381, ptr null, ptr @int..d, ptr null, i64 48 }]
@const.169 = private constant [9 x i8] c"Compress\00", align 1
@go..C383 = internal constant { ptr, i64 } { ptr @const.169, i64 8 }
@const.170 = private constant [9 x i8] c"json:\22-\22\00", align 1
@go..C384 = internal constant { ptr, i64 } { ptr @const.170, i64 8 }
@const.171 = private constant [9 x i8] c"Question\00", align 1
@go..C385 = internal constant { ptr, i64 } { ptr @const.171, i64 8 }
@type.._6_7go_0llvm_0Question = weak constant %SliceType.0 { %_type.0 { i64 24, i64 8, i32 -768832736, i8 0, i8 8, i8 8, i8 23, ptr null, ptr @gcbits..ba, ptr @go..C386, ptr null, ptr null }, ptr @go_0llvm.Question..d }, comdat
@const.172 = private constant [25 x i8] c"[]\09go.llvm\09llvm.Question\00", align 1
@go..C386 = internal constant { ptr, i64 } { ptr @const.172, i64 24 }
@go_0llvm.Question..d = constant %StructType.0 { %_type.0 { i64 24, i64 8, i32 -768832750, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.Question..eq..f, ptr @gcbits..ba, ptr @go..C387, ptr @go..C391, ptr @go_0llvm.Question..p }, %IPST.43 { ptr @go..C397, i64 3, i64 3 } }
@go_0llvm.Question..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.Question..eq to i64) }
@const.173 = private constant [23 x i8] c"\09go.llvm\09llvm.Question\00", align 1
@go..C387 = internal constant { ptr, i64 } { ptr @const.173, i64 22 }
@go..C388 = internal constant { ptr, i64 } { ptr @const.171, i64 8 }
@go..C389 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C390 = internal constant [1 x %method.0] zeroinitializer
@go..C391 = internal constant %uncommonType.0 { ptr @go..C388, ptr @go..C389, %IPST.41 { ptr @go..C390, i64 0, i64 0 } }
@go_0llvm.Question..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 583577897, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C392, ptr null, ptr null }, ptr @go_0llvm.Question..d }, comdat
@const.174 = private constant [24 x i8] c"*\09go.llvm\09llvm.Question\00", align 1
@go..C392 = internal constant { ptr, i64 } { ptr @const.174, i64 23 }
@go..C393 = internal constant { ptr, i64 } { ptr @const.14, i64 4 }
@go..C394 = internal constant { ptr, i64 } { ptr @const.17, i64 18 }
@const.175 = private constant [6 x i8] c"Qtype\00", align 1
@go..C395 = internal constant { ptr, i64 } { ptr @const.175, i64 5 }
@const.176 = private constant [7 x i8] c"Qclass\00", align 1
@go..C396 = internal constant { ptr, i64 } { ptr @const.176, i64 6 }
@go..C397 = internal constant [3 x %structField.0] [%structField.0 { ptr @go..C393, ptr null, ptr @string..d, ptr @go..C394, i64 0 }, %structField.0 { ptr @go..C395, ptr null, ptr @uint16..d, ptr null, i64 32 }, %structField.0 { ptr @go..C396, ptr null, ptr @uint16..d, ptr null, i64 36 }]
@const.177 = private constant [7 x i8] c"Answer\00", align 1
@go..C398 = internal constant { ptr, i64 } { ptr @const.177, i64 6 }
@type.._6_7go_0llvm_0RR = weak constant %SliceType.0 { %_type.0 { i64 24, i64 8, i32 -2058926448, i8 0, i8 8, i8 8, i8 23, ptr null, ptr @gcbits..ba, ptr @go..C399, ptr null, ptr null }, ptr @go_0llvm.RR..d }, comdat
@const.178 = private constant [19 x i8] c"[]\09go.llvm\09llvm.RR\00", align 1
@go..C399 = internal constant { ptr, i64 } { ptr @const.178, i64 18 }
@go..C400 = internal constant { ptr, i64 } { ptr @const.73, i64 2 }
@const.179 = private constant [6 x i8] c"Extra\00", align 1
@go..C401 = internal constant { ptr, i64 } { ptr @const.179, i64 5 }
@go..C402 = internal constant [6 x %structField.0] [%structField.0 { ptr @go..C364, ptr null, ptr @go_0llvm.MsgHdr..d, ptr null, i64 1 }, %structField.0 { ptr @go..C383, ptr null, ptr @bool..d, ptr @go..C384, i64 64 }, %structField.0 { ptr @go..C385, ptr null, ptr @type.._6_7go_0llvm_0Question, ptr null, i64 80 }, %structField.0 { ptr @go..C398, ptr null, ptr @type.._6_7go_0llvm_0RR, ptr null, i64 128 }, %structField.0 { ptr @go..C400, ptr null, ptr @type.._6_7go_0llvm_0RR, ptr null, i64 176 }, %structField.0 { ptr @go..C401, ptr null, ptr @type.._6_7go_0llvm_0RR, ptr null, i64 224 }]
@go..C403 = internal constant [1 x ptr] [ptr @go_0llvm.Msg..p]
@go..C404 = internal constant [1 x ptr] [ptr @error..d]
@go..C405 = internal constant [8 x %imethod.0] [%imethod.0 { ptr @go..C329, ptr null, ptr @type..func_8_9_8error_9 }, %imethod.0 { ptr @go..C333, ptr null, ptr @type..func_8_9_8_9 }, %imethod.0 { ptr @go..C337, ptr null, ptr @type..func_8_9_8net_0Addr_9 }, %imethod.0 { ptr @go..C341, ptr null, ptr @type..func_8_9_8net_0Addr_9 }, %imethod.0 { ptr @go..C342, ptr null, ptr @type..func_8_9_8error_9 }, %imethod.0 { ptr @go..C343, ptr null, ptr @type..func_8bool_9_8_9 }, %imethod.0 { ptr @go..C347, ptr null, ptr @type..func_8_6_7uint8_9_8int_3error_9 }, %imethod.0 { ptr @go..C356, ptr null, ptr @type..func_8_2go_0llvm_0Msg_9_8error_9 }]
@go_0llvm.compressionMap..d = constant %StructType.0 { %_type.0 { i64 16, i64 16, i32 618047032, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..da, ptr @go..C406, ptr @go..C410, ptr @go_0llvm.compressionMap..p }, %IPST.43 { ptr @go..C437, i64 2, i64 2 } }
@const.180 = private constant [29 x i8] c"\09go.llvm\09llvm.compressionMap\00", align 1
@go..C406 = internal constant { ptr, i64 } { ptr @const.180, i64 28 }
@const.181 = private constant [15 x i8] c"compressionMap\00", align 1
@go..C407 = internal constant { ptr, i64 } { ptr @const.181, i64 14 }
@go..C408 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C409 = internal constant [1 x %method.0] zeroinitializer
@go..C410 = internal constant %uncommonType.0 { ptr @go..C407, ptr @go..C408, %IPST.41 { ptr @go..C409, i64 0, i64 0 } }
@go_0llvm.compressionMap..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1298817929, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C411, ptr null, ptr null }, ptr @go_0llvm.compressionMap..d }, comdat
@const.182 = private constant [30 x i8] c"*\09go.llvm\09llvm.compressionMap\00", align 1
@go..C411 = internal constant { ptr, i64 } { ptr @const.182, i64 29 }
@const.183 = private constant [4 x i8] c"ext\00", align 1
@go..C412 = internal constant { ptr, i64 } { ptr @const.183, i64 3 }
@go..C413 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..map_6string_7int = weak constant %MapType.0 { %_type.0 { i64 8, i64 8, i32 -1122248756, i8 0, i8 8, i8 8, i8 53, ptr null, ptr @gcbits..ba, ptr @go..C414, ptr null, ptr null }, ptr @string..d, ptr @int..d, ptr @type..struct_4_4x_5topbits_b_68x_7uint8_ckeys_b_68x_7string_cvalues_b_68x_7int_coverflow_b_2_4void_5_5, ptr @runtime.strhash..f, i8 16, i8 8, i16 208, i32 12 }, comdat
@const.184 = private constant [15 x i8] c"map[string]int\00", align 1
@go..C414 = internal constant { ptr, i64 } { ptr @const.184, i64 14 }
@type..struct_4_4x_5topbits_b_68x_7uint8_ckeys_b_68x_7string_cvalues_b_68x_7int_coverflow_b_2_4void_5_5 = weak constant %StructType.0 { %_type.0 { i64 208, i64 208, i32 -1581031772, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..kvkbaba, ptr @go..C415, ptr null, ptr null }, %IPST.43 { ptr @go..C425, i64 4, i64 4 } }, comdat
@gcbits..kvkbaba = weak constant [4 x i8] c"\AA\AA\00\02", comdat
@const.185 = private constant [71 x i8] c"struct { topbits [8]uint8; keys [8]string; values [8]int; overflow * }\00", align 1
@go..C415 = internal constant { ptr, i64 } { ptr @const.185, i64 70 }
@const.186 = private constant [8 x i8] c"topbits\00", align 1
@go..C416 = internal constant { ptr, i64 } { ptr @const.186, i64 7 }
@type.._68x_7uint8 = weak constant %ArrayType.0 { %_type.0 { i64 8, i64 0, i32 529264193, i8 8, i8 1, i8 1, i8 -111, ptr null, ptr null, ptr @go..C417, ptr null, ptr null }, ptr @uint8..d, ptr @type.._6_7uint8, i64 8 }, comdat
@const.187 = private constant [9 x i8] c"[8]uint8\00", align 1
@go..C417 = internal constant { ptr, i64 } { ptr @const.187, i64 8 }
@const.188 = private constant [5 x i8] c"keys\00", align 1
@go..C418 = internal constant { ptr, i64 } { ptr @const.188, i64 4 }
@type.._68x_7string = weak constant %ArrayType.0 { %_type.0 { i64 128, i64 120, i32 297061699, i8 0, i8 8, i8 8, i8 17, ptr null, ptr @gcbits..vkva, ptr @go..C419, ptr null, ptr null }, ptr @string..d, ptr @type.._6_7string, i64 8 }, comdat
@gcbits..vkva = weak constant [2 x i8] c"UU", comdat
@const.189 = private constant [10 x i8] c"[8]string\00", align 1
@go..C419 = internal constant { ptr, i64 } { ptr @const.189, i64 9 }
@type.._6_7string = weak constant %SliceType.0 { %_type.0 { i64 24, i64 8, i32 -1998952792, i8 0, i8 8, i8 8, i8 23, ptr null, ptr @gcbits..ba, ptr @go..C420, ptr null, ptr null }, ptr @string..d }, comdat
@const.190 = private constant [9 x i8] c"[]string\00", align 1
@go..C420 = internal constant { ptr, i64 } { ptr @const.190, i64 8 }
@const.191 = private constant [7 x i8] c"values\00", align 1
@go..C421 = internal constant { ptr, i64 } { ptr @const.191, i64 6 }
@type.._68x_7int = weak constant %ArrayType.0 { %_type.0 { i64 64, i64 0, i32 1753408083, i8 8, i8 8, i8 8, i8 -111, ptr null, ptr null, ptr @go..C422, ptr null, ptr null }, ptr @int..d, ptr @type.._6_7int, i64 8 }, comdat
@const.192 = private constant [7 x i8] c"[8]int\00", align 1
@go..C422 = internal constant { ptr, i64 } { ptr @const.192, i64 6 }
@type.._6_7int = weak constant %SliceType.0 { %_type.0 { i64 24, i64 8, i32 876704048, i8 0, i8 8, i8 8, i8 23, ptr null, ptr @gcbits..ba, ptr @go..C423, ptr null, ptr null }, ptr @int..d }, comdat
@const.193 = private constant [6 x i8] c"[]int\00", align 1
@go..C423 = internal constant { ptr, i64 } { ptr @const.193, i64 5 }
@const.194 = private constant [9 x i8] c"overflow\00", align 1
@go..C424 = internal constant { ptr, i64 } { ptr @const.194, i64 8 }
@unsafe.Pointer..d = external constant %_type.0
@go..C425 = internal constant [4 x %structField.0] [%structField.0 { ptr @go..C416, ptr null, ptr @type.._68x_7uint8, ptr null, i64 0 }, %structField.0 { ptr @go..C418, ptr null, ptr @type.._68x_7string, ptr null, i64 16 }, %structField.0 { ptr @go..C421, ptr null, ptr @type.._68x_7int, ptr null, i64 272 }, %structField.0 { ptr @go..C424, ptr null, ptr @unsafe.Pointer..d, ptr null, i64 400 }]
@runtime.strhash..f = external constant %functionDescriptor.0
@go..C426 = internal constant { ptr, i64 } { ptr @const.148, i64 3 }
@go..C427 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..map_6string_7uint16 = weak constant %MapType.0 { %_type.0 { i64 8, i64 8, i32 -1922220502, i8 0, i8 8, i8 8, i8 53, ptr null, ptr @gcbits..ba, ptr @go..C428, ptr null, ptr null }, ptr @string..d, ptr @uint16..d, ptr @type..struct_4_4x_5topbits_b_68x_7uint8_ckeys_b_68x_7string_cvalues_b_68x_7uint16_coverflow_b_2_4void_5_5, ptr @runtime.strhash..f, i8 16, i8 2, i16 160, i32 12 }, comdat
@const.195 = private constant [18 x i8] c"map[string]uint16\00", align 1
@go..C428 = internal constant { ptr, i64 } { ptr @const.195, i64 17 }
@type..struct_4_4x_5topbits_b_68x_7uint8_ckeys_b_68x_7string_cvalues_b_68x_7uint16_coverflow_b_2_4void_5_5 = weak constant %StructType.0 { %_type.0 { i64 160, i64 160, i32 -1410323868, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..kvkra, ptr @go..C429, ptr null, ptr null }, %IPST.43 { ptr @go..C436, i64 4, i64 4 } }, comdat
@gcbits..kvkra = weak constant [3 x i8] c"\AA\AA\08", comdat
@const.196 = private constant [74 x i8] c"struct { topbits [8]uint8; keys [8]string; values [8]uint16; overflow * }\00", align 1
@go..C429 = internal constant { ptr, i64 } { ptr @const.196, i64 73 }
@go..C430 = internal constant { ptr, i64 } { ptr @const.186, i64 7 }
@go..C431 = internal constant { ptr, i64 } { ptr @const.188, i64 4 }
@go..C432 = internal constant { ptr, i64 } { ptr @const.191, i64 6 }
@type.._68x_7uint16 = weak constant %ArrayType.0 { %_type.0 { i64 16, i64 0, i32 153464591, i8 8, i8 2, i8 2, i8 -111, ptr null, ptr null, ptr @go..C433, ptr null, ptr null }, ptr @uint16..d, ptr @type.._6_7uint16, i64 8 }, comdat
@const.197 = private constant [10 x i8] c"[8]uint16\00", align 1
@go..C433 = internal constant { ptr, i64 } { ptr @const.197, i64 9 }
@type.._6_7uint16 = weak constant %SliceType.0 { %_type.0 { i64 24, i64 8, i32 76732302, i8 0, i8 8, i8 8, i8 23, ptr null, ptr @gcbits..ba, ptr @go..C434, ptr null, ptr null }, ptr @uint16..d }, comdat
@const.198 = private constant [9 x i8] c"[]uint16\00", align 1
@go..C434 = internal constant { ptr, i64 } { ptr @const.198, i64 8 }
@go..C435 = internal constant { ptr, i64 } { ptr @const.194, i64 8 }
@go..C436 = internal constant [4 x %structField.0] [%structField.0 { ptr @go..C430, ptr null, ptr @type.._68x_7uint8, ptr null, i64 0 }, %structField.0 { ptr @go..C431, ptr null, ptr @type.._68x_7string, ptr null, i64 16 }, %structField.0 { ptr @go..C432, ptr null, ptr @type.._68x_7uint16, ptr null, i64 272 }, %structField.0 { ptr @go..C435, ptr null, ptr @unsafe.Pointer..d, ptr null, i64 304 }]
@go..C437 = internal constant [2 x %structField.0] [%structField.0 { ptr @go..C412, ptr @go..C413, ptr @type..map_6string_7int, ptr null, i64 0 }, %structField.0 { ptr @go..C426, ptr @go..C427, ptr @type..map_6string_7uint16, ptr null, i64 16 }]
@go_0llvm.Config..d = constant %StructType.0 { %_type.0 { i64 248, i64 248, i32 1742215688, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..ffncgFb, ptr @go..C438, ptr @go..C442, ptr @go_0llvm.Config..p }, %IPST.43 { ptr @go..C558, i64 19, i64 19 } }
@gcbits..ffncgFb = weak constant [4 x i8] c"\A54a~", comdat
@const.199 = private constant [21 x i8] c"\09go.llvm\09llvm.Config\00", align 1
@go..C438 = internal constant { ptr, i64 } { ptr @const.199, i64 20 }
@const.200 = private constant [7 x i8] c"Config\00", align 1
@go..C439 = internal constant { ptr, i64 } { ptr @const.200, i64 6 }
@go..C440 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C441 = internal constant [1 x %method.0] zeroinitializer
@go..C442 = internal constant %uncommonType.0 { ptr @go..C439, ptr @go..C440, %IPST.41 { ptr @go..C441, i64 0, i64 0 } }
@go_0llvm.Config..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 2105647241, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C443, ptr null, ptr null }, ptr @go_0llvm.Config..d }, comdat
@const.201 = private constant [22 x i8] c"*\09go.llvm\09llvm.Config\00", align 1
@go..C443 = internal constant { ptr, i64 } { ptr @const.201, i64 21 }
@const.202 = private constant [5 x i8] c"Zone\00", align 1
@go..C444 = internal constant { ptr, i64 } { ptr @const.202, i64 4 }
@const.203 = private constant [12 x i8] c"ListenHosts\00", align 1
@go..C445 = internal constant { ptr, i64 } { ptr @const.203, i64 11 }
@go..C446 = internal constant { ptr, i64 } { ptr @const.102, i64 4 }
@const.204 = private constant [5 x i8] c"Root\00", align 1
@go..C447 = internal constant { ptr, i64 } { ptr @const.204, i64 4 }
@const.205 = private constant [6 x i8] c"Debug\00", align 1
@go..C448 = internal constant { ptr, i64 } { ptr @const.205, i64 5 }
@const.206 = private constant [11 x i8] c"Stacktrace\00", align 1
@go..C449 = internal constant { ptr, i64 } { ptr @const.206, i64 10 }
@const.207 = private constant [10 x i8] c"Transport\00", align 1
@go..C450 = internal constant { ptr, i64 } { ptr @const.207, i64 9 }
@const.208 = private constant [24 x i8] c"HTTPRequestValidateFunc\00", align 1
@go..C451 = internal constant { ptr, i64 } { ptr @const.208, i64 23 }
@type..func_8_2net_1http_0Request_9_8bool_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 2015603048, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C452, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C453, i64 1, i64 1 }, %IPST.42 { ptr @go..C454, i64 1, i64 1 } }, comdat
@const.209 = private constant [36 x i8] c"func(*\09net_1http\09http.Request) bool\00", align 1
@go..C452 = internal constant { ptr, i64 } { ptr @const.209, i64 35 }
@net_1http.Request..p = external constant %PtrType.0
@go..C453 = internal constant [1 x ptr] [ptr @net_1http.Request..p]
@go..C454 = internal constant [1 x ptr] [ptr @bool..d]
@const.210 = private constant [12 x i8] c"FilterFuncs\00", align 1
@go..C455 = internal constant { ptr, i64 } { ptr @const.210, i64 11 }
@type.._6_7go_0llvm_0FilterFunc = weak constant %SliceType.0 { %_type.0 { i64 24, i64 8, i32 -2058011432, i8 0, i8 8, i8 8, i8 23, ptr null, ptr @gcbits..ba, ptr @go..C456, ptr null, ptr null }, ptr @go_0llvm.FilterFunc..d }, comdat
@const.211 = private constant [27 x i8] c"[]\09go.llvm\09llvm.FilterFunc\00", align 1
@go..C456 = internal constant { ptr, i64 } { ptr @const.211, i64 26 }
@go_0llvm.FilterFunc..d = constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -2058011446, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C457, ptr @go..C461, ptr @go_0llvm.FilterFunc..p }, i8 0, %IPST.42 { ptr @go..C494, i64 2, i64 2 }, %IPST.42 { ptr @go..C495, i64 1, i64 1 } }
@const.212 = private constant [25 x i8] c"\09go.llvm\09llvm.FilterFunc\00", align 1
@go..C457 = internal constant { ptr, i64 } { ptr @const.212, i64 24 }
@const.213 = private constant [11 x i8] c"FilterFunc\00", align 1
@go..C458 = internal constant { ptr, i64 } { ptr @const.213, i64 10 }
@go..C459 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C460 = internal constant [1 x %method.0] zeroinitializer
@go..C461 = internal constant %uncommonType.0 { ptr @go..C458, ptr @go..C459, %IPST.41 { ptr @go..C460, i64 0, i64 0 } }
@go_0llvm.FilterFunc..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1431555241, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C462, ptr null, ptr null }, ptr @go_0llvm.FilterFunc..d }, comdat
@const.214 = private constant [26 x i8] c"*\09go.llvm\09llvm.FilterFunc\00", align 1
@go..C462 = internal constant { ptr, i64 } { ptr @const.214, i64 25 }
@context.Context..d = external constant %InterfaceType.0
@go_0llvm.Request..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1678514439, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C463, ptr null, ptr null }, ptr @go_0llvm.Request..d }, comdat
@const.215 = private constant [23 x i8] c"*\09go.llvm\09llvm.Request\00", align 1
@go..C463 = internal constant { ptr, i64 } { ptr @const.215, i64 22 }
@go_0llvm.Request..d = constant %StructType.0 { %_type.0 { i64 128, i64 120, i32 -373342609, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.Request..eq..f, ptr @gcbits..pkva, ptr @go..C464, ptr @go..C468, ptr @go_0llvm.Request..p }, %IPST.43 { ptr @go..C493, i64 11, i64 11 } }
@go_0llvm.Request..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.Request..eq to i64) }
@gcbits..pkva = weak constant [2 x i8] c"OU", comdat
@const.216 = private constant [22 x i8] c"\09go.llvm\09llvm.Request\00", align 1
@go..C464 = internal constant { ptr, i64 } { ptr @const.216, i64 21 }
@const.217 = private constant [8 x i8] c"Request\00", align 1
@go..C465 = internal constant { ptr, i64 } { ptr @const.217, i64 7 }
@go..C466 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C467 = internal constant [1 x %method.0] zeroinitializer
@go..C468 = internal constant %uncommonType.0 { ptr @go..C465, ptr @go..C466, %IPST.41 { ptr @go..C467, i64 0, i64 0 } }
@const.218 = private constant [4 x i8] c"Req\00", align 1
@go..C469 = internal constant { ptr, i64 } { ptr @const.218, i64 3 }
@const.219 = private constant [2 x i8] c"W\00", align 1
@go..C470 = internal constant { ptr, i64 } { ptr @const.219, i64 1 }
@go..C471 = internal constant { ptr, i64 } { ptr @const.202, i64 4 }
@const.220 = private constant [5 x i8] c"size\00", align 1
@go..C472 = internal constant { ptr, i64 } { ptr @const.220, i64 4 }
@go..C473 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.221 = private constant [3 x i8] c"do\00", align 1
@go..C474 = internal constant { ptr, i64 } { ptr @const.221, i64 2 }
@go..C475 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.222 = private constant [7 x i8] c"family\00", align 1
@go..C476 = internal constant { ptr, i64 } { ptr @const.222, i64 6 }
@go..C477 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@int8..d = weak constant %_type.0 { i64 1, i64 0, i32 1812276124, i8 8, i8 1, i8 1, i8 -125, ptr @runtime.memequal8..f, ptr null, ptr @go..C478, ptr @go..C481, ptr @int8..p }, comdat
@const.223 = private constant [5 x i8] c"int8\00", align 1
@go..C478 = internal constant { ptr, i64 } { ptr @const.223, i64 4 }
@go..C479 = internal constant { ptr, i64 } { ptr @const.223, i64 4 }
@go..C480 = internal constant [1 x %method.0] zeroinitializer
@go..C481 = internal constant %uncommonType.0 { ptr @go..C479, ptr null, %IPST.41 { ptr @go..C480, i64 0, i64 0 } }
@int8..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1068353079, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C482, ptr null, ptr null }, ptr @int8..d }, comdat
@const.224 = private constant [6 x i8] c"*int8\00", align 1
@go..C482 = internal constant { ptr, i64 } { ptr @const.224, i64 5 }
@const.225 = private constant [5 x i8] c"name\00", align 1
@go..C483 = internal constant { ptr, i64 } { ptr @const.225, i64 4 }
@go..C484 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.226 = private constant [3 x i8] c"ip\00", align 1
@go..C485 = internal constant { ptr, i64 } { ptr @const.226, i64 2 }
@go..C486 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.227 = private constant [5 x i8] c"port\00", align 1
@go..C487 = internal constant { ptr, i64 } { ptr @const.227, i64 4 }
@go..C488 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.228 = private constant [10 x i8] c"localPort\00", align 1
@go..C489 = internal constant { ptr, i64 } { ptr @const.228, i64 9 }
@go..C490 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.229 = private constant [8 x i8] c"localIP\00", align 1
@go..C491 = internal constant { ptr, i64 } { ptr @const.229, i64 7 }
@go..C492 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C493 = internal constant [11 x %structField.0] [%structField.0 { ptr @go..C469, ptr null, ptr @go_0llvm.Msg..p, ptr null, i64 0 }, %structField.0 { ptr @go..C470, ptr null, ptr @go_0llvm.ResponseWriter..d, ptr null, i64 16 }, %structField.0 { ptr @go..C471, ptr null, ptr @string..d, ptr null, i64 48 }, %structField.0 { ptr @go..C472, ptr @go..C473, ptr @uint16..d, ptr null, i64 80 }, %structField.0 { ptr @go..C474, ptr @go..C475, ptr @bool..d, ptr null, i64 84 }, %structField.0 { ptr @go..C476, ptr @go..C477, ptr @int8..d, ptr null, i64 86 }, %structField.0 { ptr @go..C483, ptr @go..C484, ptr @string..d, ptr null, i64 96 }, %structField.0 { ptr @go..C485, ptr @go..C486, ptr @string..d, ptr null, i64 128 }, %structField.0 { ptr @go..C487, ptr @go..C488, ptr @string..d, ptr null, i64 160 }, %structField.0 { ptr @go..C489, ptr @go..C490, ptr @string..d, ptr null, i64 192 }, %structField.0 { ptr @go..C491, ptr @go..C492, ptr @string..d, ptr null, i64 224 }]
@go..C494 = internal constant [2 x ptr] [ptr @context.Context..d, ptr @go_0llvm.Request..p]
@go..C495 = internal constant [1 x ptr] [ptr @bool..d]
@const.230 = private constant [9 x i8] c"ViewName\00", align 1
@go..C496 = internal constant { ptr, i64 } { ptr @const.230, i64 8 }
@const.231 = private constant [12 x i8] c"ReadTimeout\00", align 1
@go..C497 = internal constant { ptr, i64 } { ptr @const.231, i64 11 }
@time.Duration..d = external constant %_type.0
@const.232 = private constant [13 x i8] c"WriteTimeout\00", align 1
@go..C498 = internal constant { ptr, i64 } { ptr @const.232, i64 12 }
@const.233 = private constant [12 x i8] c"IdleTimeout\00", align 1
@go..C499 = internal constant { ptr, i64 } { ptr @const.233, i64 11 }
@const.234 = private constant [11 x i8] c"TsigSecret\00", align 1
@go..C500 = internal constant { ptr, i64 } { ptr @const.234, i64 10 }
@type..map_6string_7string = weak constant %MapType.0 { %_type.0 { i64 8, i64 8, i32 297061700, i8 0, i8 8, i8 8, i8 53, ptr null, ptr @gcbits..ba, ptr @go..C501, ptr null, ptr null }, ptr @string..d, ptr @string..d, ptr @type..struct_4_4x_5topbits_b_68x_7uint8_ckeys_b_68x_7string_cvalues_b_68x_7string_coverflow_b_2_4void_5_5, ptr @runtime.strhash..f, i8 16, i8 16, i16 272, i32 12 }, comdat
@const.235 = private constant [18 x i8] c"map[string]string\00", align 1
@go..C501 = internal constant { ptr, i64 } { ptr @const.235, i64 17 }
@type..struct_4_4x_5topbits_b_68x_7uint8_ckeys_b_68x_7string_cvalues_b_68x_7string_coverflow_b_2_4void_5_5 = weak constant %StructType.0 { %_type.0 { i64 272, i64 272, i32 887229860, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..kvkvkvka, ptr @go..C502, ptr null, ptr null }, %IPST.43 { ptr @go..C507, i64 4, i64 4 } }, comdat
@gcbits..kvkvkvka = weak constant [5 x i8] c"\AA\AA\AA\AA\02", comdat
@const.236 = private constant [74 x i8] c"struct { topbits [8]uint8; keys [8]string; values [8]string; overflow * }\00", align 1
@go..C502 = internal constant { ptr, i64 } { ptr @const.236, i64 73 }
@go..C503 = internal constant { ptr, i64 } { ptr @const.186, i64 7 }
@go..C504 = internal constant { ptr, i64 } { ptr @const.188, i64 4 }
@go..C505 = internal constant { ptr, i64 } { ptr @const.191, i64 6 }
@go..C506 = internal constant { ptr, i64 } { ptr @const.194, i64 8 }
@go..C507 = internal constant [4 x %structField.0] [%structField.0 { ptr @go..C503, ptr null, ptr @type.._68x_7uint8, ptr null, i64 0 }, %structField.0 { ptr @go..C504, ptr null, ptr @type.._68x_7string, ptr null, i64 16 }, %structField.0 { ptr @go..C505, ptr null, ptr @type.._68x_7string, ptr null, i64 272 }, %structField.0 { ptr @go..C506, ptr null, ptr @unsafe.Pointer..d, ptr null, i64 528 }]
@const.237 = private constant [7 x i8] c"Plugin\00", align 1
@go..C508 = internal constant { ptr, i64 } { ptr @const.237, i64 6 }
@type.._6_7go_0llvm_0Plugin = weak constant %SliceType.0 { %_type.0 { i64 24, i64 8, i32 -1978908885, i8 0, i8 8, i8 8, i8 23, ptr null, ptr @gcbits..ba, ptr @go..C509, ptr null, ptr null }, ptr @go_0llvm.Plugin..d }, comdat
@const.238 = private constant [23 x i8] c"[]\09go.llvm\09llvm.Plugin\00", align 1
@go..C509 = internal constant { ptr, i64 } { ptr @const.238, i64 22 }
@go_0llvm.Plugin..d = constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1978908899, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C510, ptr @go..C514, ptr @go_0llvm.Plugin..p }, i8 0, %IPST.42 { ptr @go..C528, i64 1, i64 1 }, %IPST.42 { ptr @go..C529, i64 1, i64 1 } }
@const.239 = private constant [21 x i8] c"\09go.llvm\09llvm.Plugin\00", align 1
@go..C510 = internal constant { ptr, i64 } { ptr @const.239, i64 20 }
@go..C511 = internal constant { ptr, i64 } { ptr @const.237, i64 6 }
@go..C512 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C513 = internal constant [1 x %method.0] zeroinitializer
@go..C514 = internal constant %uncommonType.0 { ptr @go..C511, ptr @go..C512, %IPST.41 { ptr @go..C513, i64 0, i64 0 } }
@go_0llvm.Plugin..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1597771303, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C515, ptr null, ptr null }, ptr @go_0llvm.Plugin..d }, comdat
@const.240 = private constant [22 x i8] c"*\09go.llvm\09llvm.Plugin\00", align 1
@go..C515 = internal constant { ptr, i64 } { ptr @const.240, i64 21 }
@go_0llvm.Handler..d = constant %InterfaceType.0 { %_type.0 { i64 16, i64 16, i32 -1808603982, i8 0, i8 8, i8 8, i8 20, ptr @runtime.interequal..f, ptr @gcbits..da, ptr @go..C516, ptr @go..C520, ptr @go_0llvm.Handler..p }, %IPST.44 { ptr @go..C527, i64 2, i64 2 } }
@const.241 = private constant [22 x i8] c"\09go.llvm\09llvm.Handler\00", align 1
@go..C516 = internal constant { ptr, i64 } { ptr @const.241, i64 21 }
@const.242 = private constant [8 x i8] c"Handler\00", align 1
@go..C517 = internal constant { ptr, i64 } { ptr @const.242, i64 7 }
@go..C518 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C519 = internal constant [1 x %method.0] zeroinitializer
@go..C520 = internal constant %uncommonType.0 { ptr @go..C517, ptr @go..C518, %IPST.41 { ptr @go..C519, i64 0, i64 0 } }
@go_0llvm.Handler..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1127107369, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C521, ptr null, ptr null }, ptr @go_0llvm.Handler..d }, comdat
@const.243 = private constant [23 x i8] c"*\09go.llvm\09llvm.Handler\00", align 1
@go..C521 = internal constant { ptr, i64 } { ptr @const.243, i64 22 }
@go..C522 = internal constant { ptr, i64 } { ptr @const.14, i64 4 }
@const.244 = private constant [9 x i8] c"ServeDNS\00", align 1
@go..C523 = internal constant { ptr, i64 } { ptr @const.244, i64 8 }
@type..func_8context_0Context_3go_0llvm_0ResponseWriter_3_2go_0llvm_0Msg_9_8int_3error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -575564952, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C524, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C525, i64 3, i64 3 }, %IPST.42 { ptr @go..C526, i64 2, i64 2 } }, comdat
@const.245 = private constant [94 x i8] c"func(\09context\09context.Context, \09go.llvm\09llvm.ResponseWriter, *\09go.llvm\09llvm.Msg) (int, error)\00", align 1
@go..C524 = internal constant { ptr, i64 } { ptr @const.245, i64 93 }
@go..C525 = internal constant [3 x ptr] [ptr @context.Context..d, ptr @go_0llvm.ResponseWriter..d, ptr @go_0llvm.Msg..p]
@go..C526 = internal constant [2 x ptr] [ptr @int..d, ptr @error..d]
@go..C527 = internal constant [2 x %imethod.0] [%imethod.0 { ptr @go..C522, ptr null, ptr @type..func_8_9_8string_9 }, %imethod.0 { ptr @go..C523, ptr null, ptr @type..func_8context_0Context_3go_0llvm_0ResponseWriter_3_2go_0llvm_0Msg_9_8int_3error_9 }]
@go..C528 = internal constant [1 x ptr] [ptr @go_0llvm.Handler..d]
@go..C529 = internal constant [1 x ptr] [ptr @go_0llvm.Handler..d]
@const.246 = private constant [12 x i8] c"pluginChain\00", align 1
@go..C530 = internal constant { ptr, i64 } { ptr @const.246, i64 11 }
@go..C531 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.247 = private constant [9 x i8] c"registry\00", align 1
@go..C532 = internal constant { ptr, i64 } { ptr @const.247, i64 8 }
@go..C533 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..map_6string_7go_0llvm_0Handler = weak constant %MapType.0 { %_type.0 { i64 8, i64 8, i32 487410524, i8 0, i8 8, i8 8, i8 53, ptr null, ptr @gcbits..ba, ptr @go..C534, ptr null, ptr null }, ptr @string..d, ptr @go_0llvm.Handler..d, ptr @type..struct_4_4x_5topbits_b_68x_7uint8_ckeys_b_68x_7string_cvalues_b_68x_7go_0llvm_0Handler_coverflow_b_2_4void_5_5, ptr @runtime.strhash..f, i8 16, i8 16, i16 272, i32 12 }, comdat
@const.248 = private constant [33 x i8] c"map[string]\09go.llvm\09llvm.Handler\00", align 1
@go..C534 = internal constant { ptr, i64 } { ptr @const.248, i64 32 }
@type..struct_4_4x_5topbits_b_68x_7uint8_ckeys_b_68x_7string_cvalues_b_68x_7go_0llvm_0Handler_coverflow_b_2_4void_5_5 = weak constant %StructType.0 { %_type.0 { i64 272, i64 272, i32 -1611542364, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..kvkDFFpa, ptr @go..C535, ptr null, ptr null }, %IPST.43 { ptr @go..C542, i64 4, i64 4 } }, comdat
@gcbits..kvkDFFpa = weak constant [5 x i8] c"\AA\AA\FE\FF\03", comdat
@const.249 = private constant [89 x i8] c"struct { topbits [8]uint8; keys [8]string; values [8]\09go.llvm\09llvm.Handler; overflow * }\00", align 1
@go..C535 = internal constant { ptr, i64 } { ptr @const.249, i64 88 }
@go..C536 = internal constant { ptr, i64 } { ptr @const.186, i64 7 }
@go..C537 = internal constant { ptr, i64 } { ptr @const.188, i64 4 }
@go..C538 = internal constant { ptr, i64 } { ptr @const.191, i64 6 }
@type.._68x_7go_0llvm_0Handler = weak constant %ArrayType.0 { %_type.0 { i64 128, i64 128, i32 677759347, i8 0, i8 8, i8 8, i8 17, ptr null, ptr @gcbits..FFFb, ptr @go..C539, ptr null, ptr null }, ptr @go_0llvm.Handler..d, ptr @type.._6_7go_0llvm_0Handler, i64 8 }, comdat
@gcbits..FFFb = weak constant [2 x i8] c"\FF\FF", comdat
@const.250 = private constant [25 x i8] c"[8]\09go.llvm\09llvm.Handler\00", align 1
@go..C539 = internal constant { ptr, i64 } { ptr @const.250, i64 24 }
@type.._6_7go_0llvm_0Handler = weak constant %SliceType.0 { %_type.0 { i64 24, i64 8, i32 -1808603968, i8 0, i8 8, i8 8, i8 23, ptr null, ptr @gcbits..ba, ptr @go..C540, ptr null, ptr null }, ptr @go_0llvm.Handler..d }, comdat
@const.251 = private constant [24 x i8] c"[]\09go.llvm\09llvm.Handler\00", align 1
@go..C540 = internal constant { ptr, i64 } { ptr @const.251, i64 23 }
@go..C541 = internal constant { ptr, i64 } { ptr @const.194, i64 8 }
@go..C542 = internal constant [4 x %structField.0] [%structField.0 { ptr @go..C536, ptr null, ptr @type.._68x_7uint8, ptr null, i64 0 }, %structField.0 { ptr @go..C537, ptr null, ptr @type.._68x_7string, ptr null, i64 16 }, %structField.0 { ptr @go..C538, ptr null, ptr @type.._68x_7go_0llvm_0Handler, ptr null, i64 272 }, %structField.0 { ptr @go..C541, ptr null, ptr @unsafe.Pointer..d, ptr null, i64 528 }]
@const.252 = private constant [19 x i8] c"firstConfigInBlock\00", align 1
@go..C543 = internal constant { ptr, i64 } { ptr @const.252, i64 18 }
@go..C544 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.253 = private constant [14 x i8] c"metaCollector\00", align 1
@go..C545 = internal constant { ptr, i64 } { ptr @const.253, i64 13 }
@go..C546 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go_0llvm.MetadataCollector..d = constant %InterfaceType.0 { %_type.0 { i64 16, i64 16, i32 -1617574818, i8 0, i8 8, i8 8, i8 20, ptr @runtime.interequal..f, ptr @gcbits..da, ptr @go..C547, ptr @go..C551, ptr @go_0llvm.MetadataCollector..p }, %IPST.44 { ptr @go..C557, i64 1, i64 1 } }
@const.254 = private constant [32 x i8] c"\09go.llvm\09llvm.MetadataCollector\00", align 1
@go..C547 = internal constant { ptr, i64 } { ptr @const.254, i64 31 }
@const.255 = private constant [18 x i8] c"MetadataCollector\00", align 1
@go..C548 = internal constant { ptr, i64 } { ptr @const.255, i64 17 }
@go..C549 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C550 = internal constant [1 x %method.0] zeroinitializer
@go..C551 = internal constant %uncommonType.0 { ptr @go..C548, ptr @go..C549, %IPST.41 { ptr @go..C550, i64 0, i64 0 } }
@go_0llvm.MetadataCollector..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -111393303, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C552, ptr null, ptr null }, ptr @go_0llvm.MetadataCollector..d }, comdat
@const.256 = private constant [33 x i8] c"*\09go.llvm\09llvm.MetadataCollector\00", align 1
@go..C552 = internal constant { ptr, i64 } { ptr @const.256, i64 32 }
@const.257 = private constant [8 x i8] c"Collect\00", align 1
@go..C553 = internal constant { ptr, i64 } { ptr @const.257, i64 7 }
@type..func_8context_0Context_3go_0llvm_0Request_9_8context_0Context_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1528556520, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C554, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C555, i64 2, i64 2 }, %IPST.42 { ptr @go..C556, i64 1, i64 1 } }, comdat
@const.258 = private constant [79 x i8] c"func(\09context\09context.Context, \09go.llvm\09llvm.Request) \09context\09context.Context\00", align 1
@go..C554 = internal constant { ptr, i64 } { ptr @const.258, i64 78 }
@go..C555 = internal constant [2 x ptr] [ptr @context.Context..d, ptr @go_0llvm.Request..d]
@go..C556 = internal constant [1 x ptr] [ptr @context.Context..d]
@go..C557 = internal constant [1 x %imethod.0] [%imethod.0 { ptr @go..C553, ptr null, ptr @type..func_8context_0Context_3go_0llvm_0Request_9_8context_0Context_9 }]
@go..C558 = internal constant [19 x %structField.0] [%structField.0 { ptr @go..C444, ptr null, ptr @string..d, ptr null, i64 0 }, %structField.0 { ptr @go..C445, ptr null, ptr @type.._6_7string, ptr null, i64 32 }, %structField.0 { ptr @go..C446, ptr null, ptr @string..d, ptr null, i64 80 }, %structField.0 { ptr @go..C447, ptr null, ptr @string..d, ptr null, i64 112 }, %structField.0 { ptr @go..C448, ptr null, ptr @bool..d, ptr null, i64 144 }, %structField.0 { ptr @go..C449, ptr null, ptr @bool..d, ptr null, i64 146 }, %structField.0 { ptr @go..C450, ptr null, ptr @string..d, ptr null, i64 160 }, %structField.0 { ptr @go..C451, ptr null, ptr @type..func_8_2net_1http_0Request_9_8bool_9, ptr null, i64 192 }, %structField.0 { ptr @go..C455, ptr null, ptr @type.._6_7go_0llvm_0FilterFunc, ptr null, i64 208 }, %structField.0 { ptr @go..C496, ptr null, ptr @string..d, ptr null, i64 256 }, %structField.0 { ptr @go..C497, ptr null, ptr @time.Duration..d, ptr null, i64 288 }, %structField.0 { ptr @go..C498, ptr null, ptr @time.Duration..d, ptr null, i64 304 }, %structField.0 { ptr @go..C499, ptr null, ptr @time.Duration..d, ptr null, i64 320 }, %structField.0 { ptr @go..C500, ptr null, ptr @type..map_6string_7string, ptr null, i64 336 }, %structField.0 { ptr @go..C508, ptr null, ptr @type.._6_7go_0llvm_0Plugin, ptr null, i64 352 }, %structField.0 { ptr @go..C530, ptr @go..C531, ptr @go_0llvm.Handler..d, ptr null, i64 400 }, %structField.0 { ptr @go..C532, ptr @go..C533, ptr @type..map_6string_7go_0llvm_0Handler, ptr null, i64 432 }, %structField.0 { ptr @go..C543, ptr @go..C544, ptr @go_0llvm.Config..p, ptr null, i64 448 }, %structField.0 { ptr @go..C545, ptr @go..C546, ptr @go_0llvm.MetadataCollector..d, ptr null, i64 464 }]
@go_0llvm.HandlerFunc..d = constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1244774564, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C559, ptr @go..C563, ptr @go_0llvm.HandlerFunc..p }, i8 0, %IPST.42 { ptr @go..C565, i64 3, i64 3 }, %IPST.42 { ptr @go..C566, i64 2, i64 2 } }
@const.259 = private constant [26 x i8] c"\09go.llvm\09llvm.HandlerFunc\00", align 1
@go..C559 = internal constant { ptr, i64 } { ptr @const.259, i64 25 }
@const.260 = private constant [12 x i8] c"HandlerFunc\00", align 1
@go..C560 = internal constant { ptr, i64 } { ptr @const.260, i64 11 }
@go..C561 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C562 = internal constant [1 x %method.0] zeroinitializer
@go..C563 = internal constant %uncommonType.0 { ptr @go..C560, ptr @go..C561, %IPST.41 { ptr @go..C562, i64 0, i64 0 } }
@go_0llvm.HandlerFunc..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1558443447, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C564, ptr null, ptr null }, ptr @go_0llvm.HandlerFunc..d }, comdat
@const.261 = private constant [27 x i8] c"*\09go.llvm\09llvm.HandlerFunc\00", align 1
@go..C564 = internal constant { ptr, i64 } { ptr @const.261, i64 26 }
@go..C565 = internal constant [3 x ptr] [ptr @context.Context..d, ptr @go_0llvm.ResponseWriter..d, ptr @go_0llvm.Msg..p]
@go..C566 = internal constant [2 x ptr] [ptr @int..d, ptr @error..d]
@go_0llvm.ScrubWriter..d = constant %StructType.0 { %_type.0 { i64 24, i64 24, i32 834123378, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.ScrubWriter..eq..f, ptr @gcbits..ha, ptr @go..C567, ptr @go..C597, ptr @go_0llvm.ScrubWriter..p }, %IPST.43 { ptr @go..C631, i64 2, i64 2 } }
@go_0llvm.ScrubWriter..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.ScrubWriter..eq to i64) }
@gcbits..ha = weak constant [1 x i8] c"\07", comdat
@const.262 = private constant [26 x i8] c"\09go.llvm\09llvm.ScrubWriter\00", align 1
@go..C567 = internal constant { ptr, i64 } { ptr @const.262, i64 25 }
@const.263 = private constant [12 x i8] c"ScrubWriter\00", align 1
@go..C568 = internal constant { ptr, i64 } { ptr @const.263, i64 11 }
@go..C569 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C570 = internal constant { ptr, i64 } { ptr @const.136, i64 5 }
@type..func_8go_0llvm_0ScrubWriter_9_8error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 2110882824, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C571, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C572, i64 1, i64 1 }, %IPST.42 { ptr @go..C573, i64 1, i64 1 } }, comdat
@const.264 = private constant [38 x i8] c"func(\09go.llvm\09llvm.ScrubWriter) error\00", align 1
@go..C571 = internal constant { ptr, i64 } { ptr @const.264, i64 37 }
@go..C572 = internal constant [1 x ptr] [ptr @go_0llvm.ScrubWriter..d]
@go..C573 = internal constant [1 x ptr] [ptr @error..d]
@go..C574 = internal constant { ptr, i64 } { ptr @const.138, i64 6 }
@type..func_8go_0llvm_0ScrubWriter_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 922144328, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C575, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C576, i64 1, i64 1 }, %IPST.42 { ptr @go..C577, i64 0, i64 0 } }, comdat
@const.265 = private constant [32 x i8] c"func(\09go.llvm\09llvm.ScrubWriter)\00", align 1
@go..C575 = internal constant { ptr, i64 } { ptr @const.265, i64 31 }
@go..C576 = internal constant [1 x ptr] [ptr @go_0llvm.ScrubWriter..d]
@go..C577 = internal constant [1 x ptr] zeroinitializer
@go..C578 = internal constant { ptr, i64 } { ptr @const.140, i64 9 }
@type..func_8go_0llvm_0ScrubWriter_9_8net_0Addr_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 955902984, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C579, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C580, i64 1, i64 1 }, %IPST.42 { ptr @go..C581, i64 1, i64 1 } }, comdat
@const.266 = private constant [46 x i8] c"func(\09go.llvm\09llvm.ScrubWriter) \09net\09net.Addr\00", align 1
@go..C579 = internal constant { ptr, i64 } { ptr @const.266, i64 45 }
@go..C580 = internal constant [1 x ptr] [ptr @go_0llvm.ScrubWriter..d]
@go..C581 = internal constant [1 x ptr] [ptr @net.Addr..d]
@go..C582 = internal constant { ptr, i64 } { ptr @const.142, i64 10 }
@go..C583 = internal constant { ptr, i64 } { ptr @const.143, i64 10 }
@go..C584 = internal constant { ptr, i64 } { ptr @const.144, i64 14 }
@type..func_8go_0llvm_0ScrubWriter_3bool_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 560280200, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C585, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C586, i64 2, i64 2 }, %IPST.42 { ptr @go..C587, i64 0, i64 0 } }, comdat
@const.267 = private constant [38 x i8] c"func(\09go.llvm\09llvm.ScrubWriter, bool)\00", align 1
@go..C585 = internal constant { ptr, i64 } { ptr @const.267, i64 37 }
@go..C586 = internal constant [2 x ptr] [ptr @go_0llvm.ScrubWriter..d, ptr @bool..d]
@go..C587 = internal constant [1 x ptr] zeroinitializer
@go..C588 = internal constant { ptr, i64 } { ptr @const.146, i64 5 }
@type..func_8go_0llvm_0ScrubWriter_3_6_7uint8_9_8int_3error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -964277240, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C589, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C590, i64 2, i64 2 }, %IPST.42 { ptr @go..C591, i64 2, i64 2 } }, comdat
@const.268 = private constant [54 x i8] c"func(\09go.llvm\09llvm.ScrubWriter, []uint8) (int, error)\00", align 1
@go..C589 = internal constant { ptr, i64 } { ptr @const.268, i64 53 }
@go..C590 = internal constant [2 x ptr] [ptr @go_0llvm.ScrubWriter..d, ptr @type.._6_7uint8]
@go..C591 = internal constant [2 x ptr] [ptr @int..d, ptr @error..d]
@go..C592 = internal constant { ptr, i64 } { ptr @const.150, i64 8 }
@type..func_8go_0llvm_0ScrubWriter_3_2go_0llvm_0Msg_9_8error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1748337224, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C593, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C594, i64 2, i64 2 }, %IPST.42 { ptr @go..C595, i64 1, i64 1 } }, comdat
@const.269 = private constant [58 x i8] c"func(\09go.llvm\09llvm.ScrubWriter, *\09go.llvm\09llvm.Msg) error\00", align 1
@go..C593 = internal constant { ptr, i64 } { ptr @const.269, i64 57 }
@go..C594 = internal constant [2 x ptr] [ptr @go_0llvm.ScrubWriter..d, ptr @go_0llvm.Msg..p]
@go..C595 = internal constant [1 x ptr] [ptr @error..d]
@go..C596 = internal constant [8 x %method.0] [%method.0 { ptr @go..C570, ptr null, ptr @type..func_8_9_8error_9, ptr @type..func_8go_0llvm_0ScrubWriter_9_8error_9, ptr @go_0llvm.ScrubWriter.Close..stub }, %method.0 { ptr @go..C574, ptr null, ptr @type..func_8_9_8_9, ptr @type..func_8go_0llvm_0ScrubWriter_9_8_9, ptr @go_0llvm.ScrubWriter.Hijack..stub }, %method.0 { ptr @go..C578, ptr null, ptr @type..func_8_9_8net_0Addr_9, ptr @type..func_8go_0llvm_0ScrubWriter_9_8net_0Addr_9, ptr @go_0llvm.ScrubWriter.LocalAddr..stub }, %method.0 { ptr @go..C582, ptr null, ptr @type..func_8_9_8net_0Addr_9, ptr @type..func_8go_0llvm_0ScrubWriter_9_8net_0Addr_9, ptr @go_0llvm.ScrubWriter.RemoteAddr..stub }, %method.0 { ptr @go..C583, ptr null, ptr @type..func_8_9_8error_9, ptr @type..func_8go_0llvm_0ScrubWriter_9_8error_9, ptr @go_0llvm.ScrubWriter.TsigStatus..stub }, %method.0 { ptr @go..C584, ptr null, ptr @type..func_8bool_9_8_9, ptr @type..func_8go_0llvm_0ScrubWriter_3bool_9_8_9, ptr @go_0llvm.ScrubWriter.TsigTimersOnly..stub }, %method.0 { ptr @go..C588, ptr null, ptr @type..func_8_6_7uint8_9_8int_3error_9, ptr @type..func_8go_0llvm_0ScrubWriter_3_6_7uint8_9_8int_3error_9, ptr @go_0llvm.ScrubWriter.Write..stub }, %method.0 { ptr @go..C592, ptr null, ptr @type..func_8_2go_0llvm_0Msg_9_8error_9, ptr @type..func_8go_0llvm_0ScrubWriter_3_2go_0llvm_0Msg_9_8error_9, ptr @go_0llvm.ScrubWriter.WriteMsg..stub }]
@go..C597 = internal constant %uncommonType.0 { ptr @go..C568, ptr @go..C569, %IPST.41 { ptr @go..C596, i64 8, i64 8 } }
@go_0llvm.ScrubWriter..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 461072169, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C598, ptr @go..C626, ptr @type.._2_2go_0llvm_0ScrubWriter }, ptr @go_0llvm.ScrubWriter..d }, comdat
@const.270 = private constant [27 x i8] c"*\09go.llvm\09llvm.ScrubWriter\00", align 1
@go..C598 = internal constant { ptr, i64 } { ptr @const.270, i64 26 }
@go..C599 = internal constant { ptr, i64 } { ptr @const.136, i64 5 }
@type..func_8_2go_0llvm_0ScrubWriter_9_8error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1236821272, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C600, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C601, i64 1, i64 1 }, %IPST.42 { ptr @go..C602, i64 1, i64 1 } }, comdat
@const.271 = private constant [39 x i8] c"func(*\09go.llvm\09llvm.ScrubWriter) error\00", align 1
@go..C600 = internal constant { ptr, i64 } { ptr @const.271, i64 38 }
@go..C601 = internal constant [1 x ptr] [ptr @go_0llvm.ScrubWriter..p]
@go..C602 = internal constant [1 x ptr] [ptr @error..d]
@go..C603 = internal constant { ptr, i64 } { ptr @const.138, i64 6 }
@type..func_8_2go_0llvm_0ScrubWriter_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1869407528, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C604, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C605, i64 1, i64 1 }, %IPST.42 { ptr @go..C606, i64 0, i64 0 } }, comdat
@const.272 = private constant [33 x i8] c"func(*\09go.llvm\09llvm.ScrubWriter)\00", align 1
@go..C604 = internal constant { ptr, i64 } { ptr @const.272, i64 32 }
@go..C605 = internal constant [1 x ptr] [ptr @go_0llvm.ScrubWriter..p]
@go..C606 = internal constant [1 x ptr] zeroinitializer
@go..C607 = internal constant { ptr, i64 } { ptr @const.140, i64 9 }
@type..func_8_2go_0llvm_0ScrubWriter_9_8net_0Addr_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1903166184, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C608, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C609, i64 1, i64 1 }, %IPST.42 { ptr @go..C610, i64 1, i64 1 } }, comdat
@const.273 = private constant [47 x i8] c"func(*\09go.llvm\09llvm.ScrubWriter) \09net\09net.Addr\00", align 1
@go..C608 = internal constant { ptr, i64 } { ptr @const.273, i64 46 }
@go..C609 = internal constant [1 x ptr] [ptr @go_0llvm.ScrubWriter..p]
@go..C610 = internal constant [1 x ptr] [ptr @net.Addr..d]
@go..C611 = internal constant { ptr, i64 } { ptr @const.142, i64 10 }
@go..C612 = internal constant { ptr, i64 } { ptr @const.143, i64 10 }
@go..C613 = internal constant { ptr, i64 } { ptr @const.144, i64 14 }
@type..func_8_2go_0llvm_0ScrubWriter_3bool_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1507543400, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C614, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C615, i64 2, i64 2 }, %IPST.42 { ptr @go..C616, i64 0, i64 0 } }, comdat
@const.274 = private constant [39 x i8] c"func(*\09go.llvm\09llvm.ScrubWriter, bool)\00", align 1
@go..C614 = internal constant { ptr, i64 } { ptr @const.274, i64 38 }
@go..C615 = internal constant [2 x ptr] [ptr @go_0llvm.ScrubWriter..p, ptr @bool..d]
@go..C616 = internal constant [1 x ptr] zeroinitializer
@go..C617 = internal constant { ptr, i64 } { ptr @const.146, i64 5 }
@type..func_8_2go_0llvm_0ScrubWriter_3_6_7uint8_9_8int_3error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -17014040, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C618, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C619, i64 2, i64 2 }, %IPST.42 { ptr @go..C620, i64 2, i64 2 } }, comdat
@const.275 = private constant [55 x i8] c"func(*\09go.llvm\09llvm.ScrubWriter, []uint8) (int, error)\00", align 1
@go..C618 = internal constant { ptr, i64 } { ptr @const.275, i64 54 }
@go..C619 = internal constant [2 x ptr] [ptr @go_0llvm.ScrubWriter..p, ptr @type.._6_7uint8]
@go..C620 = internal constant [2 x ptr] [ptr @int..d, ptr @error..d]
@go..C621 = internal constant { ptr, i64 } { ptr @const.150, i64 8 }
@type..func_8_2go_0llvm_0ScrubWriter_3_2go_0llvm_0Msg_9_8error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1599366872, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C622, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C623, i64 2, i64 2 }, %IPST.42 { ptr @go..C624, i64 1, i64 1 } }, comdat
@const.276 = private constant [59 x i8] c"func(*\09go.llvm\09llvm.ScrubWriter, *\09go.llvm\09llvm.Msg) error\00", align 1
@go..C622 = internal constant { ptr, i64 } { ptr @const.276, i64 58 }
@go..C623 = internal constant [2 x ptr] [ptr @go_0llvm.ScrubWriter..p, ptr @go_0llvm.Msg..p]
@go..C624 = internal constant [1 x ptr] [ptr @error..d]
@go..C625 = internal constant [8 x %method.0] [%method.0 { ptr @go..C599, ptr null, ptr @type..func_8_9_8error_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_9_8error_9, ptr @go_0llvm.ScrubWriter.Close..stub }, %method.0 { ptr @go..C603, ptr null, ptr @type..func_8_9_8_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_9_8_9, ptr @go_0llvm.ScrubWriter.Hijack..stub }, %method.0 { ptr @go..C607, ptr null, ptr @type..func_8_9_8net_0Addr_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_9_8net_0Addr_9, ptr @go_0llvm.ScrubWriter.LocalAddr..stub }, %method.0 { ptr @go..C611, ptr null, ptr @type..func_8_9_8net_0Addr_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_9_8net_0Addr_9, ptr @go_0llvm.ScrubWriter.RemoteAddr..stub }, %method.0 { ptr @go..C612, ptr null, ptr @type..func_8_9_8error_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_9_8error_9, ptr @go_0llvm.ScrubWriter.TsigStatus..stub }, %method.0 { ptr @go..C613, ptr null, ptr @type..func_8bool_9_8_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_3bool_9_8_9, ptr @go_0llvm.ScrubWriter.TsigTimersOnly..stub }, %method.0 { ptr @go..C617, ptr null, ptr @type..func_8_6_7uint8_9_8int_3error_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_3_6_7uint8_9_8int_3error_9, ptr @go_0llvm.ScrubWriter.Write..stub }, %method.0 { ptr @go..C621, ptr null, ptr @type..func_8_2go_0llvm_0Msg_9_8error_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_3_2go_0llvm_0Msg_9_8error_9, ptr @go_0llvm.ScrubWriter.WriteMsg..stub }]
@go..C626 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.41 { ptr @go..C625, i64 8, i64 8 } }
@type.._2_2go_0llvm_0ScrubWriter = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1212779879, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C627, ptr null, ptr null }, ptr @go_0llvm.ScrubWriter..p }, comdat
@const.277 = private constant [28 x i8] c"**\09go.llvm\09llvm.ScrubWriter\00", align 1
@go..C627 = internal constant { ptr, i64 } { ptr @const.277, i64 27 }
@go..C628 = internal constant { ptr, i64 } { ptr @const.134, i64 14 }
@const.278 = private constant [4 x i8] c"req\00", align 1
@go..C629 = internal constant { ptr, i64 } { ptr @const.278, i64 3 }
@go..C630 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C631 = internal constant [2 x %structField.0] [%structField.0 { ptr @go..C628, ptr null, ptr @go_0llvm.ResponseWriter..d, ptr null, i64 1 }, %structField.0 { ptr @go..C629, ptr @go..C630, ptr @go_0llvm.Msg..p, ptr null, i64 32 }]
@go_0llvm.supported..d = constant %StructType.0 { %_type.0 { i64 32, i64 8, i32 -1967664972, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..ba, ptr @go..C632, ptr @go..C636, ptr @go_0llvm.supported..p }, %IPST.43 { ptr @go..C687, i64 2, i64 2 } }
@const.279 = private constant [24 x i8] c"\09go.llvm\09llvm.supported\00", align 1
@go..C632 = internal constant { ptr, i64 } { ptr @const.279, i64 23 }
@const.280 = private constant [10 x i8] c"supported\00", align 1
@go..C633 = internal constant { ptr, i64 } { ptr @const.280, i64 9 }
@go..C634 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C635 = internal constant [1 x %method.0] zeroinitializer
@go..C636 = internal constant %uncommonType.0 { ptr @go..C633, ptr @go..C634, %IPST.41 { ptr @go..C635, i64 0, i64 0 } }
@go_0llvm.supported..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1417868471, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C637, ptr @go..C666, ptr @type.._2_2go_0llvm_0supported }, ptr @go_0llvm.supported..d }, comdat
@const.281 = private constant [25 x i8] c"*\09go.llvm\09llvm.supported\00", align 1
@go..C637 = internal constant { ptr, i64 } { ptr @const.281, i64 24 }
@const.282 = private constant [5 x i8] c"Lock\00", align 1
@go..C638 = internal constant { ptr, i64 } { ptr @const.282, i64 4 }
@type..func_8_2go_0llvm_0supported_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1872849192, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C639, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C640, i64 1, i64 1 }, %IPST.42 { ptr @go..C641, i64 0, i64 0 } }, comdat
@const.283 = private constant [31 x i8] c"func(*\09go.llvm\09llvm.supported)\00", align 1
@go..C639 = internal constant { ptr, i64 } { ptr @const.283, i64 30 }
@go..C640 = internal constant [1 x ptr] [ptr @go_0llvm.supported..p]
@go..C641 = internal constant [1 x ptr] zeroinitializer
@const.284 = private constant [6 x i8] c"RLock\00", align 1
@go..C642 = internal constant { ptr, i64 } { ptr @const.284, i64 5 }
@const.285 = private constant [8 x i8] c"RLocker\00", align 1
@go..C643 = internal constant { ptr, i64 } { ptr @const.285, i64 7 }
@type..func_8_9_8sync_0Locker_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -854692856, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C644, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C645, i64 0, i64 0 }, %IPST.42 { ptr @go..C646, i64 1, i64 1 } }, comdat
@const.286 = private constant [25 x i8] c"func() \09sync\09sync.Locker\00", align 1
@go..C644 = internal constant { ptr, i64 } { ptr @const.286, i64 24 }
@go..C645 = internal constant [1 x ptr] zeroinitializer
@sync.Locker..d = external constant %InterfaceType.0
@go..C646 = internal constant [1 x ptr] [ptr @sync.Locker..d]
@type..func_8_2go_0llvm_0supported_9_8sync_0Locker_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1018156328, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C647, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C648, i64 1, i64 1 }, %IPST.42 { ptr @go..C649, i64 1, i64 1 } }, comdat
@const.287 = private constant [49 x i8] c"func(*\09go.llvm\09llvm.supported) \09sync\09sync.Locker\00", align 1
@go..C647 = internal constant { ptr, i64 } { ptr @const.287, i64 48 }
@go..C648 = internal constant [1 x ptr] [ptr @go_0llvm.supported..p]
@go..C649 = internal constant [1 x ptr] [ptr @sync.Locker..d]
@const.288 = private constant [8 x i8] c"RUnlock\00", align 1
@go..C650 = internal constant { ptr, i64 } { ptr @const.288, i64 7 }
@const.289 = private constant [7 x i8] c"Unlock\00", align 1
@go..C651 = internal constant { ptr, i64 } { ptr @const.289, i64 6 }
@const.290 = private constant [12 x i8] c"rUnlockSlow\00", align 1
@go..C652 = internal constant { ptr, i64 } { ptr @const.290, i64 11 }
@const.291 = private constant [5 x i8] c"sync\00", align 1
@go..C653 = internal constant { ptr, i64 } { ptr @const.291, i64 4 }
@type..func_8int32_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1622961576, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C654, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C660, i64 1, i64 1 }, %IPST.42 { ptr @go..C661, i64 0, i64 0 } }, comdat
@const.292 = private constant [12 x i8] c"func(int32)\00", align 1
@go..C654 = internal constant { ptr, i64 } { ptr @const.292, i64 11 }
@int32..d = weak constant %_type.0 { i64 4, i64 0, i32 -1157242003, i8 8, i8 4, i8 4, i8 -123, ptr @runtime.memequal32..f, ptr null, ptr @go..C655, ptr @go..C658, ptr @int32..p }, comdat
@const.293 = private constant [6 x i8] c"int32\00", align 1
@go..C655 = internal constant { ptr, i64 } { ptr @const.293, i64 5 }
@go..C656 = internal constant { ptr, i64 } { ptr @const.293, i64 5 }
@go..C657 = internal constant [1 x %method.0] zeroinitializer
@go..C658 = internal constant %uncommonType.0 { ptr @go..C656, ptr null, %IPST.41 { ptr @go..C657, i64 0, i64 0 } }
@int32..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1336002855, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C659, ptr null, ptr null }, ptr @int32..d }, comdat
@const.294 = private constant [7 x i8] c"*int32\00", align 1
@go..C659 = internal constant { ptr, i64 } { ptr @const.294, i64 6 }
@go..C660 = internal constant [1 x ptr] [ptr @int32..d]
@go..C661 = internal constant [1 x ptr] zeroinitializer
@type..func_8_2go_0llvm_0supported_3int32_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 823805032, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C662, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C663, i64 2, i64 2 }, %IPST.42 { ptr @go..C664, i64 0, i64 0 } }, comdat
@const.295 = private constant [38 x i8] c"func(*\09go.llvm\09llvm.supported, int32)\00", align 1
@go..C662 = internal constant { ptr, i64 } { ptr @const.295, i64 37 }
@go..C663 = internal constant [2 x ptr] [ptr @go_0llvm.supported..p, ptr @int32..d]
@go..C664 = internal constant [1 x ptr] zeroinitializer
@go..C665 = internal constant [6 x %method.0] [%method.0 { ptr @go..C638, ptr null, ptr @type..func_8_9_8_9, ptr @type..func_8_2go_0llvm_0supported_9_8_9, ptr @go_0llvm.supported.Lock..stub }, %method.0 { ptr @go..C642, ptr null, ptr @type..func_8_9_8_9, ptr @type..func_8_2go_0llvm_0supported_9_8_9, ptr @go_0llvm.supported.RLock..stub }, %method.0 { ptr @go..C643, ptr null, ptr @type..func_8_9_8sync_0Locker_9, ptr @type..func_8_2go_0llvm_0supported_9_8sync_0Locker_9, ptr @go_0llvm.supported.RLocker..stub }, %method.0 { ptr @go..C650, ptr null, ptr @type..func_8_9_8_9, ptr @type..func_8_2go_0llvm_0supported_9_8_9, ptr @go_0llvm.supported.RUnlock..stub }, %method.0 { ptr @go..C651, ptr null, ptr @type..func_8_9_8_9, ptr @type..func_8_2go_0llvm_0supported_9_8_9, ptr @go_0llvm.supported.Unlock..stub }, %method.0 { ptr @go..C652, ptr @go..C653, ptr @type..func_8int32_9_8_9, ptr @type..func_8_2go_0llvm_0supported_3int32_9_8_9, ptr @go_0llvm.supported.sync_0rUnlockSlow..stub }]
@go..C666 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.41 { ptr @go..C665, i64 6, i64 6 } }
@type.._2_2go_0llvm_0supported = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1211059047, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C667, ptr null, ptr null }, ptr @go_0llvm.supported..p }, comdat
@const.296 = private constant [26 x i8] c"**\09go.llvm\09llvm.supported\00", align 1
@go..C667 = internal constant { ptr, i64 } { ptr @const.296, i64 25 }
@const.297 = private constant [2 x i8] c"m\00", align 1
@go..C668 = internal constant { ptr, i64 } { ptr @const.297, i64 1 }
@go..C669 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..map_6uint16_7struct_4_5 = weak constant %MapType.0 { %_type.0 { i64 8, i64 8, i32 76732316, i8 0, i8 8, i8 8, i8 53, ptr null, ptr @gcbits..ba, ptr @go..C670, ptr null, ptr null }, ptr @uint16..d, ptr @type..struct_4_5, ptr @type..struct_4_4x_5topbits_b_68x_7uint8_ckeys_b_68x_7uint16_cvalues_b_68x_7struct_4_5_coverflow_buintptr_5, ptr @runtime.memhash16..f, i8 2, i8 0, i16 32, i32 4 }, comdat
@const.298 = private constant [21 x i8] c"map[uint16]struct {}\00", align 1
@go..C670 = internal constant { ptr, i64 } { ptr @const.298, i64 20 }
@type..struct_4_5 = weak constant %StructType.0 { %_type.0 { i64 0, i64 0, i32 12, i8 8, i8 1, i8 1, i8 -103, ptr @runtime.memequal0..f, ptr null, ptr @go..C671, ptr null, ptr null }, %IPST.43 { ptr @go..C672, i64 0, i64 0 } }, comdat
@runtime.memequal0..f = external constant %functionDescriptor.0
@const.299 = private constant [10 x i8] c"struct {}\00", align 1
@go..C671 = internal constant { ptr, i64 } { ptr @const.299, i64 9 }
@go..C672 = internal constant [1 x %structField.0] zeroinitializer
@type..struct_4_4x_5topbits_b_68x_7uint8_ckeys_b_68x_7uint16_cvalues_b_68x_7struct_4_5_coverflow_buintptr_5 = weak constant %StructType.0 { %_type.0 { i64 32, i64 0, i32 1108425716, i8 8, i8 8, i8 8, i8 -103, ptr null, ptr null, ptr @go..C673, ptr null, ptr null }, %IPST.43 { ptr @go..C685, i64 4, i64 4 } }, comdat
@const.300 = private constant [83 x i8] c"struct { topbits [8]uint8; keys [8]uint16; values [8]struct {}; overflow uintptr }\00", align 1
@go..C673 = internal constant { ptr, i64 } { ptr @const.300, i64 82 }
@go..C674 = internal constant { ptr, i64 } { ptr @const.186, i64 7 }
@go..C675 = internal constant { ptr, i64 } { ptr @const.188, i64 4 }
@go..C676 = internal constant { ptr, i64 } { ptr @const.191, i64 6 }
@type.._68x_7struct_4_5 = weak constant %ArrayType.0 { %_type.0 { i64 0, i64 0, i32 39, i8 8, i8 1, i8 1, i8 -111, ptr null, ptr null, ptr @go..C677, ptr null, ptr null }, ptr @type..struct_4_5, ptr @type.._6_7struct_4_5, i64 8 }, comdat
@const.301 = private constant [13 x i8] c"[8]struct {}\00", align 1
@go..C677 = internal constant { ptr, i64 } { ptr @const.301, i64 12 }
@type.._6_7struct_4_5 = weak constant %SliceType.0 { %_type.0 { i64 24, i64 8, i32 26, i8 0, i8 8, i8 8, i8 23, ptr null, ptr @gcbits..ba, ptr @go..C678, ptr null, ptr null }, ptr @type..struct_4_5 }, comdat
@const.302 = private constant [12 x i8] c"[]struct {}\00", align 1
@go..C678 = internal constant { ptr, i64 } { ptr @const.302, i64 11 }
@go..C679 = internal constant { ptr, i64 } { ptr @const.194, i64 8 }
@uintptr..d = weak constant %_type.0 { i64 8, i64 0, i32 -1488193301, i8 8, i8 8, i8 8, i8 -116, ptr @runtime.memequal64..f, ptr null, ptr @go..C680, ptr @go..C683, ptr @uintptr..p }, comdat
@const.303 = private constant [8 x i8] c"uintptr\00", align 1
@go..C680 = internal constant { ptr, i64 } { ptr @const.303, i64 7 }
@go..C681 = internal constant { ptr, i64 } { ptr @const.303, i64 7 }
@go..C682 = internal constant [1 x %method.0] zeroinitializer
@go..C683 = internal constant %uncommonType.0 { ptr @go..C681, ptr null, %IPST.41 { ptr @go..C682, i64 0, i64 0 } }
@uintptr..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1958710969, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C684, ptr null, ptr null }, ptr @uintptr..d }, comdat
@const.304 = private constant [9 x i8] c"*uintptr\00", align 1
@go..C684 = internal constant { ptr, i64 } { ptr @const.304, i64 8 }
@go..C685 = internal constant [4 x %structField.0] [%structField.0 { ptr @go..C674, ptr null, ptr @type.._68x_7uint8, ptr null, i64 0 }, %structField.0 { ptr @go..C675, ptr null, ptr @type.._68x_7uint16, ptr null, i64 16 }, %structField.0 { ptr @go..C676, ptr null, ptr @type.._68x_7struct_4_5, ptr null, i64 48 }, %structField.0 { ptr @go..C679, ptr null, ptr @uintptr..d, ptr null, i64 48 }]
@runtime.memhash16..f = external constant %functionDescriptor.0
@const.305 = private constant [8 x i8] c"RWMutex\00", align 1
@go..C686 = internal constant { ptr, i64 } { ptr @const.305, i64 7 }
@sync.RWMutex..d = external constant %StructType.0
@go..C687 = internal constant [2 x %structField.0] [%structField.0 { ptr @go..C668, ptr @go..C669, ptr @type..map_6uint16_7struct_4_5, ptr null, i64 0 }, %structField.0 { ptr @go..C686, ptr null, ptr @sync.RWMutex..d, ptr null, i64 17 }]
@go_0llvm.sup = internal global ptr null
@runtime.writeBarrier = external local_unnamed_addr externally_initialized global { i8, [3 x i8], i8, i8, i64 }
@go_0llvm.Transfer..d = constant %StructType.0 { %_type.0 { i64 48, i64 48, i32 297583693, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..zb, ptr @go..C688, ptr @go..C692, ptr @go_0llvm.Transfer..p }, %IPST.43 { ptr @go..C711, i64 3, i64 3 } }
@gcbits..zb = weak constant [1 x i8] c"9", comdat
@const.307 = private constant [23 x i8] c"\09go.llvm\09llvm.Transfer\00", align 1
@go..C688 = internal constant { ptr, i64 } { ptr @const.307, i64 22 }
@const.308 = private constant [9 x i8] c"Transfer\00", align 1
@go..C689 = internal constant { ptr, i64 } { ptr @const.308, i64 8 }
@go..C690 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C691 = internal constant [1 x %method.0] zeroinitializer
@go..C692 = internal constant %uncommonType.0 { ptr @go..C689, ptr @go..C690, %IPST.41 { ptr @go..C691, i64 0, i64 0 } }
@go_0llvm.Transfer..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 466371801, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C693, ptr null, ptr null }, ptr @go_0llvm.Transfer..d }, comdat
@const.309 = private constant [24 x i8] c"*\09go.llvm\09llvm.Transfer\00", align 1
@go..C693 = internal constant { ptr, i64 } { ptr @const.309, i64 23 }
@const.310 = private constant [12 x i8] c"Transferers\00", align 1
@go..C694 = internal constant { ptr, i64 } { ptr @const.310, i64 11 }
@type.._6_7go_0llvm_0Transferer = weak constant %SliceType.0 { %_type.0 { i64 24, i64 8, i32 597710164, i8 0, i8 8, i8 8, i8 23, ptr null, ptr @gcbits..ba, ptr @go..C695, ptr null, ptr null }, ptr @go_0llvm.Transferer..d }, comdat
@const.311 = private constant [27 x i8] c"[]\09go.llvm\09llvm.Transferer\00", align 1
@go..C695 = internal constant { ptr, i64 } { ptr @const.311, i64 26 }
@go_0llvm.Transferer..d = constant %InterfaceType.0 { %_type.0 { i64 16, i64 16, i32 597710150, i8 0, i8 8, i8 8, i8 20, ptr @runtime.interequal..f, ptr @gcbits..da, ptr @go..C696, ptr @go..C700, ptr @go_0llvm.Transferer..p }, %IPST.44 { ptr @go..C707, i64 1, i64 1 } }
@const.312 = private constant [25 x i8] c"\09go.llvm\09llvm.Transferer\00", align 1
@go..C696 = internal constant { ptr, i64 } { ptr @const.312, i64 24 }
@const.313 = private constant [11 x i8] c"Transferer\00", align 1
@go..C697 = internal constant { ptr, i64 } { ptr @const.313, i64 10 }
@go..C698 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C699 = internal constant [1 x %method.0] zeroinitializer
@go..C700 = internal constant %uncommonType.0 { ptr @go..C697, ptr @go..C698, %IPST.41 { ptr @go..C699, i64 0, i64 0 } }
@go_0llvm.Transferer..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 973427817, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C701, ptr null, ptr null }, ptr @go_0llvm.Transferer..d }, comdat
@const.314 = private constant [26 x i8] c"*\09go.llvm\09llvm.Transferer\00", align 1
@go..C701 = internal constant { ptr, i64 } { ptr @const.314, i64 25 }
@go..C702 = internal constant { ptr, i64 } { ptr @const.308, i64 8 }
@type..func_8string_3uint32_9_8_x3c_x2dchan_b_6_7go_0llvm_0RR_3error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 152087304, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C703, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C704, i64 2, i64 2 }, %IPST.42 { ptr @go..C706, i64 2, i64 2 } }, comdat
@const.315 = private constant [56 x i8] c"func(string, uint32) (<-chan []\09go.llvm\09llvm.RR, error)\00", align 1
@go..C703 = internal constant { ptr, i64 } { ptr @const.315, i64 55 }
@go..C704 = internal constant [2 x ptr] [ptr @string..d, ptr @uint32..d]
@type.._x3c_x2dchan_b_6_7go_0llvm_0RR = weak constant %ChanType.0 { %_type.0 { i64 8, i64 8, i32 -1461136865, i8 8, i8 8, i8 8, i8 50, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C705, ptr null, ptr null }, ptr @type.._6_7go_0llvm_0RR, i64 1 }, comdat
@const.316 = private constant [26 x i8] c"<-chan []\09go.llvm\09llvm.RR\00", align 1
@go..C705 = internal constant { ptr, i64 } { ptr @const.316, i64 25 }
@go..C706 = internal constant [2 x ptr] [ptr @type.._x3c_x2dchan_b_6_7go_0llvm_0RR, ptr @error..d]
@go..C707 = internal constant [1 x %imethod.0] [%imethod.0 { ptr @go..C702, ptr null, ptr @type..func_8string_3uint32_9_8_x3c_x2dchan_b_6_7go_0llvm_0RR_3error_9 }]
@const.317 = private constant [11 x i8] c"tsigSecret\00", align 1
@go..C708 = internal constant { ptr, i64 } { ptr @const.317, i64 10 }
@go..C709 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.318 = private constant [5 x i8] c"Next\00", align 1
@go..C710 = internal constant { ptr, i64 } { ptr @const.318, i64 4 }
@go..C711 = internal constant [3 x %structField.0] [%structField.0 { ptr @go..C694, ptr null, ptr @type.._6_7go_0llvm_0Transferer, ptr null, i64 0 }, %structField.0 { ptr @go..C708, ptr @go..C709, ptr @type..map_6string_7string, ptr null, i64 48 }, %structField.0 { ptr @go..C710, ptr null, ptr @go_0llvm.Handler..d, ptr null, i64 64 }]
@go_0llvm.Zones..d = constant %SliceType.0 { %_type.0 { i64 24, i64 8, i32 496200441, i8 0, i8 8, i8 8, i8 23, ptr null, ptr @gcbits..ba, ptr @go..C712, ptr @go..C716, ptr @go_0llvm.Zones..p }, ptr @string..d }
@const.319 = private constant [20 x i8] c"\09go.llvm\09llvm.Zones\00", align 1
@go..C712 = internal constant { ptr, i64 } { ptr @const.319, i64 19 }
@const.320 = private constant [6 x i8] c"Zones\00", align 1
@go..C713 = internal constant { ptr, i64 } { ptr @const.320, i64 5 }
@go..C714 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C715 = internal constant [1 x %method.0] zeroinitializer
@go..C716 = internal constant %uncommonType.0 { ptr @go..C713, ptr @go..C714, %IPST.41 { ptr @go..C715, i64 0, i64 0 } }
@go_0llvm.Zones..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -650727527, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C717, ptr null, ptr null }, ptr @go_0llvm.Zones..d }, comdat
@const.321 = private constant [21 x i8] c"*\09go.llvm\09llvm.Zones\00", align 1
@go..C717 = internal constant { ptr, i64 } { ptr @const.321, i64 20 }
@go_0llvm.Zone..d = constant %StructType.0 { %_type.0 { i64 216, i64 216, i32 -1880618080, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..jhjacda, ptr @go..C718, ptr @go..C722, ptr @go_0llvm.Zone..p }, %IPST.43 { ptr @go..C824, i64 12, i64 12 } }
@gcbits..jhjacda = weak constant [4 x i8] c"\E9$ \06", comdat
@const.322 = private constant [19 x i8] c"\09go.llvm\09llvm.Zone\00", align 1
@go..C718 = internal constant { ptr, i64 } { ptr @const.322, i64 18 }
@go..C719 = internal constant { ptr, i64 } { ptr @const.202, i64 4 }
@go..C720 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C721 = internal constant [1 x %method.0] zeroinitializer
@go..C722 = internal constant %uncommonType.0 { ptr @go..C719, ptr @go..C720, %IPST.41 { ptr @go..C721, i64 0, i64 0 } }
@go_0llvm.Zone..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -25118199, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C723, ptr @go..C741, ptr @type.._2_2go_0llvm_0Zone }, ptr @go_0llvm.Zone..d }, comdat
@const.323 = private constant [20 x i8] c"*\09go.llvm\09llvm.Zone\00", align 1
@go..C723 = internal constant { ptr, i64 } { ptr @const.323, i64 19 }
@go..C724 = internal constant { ptr, i64 } { ptr @const.282, i64 4 }
@type..func_8_2go_0llvm_0Zone_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -803782360, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C725, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C726, i64 1, i64 1 }, %IPST.42 { ptr @go..C727, i64 0, i64 0 } }, comdat
@const.324 = private constant [26 x i8] c"func(*\09go.llvm\09llvm.Zone)\00", align 1
@go..C725 = internal constant { ptr, i64 } { ptr @const.324, i64 25 }
@go..C726 = internal constant [1 x ptr] [ptr @go_0llvm.Zone..p]
@go..C727 = internal constant [1 x ptr] zeroinitializer
@go..C728 = internal constant { ptr, i64 } { ptr @const.284, i64 5 }
@go..C729 = internal constant { ptr, i64 } { ptr @const.285, i64 7 }
@type..func_8_2go_0llvm_0Zone_9_8sync_0Locker_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1658475224, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C730, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C731, i64 1, i64 1 }, %IPST.42 { ptr @go..C732, i64 1, i64 1 } }, comdat
@const.325 = private constant [44 x i8] c"func(*\09go.llvm\09llvm.Zone) \09sync\09sync.Locker\00", align 1
@go..C730 = internal constant { ptr, i64 } { ptr @const.325, i64 43 }
@go..C731 = internal constant [1 x ptr] [ptr @go_0llvm.Zone..p]
@go..C732 = internal constant [1 x ptr] [ptr @sync.Locker..d]
@go..C733 = internal constant { ptr, i64 } { ptr @const.288, i64 7 }
@go..C734 = internal constant { ptr, i64 } { ptr @const.289, i64 6 }
@go..C735 = internal constant { ptr, i64 } { ptr @const.290, i64 11 }
@go..C736 = internal constant { ptr, i64 } { ptr @const.291, i64 4 }
@type..func_8_2go_0llvm_0Zone_3int32_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1852826520, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C737, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C738, i64 2, i64 2 }, %IPST.42 { ptr @go..C739, i64 0, i64 0 } }, comdat
@const.326 = private constant [33 x i8] c"func(*\09go.llvm\09llvm.Zone, int32)\00", align 1
@go..C737 = internal constant { ptr, i64 } { ptr @const.326, i64 32 }
@go..C738 = internal constant [2 x ptr] [ptr @go_0llvm.Zone..p, ptr @int32..d]
@go..C739 = internal constant [1 x ptr] zeroinitializer
@go..C740 = internal constant [6 x %method.0] [%method.0 { ptr @go..C724, ptr null, ptr @type..func_8_9_8_9, ptr @type..func_8_2go_0llvm_0Zone_9_8_9, ptr @go_0llvm.Zone.Lock..stub }, %method.0 { ptr @go..C728, ptr null, ptr @type..func_8_9_8_9, ptr @type..func_8_2go_0llvm_0Zone_9_8_9, ptr @go_0llvm.Zone.RLock..stub }, %method.0 { ptr @go..C729, ptr null, ptr @type..func_8_9_8sync_0Locker_9, ptr @type..func_8_2go_0llvm_0Zone_9_8sync_0Locker_9, ptr @go_0llvm.Zone.RLocker..stub }, %method.0 { ptr @go..C733, ptr null, ptr @type..func_8_9_8_9, ptr @type..func_8_2go_0llvm_0Zone_9_8_9, ptr @go_0llvm.Zone.RUnlock..stub }, %method.0 { ptr @go..C734, ptr null, ptr @type..func_8_9_8_9, ptr @type..func_8_2go_0llvm_0Zone_9_8_9, ptr @go_0llvm.Zone.Unlock..stub }, %method.0 { ptr @go..C735, ptr @go..C736, ptr @type..func_8int32_9_8_9, ptr @type..func_8_2go_0llvm_0Zone_3int32_9_8_9, ptr @go_0llvm.Zone.sync_0rUnlockSlow..stub }]
@go..C741 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.41 { ptr @go..C740, i64 6, i64 6 } }
@type.._2_2go_0llvm_0Zone = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -401891175, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C742, ptr null, ptr null }, ptr @go_0llvm.Zone..p }, comdat
@const.327 = private constant [21 x i8] c"**\09go.llvm\09llvm.Zone\00", align 1
@go..C742 = internal constant { ptr, i64 } { ptr @const.327, i64 20 }
@const.328 = private constant [7 x i8] c"origin\00", align 1
@go..C743 = internal constant { ptr, i64 } { ptr @const.328, i64 6 }
@go..C744 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.329 = private constant [8 x i8] c"origLen\00", align 1
@go..C745 = internal constant { ptr, i64 } { ptr @const.329, i64 7 }
@go..C746 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.330 = private constant [5 x i8] c"file\00", align 1
@go..C747 = internal constant { ptr, i64 } { ptr @const.330, i64 4 }
@go..C748 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@const.331 = private constant [5 x i8] c"Tree\00", align 1
@go..C749 = internal constant { ptr, i64 } { ptr @const.331, i64 4 }
@go_0llvm.Tree..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -318703895, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C750, ptr null, ptr null }, ptr @go_0llvm.Tree..d }, comdat
@const.332 = private constant [20 x i8] c"*\09go.llvm\09llvm.Tree\00", align 1
@go..C750 = internal constant { ptr, i64 } { ptr @const.332, i64 19 }
@go_0llvm.Tree..d = constant %StructType.0 { %_type.0 { i64 16, i64 8, i32 1859129198, i8 8, i8 8, i8 8, i8 25, ptr @runtime.memequal128..f, ptr @gcbits..ba, ptr @go..C751, ptr @go..C755, ptr @go_0llvm.Tree..p }, %IPST.43 { ptr @go..C795, i64 2, i64 2 } }
@runtime.memequal128..f = external constant %functionDescriptor.0
@const.333 = private constant [19 x i8] c"\09go.llvm\09llvm.Tree\00", align 1
@go..C751 = internal constant { ptr, i64 } { ptr @const.333, i64 18 }
@go..C752 = internal constant { ptr, i64 } { ptr @const.331, i64 4 }
@go..C753 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C754 = internal constant [1 x %method.0] zeroinitializer
@go..C755 = internal constant %uncommonType.0 { ptr @go..C752, ptr @go..C753, %IPST.41 { ptr @go..C754, i64 0, i64 0 } }
@go..C756 = internal constant { ptr, i64 } { ptr @const.204, i64 4 }
@go_0llvm.Node..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -391165399, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C757, ptr null, ptr null }, ptr @go_0llvm.Node..d }, comdat
@const.334 = private constant [20 x i8] c"*\09go.llvm\09llvm.Node\00", align 1
@go..C757 = internal constant { ptr, i64 } { ptr @const.334, i64 19 }
@go_0llvm.Node..d = constant %StructType.0 { %_type.0 { i64 32, i64 24, i32 512423074, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.Node..eq..f, ptr @gcbits..ha, ptr @go..C758, ptr @go..C762, ptr @go_0llvm.Node..p }, %IPST.43 { ptr @go..C793, i64 4, i64 4 } }
@go_0llvm.Node..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.Node..eq to i64) }
@const.335 = private constant [19 x i8] c"\09go.llvm\09llvm.Node\00", align 1
@go..C758 = internal constant { ptr, i64 } { ptr @const.335, i64 18 }
@const.336 = private constant [5 x i8] c"Node\00", align 1
@go..C759 = internal constant { ptr, i64 } { ptr @const.336, i64 4 }
@go..C760 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C761 = internal constant [1 x %method.0] zeroinitializer
@go..C762 = internal constant %uncommonType.0 { ptr @go..C759, ptr @go..C760, %IPST.41 { ptr @go..C761, i64 0, i64 0 } }
@const.337 = private constant [5 x i8] c"Elem\00", align 1
@go..C763 = internal constant { ptr, i64 } { ptr @const.337, i64 4 }
@go_0llvm.Elem..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 485998425, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C764, ptr null, ptr null }, ptr @go_0llvm.Elem..d }, comdat
@const.338 = private constant [20 x i8] c"*\09go.llvm\09llvm.Elem\00", align 1
@go..C764 = internal constant { ptr, i64 } { ptr @const.338, i64 19 }
@go_0llvm.Elem..d = constant %StructType.0 { %_type.0 { i64 24, i64 16, i32 -1848673291, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..da, ptr @go..C765, ptr @go..C769, ptr @go_0llvm.Elem..p }, %IPST.43 { ptr @go..C783, i64 2, i64 2 } }
@const.339 = private constant [19 x i8] c"\09go.llvm\09llvm.Elem\00", align 1
@go..C765 = internal constant { ptr, i64 } { ptr @const.339, i64 18 }
@go..C766 = internal constant { ptr, i64 } { ptr @const.337, i64 4 }
@go..C767 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C768 = internal constant [1 x %method.0] zeroinitializer
@go..C769 = internal constant %uncommonType.0 { ptr @go..C766, ptr @go..C767, %IPST.41 { ptr @go..C768, i64 0, i64 0 } }
@go..C770 = internal constant { ptr, i64 } { ptr @const.297, i64 1 }
@go..C771 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..map_6uint16_7_6_7go_0llvm_0RR = weak constant %MapType.0 { %_type.0 { i64 8, i64 8, i32 -1982194144, i8 0, i8 8, i8 8, i8 53, ptr null, ptr @gcbits..ba, ptr @go..C772, ptr null, ptr null }, ptr @uint16..d, ptr @type.._6_7go_0llvm_0RR, ptr @type..struct_4_4x_5topbits_b_68x_7uint8_ckeys_b_68x_7uint16_cvalues_b_68x_7_6_7go_0llvm_0RR_coverflow_b_2_4void_5_5, ptr @runtime.memhash16..f, i8 2, i8 24, i16 224, i32 4 }, comdat
@const.340 = private constant [30 x i8] c"map[uint16][]\09go.llvm\09llvm.RR\00", align 1
@go..C772 = internal constant { ptr, i64 } { ptr @const.340, i64 29 }
@type..struct_4_4x_5topbits_b_68x_7uint8_ckeys_b_68x_7uint16_cvalues_b_68x_7_6_7go_0llvm_0RR_coverflow_b_2_4void_5_5 = weak constant %StructType.0 { %_type.0 { i64 224, i64 224, i32 -1332066844, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..isejsea, ptr @go..C773, ptr null, ptr null }, %IPST.43 { ptr @go..C780, i64 4, i64 4 } }, comdat
@gcbits..isejsea = weak constant [4 x i8] c"H\92$\09", comdat
@const.341 = private constant [86 x i8] c"struct { topbits [8]uint8; keys [8]uint16; values [8][]\09go.llvm\09llvm.RR; overflow * }\00", align 1
@go..C773 = internal constant { ptr, i64 } { ptr @const.341, i64 85 }
@go..C774 = internal constant { ptr, i64 } { ptr @const.186, i64 7 }
@go..C775 = internal constant { ptr, i64 } { ptr @const.188, i64 4 }
@go..C776 = internal constant { ptr, i64 } { ptr @const.191, i64 6 }
@type.._68x_7_6_7go_0llvm_0RR = weak constant %ArrayType.0 { %_type.0 { i64 192, i64 176, i32 177114415, i8 0, i8 8, i8 8, i8 17, ptr null, ptr @gcbits..jsejc, ptr @go..C777, ptr null, ptr null }, ptr @type.._6_7go_0llvm_0RR, ptr @type.._6_7_6_7go_0llvm_0RR, i64 8 }, comdat
@gcbits..jsejc = weak constant [3 x i8] c"I\92$", comdat
@const.342 = private constant [22 x i8] c"[8][]\09go.llvm\09llvm.RR\00", align 1
@go..C777 = internal constant { ptr, i64 } { ptr @const.342, i64 21 }
@type.._6_7_6_7go_0llvm_0RR = weak constant %SliceType.0 { %_type.0 { i64 24, i64 8, i32 -2058926434, i8 0, i8 8, i8 8, i8 23, ptr null, ptr @gcbits..ba, ptr @go..C778, ptr null, ptr null }, ptr @type.._6_7go_0llvm_0RR }, comdat
@const.343 = private constant [21 x i8] c"[][]\09go.llvm\09llvm.RR\00", align 1
@go..C778 = internal constant { ptr, i64 } { ptr @const.343, i64 20 }
@go..C779 = internal constant { ptr, i64 } { ptr @const.194, i64 8 }
@go..C780 = internal constant [4 x %structField.0] [%structField.0 { ptr @go..C774, ptr null, ptr @type.._68x_7uint8, ptr null, i64 0 }, %structField.0 { ptr @go..C775, ptr null, ptr @type.._68x_7uint16, ptr null, i64 16 }, %structField.0 { ptr @go..C776, ptr null, ptr @type.._68x_7_6_7go_0llvm_0RR, ptr null, i64 48 }, %structField.0 { ptr @go..C779, ptr null, ptr @unsafe.Pointer..d, ptr null, i64 432 }]
@go..C781 = internal constant { ptr, i64 } { ptr @const.225, i64 4 }
@go..C782 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C783 = internal constant [2 x %structField.0] [%structField.0 { ptr @go..C770, ptr @go..C771, ptr @type..map_6uint16_7_6_7go_0llvm_0RR, ptr null, i64 0 }, %structField.0 { ptr @go..C781, ptr @go..C782, ptr @string..d, ptr null, i64 16 }]
@const.344 = private constant [5 x i8] c"Left\00", align 1
@go..C784 = internal constant { ptr, i64 } { ptr @const.344, i64 4 }
@const.345 = private constant [6 x i8] c"Right\00", align 1
@go..C785 = internal constant { ptr, i64 } { ptr @const.345, i64 5 }
@const.346 = private constant [6 x i8] c"Color\00", align 1
@go..C786 = internal constant { ptr, i64 } { ptr @const.346, i64 5 }
@go_0llvm.Color..d = constant %_type.0 { i64 1, i64 0, i32 1235516833, i8 8, i8 1, i8 1, i8 -127, ptr @runtime.memequal8..f, ptr null, ptr @go..C787, ptr @go..C791, ptr @go_0llvm.Color..p }
@const.347 = private constant [20 x i8] c"\09go.llvm\09llvm.Color\00", align 1
@go..C787 = internal constant { ptr, i64 } { ptr @const.347, i64 19 }
@go..C788 = internal constant { ptr, i64 } { ptr @const.346, i64 5 }
@go..C789 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C790 = internal constant [1 x %method.0] zeroinitializer
@go..C791 = internal constant %uncommonType.0 { ptr @go..C788, ptr @go..C789, %IPST.41 { ptr @go..C790, i64 0, i64 0 } }
@go_0llvm.Color..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1706567143, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C792, ptr null, ptr null }, ptr @go_0llvm.Color..d }, comdat
@const.348 = private constant [21 x i8] c"*\09go.llvm\09llvm.Color\00", align 1
@go..C792 = internal constant { ptr, i64 } { ptr @const.348, i64 20 }
@go..C793 = internal constant [4 x %structField.0] [%structField.0 { ptr @go..C763, ptr null, ptr @go_0llvm.Elem..p, ptr null, i64 0 }, %structField.0 { ptr @go..C784, ptr null, ptr @go_0llvm.Node..p, ptr null, i64 16 }, %structField.0 { ptr @go..C785, ptr null, ptr @go_0llvm.Node..p, ptr null, i64 32 }, %structField.0 { ptr @go..C786, ptr null, ptr @go_0llvm.Color..d, ptr null, i64 48 }]
@const.349 = private constant [6 x i8] c"Count\00", align 1
@go..C794 = internal constant { ptr, i64 } { ptr @const.349, i64 5 }
@go..C795 = internal constant [2 x %structField.0] [%structField.0 { ptr @go..C756, ptr null, ptr @go_0llvm.Node..p, ptr null, i64 0 }, %structField.0 { ptr @go..C794, ptr null, ptr @int..d, ptr null, i64 16 }]
@const.350 = private constant [5 x i8] c"Apex\00", align 1
@go..C796 = internal constant { ptr, i64 } { ptr @const.350, i64 4 }
@go_0llvm.Apex..d = constant %StructType.0 { %_type.0 { i64 80, i64 64, i32 2100767578, i8 0, i8 8, i8 8, i8 25, ptr null, ptr @gcbits..te, ptr @go..C797, ptr @go..C801, ptr @go_0llvm.Apex..p }, %IPST.43 { ptr @go..C807, i64 4, i64 4 } }
@gcbits..te = weak constant [1 x i8] c"\93", comdat
@const.351 = private constant [19 x i8] c"\09go.llvm\09llvm.Apex\00", align 1
@go..C797 = internal constant { ptr, i64 } { ptr @const.351, i64 18 }
@go..C798 = internal constant { ptr, i64 } { ptr @const.350, i64 4 }
@go..C799 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C800 = internal constant [1 x %method.0] zeroinitializer
@go..C801 = internal constant %uncommonType.0 { ptr @go..C798, ptr @go..C799, %IPST.41 { ptr @go..C800, i64 0, i64 0 } }
@go_0llvm.Apex..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -747457111, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C802, ptr null, ptr null }, ptr @go_0llvm.Apex..d }, comdat
@const.352 = private constant [20 x i8] c"*\09go.llvm\09llvm.Apex\00", align 1
@go..C802 = internal constant { ptr, i64 } { ptr @const.352, i64 19 }
@go..C803 = internal constant { ptr, i64 } { ptr @const.68, i64 3 }
@go..C804 = internal constant { ptr, i64 } { ptr @const.112, i64 2 }
@const.353 = private constant [7 x i8] c"SIGSOA\00", align 1
@go..C805 = internal constant { ptr, i64 } { ptr @const.353, i64 6 }
@const.354 = private constant [6 x i8] c"SIGNS\00", align 1
@go..C806 = internal constant { ptr, i64 } { ptr @const.354, i64 5 }
@go..C807 = internal constant [4 x %structField.0] [%structField.0 { ptr @go..C803, ptr null, ptr @go_0llvm.SOA..p, ptr null, i64 0 }, %structField.0 { ptr @go..C804, ptr null, ptr @type.._6_7go_0llvm_0RR, ptr null, i64 16 }, %structField.0 { ptr @go..C805, ptr null, ptr @type.._6_7go_0llvm_0RR, ptr null, i64 64 }, %structField.0 { ptr @go..C806, ptr null, ptr @type.._6_7go_0llvm_0RR, ptr null, i64 112 }]
@const.355 = private constant [8 x i8] c"Expired\00", align 1
@go..C808 = internal constant { ptr, i64 } { ptr @const.355, i64 7 }
@go..C809 = internal constant { ptr, i64 } { ptr @const.305, i64 7 }
@const.356 = private constant [12 x i8] c"StartupOnce\00", align 1
@go..C810 = internal constant { ptr, i64 } { ptr @const.356, i64 11 }
@sync.Once..d = external constant %StructType.0
@const.357 = private constant [13 x i8] c"TransferFrom\00", align 1
@go..C811 = internal constant { ptr, i64 } { ptr @const.357, i64 12 }
@const.358 = private constant [15 x i8] c"ReloadInterval\00", align 1
@go..C812 = internal constant { ptr, i64 } { ptr @const.358, i64 14 }
@const.359 = private constant [15 x i8] c"reloadShutdown\00", align 1
@go..C813 = internal constant { ptr, i64 } { ptr @const.359, i64 14 }
@go..C814 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@type..chan_bbool = weak constant %ChanType.0 { %_type.0 { i64 8, i64 8, i32 1966551623, i8 8, i8 8, i8 8, i8 50, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C815, ptr null, ptr null }, ptr @bool..d, i64 3 }, comdat
@const.360 = private constant [10 x i8] c"chan bool\00", align 1
@go..C815 = internal constant { ptr, i64 } { ptr @const.360, i64 9 }
@const.361 = private constant [9 x i8] c"Upstream\00", align 1
@go..C816 = internal constant { ptr, i64 } { ptr @const.361, i64 8 }
@go_0llvm.Upstream..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1322975673, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C817, ptr null, ptr null }, ptr @go_0llvm.Upstream..d }, comdat
@const.362 = private constant [24 x i8] c"*\09go.llvm\09llvm.Upstream\00", align 1
@go..C817 = internal constant { ptr, i64 } { ptr @const.362, i64 23 }
@go_0llvm.Upstream..d = constant %StructType.0 { %_type.0 { i64 0, i64 0, i32 -1796362213, i8 8, i8 1, i8 1, i8 -103, ptr @runtime.memequal0..f, ptr null, ptr @go..C818, ptr @go..C822, ptr @go_0llvm.Upstream..p }, %IPST.43 { ptr @go..C823, i64 0, i64 0 } }
@const.363 = private constant [23 x i8] c"\09go.llvm\09llvm.Upstream\00", align 1
@go..C818 = internal constant { ptr, i64 } { ptr @const.363, i64 22 }
@go..C819 = internal constant { ptr, i64 } { ptr @const.361, i64 8 }
@go..C820 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C821 = internal constant [1 x %method.0] zeroinitializer
@go..C822 = internal constant %uncommonType.0 { ptr @go..C819, ptr @go..C820, %IPST.41 { ptr @go..C821, i64 0, i64 0 } }
@go..C823 = internal constant [1 x %structField.0] zeroinitializer
@go..C824 = internal constant [12 x %structField.0] [%structField.0 { ptr @go..C743, ptr @go..C744, ptr @string..d, ptr null, i64 0 }, %structField.0 { ptr @go..C745, ptr @go..C746, ptr @int..d, ptr null, i64 32 }, %structField.0 { ptr @go..C747, ptr @go..C748, ptr @string..d, ptr null, i64 48 }, %structField.0 { ptr @go..C749, ptr null, ptr @go_0llvm.Tree..p, ptr null, i64 81 }, %structField.0 { ptr @go..C796, ptr null, ptr @go_0llvm.Apex..d, ptr null, i64 97 }, %structField.0 { ptr @go..C808, ptr null, ptr @bool..d, ptr null, i64 256 }, %structField.0 { ptr @go..C809, ptr null, ptr @sync.RWMutex..d, ptr null, i64 265 }, %structField.0 { ptr @go..C810, ptr null, ptr @sync.Once..d, ptr null, i64 312 }, %structField.0 { ptr @go..C811, ptr null, ptr @type.._6_7string, ptr null, i64 336 }, %structField.0 { ptr @go..C812, ptr null, ptr @time.Duration..d, ptr null, i64 384 }, %structField.0 { ptr @go..C813, ptr @go..C814, ptr @type..chan_bbool, ptr null, i64 400 }, %structField.0 { ptr @go..C816, ptr null, ptr @go_0llvm.Upstream..p, ptr null, i64 416 }]
@go_0llvm.Result..d = constant %_type.0 { i64 8, i64 0, i32 -2104593785, i8 8, i8 8, i8 8, i8 -126, ptr @runtime.memequal64..f, ptr null, ptr @go..C825, ptr @go..C829, ptr @go_0llvm.Result..p }
@const.364 = private constant [21 x i8] c"\09go.llvm\09llvm.Result\00", align 1
@go..C825 = internal constant { ptr, i64 } { ptr @const.364, i64 20 }
@const.365 = private constant [7 x i8] c"Result\00", align 1
@go..C826 = internal constant { ptr, i64 } { ptr @const.365, i64 6 }
@go..C827 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C828 = internal constant [1 x %method.0] zeroinitializer
@go..C829 = internal constant %uncommonType.0 { ptr @go..C826, ptr @go..C827, %IPST.41 { ptr @go..C828, i64 0, i64 0 } }
@go_0llvm.Result..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 686237817, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C830, ptr null, ptr null }, ptr @go_0llvm.Result..d }, comdat
@const.366 = private constant [22 x i8] c"*\09go.llvm\09llvm.Result\00", align 1
@go..C830 = internal constant { ptr, i64 } { ptr @const.366, i64 21 }
@go_0llvm.Key..d = constant %StructType.0 { %_type.0 { i64 0, i64 0, i32 -974766839, i8 8, i8 1, i8 1, i8 -103, ptr @runtime.memequal0..f, ptr null, ptr @go..C831, ptr @go..C835, ptr @go_0llvm.Key..p }, %IPST.43 { ptr @go..C837, i64 0, i64 0 } }
@const.367 = private constant [18 x i8] c"\09go.llvm\09llvm.Key\00", align 1
@go..C831 = internal constant { ptr, i64 } { ptr @const.367, i64 17 }
@const.368 = private constant [4 x i8] c"Key\00", align 1
@go..C832 = internal constant { ptr, i64 } { ptr @const.368, i64 3 }
@go..C833 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C834 = internal constant [1 x %method.0] zeroinitializer
@go..C835 = internal constant %uncommonType.0 { ptr @go..C832, ptr @go..C833, %IPST.41 { ptr @go..C834, i64 0, i64 0 } }
@go_0llvm.Key..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1583599769, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C836, ptr null, ptr null }, ptr @go_0llvm.Key..d }, comdat
@const.369 = private constant [19 x i8] c"*\09go.llvm\09llvm.Key\00", align 1
@go..C836 = internal constant { ptr, i64 } { ptr @const.369, i64 18 }
@go..C837 = internal constant [1 x %structField.0] zeroinitializer
@go_0llvm.LoopKey..d = constant %StructType.0 { %_type.0 { i64 0, i64 0, i32 -1961596669, i8 8, i8 1, i8 1, i8 -103, ptr @runtime.memequal0..f, ptr null, ptr @go..C838, ptr @go..C842, ptr @go_0llvm.LoopKey..p }, %IPST.43 { ptr @go..C844, i64 0, i64 0 } }
@const.370 = private constant [22 x i8] c"\09go.llvm\09llvm.LoopKey\00", align 1
@go..C838 = internal constant { ptr, i64 } { ptr @const.370, i64 21 }
@const.371 = private constant [8 x i8] c"LoopKey\00", align 1
@go..C839 = internal constant { ptr, i64 } { ptr @const.371, i64 7 }
@go..C840 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C841 = internal constant [1 x %method.0] zeroinitializer
@go..C842 = internal constant %uncommonType.0 { ptr @go..C839, ptr @go..C840, %IPST.41 { ptr @go..C841, i64 0, i64 0 } }
@go_0llvm.LoopKey..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1320775623, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C843, ptr null, ptr null }, ptr @go_0llvm.LoopKey..d }, comdat
@const.372 = private constant [23 x i8] c"*\09go.llvm\09llvm.LoopKey\00", align 1
@go..C843 = internal constant { ptr, i64 } { ptr @const.372, i64 22 }
@go..C844 = internal constant [1 x %structField.0] zeroinitializer
@go_0llvm.ViewKey..d = constant %StructType.0 { %_type.0 { i64 0, i64 0, i32 1546472894, i8 8, i8 1, i8 1, i8 -103, ptr @runtime.memequal0..f, ptr null, ptr @go..C845, ptr @go..C849, ptr @go_0llvm.ViewKey..p }, %IPST.43 { ptr @go..C851, i64 0, i64 0 } }
@const.373 = private constant [22 x i8] c"\09go.llvm\09llvm.ViewKey\00", align 1
@go..C845 = internal constant { ptr, i64 } { ptr @const.373, i64 21 }
@const.374 = private constant [8 x i8] c"ViewKey\00", align 1
@go..C846 = internal constant { ptr, i64 } { ptr @const.374, i64 7 }
@go..C847 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C848 = internal constant [1 x %method.0] zeroinitializer
@go..C849 = internal constant %uncommonType.0 { ptr @go..C846, ptr @go..C847, %IPST.41 { ptr @go..C848, i64 0, i64 0 } }
@go_0llvm.ViewKey..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1026237463, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C850, ptr null, ptr null }, ptr @go_0llvm.ViewKey..d }, comdat
@const.375 = private constant [23 x i8] c"*\09go.llvm\09llvm.ViewKey\00", align 1
@go..C850 = internal constant { ptr, i64 } { ptr @const.375, i64 22 }
@go..C851 = internal constant [1 x %structField.0] zeroinitializer
@go_0llvm.NonWriter..d = constant %StructType.0 { %_type.0 { i64 24, i64 24, i32 -728878526, i8 0, i8 8, i8 8, i8 25, ptr @go_0llvm.NonWriter..eq..f, ptr @gcbits..ha, ptr @go..C852, ptr @go..C882, ptr @go_0llvm.NonWriter..p }, %IPST.43 { ptr @go..C915, i64 2, i64 2 } }
@go_0llvm.NonWriter..eq..f = constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.NonWriter..eq to i64) }
@const.376 = private constant [24 x i8] c"\09go.llvm\09llvm.NonWriter\00", align 1
@go..C852 = internal constant { ptr, i64 } { ptr @const.376, i64 23 }
@const.377 = private constant [10 x i8] c"NonWriter\00", align 1
@go..C853 = internal constant { ptr, i64 } { ptr @const.377, i64 9 }
@go..C854 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C855 = internal constant { ptr, i64 } { ptr @const.136, i64 5 }
@type..func_8go_0llvm_0NonWriter_9_8error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -660537848, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C856, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C857, i64 1, i64 1 }, %IPST.42 { ptr @go..C858, i64 1, i64 1 } }, comdat
@const.378 = private constant [36 x i8] c"func(\09go.llvm\09llvm.NonWriter) error\00", align 1
@go..C856 = internal constant { ptr, i64 } { ptr @const.378, i64 35 }
@go..C857 = internal constant [1 x ptr] [ptr @go_0llvm.NonWriter..d]
@go..C858 = internal constant [1 x ptr] [ptr @error..d]
@go..C859 = internal constant { ptr, i64 } { ptr @const.138, i64 6 }
@type..func_8go_0llvm_0NonWriter_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1849276344, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C860, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C861, i64 1, i64 1 }, %IPST.42 { ptr @go..C862, i64 0, i64 0 } }, comdat
@const.379 = private constant [30 x i8] c"func(\09go.llvm\09llvm.NonWriter)\00", align 1
@go..C860 = internal constant { ptr, i64 } { ptr @const.379, i64 29 }
@go..C861 = internal constant [1 x ptr] [ptr @go_0llvm.NonWriter..d]
@go..C862 = internal constant [1 x ptr] zeroinitializer
@go..C863 = internal constant { ptr, i64 } { ptr @const.140, i64 9 }
@type..func_8go_0llvm_0NonWriter_9_8net_0Addr_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1815517688, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C864, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C865, i64 1, i64 1 }, %IPST.42 { ptr @go..C866, i64 1, i64 1 } }, comdat
@const.380 = private constant [44 x i8] c"func(\09go.llvm\09llvm.NonWriter) \09net\09net.Addr\00", align 1
@go..C864 = internal constant { ptr, i64 } { ptr @const.380, i64 43 }
@go..C865 = internal constant [1 x ptr] [ptr @go_0llvm.NonWriter..d]
@go..C866 = internal constant [1 x ptr] [ptr @net.Addr..d]
@go..C867 = internal constant { ptr, i64 } { ptr @const.142, i64 10 }
@go..C868 = internal constant { ptr, i64 } { ptr @const.143, i64 10 }
@go..C869 = internal constant { ptr, i64 } { ptr @const.144, i64 14 }
@type..func_8go_0llvm_0NonWriter_3bool_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 2083826824, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C870, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C871, i64 2, i64 2 }, %IPST.42 { ptr @go..C872, i64 0, i64 0 } }, comdat
@const.381 = private constant [36 x i8] c"func(\09go.llvm\09llvm.NonWriter, bool)\00", align 1
@go..C870 = internal constant { ptr, i64 } { ptr @const.381, i64 35 }
@go..C871 = internal constant [2 x ptr] [ptr @go_0llvm.NonWriter..d, ptr @bool..d]
@go..C872 = internal constant [1 x ptr] zeroinitializer
@go..C873 = internal constant { ptr, i64 } { ptr @const.146, i64 5 }
@type..func_8go_0llvm_0NonWriter_3_6_7uint8_9_8int_3error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 559269384, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C874, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C875, i64 2, i64 2 }, %IPST.42 { ptr @go..C876, i64 2, i64 2 } }, comdat
@const.382 = private constant [52 x i8] c"func(\09go.llvm\09llvm.NonWriter, []uint8) (int, error)\00", align 1
@go..C874 = internal constant { ptr, i64 } { ptr @const.382, i64 51 }
@go..C875 = internal constant [2 x ptr] [ptr @go_0llvm.NonWriter..d, ptr @type.._6_7uint8]
@go..C876 = internal constant [2 x ptr] [ptr @int..d, ptr @error..d]
@go..C877 = internal constant { ptr, i64 } { ptr @const.150, i64 8 }
@type..func_8go_0llvm_0NonWriter_3_2go_0llvm_0Msg_9_8error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1023083448, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C878, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C879, i64 2, i64 2 }, %IPST.42 { ptr @go..C880, i64 1, i64 1 } }, comdat
@const.383 = private constant [56 x i8] c"func(\09go.llvm\09llvm.NonWriter, *\09go.llvm\09llvm.Msg) error\00", align 1
@go..C878 = internal constant { ptr, i64 } { ptr @const.383, i64 55 }
@go..C879 = internal constant [2 x ptr] [ptr @go_0llvm.NonWriter..d, ptr @go_0llvm.Msg..p]
@go..C880 = internal constant [1 x ptr] [ptr @error..d]
@go..C881 = internal constant [8 x %method.0] [%method.0 { ptr @go..C855, ptr null, ptr @type..func_8_9_8error_9, ptr @type..func_8go_0llvm_0NonWriter_9_8error_9, ptr @go_0llvm.NonWriter.Close..stub }, %method.0 { ptr @go..C859, ptr null, ptr @type..func_8_9_8_9, ptr @type..func_8go_0llvm_0NonWriter_9_8_9, ptr @go_0llvm.NonWriter.Hijack..stub }, %method.0 { ptr @go..C863, ptr null, ptr @type..func_8_9_8net_0Addr_9, ptr @type..func_8go_0llvm_0NonWriter_9_8net_0Addr_9, ptr @go_0llvm.NonWriter.LocalAddr..stub }, %method.0 { ptr @go..C867, ptr null, ptr @type..func_8_9_8net_0Addr_9, ptr @type..func_8go_0llvm_0NonWriter_9_8net_0Addr_9, ptr @go_0llvm.NonWriter.RemoteAddr..stub }, %method.0 { ptr @go..C868, ptr null, ptr @type..func_8_9_8error_9, ptr @type..func_8go_0llvm_0NonWriter_9_8error_9, ptr @go_0llvm.NonWriter.TsigStatus..stub }, %method.0 { ptr @go..C869, ptr null, ptr @type..func_8bool_9_8_9, ptr @type..func_8go_0llvm_0NonWriter_3bool_9_8_9, ptr @go_0llvm.NonWriter.TsigTimersOnly..stub }, %method.0 { ptr @go..C873, ptr null, ptr @type..func_8_6_7uint8_9_8int_3error_9, ptr @type..func_8go_0llvm_0NonWriter_3_6_7uint8_9_8int_3error_9, ptr @go_0llvm.NonWriter.Write..stub }, %method.0 { ptr @go..C877, ptr null, ptr @type..func_8_2go_0llvm_0Msg_9_8error_9, ptr @type..func_8go_0llvm_0NonWriter_3_2go_0llvm_0Msg_9_8error_9, ptr @go_0llvm.NonWriter.WriteMsg..stub }]
@go..C882 = internal constant %uncommonType.0 { ptr @go..C853, ptr @go..C854, %IPST.41 { ptr @go..C881, i64 8, i64 8 } }
@go_0llvm.NonWriter..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 1222845481, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C883, ptr @go..C911, ptr @type.._2_2go_0llvm_0NonWriter }, ptr @go_0llvm.NonWriter..d }, comdat
@const.384 = private constant [25 x i8] c"*\09go.llvm\09llvm.NonWriter\00", align 1
@go..C883 = internal constant { ptr, i64 } { ptr @const.384, i64 24 }
@go..C884 = internal constant { ptr, i64 } { ptr @const.136, i64 5 }
@type..func_8_2go_0llvm_0NonWriter_9_8error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1665088232, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C885, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C886, i64 1, i64 1 }, %IPST.42 { ptr @go..C887, i64 1, i64 1 } }, comdat
@const.385 = private constant [37 x i8] c"func(*\09go.llvm\09llvm.NonWriter) error\00", align 1
@go..C885 = internal constant { ptr, i64 } { ptr @const.385, i64 36 }
@go..C886 = internal constant [1 x ptr] [ptr @go_0llvm.NonWriter..p]
@go..C887 = internal constant [1 x ptr] [ptr @error..d]
@go..C888 = internal constant { ptr, i64 } { ptr @const.138, i64 6 }
@type..func_8_2go_0llvm_0NonWriter_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 476349736, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C889, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C890, i64 1, i64 1 }, %IPST.42 { ptr @go..C891, i64 0, i64 0 } }, comdat
@const.386 = private constant [31 x i8] c"func(*\09go.llvm\09llvm.NonWriter)\00", align 1
@go..C889 = internal constant { ptr, i64 } { ptr @const.386, i64 30 }
@go..C890 = internal constant [1 x ptr] [ptr @go_0llvm.NonWriter..p]
@go..C891 = internal constant [1 x ptr] zeroinitializer
@go..C892 = internal constant { ptr, i64 } { ptr @const.140, i64 9 }
@type..func_8_2go_0llvm_0NonWriter_9_8net_0Addr_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 510108392, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C893, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C894, i64 1, i64 1 }, %IPST.42 { ptr @go..C895, i64 1, i64 1 } }, comdat
@const.387 = private constant [45 x i8] c"func(*\09go.llvm\09llvm.NonWriter) \09net\09net.Addr\00", align 1
@go..C893 = internal constant { ptr, i64 } { ptr @const.387, i64 44 }
@go..C894 = internal constant [1 x ptr] [ptr @go_0llvm.NonWriter..p]
@go..C895 = internal constant [1 x ptr] [ptr @net.Addr..d]
@go..C896 = internal constant { ptr, i64 } { ptr @const.142, i64 10 }
@go..C897 = internal constant { ptr, i64 } { ptr @const.143, i64 10 }
@go..C898 = internal constant { ptr, i64 } { ptr @const.144, i64 14 }
@type..func_8_2go_0llvm_0NonWriter_3bool_9_8_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 114485608, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C899, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C900, i64 2, i64 2 }, %IPST.42 { ptr @go..C901, i64 0, i64 0 } }, comdat
@const.388 = private constant [37 x i8] c"func(*\09go.llvm\09llvm.NonWriter, bool)\00", align 1
@go..C899 = internal constant { ptr, i64 } { ptr @const.388, i64 36 }
@go..C900 = internal constant [2 x ptr] [ptr @go_0llvm.NonWriter..p, ptr @bool..d]
@go..C901 = internal constant [1 x ptr] zeroinitializer
@go..C902 = internal constant { ptr, i64 } { ptr @const.146, i64 5 }
@type..func_8_2go_0llvm_0NonWriter_3_6_7uint8_9_8int_3error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -1410071832, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C903, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C904, i64 2, i64 2 }, %IPST.42 { ptr @go..C905, i64 2, i64 2 } }, comdat
@const.389 = private constant [53 x i8] c"func(*\09go.llvm\09llvm.NonWriter, []uint8) (int, error)\00", align 1
@go..C903 = internal constant { ptr, i64 } { ptr @const.389, i64 52 }
@go..C904 = internal constant [2 x ptr] [ptr @go_0llvm.NonWriter..p, ptr @type.._6_7uint8]
@go..C905 = internal constant [2 x ptr] [ptr @int..d, ptr @error..d]
@go..C906 = internal constant { ptr, i64 } { ptr @const.150, i64 8 }
@type..func_8_2go_0llvm_0NonWriter_3_2go_0llvm_0Msg_9_8error_9 = weak constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 1302542632, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C907, ptr null, ptr null }, i8 0, %IPST.42 { ptr @go..C908, i64 2, i64 2 }, %IPST.42 { ptr @go..C909, i64 1, i64 1 } }, comdat
@const.390 = private constant [57 x i8] c"func(*\09go.llvm\09llvm.NonWriter, *\09go.llvm\09llvm.Msg) error\00", align 1
@go..C907 = internal constant { ptr, i64 } { ptr @const.390, i64 56 }
@go..C908 = internal constant [2 x ptr] [ptr @go_0llvm.NonWriter..p, ptr @go_0llvm.Msg..p]
@go..C909 = internal constant [1 x ptr] [ptr @error..d]
@go..C910 = internal constant [8 x %method.0] [%method.0 { ptr @go..C884, ptr null, ptr @type..func_8_9_8error_9, ptr @type..func_8_2go_0llvm_0NonWriter_9_8error_9, ptr @go_0llvm.NonWriter.Close..stub }, %method.0 { ptr @go..C888, ptr null, ptr @type..func_8_9_8_9, ptr @type..func_8_2go_0llvm_0NonWriter_9_8_9, ptr @go_0llvm.NonWriter.Hijack..stub }, %method.0 { ptr @go..C892, ptr null, ptr @type..func_8_9_8net_0Addr_9, ptr @type..func_8_2go_0llvm_0NonWriter_9_8net_0Addr_9, ptr @go_0llvm.NonWriter.LocalAddr..stub }, %method.0 { ptr @go..C896, ptr null, ptr @type..func_8_9_8net_0Addr_9, ptr @type..func_8_2go_0llvm_0NonWriter_9_8net_0Addr_9, ptr @go_0llvm.NonWriter.RemoteAddr..stub }, %method.0 { ptr @go..C897, ptr null, ptr @type..func_8_9_8error_9, ptr @type..func_8_2go_0llvm_0NonWriter_9_8error_9, ptr @go_0llvm.NonWriter.TsigStatus..stub }, %method.0 { ptr @go..C898, ptr null, ptr @type..func_8bool_9_8_9, ptr @type..func_8_2go_0llvm_0NonWriter_3bool_9_8_9, ptr @go_0llvm.NonWriter.TsigTimersOnly..stub }, %method.0 { ptr @go..C902, ptr null, ptr @type..func_8_6_7uint8_9_8int_3error_9, ptr @type..func_8_2go_0llvm_0NonWriter_3_6_7uint8_9_8int_3error_9, ptr @go_0llvm.NonWriter.Write..stub }, %method.0 { ptr @go..C906, ptr null, ptr @type..func_8_2go_0llvm_0Msg_9_8error_9, ptr @type..func_8_2go_0llvm_0NonWriter_3_2go_0llvm_0Msg_9_8error_9, ptr @go_0llvm.NonWriter.WriteMsg..stub }]
@go..C911 = internal constant %uncommonType.0 { ptr null, ptr null, %IPST.41 { ptr @go..C910, i64 8, i64 8 } }
@type.._2_2go_0llvm_0NonWriter = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 -1909308775, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C912, ptr null, ptr null }, ptr @go_0llvm.NonWriter..p }, comdat
@const.391 = private constant [26 x i8] c"**\09go.llvm\09llvm.NonWriter\00", align 1
@go..C912 = internal constant { ptr, i64 } { ptr @const.391, i64 25 }
@go..C913 = internal constant { ptr, i64 } { ptr @const.134, i64 14 }
@go..C914 = internal constant { ptr, i64 } { ptr @const.154, i64 3 }
@go..C915 = internal constant [2 x %structField.0] [%structField.0 { ptr @go..C913, ptr null, ptr @go_0llvm.ResponseWriter..d, ptr null, i64 1 }, %structField.0 { ptr @go..C914, ptr null, ptr @go_0llvm.Msg..p, ptr null, i64 32 }]
@go_0llvm.Func..d = constant %FuncType.0 { %_type.0 { i64 8, i64 8, i32 -793423952, i8 0, i8 8, i8 8, i8 51, ptr null, ptr @gcbits..ba, ptr @go..C916, ptr @go..C920, ptr @go_0llvm.Func..p }, i8 0, %IPST.42 { ptr @go..C922, i64 0, i64 0 }, %IPST.42 { ptr @go..C923, i64 1, i64 1 } }
@const.392 = private constant [19 x i8] c"\09go.llvm\09llvm.Func\00", align 1
@go..C916 = internal constant { ptr, i64 } { ptr @const.392, i64 18 }
@const.393 = private constant [5 x i8] c"Func\00", align 1
@go..C917 = internal constant { ptr, i64 } { ptr @const.393, i64 4 }
@go..C918 = internal constant { ptr, i64 } { ptr @const.2, i64 7 }
@go..C919 = internal constant [1 x %method.0] zeroinitializer
@go..C920 = internal constant %uncommonType.0 { ptr @go..C917, ptr @go..C918, %IPST.41 { ptr @go..C919, i64 0, i64 0 } }
@go_0llvm.Func..p = weak constant %PtrType.0 { %_type.0 { i64 8, i64 8, i32 190118665, i8 8, i8 8, i8 8, i8 54, ptr @runtime.memequal64..f, ptr @gcbits..ba, ptr @go..C921, ptr null, ptr null }, ptr @go_0llvm.Func..d }, comdat
@const.394 = private constant [20 x i8] c"*\09go.llvm\09llvm.Func\00", align 1
@go..C921 = internal constant { ptr, i64 } { ptr @const.394, i64 19 }
@go..C922 = internal constant [1 x ptr] zeroinitializer
@go..C923 = internal constant [1 x ptr] [ptr @string..d]
@go_0llvm.NewScrubWriter..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.NewScrubWriter to i64) }
@go_0llvm.ClientWrite..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.ClientWrite to i64) }
@go_0llvm.NextLabel..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.NextLabel to i64) }
@go_0llvm.PrevLabel..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.PrevLabel to i64) }
@go_0llvm.SupportedOption..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.SupportedOption to i64) }
@go_0llvm.Copy..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.Copy to i64) }
@go_0llvm.IsSubDomain..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.IsSubDomain to i64) }
@const.399 = private constant [2 x i8] c".\00", align 1
@const.400 = private unnamed_addr constant { ptr, i64 } { ptr @const.399, i64 1 }
@go_0llvm.CompareDomainName..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.CompareDomainName to i64) }
@go_0llvm.Split..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.Split to i64) }
@go_0llvm.CountLabel..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.CountLabel to i64) }
@go_0llvm.SplitDomainName..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.SplitDomainName to i64) }
@go_0llvm.IsFqdn..func1..f = internal constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.IsFqdn..func1 to i64) }
@go_0llvm.IsFqdn..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.IsFqdn to i64) }
@go_0llvm.Fqdn..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.Fqdn to i64) }
@go_0llvm.Join..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm.Join to i64) }
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
@go_0llvm._63_7int32..eq..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm._63_7int32..eq to i64) }
@go_0llvm._6128_7uint64..eq..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm._6128_7uint64..eq to i64) }
@go_0llvm._665_7int8..eq..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm._665_7int8..eq to i64) }
@go_0llvm._613_7int32..eq..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm._613_7int32..eq to i64) }
@go_0llvm._6256_7uint8..eq..f = local_unnamed_addr constant %functionDescriptor.0 { i64 ptrtoint (ptr @go_0llvm._6256_7uint8..eq to i64) }
@sync.rlocker..p = external constant %PtrType.0
@pimt..interface_4Lock_bfunc_8_9_8_9_cUnlock_bfunc_8_9_8_9_5..sync.rlocker = internal constant { ptr, ptr, ptr } { ptr @sync.rlocker..p, ptr @sync.rlocker.Lock, ptr @sync.rlocker.Unlock }
@go.llvm..types = local_unnamed_addr constant { i64, [160 x ptr] } { i64 160, [160 x ptr] [ptr @bool..p, ptr @type..func_8_9_8bool_9, ptr @type..func_8_2go_0llvm_0OPT_9_8bool_9, ptr @string..p, ptr @uint16..p, ptr @uint32..p, ptr @go_0llvm.RR__Header..p, ptr @type..func_8_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0OPT_9_8_2go_0llvm_0RR__Header_9, ptr @type.._6_7bool, ptr @type..func_8_0_0_0_6_7bool_9_8_9, ptr @type..func_8_2go_0llvm_0OPT_3_0_0_0_6_7bool_9_8_9, ptr @type..func_8uint16_9_8_9, ptr @type..func_8_2go_0llvm_0OPT_3uint16_9_8_9, ptr @uint8..p, ptr @type..func_8uint8_9_8_9, ptr @type..func_8_2go_0llvm_0OPT_3uint8_9_8_9, ptr @type..func_8_9_8uint16_9, ptr @type..func_8_2go_0llvm_0OPT_9_8uint16_9, ptr @go_0llvm.RR..p, ptr @type..func_8_9_8go_0llvm_0RR_9, ptr @type..func_8_2go_0llvm_0OPT_9_8go_0llvm_0RR_9, ptr @type.._2_2go_0llvm_0OPT, ptr @go_0llvm.OPT..p, ptr @go_0llvm.EDNS0..p, ptr @type..func_8_9_8string_9, ptr @type..func_8_9_8go_0llvm_0EDNS0_9, ptr @type.._6_7uint8, ptr @error..p, ptr @type..func_8_9_8_6_7uint8_3error_9, ptr @type..func_8_6_7uint8_9_8error_9, ptr @type.._6_7go_0llvm_0EDNS0, ptr @type..func_8_2go_0llvm_0SOA_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0SOA_9_8go_0llvm_0RR_9, ptr @type.._2_2go_0llvm_0SOA, ptr @go_0llvm.SOA..p, ptr @type..func_8_2go_0llvm_0DNAME_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0DNAME_9_8go_0llvm_0RR_9, ptr @type.._2_2go_0llvm_0DNAME, ptr @go_0llvm.DNAME..p, ptr @type..func_8_2go_0llvm_0CNAME_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0CNAME_9_8go_0llvm_0RR_9, ptr @type.._2_2go_0llvm_0CNAME, ptr @go_0llvm.CNAME..p, ptr @type..func_8_2go_0llvm_0SRV_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0SRV_9_8go_0llvm_0RR_9, ptr @type.._2_2go_0llvm_0SRV, ptr @go_0llvm.SRV..p, ptr @type..func_8_2go_0llvm_0MX_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0MX_9_8go_0llvm_0RR_9, ptr @type.._2_2go_0llvm_0MX, ptr @go_0llvm.MX..p, ptr @type..func_8_2go_0llvm_0NS_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0NS_9_8go_0llvm_0RR_9, ptr @type.._2_2go_0llvm_0NS, ptr @go_0llvm.NS..p, ptr @type..func_8_2go_0llvm_0RRSIG_9_8_2go_0llvm_0RR__Header_9, ptr @type..func_8_2go_0llvm_0RRSIG_9_8go_0llvm_0RR_9, ptr @type.._2_2go_0llvm_0RRSIG, ptr @go_0llvm.RRSIG..p, ptr @go_0llvm.ResponseWriter..p, ptr @type..func_8_9_8error_9, ptr @type..func_8_9_8_9, ptr @type..func_8_9_8net_0Addr_9, ptr @type..func_8bool_9_8_9, ptr @int..p, ptr @type..func_8_6_7uint8_9_8int_3error_9, ptr @go_0llvm.MsgHdr..p, ptr @go_0llvm.Question..p, ptr @type.._6_7go_0llvm_0Question, ptr @type.._6_7go_0llvm_0RR, ptr @go_0llvm.Msg..p, ptr @type..func_8_2go_0llvm_0Msg_9_8error_9, ptr @go_0llvm.compressionMap..p, ptr @type.._6_7string, ptr @type.._6_7int, ptr @type..map_6string_7int, ptr @type.._6_7uint16, ptr @type..map_6string_7uint16, ptr @go_0llvm.Config..p, ptr @type..func_8_2net_1http_0Request_9_8bool_9, ptr @go_0llvm.FilterFunc..p, ptr @int8..p, ptr @go_0llvm.Request..p, ptr @type.._6_7go_0llvm_0FilterFunc, ptr @type..map_6string_7string, ptr @go_0llvm.Plugin..p, ptr @go_0llvm.Handler..p, ptr @type..func_8context_0Context_3go_0llvm_0ResponseWriter_3_2go_0llvm_0Msg_9_8int_3error_9, ptr @type.._6_7go_0llvm_0Plugin, ptr @type.._6_7go_0llvm_0Handler, ptr @type..map_6string_7go_0llvm_0Handler, ptr @go_0llvm.MetadataCollector..p, ptr @type..func_8context_0Context_3go_0llvm_0Request_9_8context_0Context_9, ptr @go_0llvm.HandlerFunc..p, ptr @type..func_8go_0llvm_0ScrubWriter_9_8error_9, ptr @type..func_8go_0llvm_0ScrubWriter_9_8_9, ptr @type..func_8go_0llvm_0ScrubWriter_9_8net_0Addr_9, ptr @type..func_8go_0llvm_0ScrubWriter_3bool_9_8_9, ptr @type..func_8go_0llvm_0ScrubWriter_3_6_7uint8_9_8int_3error_9, ptr @type..func_8go_0llvm_0ScrubWriter_3_2go_0llvm_0Msg_9_8error_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_9_8error_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_9_8_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_9_8net_0Addr_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_3bool_9_8_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_3_6_7uint8_9_8int_3error_9, ptr @type..func_8_2go_0llvm_0ScrubWriter_3_2go_0llvm_0Msg_9_8error_9, ptr @type.._2_2go_0llvm_0ScrubWriter, ptr @go_0llvm.ScrubWriter..p, ptr @type..func_8_2go_0llvm_0supported_9_8_9, ptr @type..func_8_9_8sync_0Locker_9, ptr @type..func_8_2go_0llvm_0supported_9_8sync_0Locker_9, ptr @int32..p, ptr @type..func_8int32_9_8_9, ptr @type..func_8_2go_0llvm_0supported_3int32_9_8_9, ptr @type.._2_2go_0llvm_0supported, ptr @go_0llvm.supported..p, ptr @type..struct_4_5, ptr @type.._6_7struct_4_5, ptr @uintptr..p, ptr @type..map_6uint16_7struct_4_5, ptr @go_0llvm.Transfer..p, ptr @go_0llvm.Transferer..p, ptr @type.._x3c_x2dchan_b_6_7go_0llvm_0RR, ptr @type..func_8string_3uint32_9_8_x3c_x2dchan_b_6_7go_0llvm_0RR_3error_9, ptr @type.._6_7go_0llvm_0Transferer, ptr @go_0llvm.Zones..p, ptr @type..func_8_2go_0llvm_0Zone_9_8_9, ptr @type..func_8_2go_0llvm_0Zone_9_8sync_0Locker_9, ptr @type..func_8_2go_0llvm_0Zone_3int32_9_8_9, ptr @type.._2_2go_0llvm_0Zone, ptr @go_0llvm.Zone..p, ptr @type.._6_7_6_7go_0llvm_0RR, ptr @type..map_6uint16_7_6_7go_0llvm_0RR, ptr @go_0llvm.Elem..p, ptr @go_0llvm.Color..p, ptr @go_0llvm.Node..p, ptr @go_0llvm.Tree..p, ptr @go_0llvm.Apex..p, ptr @type..chan_bbool, ptr @go_0llvm.Upstream..p, ptr @go_0llvm.Result..p, ptr @go_0llvm.Key..p, ptr @go_0llvm.LoopKey..p, ptr @go_0llvm.ViewKey..p, ptr @type..func_8go_0llvm_0NonWriter_9_8error_9, ptr @type..func_8go_0llvm_0NonWriter_9_8_9, ptr @type..func_8go_0llvm_0NonWriter_9_8net_0Addr_9, ptr @type..func_8go_0llvm_0NonWriter_3bool_9_8_9, ptr @type..func_8go_0llvm_0NonWriter_3_6_7uint8_9_8int_3error_9, ptr @type..func_8go_0llvm_0NonWriter_3_2go_0llvm_0Msg_9_8error_9, ptr @type..func_8_2go_0llvm_0NonWriter_9_8error_9, ptr @type..func_8_2go_0llvm_0NonWriter_9_8_9, ptr @type..func_8_2go_0llvm_0NonWriter_9_8net_0Addr_9, ptr @type..func_8_2go_0llvm_0NonWriter_3bool_9_8_9, ptr @type..func_8_2go_0llvm_0NonWriter_3_6_7uint8_9_8int_3error_9, ptr @type..func_8_2go_0llvm_0NonWriter_3_2go_0llvm_0Msg_9_8error_9, ptr @type.._2_2go_0llvm_0NonWriter, ptr @go_0llvm.NonWriter..p, ptr @go_0llvm.Func..p] }
@go..C0 = internal global { ptr, i64, [1 x { ptr, i64, i64, ptr }] } { ptr null, i64 1, [1 x { ptr, i64, i64, ptr }] [{ ptr, i64, i64, ptr } { ptr @go_0llvm.sup, i64 8, i64 8, ptr @gcbits..ba }] }

define i8 @go_0llvm.OPT.Do(ptr nest nocapture readnone %nest.24, ptr readonly %rr) #0 {
entry:
  %icmp.105 = icmp eq ptr %rr, null
  br i1 %icmp.105, label %then.92, label %else.92, !make.implicit !3

then.92:                                          ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.92:                                          ; preds = %entry
  %field.167 = getelementptr inbounds %OPT.0, ptr %rr, i64 0, i32 0, i32 3
  %.field.field.ld.3 = load i32, ptr %field.167, align 4
  %0 = trunc i32 %.field.field.ld.3 to i16
  %.lobit = lshr i16 %0, 15
  %1 = trunc i16 %.lobit to i8
  ret i8 %1
}

define i8 @go_0llvm.RR__Header..eq(ptr nest nocapture readnone %nest.69, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.383 = icmp eq ptr %key1, null
  br i1 %icmp.383, label %then.332, label %else.332, !make.implicit !3

then.332:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.332:                                         ; preds = %entry
  %tmpv.514.sroa.0.0.copyload = load ptr, ptr %key1, align 8
  %icmp.384 = icmp eq ptr %key2, null
  br i1 %icmp.384, label %then.333, label %else.333, !make.implicit !3

then.333:                                         ; preds = %else.332
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.333:                                         ; preds = %else.332
  %tmpv.514.sroa.3.0.cast.1884.sroa_idx3 = getelementptr inbounds i8, ptr %key1, i64 8
  %tmpv.514.sroa.3.0.copyload = load i64, ptr %tmpv.514.sroa.3.0.cast.1884.sroa_idx3, align 8
  %tmpv.516.sroa.0.0.copyload = load ptr, ptr %key2, align 8
  %tmpv.516.sroa.3.0.cast.1887.sroa_idx1 = getelementptr inbounds i8, ptr %key2, i64 8
  %tmpv.516.sroa.3.0.copyload = load i64, ptr %tmpv.516.sroa.3.0.cast.1887.sroa_idx1, align 8
  %icmp.385 = icmp eq i64 %tmpv.514.sroa.3.0.copyload, %tmpv.516.sroa.3.0.copyload
  br i1 %icmp.385, label %then.334, label %common.ret

then.334:                                         ; preds = %else.333
  %icmp.386 = icmp eq ptr %tmpv.514.sroa.0.0.copyload, %tmpv.516.sroa.0.0.copyload
  br i1 %icmp.386, label %else.338, label %else.335

else.335:                                         ; preds = %then.334
  %bcmp = call i32 @bcmp(ptr %tmpv.514.sroa.0.0.copyload, ptr %tmpv.516.sroa.0.0.copyload, i64 %tmpv.514.sroa.3.0.copyload)
  %icmp.387 = icmp eq i32 %bcmp, 0
  br i1 %icmp.387, label %else.338, label %common.ret

common.ret:                                       ; preds = %else.333, %else.335, %else.338, %else.341, %else.344, %else.347
  %common.ret.op = phi i8 [ %spec.select, %else.347 ], [ 0, %else.344 ], [ 0, %else.341 ], [ 0, %else.338 ], [ 0, %else.335 ], [ 0, %else.333 ]
  ret i8 %common.ret.op

else.338:                                         ; preds = %else.335, %then.334
  %field.561 = getelementptr inbounds i8, ptr %key1, i64 16
  %.field.ld.103 = load i16, ptr %field.561, align 2
  %field.562 = getelementptr inbounds i8, ptr %key2, i64 16
  %.field.ld.104 = load i16, ptr %field.562, align 2
  %icmp.391.not = icmp eq i16 %.field.ld.103, %.field.ld.104
  br i1 %icmp.391.not, label %else.341, label %common.ret

else.341:                                         ; preds = %else.338
  %field.563 = getelementptr inbounds i8, ptr %key1, i64 18
  %.field.ld.105 = load i16, ptr %field.563, align 2
  %field.564 = getelementptr inbounds i8, ptr %key2, i64 18
  %.field.ld.106 = load i16, ptr %field.564, align 2
  %icmp.394.not = icmp eq i16 %.field.ld.105, %.field.ld.106
  br i1 %icmp.394.not, label %else.344, label %common.ret

else.344:                                         ; preds = %else.341
  %field.565 = getelementptr inbounds i8, ptr %key1, i64 20
  %.field.ld.107 = load i32, ptr %field.565, align 4
  %field.566 = getelementptr inbounds i8, ptr %key2, i64 20
  %.field.ld.108 = load i32, ptr %field.566, align 4
  %icmp.397.not = icmp eq i32 %.field.ld.107, %.field.ld.108
  br i1 %icmp.397.not, label %else.347, label %common.ret

else.347:                                         ; preds = %else.344
  %field.567 = getelementptr inbounds i8, ptr %key1, i64 24
  %.field.ld.109 = load i16, ptr %field.567, align 2
  %field.568 = getelementptr inbounds i8, ptr %key2, i64 24
  %.field.ld.110 = load i16, ptr %field.568, align 2
  %icmp.400.not = icmp eq i16 %.field.ld.109, %.field.ld.110
  %spec.select = zext i1 %icmp.400.not to i8
  br label %common.ret
}

define ptr @go_0llvm.OPT.Header(ptr nest nocapture readnone %nest.5, ptr readnone returned %rr) #0 {
entry:
  %icmp.7 = icmp eq ptr %rr, null
  br i1 %icmp.7, label %then.4, label %else.4, !make.implicit !3

then.4:                                           ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.4:                                           ; preds = %entry
  ret ptr %rr
}

define void @go_0llvm.OPT.SetDo(ptr nest nocapture readnone %nest.25, ptr %rr, ptr nocapture readonly byval({ ptr, i64, i64 }) %do) #0 {
entry:
  %field.183 = getelementptr inbounds { ptr, i64, i64 }, ptr %do, i64 0, i32 1
  %do.field.ld.3 = load i64, ptr %field.183, align 8
  %icmp.115 = icmp eq i64 %do.field.ld.3, 1
  br i1 %icmp.115, label %fallthrough.94, label %else.93

fallthrough.93:                                   ; preds = %else.100, %else.98, %else.96
  ret void

else.93:                                          ; preds = %entry
  %icmp.113 = icmp eq ptr %rr, null
  br i1 %icmp.113, label %then.100, label %else.100, !make.implicit !3

fallthrough.94:                                   ; preds = %entry
  %do.field.ld.2 = load ptr, ptr %do, align 8
  %.ptroff.ld.5 = load i8, ptr %do.field.ld.2, align 1
  %0 = and i8 %.ptroff.ld.5, 1
  %trunc.102.not = icmp eq i8 %0, 0
  %icmp.111 = icmp eq ptr %rr, null
  br i1 %trunc.102.not, label %else.95, label %then.95

then.95:                                          ; preds = %fallthrough.94
  br i1 %icmp.111, label %then.96, label %else.96, !make.implicit !3

else.95:                                          ; preds = %fallthrough.94
  br i1 %icmp.111, label %then.98, label %else.98, !make.implicit !3

then.96:                                          ; preds = %then.95
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.96:                                          ; preds = %then.95
  %field.171 = getelementptr inbounds %OPT.0, ptr %rr, i64 0, i32 0, i32 3
  %.field.field.ld.4 = load i32, ptr %field.171, align 4
  %ior.149 = or i32 %.field.field.ld.4, 32768
  store i32 %ior.149, ptr %field.171, align 4
  br label %fallthrough.93

then.98:                                          ; preds = %else.95
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.98:                                          ; preds = %else.95
  %field.175 = getelementptr inbounds %OPT.0, ptr %rr, i64 0, i32 0, i32 3
  %.field.field.ld.5 = load i32, ptr %field.175, align 4
  %iand.10 = and i32 %.field.field.ld.5, -32769
  store i32 %iand.10, ptr %field.175, align 4
  br label %fallthrough.93

then.100:                                         ; preds = %else.93
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.100:                                         ; preds = %else.93
  %field.180 = getelementptr inbounds %OPT.0, ptr %rr, i64 0, i32 0, i32 3
  %.field.field.ld.6 = load i32, ptr %field.180, align 4
  %ior.150 = or i32 %.field.field.ld.6, 32768
  store i32 %ior.150, ptr %field.180, align 4
  br label %fallthrough.93
}

define void @go_0llvm.OPT.SetUDPSize(ptr nest nocapture readnone %nest.23, ptr writeonly %rr, i16 zeroext %size) #0 {
entry:
  %icmp.104 = icmp eq ptr %rr, null
  br i1 %icmp.104, label %then.91, label %else.91, !make.implicit !3

then.91:                                          ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.91:                                          ; preds = %entry
  %field.165 = getelementptr inbounds %OPT.0, ptr %rr, i64 0, i32 0, i32 2
  store i16 %size, ptr %field.165, align 2
  ret void
}

define void @go_0llvm.OPT.SetVersion(ptr nest nocapture readnone %nest.21, ptr %rr, i8 zeroext %v) #0 {
entry:
  %icmp.101 = icmp eq ptr %rr, null
  br i1 %icmp.101, label %then.88, label %else.88, !make.implicit !3

then.88:                                          ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.88:                                          ; preds = %entry
  %field.159 = getelementptr inbounds %OPT.0, ptr %rr, i64 0, i32 0, i32 3
  %zext.101 = zext i8 %v to i32
  %.field.field.ld.1 = load i32, ptr %field.159, align 4
  %iand.7 = and i32 %.field.field.ld.1, -16711681
  %shl.148 = shl nuw nsw i32 %zext.101, 16
  %ior.148 = or i32 %iand.7, %shl.148
  store i32 %ior.148, ptr %field.159, align 4
  ret void
}

define i16 @go_0llvm.OPT.UDPSize(ptr nest nocapture readnone %nest.22, ptr readonly %rr) #0 {
entry:
  %icmp.103 = icmp eq ptr %rr, null
  br i1 %icmp.103, label %then.90, label %else.90, !make.implicit !3

then.90:                                          ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.90:                                          ; preds = %entry
  %field.163 = getelementptr inbounds %OPT.0, ptr %rr, i64 0, i32 0, i32 2
  %.field.field.ld.2 = load i16, ptr %field.163, align 2
  ret i16 %.field.field.ld.2
}

define { ptr, ptr } @go_0llvm.OPT.copy(ptr nest nocapture readnone %nest.13, ptr readonly %rr) #0 {
entry:
  %tmpv.59 = alloca %RR_Header.0, align 8
  %tmpv.62 = alloca %OPT.0, align 8, !go_addrtaken !3
  %icmp.24 = icmp eq ptr %rr, null
  br i1 %icmp.24, label %then.21, label %else.21, !make.implicit !3

then.21:                                          ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.21:                                          ; preds = %entry
  %field.37 = getelementptr inbounds %OPT.0, ptr %rr, i64 0, i32 1, i32 1
  %.field.field.ld.0 = load i64, ptr %field.37, align 8
  %call.6 = call ptr @runtime.makeslice(ptr nest undef, ptr nonnull @go_0llvm.EDNS0..d, i64 %.field.field.ld.0, i64 %.field.field.ld.0)
  %tmpv.42.sroa.0.0.cast.1128.sroa_idx = getelementptr inbounds %OPT.0, ptr %rr, i64 0, i32 1, i32 0
  %tmpv.42.sroa.0.0.copyload = load ptr, ptr %tmpv.42.sroa.0.0.cast.1128.sroa_idx, align 8
  %tmpv.42.sroa.2.0.copyload = load i64, ptr %field.37, align 8
  %icmp.3438 = icmp sgt i64 %tmpv.42.sroa.2.0.copyload, 0
  br i1 %icmp.3438, label %then.29.preheader, label %else.30

then.29.preheader:                                ; preds = %else.21
  %smax = call i64 @llvm.smax.i64(i64 %.field.field.ld.0, i64 0)
  br label %then.29

fallthrough.24:                                   ; preds = %then.29
  %ptroff.1 = getelementptr %EDNS0.0, ptr %call.6, i64 %tmpv.44.039
  %icmp.30 = icmp eq ptr %ptroff.1, null
  br i1 %icmp.30, label %then.25, label %else.25, !make.implicit !3

else.24:                                          ; preds = %then.29
  call void @runtime.goPanicIndex(ptr nest undef, i64 %smax, i64 %.field.field.ld.0)
  unreachable

then.25:                                          ; preds = %fallthrough.24
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.25:                                          ; preds = %fallthrough.24
  store ptr %call.7.fca.0.extract, ptr %ptroff.1, align 8
  %deref.ld.6 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.33 = icmp eq i32 %deref.ld.6, 0
  %field.54 = getelementptr %EDNS0.0, ptr %call.6, i64 %tmpv.44.039, i32 1
  br i1 %icmp.33, label %else.27, label %else.28

fallthrough.26:                                   ; preds = %else.28, %else.27
  %add.0 = add nuw nsw i64 %tmpv.44.039, 1
  %exitcond.not = icmp eq i64 %add.0, %tmpv.42.sroa.2.0.copyload
  br i1 %exitcond.not, label %else.30, label %then.29

else.27:                                          ; preds = %else.25
  store ptr %call.7.fca.1.extract, ptr %field.54, align 8
  br label %fallthrough.26

else.28:                                          ; preds = %else.25
  %pticast.15 = ptrtoint ptr %call.7.fca.1.extract to i64
  call void @runtime.gcWriteBarrier(ptr nest undef, ptr %field.54, i64 %pticast.15)
  br label %fallthrough.26

then.29:                                          ; preds = %then.29.preheader, %fallthrough.26
  %tmpv.44.039 = phi i64 [ %add.0, %fallthrough.26 ], [ 0, %then.29.preheader ]
  %tmpv.45.sroa.0.0.cast.1132.sroa_idx = getelementptr %EDNS0.0, ptr %tmpv.42.sroa.0.0.copyload, i64 %tmpv.44.039, i32 0
  %tmpv.45.sroa.0.0.copyload = load ptr, ptr %tmpv.45.sroa.0.0.cast.1132.sroa_idx, align 8
  %tmpv.45.sroa.2.0.cast.1132.sroa_idx20 = getelementptr %EDNS0.0, ptr %tmpv.42.sroa.0.0.copyload, i64 %tmpv.44.039, i32 1
  %tmpv.45.sroa.2.0.copyload = load ptr, ptr %tmpv.45.sroa.2.0.cast.1132.sroa_idx20, align 8
  %field.47 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr }, ptr %tmpv.45.sroa.0.0.copyload, i64 0, i32 3
  %.field.ld.1 = load ptr, ptr %field.47, align 8
  %call.7 = call { ptr, ptr } %.field.ld.1(ptr nest undef, ptr %tmpv.45.sroa.2.0.copyload)
  %call.7.fca.0.extract = extractvalue { ptr, ptr } %call.7, 0
  %call.7.fca.1.extract = extractvalue { ptr, ptr } %call.7, 1
  %exitcond.not5 = icmp eq i64 %tmpv.44.039, %smax
  br i1 %exitcond.not5, label %else.24, label %fallthrough.24

else.30:                                          ; preds = %fallthrough.26, %else.21
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %tmpv.59, ptr noundef nonnull align 8 dereferenceable(32) %rr, i64 32, i1 false)
  %call.8 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.OPT..d)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %tmpv.62, ptr noundef nonnull align 8 dereferenceable(32) %tmpv.59, i64 32, i1 false)
  %Option.sroa.0.0.cast.1153.sroa_idx = getelementptr inbounds %OPT.0, ptr %tmpv.62, i64 0, i32 1, i32 0
  store ptr %call.6, ptr %Option.sroa.0.0.cast.1153.sroa_idx, align 8
  %Option.sroa.5.0.cast.1153.sroa_idx29 = getelementptr inbounds %OPT.0, ptr %tmpv.62, i64 0, i32 1, i32 1
  store i64 %.field.field.ld.0, ptr %Option.sroa.5.0.cast.1153.sroa_idx29, align 8
  %Option.sroa.7.0.cast.1153.sroa_idx31 = getelementptr inbounds %OPT.0, ptr %tmpv.62, i64 0, i32 1, i32 2
  store i64 %.field.field.ld.0, ptr %Option.sroa.7.0.cast.1153.sroa_idx31, align 8
  %deref.ld.7 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.36 = icmp eq i32 %deref.ld.7, 0
  br i1 %icmp.36, label %then.31, label %else.31

then.31:                                          ; preds = %else.30
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(56) %call.8, ptr noundef nonnull align 8 dereferenceable(56) %tmpv.62, i64 56, i1 false)
  br label %fallthrough.31

fallthrough.31:                                   ; preds = %else.31, %then.31
  %ld.4.fca.1.insert = insertvalue { ptr, ptr } { ptr @pimt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.OPT, ptr undef }, ptr %call.8, 1
  ret { ptr, ptr } %ld.4.fca.1.insert

else.31:                                          ; preds = %else.30
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.OPT..d, ptr nonnull %call.8, ptr nonnull %tmpv.62)
  br label %fallthrough.31
}

define i8 @go_0llvm.SOA..eq(ptr nest nocapture readnone %nest.73, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.470 = icmp eq ptr %key1, null
  br i1 %icmp.470, label %then.413, label %else.413, !make.implicit !3

then.413:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.413:                                         ; preds = %entry
  %tmpv.594.sroa.0.0.copyload = load ptr, ptr %key1, align 8
  %tmpv.594.sroa.3.0.cast.1972.sroa_idx23 = getelementptr inbounds i8, ptr %key1, i64 16
  %tmpv.594.sroa.3.0.copyload = load i16, ptr %tmpv.594.sroa.3.0.cast.1972.sroa_idx23, align 8
  %tmpv.594.sroa.5.0.cast.1972.sroa_idx24 = getelementptr inbounds i8, ptr %key1, i64 18
  %tmpv.594.sroa.5.0.copyload = load i16, ptr %tmpv.594.sroa.5.0.cast.1972.sroa_idx24, align 2
  %tmpv.594.sroa.6.0.cast.1972.sroa_idx25 = getelementptr inbounds i8, ptr %key1, i64 20
  %tmpv.594.sroa.6.0.copyload = load i32, ptr %tmpv.594.sroa.6.0.cast.1972.sroa_idx25, align 4
  %tmpv.594.sroa.7.0.cast.1972.sroa_idx26 = getelementptr inbounds i8, ptr %key1, i64 24
  %tmpv.594.sroa.7.0.copyload = load i16, ptr %tmpv.594.sroa.7.0.cast.1972.sroa_idx26, align 8
  %icmp.471 = icmp eq ptr %key2, null
  br i1 %icmp.471, label %then.414, label %else.414, !make.implicit !3

then.414:                                         ; preds = %else.413
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.414:                                         ; preds = %else.413
  %tmpv.594.sroa.2.0.cast.1972.sroa_idx22 = getelementptr inbounds i8, ptr %key1, i64 8
  %tmpv.594.sroa.2.0.copyload = load i64, ptr %tmpv.594.sroa.2.0.cast.1972.sroa_idx22, align 8
  %tmpv.595.sroa.0.0.copyload = load ptr, ptr %key2, align 8
  %tmpv.595.sroa.2.0.cast.1977.sroa_idx17 = getelementptr inbounds i8, ptr %key2, i64 8
  %tmpv.595.sroa.2.0.copyload = load i64, ptr %tmpv.595.sroa.2.0.cast.1977.sroa_idx17, align 8
  %tmpv.595.sroa.3.0.cast.1977.sroa_idx18 = getelementptr inbounds i8, ptr %key2, i64 16
  %tmpv.595.sroa.3.0.copyload = load i16, ptr %tmpv.595.sroa.3.0.cast.1977.sroa_idx18, align 8
  %tmpv.595.sroa.5.0.cast.1977.sroa_idx19 = getelementptr inbounds i8, ptr %key2, i64 18
  %tmpv.595.sroa.5.0.copyload = load i16, ptr %tmpv.595.sroa.5.0.cast.1977.sroa_idx19, align 2
  %tmpv.595.sroa.6.0.cast.1977.sroa_idx20 = getelementptr inbounds i8, ptr %key2, i64 20
  %tmpv.595.sroa.6.0.copyload = load i32, ptr %tmpv.595.sroa.6.0.cast.1977.sroa_idx20, align 4
  %tmpv.595.sroa.7.0.cast.1977.sroa_idx21 = getelementptr inbounds i8, ptr %key2, i64 24
  %tmpv.595.sroa.7.0.copyload = load i16, ptr %tmpv.595.sroa.7.0.cast.1977.sroa_idx21, align 8
  %icmp.472 = icmp eq i64 %tmpv.594.sroa.2.0.copyload, %tmpv.595.sroa.2.0.copyload
  br i1 %icmp.472, label %then.415, label %fallthrough.415

then.415:                                         ; preds = %else.414
  %icmp.473 = icmp eq ptr %tmpv.594.sroa.0.0.copyload, %tmpv.595.sroa.0.0.copyload
  br i1 %icmp.473, label %fallthrough.415, label %else.416

fallthrough.415:                                  ; preds = %else.416, %then.415, %else.414
  %tmpv.604.0 = phi i1 [ false, %else.414 ], [ %icmp.474, %else.416 ], [ true, %then.415 ]
  %icmp.476 = icmp eq i16 %tmpv.594.sroa.3.0.copyload, %tmpv.595.sroa.3.0.copyload
  %spec.select = select i1 %tmpv.604.0, i1 %icmp.476, i1 false
  %icmp.477 = icmp eq i16 %tmpv.594.sroa.5.0.copyload, %tmpv.595.sroa.5.0.copyload
  %tmpv.606.0.in = select i1 %spec.select, i1 %icmp.477, i1 false
  %icmp.478 = icmp eq i32 %tmpv.594.sroa.6.0.copyload, %tmpv.595.sroa.6.0.copyload
  %spec.select35 = select i1 %tmpv.606.0.in, i1 %icmp.478, i1 false
  %icmp.479 = icmp eq i16 %tmpv.594.sroa.7.0.copyload, %tmpv.595.sroa.7.0.copyload
  %tmpv.608.0.in = select i1 %spec.select35, i1 %icmp.479, i1 false
  br i1 %tmpv.608.0.in, label %else.422, label %common.ret

else.416:                                         ; preds = %then.415
  %bcmp2 = call i32 @bcmp(ptr %tmpv.594.sroa.0.0.copyload, ptr %tmpv.595.sroa.0.0.copyload, i64 %tmpv.594.sroa.2.0.copyload)
  %icmp.474 = icmp eq i32 %bcmp2, 0
  br label %fallthrough.415

common.ret:                                       ; preds = %fallthrough.415, %else.422, %else.425, %else.427, %else.430, %else.433, %else.436, %else.439, %else.442, %else.445
  %common.ret.op = phi i8 [ %spec.select36, %else.445 ], [ 0, %else.442 ], [ 0, %else.439 ], [ 0, %else.436 ], [ 0, %else.433 ], [ 0, %else.430 ], [ 0, %else.427 ], [ 0, %else.425 ], [ 0, %else.422 ], [ 0, %fallthrough.415 ]
  ret i8 %common.ret.op

else.422:                                         ; preds = %fallthrough.415
  %tmpv.609.sroa.0.0.cast.1986.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 32
  %tmpv.609.sroa.0.0.copyload = load ptr, ptr %tmpv.609.sroa.0.0.cast.1986.sroa_idx, align 8
  %tmpv.609.sroa.3.0.cast.1986.sroa_idx6 = getelementptr inbounds i8, ptr %key1, i64 40
  %tmpv.609.sroa.3.0.copyload = load i64, ptr %tmpv.609.sroa.3.0.cast.1986.sroa_idx6, align 8
  %tmpv.611.sroa.0.0.cast.1989.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 32
  %tmpv.611.sroa.0.0.copyload = load ptr, ptr %tmpv.611.sroa.0.0.cast.1989.sroa_idx, align 8
  %tmpv.611.sroa.3.0.cast.1989.sroa_idx4 = getelementptr inbounds i8, ptr %key2, i64 40
  %tmpv.611.sroa.3.0.copyload = load i64, ptr %tmpv.611.sroa.3.0.cast.1989.sroa_idx4, align 8
  %icmp.483 = icmp eq i64 %tmpv.609.sroa.3.0.copyload, %tmpv.611.sroa.3.0.copyload
  br i1 %icmp.483, label %then.424, label %common.ret

then.424:                                         ; preds = %else.422
  %icmp.484 = icmp eq ptr %tmpv.609.sroa.0.0.copyload, %tmpv.611.sroa.0.0.copyload
  br i1 %icmp.484, label %else.427, label %else.425

else.425:                                         ; preds = %then.424
  %bcmp = call i32 @bcmp(ptr %tmpv.609.sroa.0.0.copyload, ptr %tmpv.611.sroa.0.0.copyload, i64 %tmpv.609.sroa.3.0.copyload)
  %icmp.485 = icmp eq i32 %bcmp, 0
  br i1 %icmp.485, label %else.427, label %common.ret

else.427:                                         ; preds = %else.425, %then.424
  %tmpv.615.sroa.0.0.cast.1992.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 48
  %tmpv.615.sroa.0.0.copyload = load ptr, ptr %tmpv.615.sroa.0.0.cast.1992.sroa_idx, align 8
  %tmpv.615.sroa.3.0.cast.1992.sroa_idx3 = getelementptr inbounds i8, ptr %key1, i64 56
  %tmpv.615.sroa.3.0.copyload = load i64, ptr %tmpv.615.sroa.3.0.cast.1992.sroa_idx3, align 8
  %tmpv.617.sroa.0.0.cast.1995.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 48
  %tmpv.617.sroa.0.0.copyload = load ptr, ptr %tmpv.617.sroa.0.0.cast.1995.sroa_idx, align 8
  %tmpv.617.sroa.3.0.cast.1995.sroa_idx1 = getelementptr inbounds i8, ptr %key2, i64 56
  %tmpv.617.sroa.3.0.copyload = load i64, ptr %tmpv.617.sroa.3.0.cast.1995.sroa_idx1, align 8
  %icmp.489 = icmp eq i64 %tmpv.615.sroa.3.0.copyload, %tmpv.617.sroa.3.0.copyload
  br i1 %icmp.489, label %then.429, label %common.ret

then.429:                                         ; preds = %else.427
  %icmp.490 = icmp eq ptr %tmpv.615.sroa.0.0.copyload, %tmpv.617.sroa.0.0.copyload
  br i1 %icmp.490, label %else.433, label %else.430

else.430:                                         ; preds = %then.429
  %bcmp1 = call i32 @bcmp(ptr %tmpv.615.sroa.0.0.copyload, ptr %tmpv.617.sroa.0.0.copyload, i64 %tmpv.615.sroa.3.0.copyload)
  %icmp.491 = icmp eq i32 %bcmp1, 0
  br i1 %icmp.491, label %else.433, label %common.ret

else.433:                                         ; preds = %else.430, %then.429
  %field.682 = getelementptr inbounds i8, ptr %key1, i64 64
  %.field.ld.129 = load i32, ptr %field.682, align 4
  %field.683 = getelementptr inbounds i8, ptr %key2, i64 64
  %.field.ld.130 = load i32, ptr %field.683, align 4
  %icmp.495.not = icmp eq i32 %.field.ld.129, %.field.ld.130
  br i1 %icmp.495.not, label %else.436, label %common.ret

else.436:                                         ; preds = %else.433
  %field.684 = getelementptr inbounds i8, ptr %key1, i64 68
  %.field.ld.131 = load i32, ptr %field.684, align 4
  %field.685 = getelementptr inbounds i8, ptr %key2, i64 68
  %.field.ld.132 = load i32, ptr %field.685, align 4
  %icmp.498.not = icmp eq i32 %.field.ld.131, %.field.ld.132
  br i1 %icmp.498.not, label %else.439, label %common.ret

else.439:                                         ; preds = %else.436
  %field.686 = getelementptr inbounds i8, ptr %key1, i64 72
  %.field.ld.133 = load i32, ptr %field.686, align 4
  %field.687 = getelementptr inbounds i8, ptr %key2, i64 72
  %.field.ld.134 = load i32, ptr %field.687, align 4
  %icmp.501.not = icmp eq i32 %.field.ld.133, %.field.ld.134
  br i1 %icmp.501.not, label %else.442, label %common.ret

else.442:                                         ; preds = %else.439
  %field.688 = getelementptr inbounds i8, ptr %key1, i64 76
  %.field.ld.135 = load i32, ptr %field.688, align 4
  %field.689 = getelementptr inbounds i8, ptr %key2, i64 76
  %.field.ld.136 = load i32, ptr %field.689, align 4
  %icmp.504.not = icmp eq i32 %.field.ld.135, %.field.ld.136
  br i1 %icmp.504.not, label %else.445, label %common.ret

else.445:                                         ; preds = %else.442
  %field.690 = getelementptr inbounds i8, ptr %key1, i64 80
  %.field.ld.137 = load i32, ptr %field.690, align 4
  %field.691 = getelementptr inbounds i8, ptr %key2, i64 80
  %.field.ld.138 = load i32, ptr %field.691, align 4
  %icmp.507.not = icmp eq i32 %.field.ld.137, %.field.ld.138
  %spec.select36 = zext i1 %icmp.507.not to i8
  br label %common.ret
}

define ptr @go_0llvm.SOA.Header(ptr nest nocapture readnone %nest.7, ptr readnone returned %rr) #0 {
entry:
  %icmp.9 = icmp eq ptr %rr, null
  br i1 %icmp.9, label %then.6, label %else.6, !make.implicit !3

then.6:                                           ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.6:                                           ; preds = %entry
  ret ptr %rr
}

define { ptr, ptr } @go_0llvm.SOA.copy(ptr nest nocapture readnone %nest.15, ptr readonly %rr) #0 {
entry:
  %tmpv.85 = alloca %RR_Header.0, align 8
  %tmpv.87 = alloca { ptr, i64 }, align 8
  %tmpv.89 = alloca { ptr, i64 }, align 8
  %tmpv.102 = alloca %SOA.0, align 8, !go_addrtaken !3
  %icmp.48 = icmp eq ptr %rr, null
  br i1 %icmp.48, label %then.43, label %else.43, !make.implicit !3

then.43:                                          ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.43:                                          ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %tmpv.85, ptr noundef nonnull align 8 dereferenceable(32) %rr, i64 32, i1 false)
  %field.86 = getelementptr inbounds %SOA.0, ptr %rr, i64 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %tmpv.87, ptr noundef nonnull align 8 dereferenceable(16) %field.86, i64 16, i1 false)
  %field.87 = getelementptr inbounds %SOA.0, ptr %rr, i64 0, i32 2
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %tmpv.89, ptr noundef nonnull align 8 dereferenceable(16) %field.87, i64 16, i1 false)
  %field.88 = getelementptr inbounds %SOA.0, ptr %rr, i64 0, i32 3
  %.field.ld.9 = load i32, ptr %field.88, align 4
  %field.89 = getelementptr inbounds %SOA.0, ptr %rr, i64 0, i32 4
  %.field.ld.10 = load i32, ptr %field.89, align 4
  %field.90 = getelementptr inbounds %SOA.0, ptr %rr, i64 0, i32 5
  %.field.ld.11 = load i32, ptr %field.90, align 4
  %field.91 = getelementptr inbounds %SOA.0, ptr %rr, i64 0, i32 6
  %.field.ld.12 = load i32, ptr %field.91, align 4
  %field.92 = getelementptr inbounds %SOA.0, ptr %rr, i64 0, i32 7
  %.field.ld.13 = load i32, ptr %field.92, align 4
  %call.10 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.SOA..d)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %tmpv.102, ptr noundef nonnull align 8 dereferenceable(32) %tmpv.85, i64 32, i1 false)
  %field.94 = getelementptr inbounds %SOA.0, ptr %tmpv.102, i64 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %field.94, ptr noundef nonnull align 8 dereferenceable(16) %tmpv.87, i64 16, i1 false)
  %field.95 = getelementptr inbounds %SOA.0, ptr %tmpv.102, i64 0, i32 2
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %field.95, ptr noundef nonnull align 8 dereferenceable(16) %tmpv.89, i64 16, i1 false)
  %field.96 = getelementptr inbounds %SOA.0, ptr %tmpv.102, i64 0, i32 3
  store i32 %.field.ld.9, ptr %field.96, align 8
  %field.97 = getelementptr inbounds %SOA.0, ptr %tmpv.102, i64 0, i32 4
  store i32 %.field.ld.10, ptr %field.97, align 4
  %field.98 = getelementptr inbounds %SOA.0, ptr %tmpv.102, i64 0, i32 5
  store i32 %.field.ld.11, ptr %field.98, align 8
  %field.99 = getelementptr inbounds %SOA.0, ptr %tmpv.102, i64 0, i32 6
  store i32 %.field.ld.12, ptr %field.99, align 4
  %field.100 = getelementptr inbounds %SOA.0, ptr %tmpv.102, i64 0, i32 7
  store i32 %.field.ld.13, ptr %field.100, align 8
  %deref.ld.9 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.56 = icmp eq i32 %deref.ld.9, 0
  br i1 %icmp.56, label %then.51, label %else.51

then.51:                                          ; preds = %else.43
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(88) %call.10, ptr noundef nonnull align 8 dereferenceable(88) %tmpv.102, i64 88, i1 false)
  br label %fallthrough.51

fallthrough.51:                                   ; preds = %else.51, %then.51
  %ld.6.fca.1.insert = insertvalue { ptr, ptr } { ptr @pimt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.SOA, ptr undef }, ptr %call.10, 1
  ret { ptr, ptr } %ld.6.fca.1.insert

else.51:                                          ; preds = %else.43
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.SOA..d, ptr nonnull %call.10, ptr nonnull %tmpv.102)
  br label %fallthrough.51
}

define i8 @go_0llvm.DNAME..eq(ptr nest nocapture readnone %nest.75, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.514 = icmp eq ptr %key1, null
  br i1 %icmp.514, label %then.454, label %else.454, !make.implicit !3

then.454:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.454:                                         ; preds = %entry
  %tmpv.639.sroa.0.0.copyload = load ptr, ptr %key1, align 8
  %tmpv.639.sroa.3.0.cast.2020.sroa_idx20 = getelementptr inbounds i8, ptr %key1, i64 16
  %tmpv.639.sroa.3.0.copyload = load i16, ptr %tmpv.639.sroa.3.0.cast.2020.sroa_idx20, align 8
  %tmpv.639.sroa.5.0.cast.2020.sroa_idx21 = getelementptr inbounds i8, ptr %key1, i64 18
  %tmpv.639.sroa.5.0.copyload = load i16, ptr %tmpv.639.sroa.5.0.cast.2020.sroa_idx21, align 2
  %tmpv.639.sroa.6.0.cast.2020.sroa_idx22 = getelementptr inbounds i8, ptr %key1, i64 20
  %tmpv.639.sroa.6.0.copyload = load i32, ptr %tmpv.639.sroa.6.0.cast.2020.sroa_idx22, align 4
  %tmpv.639.sroa.7.0.cast.2020.sroa_idx23 = getelementptr inbounds i8, ptr %key1, i64 24
  %tmpv.639.sroa.7.0.copyload = load i16, ptr %tmpv.639.sroa.7.0.cast.2020.sroa_idx23, align 8
  %icmp.515 = icmp eq ptr %key2, null
  br i1 %icmp.515, label %then.455, label %else.455, !make.implicit !3

then.455:                                         ; preds = %else.454
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.455:                                         ; preds = %else.454
  %tmpv.639.sroa.2.0.cast.2020.sroa_idx19 = getelementptr inbounds i8, ptr %key1, i64 8
  %tmpv.639.sroa.2.0.copyload = load i64, ptr %tmpv.639.sroa.2.0.cast.2020.sroa_idx19, align 8
  %tmpv.640.sroa.0.0.copyload = load ptr, ptr %key2, align 8
  %tmpv.640.sroa.2.0.cast.2025.sroa_idx14 = getelementptr inbounds i8, ptr %key2, i64 8
  %tmpv.640.sroa.2.0.copyload = load i64, ptr %tmpv.640.sroa.2.0.cast.2025.sroa_idx14, align 8
  %tmpv.640.sroa.3.0.cast.2025.sroa_idx15 = getelementptr inbounds i8, ptr %key2, i64 16
  %tmpv.640.sroa.3.0.copyload = load i16, ptr %tmpv.640.sroa.3.0.cast.2025.sroa_idx15, align 8
  %tmpv.640.sroa.5.0.cast.2025.sroa_idx16 = getelementptr inbounds i8, ptr %key2, i64 18
  %tmpv.640.sroa.5.0.copyload = load i16, ptr %tmpv.640.sroa.5.0.cast.2025.sroa_idx16, align 2
  %tmpv.640.sroa.6.0.cast.2025.sroa_idx17 = getelementptr inbounds i8, ptr %key2, i64 20
  %tmpv.640.sroa.6.0.copyload = load i32, ptr %tmpv.640.sroa.6.0.cast.2025.sroa_idx17, align 4
  %tmpv.640.sroa.7.0.cast.2025.sroa_idx18 = getelementptr inbounds i8, ptr %key2, i64 24
  %tmpv.640.sroa.7.0.copyload = load i16, ptr %tmpv.640.sroa.7.0.cast.2025.sroa_idx18, align 8
  %icmp.516 = icmp eq i64 %tmpv.639.sroa.2.0.copyload, %tmpv.640.sroa.2.0.copyload
  br i1 %icmp.516, label %then.456, label %fallthrough.456

then.456:                                         ; preds = %else.455
  %icmp.517 = icmp eq ptr %tmpv.639.sroa.0.0.copyload, %tmpv.640.sroa.0.0.copyload
  br i1 %icmp.517, label %fallthrough.456, label %else.457

fallthrough.456:                                  ; preds = %else.457, %then.456, %else.455
  %tmpv.649.0 = phi i1 [ false, %else.455 ], [ %icmp.518, %else.457 ], [ true, %then.456 ]
  %icmp.520 = icmp eq i16 %tmpv.639.sroa.3.0.copyload, %tmpv.640.sroa.3.0.copyload
  %spec.select = select i1 %tmpv.649.0, i1 %icmp.520, i1 false
  %icmp.521 = icmp eq i16 %tmpv.639.sroa.5.0.copyload, %tmpv.640.sroa.5.0.copyload
  %tmpv.651.0.in = select i1 %spec.select, i1 %icmp.521, i1 false
  %icmp.522 = icmp eq i32 %tmpv.639.sroa.6.0.copyload, %tmpv.640.sroa.6.0.copyload
  %spec.select26 = select i1 %tmpv.651.0.in, i1 %icmp.522, i1 false
  %icmp.523 = icmp eq i16 %tmpv.639.sroa.7.0.copyload, %tmpv.640.sroa.7.0.copyload
  %tmpv.653.0.in = select i1 %spec.select26, i1 %icmp.523, i1 false
  br i1 %tmpv.653.0.in, label %else.463, label %then.462

else.457:                                         ; preds = %then.456
  %bcmp1 = call i32 @bcmp(ptr %tmpv.639.sroa.0.0.copyload, ptr %tmpv.640.sroa.0.0.copyload, i64 %tmpv.639.sroa.2.0.copyload)
  %icmp.518 = icmp eq i32 %bcmp1, 0
  br label %fallthrough.456

then.462:                                         ; preds = %else.466, %then.465, %else.463, %fallthrough.456
  %merge = phi i8 [ 0, %fallthrough.456 ], [ 0, %else.463 ], [ %phi.cast, %else.466 ], [ 1, %then.465 ]
  ret i8 %merge

else.463:                                         ; preds = %fallthrough.456
  %tmpv.654.sroa.0.0.cast.2034.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 32
  %tmpv.654.sroa.0.0.copyload = load ptr, ptr %tmpv.654.sroa.0.0.cast.2034.sroa_idx, align 8
  %tmpv.654.sroa.3.0.cast.2034.sroa_idx3 = getelementptr inbounds i8, ptr %key1, i64 40
  %tmpv.654.sroa.3.0.copyload = load i64, ptr %tmpv.654.sroa.3.0.cast.2034.sroa_idx3, align 8
  %tmpv.656.sroa.0.0.cast.2037.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 32
  %tmpv.656.sroa.0.0.copyload = load ptr, ptr %tmpv.656.sroa.0.0.cast.2037.sroa_idx, align 8
  %tmpv.656.sroa.3.0.cast.2037.sroa_idx1 = getelementptr inbounds i8, ptr %key2, i64 40
  %tmpv.656.sroa.3.0.copyload = load i64, ptr %tmpv.656.sroa.3.0.cast.2037.sroa_idx1, align 8
  %icmp.527 = icmp eq i64 %tmpv.654.sroa.3.0.copyload, %tmpv.656.sroa.3.0.copyload
  br i1 %icmp.527, label %then.465, label %then.462

then.465:                                         ; preds = %else.463
  %icmp.528 = icmp eq ptr %tmpv.654.sroa.0.0.copyload, %tmpv.656.sroa.0.0.copyload
  br i1 %icmp.528, label %then.462, label %else.466

else.466:                                         ; preds = %then.465
  %bcmp = call i32 @bcmp(ptr %tmpv.654.sroa.0.0.copyload, ptr %tmpv.656.sroa.0.0.copyload, i64 %tmpv.654.sroa.3.0.copyload)
  %icmp.529 = icmp eq i32 %bcmp, 0
  %phi.cast = zext i1 %icmp.529 to i8
  br label %then.462
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

define { ptr, ptr } @go_0llvm.DNAME.copy(ptr nest nocapture readnone %nest.10, ptr readonly %rr) #0 {
entry:
  %tmpv.20 = alloca %RR_Header.0, align 8
  %tmpv.22 = alloca { ptr, i64 }, align 8
  %tmpv.25 = alloca %DNAME.0, align 8, !go_addrtaken !3
  %icmp.14 = icmp eq ptr %rr, null
  br i1 %icmp.14, label %then.11, label %else.11, !make.implicit !3

then.11:                                          ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.11:                                          ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %tmpv.20, ptr noundef nonnull align 8 dereferenceable(32) %rr, i64 32, i1 false)
  %field.17 = getelementptr inbounds %DNAME.0, ptr %rr, i64 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %tmpv.22, ptr noundef nonnull align 8 dereferenceable(16) %field.17, i64 16, i1 false)
  %call.3 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.DNAME..d)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %tmpv.25, ptr noundef nonnull align 8 dereferenceable(32) %tmpv.20, i64 32, i1 false)
  %field.19 = getelementptr inbounds %DNAME.0, ptr %tmpv.25, i64 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %field.19, ptr noundef nonnull align 8 dereferenceable(16) %tmpv.22, i64 16, i1 false)
  %deref.ld.3 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.16 = icmp eq i32 %deref.ld.3, 0
  br i1 %icmp.16, label %then.13, label %else.13

then.13:                                          ; preds = %else.11
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(48) %call.3, ptr noundef nonnull align 8 dereferenceable(48) %tmpv.25, i64 48, i1 false)
  br label %fallthrough.13

fallthrough.13:                                   ; preds = %else.13, %then.13
  %ld.1.fca.1.insert = insertvalue { ptr, ptr } { ptr @pimt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.DNAME, ptr undef }, ptr %call.3, 1
  ret { ptr, ptr } %ld.1.fca.1.insert

else.13:                                          ; preds = %else.11
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.DNAME..d, ptr nonnull %call.3, ptr nonnull %tmpv.25)
  br label %fallthrough.13
}

define i8 @go_0llvm.CNAME..eq(ptr nest nocapture readnone %nest.76, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.531 = icmp eq ptr %key1, null
  br i1 %icmp.531, label %then.469, label %else.469, !make.implicit !3

then.469:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.469:                                         ; preds = %entry
  %tmpv.662.sroa.0.0.copyload = load ptr, ptr %key1, align 8
  %tmpv.662.sroa.3.0.cast.2042.sroa_idx20 = getelementptr inbounds i8, ptr %key1, i64 16
  %tmpv.662.sroa.3.0.copyload = load i16, ptr %tmpv.662.sroa.3.0.cast.2042.sroa_idx20, align 8
  %tmpv.662.sroa.5.0.cast.2042.sroa_idx21 = getelementptr inbounds i8, ptr %key1, i64 18
  %tmpv.662.sroa.5.0.copyload = load i16, ptr %tmpv.662.sroa.5.0.cast.2042.sroa_idx21, align 2
  %tmpv.662.sroa.6.0.cast.2042.sroa_idx22 = getelementptr inbounds i8, ptr %key1, i64 20
  %tmpv.662.sroa.6.0.copyload = load i32, ptr %tmpv.662.sroa.6.0.cast.2042.sroa_idx22, align 4
  %tmpv.662.sroa.7.0.cast.2042.sroa_idx23 = getelementptr inbounds i8, ptr %key1, i64 24
  %tmpv.662.sroa.7.0.copyload = load i16, ptr %tmpv.662.sroa.7.0.cast.2042.sroa_idx23, align 8
  %icmp.532 = icmp eq ptr %key2, null
  br i1 %icmp.532, label %then.470, label %else.470, !make.implicit !3

then.470:                                         ; preds = %else.469
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.470:                                         ; preds = %else.469
  %tmpv.662.sroa.2.0.cast.2042.sroa_idx19 = getelementptr inbounds i8, ptr %key1, i64 8
  %tmpv.662.sroa.2.0.copyload = load i64, ptr %tmpv.662.sroa.2.0.cast.2042.sroa_idx19, align 8
  %tmpv.663.sroa.0.0.copyload = load ptr, ptr %key2, align 8
  %tmpv.663.sroa.2.0.cast.2047.sroa_idx14 = getelementptr inbounds i8, ptr %key2, i64 8
  %tmpv.663.sroa.2.0.copyload = load i64, ptr %tmpv.663.sroa.2.0.cast.2047.sroa_idx14, align 8
  %tmpv.663.sroa.3.0.cast.2047.sroa_idx15 = getelementptr inbounds i8, ptr %key2, i64 16
  %tmpv.663.sroa.3.0.copyload = load i16, ptr %tmpv.663.sroa.3.0.cast.2047.sroa_idx15, align 8
  %tmpv.663.sroa.5.0.cast.2047.sroa_idx16 = getelementptr inbounds i8, ptr %key2, i64 18
  %tmpv.663.sroa.5.0.copyload = load i16, ptr %tmpv.663.sroa.5.0.cast.2047.sroa_idx16, align 2
  %tmpv.663.sroa.6.0.cast.2047.sroa_idx17 = getelementptr inbounds i8, ptr %key2, i64 20
  %tmpv.663.sroa.6.0.copyload = load i32, ptr %tmpv.663.sroa.6.0.cast.2047.sroa_idx17, align 4
  %tmpv.663.sroa.7.0.cast.2047.sroa_idx18 = getelementptr inbounds i8, ptr %key2, i64 24
  %tmpv.663.sroa.7.0.copyload = load i16, ptr %tmpv.663.sroa.7.0.cast.2047.sroa_idx18, align 8
  %icmp.533 = icmp eq i64 %tmpv.662.sroa.2.0.copyload, %tmpv.663.sroa.2.0.copyload
  br i1 %icmp.533, label %then.471, label %fallthrough.471

then.471:                                         ; preds = %else.470
  %icmp.534 = icmp eq ptr %tmpv.662.sroa.0.0.copyload, %tmpv.663.sroa.0.0.copyload
  br i1 %icmp.534, label %fallthrough.471, label %else.472

fallthrough.471:                                  ; preds = %else.472, %then.471, %else.470
  %tmpv.672.0 = phi i1 [ false, %else.470 ], [ %icmp.535, %else.472 ], [ true, %then.471 ]
  %icmp.537 = icmp eq i16 %tmpv.662.sroa.3.0.copyload, %tmpv.663.sroa.3.0.copyload
  %spec.select = select i1 %tmpv.672.0, i1 %icmp.537, i1 false
  %icmp.538 = icmp eq i16 %tmpv.662.sroa.5.0.copyload, %tmpv.663.sroa.5.0.copyload
  %tmpv.674.0.in = select i1 %spec.select, i1 %icmp.538, i1 false
  %icmp.539 = icmp eq i32 %tmpv.662.sroa.6.0.copyload, %tmpv.663.sroa.6.0.copyload
  %spec.select26 = select i1 %tmpv.674.0.in, i1 %icmp.539, i1 false
  %icmp.540 = icmp eq i16 %tmpv.662.sroa.7.0.copyload, %tmpv.663.sroa.7.0.copyload
  %tmpv.676.0.in = select i1 %spec.select26, i1 %icmp.540, i1 false
  br i1 %tmpv.676.0.in, label %else.478, label %then.477

else.472:                                         ; preds = %then.471
  %bcmp1 = call i32 @bcmp(ptr %tmpv.662.sroa.0.0.copyload, ptr %tmpv.663.sroa.0.0.copyload, i64 %tmpv.662.sroa.2.0.copyload)
  %icmp.535 = icmp eq i32 %bcmp1, 0
  br label %fallthrough.471

then.477:                                         ; preds = %else.481, %then.480, %else.478, %fallthrough.471
  %merge = phi i8 [ 0, %fallthrough.471 ], [ 0, %else.478 ], [ %phi.cast, %else.481 ], [ 1, %then.480 ]
  ret i8 %merge

else.478:                                         ; preds = %fallthrough.471
  %tmpv.677.sroa.0.0.cast.2056.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 32
  %tmpv.677.sroa.0.0.copyload = load ptr, ptr %tmpv.677.sroa.0.0.cast.2056.sroa_idx, align 8
  %tmpv.677.sroa.3.0.cast.2056.sroa_idx3 = getelementptr inbounds i8, ptr %key1, i64 40
  %tmpv.677.sroa.3.0.copyload = load i64, ptr %tmpv.677.sroa.3.0.cast.2056.sroa_idx3, align 8
  %tmpv.679.sroa.0.0.cast.2059.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 32
  %tmpv.679.sroa.0.0.copyload = load ptr, ptr %tmpv.679.sroa.0.0.cast.2059.sroa_idx, align 8
  %tmpv.679.sroa.3.0.cast.2059.sroa_idx1 = getelementptr inbounds i8, ptr %key2, i64 40
  %tmpv.679.sroa.3.0.copyload = load i64, ptr %tmpv.679.sroa.3.0.cast.2059.sroa_idx1, align 8
  %icmp.544 = icmp eq i64 %tmpv.677.sroa.3.0.copyload, %tmpv.679.sroa.3.0.copyload
  br i1 %icmp.544, label %then.480, label %then.477

then.480:                                         ; preds = %else.478
  %icmp.545 = icmp eq ptr %tmpv.677.sroa.0.0.copyload, %tmpv.679.sroa.0.0.copyload
  br i1 %icmp.545, label %then.477, label %else.481

else.481:                                         ; preds = %then.480
  %bcmp = call i32 @bcmp(ptr %tmpv.677.sroa.0.0.copyload, ptr %tmpv.679.sroa.0.0.copyload, i64 %tmpv.677.sroa.3.0.copyload)
  %icmp.546 = icmp eq i32 %bcmp, 0
  %phi.cast = zext i1 %icmp.546 to i8
  br label %then.477
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

define { ptr, ptr } @go_0llvm.CNAME.copy(ptr nest nocapture readnone %nest.9, ptr readonly %rr) #0 {
entry:
  %tmpv.14 = alloca %RR_Header.0, align 8
  %tmpv.16 = alloca { ptr, i64 }, align 8
  %tmpv.19 = alloca %CNAME.0, align 8, !go_addrtaken !3
  %icmp.11 = icmp eq ptr %rr, null
  br i1 %icmp.11, label %then.8, label %else.8, !make.implicit !3

then.8:                                           ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.8:                                           ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %tmpv.14, ptr noundef nonnull align 8 dereferenceable(32) %rr, i64 32, i1 false)
  %field.11 = getelementptr inbounds %CNAME.0, ptr %rr, i64 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %tmpv.16, ptr noundef nonnull align 8 dereferenceable(16) %field.11, i64 16, i1 false)
  %call.2 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.CNAME..d)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %tmpv.19, ptr noundef nonnull align 8 dereferenceable(32) %tmpv.14, i64 32, i1 false)
  %field.13 = getelementptr inbounds %CNAME.0, ptr %tmpv.19, i64 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %field.13, ptr noundef nonnull align 8 dereferenceable(16) %tmpv.16, i64 16, i1 false)
  %deref.ld.2 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.13 = icmp eq i32 %deref.ld.2, 0
  br i1 %icmp.13, label %then.10, label %else.10

then.10:                                          ; preds = %else.8
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(48) %call.2, ptr noundef nonnull align 8 dereferenceable(48) %tmpv.19, i64 48, i1 false)
  br label %fallthrough.10

fallthrough.10:                                   ; preds = %else.10, %then.10
  %ld.0.fca.1.insert = insertvalue { ptr, ptr } { ptr @pimt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.CNAME, ptr undef }, ptr %call.2, 1
  ret { ptr, ptr } %ld.0.fca.1.insert

else.10:                                          ; preds = %else.8
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.CNAME..d, ptr nonnull %call.2, ptr nonnull %tmpv.19)
  br label %fallthrough.10
}

define i8 @go_0llvm.SRV..eq(ptr nest nocapture readnone %nest.77, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.548 = icmp eq ptr %key1, null
  br i1 %icmp.548, label %then.484, label %else.484, !make.implicit !3

then.484:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.484:                                         ; preds = %entry
  %tmpv.685.sroa.0.0.copyload = load ptr, ptr %key1, align 8
  %tmpv.685.sroa.3.0.cast.2064.sroa_idx20 = getelementptr inbounds i8, ptr %key1, i64 16
  %tmpv.685.sroa.3.0.copyload = load i16, ptr %tmpv.685.sroa.3.0.cast.2064.sroa_idx20, align 8
  %tmpv.685.sroa.5.0.cast.2064.sroa_idx21 = getelementptr inbounds i8, ptr %key1, i64 18
  %tmpv.685.sroa.5.0.copyload = load i16, ptr %tmpv.685.sroa.5.0.cast.2064.sroa_idx21, align 2
  %tmpv.685.sroa.6.0.cast.2064.sroa_idx22 = getelementptr inbounds i8, ptr %key1, i64 20
  %tmpv.685.sroa.6.0.copyload = load i32, ptr %tmpv.685.sroa.6.0.cast.2064.sroa_idx22, align 4
  %tmpv.685.sroa.7.0.cast.2064.sroa_idx23 = getelementptr inbounds i8, ptr %key1, i64 24
  %tmpv.685.sroa.7.0.copyload = load i16, ptr %tmpv.685.sroa.7.0.cast.2064.sroa_idx23, align 8
  %icmp.549 = icmp eq ptr %key2, null
  br i1 %icmp.549, label %then.485, label %else.485, !make.implicit !3

then.485:                                         ; preds = %else.484
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.485:                                         ; preds = %else.484
  %tmpv.685.sroa.2.0.cast.2064.sroa_idx19 = getelementptr inbounds i8, ptr %key1, i64 8
  %tmpv.685.sroa.2.0.copyload = load i64, ptr %tmpv.685.sroa.2.0.cast.2064.sroa_idx19, align 8
  %tmpv.686.sroa.0.0.copyload = load ptr, ptr %key2, align 8
  %tmpv.686.sroa.2.0.cast.2069.sroa_idx14 = getelementptr inbounds i8, ptr %key2, i64 8
  %tmpv.686.sroa.2.0.copyload = load i64, ptr %tmpv.686.sroa.2.0.cast.2069.sroa_idx14, align 8
  %tmpv.686.sroa.3.0.cast.2069.sroa_idx15 = getelementptr inbounds i8, ptr %key2, i64 16
  %tmpv.686.sroa.3.0.copyload = load i16, ptr %tmpv.686.sroa.3.0.cast.2069.sroa_idx15, align 8
  %tmpv.686.sroa.5.0.cast.2069.sroa_idx16 = getelementptr inbounds i8, ptr %key2, i64 18
  %tmpv.686.sroa.5.0.copyload = load i16, ptr %tmpv.686.sroa.5.0.cast.2069.sroa_idx16, align 2
  %tmpv.686.sroa.6.0.cast.2069.sroa_idx17 = getelementptr inbounds i8, ptr %key2, i64 20
  %tmpv.686.sroa.6.0.copyload = load i32, ptr %tmpv.686.sroa.6.0.cast.2069.sroa_idx17, align 4
  %tmpv.686.sroa.7.0.cast.2069.sroa_idx18 = getelementptr inbounds i8, ptr %key2, i64 24
  %tmpv.686.sroa.7.0.copyload = load i16, ptr %tmpv.686.sroa.7.0.cast.2069.sroa_idx18, align 8
  %icmp.550 = icmp eq i64 %tmpv.685.sroa.2.0.copyload, %tmpv.686.sroa.2.0.copyload
  br i1 %icmp.550, label %then.486, label %fallthrough.486

then.486:                                         ; preds = %else.485
  %icmp.551 = icmp eq ptr %tmpv.685.sroa.0.0.copyload, %tmpv.686.sroa.0.0.copyload
  br i1 %icmp.551, label %fallthrough.486, label %else.487

fallthrough.486:                                  ; preds = %else.487, %then.486, %else.485
  %tmpv.695.0 = phi i1 [ false, %else.485 ], [ %icmp.552, %else.487 ], [ true, %then.486 ]
  %icmp.554 = icmp eq i16 %tmpv.685.sroa.3.0.copyload, %tmpv.686.sroa.3.0.copyload
  %spec.select = select i1 %tmpv.695.0, i1 %icmp.554, i1 false
  %icmp.555 = icmp eq i16 %tmpv.685.sroa.5.0.copyload, %tmpv.686.sroa.5.0.copyload
  %tmpv.697.0.in = select i1 %spec.select, i1 %icmp.555, i1 false
  %icmp.556 = icmp eq i32 %tmpv.685.sroa.6.0.copyload, %tmpv.686.sroa.6.0.copyload
  %spec.select29 = select i1 %tmpv.697.0.in, i1 %icmp.556, i1 false
  %icmp.557 = icmp eq i16 %tmpv.685.sroa.7.0.copyload, %tmpv.686.sroa.7.0.copyload
  %tmpv.699.0.in = select i1 %spec.select29, i1 %icmp.557, i1 false
  br i1 %tmpv.699.0.in, label %else.494, label %then.492

else.487:                                         ; preds = %then.486
  %bcmp1 = call i32 @bcmp(ptr %tmpv.685.sroa.0.0.copyload, ptr %tmpv.686.sroa.0.0.copyload, i64 %tmpv.685.sroa.2.0.copyload)
  %icmp.552 = icmp eq i32 %bcmp1, 0
  br label %fallthrough.486

then.492:                                         ; preds = %else.505, %then.504, %else.502, %else.500, %else.497, %else.494, %fallthrough.486
  %merge = phi i8 [ 0, %else.500 ], [ 0, %else.497 ], [ 0, %else.494 ], [ 0, %fallthrough.486 ], [ 0, %else.502 ], [ %phi.cast, %else.505 ], [ 1, %then.504 ]
  ret i8 %merge

else.494:                                         ; preds = %fallthrough.486
  %field.771 = getelementptr inbounds i8, ptr %key1, i64 32
  %.field.ld.141 = load i16, ptr %field.771, align 2
  %field.772 = getelementptr inbounds i8, ptr %key2, i64 32
  %.field.ld.142 = load i16, ptr %field.772, align 2
  %icmp.561.not = icmp eq i16 %.field.ld.141, %.field.ld.142
  br i1 %icmp.561.not, label %else.497, label %then.492

else.497:                                         ; preds = %else.494
  %field.773 = getelementptr inbounds i8, ptr %key1, i64 34
  %.field.ld.143 = load i16, ptr %field.773, align 2
  %field.774 = getelementptr inbounds i8, ptr %key2, i64 34
  %.field.ld.144 = load i16, ptr %field.774, align 2
  %icmp.564.not = icmp eq i16 %.field.ld.143, %.field.ld.144
  br i1 %icmp.564.not, label %else.500, label %then.492

else.500:                                         ; preds = %else.497
  %field.775 = getelementptr inbounds i8, ptr %key1, i64 36
  %.field.ld.145 = load i16, ptr %field.775, align 2
  %field.776 = getelementptr inbounds i8, ptr %key2, i64 36
  %.field.ld.146 = load i16, ptr %field.776, align 2
  %icmp.567.not = icmp eq i16 %.field.ld.145, %.field.ld.146
  br i1 %icmp.567.not, label %else.502, label %then.492

else.502:                                         ; preds = %else.500
  %tmpv.706.sroa.0.0.cast.2084.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 40
  %tmpv.706.sroa.0.0.copyload = load ptr, ptr %tmpv.706.sroa.0.0.cast.2084.sroa_idx, align 8
  %tmpv.706.sroa.3.0.cast.2084.sroa_idx3 = getelementptr inbounds i8, ptr %key1, i64 48
  %tmpv.706.sroa.3.0.copyload = load i64, ptr %tmpv.706.sroa.3.0.cast.2084.sroa_idx3, align 8
  %tmpv.708.sroa.0.0.cast.2087.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 40
  %tmpv.708.sroa.0.0.copyload = load ptr, ptr %tmpv.708.sroa.0.0.cast.2087.sroa_idx, align 8
  %tmpv.708.sroa.3.0.cast.2087.sroa_idx1 = getelementptr inbounds i8, ptr %key2, i64 48
  %tmpv.708.sroa.3.0.copyload = load i64, ptr %tmpv.708.sroa.3.0.cast.2087.sroa_idx1, align 8
  %icmp.570 = icmp eq i64 %tmpv.706.sroa.3.0.copyload, %tmpv.708.sroa.3.0.copyload
  br i1 %icmp.570, label %then.504, label %then.492

then.504:                                         ; preds = %else.502
  %icmp.571 = icmp eq ptr %tmpv.706.sroa.0.0.copyload, %tmpv.708.sroa.0.0.copyload
  br i1 %icmp.571, label %then.492, label %else.505

else.505:                                         ; preds = %then.504
  %bcmp = call i32 @bcmp(ptr %tmpv.706.sroa.0.0.copyload, ptr %tmpv.708.sroa.0.0.copyload, i64 %tmpv.706.sroa.3.0.copyload)
  %icmp.572 = icmp eq i32 %bcmp, 0
  %phi.cast = zext i1 %icmp.572 to i8
  br label %then.492
}

define ptr @go_0llvm.SRV.Header(ptr nest nocapture readnone %nest.8, ptr readnone returned %rr) #0 {
entry:
  %icmp.10 = icmp eq ptr %rr, null
  br i1 %icmp.10, label %then.7, label %else.7, !make.implicit !3

then.7:                                           ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.7:                                           ; preds = %entry
  ret ptr %rr
}

define { ptr, ptr } @go_0llvm.SRV.copy(ptr nest nocapture readnone %nest.16, ptr readonly %rr) #0 {
entry:
  %tmpv.103 = alloca %RR_Header.0, align 8
  %tmpv.111 = alloca { ptr, i64 }, align 8
  %tmpv.114 = alloca %SRV.0, align 8, !go_addrtaken !3
  %icmp.57 = icmp eq ptr %rr, null
  br i1 %icmp.57, label %then.52, label %else.52, !make.implicit !3

then.52:                                          ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.52:                                          ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %tmpv.103, ptr noundef nonnull align 8 dereferenceable(32) %rr, i64 32, i1 false)
  %field.104 = getelementptr inbounds %SRV.0, ptr %rr, i64 0, i32 1
  %.field.ld.14 = load i16, ptr %field.104, align 2
  %field.105 = getelementptr inbounds %SRV.0, ptr %rr, i64 0, i32 2
  %.field.ld.15 = load i16, ptr %field.105, align 2
  %field.106 = getelementptr inbounds %SRV.0, ptr %rr, i64 0, i32 3
  %.field.ld.16 = load i16, ptr %field.106, align 2
  %field.107 = getelementptr inbounds %SRV.0, ptr %rr, i64 0, i32 4
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %tmpv.111, ptr noundef nonnull align 8 dereferenceable(16) %field.107, i64 16, i1 false)
  %call.11 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.SRV..d)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %tmpv.114, ptr noundef nonnull align 8 dereferenceable(32) %tmpv.103, i64 32, i1 false)
  %field.109 = getelementptr inbounds %SRV.0, ptr %tmpv.114, i64 0, i32 1
  store i16 %.field.ld.14, ptr %field.109, align 8
  %field.110 = getelementptr inbounds %SRV.0, ptr %tmpv.114, i64 0, i32 2
  store i16 %.field.ld.15, ptr %field.110, align 2
  %field.111 = getelementptr inbounds %SRV.0, ptr %tmpv.114, i64 0, i32 3
  store i16 %.field.ld.16, ptr %field.111, align 4
  %field.112 = getelementptr inbounds %SRV.0, ptr %tmpv.114, i64 0, i32 4
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %field.112, ptr noundef nonnull align 8 dereferenceable(16) %tmpv.111, i64 16, i1 false)
  %deref.ld.10 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.62 = icmp eq i32 %deref.ld.10, 0
  br i1 %icmp.62, label %then.57, label %else.57

then.57:                                          ; preds = %else.52
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(56) %call.11, ptr noundef nonnull align 8 dereferenceable(56) %tmpv.114, i64 56, i1 false)
  br label %fallthrough.57

fallthrough.57:                                   ; preds = %else.57, %then.57
  %ld.7.fca.1.insert = insertvalue { ptr, ptr } { ptr @pimt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.SRV, ptr undef }, ptr %call.11, 1
  ret { ptr, ptr } %ld.7.fca.1.insert

else.57:                                          ; preds = %else.52
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.SRV..d, ptr nonnull %call.11, ptr nonnull %tmpv.114)
  br label %fallthrough.57
}

define i8 @go_0llvm.MX..eq(ptr nest nocapture readnone %nest.78, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.574 = icmp eq ptr %key1, null
  br i1 %icmp.574, label %then.508, label %else.508, !make.implicit !3

then.508:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.508:                                         ; preds = %entry
  %tmpv.714.sroa.0.0.copyload = load ptr, ptr %key1, align 8
  %tmpv.714.sroa.3.0.cast.2092.sroa_idx20 = getelementptr inbounds i8, ptr %key1, i64 16
  %tmpv.714.sroa.3.0.copyload = load i16, ptr %tmpv.714.sroa.3.0.cast.2092.sroa_idx20, align 8
  %tmpv.714.sroa.5.0.cast.2092.sroa_idx21 = getelementptr inbounds i8, ptr %key1, i64 18
  %tmpv.714.sroa.5.0.copyload = load i16, ptr %tmpv.714.sroa.5.0.cast.2092.sroa_idx21, align 2
  %tmpv.714.sroa.6.0.cast.2092.sroa_idx22 = getelementptr inbounds i8, ptr %key1, i64 20
  %tmpv.714.sroa.6.0.copyload = load i32, ptr %tmpv.714.sroa.6.0.cast.2092.sroa_idx22, align 4
  %tmpv.714.sroa.7.0.cast.2092.sroa_idx23 = getelementptr inbounds i8, ptr %key1, i64 24
  %tmpv.714.sroa.7.0.copyload = load i16, ptr %tmpv.714.sroa.7.0.cast.2092.sroa_idx23, align 8
  %icmp.575 = icmp eq ptr %key2, null
  br i1 %icmp.575, label %then.509, label %else.509, !make.implicit !3

then.509:                                         ; preds = %else.508
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.509:                                         ; preds = %else.508
  %tmpv.714.sroa.2.0.cast.2092.sroa_idx19 = getelementptr inbounds i8, ptr %key1, i64 8
  %tmpv.714.sroa.2.0.copyload = load i64, ptr %tmpv.714.sroa.2.0.cast.2092.sroa_idx19, align 8
  %tmpv.715.sroa.0.0.copyload = load ptr, ptr %key2, align 8
  %tmpv.715.sroa.2.0.cast.2097.sroa_idx14 = getelementptr inbounds i8, ptr %key2, i64 8
  %tmpv.715.sroa.2.0.copyload = load i64, ptr %tmpv.715.sroa.2.0.cast.2097.sroa_idx14, align 8
  %tmpv.715.sroa.3.0.cast.2097.sroa_idx15 = getelementptr inbounds i8, ptr %key2, i64 16
  %tmpv.715.sroa.3.0.copyload = load i16, ptr %tmpv.715.sroa.3.0.cast.2097.sroa_idx15, align 8
  %tmpv.715.sroa.5.0.cast.2097.sroa_idx16 = getelementptr inbounds i8, ptr %key2, i64 18
  %tmpv.715.sroa.5.0.copyload = load i16, ptr %tmpv.715.sroa.5.0.cast.2097.sroa_idx16, align 2
  %tmpv.715.sroa.6.0.cast.2097.sroa_idx17 = getelementptr inbounds i8, ptr %key2, i64 20
  %tmpv.715.sroa.6.0.copyload = load i32, ptr %tmpv.715.sroa.6.0.cast.2097.sroa_idx17, align 4
  %tmpv.715.sroa.7.0.cast.2097.sroa_idx18 = getelementptr inbounds i8, ptr %key2, i64 24
  %tmpv.715.sroa.7.0.copyload = load i16, ptr %tmpv.715.sroa.7.0.cast.2097.sroa_idx18, align 8
  %icmp.576 = icmp eq i64 %tmpv.714.sroa.2.0.copyload, %tmpv.715.sroa.2.0.copyload
  br i1 %icmp.576, label %then.510, label %fallthrough.510

then.510:                                         ; preds = %else.509
  %icmp.577 = icmp eq ptr %tmpv.714.sroa.0.0.copyload, %tmpv.715.sroa.0.0.copyload
  br i1 %icmp.577, label %fallthrough.510, label %else.511

fallthrough.510:                                  ; preds = %else.511, %then.510, %else.509
  %tmpv.724.0 = phi i1 [ false, %else.509 ], [ %icmp.578, %else.511 ], [ true, %then.510 ]
  %icmp.580 = icmp eq i16 %tmpv.714.sroa.3.0.copyload, %tmpv.715.sroa.3.0.copyload
  %spec.select = select i1 %tmpv.724.0, i1 %icmp.580, i1 false
  %icmp.581 = icmp eq i16 %tmpv.714.sroa.5.0.copyload, %tmpv.715.sroa.5.0.copyload
  %tmpv.726.0.in = select i1 %spec.select, i1 %icmp.581, i1 false
  %icmp.582 = icmp eq i32 %tmpv.714.sroa.6.0.copyload, %tmpv.715.sroa.6.0.copyload
  %spec.select27 = select i1 %tmpv.726.0.in, i1 %icmp.582, i1 false
  %icmp.583 = icmp eq i16 %tmpv.714.sroa.7.0.copyload, %tmpv.715.sroa.7.0.copyload
  %tmpv.728.0.in = select i1 %spec.select27, i1 %icmp.583, i1 false
  br i1 %tmpv.728.0.in, label %else.518, label %then.516

else.511:                                         ; preds = %then.510
  %bcmp1 = call i32 @bcmp(ptr %tmpv.714.sroa.0.0.copyload, ptr %tmpv.715.sroa.0.0.copyload, i64 %tmpv.714.sroa.2.0.copyload)
  %icmp.578 = icmp eq i32 %bcmp1, 0
  br label %fallthrough.510

then.516:                                         ; preds = %else.523, %then.522, %else.520, %else.518, %fallthrough.510
  %merge = phi i8 [ 0, %else.518 ], [ 0, %fallthrough.510 ], [ 0, %else.520 ], [ %phi.cast, %else.523 ], [ 1, %then.522 ]
  ret i8 %merge

else.518:                                         ; preds = %fallthrough.510
  %field.805 = getelementptr inbounds i8, ptr %key1, i64 32
  %.field.ld.147 = load i16, ptr %field.805, align 2
  %field.806 = getelementptr inbounds i8, ptr %key2, i64 32
  %.field.ld.148 = load i16, ptr %field.806, align 2
  %icmp.587.not = icmp eq i16 %.field.ld.147, %.field.ld.148
  br i1 %icmp.587.not, label %else.520, label %then.516

else.520:                                         ; preds = %else.518
  %tmpv.731.sroa.0.0.cast.2108.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 40
  %tmpv.731.sroa.0.0.copyload = load ptr, ptr %tmpv.731.sroa.0.0.cast.2108.sroa_idx, align 8
  %tmpv.731.sroa.3.0.cast.2108.sroa_idx3 = getelementptr inbounds i8, ptr %key1, i64 48
  %tmpv.731.sroa.3.0.copyload = load i64, ptr %tmpv.731.sroa.3.0.cast.2108.sroa_idx3, align 8
  %tmpv.733.sroa.0.0.cast.2111.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 40
  %tmpv.733.sroa.0.0.copyload = load ptr, ptr %tmpv.733.sroa.0.0.cast.2111.sroa_idx, align 8
  %tmpv.733.sroa.3.0.cast.2111.sroa_idx1 = getelementptr inbounds i8, ptr %key2, i64 48
  %tmpv.733.sroa.3.0.copyload = load i64, ptr %tmpv.733.sroa.3.0.cast.2111.sroa_idx1, align 8
  %icmp.590 = icmp eq i64 %tmpv.731.sroa.3.0.copyload, %tmpv.733.sroa.3.0.copyload
  br i1 %icmp.590, label %then.522, label %then.516

then.522:                                         ; preds = %else.520
  %icmp.591 = icmp eq ptr %tmpv.731.sroa.0.0.copyload, %tmpv.733.sroa.0.0.copyload
  br i1 %icmp.591, label %then.516, label %else.523

else.523:                                         ; preds = %then.522
  %bcmp = call i32 @bcmp(ptr %tmpv.731.sroa.0.0.copyload, ptr %tmpv.733.sroa.0.0.copyload, i64 %tmpv.731.sroa.3.0.copyload)
  %icmp.592 = icmp eq i32 %bcmp, 0
  %phi.cast = zext i1 %icmp.592 to i8
  br label %then.516
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

define { ptr, ptr } @go_0llvm.MX.copy(ptr nest nocapture readnone %nest.11, ptr readonly %rr) #0 {
entry:
  %tmpv.26 = alloca %RR_Header.0, align 8
  %tmpv.30 = alloca { ptr, i64 }, align 8
  %tmpv.33 = alloca %MX.0, align 8, !go_addrtaken !3
  %icmp.17 = icmp eq ptr %rr, null
  br i1 %icmp.17, label %then.14, label %else.14, !make.implicit !3

then.14:                                          ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.14:                                          ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %tmpv.26, ptr noundef nonnull align 8 dereferenceable(32) %rr, i64 32, i1 false)
  %field.23 = getelementptr inbounds %MX.0, ptr %rr, i64 0, i32 1
  %.field.ld.0 = load i16, ptr %field.23, align 2
  %field.24 = getelementptr inbounds %MX.0, ptr %rr, i64 0, i32 2
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %tmpv.30, ptr noundef nonnull align 8 dereferenceable(16) %field.24, i64 16, i1 false)
  %call.4 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.MX..d)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %tmpv.33, ptr noundef nonnull align 8 dereferenceable(32) %tmpv.26, i64 32, i1 false)
  %field.26 = getelementptr inbounds %MX.0, ptr %tmpv.33, i64 0, i32 1
  store i16 %.field.ld.0, ptr %field.26, align 8
  %field.27 = getelementptr inbounds %MX.0, ptr %tmpv.33, i64 0, i32 2
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %field.27, ptr noundef nonnull align 8 dereferenceable(16) %tmpv.30, i64 16, i1 false)
  %deref.ld.4 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.20 = icmp eq i32 %deref.ld.4, 0
  br i1 %icmp.20, label %then.17, label %else.17

then.17:                                          ; preds = %else.14
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(56) %call.4, ptr noundef nonnull align 8 dereferenceable(56) %tmpv.33, i64 56, i1 false)
  br label %fallthrough.17

fallthrough.17:                                   ; preds = %else.17, %then.17
  %ld.2.fca.1.insert = insertvalue { ptr, ptr } { ptr @pimt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.MX, ptr undef }, ptr %call.4, 1
  ret { ptr, ptr } %ld.2.fca.1.insert

else.17:                                          ; preds = %else.14
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.MX..d, ptr nonnull %call.4, ptr nonnull %tmpv.33)
  br label %fallthrough.17
}

define i8 @go_0llvm.NS..eq(ptr nest nocapture readnone %nest.79, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.594 = icmp eq ptr %key1, null
  br i1 %icmp.594, label %then.526, label %else.526, !make.implicit !3

then.526:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.526:                                         ; preds = %entry
  %tmpv.739.sroa.0.0.copyload = load ptr, ptr %key1, align 8
  %tmpv.739.sroa.3.0.cast.2116.sroa_idx20 = getelementptr inbounds i8, ptr %key1, i64 16
  %tmpv.739.sroa.3.0.copyload = load i16, ptr %tmpv.739.sroa.3.0.cast.2116.sroa_idx20, align 8
  %tmpv.739.sroa.5.0.cast.2116.sroa_idx21 = getelementptr inbounds i8, ptr %key1, i64 18
  %tmpv.739.sroa.5.0.copyload = load i16, ptr %tmpv.739.sroa.5.0.cast.2116.sroa_idx21, align 2
  %tmpv.739.sroa.6.0.cast.2116.sroa_idx22 = getelementptr inbounds i8, ptr %key1, i64 20
  %tmpv.739.sroa.6.0.copyload = load i32, ptr %tmpv.739.sroa.6.0.cast.2116.sroa_idx22, align 4
  %tmpv.739.sroa.7.0.cast.2116.sroa_idx23 = getelementptr inbounds i8, ptr %key1, i64 24
  %tmpv.739.sroa.7.0.copyload = load i16, ptr %tmpv.739.sroa.7.0.cast.2116.sroa_idx23, align 8
  %icmp.595 = icmp eq ptr %key2, null
  br i1 %icmp.595, label %then.527, label %else.527, !make.implicit !3

then.527:                                         ; preds = %else.526
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.527:                                         ; preds = %else.526
  %tmpv.739.sroa.2.0.cast.2116.sroa_idx19 = getelementptr inbounds i8, ptr %key1, i64 8
  %tmpv.739.sroa.2.0.copyload = load i64, ptr %tmpv.739.sroa.2.0.cast.2116.sroa_idx19, align 8
  %tmpv.740.sroa.0.0.copyload = load ptr, ptr %key2, align 8
  %tmpv.740.sroa.2.0.cast.2121.sroa_idx14 = getelementptr inbounds i8, ptr %key2, i64 8
  %tmpv.740.sroa.2.0.copyload = load i64, ptr %tmpv.740.sroa.2.0.cast.2121.sroa_idx14, align 8
  %tmpv.740.sroa.3.0.cast.2121.sroa_idx15 = getelementptr inbounds i8, ptr %key2, i64 16
  %tmpv.740.sroa.3.0.copyload = load i16, ptr %tmpv.740.sroa.3.0.cast.2121.sroa_idx15, align 8
  %tmpv.740.sroa.5.0.cast.2121.sroa_idx16 = getelementptr inbounds i8, ptr %key2, i64 18
  %tmpv.740.sroa.5.0.copyload = load i16, ptr %tmpv.740.sroa.5.0.cast.2121.sroa_idx16, align 2
  %tmpv.740.sroa.6.0.cast.2121.sroa_idx17 = getelementptr inbounds i8, ptr %key2, i64 20
  %tmpv.740.sroa.6.0.copyload = load i32, ptr %tmpv.740.sroa.6.0.cast.2121.sroa_idx17, align 4
  %tmpv.740.sroa.7.0.cast.2121.sroa_idx18 = getelementptr inbounds i8, ptr %key2, i64 24
  %tmpv.740.sroa.7.0.copyload = load i16, ptr %tmpv.740.sroa.7.0.cast.2121.sroa_idx18, align 8
  %icmp.596 = icmp eq i64 %tmpv.739.sroa.2.0.copyload, %tmpv.740.sroa.2.0.copyload
  br i1 %icmp.596, label %then.528, label %fallthrough.528

then.528:                                         ; preds = %else.527
  %icmp.597 = icmp eq ptr %tmpv.739.sroa.0.0.copyload, %tmpv.740.sroa.0.0.copyload
  br i1 %icmp.597, label %fallthrough.528, label %else.529

fallthrough.528:                                  ; preds = %else.529, %then.528, %else.527
  %tmpv.749.0 = phi i1 [ false, %else.527 ], [ %icmp.598, %else.529 ], [ true, %then.528 ]
  %icmp.600 = icmp eq i16 %tmpv.739.sroa.3.0.copyload, %tmpv.740.sroa.3.0.copyload
  %spec.select = select i1 %tmpv.749.0, i1 %icmp.600, i1 false
  %icmp.601 = icmp eq i16 %tmpv.739.sroa.5.0.copyload, %tmpv.740.sroa.5.0.copyload
  %tmpv.751.0.in = select i1 %spec.select, i1 %icmp.601, i1 false
  %icmp.602 = icmp eq i32 %tmpv.739.sroa.6.0.copyload, %tmpv.740.sroa.6.0.copyload
  %spec.select26 = select i1 %tmpv.751.0.in, i1 %icmp.602, i1 false
  %icmp.603 = icmp eq i16 %tmpv.739.sroa.7.0.copyload, %tmpv.740.sroa.7.0.copyload
  %tmpv.753.0.in = select i1 %spec.select26, i1 %icmp.603, i1 false
  br i1 %tmpv.753.0.in, label %else.535, label %then.534

else.529:                                         ; preds = %then.528
  %bcmp1 = call i32 @bcmp(ptr %tmpv.739.sroa.0.0.copyload, ptr %tmpv.740.sroa.0.0.copyload, i64 %tmpv.739.sroa.2.0.copyload)
  %icmp.598 = icmp eq i32 %bcmp1, 0
  br label %fallthrough.528

then.534:                                         ; preds = %else.538, %then.537, %else.535, %fallthrough.528
  %merge = phi i8 [ 0, %fallthrough.528 ], [ 0, %else.535 ], [ %phi.cast, %else.538 ], [ 1, %then.537 ]
  ret i8 %merge

else.535:                                         ; preds = %fallthrough.528
  %tmpv.754.sroa.0.0.cast.2130.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 32
  %tmpv.754.sroa.0.0.copyload = load ptr, ptr %tmpv.754.sroa.0.0.cast.2130.sroa_idx, align 8
  %tmpv.754.sroa.3.0.cast.2130.sroa_idx3 = getelementptr inbounds i8, ptr %key1, i64 40
  %tmpv.754.sroa.3.0.copyload = load i64, ptr %tmpv.754.sroa.3.0.cast.2130.sroa_idx3, align 8
  %tmpv.756.sroa.0.0.cast.2133.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 32
  %tmpv.756.sroa.0.0.copyload = load ptr, ptr %tmpv.756.sroa.0.0.cast.2133.sroa_idx, align 8
  %tmpv.756.sroa.3.0.cast.2133.sroa_idx1 = getelementptr inbounds i8, ptr %key2, i64 40
  %tmpv.756.sroa.3.0.copyload = load i64, ptr %tmpv.756.sroa.3.0.cast.2133.sroa_idx1, align 8
  %icmp.607 = icmp eq i64 %tmpv.754.sroa.3.0.copyload, %tmpv.756.sroa.3.0.copyload
  br i1 %icmp.607, label %then.537, label %then.534

then.537:                                         ; preds = %else.535
  %icmp.608 = icmp eq ptr %tmpv.754.sroa.0.0.copyload, %tmpv.756.sroa.0.0.copyload
  br i1 %icmp.608, label %then.534, label %else.538

else.538:                                         ; preds = %then.537
  %bcmp = call i32 @bcmp(ptr %tmpv.754.sroa.0.0.copyload, ptr %tmpv.756.sroa.0.0.copyload, i64 %tmpv.754.sroa.3.0.copyload)
  %icmp.609 = icmp eq i32 %bcmp, 0
  %phi.cast = zext i1 %icmp.609 to i8
  br label %then.534
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

define { ptr, ptr } @go_0llvm.NS.copy(ptr nest nocapture readnone %nest.12, ptr readonly %rr) #0 {
entry:
  %tmpv.34 = alloca %RR_Header.0, align 8
  %tmpv.36 = alloca { ptr, i64 }, align 8
  %tmpv.39 = alloca %NS.0, align 8, !go_addrtaken !3
  %icmp.21 = icmp eq ptr %rr, null
  br i1 %icmp.21, label %then.18, label %else.18, !make.implicit !3

then.18:                                          ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.18:                                          ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %tmpv.34, ptr noundef nonnull align 8 dereferenceable(32) %rr, i64 32, i1 false)
  %field.31 = getelementptr inbounds %NS.0, ptr %rr, i64 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %tmpv.36, ptr noundef nonnull align 8 dereferenceable(16) %field.31, i64 16, i1 false)
  %call.5 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.NS..d)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %tmpv.39, ptr noundef nonnull align 8 dereferenceable(32) %tmpv.34, i64 32, i1 false)
  %field.33 = getelementptr inbounds %NS.0, ptr %tmpv.39, i64 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %field.33, ptr noundef nonnull align 8 dereferenceable(16) %tmpv.36, i64 16, i1 false)
  %deref.ld.5 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.23 = icmp eq i32 %deref.ld.5, 0
  br i1 %icmp.23, label %then.20, label %else.20

then.20:                                          ; preds = %else.18
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(48) %call.5, ptr noundef nonnull align 8 dereferenceable(48) %tmpv.39, i64 48, i1 false)
  br label %fallthrough.20

fallthrough.20:                                   ; preds = %else.20, %then.20
  %ld.3.fca.1.insert = insertvalue { ptr, ptr } { ptr @pimt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.NS, ptr undef }, ptr %call.5, 1
  ret { ptr, ptr } %ld.3.fca.1.insert

else.20:                                          ; preds = %else.18
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.NS..d, ptr nonnull %call.5, ptr nonnull %tmpv.39)
  br label %fallthrough.20
}

define i8 @go_0llvm.RRSIG..eq(ptr nest nocapture readnone %nest.80, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.611 = icmp eq ptr %key1, null
  br i1 %icmp.611, label %then.541, label %else.541, !make.implicit !3

then.541:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.541:                                         ; preds = %entry
  %tmpv.762.sroa.0.0.copyload = load ptr, ptr %key1, align 8
  %tmpv.762.sroa.3.0.cast.2138.sroa_idx23 = getelementptr inbounds i8, ptr %key1, i64 16
  %tmpv.762.sroa.3.0.copyload = load i16, ptr %tmpv.762.sroa.3.0.cast.2138.sroa_idx23, align 8
  %tmpv.762.sroa.5.0.cast.2138.sroa_idx24 = getelementptr inbounds i8, ptr %key1, i64 18
  %tmpv.762.sroa.5.0.copyload = load i16, ptr %tmpv.762.sroa.5.0.cast.2138.sroa_idx24, align 2
  %tmpv.762.sroa.6.0.cast.2138.sroa_idx25 = getelementptr inbounds i8, ptr %key1, i64 20
  %tmpv.762.sroa.6.0.copyload = load i32, ptr %tmpv.762.sroa.6.0.cast.2138.sroa_idx25, align 4
  %tmpv.762.sroa.7.0.cast.2138.sroa_idx26 = getelementptr inbounds i8, ptr %key1, i64 24
  %tmpv.762.sroa.7.0.copyload = load i16, ptr %tmpv.762.sroa.7.0.cast.2138.sroa_idx26, align 8
  %icmp.612 = icmp eq ptr %key2, null
  br i1 %icmp.612, label %then.542, label %else.542, !make.implicit !3

then.542:                                         ; preds = %else.541
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.542:                                         ; preds = %else.541
  %tmpv.762.sroa.2.0.cast.2138.sroa_idx22 = getelementptr inbounds i8, ptr %key1, i64 8
  %tmpv.762.sroa.2.0.copyload = load i64, ptr %tmpv.762.sroa.2.0.cast.2138.sroa_idx22, align 8
  %tmpv.763.sroa.0.0.copyload = load ptr, ptr %key2, align 8
  %tmpv.763.sroa.2.0.cast.2143.sroa_idx17 = getelementptr inbounds i8, ptr %key2, i64 8
  %tmpv.763.sroa.2.0.copyload = load i64, ptr %tmpv.763.sroa.2.0.cast.2143.sroa_idx17, align 8
  %tmpv.763.sroa.3.0.cast.2143.sroa_idx18 = getelementptr inbounds i8, ptr %key2, i64 16
  %tmpv.763.sroa.3.0.copyload = load i16, ptr %tmpv.763.sroa.3.0.cast.2143.sroa_idx18, align 8
  %tmpv.763.sroa.5.0.cast.2143.sroa_idx19 = getelementptr inbounds i8, ptr %key2, i64 18
  %tmpv.763.sroa.5.0.copyload = load i16, ptr %tmpv.763.sroa.5.0.cast.2143.sroa_idx19, align 2
  %tmpv.763.sroa.6.0.cast.2143.sroa_idx20 = getelementptr inbounds i8, ptr %key2, i64 20
  %tmpv.763.sroa.6.0.copyload = load i32, ptr %tmpv.763.sroa.6.0.cast.2143.sroa_idx20, align 4
  %tmpv.763.sroa.7.0.cast.2143.sroa_idx21 = getelementptr inbounds i8, ptr %key2, i64 24
  %tmpv.763.sroa.7.0.copyload = load i16, ptr %tmpv.763.sroa.7.0.cast.2143.sroa_idx21, align 8
  %icmp.613 = icmp eq i64 %tmpv.762.sroa.2.0.copyload, %tmpv.763.sroa.2.0.copyload
  br i1 %icmp.613, label %then.543, label %fallthrough.543

then.543:                                         ; preds = %else.542
  %icmp.614 = icmp eq ptr %tmpv.762.sroa.0.0.copyload, %tmpv.763.sroa.0.0.copyload
  br i1 %icmp.614, label %fallthrough.543, label %else.544

fallthrough.543:                                  ; preds = %else.544, %then.543, %else.542
  %tmpv.772.0 = phi i1 [ false, %else.542 ], [ %icmp.615, %else.544 ], [ true, %then.543 ]
  %icmp.617 = icmp eq i16 %tmpv.762.sroa.3.0.copyload, %tmpv.763.sroa.3.0.copyload
  %spec.select = select i1 %tmpv.772.0, i1 %icmp.617, i1 false
  %icmp.618 = icmp eq i16 %tmpv.762.sroa.5.0.copyload, %tmpv.763.sroa.5.0.copyload
  %tmpv.774.0.in = select i1 %spec.select, i1 %icmp.618, i1 false
  %icmp.619 = icmp eq i32 %tmpv.762.sroa.6.0.copyload, %tmpv.763.sroa.6.0.copyload
  %spec.select37 = select i1 %tmpv.774.0.in, i1 %icmp.619, i1 false
  %icmp.620 = icmp eq i16 %tmpv.762.sroa.7.0.copyload, %tmpv.763.sroa.7.0.copyload
  %tmpv.776.0.in = select i1 %spec.select37, i1 %icmp.620, i1 false
  br i1 %tmpv.776.0.in, label %else.551, label %then.549

else.544:                                         ; preds = %then.543
  %bcmp2 = call i32 @bcmp(ptr %tmpv.762.sroa.0.0.copyload, ptr %tmpv.763.sroa.0.0.copyload, i64 %tmpv.762.sroa.2.0.copyload)
  %icmp.615 = icmp eq i32 %bcmp2, 0
  br label %fallthrough.543

then.549:                                         ; preds = %else.579, %then.578, %else.576, %else.574, %else.571, %else.569, %else.566, %else.563, %else.560, %else.557, %else.554, %else.551, %fallthrough.543
  %merge = phi i8 [ 0, %else.574 ], [ 0, %else.569 ], [ 0, %else.566 ], [ 0, %else.563 ], [ 0, %else.560 ], [ 0, %else.557 ], [ 0, %else.554 ], [ 0, %else.551 ], [ 0, %fallthrough.543 ], [ 0, %else.576 ], [ %phi.cast, %else.579 ], [ 1, %then.578 ], [ 0, %else.571 ]
  ret i8 %merge

else.551:                                         ; preds = %fallthrough.543
  %field.863 = getelementptr inbounds i8, ptr %key1, i64 32
  %.field.ld.149 = load i16, ptr %field.863, align 2
  %field.864 = getelementptr inbounds i8, ptr %key2, i64 32
  %.field.ld.150 = load i16, ptr %field.864, align 2
  %icmp.624.not = icmp eq i16 %.field.ld.149, %.field.ld.150
  br i1 %icmp.624.not, label %else.554, label %then.549

else.554:                                         ; preds = %else.551
  %0 = getelementptr inbounds i8, ptr %key1, i64 34
  %.field.ld.151 = load i8, ptr %0, align 1
  %1 = getelementptr inbounds i8, ptr %key2, i64 34
  %.field.ld.152 = load i8, ptr %1, align 1
  %icmp.627.not = icmp eq i8 %.field.ld.151, %.field.ld.152
  br i1 %icmp.627.not, label %else.557, label %then.549

else.557:                                         ; preds = %else.554
  %2 = getelementptr inbounds i8, ptr %key1, i64 35
  %.field.ld.153 = load i8, ptr %2, align 1
  %3 = getelementptr inbounds i8, ptr %key2, i64 35
  %.field.ld.154 = load i8, ptr %3, align 1
  %icmp.630.not = icmp eq i8 %.field.ld.153, %.field.ld.154
  br i1 %icmp.630.not, label %else.560, label %then.549

else.560:                                         ; preds = %else.557
  %field.869 = getelementptr inbounds i8, ptr %key1, i64 36
  %.field.ld.155 = load i32, ptr %field.869, align 4
  %field.870 = getelementptr inbounds i8, ptr %key2, i64 36
  %.field.ld.156 = load i32, ptr %field.870, align 4
  %icmp.633.not = icmp eq i32 %.field.ld.155, %.field.ld.156
  br i1 %icmp.633.not, label %else.563, label %then.549

else.563:                                         ; preds = %else.560
  %field.871 = getelementptr inbounds i8, ptr %key1, i64 40
  %.field.ld.157 = load i32, ptr %field.871, align 4
  %field.872 = getelementptr inbounds i8, ptr %key2, i64 40
  %.field.ld.158 = load i32, ptr %field.872, align 4
  %icmp.636.not = icmp eq i32 %.field.ld.157, %.field.ld.158
  br i1 %icmp.636.not, label %else.566, label %then.549

else.566:                                         ; preds = %else.563
  %field.873 = getelementptr inbounds i8, ptr %key1, i64 44
  %.field.ld.159 = load i32, ptr %field.873, align 4
  %field.874 = getelementptr inbounds i8, ptr %key2, i64 44
  %.field.ld.160 = load i32, ptr %field.874, align 4
  %icmp.639.not = icmp eq i32 %.field.ld.159, %.field.ld.160
  br i1 %icmp.639.not, label %else.569, label %then.549

else.569:                                         ; preds = %else.566
  %field.875 = getelementptr inbounds i8, ptr %key1, i64 48
  %.field.ld.161 = load i16, ptr %field.875, align 2
  %field.876 = getelementptr inbounds i8, ptr %key2, i64 48
  %.field.ld.162 = load i16, ptr %field.876, align 2
  %icmp.642.not = icmp eq i16 %.field.ld.161, %.field.ld.162
  br i1 %icmp.642.not, label %else.571, label %then.549

else.571:                                         ; preds = %else.569
  %tmpv.791.sroa.0.0.cast.2166.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 56
  %tmpv.791.sroa.0.0.copyload = load ptr, ptr %tmpv.791.sroa.0.0.cast.2166.sroa_idx, align 8
  %tmpv.791.sroa.3.0.cast.2166.sroa_idx6 = getelementptr inbounds i8, ptr %key1, i64 64
  %tmpv.791.sroa.3.0.copyload = load i64, ptr %tmpv.791.sroa.3.0.cast.2166.sroa_idx6, align 8
  %tmpv.793.sroa.0.0.cast.2169.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 56
  %tmpv.793.sroa.0.0.copyload = load ptr, ptr %tmpv.793.sroa.0.0.cast.2169.sroa_idx, align 8
  %tmpv.793.sroa.3.0.cast.2169.sroa_idx4 = getelementptr inbounds i8, ptr %key2, i64 64
  %tmpv.793.sroa.3.0.copyload = load i64, ptr %tmpv.793.sroa.3.0.cast.2169.sroa_idx4, align 8
  %icmp.645 = icmp eq i64 %tmpv.791.sroa.3.0.copyload, %tmpv.793.sroa.3.0.copyload
  br i1 %icmp.645, label %then.573, label %then.549

then.573:                                         ; preds = %else.571
  %icmp.646 = icmp eq ptr %tmpv.791.sroa.0.0.copyload, %tmpv.793.sroa.0.0.copyload
  br i1 %icmp.646, label %else.576, label %else.574

else.574:                                         ; preds = %then.573
  %bcmp = call i32 @bcmp(ptr %tmpv.791.sroa.0.0.copyload, ptr %tmpv.793.sroa.0.0.copyload, i64 %tmpv.791.sroa.3.0.copyload)
  %icmp.647 = icmp eq i32 %bcmp, 0
  br i1 %icmp.647, label %else.576, label %then.549

else.576:                                         ; preds = %else.574, %then.573
  %tmpv.797.sroa.0.0.cast.2172.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 72
  %tmpv.797.sroa.0.0.copyload = load ptr, ptr %tmpv.797.sroa.0.0.cast.2172.sroa_idx, align 8
  %tmpv.797.sroa.3.0.cast.2172.sroa_idx3 = getelementptr inbounds i8, ptr %key1, i64 80
  %tmpv.797.sroa.3.0.copyload = load i64, ptr %tmpv.797.sroa.3.0.cast.2172.sroa_idx3, align 8
  %tmpv.799.sroa.0.0.cast.2175.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 72
  %tmpv.799.sroa.0.0.copyload = load ptr, ptr %tmpv.799.sroa.0.0.cast.2175.sroa_idx, align 8
  %tmpv.799.sroa.3.0.cast.2175.sroa_idx1 = getelementptr inbounds i8, ptr %key2, i64 80
  %tmpv.799.sroa.3.0.copyload = load i64, ptr %tmpv.799.sroa.3.0.cast.2175.sroa_idx1, align 8
  %icmp.651 = icmp eq i64 %tmpv.797.sroa.3.0.copyload, %tmpv.799.sroa.3.0.copyload
  br i1 %icmp.651, label %then.578, label %then.549

then.578:                                         ; preds = %else.576
  %icmp.652 = icmp eq ptr %tmpv.797.sroa.0.0.copyload, %tmpv.799.sroa.0.0.copyload
  br i1 %icmp.652, label %then.549, label %else.579

else.579:                                         ; preds = %then.578
  %bcmp1 = call i32 @bcmp(ptr %tmpv.797.sroa.0.0.copyload, ptr %tmpv.799.sroa.0.0.copyload, i64 %tmpv.797.sroa.3.0.copyload)
  %icmp.653 = icmp eq i32 %bcmp1, 0
  %phi.cast = zext i1 %icmp.653 to i8
  br label %then.549
}

define ptr @go_0llvm.RRSIG.Header(ptr nest nocapture readnone %nest.6, ptr readnone returned %rr) #0 {
entry:
  %icmp.8 = icmp eq ptr %rr, null
  br i1 %icmp.8, label %then.5, label %else.5, !make.implicit !3

then.5:                                           ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.5:                                           ; preds = %entry
  ret ptr %rr
}

define { ptr, ptr } @go_0llvm.RRSIG.copy(ptr nest nocapture readnone %nest.14, ptr readonly %rr) #0 {
entry:
  %tmpv.63 = alloca %RR_Header.0, align 8
  %tmpv.79 = alloca { ptr, i64 }, align 8
  %tmpv.81 = alloca { ptr, i64 }, align 8
  %tmpv.84 = alloca %RRSIG.0, align 8, !go_addrtaken !3
  %icmp.37 = icmp eq ptr %rr, null
  br i1 %icmp.37, label %then.32, label %else.32, !make.implicit !3

then.32:                                          ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.32:                                          ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %tmpv.63, ptr noundef nonnull align 8 dereferenceable(32) %rr, i64 32, i1 false)
  %field.64 = getelementptr inbounds %RRSIG.0, ptr %rr, i64 0, i32 1
  %.field.ld.2 = load i16, ptr %field.64, align 2
  %field.65 = getelementptr inbounds %RRSIG.0, ptr %rr, i64 0, i32 2
  %.field.ld.3 = load i8, ptr %field.65, align 1
  %field.66 = getelementptr inbounds %RRSIG.0, ptr %rr, i64 0, i32 3
  %.field.ld.4 = load i8, ptr %field.66, align 1
  %field.67 = getelementptr inbounds %RRSIG.0, ptr %rr, i64 0, i32 4
  %.field.ld.5 = load i32, ptr %field.67, align 4
  %field.68 = getelementptr inbounds %RRSIG.0, ptr %rr, i64 0, i32 5
  %.field.ld.6 = load i32, ptr %field.68, align 4
  %field.69 = getelementptr inbounds %RRSIG.0, ptr %rr, i64 0, i32 6
  %.field.ld.7 = load i32, ptr %field.69, align 4
  %field.70 = getelementptr inbounds %RRSIG.0, ptr %rr, i64 0, i32 7
  %.field.ld.8 = load i16, ptr %field.70, align 2
  %field.71 = getelementptr inbounds %RRSIG.0, ptr %rr, i64 0, i32 8
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %tmpv.79, ptr noundef nonnull align 8 dereferenceable(16) %field.71, i64 16, i1 false)
  %field.72 = getelementptr inbounds %RRSIG.0, ptr %rr, i64 0, i32 9
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %tmpv.81, ptr noundef nonnull align 8 dereferenceable(16) %field.72, i64 16, i1 false)
  %call.9 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.RRSIG..d)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %tmpv.84, ptr noundef nonnull align 8 dereferenceable(32) %tmpv.63, i64 32, i1 false)
  %field.74 = getelementptr inbounds %RRSIG.0, ptr %tmpv.84, i64 0, i32 1
  store i16 %.field.ld.2, ptr %field.74, align 8
  %field.75 = getelementptr inbounds %RRSIG.0, ptr %tmpv.84, i64 0, i32 2
  store i8 %.field.ld.3, ptr %field.75, align 2
  %field.76 = getelementptr inbounds %RRSIG.0, ptr %tmpv.84, i64 0, i32 3
  store i8 %.field.ld.4, ptr %field.76, align 1
  %field.77 = getelementptr inbounds %RRSIG.0, ptr %tmpv.84, i64 0, i32 4
  store i32 %.field.ld.5, ptr %field.77, align 4
  %field.78 = getelementptr inbounds %RRSIG.0, ptr %tmpv.84, i64 0, i32 5
  store i32 %.field.ld.6, ptr %field.78, align 8
  %field.79 = getelementptr inbounds %RRSIG.0, ptr %tmpv.84, i64 0, i32 6
  store i32 %.field.ld.7, ptr %field.79, align 4
  %field.80 = getelementptr inbounds %RRSIG.0, ptr %tmpv.84, i64 0, i32 7
  store i16 %.field.ld.8, ptr %field.80, align 8
  %field.81 = getelementptr inbounds %RRSIG.0, ptr %tmpv.84, i64 0, i32 8
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %field.81, ptr noundef nonnull align 8 dereferenceable(16) %tmpv.79, i64 16, i1 false)
  %field.82 = getelementptr inbounds %RRSIG.0, ptr %tmpv.84, i64 0, i32 9
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %field.82, ptr noundef nonnull align 8 dereferenceable(16) %tmpv.81, i64 16, i1 false)
  %deref.ld.8 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.47 = icmp eq i32 %deref.ld.8, 0
  br i1 %icmp.47, label %then.42, label %else.42

then.42:                                          ; preds = %else.32
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(88) %call.9, ptr noundef nonnull align 8 dereferenceable(88) %tmpv.84, i64 88, i1 false)
  br label %fallthrough.42

fallthrough.42:                                   ; preds = %else.42, %then.42
  %ld.5.fca.1.insert = insertvalue { ptr, ptr } { ptr @pimt..interface_4Header_bfunc_8_9_8_2go_0llvm_0RR__Header_9_cgo_0llvm_0copy_bfunc_8_9_8go_0llvm_0RR_9_5..go_0llvm.RRSIG, ptr undef }, ptr %call.9, 1
  ret { ptr, ptr } %ld.5.fca.1.insert

else.42:                                          ; preds = %else.32
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.RRSIG..d, ptr nonnull %call.9, ptr nonnull %tmpv.84)
  br label %fallthrough.42
}

define i8 @go_0llvm.MsgHdr..eq(ptr nest nocapture readnone %nest.67, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.338 = icmp eq ptr %key1, null
  br i1 %icmp.338, label %then.288, label %else.288, !make.implicit !3

then.288:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.288:                                         ; preds = %entry
  %icmp.339 = icmp eq ptr %key2, null
  br i1 %icmp.339, label %then.289, label %else.289, !make.implicit !3

then.289:                                         ; preds = %else.288
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.289:                                         ; preds = %else.288
  %.field.ld.77 = load i16, ptr %key1, align 2
  %.field.ld.78 = load i16, ptr %key2, align 2
  %icmp.340.not = icmp eq i16 %.field.ld.77, %.field.ld.78
  br i1 %icmp.340.not, label %else.292, label %common.ret

common.ret:                                       ; preds = %else.289, %else.292, %else.295, %else.298, %else.301, %else.304, %else.307, %else.310, %else.313, %else.316, %else.319
  %common.ret.op = phi i8 [ %spec.select, %else.319 ], [ 0, %else.316 ], [ 0, %else.313 ], [ 0, %else.310 ], [ 0, %else.307 ], [ 0, %else.304 ], [ 0, %else.301 ], [ 0, %else.298 ], [ 0, %else.295 ], [ 0, %else.292 ], [ 0, %else.289 ]
  ret i8 %common.ret.op

else.292:                                         ; preds = %else.289
  %0 = getelementptr inbounds i8, ptr %key1, i64 2
  %.field.ld.79 = load i8, ptr %0, align 1
  %1 = getelementptr inbounds i8, ptr %key2, i64 2
  %.field.ld.80 = load i8, ptr %1, align 1
  %icmp.343.not = icmp eq i8 %.field.ld.79, %.field.ld.80
  br i1 %icmp.343.not, label %else.295, label %common.ret

else.295:                                         ; preds = %else.292
  %field.521 = getelementptr inbounds i8, ptr %key1, i64 8
  %.field.ld.81 = load i64, ptr %field.521, align 8
  %field.522 = getelementptr inbounds i8, ptr %key2, i64 8
  %.field.ld.82 = load i64, ptr %field.522, align 8
  %icmp.346.not = icmp eq i64 %.field.ld.81, %.field.ld.82
  br i1 %icmp.346.not, label %else.298, label %common.ret

else.298:                                         ; preds = %else.295
  %2 = getelementptr inbounds i8, ptr %key1, i64 16
  %.field.ld.83 = load i8, ptr %2, align 1
  %3 = getelementptr inbounds i8, ptr %key2, i64 16
  %.field.ld.84 = load i8, ptr %3, align 1
  %icmp.349.not = icmp eq i8 %.field.ld.83, %.field.ld.84
  br i1 %icmp.349.not, label %else.301, label %common.ret

else.301:                                         ; preds = %else.298
  %4 = getelementptr inbounds i8, ptr %key1, i64 17
  %.field.ld.85 = load i8, ptr %4, align 1
  %5 = getelementptr inbounds i8, ptr %key2, i64 17
  %.field.ld.86 = load i8, ptr %5, align 1
  %icmp.352.not = icmp eq i8 %.field.ld.85, %.field.ld.86
  br i1 %icmp.352.not, label %else.304, label %common.ret

else.304:                                         ; preds = %else.301
  %6 = getelementptr inbounds i8, ptr %key1, i64 18
  %.field.ld.87 = load i8, ptr %6, align 1
  %7 = getelementptr inbounds i8, ptr %key2, i64 18
  %.field.ld.88 = load i8, ptr %7, align 1
  %icmp.355.not = icmp eq i8 %.field.ld.87, %.field.ld.88
  br i1 %icmp.355.not, label %else.307, label %common.ret

else.307:                                         ; preds = %else.304
  %8 = getelementptr inbounds i8, ptr %key1, i64 19
  %.field.ld.89 = load i8, ptr %8, align 1
  %9 = getelementptr inbounds i8, ptr %key2, i64 19
  %.field.ld.90 = load i8, ptr %9, align 1
  %icmp.358.not = icmp eq i8 %.field.ld.89, %.field.ld.90
  br i1 %icmp.358.not, label %else.310, label %common.ret

else.310:                                         ; preds = %else.307
  %10 = getelementptr inbounds i8, ptr %key1, i64 20
  %.field.ld.91 = load i8, ptr %10, align 1
  %11 = getelementptr inbounds i8, ptr %key2, i64 20
  %.field.ld.92 = load i8, ptr %11, align 1
  %icmp.361.not = icmp eq i8 %.field.ld.91, %.field.ld.92
  br i1 %icmp.361.not, label %else.313, label %common.ret

else.313:                                         ; preds = %else.310
  %12 = getelementptr inbounds i8, ptr %key1, i64 21
  %.field.ld.93 = load i8, ptr %12, align 1
  %13 = getelementptr inbounds i8, ptr %key2, i64 21
  %.field.ld.94 = load i8, ptr %13, align 1
  %icmp.364.not = icmp eq i8 %.field.ld.93, %.field.ld.94
  br i1 %icmp.364.not, label %else.316, label %common.ret

else.316:                                         ; preds = %else.313
  %14 = getelementptr inbounds i8, ptr %key1, i64 22
  %.field.ld.95 = load i8, ptr %14, align 1
  %15 = getelementptr inbounds i8, ptr %key2, i64 22
  %.field.ld.96 = load i8, ptr %15, align 1
  %icmp.367.not = icmp eq i8 %.field.ld.95, %.field.ld.96
  br i1 %icmp.367.not, label %else.319, label %common.ret

else.319:                                         ; preds = %else.316
  %field.537 = getelementptr inbounds i8, ptr %key1, i64 24
  %.field.ld.97 = load i64, ptr %field.537, align 8
  %field.538 = getelementptr inbounds i8, ptr %key2, i64 24
  %.field.ld.98 = load i64, ptr %field.538, align 8
  %icmp.370.not = icmp eq i64 %.field.ld.97, %.field.ld.98
  %spec.select = zext i1 %icmp.370.not to i8
  br label %common.ret
}

define i8 @go_0llvm.Question..eq(ptr nest nocapture readnone %nest.68, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.371 = icmp eq ptr %key1, null
  br i1 %icmp.371, label %then.321, label %else.321, !make.implicit !3

then.321:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.321:                                         ; preds = %entry
  %tmpv.502.sroa.0.0.copyload = load ptr, ptr %key1, align 8
  %icmp.372 = icmp eq ptr %key2, null
  br i1 %icmp.372, label %then.322, label %else.322, !make.implicit !3

then.322:                                         ; preds = %else.321
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.322:                                         ; preds = %else.321
  %tmpv.502.sroa.3.0.cast.1872.sroa_idx3 = getelementptr inbounds i8, ptr %key1, i64 8
  %tmpv.502.sroa.3.0.copyload = load i64, ptr %tmpv.502.sroa.3.0.cast.1872.sroa_idx3, align 8
  %tmpv.504.sroa.0.0.copyload = load ptr, ptr %key2, align 8
  %tmpv.504.sroa.3.0.cast.1875.sroa_idx1 = getelementptr inbounds i8, ptr %key2, i64 8
  %tmpv.504.sroa.3.0.copyload = load i64, ptr %tmpv.504.sroa.3.0.cast.1875.sroa_idx1, align 8
  %icmp.373 = icmp eq i64 %tmpv.502.sroa.3.0.copyload, %tmpv.504.sroa.3.0.copyload
  br i1 %icmp.373, label %then.323, label %common.ret

then.323:                                         ; preds = %else.322
  %icmp.374 = icmp eq ptr %tmpv.502.sroa.0.0.copyload, %tmpv.504.sroa.0.0.copyload
  br i1 %icmp.374, label %else.327, label %else.324

else.324:                                         ; preds = %then.323
  %bcmp = call i32 @bcmp(ptr %tmpv.502.sroa.0.0.copyload, ptr %tmpv.504.sroa.0.0.copyload, i64 %tmpv.502.sroa.3.0.copyload)
  %icmp.375 = icmp eq i32 %bcmp, 0
  br i1 %icmp.375, label %else.327, label %common.ret

common.ret:                                       ; preds = %else.322, %else.324, %else.327, %else.330
  %common.ret.op = phi i8 [ %spec.select, %else.330 ], [ 0, %else.327 ], [ 0, %else.324 ], [ 0, %else.322 ]
  ret i8 %common.ret.op

else.327:                                         ; preds = %else.324, %then.323
  %field.548 = getelementptr inbounds i8, ptr %key1, i64 16
  %.field.ld.99 = load i16, ptr %field.548, align 2
  %field.549 = getelementptr inbounds i8, ptr %key2, i64 16
  %.field.ld.100 = load i16, ptr %field.549, align 2
  %icmp.379.not = icmp eq i16 %.field.ld.99, %.field.ld.100
  br i1 %icmp.379.not, label %else.330, label %common.ret

else.330:                                         ; preds = %else.327
  %field.550 = getelementptr inbounds i8, ptr %key1, i64 18
  %.field.ld.101 = load i16, ptr %field.550, align 2
  %field.551 = getelementptr inbounds i8, ptr %key2, i64 18
  %.field.ld.102 = load i16, ptr %field.551, align 2
  %icmp.382.not = icmp eq i16 %.field.ld.101, %.field.ld.102
  %spec.select = zext i1 %icmp.382.not to i8
  br label %common.ret
}

define i8 @go_0llvm.Request..eq(ptr nest nocapture readnone %nest.70, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.401 = icmp eq ptr %key1, null
  br i1 %icmp.401, label %then.349, label %else.349, !make.implicit !3

then.349:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.349:                                         ; preds = %entry
  %icmp.402 = icmp eq ptr %key2, null
  br i1 %icmp.402, label %then.350, label %else.350, !make.implicit !3

then.350:                                         ; preds = %else.349
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.350:                                         ; preds = %else.349
  %.field.ld.111 = load ptr, ptr %key1, align 8
  %.field.ld.112 = load ptr, ptr %key2, align 8
  %icmp.403.not = icmp eq ptr %.field.ld.111, %.field.ld.112
  br i1 %icmp.403.not, label %else.353, label %then.351

then.351:                                         ; preds = %else.392, %then.391, %else.389, %else.387, %else.384, %else.382, %else.379, %else.377, %else.374, %else.372, %else.369, %else.367, %else.364, %else.361, %else.358, %else.355, %else.353, %else.350
  %merge = phi i8 [ 0, %else.387 ], [ 0, %else.382 ], [ 0, %else.377 ], [ 0, %else.372 ], [ 0, %else.367 ], [ 0, %else.364 ], [ 0, %else.361 ], [ 0, %else.358 ], [ 0, %else.353 ], [ 0, %else.350 ], [ 0, %else.389 ], [ %phi.cast, %else.392 ], [ 1, %then.391 ], [ 0, %else.355 ], [ 0, %else.369 ], [ 0, %else.374 ], [ 0, %else.379 ], [ 0, %else.384 ]
  ret i8 %merge

else.353:                                         ; preds = %else.350
  %field.571 = getelementptr inbounds i8, ptr %key1, i64 8
  %field.572 = getelementptr inbounds i8, ptr %key2, i64 8
  %ld.68 = load ptr, ptr %field.571, align 8
  %field1.33 = getelementptr inbounds i8, ptr %key1, i64 16
  %ld.69 = load ptr, ptr %field1.33, align 8
  %ld.70 = load ptr, ptr %field.572, align 8
  %field1.34 = getelementptr inbounds i8, ptr %key2, i64 16
  %ld.71 = load ptr, ptr %field1.34, align 8
  %call.73 = call i8 @runtime.ifaceeq(ptr nest undef, ptr %ld.68, ptr %ld.69, ptr %ld.70, ptr %ld.71)
  %icmp.406.not = icmp eq i8 %call.73, 1
  br i1 %icmp.406.not, label %else.355, label %then.351

else.355:                                         ; preds = %else.353
  %tmpv.534.sroa.0.0.cast.1908.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 24
  %tmpv.534.sroa.0.0.copyload = load ptr, ptr %tmpv.534.sroa.0.0.cast.1908.sroa_idx, align 8
  %tmpv.534.sroa.3.0.cast.1908.sroa_idx18 = getelementptr inbounds i8, ptr %key1, i64 32
  %tmpv.534.sroa.3.0.copyload = load i64, ptr %tmpv.534.sroa.3.0.cast.1908.sroa_idx18, align 8
  %tmpv.536.sroa.0.0.cast.1911.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 24
  %tmpv.536.sroa.0.0.copyload = load ptr, ptr %tmpv.536.sroa.0.0.cast.1911.sroa_idx, align 8
  %tmpv.536.sroa.3.0.cast.1911.sroa_idx16 = getelementptr inbounds i8, ptr %key2, i64 32
  %tmpv.536.sroa.3.0.copyload = load i64, ptr %tmpv.536.sroa.3.0.cast.1911.sroa_idx16, align 8
  %icmp.409 = icmp eq i64 %tmpv.534.sroa.3.0.copyload, %tmpv.536.sroa.3.0.copyload
  br i1 %icmp.409, label %then.357, label %then.351

then.357:                                         ; preds = %else.355
  %icmp.410 = icmp eq ptr %tmpv.534.sroa.0.0.copyload, %tmpv.536.sroa.0.0.copyload
  br i1 %icmp.410, label %else.361, label %else.358

else.358:                                         ; preds = %then.357
  %bcmp = call i32 @bcmp(ptr %tmpv.534.sroa.0.0.copyload, ptr %tmpv.536.sroa.0.0.copyload, i64 %tmpv.534.sroa.3.0.copyload)
  %icmp.411 = icmp eq i32 %bcmp, 0
  br i1 %icmp.411, label %else.361, label %then.351

else.361:                                         ; preds = %else.358, %then.357
  %field.582 = getelementptr inbounds i8, ptr %key1, i64 40
  %.field.ld.113 = load i16, ptr %field.582, align 2
  %field.583 = getelementptr inbounds i8, ptr %key2, i64 40
  %.field.ld.114 = load i16, ptr %field.583, align 2
  %icmp.415.not = icmp eq i16 %.field.ld.113, %.field.ld.114
  br i1 %icmp.415.not, label %else.364, label %then.351

else.364:                                         ; preds = %else.361
  %0 = getelementptr inbounds i8, ptr %key1, i64 42
  %.field.ld.115 = load i8, ptr %0, align 1
  %1 = getelementptr inbounds i8, ptr %key2, i64 42
  %.field.ld.116 = load i8, ptr %1, align 1
  %icmp.418.not = icmp eq i8 %.field.ld.115, %.field.ld.116
  br i1 %icmp.418.not, label %else.367, label %then.351

else.367:                                         ; preds = %else.364
  %2 = getelementptr inbounds i8, ptr %key1, i64 43
  %.field.ld.117 = load i8, ptr %2, align 1
  %3 = getelementptr inbounds i8, ptr %key2, i64 43
  %.field.ld.118 = load i8, ptr %3, align 1
  %icmp.421.not = icmp eq i8 %.field.ld.117, %.field.ld.118
  br i1 %icmp.421.not, label %else.369, label %then.351

else.369:                                         ; preds = %else.367
  %tmpv.546.sroa.0.0.cast.1920.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 48
  %tmpv.546.sroa.0.0.copyload = load ptr, ptr %tmpv.546.sroa.0.0.cast.1920.sroa_idx, align 8
  %tmpv.546.sroa.3.0.cast.1920.sroa_idx15 = getelementptr inbounds i8, ptr %key1, i64 56
  %tmpv.546.sroa.3.0.copyload = load i64, ptr %tmpv.546.sroa.3.0.cast.1920.sroa_idx15, align 8
  %tmpv.548.sroa.0.0.cast.1923.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 48
  %tmpv.548.sroa.0.0.copyload = load ptr, ptr %tmpv.548.sroa.0.0.cast.1923.sroa_idx, align 8
  %tmpv.548.sroa.3.0.cast.1923.sroa_idx13 = getelementptr inbounds i8, ptr %key2, i64 56
  %tmpv.548.sroa.3.0.copyload = load i64, ptr %tmpv.548.sroa.3.0.cast.1923.sroa_idx13, align 8
  %icmp.424 = icmp eq i64 %tmpv.546.sroa.3.0.copyload, %tmpv.548.sroa.3.0.copyload
  br i1 %icmp.424, label %then.371, label %then.351

then.371:                                         ; preds = %else.369
  %icmp.425 = icmp eq ptr %tmpv.546.sroa.0.0.copyload, %tmpv.548.sroa.0.0.copyload
  br i1 %icmp.425, label %else.374, label %else.372

else.372:                                         ; preds = %then.371
  %bcmp1 = call i32 @bcmp(ptr %tmpv.546.sroa.0.0.copyload, ptr %tmpv.548.sroa.0.0.copyload, i64 %tmpv.546.sroa.3.0.copyload)
  %icmp.426 = icmp eq i32 %bcmp1, 0
  br i1 %icmp.426, label %else.374, label %then.351

else.374:                                         ; preds = %else.372, %then.371
  %tmpv.552.sroa.0.0.cast.1926.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 64
  %tmpv.552.sroa.0.0.copyload = load ptr, ptr %tmpv.552.sroa.0.0.cast.1926.sroa_idx, align 8
  %tmpv.552.sroa.3.0.cast.1926.sroa_idx12 = getelementptr inbounds i8, ptr %key1, i64 72
  %tmpv.552.sroa.3.0.copyload = load i64, ptr %tmpv.552.sroa.3.0.cast.1926.sroa_idx12, align 8
  %tmpv.554.sroa.0.0.cast.1929.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 64
  %tmpv.554.sroa.0.0.copyload = load ptr, ptr %tmpv.554.sroa.0.0.cast.1929.sroa_idx, align 8
  %tmpv.554.sroa.3.0.cast.1929.sroa_idx10 = getelementptr inbounds i8, ptr %key2, i64 72
  %tmpv.554.sroa.3.0.copyload = load i64, ptr %tmpv.554.sroa.3.0.cast.1929.sroa_idx10, align 8
  %icmp.430 = icmp eq i64 %tmpv.552.sroa.3.0.copyload, %tmpv.554.sroa.3.0.copyload
  br i1 %icmp.430, label %then.376, label %then.351

then.376:                                         ; preds = %else.374
  %icmp.431 = icmp eq ptr %tmpv.552.sroa.0.0.copyload, %tmpv.554.sroa.0.0.copyload
  br i1 %icmp.431, label %else.379, label %else.377

else.377:                                         ; preds = %then.376
  %bcmp2 = call i32 @bcmp(ptr %tmpv.552.sroa.0.0.copyload, ptr %tmpv.554.sroa.0.0.copyload, i64 %tmpv.552.sroa.3.0.copyload)
  %icmp.432 = icmp eq i32 %bcmp2, 0
  br i1 %icmp.432, label %else.379, label %then.351

else.379:                                         ; preds = %else.377, %then.376
  %tmpv.558.sroa.0.0.cast.1932.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 80
  %tmpv.558.sroa.0.0.copyload = load ptr, ptr %tmpv.558.sroa.0.0.cast.1932.sroa_idx, align 8
  %tmpv.558.sroa.3.0.cast.1932.sroa_idx9 = getelementptr inbounds i8, ptr %key1, i64 88
  %tmpv.558.sroa.3.0.copyload = load i64, ptr %tmpv.558.sroa.3.0.cast.1932.sroa_idx9, align 8
  %tmpv.560.sroa.0.0.cast.1935.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 80
  %tmpv.560.sroa.0.0.copyload = load ptr, ptr %tmpv.560.sroa.0.0.cast.1935.sroa_idx, align 8
  %tmpv.560.sroa.3.0.cast.1935.sroa_idx7 = getelementptr inbounds i8, ptr %key2, i64 88
  %tmpv.560.sroa.3.0.copyload = load i64, ptr %tmpv.560.sroa.3.0.cast.1935.sroa_idx7, align 8
  %icmp.436 = icmp eq i64 %tmpv.558.sroa.3.0.copyload, %tmpv.560.sroa.3.0.copyload
  br i1 %icmp.436, label %then.381, label %then.351

then.381:                                         ; preds = %else.379
  %icmp.437 = icmp eq ptr %tmpv.558.sroa.0.0.copyload, %tmpv.560.sroa.0.0.copyload
  br i1 %icmp.437, label %else.384, label %else.382

else.382:                                         ; preds = %then.381
  %bcmp3 = call i32 @bcmp(ptr %tmpv.558.sroa.0.0.copyload, ptr %tmpv.560.sroa.0.0.copyload, i64 %tmpv.558.sroa.3.0.copyload)
  %icmp.438 = icmp eq i32 %bcmp3, 0
  br i1 %icmp.438, label %else.384, label %then.351

else.384:                                         ; preds = %else.382, %then.381
  %tmpv.564.sroa.0.0.cast.1938.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 96
  %tmpv.564.sroa.0.0.copyload = load ptr, ptr %tmpv.564.sroa.0.0.cast.1938.sroa_idx, align 8
  %tmpv.564.sroa.3.0.cast.1938.sroa_idx6 = getelementptr inbounds i8, ptr %key1, i64 104
  %tmpv.564.sroa.3.0.copyload = load i64, ptr %tmpv.564.sroa.3.0.cast.1938.sroa_idx6, align 8
  %tmpv.566.sroa.0.0.cast.1941.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 96
  %tmpv.566.sroa.0.0.copyload = load ptr, ptr %tmpv.566.sroa.0.0.cast.1941.sroa_idx, align 8
  %tmpv.566.sroa.3.0.cast.1941.sroa_idx4 = getelementptr inbounds i8, ptr %key2, i64 104
  %tmpv.566.sroa.3.0.copyload = load i64, ptr %tmpv.566.sroa.3.0.cast.1941.sroa_idx4, align 8
  %icmp.442 = icmp eq i64 %tmpv.564.sroa.3.0.copyload, %tmpv.566.sroa.3.0.copyload
  br i1 %icmp.442, label %then.386, label %then.351

then.386:                                         ; preds = %else.384
  %icmp.443 = icmp eq ptr %tmpv.564.sroa.0.0.copyload, %tmpv.566.sroa.0.0.copyload
  br i1 %icmp.443, label %else.389, label %else.387

else.387:                                         ; preds = %then.386
  %bcmp4 = call i32 @bcmp(ptr %tmpv.564.sroa.0.0.copyload, ptr %tmpv.566.sroa.0.0.copyload, i64 %tmpv.564.sroa.3.0.copyload)
  %icmp.444 = icmp eq i32 %bcmp4, 0
  br i1 %icmp.444, label %else.389, label %then.351

else.389:                                         ; preds = %else.387, %then.386
  %tmpv.570.sroa.0.0.cast.1944.sroa_idx = getelementptr inbounds i8, ptr %key1, i64 112
  %tmpv.570.sroa.0.0.copyload = load ptr, ptr %tmpv.570.sroa.0.0.cast.1944.sroa_idx, align 8
  %tmpv.570.sroa.3.0.cast.1944.sroa_idx3 = getelementptr inbounds i8, ptr %key1, i64 120
  %tmpv.570.sroa.3.0.copyload = load i64, ptr %tmpv.570.sroa.3.0.cast.1944.sroa_idx3, align 8
  %tmpv.572.sroa.0.0.cast.1947.sroa_idx = getelementptr inbounds i8, ptr %key2, i64 112
  %tmpv.572.sroa.0.0.copyload = load ptr, ptr %tmpv.572.sroa.0.0.cast.1947.sroa_idx, align 8
  %tmpv.572.sroa.3.0.cast.1947.sroa_idx1 = getelementptr inbounds i8, ptr %key2, i64 120
  %tmpv.572.sroa.3.0.copyload = load i64, ptr %tmpv.572.sroa.3.0.cast.1947.sroa_idx1, align 8
  %icmp.448 = icmp eq i64 %tmpv.570.sroa.3.0.copyload, %tmpv.572.sroa.3.0.copyload
  br i1 %icmp.448, label %then.391, label %then.351

then.391:                                         ; preds = %else.389
  %icmp.449 = icmp eq ptr %tmpv.570.sroa.0.0.copyload, %tmpv.572.sroa.0.0.copyload
  br i1 %icmp.449, label %then.351, label %else.392

else.392:                                         ; preds = %then.391
  %bcmp5 = call i32 @bcmp(ptr %tmpv.570.sroa.0.0.copyload, ptr %tmpv.572.sroa.0.0.copyload, i64 %tmpv.570.sroa.3.0.copyload)
  %icmp.450 = icmp eq i32 %bcmp5, 0
  %phi.cast = zext i1 %icmp.450 to i8
  br label %then.351
}

define i8 @go_0llvm.ScrubWriter..eq(ptr nest nocapture readnone %nest.71, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.452 = icmp eq ptr %key1, null
  br i1 %icmp.452, label %then.394, label %else.394, !make.implicit !3

then.394:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.394:                                         ; preds = %entry
  %icmp.453 = icmp eq ptr %key2, null
  br i1 %icmp.453, label %then.395, label %else.395, !make.implicit !3

then.395:                                         ; preds = %else.394
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.395:                                         ; preds = %else.394
  %ld.72 = load ptr, ptr %key1, align 8
  %field1.35 = getelementptr inbounds i8, ptr %key1, i64 8
  %ld.73 = load ptr, ptr %field1.35, align 8
  %ld.74 = load ptr, ptr %key2, align 8
  %field1.36 = getelementptr inbounds i8, ptr %key2, i64 8
  %ld.75 = load ptr, ptr %field1.36, align 8
  %call.80 = call i8 @runtime.ifaceeq(ptr nest undef, ptr %ld.72, ptr %ld.73, ptr %ld.74, ptr %ld.75)
  %icmp.454.not = icmp eq i8 %call.80, 1
  br i1 %icmp.454.not, label %else.398, label %common.ret

common.ret:                                       ; preds = %else.395, %else.398
  %common.ret.op = phi i8 [ %spec.select, %else.398 ], [ 0, %else.395 ]
  ret i8 %common.ret.op

else.398:                                         ; preds = %else.395
  %field.635 = getelementptr inbounds i8, ptr %key1, i64 16
  %.field.ld.119 = load ptr, ptr %field.635, align 8
  %field.636 = getelementptr inbounds i8, ptr %key2, i64 16
  %.field.ld.120 = load ptr, ptr %field.636, align 8
  %icmp.457.not = icmp eq ptr %.field.ld.119, %.field.ld.120
  %spec.select = zext i1 %icmp.457.not to i8
  br label %common.ret
}

define { ptr, ptr } @go_0llvm.ScrubWriter.Close..stub(ptr nest nocapture readnone %nest.39, ptr readonly %"$this255.pointer") #0 {
entry:
  %tmpv.351 = alloca %ScrubWriter.0, align 8, !go_addrtaken !3
  %call.44 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d)
  %icmp.264 = icmp eq ptr %"$this255.pointer", null
  br i1 %icmp.264, label %then.212, label %else.212, !make.implicit !3

then.212:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.212:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.351, ptr noundef nonnull align 8 dereferenceable(24) %"$this255.pointer", i64 24, i1 false)
  %deref.ld.16 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.265 = icmp eq i32 %deref.ld.16, 0
  br i1 %icmp.265, label %then.213, label %else.213

then.213:                                         ; preds = %else.212
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.44, ptr noundef nonnull align 8 dereferenceable(24) %"$this255.pointer", i64 24, i1 false)
  br label %else.215

else.213:                                         ; preds = %else.212
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d, ptr nonnull %call.44, ptr nonnull %tmpv.351)
  br label %else.215

else.215:                                         ; preds = %else.213, %then.213
  %.field.ld.29 = load ptr, ptr %call.44, align 8
  %field.435 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.29, i64 0, i32 1
  %.field.ld.30 = load ptr, ptr %field.435, align 8
  %field.436 = getelementptr inbounds i8, ptr %call.44, i64 8
  %.field.ld.31 = load ptr, ptr %field.436, align 8
  %call.43 = call { ptr, ptr } %.field.ld.30(ptr nest undef, ptr %.field.ld.31)
  ret { ptr, ptr } %call.43
}

define void @go_0llvm.ScrubWriter.Hijack..stub(ptr nest nocapture readnone %nest.40, ptr readonly %"$this256.pointer") #0 {
entry:
  %tmpv.357 = alloca %ScrubWriter.0, align 8, !go_addrtaken !3
  %call.45 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d)
  %icmp.268 = icmp eq ptr %"$this256.pointer", null
  br i1 %icmp.268, label %then.216, label %else.216, !make.implicit !3

then.216:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.216:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.357, ptr noundef nonnull align 8 dereferenceable(24) %"$this256.pointer", i64 24, i1 false)
  %deref.ld.17 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.269 = icmp eq i32 %deref.ld.17, 0
  br i1 %icmp.269, label %then.217, label %else.217

then.217:                                         ; preds = %else.216
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.45, ptr noundef nonnull align 8 dereferenceable(24) %"$this256.pointer", i64 24, i1 false)
  br label %else.219

else.217:                                         ; preds = %else.216
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d, ptr nonnull %call.45, ptr nonnull %tmpv.357)
  br label %else.219

else.219:                                         ; preds = %else.217, %then.217
  %.field.ld.32 = load ptr, ptr %call.45, align 8
  %field.439 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.32, i64 0, i32 2
  %.field.ld.33 = load ptr, ptr %field.439, align 8
  %field.440 = getelementptr inbounds i8, ptr %call.45, i64 8
  %.field.ld.34 = load ptr, ptr %field.440, align 8
  call void %.field.ld.33(ptr nest undef, ptr %.field.ld.34)
  ret void
}

define { ptr, ptr } @go_0llvm.ScrubWriter.LocalAddr..stub(ptr nest nocapture readnone %nest.41, ptr readonly %"$this257.pointer") #0 {
entry:
  %tmpv.364 = alloca %ScrubWriter.0, align 8, !go_addrtaken !3
  %call.47 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d)
  %icmp.272 = icmp eq ptr %"$this257.pointer", null
  br i1 %icmp.272, label %then.220, label %else.220, !make.implicit !3

then.220:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.220:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.364, ptr noundef nonnull align 8 dereferenceable(24) %"$this257.pointer", i64 24, i1 false)
  %deref.ld.18 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.273 = icmp eq i32 %deref.ld.18, 0
  br i1 %icmp.273, label %then.221, label %else.221

then.221:                                         ; preds = %else.220
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.47, ptr noundef nonnull align 8 dereferenceable(24) %"$this257.pointer", i64 24, i1 false)
  br label %else.223

else.221:                                         ; preds = %else.220
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d, ptr nonnull %call.47, ptr nonnull %tmpv.364)
  br label %else.223

else.223:                                         ; preds = %else.221, %then.221
  %.field.ld.35 = load ptr, ptr %call.47, align 8
  %field.443 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.35, i64 0, i32 3
  %.field.ld.36 = load ptr, ptr %field.443, align 8
  %field.444 = getelementptr inbounds i8, ptr %call.47, i64 8
  %.field.ld.37 = load ptr, ptr %field.444, align 8
  %call.46 = call { ptr, ptr } %.field.ld.36(ptr nest undef, ptr %.field.ld.37)
  ret { ptr, ptr } %call.46
}

define { ptr, ptr } @go_0llvm.ScrubWriter.RemoteAddr..stub(ptr nest nocapture readnone %nest.42, ptr readonly %"$this258.pointer") #0 {
entry:
  %tmpv.371 = alloca %ScrubWriter.0, align 8, !go_addrtaken !3
  %call.49 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d)
  %icmp.276 = icmp eq ptr %"$this258.pointer", null
  br i1 %icmp.276, label %then.224, label %else.224, !make.implicit !3

then.224:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.224:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.371, ptr noundef nonnull align 8 dereferenceable(24) %"$this258.pointer", i64 24, i1 false)
  %deref.ld.19 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.277 = icmp eq i32 %deref.ld.19, 0
  br i1 %icmp.277, label %then.225, label %else.225

then.225:                                         ; preds = %else.224
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.49, ptr noundef nonnull align 8 dereferenceable(24) %"$this258.pointer", i64 24, i1 false)
  br label %else.227

else.225:                                         ; preds = %else.224
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d, ptr nonnull %call.49, ptr nonnull %tmpv.371)
  br label %else.227

else.227:                                         ; preds = %else.225, %then.225
  %.field.ld.38 = load ptr, ptr %call.49, align 8
  %field.447 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.38, i64 0, i32 4
  %.field.ld.39 = load ptr, ptr %field.447, align 8
  %field.448 = getelementptr inbounds i8, ptr %call.49, i64 8
  %.field.ld.40 = load ptr, ptr %field.448, align 8
  %call.48 = call { ptr, ptr } %.field.ld.39(ptr nest undef, ptr %.field.ld.40)
  ret { ptr, ptr } %call.48
}

define { ptr, ptr } @go_0llvm.ScrubWriter.TsigStatus..stub(ptr nest nocapture readnone %nest.43, ptr readonly %"$this259.pointer") #0 {
entry:
  %tmpv.378 = alloca %ScrubWriter.0, align 8, !go_addrtaken !3
  %call.51 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d)
  %icmp.280 = icmp eq ptr %"$this259.pointer", null
  br i1 %icmp.280, label %then.228, label %else.228, !make.implicit !3

then.228:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.228:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.378, ptr noundef nonnull align 8 dereferenceable(24) %"$this259.pointer", i64 24, i1 false)
  %deref.ld.20 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.281 = icmp eq i32 %deref.ld.20, 0
  br i1 %icmp.281, label %then.229, label %else.229

then.229:                                         ; preds = %else.228
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.51, ptr noundef nonnull align 8 dereferenceable(24) %"$this259.pointer", i64 24, i1 false)
  br label %else.231

else.229:                                         ; preds = %else.228
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d, ptr nonnull %call.51, ptr nonnull %tmpv.378)
  br label %else.231

else.231:                                         ; preds = %else.229, %then.229
  %.field.ld.41 = load ptr, ptr %call.51, align 8
  %field.451 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.41, i64 0, i32 5
  %.field.ld.42 = load ptr, ptr %field.451, align 8
  %field.452 = getelementptr inbounds i8, ptr %call.51, i64 8
  %.field.ld.43 = load ptr, ptr %field.452, align 8
  %call.50 = call { ptr, ptr } %.field.ld.42(ptr nest undef, ptr %.field.ld.43)
  ret { ptr, ptr } %call.50
}

define void @go_0llvm.ScrubWriter.TsigTimersOnly..stub(ptr nest nocapture readnone %nest.44, ptr readonly %"$this260.pointer", i8 zeroext %"$p261") #0 {
entry:
  %tmpv.384 = alloca %ScrubWriter.0, align 8, !go_addrtaken !3
  %call.52 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d)
  %icmp.284 = icmp eq ptr %"$this260.pointer", null
  br i1 %icmp.284, label %then.232, label %else.232, !make.implicit !3

then.232:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.232:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.384, ptr noundef nonnull align 8 dereferenceable(24) %"$this260.pointer", i64 24, i1 false)
  %deref.ld.21 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.285 = icmp eq i32 %deref.ld.21, 0
  br i1 %icmp.285, label %then.233, label %else.233

then.233:                                         ; preds = %else.232
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.52, ptr noundef nonnull align 8 dereferenceable(24) %"$this260.pointer", i64 24, i1 false)
  br label %else.235

else.233:                                         ; preds = %else.232
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d, ptr nonnull %call.52, ptr nonnull %tmpv.384)
  br label %else.235

else.235:                                         ; preds = %else.233, %then.233
  %.field.ld.44 = load ptr, ptr %call.52, align 8
  %field.455 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.44, i64 0, i32 6
  %.field.ld.45 = load ptr, ptr %field.455, align 8
  %field.456 = getelementptr inbounds i8, ptr %call.52, i64 8
  %.field.ld.46 = load ptr, ptr %field.456, align 8
  call void %.field.ld.45(ptr nest undef, ptr %.field.ld.46, i8 zeroext %"$p261")
  ret void
}

define void @go_0llvm.ScrubWriter.Write..stub(ptr nocapture writeonly sret({ i64, %error.0 }) %sret.formal.3, ptr nest nocapture readnone %nest.45, ptr readonly %"$this262.pointer", ptr byval({ ptr, i64, i64 }) %"$p263") #0 {
entry:
  %sret.actual.22 = alloca { i64, %error.0 }, align 8
  %tmpv.395 = alloca %ScrubWriter.0, align 8, !go_addrtaken !3
  %call.53 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d)
  %icmp.288 = icmp eq ptr %"$this262.pointer", null
  br i1 %icmp.288, label %then.236, label %else.236, !make.implicit !3

then.236:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.236:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.395, ptr noundef nonnull align 8 dereferenceable(24) %"$this262.pointer", i64 24, i1 false)
  %deref.ld.22 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.289 = icmp eq i32 %deref.ld.22, 0
  br i1 %icmp.289, label %then.237, label %else.237

then.237:                                         ; preds = %else.236
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.53, ptr noundef nonnull align 8 dereferenceable(24) %"$this262.pointer", i64 24, i1 false)
  br label %fallthrough.237

fallthrough.237:                                  ; preds = %else.237, %then.237
  %.field.ld.47 = load ptr, ptr %call.53, align 8
  %field.459 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.47, i64 0, i32 7
  %.field.ld.48 = load ptr, ptr %field.459, align 8
  %field.460 = getelementptr inbounds i8, ptr %call.53, i64 8
  %.field.ld.49 = load ptr, ptr %field.460, align 8
  call void %.field.ld.48(ptr nonnull %sret.actual.22, ptr nest undef, ptr %.field.ld.49, ptr nonnull byval({ ptr, i64, i64 }) %"$p263")
  %tmpv.386.sroa.0.0.copyload = load i64, ptr %sret.actual.22, align 8
  %tmpv.386.sroa.2.0.cast.1613.sroa_idx = getelementptr inbounds { i64, %error.0 }, ptr %sret.actual.22, i64 0, i32 1
  %tmp.12.sroa.2.0.cast.1622.sroa_idx = getelementptr inbounds { i64, %error.0 }, ptr %sret.formal.3, i64 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %tmp.12.sroa.2.0.cast.1622.sroa_idx, ptr noundef nonnull align 8 dereferenceable(16) %tmpv.386.sroa.2.0.cast.1613.sroa_idx, i64 16, i1 false)
  store i64 %tmpv.386.sroa.0.0.copyload, ptr %sret.formal.3, align 8
  ret void

else.237:                                         ; preds = %else.236
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d, ptr nonnull %call.53, ptr nonnull %tmpv.395)
  br label %fallthrough.237
}

define { ptr, ptr } @go_0llvm.ScrubWriter.WriteMsg..stub(ptr nest nocapture readnone %nest.46, ptr readonly %"$this264.pointer", ptr %"$p265") #0 {
entry:
  %tmpv.402 = alloca %ScrubWriter.0, align 8, !go_addrtaken !3
  %call.55 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d)
  %icmp.292 = icmp eq ptr %"$this264.pointer", null
  br i1 %icmp.292, label %then.240, label %else.240, !make.implicit !3

then.240:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.240:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.402, ptr noundef nonnull align 8 dereferenceable(24) %"$this264.pointer", i64 24, i1 false)
  %deref.ld.23 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.293 = icmp eq i32 %deref.ld.23, 0
  br i1 %icmp.293, label %then.241, label %else.241

then.241:                                         ; preds = %else.240
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.55, ptr noundef nonnull align 8 dereferenceable(24) %"$this264.pointer", i64 24, i1 false)
  br label %else.243

else.241:                                         ; preds = %else.240
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d, ptr nonnull %call.55, ptr nonnull %tmpv.402)
  br label %else.243

else.243:                                         ; preds = %else.241, %then.241
  %.field.ld.50 = load ptr, ptr %call.55, align 8
  %field.467 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.50, i64 0, i32 8
  %.field.ld.51 = load ptr, ptr %field.467, align 8
  %field.468 = getelementptr inbounds i8, ptr %call.55, i64 8
  %.field.ld.52 = load ptr, ptr %field.468, align 8
  %call.54 = call { ptr, ptr } %.field.ld.51(ptr nest undef, ptr %.field.ld.52, ptr %"$p265")
  ret { ptr, ptr } %call.54
}

define void @go_0llvm.supported.Lock..stub(ptr nest nocapture readnone %nest.49, ptr %"$this268") #0 {
entry:
  %icmp.296 = icmp eq ptr %"$this268", null
  br i1 %icmp.296, label %then.246, label %else.246, !make.implicit !3

then.246:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.246:                                         ; preds = %entry
  %field.471 = getelementptr inbounds %.go.llvm.supported.0, ptr %"$this268", i64 0, i32 1
  call void @sync.RWMutex.Lock(ptr nest undef, ptr nonnull %field.471)
  ret void
}

define void @go_0llvm.supported.RLock..stub(ptr nest nocapture readnone %nest.52, ptr %"$this272") #0 {
entry:
  %icmp.299 = icmp eq ptr %"$this272", null
  br i1 %icmp.299, label %then.249, label %else.249, !make.implicit !3

then.249:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.249:                                         ; preds = %entry
  %field.474 = getelementptr inbounds %.go.llvm.supported.0, ptr %"$this272", i64 0, i32 1
  call void @sync.RWMutex.RLock(ptr nest undef, ptr nonnull %field.474)
  ret void
}

define { ptr, ptr } @go_0llvm.supported.RLocker..stub(ptr nest nocapture readnone %nest.47, ptr %"$this266") #0 {
entry:
  %icmp.294 = icmp eq ptr %"$this266", null
  br i1 %icmp.294, label %then.244, label %else.244, !make.implicit !3

then.244:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.244:                                         ; preds = %entry
  %field.469 = getelementptr inbounds %.go.llvm.supported.0, ptr %"$this266", i64 0, i32 1
  %ld.82.fca.1.insert.i = insertvalue { ptr, ptr } { ptr @pimt..interface_4Lock_bfunc_8_9_8_9_cUnlock_bfunc_8_9_8_9_5..sync.rlocker, ptr undef }, ptr %field.469, 1
  ret { ptr, ptr } %ld.82.fca.1.insert.i
}

define void @go_0llvm.supported.RUnlock..stub(ptr nest nocapture readnone %nest.51, ptr %"$this271") #0 {
entry:
  %icmp.298 = icmp eq ptr %"$this271", null
  br i1 %icmp.298, label %then.248, label %else.248, !make.implicit !3

then.248:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.248:                                         ; preds = %entry
  %field.473 = getelementptr inbounds %.go.llvm.supported.0, ptr %"$this271", i64 0, i32 1
  call void @sync.RWMutex.RUnlock(ptr nest undef, ptr nonnull %field.473)
  ret void
}

define void @go_0llvm.supported.Unlock..stub(ptr nest nocapture readnone %nest.48, ptr %"$this267") #0 {
entry:
  %icmp.295 = icmp eq ptr %"$this267", null
  br i1 %icmp.295, label %then.245, label %else.245, !make.implicit !3

then.245:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.245:                                         ; preds = %entry
  %field.470 = getelementptr inbounds %.go.llvm.supported.0, ptr %"$this267", i64 0, i32 1
  call void @sync.RWMutex.Unlock(ptr nest undef, ptr nonnull %field.470)
  ret void
}

define void @go_0llvm.supported.sync_0rUnlockSlow..stub(ptr nest nocapture readnone %nest.50, ptr %"$this269", i32 %"$p270") #0 {
entry:
  %icmp.297 = icmp eq ptr %"$this269", null
  br i1 %icmp.297, label %then.247, label %else.247, !make.implicit !3

then.247:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.247:                                         ; preds = %entry
  %field.472 = getelementptr inbounds %.go.llvm.supported.0, ptr %"$this269", i64 0, i32 1
  call void @sync.RWMutex.rUnlockSlow(ptr nest undef, ptr nonnull %field.472, i32 %"$p270")
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
  br i1 %icmp.0, label %fallthrough.589.thread, label %fallthrough.589

fallthrough.589.thread:                           ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %call.1, ptr noundef nonnull align 8 dereferenceable(32) %tmpv.3, i64 32, i1 false)
  br label %else.591

fallthrough.589:                                  ; preds = %entry
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.supported..d, ptr nonnull %call.1, ptr nonnull %tmpv.3)
  %deref.ld.1.pr = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.2 = icmp eq i32 %deref.ld.1.pr, 0
  br i1 %icmp.2, label %else.591, label %else.590

fallthrough.590:                                  ; preds = %else.591, %else.590
  ret void

else.590:                                         ; preds = %fallthrough.589
  %pticast.12 = ptrtoint ptr %call.1 to i64
  call void @runtime.gcWriteBarrier(ptr nest undef, ptr nonnull @go_0llvm.sup, i64 %pticast.12)
  br label %fallthrough.590

else.591:                                         ; preds = %fallthrough.589.thread, %fallthrough.589
  store ptr %call.1, ptr @go_0llvm.sup, align 8
  br label %fallthrough.590
}

declare ptr @runtime.makemap__small(ptr) local_unnamed_addr #0

declare noalias nonnull ptr @runtime.newobject(ptr, ptr) local_unnamed_addr #0

; Function Attrs: cold
declare void @runtime.typedmemmove(ptr, ptr, ptr, ptr) local_unnamed_addr #1

; Function Attrs: noreturn
declare void @runtime.panicmem(ptr) local_unnamed_addr #2

; Function Attrs: cold
declare void @runtime.gcWriteBarrier(ptr, ptr, i64) local_unnamed_addr #1

define void @go_0llvm.Zone.Lock..stub(ptr nest nocapture readnone %nest.55, ptr %"$this275") #0 {
entry:
  %icmp.302 = icmp eq ptr %"$this275", null
  br i1 %icmp.302, label %then.252, label %else.252, !make.implicit !3

then.252:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.252:                                         ; preds = %entry
  %field.477 = getelementptr inbounds %Zone.0, ptr %"$this275", i64 0, i32 6
  call void @sync.RWMutex.Lock(ptr nest undef, ptr nonnull %field.477)
  ret void
}

define void @go_0llvm.Zone.RLock..stub(ptr nest nocapture readnone %nest.58, ptr %"$this279") #0 {
entry:
  %icmp.305 = icmp eq ptr %"$this279", null
  br i1 %icmp.305, label %then.255, label %else.255, !make.implicit !3

then.255:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.255:                                         ; preds = %entry
  %field.480 = getelementptr inbounds %Zone.0, ptr %"$this279", i64 0, i32 6
  call void @sync.RWMutex.RLock(ptr nest undef, ptr nonnull %field.480)
  ret void
}

define { ptr, ptr } @go_0llvm.Zone.RLocker..stub(ptr nest nocapture readnone %nest.53, ptr %"$this273") #0 {
entry:
  %icmp.300 = icmp eq ptr %"$this273", null
  br i1 %icmp.300, label %then.250, label %else.250, !make.implicit !3

then.250:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.250:                                         ; preds = %entry
  %field.475 = getelementptr inbounds %Zone.0, ptr %"$this273", i64 0, i32 6
  %ld.82.fca.1.insert.i = insertvalue { ptr, ptr } { ptr @pimt..interface_4Lock_bfunc_8_9_8_9_cUnlock_bfunc_8_9_8_9_5..sync.rlocker, ptr undef }, ptr %field.475, 1
  ret { ptr, ptr } %ld.82.fca.1.insert.i
}

define void @go_0llvm.Zone.RUnlock..stub(ptr nest nocapture readnone %nest.57, ptr %"$this278") #0 {
entry:
  %icmp.304 = icmp eq ptr %"$this278", null
  br i1 %icmp.304, label %then.254, label %else.254, !make.implicit !3

then.254:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.254:                                         ; preds = %entry
  %field.479 = getelementptr inbounds %Zone.0, ptr %"$this278", i64 0, i32 6
  call void @sync.RWMutex.RUnlock(ptr nest undef, ptr nonnull %field.479)
  ret void
}

define void @go_0llvm.Zone.Unlock..stub(ptr nest nocapture readnone %nest.54, ptr %"$this274") #0 {
entry:
  %icmp.301 = icmp eq ptr %"$this274", null
  br i1 %icmp.301, label %then.251, label %else.251, !make.implicit !3

then.251:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.251:                                         ; preds = %entry
  %field.476 = getelementptr inbounds %Zone.0, ptr %"$this274", i64 0, i32 6
  call void @sync.RWMutex.Unlock(ptr nest undef, ptr nonnull %field.476)
  ret void
}

define void @go_0llvm.Zone.sync_0rUnlockSlow..stub(ptr nest nocapture readnone %nest.56, ptr %"$this276", i32 %"$p277") #0 {
entry:
  %icmp.303 = icmp eq ptr %"$this276", null
  br i1 %icmp.303, label %then.253, label %else.253, !make.implicit !3

then.253:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.253:                                         ; preds = %entry
  %field.478 = getelementptr inbounds %Zone.0, ptr %"$this276", i64 0, i32 6
  call void @sync.RWMutex.rUnlockSlow(ptr nest undef, ptr nonnull %field.478, i32 %"$p277")
  ret void
}

define i8 @go_0llvm.Node..eq(ptr nest nocapture readnone %nest.72, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.458 = icmp eq ptr %key1, null
  br i1 %icmp.458, label %then.400, label %else.400, !make.implicit !3

then.400:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.400:                                         ; preds = %entry
  %icmp.459 = icmp eq ptr %key2, null
  br i1 %icmp.459, label %then.401, label %else.401, !make.implicit !3

then.401:                                         ; preds = %else.400
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.401:                                         ; preds = %else.400
  %.field.ld.121 = load ptr, ptr %key1, align 8
  %.field.ld.122 = load ptr, ptr %key2, align 8
  %icmp.460.not = icmp eq ptr %.field.ld.121, %.field.ld.122
  br i1 %icmp.460.not, label %else.404, label %common.ret

common.ret:                                       ; preds = %else.401, %else.404, %else.407, %else.410
  %common.ret.op = phi i8 [ %spec.select, %else.410 ], [ 0, %else.407 ], [ 0, %else.404 ], [ 0, %else.401 ]
  ret i8 %common.ret.op

else.404:                                         ; preds = %else.401
  %field.639 = getelementptr inbounds i8, ptr %key1, i64 8
  %.field.ld.123 = load ptr, ptr %field.639, align 8
  %field.640 = getelementptr inbounds i8, ptr %key2, i64 8
  %.field.ld.124 = load ptr, ptr %field.640, align 8
  %icmp.463.not = icmp eq ptr %.field.ld.123, %.field.ld.124
  br i1 %icmp.463.not, label %else.407, label %common.ret

else.407:                                         ; preds = %else.404
  %field.641 = getelementptr inbounds i8, ptr %key1, i64 16
  %.field.ld.125 = load ptr, ptr %field.641, align 8
  %field.642 = getelementptr inbounds i8, ptr %key2, i64 16
  %.field.ld.126 = load ptr, ptr %field.642, align 8
  %icmp.466.not = icmp eq ptr %.field.ld.125, %.field.ld.126
  br i1 %icmp.466.not, label %else.410, label %common.ret

else.410:                                         ; preds = %else.407
  %0 = getelementptr inbounds i8, ptr %key1, i64 24
  %.field.ld.127 = load i8, ptr %0, align 1
  %1 = getelementptr inbounds i8, ptr %key2, i64 24
  %.field.ld.128 = load i8, ptr %1, align 1
  %icmp.469.not = icmp eq i8 %.field.ld.127, %.field.ld.128
  %spec.select = zext i1 %icmp.469.not to i8
  br label %common.ret
}

define i8 @go_0llvm.NonWriter..eq(ptr nest nocapture readnone %nest.74, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.508 = icmp eq ptr %key1, null
  br i1 %icmp.508, label %then.447, label %else.447, !make.implicit !3

then.447:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.447:                                         ; preds = %entry
  %icmp.509 = icmp eq ptr %key2, null
  br i1 %icmp.509, label %then.448, label %else.448, !make.implicit !3

then.448:                                         ; preds = %else.447
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.448:                                         ; preds = %else.447
  %ld.76 = load ptr, ptr %key1, align 8
  %field1.37 = getelementptr inbounds i8, ptr %key1, i64 8
  %ld.77 = load ptr, ptr %field1.37, align 8
  %ld.78 = load ptr, ptr %key2, align 8
  %field1.38 = getelementptr inbounds i8, ptr %key2, i64 8
  %ld.79 = load ptr, ptr %field1.38, align 8
  %call.84 = call i8 @runtime.ifaceeq(ptr nest undef, ptr %ld.76, ptr %ld.77, ptr %ld.78, ptr %ld.79)
  %icmp.510.not = icmp eq i8 %call.84, 1
  br i1 %icmp.510.not, label %else.451, label %common.ret

common.ret:                                       ; preds = %else.448, %else.451
  %common.ret.op = phi i8 [ %spec.select, %else.451 ], [ 0, %else.448 ]
  ret i8 %common.ret.op

else.451:                                         ; preds = %else.448
  %field.694 = getelementptr inbounds i8, ptr %key1, i64 16
  %.field.ld.139 = load ptr, ptr %field.694, align 8
  %field.695 = getelementptr inbounds i8, ptr %key2, i64 16
  %.field.ld.140 = load ptr, ptr %field.695, align 8
  %icmp.513.not = icmp eq ptr %.field.ld.139, %.field.ld.140
  %spec.select = zext i1 %icmp.513.not to i8
  br label %common.ret
}

define { ptr, ptr } @go_0llvm.NonWriter.Close..stub(ptr nest nocapture readnone %nest.59, ptr readonly %"$this280.pointer") #0 {
entry:
  %tmpv.423 = alloca %NonWriter.0, align 8, !go_addrtaken !3
  %call.59 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d)
  %icmp.308 = icmp eq ptr %"$this280.pointer", null
  br i1 %icmp.308, label %then.256, label %else.256, !make.implicit !3

then.256:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.256:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.423, ptr noundef nonnull align 8 dereferenceable(24) %"$this280.pointer", i64 24, i1 false)
  %deref.ld.24 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.309 = icmp eq i32 %deref.ld.24, 0
  br i1 %icmp.309, label %then.257, label %else.257

then.257:                                         ; preds = %else.256
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.59, ptr noundef nonnull align 8 dereferenceable(24) %"$this280.pointer", i64 24, i1 false)
  br label %else.259

else.257:                                         ; preds = %else.256
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d, ptr nonnull %call.59, ptr nonnull %tmpv.423)
  br label %else.259

else.259:                                         ; preds = %else.257, %then.257
  %.field.ld.53 = load ptr, ptr %call.59, align 8
  %field.483 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.53, i64 0, i32 1
  %.field.ld.54 = load ptr, ptr %field.483, align 8
  %field.484 = getelementptr inbounds i8, ptr %call.59, i64 8
  %.field.ld.55 = load ptr, ptr %field.484, align 8
  %call.58 = call { ptr, ptr } %.field.ld.54(ptr nest undef, ptr %.field.ld.55)
  ret { ptr, ptr } %call.58
}

define void @go_0llvm.NonWriter.Hijack..stub(ptr nest nocapture readnone %nest.60, ptr readonly %"$this281.pointer") #0 {
entry:
  %tmpv.429 = alloca %NonWriter.0, align 8, !go_addrtaken !3
  %call.60 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d)
  %icmp.312 = icmp eq ptr %"$this281.pointer", null
  br i1 %icmp.312, label %then.260, label %else.260, !make.implicit !3

then.260:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.260:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.429, ptr noundef nonnull align 8 dereferenceable(24) %"$this281.pointer", i64 24, i1 false)
  %deref.ld.25 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.313 = icmp eq i32 %deref.ld.25, 0
  br i1 %icmp.313, label %then.261, label %else.261

then.261:                                         ; preds = %else.260
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.60, ptr noundef nonnull align 8 dereferenceable(24) %"$this281.pointer", i64 24, i1 false)
  br label %else.263

else.261:                                         ; preds = %else.260
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d, ptr nonnull %call.60, ptr nonnull %tmpv.429)
  br label %else.263

else.263:                                         ; preds = %else.261, %then.261
  %.field.ld.56 = load ptr, ptr %call.60, align 8
  %field.487 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.56, i64 0, i32 2
  %.field.ld.57 = load ptr, ptr %field.487, align 8
  %field.488 = getelementptr inbounds i8, ptr %call.60, i64 8
  %.field.ld.58 = load ptr, ptr %field.488, align 8
  call void %.field.ld.57(ptr nest undef, ptr %.field.ld.58)
  ret void
}

define { ptr, ptr } @go_0llvm.NonWriter.LocalAddr..stub(ptr nest nocapture readnone %nest.61, ptr readonly %"$this282.pointer") #0 {
entry:
  %tmpv.436 = alloca %NonWriter.0, align 8, !go_addrtaken !3
  %call.62 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d)
  %icmp.316 = icmp eq ptr %"$this282.pointer", null
  br i1 %icmp.316, label %then.264, label %else.264, !make.implicit !3

then.264:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.264:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.436, ptr noundef nonnull align 8 dereferenceable(24) %"$this282.pointer", i64 24, i1 false)
  %deref.ld.26 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.317 = icmp eq i32 %deref.ld.26, 0
  br i1 %icmp.317, label %then.265, label %else.265

then.265:                                         ; preds = %else.264
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.62, ptr noundef nonnull align 8 dereferenceable(24) %"$this282.pointer", i64 24, i1 false)
  br label %else.267

else.265:                                         ; preds = %else.264
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d, ptr nonnull %call.62, ptr nonnull %tmpv.436)
  br label %else.267

else.267:                                         ; preds = %else.265, %then.265
  %.field.ld.59 = load ptr, ptr %call.62, align 8
  %field.491 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.59, i64 0, i32 3
  %.field.ld.60 = load ptr, ptr %field.491, align 8
  %field.492 = getelementptr inbounds i8, ptr %call.62, i64 8
  %.field.ld.61 = load ptr, ptr %field.492, align 8
  %call.61 = call { ptr, ptr } %.field.ld.60(ptr nest undef, ptr %.field.ld.61)
  ret { ptr, ptr } %call.61
}

define { ptr, ptr } @go_0llvm.NonWriter.RemoteAddr..stub(ptr nest nocapture readnone %nest.62, ptr readonly %"$this283.pointer") #0 {
entry:
  %tmpv.443 = alloca %NonWriter.0, align 8, !go_addrtaken !3
  %call.64 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d)
  %icmp.320 = icmp eq ptr %"$this283.pointer", null
  br i1 %icmp.320, label %then.268, label %else.268, !make.implicit !3

then.268:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.268:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.443, ptr noundef nonnull align 8 dereferenceable(24) %"$this283.pointer", i64 24, i1 false)
  %deref.ld.27 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.321 = icmp eq i32 %deref.ld.27, 0
  br i1 %icmp.321, label %then.269, label %else.269

then.269:                                         ; preds = %else.268
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.64, ptr noundef nonnull align 8 dereferenceable(24) %"$this283.pointer", i64 24, i1 false)
  br label %else.271

else.269:                                         ; preds = %else.268
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d, ptr nonnull %call.64, ptr nonnull %tmpv.443)
  br label %else.271

else.271:                                         ; preds = %else.269, %then.269
  %.field.ld.62 = load ptr, ptr %call.64, align 8
  %field.495 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.62, i64 0, i32 4
  %.field.ld.63 = load ptr, ptr %field.495, align 8
  %field.496 = getelementptr inbounds i8, ptr %call.64, i64 8
  %.field.ld.64 = load ptr, ptr %field.496, align 8
  %call.63 = call { ptr, ptr } %.field.ld.63(ptr nest undef, ptr %.field.ld.64)
  ret { ptr, ptr } %call.63
}

define { ptr, ptr } @go_0llvm.NonWriter.TsigStatus..stub(ptr nest nocapture readnone %nest.63, ptr readonly %"$this284.pointer") #0 {
entry:
  %tmpv.450 = alloca %NonWriter.0, align 8, !go_addrtaken !3
  %call.66 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d)
  %icmp.324 = icmp eq ptr %"$this284.pointer", null
  br i1 %icmp.324, label %then.272, label %else.272, !make.implicit !3

then.272:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.272:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.450, ptr noundef nonnull align 8 dereferenceable(24) %"$this284.pointer", i64 24, i1 false)
  %deref.ld.28 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.325 = icmp eq i32 %deref.ld.28, 0
  br i1 %icmp.325, label %then.273, label %else.273

then.273:                                         ; preds = %else.272
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.66, ptr noundef nonnull align 8 dereferenceable(24) %"$this284.pointer", i64 24, i1 false)
  br label %else.275

else.273:                                         ; preds = %else.272
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d, ptr nonnull %call.66, ptr nonnull %tmpv.450)
  br label %else.275

else.275:                                         ; preds = %else.273, %then.273
  %.field.ld.65 = load ptr, ptr %call.66, align 8
  %field.499 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.65, i64 0, i32 5
  %.field.ld.66 = load ptr, ptr %field.499, align 8
  %field.500 = getelementptr inbounds i8, ptr %call.66, i64 8
  %.field.ld.67 = load ptr, ptr %field.500, align 8
  %call.65 = call { ptr, ptr } %.field.ld.66(ptr nest undef, ptr %.field.ld.67)
  ret { ptr, ptr } %call.65
}

define void @go_0llvm.NonWriter.TsigTimersOnly..stub(ptr nest nocapture readnone %nest.64, ptr readonly %"$this285.pointer", i8 zeroext %"$p286") #0 {
entry:
  %tmpv.456 = alloca %NonWriter.0, align 8, !go_addrtaken !3
  %call.67 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d)
  %icmp.328 = icmp eq ptr %"$this285.pointer", null
  br i1 %icmp.328, label %then.276, label %else.276, !make.implicit !3

then.276:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.276:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.456, ptr noundef nonnull align 8 dereferenceable(24) %"$this285.pointer", i64 24, i1 false)
  %deref.ld.29 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.329 = icmp eq i32 %deref.ld.29, 0
  br i1 %icmp.329, label %then.277, label %else.277

then.277:                                         ; preds = %else.276
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.67, ptr noundef nonnull align 8 dereferenceable(24) %"$this285.pointer", i64 24, i1 false)
  br label %else.279

else.277:                                         ; preds = %else.276
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d, ptr nonnull %call.67, ptr nonnull %tmpv.456)
  br label %else.279

else.279:                                         ; preds = %else.277, %then.277
  %.field.ld.68 = load ptr, ptr %call.67, align 8
  %field.503 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.68, i64 0, i32 6
  %.field.ld.69 = load ptr, ptr %field.503, align 8
  %field.504 = getelementptr inbounds i8, ptr %call.67, i64 8
  %.field.ld.70 = load ptr, ptr %field.504, align 8
  call void %.field.ld.69(ptr nest undef, ptr %.field.ld.70, i8 zeroext %"$p286")
  ret void
}

define void @go_0llvm.NonWriter.Write..stub(ptr nocapture writeonly sret({ i64, %error.0 }) %sret.formal.4, ptr nest nocapture readnone %nest.65, ptr readonly %"$this287.pointer", ptr byval({ ptr, i64, i64 }) %"$p288") #0 {
entry:
  %sret.actual.30 = alloca { i64, %error.0 }, align 8
  %tmpv.467 = alloca %NonWriter.0, align 8, !go_addrtaken !3
  %call.68 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d)
  %icmp.332 = icmp eq ptr %"$this287.pointer", null
  br i1 %icmp.332, label %then.280, label %else.280, !make.implicit !3

then.280:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.280:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.467, ptr noundef nonnull align 8 dereferenceable(24) %"$this287.pointer", i64 24, i1 false)
  %deref.ld.30 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.333 = icmp eq i32 %deref.ld.30, 0
  br i1 %icmp.333, label %then.281, label %else.281

then.281:                                         ; preds = %else.280
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.68, ptr noundef nonnull align 8 dereferenceable(24) %"$this287.pointer", i64 24, i1 false)
  br label %fallthrough.281

fallthrough.281:                                  ; preds = %else.281, %then.281
  %.field.ld.71 = load ptr, ptr %call.68, align 8
  %field.507 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.71, i64 0, i32 7
  %.field.ld.72 = load ptr, ptr %field.507, align 8
  %field.508 = getelementptr inbounds i8, ptr %call.68, i64 8
  %.field.ld.73 = load ptr, ptr %field.508, align 8
  call void %.field.ld.72(ptr nonnull %sret.actual.30, ptr nest undef, ptr %.field.ld.73, ptr nonnull byval({ ptr, i64, i64 }) %"$p288")
  %tmpv.458.sroa.0.0.copyload = load i64, ptr %sret.actual.30, align 8
  %tmpv.458.sroa.2.0.cast.1799.sroa_idx = getelementptr inbounds { i64, %error.0 }, ptr %sret.actual.30, i64 0, i32 1
  %tmp.13.sroa.2.0.cast.1808.sroa_idx = getelementptr inbounds { i64, %error.0 }, ptr %sret.formal.4, i64 0, i32 1
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %tmp.13.sroa.2.0.cast.1808.sroa_idx, ptr noundef nonnull align 8 dereferenceable(16) %tmpv.458.sroa.2.0.cast.1799.sroa_idx, i64 16, i1 false)
  store i64 %tmpv.458.sroa.0.0.copyload, ptr %sret.formal.4, align 8
  ret void

else.281:                                         ; preds = %else.280
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d, ptr nonnull %call.68, ptr nonnull %tmpv.467)
  br label %fallthrough.281
}

define { ptr, ptr } @go_0llvm.NonWriter.WriteMsg..stub(ptr nest nocapture readnone %nest.66, ptr readonly %"$this289.pointer", ptr %"$p290") #0 {
entry:
  %tmpv.474 = alloca %NonWriter.0, align 8, !go_addrtaken !3
  %call.70 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d)
  %icmp.336 = icmp eq ptr %"$this289.pointer", null
  br i1 %icmp.336, label %then.284, label %else.284, !make.implicit !3

then.284:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.284:                                         ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %tmpv.474, ptr noundef nonnull align 8 dereferenceable(24) %"$this289.pointer", i64 24, i1 false)
  %deref.ld.31 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.337 = icmp eq i32 %deref.ld.31, 0
  br i1 %icmp.337, label %then.285, label %else.285

then.285:                                         ; preds = %else.284
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.70, ptr noundef nonnull align 8 dereferenceable(24) %"$this289.pointer", i64 24, i1 false)
  br label %else.287

else.285:                                         ; preds = %else.284
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.NonWriter..d, ptr nonnull %call.70, ptr nonnull %tmpv.474)
  br label %else.287

else.287:                                         ; preds = %else.285, %then.285
  %.field.ld.74 = load ptr, ptr %call.70, align 8
  %field.515 = getelementptr inbounds { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }, ptr %.field.ld.74, i64 0, i32 8
  %.field.ld.75 = load ptr, ptr %field.515, align 8
  %field.516 = getelementptr inbounds i8, ptr %call.70, i64 8
  %.field.ld.76 = load ptr, ptr %field.516, align 8
  %call.69 = call { ptr, ptr } %.field.ld.75(ptr nest undef, ptr %.field.ld.76, ptr %"$p290")
  ret { ptr, ptr } %call.69
}

declare noalias nonnull ptr @runtime.makeslice(ptr, ptr, i64, i64) local_unnamed_addr #0

; Function Attrs: noreturn
declare void @runtime.goPanicIndex(ptr, i64, i64) local_unnamed_addr #2

define nonnull ptr @go_0llvm.NewScrubWriter(ptr nest nocapture readnone %nest.17, ptr %req, ptr %w.chunk0, ptr %w.chunk1) #0 {
entry:
  %tmpv.116 = alloca %ScrubWriter.0, align 8, !go_addrtaken !3
  %call.12 = call ptr @runtime.newobject(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d)
  store ptr %w.chunk0, ptr %tmpv.116, align 8
  %w.addr.sroa.2.0.cast.1262.sroa_idx2 = getelementptr inbounds %ScrubWriter.0, ptr %tmpv.116, i64 0, i32 0, i32 1
  store ptr %w.chunk1, ptr %w.addr.sroa.2.0.cast.1262.sroa_idx2, align 8
  %field.116 = getelementptr inbounds %ScrubWriter.0, ptr %tmpv.116, i64 0, i32 1
  store ptr %req, ptr %field.116, align 8
  %deref.ld.11 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.63 = icmp eq i32 %deref.ld.11, 0
  br i1 %icmp.63, label %then.58, label %else.58

then.58:                                          ; preds = %entry
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %call.12, ptr noundef nonnull align 8 dereferenceable(24) %tmpv.116, i64 24, i1 false)
  br label %fallthrough.58

fallthrough.58:                                   ; preds = %else.58, %then.58
  ret ptr %call.12

else.58:                                          ; preds = %entry
  call void @runtime.typedmemmove(ptr nest undef, ptr nonnull @go_0llvm.ScrubWriter..d, ptr nonnull %call.12, ptr nonnull %tmpv.116)
  br label %fallthrough.58
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define i8 @go_0llvm.ClientWrite(ptr nest nocapture readnone %nest.18, i64 %rcode) #3 {
entry:
  %switch.tableidx = add i64 %rcode, -1
  %0 = icmp ult i64 %switch.tableidx, 5
  %switch.cast = trunc i64 %switch.tableidx to i40
  %switch.shiftamt = shl i40 %switch.cast, 3
  %switch.downshift = lshr i40 65536, %switch.shiftamt
  %switch.masked = trunc i40 %switch.downshift to i8
  %common.ret.op = select i1 %0, i8 %switch.masked, i8 1
  ret i8 %common.ret.op
}

define { i64, i8 } @go_0llvm.NextLabel(ptr nest nocapture readnone %nest.19, ptr nocapture readonly %s.chunk0, i64 %s.chunk1, i64 %offset) #0 {
entry:
  %icmp.64 = icmp eq i64 %s.chunk1, 0
  br i1 %icmp.64, label %common.ret, label %label.0.preheader

label.0.preheader:                                ; preds = %entry
  %sub.3 = add i64 %s.chunk1, -1
  %icmp.7838 = icmp sgt i64 %sub.3, %offset
  br i1 %icmp.7838, label %then.70.preheader, label %else.70

then.70.preheader:                                ; preds = %label.0.preheader
  %0 = add i64 %offset, -1
  %.not32 = icmp sgt i64 %offset, -1
  br label %then.70

common.ret:                                       ; preds = %entry, %else.70, %else.69
  %common.ret.op = phi { i64, i8 } [ %ld.9.fca.1.insert, %else.69 ], [ %ld.10.fca.1.insert, %else.70 ], [ { i64 0, i8 1 }, %entry ]
  ret { i64, i8 } %common.ret.op

fallthrough.62:                                   ; preds = %then.70
  %ptroff.2 = getelementptr i8, ptr %s.chunk0, i64 %i.039
  %.ptroff.ld.0 = load i8, ptr %ptroff.2, align 1
  %icmp.70.not = icmp eq i8 %.ptroff.ld.0, 46
  br i1 %icmp.70.not, label %label.3.preheader, label %label.2

label.3.preheader:                                ; preds = %fallthrough.62
  %icmp.73 = icmp slt i64 %indvars.iv, %s.chunk1
  br label %label.3

else.62:                                          ; preds = %then.70
  call void @runtime.goPanicIndex(ptr nest undef, i64 %i.039, i64 %s.chunk1)
  unreachable

label.2:                                          ; preds = %else.66, %fallthrough.62
  %add.2 = add nsw i64 %i.039, 1
  %exitcond.not = icmp eq i64 %add.2, %sub.3
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %exitcond.not, label %else.70, label %then.70

label.3:                                          ; preds = %label.3.preheader, %fallthrough.65
  %j.0.in = phi i64 [ %j.0, %fallthrough.65 ], [ %i.039, %label.3.preheader ]
  %j.0 = add i64 %j.0.in, -1
  %icmp.71 = icmp sgt i64 %j.0, -1
  br i1 %icmp.71, label %then.64, label %else.66

then.64:                                          ; preds = %label.3
  br i1 %icmp.73, label %fallthrough.65, label %else.65

fallthrough.65:                                   ; preds = %then.64
  %ptroff.3 = getelementptr i8, ptr %s.chunk0, i64 %j.0
  %.ptroff.ld.1 = load i8, ptr %ptroff.3, align 1
  %icmp.74 = icmp eq i8 %.ptroff.ld.1, 92
  br i1 %icmp.74, label %label.3, label %else.66

else.65:                                          ; preds = %then.64
  call void @runtime.goPanicIndex(ptr nest undef, i64 %j.0, i64 %s.chunk1)
  unreachable

else.66:                                          ; preds = %label.3, %fallthrough.65
  %j.0.lcssa = phi i64 [ -1, %label.3 ], [ %j.0, %fallthrough.65 ]
  %sub.2 = sub i64 %j.0.lcssa, %i.039
  %1 = and i64 %sub.2, 1
  %icmp.77 = icmp eq i64 %1, 0
  br i1 %icmp.77, label %label.2, label %else.69

else.69:                                          ; preds = %else.66
  %add.1 = add i64 %i.039, 1
  %ld.9.fca.0.insert = insertvalue { i64, i8 } undef, i64 %add.1, 0
  %ld.9.fca.1.insert = insertvalue { i64, i8 } %ld.9.fca.0.insert, i8 0, 1
  br label %common.ret

then.70:                                          ; preds = %then.70.preheader, %label.2
  %indvars.iv = phi i64 [ %0, %then.70.preheader ], [ %indvars.iv.next, %label.2 ]
  %i.039 = phi i64 [ %offset, %then.70.preheader ], [ %add.2, %label.2 ]
  %icmp.69 = icmp slt i64 %i.039, %s.chunk1
  %iand.2 = and i1 %.not32, %icmp.69
  br i1 %iand.2, label %fallthrough.62, label %else.62

else.70:                                          ; preds = %label.2, %label.0.preheader
  %i.0.lcssa = phi i64 [ %offset, %label.0.preheader ], [ %sub.3, %label.2 ]
  %add.3 = add i64 %i.0.lcssa, 1
  %ld.10.fca.0.insert = insertvalue { i64, i8 } undef, i64 %add.3, 0
  %ld.10.fca.1.insert = insertvalue { i64, i8 } %ld.10.fca.0.insert, i8 1, 1
  br label %common.ret
}

define { i64, i8 } @go_0llvm.PrevLabel(ptr nest nocapture readnone %nest.20, ptr nocapture readonly %s.chunk0, i64 %s.chunk1, i64 %n) #0 {
entry:
  %icmp.79 = icmp eq i64 %s.chunk1, 0
  br i1 %icmp.79, label %common.ret, label %else.73

common.ret:                                       ; preds = %entry, %else.87, %then.85, %then.74
  %common.ret.op = phi { i64, i8 } [ %ld.12.fca.1.insert, %then.74 ], [ %ld.13.fca.1.insert, %then.85 ], [ %ld.14.fca.1.insert, %else.87 ], [ { i64 0, i8 1 }, %entry ]
  ret { i64, i8 } %common.ret.op

else.73:                                          ; preds = %entry
  %icmp.83 = icmp eq i64 %n, 0
  br i1 %icmp.83, label %then.74, label %else.74

then.74:                                          ; preds = %else.73
  %ld.12.fca.0.insert = insertvalue { i64, i8 } undef, i64 %s.chunk1, 0
  %ld.12.fca.1.insert = insertvalue { i64, i8 } %ld.12.fca.0.insert, i8 0, 1
  br label %common.ret

else.74:                                          ; preds = %else.73
  %sub.4 = add i64 %s.chunk1, -1
  %iand.4 = icmp sgt i64 %s.chunk1, 0
  br i1 %iand.4, label %fallthrough.75, label %else.75

fallthrough.75:                                   ; preds = %else.74
  %ptroff.4 = getelementptr i8, ptr %s.chunk0, i64 %sub.4
  %.ptroff.ld.2 = load i8, ptr %ptroff.4, align 1
  %icmp.86 = icmp eq i8 %.ptroff.ld.2, 46
  %sub.5 = add nsw i64 %s.chunk1, -2
  %spec.select = select i1 %icmp.86, i64 %sub.5, i64 %sub.4
  %l.1.lobit62 = lshr i64 %spec.select, 63
  %0 = trunc i64 %l.1.lobit62 to i8
  %.not63 = xor i8 %0, 1
  %icmp.9964 = icmp sgt i64 %n, 0
  %zext.9965 = zext i1 %icmp.9964 to i8
  %icmp.98611 = icmp slt i64 %spec.select, 0
  %tmpv.148.066 = select i1 %icmp.98611, i8 %.not63, i8 %zext.9965
  %trunc.90.not67 = icmp eq i8 %tmpv.148.066, 0
  br i1 %trunc.90.not67, label %else.87, label %then.87

else.75:                                          ; preds = %else.74
  call void @runtime.goPanicIndex(ptr nest undef, i64 %sub.4, i64 %s.chunk1)
  unreachable

fallthrough.77:                                   ; preds = %then.87
  %ptroff.5 = getelementptr i8, ptr %s.chunk0, i64 %l.168
  %.ptroff.ld.3 = load i8, ptr %ptroff.5, align 1
  %icmp.89.not = icmp eq i8 %.ptroff.ld.3, 46
  br i1 %icmp.89.not, label %label.3.preheader, label %label.2

label.3.preheader:                                ; preds = %fallthrough.77
  %icmp.92 = icmp slt i64 %indvars.iv, %s.chunk1
  br label %label.3

else.77:                                          ; preds = %then.87
  call void @runtime.goPanicIndex(ptr nest undef, i64 %l.168, i64 %s.chunk1)
  unreachable

label.2:                                          ; preds = %else.84, %else.81, %fallthrough.77
  %n.addr.1 = phi i64 [ %n.addr.070, %fallthrough.77 ], [ %n.addr.070, %else.81 ], [ %sub.9, %else.84 ]
  %sub.10 = add i64 %l.168, -1
  %l.1.lobit = lshr i64 %sub.10, 63
  %1 = trunc i64 %l.1.lobit to i8
  %.not = xor i8 %1, 1
  %icmp.99 = icmp sgt i64 %n.addr.1, 0
  %zext.99 = zext i1 %icmp.99 to i8
  %icmp.984 = icmp slt i64 %sub.10, 0
  %tmpv.148.0 = select i1 %icmp.984, i8 %.not, i8 %zext.99
  %trunc.90.not = icmp eq i8 %tmpv.148.0, 0
  br i1 %trunc.90.not, label %else.87, label %then.87

label.3:                                          ; preds = %label.3.preheader, %fallthrough.80
  %j.0.in = phi i64 [ %j.0, %fallthrough.80 ], [ %l.168, %label.3.preheader ]
  %j.0 = add i64 %j.0.in, -1
  %icmp.90 = icmp sgt i64 %j.0, -1
  br i1 %icmp.90, label %then.79, label %else.81

then.79:                                          ; preds = %label.3
  br i1 %icmp.92, label %fallthrough.80, label %else.80

fallthrough.80:                                   ; preds = %then.79
  %ptroff.6 = getelementptr i8, ptr %s.chunk0, i64 %j.0
  %.ptroff.ld.4 = load i8, ptr %ptroff.6, align 1
  %icmp.93 = icmp eq i8 %.ptroff.ld.4, 92
  br i1 %icmp.93, label %label.3, label %else.81

else.80:                                          ; preds = %then.79
  call void @runtime.goPanicIndex(ptr nest undef, i64 %j.0, i64 %s.chunk1)
  unreachable

else.81:                                          ; preds = %label.3, %fallthrough.80
  %sub.8 = sub i64 %j.0, %l.168
  %2 = and i64 %sub.8, 1
  %icmp.96 = icmp eq i64 %2, 0
  br i1 %icmp.96, label %label.2, label %else.84

else.84:                                          ; preds = %else.81
  %sub.9 = add i64 %n.addr.070, -1
  %icmp.97 = icmp eq i64 %sub.9, 0
  br i1 %icmp.97, label %then.85, label %label.2

then.85:                                          ; preds = %else.84
  %add.4 = add i64 %l.168, 1
  %ld.13.fca.0.insert = insertvalue { i64, i8 } undef, i64 %add.4, 0
  %ld.13.fca.1.insert = insertvalue { i64, i8 } %ld.13.fca.0.insert, i8 0, 1
  br label %common.ret

then.87:                                          ; preds = %fallthrough.75, %label.2
  %indvars.iv.in = phi i64 [ %indvars.iv, %label.2 ], [ %spec.select, %fallthrough.75 ]
  %.not71 = phi i8 [ %.not, %label.2 ], [ %.not63, %fallthrough.75 ]
  %n.addr.070 = phi i64 [ %n.addr.1, %label.2 ], [ %n, %fallthrough.75 ]
  %l.168 = phi i64 [ %sub.10, %label.2 ], [ %spec.select, %fallthrough.75 ]
  %indvars.iv = add i64 %indvars.iv.in, -1
  %icmp.88 = icmp sge i64 %l.168, %s.chunk1
  %3 = icmp eq i8 %.not71, 0
  %.not3 = or i1 %3, %icmp.88
  br i1 %.not3, label %else.77, label %fallthrough.77

else.87:                                          ; preds = %label.2, %fallthrough.75
  %n.addr.0.lcssa = phi i64 [ %n, %fallthrough.75 ], [ %n.addr.1, %label.2 ]
  %icmp.100 = icmp sgt i64 %n.addr.0.lcssa, 1
  %zext.100 = zext i1 %icmp.100 to i8
  %ld.14.fca.1.insert = insertvalue { i64, i8 } { i64 0, i8 undef }, i8 %zext.100, 1
  br label %common.ret
}

; Function Attrs: cold
declare void @runtime.growslice(ptr, ptr, ptr, ptr, i64, i64, i64) local_unnamed_addr #4

define i8 @go_0llvm.SupportedOption(ptr nest nocapture readnone %nest.27, i16 zeroext %option) #0 {
entry:
  %tmpv.195 = alloca i16, align 2, !go_addrtaken !3
  %go_0llvm.sup.ld.0 = load ptr, ptr @go_0llvm.sup, align 8
  call void @go_0llvm.supported.RLock..stub(ptr nest poison, ptr %go_0llvm.sup.ld.0)
  store i16 %option, ptr %tmpv.195, align 2
  %go_0llvm.sup.ld.1 = load ptr, ptr @go_0llvm.sup, align 8
  %icmp.131 = icmp eq ptr %go_0llvm.sup.ld.1, null
  br i1 %icmp.131, label %then.117, label %go_0llvm.supported.RUnlock..stub.exit, !make.implicit !3

then.117:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

go_0llvm.supported.RUnlock..stub.exit:            ; preds = %entry
  %.field.ld.20 = load ptr, ptr %go_0llvm.sup.ld.1, align 8
  %call.18 = call { ptr, i8 } @runtime.mapaccess2(ptr nest undef, ptr nonnull @type..map_6uint16_7struct_4_5, ptr %.field.ld.20, ptr nonnull %tmpv.195)
  %call.18.fca.1.extract = extractvalue { ptr, i8 } %call.18, 1
  %field.473.i = getelementptr inbounds %.go.llvm.supported.0, ptr %go_0llvm.sup.ld.1, i64 0, i32 1
  call void @sync.RWMutex.RUnlock(ptr nest undef, ptr nonnull %field.473.i)
  ret i8 %call.18.fca.1.extract
}

; Function Attrs: nofree memory(read)
declare { ptr, i8 } @runtime.mapaccess2(ptr, ptr, ptr, ptr) local_unnamed_addr #5

define { ptr, ptr } @go_0llvm.Copy(ptr nest nocapture readnone %nest.28, ptr nocapture readonly %r.chunk0, ptr %r.chunk1) #0 {
entry:
  %field.230 = getelementptr inbounds i8, ptr %r.chunk0, i64 16
  %.field.ld.21 = load ptr, ptr %field.230, align 8
  %call.19 = call { ptr, ptr } %.field.ld.21(ptr nest undef, ptr %r.chunk1)
  ret { ptr, ptr } %call.19
}

define i8 @go_0llvm.IsSubDomain(ptr nest nocapture readnone %nest.29, ptr readonly %parent.chunk0, i64 %parent.chunk1, ptr readonly %child.chunk0, i64 %child.chunk1) #0 {
entry:
  %call.20 = call i64 @go_0llvm.CompareDomainName(ptr nest poison, ptr %parent.chunk0, i64 %parent.chunk1, ptr %child.chunk0, i64 %child.chunk1)
  %call.21 = call i64 @go_0llvm.CountLabel(ptr nest poison, ptr %parent.chunk0, i64 %parent.chunk1)
  %icmp.132 = icmp eq i64 %call.20, %call.21
  %zext.134 = zext i1 %icmp.132 to i8
  ret i8 %zext.134
}

define i64 @go_0llvm.CompareDomainName(ptr nest nocapture readnone %nest.30, ptr readonly %s1.chunk0, i64 %s1.chunk1, ptr readonly %s2.chunk0, i64 %s2.chunk1) #0 {
entry:
  %sret.actual.5 = alloca %IPST.35, align 8
  %sret.actual.6 = alloca %IPST.35, align 8
  %icmp.133 = icmp eq i64 %s1.chunk1, 1
  br i1 %icmp.133, label %then.118, label %then.120

then.118:                                         ; preds = %entry
  %icmp.134 = icmp eq ptr %s1.chunk0, @const.399
  br i1 %icmp.134, label %then.123, label %else.119

else.119:                                         ; preds = %then.118
  %lhsc140 = load i8, ptr %s1.chunk0, align 1
  %icmp.135 = icmp eq i8 %lhsc140, 46
  br i1 %icmp.135, label %then.123, label %then.120

then.120:                                         ; preds = %entry, %else.119
  %icmp.137 = icmp eq i64 %s2.chunk1, 1
  br i1 %icmp.137, label %then.121, label %else.123

then.121:                                         ; preds = %then.120
  %icmp.138 = icmp eq ptr %s2.chunk0, @const.399
  br i1 %icmp.138, label %then.123, label %else.122

else.122:                                         ; preds = %then.121
  %lhsc = load i8, ptr %s2.chunk0, align 1
  %icmp.139 = icmp eq i8 %lhsc, 46
  br i1 %icmp.139, label %then.123, label %else.123

then.123:                                         ; preds = %then.143, %fallthrough.140, %else.119, %then.118, %label.0.preheader, %fallthrough.127, %then.121, %else.122
  %merge = phi i64 [ 0, %fallthrough.127 ], [ 0, %else.122 ], [ 0, %then.121 ], [ 1, %label.0.preheader ], [ 0, %then.118 ], [ 0, %else.119 ], [ %n.0200, %fallthrough.140 ], [ %3, %then.143 ]
  ret i64 %merge

else.123:                                         ; preds = %else.122, %then.120
  call void @go_0llvm.Split(ptr nonnull %sret.actual.5, ptr nest poison, ptr %s1.chunk0, i64 %s1.chunk1)
  %l1.sroa.0.0.copyload = load ptr, ptr %sret.actual.5, align 8
  %l1.sroa.8.0.cast.1364.sroa_idx101 = getelementptr inbounds %IPST.35, ptr %sret.actual.5, i64 0, i32 1
  %l1.sroa.8.0.copyload = load i64, ptr %l1.sroa.8.0.cast.1364.sroa_idx101, align 8
  call void @go_0llvm.Split(ptr nonnull %sret.actual.6, ptr nest poison, ptr %s2.chunk0, i64 %s2.chunk1)
  %l2.sroa.0.0.copyload = load ptr, ptr %sret.actual.6, align 8
  %l2.sroa.8.0.cast.1367.sroa_idx88 = getelementptr inbounds %IPST.35, ptr %sret.actual.6, i64 0, i32 1
  %l2.sroa.8.0.copyload = load i64, ptr %l2.sroa.8.0.cast.1367.sroa_idx88, align 8
  %l2.sroa.8.0.copyload.fr = freeze i64 %l2.sroa.8.0.copyload
  %sub.17 = add i64 %l1.sroa.8.0.copyload, -1
  %sub.18 = add i64 %l1.sroa.8.0.copyload, -2
  %sub.19 = add i64 %l2.sroa.8.0.copyload.fr, -1
  %sub.20 = add i64 %l2.sroa.8.0.copyload.fr, -2
  %iand.12 = icmp sgt i64 %l1.sroa.8.0.copyload, 0
  br i1 %iand.12, label %fallthrough.124, label %else.124

fallthrough.124:                                  ; preds = %else.123
  %ptroff.13 = getelementptr i64, ptr %l1.sroa.0.0.copyload, i64 %sub.17
  %.ptroff.ld.6 = load i64, ptr %ptroff.13, align 8
  %.not129 = icmp sgt i64 %.ptroff.ld.6, -1
  %icmp.145 = icmp sle i64 %.ptroff.ld.6, %s1.chunk1
  %iand.13 = and i1 %.not129, %icmp.145
  br i1 %iand.13, label %fallthrough.125, label %else.125

else.124:                                         ; preds = %else.123
  call void @runtime.goPanicIndex(ptr nest undef, i64 %sub.17, i64 %l1.sroa.8.0.copyload)
  unreachable

fallthrough.125:                                  ; preds = %fallthrough.124
  %iand.14 = icmp sgt i64 %l2.sroa.8.0.copyload.fr, 0
  br i1 %iand.14, label %fallthrough.126, label %else.126

else.125:                                         ; preds = %fallthrough.124
  call void @runtime.goPanicSliceB(ptr nest undef, i64 %.ptroff.ld.6, i64 %s1.chunk1)
  unreachable

fallthrough.126:                                  ; preds = %fallthrough.125
  %ptroff.14 = getelementptr i64, ptr %l2.sroa.0.0.copyload, i64 %sub.19
  %.ptroff.ld.7 = load i64, ptr %ptroff.14, align 8
  %.not131 = icmp sgt i64 %.ptroff.ld.7, -1
  %icmp.149 = icmp sle i64 %.ptroff.ld.7, %s2.chunk1
  %iand.15 = and i1 %.not131, %icmp.149
  br i1 %iand.15, label %fallthrough.127, label %else.127

else.126:                                         ; preds = %fallthrough.125
  call void @runtime.goPanicIndex(ptr nest undef, i64 %sub.19, i64 %l2.sroa.8.0.copyload.fr)
  unreachable

fallthrough.127:                                  ; preds = %fallthrough.126
  %sub.21 = sub i64 %s1.chunk1, %.ptroff.ld.6
  %icmp.150 = icmp eq i64 %.ptroff.ld.6, %s1.chunk1
  %..ptroff.ld.6 = select i1 %icmp.150, i64 0, i64 %.ptroff.ld.6
  %ptroff.15 = getelementptr i8, ptr %s1.chunk0, i64 %..ptroff.ld.6
  %sub.23 = sub i64 %s2.chunk1, %.ptroff.ld.7
  %icmp.151 = icmp eq i64 %.ptroff.ld.7, %s2.chunk1
  %..ptroff.ld.7 = select i1 %icmp.151, i64 0, i64 %.ptroff.ld.7
  %ptroff.16 = getelementptr i8, ptr %s2.chunk0, i64 %..ptroff.ld.7
  %call.24 = call fastcc i8 @go_0llvm.equal(ptr %ptroff.15, i64 %sub.21, ptr %ptroff.16, i64 %sub.23)
  %0 = and i8 %call.24, 1
  %trunc.134.not = icmp eq i8 %0, 0
  br i1 %trunc.134.not, label %then.123, label %label.0.preheader

label.0.preheader:                                ; preds = %fallthrough.127
  %1 = or i64 %sub.18, %sub.20
  %tmpv.222.0195.not = icmp sgt i64 %1, -1
  br i1 %tmpv.222.0195.not, label %else.132.preheader, label %then.123

else.132.preheader:                               ; preds = %label.0.preheader
  %2 = add nuw i64 %l1.sroa.8.0.copyload, 1
  %umin = call i64 @llvm.umin.i64(i64 %sub.20, i64 %sub.18)
  %3 = add nsw i64 %umin, 2
  br label %else.132

else.127:                                         ; preds = %fallthrough.126
  call void @runtime.goPanicSliceB(ptr nest undef, i64 %.ptroff.ld.7, i64 %s2.chunk1)
  unreachable

else.132:                                         ; preds = %else.132.preheader, %then.143
  %icmp.152201 = phi i1 [ %icmp.152, %then.143 ], [ true, %else.132.preheader ]
  %n.0200 = phi i64 [ %add.11, %then.143 ], [ 1, %else.132.preheader ]
  %j1.0199 = phi i64 [ %sub.29, %then.143 ], [ %sub.17, %else.132.preheader ]
  %i1.0198 = phi i64 [ %sub.30, %then.143 ], [ %sub.18, %else.132.preheader ]
  %j2.0197 = phi i64 [ %sub.31, %then.143 ], [ %sub.19, %else.132.preheader ]
  %i2.0196 = phi i64 [ %sub.32, %then.143 ], [ %sub.20, %else.132.preheader ]
  br i1 %icmp.152201, label %fallthrough.133, label %else.133

fallthrough.133:                                  ; preds = %else.132
  %exitcond.not = icmp eq i64 %n.0200, %2
  br i1 %exitcond.not, label %else.134, label %fallthrough.134

else.133:                                         ; preds = %else.132
  call void @runtime.goPanicIndex(ptr nest undef, i64 %i1.0198, i64 %l1.sroa.8.0.copyload)
  unreachable

fallthrough.134:                                  ; preds = %fallthrough.133
  %ptroff.17 = getelementptr i64, ptr %l1.sroa.0.0.copyload, i64 %i1.0198
  %.ptroff.ld.8 = load i64, ptr %ptroff.17, align 8
  %ptroff.18 = getelementptr i64, ptr %l1.sroa.0.0.copyload, i64 %j1.0199
  %.ptroff.ld.9 = load i64, ptr %ptroff.18, align 8
  %.not134 = icmp sgt i64 %.ptroff.ld.9, -1
  %icmp.160 = icmp sle i64 %.ptroff.ld.9, %s1.chunk1
  %iand.18 = and i1 %.not134, %icmp.160
  br i1 %iand.18, label %fallthrough.135, label %else.135

else.134:                                         ; preds = %fallthrough.133
  call void @runtime.goPanicIndex(ptr nest undef, i64 -1, i64 %l1.sroa.8.0.copyload)
  unreachable

fallthrough.135:                                  ; preds = %fallthrough.134
  %.not135 = icmp sgt i64 %.ptroff.ld.8, -1
  %icmp.162 = icmp sge i64 %.ptroff.ld.9, %.ptroff.ld.8
  %iand.19 = and i1 %.not135, %icmp.162
  br i1 %iand.19, label %fallthrough.138, label %else.136

else.135:                                         ; preds = %fallthrough.134
  call void @runtime.goPanicSliceAlen(ptr nest undef, i64 %.ptroff.ld.9, i64 %s1.chunk1)
  unreachable

else.136:                                         ; preds = %fallthrough.135
  call void @runtime.goPanicSliceB(ptr nest undef, i64 %.ptroff.ld.8, i64 %.ptroff.ld.9)
  unreachable

fallthrough.138:                                  ; preds = %fallthrough.135
  %ptroff.19 = getelementptr i64, ptr %l2.sroa.0.0.copyload, i64 %i2.0196
  %.ptroff.ld.10 = load i64, ptr %ptroff.19, align 8
  %ptroff.20 = getelementptr i64, ptr %l2.sroa.0.0.copyload, i64 %j2.0197
  %.ptroff.ld.11 = load i64, ptr %ptroff.20, align 8
  %.not138 = icmp sgt i64 %.ptroff.ld.11, -1
  %icmp.168 = icmp sle i64 %.ptroff.ld.11, %s2.chunk1
  %iand.22 = and i1 %.not138, %icmp.168
  br i1 %iand.22, label %fallthrough.139, label %else.139

fallthrough.139:                                  ; preds = %fallthrough.138
  %.not139 = icmp sgt i64 %.ptroff.ld.10, -1
  %icmp.170 = icmp sge i64 %.ptroff.ld.11, %.ptroff.ld.10
  %iand.23 = and i1 %.not139, %icmp.170
  br i1 %iand.23, label %fallthrough.140, label %else.140

else.139:                                         ; preds = %fallthrough.138
  call void @runtime.goPanicSliceAlen(ptr nest undef, i64 %.ptroff.ld.11, i64 %s2.chunk1)
  unreachable

fallthrough.140:                                  ; preds = %fallthrough.139
  %sub.25 = sub nsw i64 %.ptroff.ld.9, %.ptroff.ld.8
  %icmp.171 = icmp eq i64 %.ptroff.ld.9, %.ptroff.ld.8
  %..ptroff.ld.8 = select i1 %icmp.171, i64 0, i64 %.ptroff.ld.8
  %ptroff.21 = getelementptr i8, ptr %s1.chunk0, i64 %..ptroff.ld.8
  %sub.27 = sub nsw i64 %.ptroff.ld.11, %.ptroff.ld.10
  %icmp.172 = icmp eq i64 %.ptroff.ld.11, %.ptroff.ld.10
  %..ptroff.ld.10 = select i1 %icmp.172, i64 0, i64 %.ptroff.ld.10
  %ptroff.22 = getelementptr i8, ptr %s2.chunk0, i64 %..ptroff.ld.10
  %call.25 = call fastcc i8 @go_0llvm.equal(ptr %ptroff.21, i64 %sub.25, ptr %ptroff.22, i64 %sub.27)
  %4 = and i8 %call.25, 1
  %trunc.147.not = icmp eq i8 %4, 0
  br i1 %trunc.147.not, label %then.123, label %then.143

else.140:                                         ; preds = %fallthrough.139
  call void @runtime.goPanicSliceB(ptr nest undef, i64 %.ptroff.ld.10, i64 %.ptroff.ld.11)
  unreachable

then.143:                                         ; preds = %fallthrough.140
  %add.11 = add nuw i64 %n.0200, 1
  %sub.29 = add nsw i64 %j1.0199, -1
  %sub.30 = add i64 %i1.0198, -1
  %sub.31 = add i64 %j2.0197, -1
  %sub.32 = add nsw i64 %i2.0196, -1
  %icmp.152 = icmp sgt i64 %sub.30, -1
  %exitcond39.not = icmp eq i64 %add.11, %3
  br i1 %exitcond39.not, label %then.123, label %else.132
}

define i64 @go_0llvm.CountLabel(ptr nest nocapture readnone %nest.33, ptr readonly %s.chunk0, i64 %s.chunk1) #0 {
entry:
  %icmp.190 = icmp eq i64 %s.chunk1, 1
  br i1 %icmp.190, label %then.159, label %label.0.preheader

label.0.preheader:                                ; preds = %else.160, %entry
  br label %label.0

then.159:                                         ; preds = %entry
  %icmp.191 = icmp eq ptr %s.chunk0, @const.399
  br i1 %icmp.191, label %then.161, label %else.160

else.160:                                         ; preds = %then.159
  %lhsc = load i8, ptr %s.chunk0, align 1
  %icmp.192 = icmp eq i8 %lhsc, 46
  br i1 %icmp.192, label %then.161, label %label.0.preheader

then.161:                                         ; preds = %label.0, %else.160, %then.159
  %merge = phi i64 [ 0, %else.160 ], [ 0, %then.159 ], [ %add.14, %label.0 ]
  ret i64 %merge

label.0:                                          ; preds = %label.0.preheader, %label.0
  %off.0 = phi i64 [ %call.30.fca.0.extract, %label.0 ], [ 0, %label.0.preheader ]
  %labels.0 = phi i64 [ %add.14, %label.0 ], [ 0, %label.0.preheader ]
  %call.30 = call { i64, i8 } @go_0llvm.NextLabel(ptr nest poison, ptr %s.chunk0, i64 %s.chunk1, i64 %off.0)
  %call.30.fca.0.extract = extractvalue { i64, i8 } %call.30, 0
  %call.30.fca.1.extract = extractvalue { i64, i8 } %call.30, 1
  %add.14 = add i64 %labels.0, 1
  %0 = and i8 %call.30.fca.1.extract, 1
  %trunc.166.not = icmp eq i8 %0, 0
  br i1 %trunc.166.not, label %label.0, label %then.161
}

define void @go_0llvm.Split(ptr nocapture writeonly sret(%IPST.35) %sret.formal.1, ptr nest nocapture readnone %nest.31, ptr readonly %s.chunk0, i64 %s.chunk1) #0 {
entry:
  %sret.actual.8 = alloca { ptr, i64, i64 }, align 8
  %icmp.173 = icmp eq i64 %s.chunk1, 1
  br i1 %icmp.173, label %then.144, label %else.146

then.144:                                         ; preds = %entry
  %icmp.174 = icmp eq ptr %s.chunk0, @const.399
  br i1 %icmp.174, label %then.146, label %else.145

else.145:                                         ; preds = %then.144
  %lhsc = load i8, ptr %s.chunk0, align 1
  %icmp.175 = icmp eq i8 %lhsc, 46
  br i1 %icmp.175, label %then.146, label %else.146

common.ret:                                       ; preds = %then.147, %then.146
  ret void

then.146:                                         ; preds = %else.145, %then.144
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %sret.formal.1, i8 0, i64 24, i1 false)
  br label %common.ret

else.146:                                         ; preds = %else.145, %entry
  %call.27 = call ptr @runtime.makeslice(ptr nest undef, ptr nonnull @int..d, i64 1, i64 3)
  %0 = getelementptr inbounds { ptr, i64, i64 }, ptr %sret.actual.8, i64 0, i32 1
  %1 = getelementptr inbounds { ptr, i64, i64 }, ptr %sret.actual.8, i64 0, i32 2
  %call.2853 = call { i64, i8 } @go_0llvm.NextLabel(ptr nest poison, ptr %s.chunk0, i64 %s.chunk1, i64 0)
  %call.28.fca.1.extract55 = extractvalue { i64, i8 } %call.2853, 1
  %2 = and i8 %call.28.fca.1.extract55, 1
  %trunc.151.not56 = icmp eq i8 %2, 0
  br i1 %trunc.151.not56, label %else.147, label %then.147

then.147:                                         ; preds = %fallthrough.148, %else.146
  %idx.sroa.0.0.lcssa = phi ptr [ %call.27, %else.146 ], [ %idx.sroa.0.1, %fallthrough.148 ]
  %idx.sroa.9.0.lcssa = phi i64 [ 1, %else.146 ], [ %idx.sroa.9.1, %fallthrough.148 ]
  %idx.sroa.13.0.lcssa = phi i64 [ 3, %else.146 ], [ %idx.sroa.13.1, %fallthrough.148 ]
  store ptr %idx.sroa.0.0.lcssa, ptr %sret.formal.1, align 8
  %"$ret24.sroa.8.0.cast.1385.sroa_idx40" = getelementptr inbounds %IPST.35, ptr %sret.formal.1, i64 0, i32 1
  store i64 %idx.sroa.9.0.lcssa, ptr %"$ret24.sroa.8.0.cast.1385.sroa_idx40", align 8
  %"$ret24.sroa.9.0.cast.1385.sroa_idx47" = getelementptr inbounds %IPST.35, ptr %sret.formal.1, i64 0, i32 2
  store i64 %idx.sroa.13.0.lcssa, ptr %"$ret24.sroa.9.0.cast.1385.sroa_idx47", align 8
  br label %common.ret

else.147:                                         ; preds = %else.146, %fallthrough.148
  %call.28.pn = phi { i64, i8 } [ %call.28, %fallthrough.148 ], [ %call.2853, %else.146 ]
  %idx.sroa.13.059 = phi i64 [ %idx.sroa.13.1, %fallthrough.148 ], [ 3, %else.146 ]
  %idx.sroa.9.058 = phi i64 [ %idx.sroa.9.1, %fallthrough.148 ], [ 1, %else.146 ]
  %idx.sroa.0.057 = phi ptr [ %idx.sroa.0.1, %fallthrough.148 ], [ %call.27, %else.146 ]
  %call.28.fca.0.extract60 = extractvalue { i64, i8 } %call.28.pn, 0
  %add.12 = add i64 %idx.sroa.9.058, 1
  %icmp.178 = icmp ugt i64 %add.12, %idx.sroa.13.059
  br i1 %icmp.178, label %then.148, label %fallthrough.148

then.148:                                         ; preds = %else.147
  call void @runtime.growslice(ptr nonnull %sret.actual.8, ptr nest undef, ptr nonnull @int..d, ptr nonnull %idx.sroa.0.057, i64 %idx.sroa.9.058, i64 %idx.sroa.13.059, i64 %add.12)
  %idx.sroa.0.0.copyload19 = load ptr, ptr %sret.actual.8, align 8
  %idx.sroa.9.0.copyload24 = load i64, ptr %0, align 8
  %idx.sroa.13.0.copyload29 = load i64, ptr %1, align 8
  br label %fallthrough.148

fallthrough.148:                                  ; preds = %then.148, %else.147
  %idx.sroa.0.1 = phi ptr [ %idx.sroa.0.0.copyload19, %then.148 ], [ %idx.sroa.0.057, %else.147 ]
  %idx.sroa.9.1 = phi i64 [ %idx.sroa.9.0.copyload24, %then.148 ], [ %add.12, %else.147 ]
  %idx.sroa.13.1 = phi i64 [ %idx.sroa.13.0.copyload29, %then.148 ], [ %idx.sroa.13.059, %else.147 ]
  %ptroff.24 = getelementptr i64, ptr %idx.sroa.0.1, i64 %idx.sroa.9.058
  store i64 %call.28.fca.0.extract60, ptr %ptroff.24, align 8
  %call.28 = call { i64, i8 } @go_0llvm.NextLabel(ptr nest poison, ptr %s.chunk0, i64 %s.chunk1, i64 %call.28.fca.0.extract60)
  %call.28.fca.1.extract = extractvalue { i64, i8 } %call.28, 1
  %3 = and i8 %call.28.fca.1.extract, 1
  %trunc.151.not = icmp eq i8 %3, 0
  br i1 %trunc.151.not, label %else.147, label %then.147
}

; Function Attrs: noreturn
declare void @runtime.goPanicSliceB(ptr, i64, i64) local_unnamed_addr #2

define internal fastcc i8 @go_0llvm.equal(ptr nocapture readonly %a.chunk0, i64 %a.chunk1, ptr nocapture readonly %b.chunk0, i64 %b.chunk1) unnamed_addr #0 {
entry:
  %icmp.179.not = icmp eq i64 %a.chunk1, %b.chunk1
  br i1 %icmp.179.not, label %label.0.preheader, label %then.150

label.0.preheader:                                ; preds = %entry
  %icmp.181.not = icmp eq i64 %a.chunk1, -9223372036854775808
  br label %label.0

then.150:                                         ; preds = %fallthrough.152, %label.0, %entry
  %merge = phi i8 [ 0, %entry ], [ 1, %label.0 ], [ 0, %fallthrough.152 ]
  ret i8 %merge

label.0:                                          ; preds = %label.0.preheader, %fallthrough.152
  %i.0.in = phi i64 [ %i.0, %fallthrough.152 ], [ %a.chunk1, %label.0.preheader ]
  %i.0 = add i64 %i.0.in, -1
  %icmp.189 = icmp sgt i64 %i.0, -1
  br i1 %icmp.189, label %then.158, label %then.150

else.151:                                         ; preds = %then.158
  call void @runtime.goPanicIndex(ptr nest undef, i64 %i.0, i64 %a.chunk1)
  unreachable

fallthrough.152:                                  ; preds = %then.158
  %ptroff.25 = getelementptr i8, ptr %a.chunk0, i64 %i.0
  %.ptroff.ld.12 = load i8, ptr %ptroff.25, align 1
  %ptroff.26 = getelementptr i8, ptr %b.chunk0, i64 %i.0
  %.ptroff.ld.13 = load i8, ptr %ptroff.26, align 1
  %.ptroff.ld.12.off = add i8 %.ptroff.ld.12, -65
  %0 = icmp ult i8 %.ptroff.ld.12.off, 26
  %ior.151 = or i8 %.ptroff.ld.12, 32
  %ai.0 = select i1 %0, i8 %ior.151, i8 %.ptroff.ld.12
  %.ptroff.ld.13.off = add i8 %.ptroff.ld.13, -65
  %1 = icmp ult i8 %.ptroff.ld.13.off, 26
  %ior.152 = or i8 %.ptroff.ld.13, 32
  %bi.0 = select i1 %1, i8 %ior.152, i8 %.ptroff.ld.13
  %icmp.188.not = icmp eq i8 %ai.0, %bi.0
  br i1 %icmp.188.not, label %label.0, label %then.150

then.158:                                         ; preds = %label.0
  br i1 %icmp.181.not, label %else.151, label %fallthrough.152
}

; Function Attrs: noreturn
declare void @runtime.goPanicSliceAlen(ptr, i64, i64) local_unnamed_addr #2

define void @go_0llvm.SplitDomainName(ptr nocapture writeonly sret(%IPST.2) %sret.formal.2, ptr nest nocapture readnone %nest.34, ptr %s.chunk0, i64 %s.chunk1) #0 {
entry:
  %sret.actual.10 = alloca %IPST.35, align 8
  %sret.actual.11 = alloca { ptr, i64, i64 }, align 8
  %sret.actual.12 = alloca { ptr, i64, i64 }, align 8
  %icmp.194 = icmp eq i64 %s.chunk1, 0
  br i1 %icmp.194, label %then.165, label %else.165

common.ret:                                       ; preds = %fallthrough.186, %case.9, %then.165
  ret void

then.165:                                         ; preds = %entry
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %sret.formal.2, i8 0, i64 24, i1 false)
  br label %common.ret

else.165:                                         ; preds = %entry
  call void @go_0llvm.Split(ptr nonnull %sret.actual.10, ptr nest poison, ptr %s.chunk0, i64 %s.chunk1)
  %idx.sroa.0.0.copyload = load ptr, ptr %sret.actual.10, align 8
  %idx.sroa.6.0.cast.1411.sroa_idx67 = getelementptr inbounds %IPST.35, ptr %sret.actual.10, i64 0, i32 1
  %idx.sroa.6.0.copyload = load i64, ptr %idx.sroa.6.0.cast.1411.sroa_idx67, align 8
  %idx.sroa.9.0.cast.1411.sroa_idx71 = getelementptr inbounds %IPST.35, ptr %sret.actual.10, i64 0, i32 2
  %idx.sroa.9.0.copyload = load i64, ptr %idx.sroa.9.0.cast.1411.sroa_idx71, align 8
  %call.32 = call i8 @go_0llvm.IsFqdn(ptr nest poison, ptr %s.chunk0, i64 %s.chunk1)
  %0 = and i8 %call.32, 1
  %sext = sub nsw i8 0, %0
  %sub.38 = sext i8 %sext to i64
  %fqdnEnd.0 = add i64 %sub.38, %s.chunk1
  switch i64 %idx.sroa.6.0.copyload, label %default.1 [
    i64 0, label %case.9
    i64 1, label %label.0
  ]

case.9:                                           ; preds = %else.165
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %sret.formal.2, i8 0, i64 24, i1 false)
  br label %common.ret

default.1:                                        ; preds = %else.165
  %icmp.199 = icmp sgt i64 %idx.sroa.9.0.copyload, 0
  br i1 %icmp.199, label %fallthrough.167, label %else.167

label.0:                                          ; preds = %fallthrough.176, %fallthrough.167, %else.165
  %begin.0 = phi i64 [ 0, %else.165 ], [ 0, %fallthrough.167 ], [ %.ptroff.ld.14, %fallthrough.176 ]
  %labels.sroa.0.0 = phi ptr [ null, %else.165 ], [ null, %fallthrough.167 ], [ %labels.sroa.0.2, %fallthrough.176 ]
  %labels.sroa.18.0 = phi i64 [ 0, %else.165 ], [ 0, %fallthrough.167 ], [ %labels.sroa.18.2, %fallthrough.176 ]
  %labels.sroa.24.0 = phi i64 [ 0, %else.165 ], [ 0, %fallthrough.167 ], [ %labels.sroa.24.2, %fallthrough.176 ]
  %.not135 = icmp sgt i64 %fqdnEnd.0, -1
  %icmp.216 = icmp sle i64 %fqdnEnd.0, %s.chunk1
  %iand.30 = and i1 %.not135, %icmp.216
  br i1 %iand.30, label %fallthrough.180, label %else.180

fallthrough.167:                                  ; preds = %default.1
  %icmp.200 = icmp ne i64 %idx.sroa.9.0.copyload, 1
  %. = zext i1 %icmp.200 to i64
  %ptroff.27 = getelementptr i64, ptr %idx.sroa.0.0.copyload, i64 %.
  %sub.40 = add i64 %idx.sroa.6.0.copyload, -1
  %1 = getelementptr inbounds { ptr, i64, i64 }, ptr %sret.actual.11, i64 0, i32 1
  %2 = getelementptr inbounds { ptr, i64, i64 }, ptr %sret.actual.11, i64 0, i32 2
  %icmp.214163 = icmp sgt i64 %sub.40, 0
  br i1 %icmp.214163, label %then.179, label %label.0

else.167:                                         ; preds = %default.1
  call void @runtime.goPanicSliceB(ptr nest undef, i64 1, i64 %idx.sroa.9.0.copyload)
  unreachable

fallthrough.170:                                  ; preds = %then.179
  %.not140 = icmp sgt i64 %begin.1165, -1
  %icmp.206 = icmp sge i64 %sub.42, %begin.1165
  %iand.29 = and i1 %.not140, %icmp.206
  br i1 %iand.29, label %fallthrough.171, label %else.171

else.170:                                         ; preds = %then.179
  call void @runtime.goPanicSliceAlen(ptr nest undef, i64 %sub.42, i64 %s.chunk1)
  unreachable

fallthrough.171:                                  ; preds = %fallthrough.170
  %sub.43 = sub nsw i64 %sub.42, %begin.1165
  %icmp.207 = icmp eq i64 %sub.42, %begin.1165
  %.begin.1 = select i1 %icmp.207, i64 0, i64 %begin.1165
  %ptroff.29 = getelementptr i8, ptr %s.chunk0, i64 %.begin.1
  %add.15 = add i64 %labels.sroa.18.1167, 1
  %icmp.209 = icmp ugt i64 %add.15, %labels.sroa.24.1168
  br i1 %icmp.209, label %then.173, label %fallthrough.173

else.171:                                         ; preds = %fallthrough.170
  call void @runtime.goPanicSliceB(ptr nest undef, i64 %begin.1165, i64 %sub.42)
  unreachable

then.173:                                         ; preds = %fallthrough.171
  call void @runtime.growslice(ptr nonnull %sret.actual.11, ptr nest undef, ptr nonnull @string..d, ptr %labels.sroa.0.1166, i64 %labels.sroa.18.1167, i64 %labels.sroa.24.1168, i64 %add.15)
  %labels.sroa.0.0.copyload89 = load ptr, ptr %sret.actual.11, align 8
  %labels.sroa.18.0.copyload102 = load i64, ptr %1, align 8
  %labels.sroa.24.0.copyload117 = load i64, ptr %2, align 8
  br label %fallthrough.173

fallthrough.173:                                  ; preds = %then.173, %fallthrough.171
  %labels.sroa.0.2 = phi ptr [ %labels.sroa.0.0.copyload89, %then.173 ], [ %labels.sroa.0.1166, %fallthrough.171 ]
  %labels.sroa.18.2 = phi i64 [ %labels.sroa.18.0.copyload102, %then.173 ], [ %add.15, %fallthrough.171 ]
  %labels.sroa.24.2 = phi i64 [ %labels.sroa.24.0.copyload117, %then.173 ], [ %labels.sroa.24.1168, %fallthrough.171 ]
  %ptroff.31 = getelementptr { ptr, i64 }, ptr %labels.sroa.0.2, i64 %labels.sroa.18.1167
  %icmp.210 = icmp eq ptr %ptroff.31, null
  br i1 %icmp.210, label %then.175, label %else.175, !make.implicit !3

then.175:                                         ; preds = %fallthrough.173
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.175:                                         ; preds = %fallthrough.173
  %field.361 = getelementptr { ptr, i64 }, ptr %labels.sroa.0.2, i64 %labels.sroa.18.1167, i32 1
  store i64 %sub.43, ptr %field.361, align 8
  %deref.ld.14 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.213 = icmp eq i32 %deref.ld.14, 0
  br i1 %icmp.213, label %else.177, label %else.178

fallthrough.176:                                  ; preds = %else.178, %else.177
  %add.17 = add nuw nsw i64 %tmpv.274.0164, 1
  %exitcond.not = icmp eq i64 %add.17, %sub.40
  br i1 %exitcond.not, label %label.0, label %then.179

else.177:                                         ; preds = %else.175
  store ptr %ptroff.29, ptr %ptroff.31, align 8
  br label %fallthrough.176

else.178:                                         ; preds = %else.175
  %pticast.28 = ptrtoint ptr %ptroff.29 to i64
  call void @runtime.gcWriteBarrier(ptr nest undef, ptr nonnull %ptroff.31, i64 %pticast.28)
  br label %fallthrough.176

then.179:                                         ; preds = %fallthrough.167, %fallthrough.176
  %labels.sroa.24.1168 = phi i64 [ %labels.sroa.24.2, %fallthrough.176 ], [ 0, %fallthrough.167 ]
  %labels.sroa.18.1167 = phi i64 [ %labels.sroa.18.2, %fallthrough.176 ], [ 0, %fallthrough.167 ]
  %labels.sroa.0.1166 = phi ptr [ %labels.sroa.0.2, %fallthrough.176 ], [ null, %fallthrough.167 ]
  %begin.1165 = phi i64 [ %.ptroff.ld.14, %fallthrough.176 ], [ 0, %fallthrough.167 ]
  %tmpv.274.0164 = phi i64 [ %add.17, %fallthrough.176 ], [ 0, %fallthrough.167 ]
  %ptroff.28 = getelementptr i64, ptr %ptroff.27, i64 %tmpv.274.0164
  %.ptroff.ld.14 = load i64, ptr %ptroff.28, align 8
  %sub.42 = add i64 %.ptroff.ld.14, -1
  %.not138 = icmp sgt i64 %sub.42, -1
  %icmp.204 = icmp sle i64 %sub.42, %s.chunk1
  %iand.28 = and i1 %.not138, %icmp.204
  br i1 %iand.28, label %fallthrough.170, label %else.170

fallthrough.180:                                  ; preds = %label.0
  %.not136 = icmp sgt i64 %begin.0, -1
  %icmp.218 = icmp sge i64 %fqdnEnd.0, %begin.0
  %iand.31 = and i1 %.not136, %icmp.218
  br i1 %iand.31, label %fallthrough.181, label %else.181

else.180:                                         ; preds = %label.0
  call void @runtime.goPanicSliceAlen(ptr nest undef, i64 %fqdnEnd.0, i64 %s.chunk1)
  unreachable

fallthrough.181:                                  ; preds = %fallthrough.180
  %sub.48 = sub nsw i64 %fqdnEnd.0, %begin.0
  %icmp.219 = icmp eq i64 %fqdnEnd.0, %begin.0
  %.begin.0 = select i1 %icmp.219, i64 0, i64 %begin.0
  %ptroff.32 = getelementptr i8, ptr %s.chunk0, i64 %.begin.0
  %add.18 = add i64 %labels.sroa.18.0, 1
  %icmp.221 = icmp ugt i64 %add.18, %labels.sroa.24.0
  br i1 %icmp.221, label %then.183, label %fallthrough.183

else.181:                                         ; preds = %fallthrough.180
  call void @runtime.goPanicSliceB(ptr nest undef, i64 %begin.0, i64 %fqdnEnd.0)
  unreachable

then.183:                                         ; preds = %fallthrough.181
  call void @runtime.growslice(ptr nonnull %sret.actual.12, ptr nest undef, ptr nonnull @string..d, ptr %labels.sroa.0.0, i64 %labels.sroa.18.0, i64 %labels.sroa.24.0, i64 %add.18)
  %labels.sroa.0.0.copyload90 = load ptr, ptr %sret.actual.12, align 8
  %3 = getelementptr inbounds { ptr, i64, i64 }, ptr %sret.actual.12, i64 0, i32 1
  %labels.sroa.18.0.copyload104 = load i64, ptr %3, align 8
  %4 = getelementptr inbounds { ptr, i64, i64 }, ptr %sret.actual.12, i64 0, i32 2
  %labels.sroa.24.0.copyload119 = load i64, ptr %4, align 8
  br label %fallthrough.183

fallthrough.183:                                  ; preds = %then.183, %fallthrough.181
  %labels.sroa.0.3 = phi ptr [ %labels.sroa.0.0.copyload90, %then.183 ], [ %labels.sroa.0.0, %fallthrough.181 ]
  %labels.sroa.18.3 = phi i64 [ %labels.sroa.18.0.copyload104, %then.183 ], [ %add.18, %fallthrough.181 ]
  %labels.sroa.24.3 = phi i64 [ %labels.sroa.24.0.copyload119, %then.183 ], [ %labels.sroa.24.0, %fallthrough.181 ]
  %ptroff.34 = getelementptr { ptr, i64 }, ptr %labels.sroa.0.3, i64 %labels.sroa.18.0
  %icmp.222 = icmp eq ptr %ptroff.34, null
  br i1 %icmp.222, label %then.185, label %else.185, !make.implicit !3

then.185:                                         ; preds = %fallthrough.183
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.185:                                         ; preds = %fallthrough.183
  %field.382 = getelementptr { ptr, i64 }, ptr %labels.sroa.0.3, i64 %labels.sroa.18.0, i32 1
  store i64 %sub.48, ptr %field.382, align 8
  %deref.ld.15 = load i32, ptr @runtime.writeBarrier, align 8
  %icmp.225 = icmp eq i32 %deref.ld.15, 0
  br i1 %icmp.225, label %else.187, label %else.188

fallthrough.186:                                  ; preds = %else.188, %else.187
  store ptr %labels.sroa.0.3, ptr %sret.formal.2, align 8
  %labels.sroa.18.0.cast.1446.sroa_idx105 = getelementptr inbounds %IPST.2, ptr %sret.formal.2, i64 0, i32 1
  store i64 %labels.sroa.18.3, ptr %labels.sroa.18.0.cast.1446.sroa_idx105, align 8
  %labels.sroa.24.0.cast.1446.sroa_idx120 = getelementptr inbounds %IPST.2, ptr %sret.formal.2, i64 0, i32 2
  store i64 %labels.sroa.24.3, ptr %labels.sroa.24.0.cast.1446.sroa_idx120, align 8
  br label %common.ret

else.187:                                         ; preds = %else.185
  store ptr %ptroff.32, ptr %ptroff.34, align 8
  br label %fallthrough.186

else.188:                                         ; preds = %else.185
  %pticast.29 = ptrtoint ptr %ptroff.32 to i64
  call void @runtime.gcWriteBarrier(ptr nest undef, ptr nonnull %ptroff.34, i64 %pticast.29)
  br label %fallthrough.186
}

define i8 @go_0llvm.IsFqdn(ptr nest nocapture readnone %nest.35, ptr %s.chunk0, i64 %s.chunk1) #0 {
entry:
  %icmp.226 = icmp eq i64 %s.chunk1, 0
  br i1 %icmp.226, label %common.ret, label %then.191

then.191:                                         ; preds = %entry
  %sub.53 = add i64 %s.chunk1, -1
  %iand.32 = icmp sgt i64 %s.chunk1, 0
  br i1 %iand.32, label %fallthrough.192, label %else.192

fallthrough.192:                                  ; preds = %then.191
  %ptroff.35 = getelementptr i8, ptr %s.chunk0, i64 %sub.53
  %.ptroff.ld.15 = load i8, ptr %ptroff.35, align 1
  %icmp.232.not = icmp eq i8 %.ptroff.ld.15, 46
  br i1 %icmp.232.not, label %fallthrough.195, label %common.ret

else.192:                                         ; preds = %then.191
  call void @runtime.goPanicIndex(ptr nest undef, i64 %sub.53, i64 %s.chunk1)
  unreachable

common.ret:                                       ; preds = %fallthrough.195, %entry, %fallthrough.192, %fallthrough.200, %else.201
  %common.ret.op = phi i8 [ %1, %else.201 ], [ 0, %fallthrough.192 ], [ 1, %fallthrough.200 ], [ 0, %entry ], [ 1, %fallthrough.195 ]
  ret i8 %common.ret.op

fallthrough.195:                                  ; preds = %fallthrough.192
  %icmp.238 = icmp eq i64 %sub.53, 0
  br i1 %icmp.238, label %common.ret, label %then.199

then.199:                                         ; preds = %fallthrough.195
  %sub.57 = add nsw i64 %s.chunk1, -2
  %icmp.244 = icmp ult i64 %sub.57, %sub.53
  br i1 %icmp.244, label %fallthrough.200, label %else.200

fallthrough.200:                                  ; preds = %then.199
  %ptroff.37 = getelementptr i8, ptr %s.chunk0, i64 %sub.57
  %.ptroff.ld.16 = load i8, ptr %ptroff.37, align 1
  %icmp.245.not = icmp eq i8 %.ptroff.ld.16, 92
  br i1 %icmp.245.not, label %else.201, label %common.ret

else.200:                                         ; preds = %then.199
  call void @runtime.goPanicIndex(ptr nest undef, i64 %sub.57, i64 %sub.53)
  unreachable

else.201:                                         ; preds = %fallthrough.200
  %call.115.i = call i64 @strings.lastIndexFunc(ptr nest undef, ptr nonnull %s.chunk0, i64 %sub.53, ptr nonnull @go_0llvm.IsFqdn..func1..f, i8 zeroext 1)
  %sub.58 = sub i64 %sub.53, %call.115.i
  %0 = trunc i64 %sub.58 to i8
  %1 = and i8 %0, 1
  br label %common.ret
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define internal i8 @go_0llvm.IsFqdn..func1(ptr nest nocapture readnone %nest.36, i32 %r) #3 {
entry:
  %icmp.250 = icmp ne i32 %r, 92
  %zext.252 = zext i1 %icmp.250 to i8
  ret i8 %zext.252
}

define { ptr, i64 } @go_0llvm.Fqdn(ptr nest nocapture readnone %nest.37, ptr %s.chunk0, i64 %s.chunk1) #0 {
entry:
  %tmpv.330 = alloca [2 x { ptr, i64 }], align 8
  %call.36 = call i8 @go_0llvm.IsFqdn(ptr nest poison, ptr %s.chunk0, i64 %s.chunk1)
  %0 = and i8 %call.36, 1
  %trunc.208.not = icmp eq i8 %0, 0
  br i1 %trunc.208.not, label %else.204, label %then.204

common.ret:                                       ; preds = %else.204, %then.204
  %common.ret.op = phi { ptr, i64 } [ %ld.44.fca.1.insert, %then.204 ], [ %call.37, %else.204 ]
  ret { ptr, i64 } %common.ret.op

then.204:                                         ; preds = %entry
  %ld.44.fca.0.insert = insertvalue { ptr, i64 } undef, ptr %s.chunk0, 0
  %ld.44.fca.1.insert = insertvalue { ptr, i64 } %ld.44.fca.0.insert, i64 %s.chunk1, 1
  br label %common.ret

else.204:                                         ; preds = %entry
  store ptr %s.chunk0, ptr %tmpv.330, align 8
  %s.addr.sroa.4.0.cast.1459.sroa_idx10 = getelementptr inbounds [2 x { ptr, i64 }], ptr %tmpv.330, i64 0, i64 0, i32 1
  store i64 %s.chunk1, ptr %s.addr.sroa.4.0.cast.1459.sroa_idx10, align 8
  %index.1 = getelementptr inbounds [2 x { ptr, i64 }], ptr %tmpv.330, i64 0, i64 1
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %index.1, ptr noundef nonnull align 8 dereferenceable(16) @const.400, i64 16, i1 false)
  %call.37 = call { ptr, i64 } @runtime.concatstrings(ptr nest undef, ptr null, ptr nonnull %tmpv.330, i64 2)
  br label %common.ret
}

declare { ptr, i64 } @runtime.concatstrings(ptr, ptr, ptr, i64) local_unnamed_addr #0

define { ptr, i64 } @go_0llvm.Join(ptr nest nocapture readnone %nest.38, ptr byval(%IPST.2) %labels) #0 {
entry:
  %tmp.11 = alloca %IPST.2, align 8
  %tmpv.341 = alloca [2 x { ptr, i64 }], align 8
  %field.414 = getelementptr inbounds %IPST.2, ptr %labels, i64 0, i32 1
  %labels.field.ld.0 = load i64, ptr %field.414, align 8
  %sub.59 = add i64 %labels.field.ld.0, -1
  %field.416 = getelementptr inbounds %IPST.2, ptr %labels, i64 0, i32 2
  %.not2 = icmp slt i64 %labels.field.ld.0, 1
  br i1 %.not2, label %else.205, label %fallthrough.205

fallthrough.205:                                  ; preds = %entry
  %labels.field.ld.3 = load ptr, ptr %labels, align 8
  %tmpv.334.sroa.0.0.cast.1471.sroa_idx = getelementptr { ptr, i64 }, ptr %labels.field.ld.3, i64 %sub.59, i32 0
  %tmpv.334.sroa.0.0.copyload = load ptr, ptr %tmpv.334.sroa.0.0.cast.1471.sroa_idx, align 8
  %tmpv.334.sroa.3.0.cast.1471.sroa_idx14 = getelementptr { ptr, i64 }, ptr %labels.field.ld.3, i64 %sub.59, i32 1
  %tmpv.334.sroa.3.0.copyload = load i64, ptr %tmpv.334.sroa.3.0.cast.1471.sroa_idx14, align 8
  %icmp.258 = icmp eq i64 %tmpv.334.sroa.3.0.copyload, 1
  br i1 %icmp.258, label %then.206, label %else.208

else.205:                                         ; preds = %entry
  call void @runtime.goPanicIndex(ptr nest undef, i64 %sub.59, i64 %labels.field.ld.0)
  unreachable

then.206:                                         ; preds = %fallthrough.205
  %icmp.259 = icmp eq ptr %tmpv.334.sroa.0.0.copyload, @const.399
  br i1 %icmp.259, label %then.208, label %else.207

else.207:                                         ; preds = %then.206
  %lhsc = load i8, ptr %tmpv.334.sroa.0.0.copyload, align 1
  %icmp.260 = icmp eq i8 %lhsc, 46
  br i1 %icmp.260, label %then.208, label %else.208

then.208:                                         ; preds = %else.207, %then.206
  %labels.field.ld.5 = load i64, ptr %field.416, align 8
  %icmp.254 = icmp sgt i64 %sub.59, %labels.field.ld.5
  br i1 %icmp.254, label %else.209, label %fallthrough.210

common.ret:                                       ; preds = %fallthrough.210, %else.208
  %common.ret.op = phi { ptr, i64 } [ %call.42, %else.208 ], [ %call.39, %fallthrough.210 ]
  ret { ptr, i64 } %common.ret.op

else.208:                                         ; preds = %else.207, %fallthrough.205
  %call.41 = call { ptr, i64 } @strings.Join(ptr nest undef, ptr nonnull byval(%IPST.2) %labels, ptr nonnull @const.399, i64 1)
  %call.41.fca.0.extract = extractvalue { ptr, i64 } %call.41, 0
  %call.41.fca.1.extract = extractvalue { ptr, i64 } %call.41, 1
  %call.42 = call { ptr, i64 } @go_0llvm.Fqdn(ptr nest poison, ptr %call.41.fca.0.extract, i64 %call.41.fca.1.extract)
  br label %common.ret

else.209:                                         ; preds = %then.208
  call void @runtime.goPanicSliceAcap(ptr nest undef, i64 %sub.59, i64 %labels.field.ld.5)
  unreachable

fallthrough.210:                                  ; preds = %then.208
  store ptr %labels.field.ld.3, ptr %tmp.11, align 8
  %field.424 = getelementptr inbounds %IPST.2, ptr %tmp.11, i64 0, i32 1
  store i64 %sub.59, ptr %field.424, align 8
  %field.425 = getelementptr inbounds %IPST.2, ptr %tmp.11, i64 0, i32 2
  store i64 %labels.field.ld.5, ptr %field.425, align 8
  %call.38 = call { ptr, i64 } @strings.Join(ptr nest undef, ptr nonnull byval(%IPST.2) %tmp.11, ptr nonnull @const.399, i64 1)
  %call.38.fca.0.extract = extractvalue { ptr, i64 } %call.38, 0
  %call.38.fca.1.extract = extractvalue { ptr, i64 } %call.38, 1
  store ptr %call.38.fca.0.extract, ptr %tmpv.341, align 8
  %tmpv.339.sroa.2.0.cast.1477.sroa_idx6 = getelementptr inbounds [2 x { ptr, i64 }], ptr %tmpv.341, i64 0, i64 0, i32 1
  store i64 %call.38.fca.1.extract, ptr %tmpv.339.sroa.2.0.cast.1477.sroa_idx6, align 8
  %index.3 = getelementptr inbounds [2 x { ptr, i64 }], ptr %tmpv.341, i64 0, i64 1
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %index.3, ptr noundef nonnull align 8 dereferenceable(16) @const.400, i64 16, i1 false)
  %call.39 = call { ptr, i64 } @runtime.concatstrings(ptr nest undef, ptr null, ptr nonnull %tmpv.341, i64 2)
  br label %common.ret
}

; Function Attrs: noreturn
declare void @runtime.goPanicSliceAcap(ptr, i64, i64) local_unnamed_addr #2

declare { ptr, i64 } @strings.Join(ptr, ptr, ptr, i64) local_unnamed_addr #0

declare void @sync.RWMutex.Unlock(ptr, ptr) local_unnamed_addr #0

declare void @sync.RWMutex.Lock(ptr, ptr) local_unnamed_addr #0

declare void @sync.RWMutex.rUnlockSlow(ptr, ptr, i32) local_unnamed_addr #0

declare void @sync.RWMutex.RUnlock(ptr, ptr) local_unnamed_addr #0

declare void @sync.RWMutex.RLock(ptr, ptr) local_unnamed_addr #0

declare i8 @runtime.ifaceeq(ptr, ptr, ptr, ptr, ptr) local_unnamed_addr #0

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._632_7uint8..eq(ptr nest nocapture readnone %nest.81, ptr readonly %key1, ptr readonly %key2) #6 {
entry:
  %call.98 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 32)
  ret i8 %call.98
}

; Function Attrs: nofree memory(argmem: read)
declare i8 @runtime.memequal(ptr, ptr, ptr, i64) local_unnamed_addr #7

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._65_7uint8..eq(ptr nest nocapture readnone %nest.82, ptr readonly %key1, ptr readonly %key2) #6 {
entry:
  %call.99 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 5)
  ret i8 %call.99
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._628_7uint8..eq(ptr nest nocapture readnone %nest.83, ptr readonly %key1, ptr readonly %key2) #6 {
entry:
  %call.100 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 28)
  ret i8 %call.100
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._6255_7uint8..eq(ptr nest nocapture readnone %nest.84, ptr readonly %key1, ptr readonly %key2) #6 {
entry:
  %call.101 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 255)
  ret i8 %call.101
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._616_7uint8..eq(ptr nest nocapture readnone %nest.85, ptr readonly %key1, ptr readonly %key2) #6 {
entry:
  %call.102 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 16)
  ret i8 %call.102
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._64_7uint8..eq(ptr nest nocapture readnone %nest.86, ptr readonly %key1, ptr readonly %key2) #6 {
entry:
  %call.103 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 4)
  ret i8 %call.103
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._6127_7bool..eq(ptr nest nocapture readnone %nest.87, ptr readonly %key1, ptr readonly %key2) #6 {
entry:
  %call.104 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 127)
  ret i8 %call.104
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._6256_7bool..eq(ptr nest nocapture readnone %nest.88, ptr readonly %key1, ptr readonly %key2) #6 {
entry:
  %call.105 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 256)
  ret i8 %call.105
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._614_7int8..eq(ptr nest nocapture readnone %nest.89, ptr readonly %key1, ptr readonly %key2) #6 {
entry:
  %call.106 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 14)
  ret i8 %call.106
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._696_7int8..eq(ptr nest nocapture readnone %nest.90, ptr readonly %key1, ptr readonly %key2) #6 {
entry:
  %call.107 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 96)
  ret i8 %call.107
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._68_7uint8..eq(ptr nest nocapture readnone %nest.91, ptr readonly %key1, ptr readonly %key2) #6 {
entry:
  %call.108 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 8)
  ret i8 %call.108
}

define i8 @go_0llvm._65_7string..eq(ptr nest nocapture readnone %nest.92, ptr readonly %key1, ptr readonly %key2) #0 {
entry:
  %icmp.659 = icmp eq ptr %key1, null
  br i1 %icmp.659, label %then.583, label %else.583, !make.implicit !3

then.583:                                         ; preds = %entry
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.583:                                         ; preds = %entry
  %icmp.660 = icmp eq ptr %key2, null
  %tmpv.819.sroa.0.0.copyload = load ptr, ptr %key1, align 8
  br i1 %icmp.660, label %then.584, label %else.584, !make.implicit !3

then.584:                                         ; preds = %else.583
  call void @runtime.panicmem(ptr nest undef)
  unreachable

else.584:                                         ; preds = %else.583
  %tmpv.819.sroa.3.0.cast.2180.sroa_idx3 = getelementptr i8, ptr %key1, i64 8
  %tmpv.819.sroa.3.0.copyload = load i64, ptr %tmpv.819.sroa.3.0.cast.2180.sroa_idx3, align 8
  %tmpv.821.sroa.0.0.copyload = load ptr, ptr %key2, align 8
  %tmpv.821.sroa.3.0.cast.2183.sroa_idx1 = getelementptr i8, ptr %key2, i64 8
  %tmpv.821.sroa.3.0.copyload = load i64, ptr %tmpv.821.sroa.3.0.cast.2183.sroa_idx1, align 8
  %icmp.661 = icmp eq i64 %tmpv.819.sroa.3.0.copyload, %tmpv.821.sroa.3.0.copyload
  br i1 %icmp.661, label %then.585, label %then.587

then.585:                                         ; preds = %else.584
  %icmp.662 = icmp eq ptr %tmpv.819.sroa.0.0.copyload, %tmpv.821.sroa.0.0.copyload
  br i1 %icmp.662, label %else.583.1, label %else.586

else.586:                                         ; preds = %then.585
  %bcmp = call i32 @bcmp(ptr %tmpv.819.sroa.0.0.copyload, ptr %tmpv.821.sroa.0.0.copyload, i64 %tmpv.819.sroa.3.0.copyload)
  %icmp.663 = icmp eq i32 %bcmp, 0
  br i1 %icmp.663, label %else.583.1, label %then.587

then.587:                                         ; preds = %else.586.4, %then.585.4, %else.583.4, %else.586.3, %else.583.3, %else.586.2, %else.583.2, %else.586.1, %else.583.1, %else.586, %else.584
  %merge = phi i8 [ 0, %else.583.3 ], [ 0, %else.583.2 ], [ 0, %else.583.1 ], [ 0, %else.586.3 ], [ 0, %else.586.2 ], [ 0, %else.586.1 ], [ 0, %else.586 ], [ 0, %else.584 ], [ 0, %else.583.4 ], [ %phi.cast, %else.586.4 ], [ 1, %then.585.4 ]
  ret i8 %merge

else.583.1:                                       ; preds = %then.585, %else.586
  %tmpv.819.sroa.0.0.cast.2180.sroa_idx.1 = getelementptr i8, ptr %key1, i64 16
  %tmpv.819.sroa.0.0.copyload.1 = load ptr, ptr %tmpv.819.sroa.0.0.cast.2180.sroa_idx.1, align 8
  %tmpv.819.sroa.3.0.cast.2180.sroa_idx3.1 = getelementptr i8, ptr %key1, i64 24
  %tmpv.819.sroa.3.0.copyload.1 = load i64, ptr %tmpv.819.sroa.3.0.cast.2180.sroa_idx3.1, align 8
  %tmpv.821.sroa.0.0.cast.2183.sroa_idx.1 = getelementptr i8, ptr %key2, i64 16
  %tmpv.821.sroa.0.0.copyload.1 = load ptr, ptr %tmpv.821.sroa.0.0.cast.2183.sroa_idx.1, align 8
  %tmpv.821.sroa.3.0.cast.2183.sroa_idx1.1 = getelementptr i8, ptr %key2, i64 24
  %tmpv.821.sroa.3.0.copyload.1 = load i64, ptr %tmpv.821.sroa.3.0.cast.2183.sroa_idx1.1, align 8
  %icmp.661.1 = icmp eq i64 %tmpv.819.sroa.3.0.copyload.1, %tmpv.821.sroa.3.0.copyload.1
  br i1 %icmp.661.1, label %then.585.1, label %then.587

then.585.1:                                       ; preds = %else.583.1
  %icmp.662.1 = icmp eq ptr %tmpv.819.sroa.0.0.copyload.1, %tmpv.821.sroa.0.0.copyload.1
  br i1 %icmp.662.1, label %else.583.2, label %else.586.1

else.586.1:                                       ; preds = %then.585.1
  %bcmp1 = call i32 @bcmp(ptr %tmpv.819.sroa.0.0.copyload.1, ptr %tmpv.821.sroa.0.0.copyload.1, i64 %tmpv.819.sroa.3.0.copyload.1)
  %icmp.663.1 = icmp eq i32 %bcmp1, 0
  br i1 %icmp.663.1, label %else.583.2, label %then.587

else.583.2:                                       ; preds = %then.585.1, %else.586.1
  %tmpv.819.sroa.0.0.cast.2180.sroa_idx.2 = getelementptr i8, ptr %key1, i64 32
  %tmpv.819.sroa.0.0.copyload.2 = load ptr, ptr %tmpv.819.sroa.0.0.cast.2180.sroa_idx.2, align 8
  %tmpv.819.sroa.3.0.cast.2180.sroa_idx3.2 = getelementptr i8, ptr %key1, i64 40
  %tmpv.819.sroa.3.0.copyload.2 = load i64, ptr %tmpv.819.sroa.3.0.cast.2180.sroa_idx3.2, align 8
  %tmpv.821.sroa.0.0.cast.2183.sroa_idx.2 = getelementptr i8, ptr %key2, i64 32
  %tmpv.821.sroa.0.0.copyload.2 = load ptr, ptr %tmpv.821.sroa.0.0.cast.2183.sroa_idx.2, align 8
  %tmpv.821.sroa.3.0.cast.2183.sroa_idx1.2 = getelementptr i8, ptr %key2, i64 40
  %tmpv.821.sroa.3.0.copyload.2 = load i64, ptr %tmpv.821.sroa.3.0.cast.2183.sroa_idx1.2, align 8
  %icmp.661.2 = icmp eq i64 %tmpv.819.sroa.3.0.copyload.2, %tmpv.821.sroa.3.0.copyload.2
  br i1 %icmp.661.2, label %then.585.2, label %then.587

then.585.2:                                       ; preds = %else.583.2
  %icmp.662.2 = icmp eq ptr %tmpv.819.sroa.0.0.copyload.2, %tmpv.821.sroa.0.0.copyload.2
  br i1 %icmp.662.2, label %else.583.3, label %else.586.2

else.586.2:                                       ; preds = %then.585.2
  %bcmp2 = call i32 @bcmp(ptr %tmpv.819.sroa.0.0.copyload.2, ptr %tmpv.821.sroa.0.0.copyload.2, i64 %tmpv.819.sroa.3.0.copyload.2)
  %icmp.663.2 = icmp eq i32 %bcmp2, 0
  br i1 %icmp.663.2, label %else.583.3, label %then.587

else.583.3:                                       ; preds = %then.585.2, %else.586.2
  %tmpv.819.sroa.0.0.cast.2180.sroa_idx.3 = getelementptr i8, ptr %key1, i64 48
  %tmpv.819.sroa.0.0.copyload.3 = load ptr, ptr %tmpv.819.sroa.0.0.cast.2180.sroa_idx.3, align 8
  %tmpv.819.sroa.3.0.cast.2180.sroa_idx3.3 = getelementptr i8, ptr %key1, i64 56
  %tmpv.819.sroa.3.0.copyload.3 = load i64, ptr %tmpv.819.sroa.3.0.cast.2180.sroa_idx3.3, align 8
  %tmpv.821.sroa.0.0.cast.2183.sroa_idx.3 = getelementptr i8, ptr %key2, i64 48
  %tmpv.821.sroa.0.0.copyload.3 = load ptr, ptr %tmpv.821.sroa.0.0.cast.2183.sroa_idx.3, align 8
  %tmpv.821.sroa.3.0.cast.2183.sroa_idx1.3 = getelementptr i8, ptr %key2, i64 56
  %tmpv.821.sroa.3.0.copyload.3 = load i64, ptr %tmpv.821.sroa.3.0.cast.2183.sroa_idx1.3, align 8
  %icmp.661.3 = icmp eq i64 %tmpv.819.sroa.3.0.copyload.3, %tmpv.821.sroa.3.0.copyload.3
  br i1 %icmp.661.3, label %then.585.3, label %then.587

then.585.3:                                       ; preds = %else.583.3
  %icmp.662.3 = icmp eq ptr %tmpv.819.sroa.0.0.copyload.3, %tmpv.821.sroa.0.0.copyload.3
  br i1 %icmp.662.3, label %else.583.4, label %else.586.3

else.586.3:                                       ; preds = %then.585.3
  %bcmp3 = call i32 @bcmp(ptr %tmpv.819.sroa.0.0.copyload.3, ptr %tmpv.821.sroa.0.0.copyload.3, i64 %tmpv.819.sroa.3.0.copyload.3)
  %icmp.663.3 = icmp eq i32 %bcmp3, 0
  br i1 %icmp.663.3, label %else.583.4, label %then.587

else.583.4:                                       ; preds = %then.585.3, %else.586.3
  %tmpv.819.sroa.0.0.cast.2180.sroa_idx.4 = getelementptr i8, ptr %key1, i64 64
  %tmpv.819.sroa.0.0.copyload.4 = load ptr, ptr %tmpv.819.sroa.0.0.cast.2180.sroa_idx.4, align 8
  %tmpv.819.sroa.3.0.cast.2180.sroa_idx3.4 = getelementptr i8, ptr %key1, i64 72
  %tmpv.819.sroa.3.0.copyload.4 = load i64, ptr %tmpv.819.sroa.3.0.cast.2180.sroa_idx3.4, align 8
  %tmpv.821.sroa.0.0.cast.2183.sroa_idx.4 = getelementptr i8, ptr %key2, i64 64
  %tmpv.821.sroa.0.0.copyload.4 = load ptr, ptr %tmpv.821.sroa.0.0.cast.2183.sroa_idx.4, align 8
  %tmpv.821.sroa.3.0.cast.2183.sroa_idx1.4 = getelementptr i8, ptr %key2, i64 72
  %tmpv.821.sroa.3.0.copyload.4 = load i64, ptr %tmpv.821.sroa.3.0.cast.2183.sroa_idx1.4, align 8
  %icmp.661.4 = icmp eq i64 %tmpv.819.sroa.3.0.copyload.4, %tmpv.821.sroa.3.0.copyload.4
  br i1 %icmp.661.4, label %then.585.4, label %then.587

then.585.4:                                       ; preds = %else.583.4
  %icmp.662.4 = icmp eq ptr %tmpv.819.sroa.0.0.copyload.4, %tmpv.821.sroa.0.0.copyload.4
  br i1 %icmp.662.4, label %then.587, label %else.586.4

else.586.4:                                       ; preds = %then.585.4
  %bcmp4 = call i32 @bcmp(ptr %tmpv.819.sroa.0.0.copyload.4, ptr %tmpv.821.sroa.0.0.copyload.4, i64 %tmpv.819.sroa.3.0.copyload.4)
  %icmp.663.4 = icmp eq i32 %bcmp4, 0
  %phi.cast = zext i1 %icmp.663.4 to i8
  br label %then.587
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._63_7int32..eq(ptr nest nocapture readnone %nest.93, ptr readonly %key1, ptr readonly %key2) #6 {
entry:
  %call.110 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 12)
  ret i8 %call.110
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._6128_7uint64..eq(ptr nest nocapture readnone %nest.94, ptr readonly %key1, ptr readonly %key2) #6 {
entry:
  %call.111 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 1024)
  ret i8 %call.111
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._665_7int8..eq(ptr nest nocapture readnone %nest.95, ptr readonly %key1, ptr readonly %key2) #6 {
entry:
  %call.112 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 65)
  ret i8 %call.112
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._613_7int32..eq(ptr nest nocapture readnone %nest.96, ptr readonly %key1, ptr readonly %key2) #6 {
entry:
  %call.113 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 52)
  ret i8 %call.113
}

; Function Attrs: nofree memory(read, inaccessiblemem: none)
define i8 @go_0llvm._6256_7uint8..eq(ptr nest nocapture readnone %nest.97, ptr readonly %key1, ptr readonly %key2) #6 {
entry:
  %call.114 = call i8 @runtime.memequal(ptr nest undef, ptr %key1, ptr %key2, i64 256)
  ret i8 %call.114
}

declare i64 @strings.lastIndexFunc(ptr, ptr, i64, ptr, i8) local_unnamed_addr #0

declare void @sync.rlocker.Lock(ptr, ptr) #0

declare void @sync.rlocker.Unlock(ptr, ptr) #0

declare void @runtime.registerGCRoots(ptr, ptr) local_unnamed_addr #0

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #8

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #9

; Function Attrs: nofree nounwind willreturn memory(argmem: read)
declare i32 @bcmp(ptr nocapture, ptr nocapture, i64) local_unnamed_addr #10

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.smax.i64(i64, i64) #11

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umin.i64(i64, i64) #11