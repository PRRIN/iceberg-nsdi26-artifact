target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"

%"struct.boost::optional_ns::in_place_init_t" = type { i8 }
%"struct.boost::optional_ns::in_place_init_if_t" = type { i8 }
%struct.QClass = type { i16 }
%class.DNSName = type { %"class.boost::container::basic_string" }
%"class.boost::container::basic_string" = type { %"class.boost::container::dtl::basic_string_base" }
%"class.boost::container::dtl::basic_string_base" = type { %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::members_holder" }
%"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::members_holder" = type { %"union.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::repr_t" }
%"union.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::repr_t" = type { %"union.boost::move_detail::aligned_struct_wrapper" }
%"union.boost::move_detail::aligned_struct_wrapper" = type { %"struct.boost::move_detail::aligned_struct" }
%"struct.boost::move_detail::aligned_struct" = type { [24 x i8] }
%class.Regex = type { %struct.regex_t }
%struct.regex_t = type { i32, i64, ptr, ptr }
%"class.std::__1::locale::id" = type <{ %"struct.std::__1::once_flag", i32, [4 x i8] }>
%"struct.std::__1::once_flag" = type { i64 }
%"class.std::__1::basic_string_view" = type { ptr, i64 }
%"class.std::__1::basic_string" = type { %"class.std::__1::__compressed_pair" }
%"class.std::__1::__compressed_pair" = type { %"struct.std::__1::__compressed_pair_elem" }
%"struct.std::__1::__compressed_pair_elem" = type { %"struct.std::__1::basic_string<char>::__rep" }
%"struct.std::__1::basic_string<char>::__rep" = type { %union.anon }
%union.anon = type { %"struct.std::__1::basic_string<char>::__long" }
%"struct.std::__1::basic_string<char>::__long" = type { ptr, i64, i64 }
%"class.std::__1::allocator" = type { i8 }
%"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t" = type { %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_header", [23 x i8] }
%"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_header" = type { i8 }
%"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t" = type { i64, i64, ptr }
%"class.std::__1::vector" = type { ptr, ptr, %"class.std::__1::__compressed_pair.1" }
%"class.std::__1::__compressed_pair.1" = type { %"struct.std::__1::__compressed_pair_elem.2" }
%"struct.std::__1::__compressed_pair_elem.2" = type { ptr }
%struct.CIStringCompare = type { i8 }
%"class.std::__1::reverse_iterator" = type { %"class.std::__1::__wrap_iter", %"class.std::__1::__wrap_iter" }
%"class.std::__1::__wrap_iter" = type { ptr }
%"struct.std::__1::__split_buffer" = type { ptr, ptr, ptr, %"class.std::__1::__compressed_pair.11" }
%"class.std::__1::__compressed_pair.11" = type { %"struct.std::__1::__compressed_pair_elem.2", %"struct.std::__1::__compressed_pair_elem.12" }
%"struct.std::__1::__compressed_pair_elem.12" = type { ptr }
%"class.DNSName::RawLabelsVisitor" = type { %"struct.std::__1::array", ptr, i64 }
%"struct.std::__1::array" = type { [128 x i8] }
%"struct.std::__1::basic_string<char>::__short" = type { [23 x i8], [0 x i8], i8 }
%"struct.std::__1::__overload" = type { i8 }
%"struct.std::__1::pair" = type { ptr, ptr }
%"struct.std::__1::pair.7" = type { ptr, ptr }
%"struct.boost::container::growth_factor_100" = type { i8 }
%"class.boost::container::exception" = type { %"class.std::exception", ptr }
%"class.std::exception" = type { ptr }
%"struct.std::__1::__default_init_tag" = type { i8 }
%"class.std::__1::basic_ostream<char>::sentry" = type { i8, ptr }
%"class.std::__1::ostreambuf_iterator" = type { ptr }
%"class.std::__1::ios_base" = type { ptr, i32, i64, i64, i32, i32, ptr, ptr, ptr, ptr, i64, i64, ptr, i64, i64, ptr, i64, i64 }
%"class.std::__1::basic_ios" = type <{ %"class.std::__1::ios_base", ptr, i32, [4 x i8] }>
%"class.std::__1::locale" = type { ptr }
%"struct.std::__1::vector<std::__1::string>::_ConstructTransaction" = type { ptr, ptr, ptr }
%"class.std::__1::reverse_iterator.14" = type { ptr, ptr }
%"struct.std::__1::__less" = type { i8 }
%"struct.std::__1::__exception_guard_exceptions" = type <{ %"class.std::__1::_AllocatorDestroyRangeReverse", i8, [7 x i8] }>
%"class.std::__1::_AllocatorDestroyRangeReverse" = type { ptr, ptr, ptr }
%"class.std::__1::reverse_iterator.15" = type { [8 x i8], %"class.std::__1::reverse_iterator.14", %"class.std::__1::reverse_iterator.14" }
%"class.std::__1::vector<std::__1::string>::__destroy_vector" = type { ptr }

@_ZN5boost11optional_nsL13in_place_initE = internal global %"struct.boost::optional_ns::in_place_init_t" zeroinitializer, align 1
@_ZN5boost11optional_nsL16in_place_init_ifE = internal global %"struct.boost::optional_ns::in_place_init_if_t" zeroinitializer, align 1
@_ZN6QClass2INE = weak_odr local_unnamed_addr constant %struct.QClass { i16 1 }, align 2
@_ZN6QClass5CHAOSE = weak_odr local_unnamed_addr constant %struct.QClass { i16 3 }, align 2
@_ZN6QClass4NONEE = weak_odr local_unnamed_addr constant %struct.QClass { i16 254 }, align 2
@_ZN6QClass3ANYE = weak_odr local_unnamed_addr constant %struct.QClass { i16 255 }, align 2
@g_rootdnsname = global %class.DNSName zeroinitializer, align 8
@.str = private unnamed_addr constant [2 x i8] c".\00", align 1
@__dso_handle = external hidden global i8
@g_wildcarddnsname = global %class.DNSName zeroinitializer, align 8
@.str.4 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"...\00", align 1
@_ZTISt11range_error = external constant ptr
@.str.6 = private unnamed_addr constant [39 x i8] c"Found . in wrong position in DNSName: \00", align 1
@.str.7 = private unnamed_addr constant [27 x i8] c"label too long to append: \00", align 1
@.str.8 = private unnamed_addr constant [26 x i8] c"name too long to append: \00", align 1
@.str.9 = private unnamed_addr constant [16 x i8] c"name too long: \00", align 1
@.str.10 = private unnamed_addr constant [44 x i8] c"Trying to read past the end of the buffer (\00", align 1
@.str.11 = private unnamed_addr constant [5 x i8] c" >= \00", align 1
@.str.12 = private unnamed_addr constant [2 x i8] c")\00", align 1
@.str.13 = private unnamed_addr constant [52 x i8] c"Trying to read before the beginning of the buffer (\00", align 1
@.str.14 = private unnamed_addr constant [4 x i8] c" < \00", align 1
@.str.15 = private unnamed_addr constant [49 x i8] c"Found compressed label, instructed not to follow\00", align 1
@.str.16 = private unnamed_addr constant [46 x i8] c"Invalid label position during decompression (\00", align 1
@.str.17 = private unnamed_addr constant [46 x i8] c"Abort label decompression after 100 redirects\00", align 1
@.str.18 = private unnamed_addr constant [53 x i8] c"Found a forward reference during label decompression\00", align 1
@.str.19 = private unnamed_addr constant [79 x i8] c"Found an invalid label length in qname (only one of the first two bits is set)\00", align 1
@.str.20 = private unnamed_addr constant [39 x i8] c"Found an invalid label length in qname\00", align 1
@.str.21 = private unnamed_addr constant [50 x i8] c"Trying to read qtype past the end of the buffer (\00", align 1
@.str.22 = private unnamed_addr constant [4 x i8] c" > \00", align 1
@.str.23 = private unnamed_addr constant [51 x i8] c"Trying to read qclass past the end of the buffer (\00", align 1
@.str.24 = private unnamed_addr constant [34 x i8] c"Attempt to print an unset dnsname\00", align 1
@_ZTISt12out_of_range = external constant ptr
@.str.25 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.26 = private unnamed_addr constant [8 x i8] c"(empty)\00", align 1
@.str.27 = private unnamed_addr constant [38 x i8] c"Attempt to DNSString an unset dnsname\00", align 1
@.str.28 = private unnamed_addr constant [39 x i8] c"empty dnsnames aren't part of anything\00", align 1
@.str.29 = private unnamed_addr constant [32 x i8] c"illegal label length in dnsname\00", align 1
@.str.30 = private unnamed_addr constant [42 x i8] c"no such thing as an empty label to append\00", align 1
@.str.31 = private unnamed_addr constant [25 x i8] c"label too long to append\00", align 1
@.str.32 = private unnamed_addr constant [24 x i8] c"name too long to append\00", align 1
@.str.33 = private unnamed_addr constant [43 x i8] c"no such thing as an empty label to prepend\00", align 1
@.str.34 = private unnamed_addr constant [26 x i8] c"label too long to prepend\00", align 1
@.str.35 = private unnamed_addr constant [25 x i8] c"name too long to prepend\00", align 1
@.str.36 = private unnamed_addr constant [33 x i8] c"trying to get label at position \00", align 1
@.str.37 = private unnamed_addr constant [29 x i8] c" of a DNSName that only has \00", align 1
@.str.38 = private unnamed_addr constant [8 x i8] c" labels\00", align 1
@_ZZNK7DNSName10isHostnameEvE13hostNameRegex = internal global %class.Regex zeroinitializer, align 8
@_ZGVZNK7DNSName10isHostnameEvE13hostNameRegex = internal global i64 0, align 8
@.str.39 = private unnamed_addr constant [48 x i8] c"^(([A-Za-z0-9]([A-Za-z0-9-]*[A-Za-z0-9])?)\\.)+$\00", align 1
@.str.40 = private unnamed_addr constant [3 x i8] c"\\.\00", align 1
@.str.41 = private unnamed_addr constant [3 x i8] c"\\\\\00", align 1
@.str.42 = private unnamed_addr constant [7 x i8] c"%03hhu\00", align 1
@.str.43 = private unnamed_addr constant [26 x i8] c"Error, snprintf returned \00", align 1
@.str.44 = private unnamed_addr constant [23 x i8] c" while escaping label \00", align 1
@_ZTISt13runtime_error = external constant ptr
@dns_toupper_table = local_unnamed_addr constant [256 x i8] c"\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\10\11\12\13\14\15\16\17\18\19\1A\1B\1C\1D\1E\1F !\22#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`ABCDEFGHIJKLMNOPQRSTUVWXYZ{|}~\7F\80\81\82\83\84\85\86\87\88\89\8A\8B\8C\8D\8E\8F\90\91\92\93\94\95\96\97\98\99\9A\9B\9C\9D\9E\9F\A0\A1\A2\A3\A4\A5\A6\A7\A8\A9\AA\AB\AC\AD\AE\AF\B0\B1\B2\B3\B4\B5\B6\B7\B8\B9\BA\BB\BC\BD\BE\BF\C0\C1\C2\C3\C4\C5\C6\C7\C8\C9\CA\CB\CC\CD\CE\CF\D0\D1\D2\D3\D4\D5\D6\D7\D8\D9\DA\DB\DC\DD\DE\DF\E0\E1\E2\E3\E4\E5\E6\E7\E8\E9\EA\EB\EC\ED\EE\EF\F0\F1\F2\F3\F4\F5\F6\F7\F8\F9\FA\FB\FC\FD\FE\FF", align 1
@dns_tolower_table = local_unnamed_addr constant [256 x i8] c"\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\10\11\12\13\14\15\16\17\18\19\1A\1B\1C\1D\1E\1F !\22#$%&'()*+,-./0123456789:;<=>?@abcdefghijklmnopqrstuvwxyz[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~\7F\80\81\82\83\84\85\86\87\88\89\8A\8B\8C\8D\8E\8F\90\91\92\93\94\95\96\97\98\99\9A\9B\9C\9D\9E\9F\A0\A1\A2\A3\A4\A5\A6\A7\A8\A9\AA\AB\AC\AD\AE\AF\B0\B1\B2\B3\B4\B5\B6\B7\B8\B9\BA\BB\BC\BD\BE\BF\C0\C1\C2\C3\C4\C5\C6\C7\C8\C9\CA\CB\CC\CD\CE\CF\D0\D1\D2\D3\D4\D5\D6\D7\D8\D9\DA\DB\DC\DD\DE\DF\E0\E1\E2\E3\E4\E5\E6\E7\E8\E9\EA\EB\EC\ED\EE\EF\F0\F1\F2\F3\F4\F5\F6\F7\F8\F9\FA\FB\FC\FD\FE\FF", align 1
@.str.45 = private unnamed_addr constant [65 x i8] c"trying to access the front of an empty DNSName::RawLabelsVisitor\00", align 1
@.str.46 = private unnamed_addr constant [64 x i8] c"trying to access the back of an empty DNSName::RawLabelsVisitor\00", align 1
@_ZTVSt11range_error = external unnamed_addr constant { [5 x ptr] }, align 8
@_ZTVSt12out_of_range = external unnamed_addr constant { [5 x ptr] }, align 8
@__func__._ZNK5boost9container12basic_stringIcNSt3__111char_traitsIcEEvEixEm = private unnamed_addr constant [11 x i8] c"operator[]\00", align 1
@.str.47 = private unnamed_addr constant [11 x i8] c"string.hpp\00", align 1
@.str.48 = private unnamed_addr constant [17 x i8] c"this->size() > n\00", align 1
@__func__._ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE15priv_short_sizeEm = private unnamed_addr constant [16 x i8] c"priv_short_size\00", align 1
@.str.49 = private unnamed_addr constant [11 x i8] c"sz <= mask\00", align 1
@__func__._ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE14priv_long_sizeEm = private unnamed_addr constant [15 x i8] c"priv_long_size\00", align 1
@.str.50 = private unnamed_addr constant [46 x i8] c"version 1 allocator without allocate_new flag\00", align 1
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global ptr
@_ZTSN5boost9container11logic_errorE = linkonce_odr hidden constant [32 x i8] c"N5boost9container11logic_errorE\00", align 1
@_ZTSN5boost9container9exceptionE = linkonce_odr hidden constant [29 x i8] c"N5boost9container9exceptionE\00", align 1
@_ZTISt9exception = external constant ptr
@_ZTIN5boost9container9exceptionE = linkonce_odr hidden constant { ptr, ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr inttoptr (i64 add (i64 ptrtoint (ptr @_ZTSN5boost9container9exceptionE to i64), i64 -9223372036854775808) to ptr), ptr @_ZTISt9exception }, align 8
@_ZTIN5boost9container11logic_errorE = linkonce_odr hidden constant { ptr, ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr inttoptr (i64 add (i64 ptrtoint (ptr @_ZTSN5boost9container11logic_errorE to i64), i64 -9223372036854775808) to ptr), ptr @_ZTIN5boost9container9exceptionE }, align 8
@_ZTVN5boost9container11logic_errorE = linkonce_odr unnamed_addr constant { [5 x ptr] } { [5 x ptr] [ptr null, ptr @_ZTIN5boost9container11logic_errorE, ptr @_ZN5boost9container11logic_errorD1Ev, ptr @_ZN5boost9container11logic_errorD0Ev, ptr @_ZNK5boost9container9exception4whatEv] }, align 8
@_ZTVN5boost9container9exceptionE = linkonce_odr unnamed_addr constant { [5 x ptr] } { [5 x ptr] [ptr null, ptr @_ZTIN5boost9container9exceptionE, ptr @_ZN5boost9container9exceptionD1Ev, ptr @_ZN5boost9container9exceptionD0Ev, ptr @_ZNK5boost9container9exception4whatEv] }, align 8
@_ZTVSt9exception = external unnamed_addr constant { [5 x ptr] }, align 8
@.str.51 = private unnamed_addr constant [35 x i8] c"unknown boost::container exception\00", align 1
@_ZTSN5boost9container9bad_allocE = linkonce_odr hidden constant [29 x i8] c"N5boost9container9bad_allocE\00", align 1
@_ZTIN5boost9container9bad_allocE = linkonce_odr hidden constant { ptr, ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr inttoptr (i64 add (i64 ptrtoint (ptr @_ZTSN5boost9container9bad_allocE to i64), i64 -9223372036854775808) to ptr), ptr @_ZTIN5boost9container9exceptionE }, align 8
@.str.52 = private unnamed_addr constant [35 x i8] c"boost::container::bad_alloc thrown\00", align 1
@_ZTVN5boost9container9bad_allocE = linkonce_odr unnamed_addr constant { [5 x ptr] } { [5 x ptr] [ptr null, ptr @_ZTIN5boost9container9bad_allocE, ptr @_ZN5boost9container9bad_allocD1Ev, ptr @_ZN5boost9container9bad_allocD0Ev, ptr @_ZNK5boost9container9exception4whatEv] }, align 8
@.str.53 = private unnamed_addr constant [17 x i8] c"this->is_short()\00", align 1
@.str.54 = private unnamed_addr constant [10 x i8] c"array::at\00", align 1
@.str.55 = private unnamed_addr constant [13 x i8] c"basic_string\00", align 1
@_ZTISt12length_error = external constant ptr
@_ZTVSt12length_error = external unnamed_addr constant { [5 x ptr] }, align 8
@_ZTISt20bad_array_new_length = external constant ptr
@_ZNSt3__15ctypeIcE2idE = external global %"class.std::__1::locale::id", align 8
@.str.56 = private unnamed_addr constant [7 x i8] c"vector\00", align 1
@.str.57 = private unnamed_addr constant [42 x i8] c"basic_string::reserve max_size() exceeded\00", align 1
@_ZTSN5boost9container12length_errorE = linkonce_odr hidden constant [33 x i8] c"N5boost9container12length_errorE\00", align 1
@_ZTIN5boost9container12length_errorE = linkonce_odr hidden constant { ptr, ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr inttoptr (i64 add (i64 ptrtoint (ptr @_ZTSN5boost9container12length_errorE to i64), i64 -9223372036854775808) to ptr), ptr @_ZTIN5boost9container9exceptionE }, align 8
@_ZTVN5boost9container12length_errorE = linkonce_odr unnamed_addr constant { [5 x ptr] } { [5 x ptr] [ptr null, ptr @_ZTIN5boost9container12length_errorE, ptr @_ZN5boost9container12length_errorD1Ev, ptr @_ZN5boost9container12length_errorD0Ev, ptr @_ZNK5boost9container9exception4whatEv] }, align 8
@.str.58 = private unnamed_addr constant [42 x i8] c"basic_string::erase out of range position\00", align 1
@_ZTSN5boost9container12out_of_rangeE = linkonce_odr hidden constant [33 x i8] c"N5boost9container12out_of_rangeE\00", align 1
@_ZTIN5boost9container12out_of_rangeE = linkonce_odr hidden constant { ptr, ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr inttoptr (i64 add (i64 ptrtoint (ptr @_ZTSN5boost9container12out_of_rangeE to i64), i64 -9223372036854775808) to ptr), ptr @_ZTIN5boost9container9exceptionE }, align 8
@_ZTVN5boost9container12out_of_rangeE = linkonce_odr unnamed_addr constant { [5 x ptr] } { [5 x ptr] [ptr null, ptr @_ZTIN5boost9container12out_of_rangeE, ptr @_ZN5boost9container12out_of_rangeD1Ev, ptr @_ZN5boost9container12out_of_rangeD0Ev, ptr @_ZNK5boost9container9exception4whatEv] }, align 8
@__func__._ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE22allocate_initial_blockEm = private unnamed_addr constant [23 x i8] c"allocate_initial_block\00", align 1
@.str.59 = private unnamed_addr constant [57 x i8] c"basic_string::allocate_initial_block max_size() exceeded\00", align 1
@.str.60 = private unnamed_addr constant [35 x i8] c"basic_string::at invalid subscript\00", align 1
@llvm.global_ctors = appending global [1 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 65535, ptr @_GLOBAL__sub_I_dnsname.cc, ptr null }]

; Function Attrs: noinline ssp uwtable(sync)
define internal fastcc void @__cxx_global_var_init() unnamed_addr #0 section "__TEXT,__StaticInit,regular,pure_instructions" {
  %1 = tail call noundef ptr @_ZN5boost11optional_ns15in_place_init_tC1ENS1_8init_tagE(ptr noundef nonnull align 1 dereferenceable(1) @_ZN5boost11optional_nsL13in_place_initE)
  %2 = tail call ptr @llvm.invariant.start.p0(i64 1, ptr nonnull @_ZN5boost11optional_nsL13in_place_initE)
  ret void
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost11optional_ns15in_place_init_tC1ENS1_8init_tagE(ptr noundef nonnull returned align 1 dereferenceable(1) %0) unnamed_addr #0 align 2 {
  %2 = tail call noundef ptr @_ZN5boost11optional_ns15in_place_init_tC2ENS1_8init_tagE(ptr noundef nonnull align 1 dereferenceable(1) %0)
  ret ptr %0
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare ptr @llvm.invariant.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: noinline ssp uwtable(sync)
define internal fastcc void @__cxx_global_var_init.1() unnamed_addr #0 section "__TEXT,__StaticInit,regular,pure_instructions" {
  %1 = tail call noundef ptr @_ZN5boost11optional_ns18in_place_init_if_tC1ENS1_8init_tagE(ptr noundef nonnull align 1 dereferenceable(1) @_ZN5boost11optional_nsL16in_place_init_ifE)
  %2 = tail call ptr @llvm.invariant.start.p0(i64 1, ptr nonnull @_ZN5boost11optional_nsL16in_place_init_ifE)
  ret void
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost11optional_ns18in_place_init_if_tC1ENS1_8init_tagE(ptr noundef nonnull returned align 1 dereferenceable(1) %0) unnamed_addr #0 align 2 {
  %2 = tail call noundef ptr @_ZN5boost11optional_ns18in_place_init_if_tC2ENS1_8init_tagE(ptr noundef nonnull align 1 dereferenceable(1) %0)
  ret ptr %0
}

; Function Attrs: noinline ssp uwtable(sync)
define internal fastcc void @__cxx_global_var_init.2() unnamed_addr #0 section "__TEXT,__StaticInit,regular,pure_instructions" {
  %1 = alloca %"class.std::__1::basic_string_view", align 8
  %2 = call noundef ptr @_ZNSt3__117basic_string_viewIcNS_11char_traitsIcEEEC1B7v160006EPKc(ptr noundef nonnull align 8 dereferenceable(16) %1, ptr noundef nonnull @.str)
  %3 = load i64, ptr %1, align 8
  %4 = insertvalue [2 x i64] poison, i64 %3, 0
  %5 = getelementptr inbounds [2 x i64], ptr %1, i64 0, i64 1
  %6 = load i64, ptr %5, align 8
  %7 = insertvalue [2 x i64] %4, i64 %6, 1
  %8 = call noundef ptr @_ZN7DNSNameC1ENSt3__117basic_string_viewIcNS0_11char_traitsIcEEEE(ptr noundef nonnull align 8 dereferenceable(24) @g_rootdnsname, [2 x i64] %7)
  %9 = call i32 @__cxa_atexit(ptr nonnull @_ZN7DNSNameD1Ev, ptr nonnull @g_rootdnsname, ptr nonnull @__dso_handle) #24
  ret void
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__117basic_string_viewIcNS_11char_traitsIcEEEC1B7v160006EPKc(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #0 align 2 {
  %3 = tail call noundef ptr @_ZNSt3__117basic_string_viewIcNS_11char_traitsIcEEEC2B7v160006EPKc(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef %1)
  ret ptr %0
}

; Function Attrs: noinline ssp uwtable(sync)
define noundef nonnull ptr @_ZN7DNSNameC1ENSt3__117basic_string_viewIcNS0_11char_traitsIcEEEE(ptr noundef nonnull returned align 8 dereferenceable(24) %0, [2 x i64] %1) unnamed_addr #0 align 2 {
  %3 = tail call noundef ptr @_ZN7DNSNameC2ENSt3__117basic_string_viewIcNS0_11char_traitsIcEEEE(ptr noundef nonnull align 8 dereferenceable(24) %0, [2 x i64] %1)
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7DNSNameD1Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #2 align 2 {
  %2 = tail call noundef ptr @_ZN7DNSNameD2Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  ret ptr %0
}

; Function Attrs: nofree nounwind
declare i32 @__cxa_atexit(ptr, ptr, ptr) local_unnamed_addr #3

; Function Attrs: noinline ssp uwtable(sync)
define internal fastcc void @__cxx_global_var_init.3() unnamed_addr #0 section "__TEXT,__StaticInit,regular,pure_instructions" {
  %1 = alloca %"class.std::__1::basic_string_view", align 8
  %2 = call noundef ptr @_ZNSt3__117basic_string_viewIcNS_11char_traitsIcEEEC1B7v160006EPKc(ptr noundef nonnull align 8 dereferenceable(16) %1, ptr noundef nonnull @.str.4)
  %3 = load i64, ptr %1, align 8
  %4 = insertvalue [2 x i64] poison, i64 %3, 0
  %5 = getelementptr inbounds [2 x i64], ptr %1, i64 0, i64 1
  %6 = load i64, ptr %5, align 8
  %7 = insertvalue [2 x i64] %4, i64 %6, 1
  %8 = call noundef ptr @_ZN7DNSNameC1ENSt3__117basic_string_viewIcNS0_11char_traitsIcEEEE(ptr noundef nonnull align 8 dereferenceable(24) @g_wildcarddnsname, [2 x i64] %7)
  %9 = call i32 @__cxa_atexit(ptr nonnull @_ZN7DNSNameD1Ev, ptr nonnull @g_wildcarddnsname, ptr nonnull @__dso_handle) #24
  ret void
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef nonnull align 8 dereferenceable(8) ptr @_ZlsRNSt3__113basic_ostreamIcNS_11char_traitsIcEEEERK7DNSName(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) local_unnamed_addr #4 personality ptr @__gxx_personality_v0 {
  %3 = alloca %"class.std::__1::basic_string", align 8
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %3) #24
  call void @_ZNK7DNSName11toLogStringEv(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %3, ptr noundef nonnull align 8 dereferenceable(24) %1)
  %4 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEERNS_13basic_ostreamIT_T0_EES9_RKNS_12basic_stringIS6_S7_T1_EE(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(24) %3)
          to label %5 unwind label %7

5:                                                ; preds = %2
  %6 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %3) #24
  ret ptr %4

7:                                                ; preds = %2
  %8 = landingpad { ptr, i32 }
          cleanup
  %9 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %3) #24
  resume { ptr, i32 } %8
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEERNS_13basic_ostreamIT_T0_EES9_RKNS_12basic_stringIS6_S7_T1_EE(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) local_unnamed_addr #4 {
  %3 = tail call noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %1) #24
  %4 = tail call noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %1) #24
  %5 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__124__put_character_sequenceB7v160006IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef %3, i64 noundef %4)
  ret ptr %5
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_ZNK7DNSName11toLogStringEv(ptr noalias sret(%"class.std::__1::basic_string") align 8 %0, ptr noundef nonnull align 8 dereferenceable(24) %1) local_unnamed_addr #4 align 2 {
  %3 = tail call noundef zeroext i1 @_ZNK7DNSName5emptyEv(ptr noundef nonnull align 8 dereferenceable(24) %1)
  br i1 %3, label %4, label %6

4:                                                ; preds = %2
  %5 = tail call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B7v160006IDnEEPKc(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull @.str.26)
  br label %7

6:                                                ; preds = %2
  tail call void @_ZNK7DNSName15toStringRootDotEv(ptr sret(%"class.std::__1::basic_string") align 8 %0, ptr noundef nonnull align 8 dereferenceable(24) %1)
  br label %7

7:                                                ; preds = %6, %4
  ret void
}

; FIXME
; declare i32 @__gxx_personality_v0(...)
declare i32 @__gxx_personality_v0(i8*)

; Function Attrs: noinline nounwind ssp uwtable(sync)
declare noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull returned align 8 dereferenceable(24)) unnamed_addr #2 align 2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress noinline noreturn ssp uwtable(sync)
define void @_ZN7DNSName19throwSafeRangeErrorERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEPKcm(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1, i64 noundef %2) local_unnamed_addr #5 align 2 personality ptr @__gxx_personality_v0 {
  %4 = alloca %"class.std::__1::basic_string", align 8
  %5 = alloca %"class.std::__1::basic_string", align 8
  %6 = alloca %"class.std::__1::basic_string", align 8
  %7 = alloca %"class.std::__1::basic_string", align 8
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %4) #24
  %8 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #24
  %9 = icmp ugt i64 %2, 255
  br i1 %9, label %10, label %14

10:                                               ; preds = %3
  %11 = invoke noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEaSB7v160006EPKc(ptr noundef nonnull align 8 dereferenceable(24) %4, ptr noundef nonnull @.str.5)
          to label %14 unwind label %12

12:                                               ; preds = %10
  %13 = landingpad { ptr, i32 }
          cleanup
  br label %44

14:                                               ; preds = %10, %3
  %15 = phi i64 [ 255, %10 ], [ %2, %3 ]
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %5) #24
  %16 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %5) #24
  invoke void @_ZN7DNSName18appendEscapedLabelERNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEPKcm(ptr noundef nonnull align 8 dereferenceable(24) %5, ptr noundef %1, i64 noundef %15)
          to label %17 unwind label %23

17:                                               ; preds = %14
  %18 = call ptr @__cxa_allocate_exception(i64 16) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %6) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %7) #24
  invoke void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_SB_(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %7, ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %5)
          to label %19 unwind label %25

19:                                               ; preds = %17
  invoke void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_RKS9_(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %6, ptr noundef nonnull align 8 dereferenceable(24) %7, ptr noundef nonnull align 8 dereferenceable(24) %4)
          to label %20 unwind label %27

20:                                               ; preds = %19
  %21 = invoke noundef ptr @_ZNSt11range_errorC1B7v160006ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(ptr noundef nonnull align 8 dereferenceable(16) %18, ptr noundef nonnull align 8 dereferenceable(24) %6)
          to label %22 unwind label %29

22:                                               ; preds = %20
  invoke void @__cxa_throw(ptr nonnull %18, ptr nonnull @_ZTISt11range_error, ptr nonnull @_ZNSt11range_errorD1Ev) #25
          to label %47 unwind label %29

23:                                               ; preds = %14
  %24 = landingpad { ptr, i32 }
          cleanup
  br label %41

25:                                               ; preds = %17
  %26 = landingpad { ptr, i32 }
          cleanup
  br label %37

27:                                               ; preds = %19
  %28 = landingpad { ptr, i32 }
          cleanup
  br label %33

29:                                               ; preds = %22, %20
  %30 = phi i1 [ false, %22 ], [ true, %20 ]
  %31 = landingpad { ptr, i32 }
          cleanup
  %32 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %6) #24
  br label %33

33:                                               ; preds = %29, %27
  %34 = phi { ptr, i32 } [ %31, %29 ], [ %28, %27 ]
  %35 = phi i1 [ %30, %29 ], [ true, %27 ]
  %36 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %7) #24
  br label %37

37:                                               ; preds = %33, %25
  %38 = phi { ptr, i32 } [ %34, %33 ], [ %26, %25 ]
  %39 = phi i1 [ %35, %33 ], [ true, %25 ]
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %7) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %6) #24
  br i1 %39, label %40, label %41

40:                                               ; preds = %37
  call void @__cxa_free_exception(ptr %18) #24
  br label %41

41:                                               ; preds = %37, %40, %23
  %42 = phi { ptr, i32 } [ %38, %40 ], [ %38, %37 ], [ %24, %23 ]
  %43 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %5) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %5) #24
  br label %44

44:                                               ; preds = %41, %12
  %45 = phi { ptr, i32 } [ %42, %41 ], [ %13, %12 ]
  %46 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %4) #24
  resume { ptr, i32 } %45

47:                                               ; preds = %22
  unreachable
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B7v160006Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #2 align 2 {
  %2 = tail call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  ret ptr %0
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEaSB7v160006EPKc(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1) local_unnamed_addr #4 align 2 {
  %3 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6assignEPKc(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1)
  ret ptr %3
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_ZN7DNSName18appendEscapedLabelERNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEPKcm(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1, i64 noundef %2) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %4 = alloca [4 x i8], align 4
  %5 = alloca %"class.std::__1::basic_string", align 8
  %6 = alloca %"class.std::__1::basic_string", align 8
  %7 = alloca %"class.std::__1::basic_string", align 8
  %8 = alloca %"class.std::__1::basic_string", align 8
  %9 = alloca %"class.std::__1::basic_string", align 8
  %10 = icmp eq i64 %2, 0
  br i1 %10, label %79, label %11

11:                                               ; preds = %3, %76
  %12 = phi i64 [ %77, %76 ], [ 0, %3 ]
  %13 = getelementptr inbounds i8, ptr %1, i64 %12
  %14 = load i8, ptr %13, align 1, !tbaa !5
  %15 = zext i8 %14 to i32
  switch i8 %14, label %20 [
    i8 46, label %16
    i8 92, label %18
  ]

16:                                               ; preds = %11
  %17 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEpLB7v160006EPKc(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull @.str.40)
  br label %76

18:                                               ; preds = %11
  %19 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEpLB7v160006EPKc(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull @.str.41)
  br label %76

20:                                               ; preds = %11
  %21 = add i8 %14, -33
  %22 = icmp ult i8 %21, 94
  br i1 %22, label %23, label %25

23:                                               ; preds = %20
  %24 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEmc(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef 1, i8 noundef signext %14)
  br label %76

25:                                               ; preds = %20
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4) #24
  store i32 3158064, ptr %4, align 4
  %26 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef nonnull dereferenceable(1) %4, i64 noundef 4, ptr noundef nonnull @.str.42, i32 noundef %15)
  %27 = icmp ugt i32 %26, 3
  br i1 %27, label %28, label %73

28:                                               ; preds = %25
  %29 = call ptr @__cxa_allocate_exception(i64 16) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %5) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %6) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %7) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %8) #24
  invoke void @_ZNSt3__19to_stringEi(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %8, i32 noundef %26)
          to label %30 unwind label %38

30:                                               ; preds = %28
  invoke void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEPKS6_OS9_(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %7, ptr noundef nonnull @.str.43, ptr noundef nonnull align 8 dereferenceable(24) %8)
          to label %31 unwind label %40

31:                                               ; preds = %30
  invoke void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_PKS6_(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %6, ptr noundef nonnull align 8 dereferenceable(24) %7, ptr noundef nonnull @.str.44)
          to label %32 unwind label %42

32:                                               ; preds = %31
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %9) #24
  %33 = invoke noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B7v160006EPKcm(ptr noundef nonnull align 8 dereferenceable(24) %9, ptr noundef %1, i64 noundef %2)
          to label %34 unwind label %44

34:                                               ; preds = %32
  invoke void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_SA_(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %5, ptr noundef nonnull align 8 dereferenceable(24) %6, ptr noundef nonnull align 8 dereferenceable(24) %9)
          to label %35 unwind label %46

35:                                               ; preds = %34
  %36 = invoke noundef ptr @_ZNSt13runtime_errorC1ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(ptr noundef nonnull align 8 dereferenceable(16) %29, ptr noundef nonnull align 8 dereferenceable(24) %5)
          to label %37 unwind label %48

37:                                               ; preds = %35
  invoke void @__cxa_throw(ptr nonnull %29, ptr nonnull @_ZTISt13runtime_error, ptr nonnull @_ZNSt13runtime_errorD1Ev) #25
          to label %80 unwind label %48

38:                                               ; preds = %28
  %39 = landingpad { ptr, i32 }
          cleanup
  br label %68

40:                                               ; preds = %30
  %41 = landingpad { ptr, i32 }
          cleanup
  br label %64

42:                                               ; preds = %31
  %43 = landingpad { ptr, i32 }
          cleanup
  br label %60

44:                                               ; preds = %32
  %45 = landingpad { ptr, i32 }
          cleanup
  br label %56

46:                                               ; preds = %34
  %47 = landingpad { ptr, i32 }
          cleanup
  br label %52

48:                                               ; preds = %37, %35
  %49 = phi i1 [ false, %37 ], [ true, %35 ]
  %50 = landingpad { ptr, i32 }
          cleanup
  %51 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %5) #24
  br label %52

52:                                               ; preds = %48, %46
  %53 = phi { ptr, i32 } [ %50, %48 ], [ %47, %46 ]
  %54 = phi i1 [ %49, %48 ], [ true, %46 ]
  %55 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %9) #24
  br label %56

56:                                               ; preds = %52, %44
  %57 = phi { ptr, i32 } [ %53, %52 ], [ %45, %44 ]
  %58 = phi i1 [ %54, %52 ], [ true, %44 ]
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %9) #24
  %59 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %6) #24
  br label %60

60:                                               ; preds = %56, %42
  %61 = phi { ptr, i32 } [ %57, %56 ], [ %43, %42 ]
  %62 = phi i1 [ %58, %56 ], [ true, %42 ]
  %63 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %7) #24
  br label %64

64:                                               ; preds = %60, %40
  %65 = phi { ptr, i32 } [ %61, %60 ], [ %41, %40 ]
  %66 = phi i1 [ %62, %60 ], [ true, %40 ]
  %67 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %8) #24
  br label %68

68:                                               ; preds = %64, %38
  %69 = phi { ptr, i32 } [ %65, %64 ], [ %39, %38 ]
  %70 = phi i1 [ %66, %64 ], [ true, %38 ]
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %8) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %7) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %6) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %5) #24
  br i1 %70, label %71, label %72

71:                                               ; preds = %68
  call void @__cxa_free_exception(ptr %29) #24
  br label %72

72:                                               ; preds = %71, %68
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4) #24
  resume { ptr, i32 } %69

73:                                               ; preds = %25
  %74 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEmc(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef 1, i8 noundef signext 92)
  %75 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEpLB7v160006EPKc(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull %4)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4) #24
  br label %76

76:                                               ; preds = %18, %73, %23, %16
  %77 = add nuw i64 %12, 1
  %78 = icmp eq i64 %77, %2
  br i1 %78, label %79, label %11, !llvm.loop !8

79:                                               ; preds = %76, %3
  ret void

80:                                               ; preds = %37
  unreachable
}

declare ptr @__cxa_allocate_exception(i64) local_unnamed_addr

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_RKS9_(ptr noalias sret(%"class.std::__1::basic_string") align 8 %0, ptr noundef nonnull align 8 dereferenceable(24) %1, ptr noundef nonnull align 8 dereferenceable(24) %2) local_unnamed_addr #4 {
  %4 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendB7v160006ERKS5_(ptr noundef nonnull align 8 dereferenceable(24) %1, ptr noundef nonnull align 8 dereferenceable(24) %2)
  %5 = tail call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B7v160006EOS5_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %4) #24
  ret void
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_SB_(ptr noalias sret(%"class.std::__1::basic_string") align 8 %0, ptr noundef nonnull align 8 dereferenceable(24) %1, ptr noundef nonnull align 8 dereferenceable(24) %2) local_unnamed_addr #4 {
  %4 = alloca %"class.std::__1::allocator", align 1
  %5 = alloca %"class.std::__1::allocator", align 1
  %6 = tail call noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %1) #24
  %7 = tail call noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %2) #24
  %8 = add i64 %7, %6
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %4) #24
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %5) #24
  tail call void @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13get_allocatorB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %1) #24
  call void @_ZNSt3__116allocator_traitsINS_9allocatorIcEEE37select_on_container_copy_constructionB7v160006IS2_vvEES2_RKS2_(ptr noundef nonnull align 1 dereferenceable(1) %5)
  %9 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B7v160006ENS_24__uninitialized_size_tagEmRKS4_(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %8, ptr noundef nonnull align 1 dereferenceable(1) %4)
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %5) #24
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %4) #24
  %10 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %11 = call noundef ptr @_ZNSt3__112__to_addressB7v160006IcEEPT_S2_(ptr noundef %10) #24
  %12 = call noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %1) #24
  %13 = call noundef ptr @_ZNSt3__111char_traitsIcE4copyEPcPKcm(ptr noundef %11, ptr noundef %12, i64 noundef %6) #24
  %14 = getelementptr inbounds i8, ptr %11, i64 %6
  %15 = call noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %2) #24
  %16 = call noundef ptr @_ZNSt3__111char_traitsIcE4copyEPcPKcm(ptr noundef %14, ptr noundef %15, i64 noundef %7) #24
  %17 = getelementptr inbounds i8, ptr %14, i64 %7
  %18 = call noundef ptr @_ZNSt3__111char_traitsIcE6assignEPcmc(ptr noundef %17, i64 noundef 1, i8 noundef signext 0) #24
  ret void
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt11range_errorC1B7v160006ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #0 align 2 {
  %3 = tail call noundef ptr @_ZNSt11range_errorC2B7v160006ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef nonnull align 8 dereferenceable(24) %1)
  ret ptr %0
}

; Function Attrs: nounwind
declare noundef ptr @_ZNSt11range_errorD1Ev(ptr noundef nonnull returned align 8 dereferenceable(16)) unnamed_addr #6

declare void @__cxa_throw(ptr, ptr, ptr) local_unnamed_addr

declare void @__cxa_free_exception(ptr) local_unnamed_addr

; Function Attrs: noinline ssp uwtable(sync)
define noundef nonnull ptr @_ZN7DNSNameC2ENSt3__117basic_string_viewIcNS0_11char_traitsIcEEEE(ptr noundef nonnull returned align 8 dereferenceable(24) %0, [2 x i64] %1) unnamed_addr #0 align 2 personality ptr @__gxx_personality_v0 {
  %3 = alloca %"class.std::__1::basic_string_view", align 8
  %4 = alloca %"class.std::__1::basic_string", align 8
  %5 = alloca %"class.std::__1::basic_string", align 8
  %6 = alloca %"class.std::__1::basic_string", align 8
  %7 = alloca %"class.boost::container::basic_string", align 8
  %8 = alloca %"class.std::__1::basic_string", align 8
  %9 = extractvalue [2 x i64] %1, 0
  store i64 %9, ptr %3, align 8
  %10 = extractvalue [2 x i64] %1, 1
  %11 = getelementptr inbounds [2 x i64], ptr %3, i64 0, i64 1
  store i64 %10, ptr %11, align 8
  %12 = tail call noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvEC1Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %13 = call noundef ptr @_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE4dataB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %3) #24
  %14 = ptrtoint ptr %13 to i64
  %15 = call noundef i64 @_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE6lengthB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %3) #24
  switch i64 %15, label %23 [
    i64 0, label %19
    i64 1, label %16
  ]

16:                                               ; preds = %2
  %17 = load i8, ptr %13, align 1, !tbaa !5
  %18 = icmp eq i8 %17, 46
  br i1 %18, label %19, label %23

19:                                               ; preds = %2, %16
  %20 = invoke noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6assignEmc(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef 1, i8 noundef signext 0)
          to label %169 unwind label %21

21:                                               ; preds = %19
  %22 = landingpad { ptr, i32 }
          cleanup
  br label %170

23:                                               ; preds = %2, %16
  %24 = call noundef ptr @_Z6memchrB7v160006Ua9enable_ifILb1EEPKvim(ptr noundef %13, i32 noundef 92, i64 noundef %15)
  %25 = icmp eq ptr %24, null
  br i1 %25, label %26, label %146

26:                                               ; preds = %23
  %27 = getelementptr inbounds i8, ptr %13, i64 %15
  %28 = add i64 %15, 1
  invoke void @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE7reserveEm(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %28)
          to label %29 unwind label %38

29:                                               ; preds = %26
  %30 = icmp eq i64 %15, 0
  br i1 %30, label %36, label %31

31:                                               ; preds = %29
  %32 = ptrtoint ptr %13 to i64
  %33 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %0, i64 0, i32 1
  %34 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 2
  %35 = add i64 %15, %14
  br label %40

36:                                               ; preds = %138, %29
  %37 = invoke noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6appendEmc(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef 1, i8 noundef signext 0)
          to label %169 unwind label %38

38:                                               ; preds = %36, %26
  %39 = landingpad { ptr, i32 }
          cleanup
  br label %170

40:                                               ; preds = %31, %138
  %41 = phi ptr [ %13, %31 ], [ %92, %138 ]
  %42 = ptrtoint ptr %41 to i64
  %43 = load i8, ptr %0, align 8, !tbaa !5
  %44 = and i8 %43, 1
  %45 = icmp eq i8 %44, 0
  %46 = lshr i8 %43, 1
  %47 = zext i8 %46 to i64
  %48 = load i64, ptr %0, align 8
  %49 = lshr i64 %48, 1
  %50 = select i1 %45, i64 %49, i64 %47
  %51 = load i8, ptr %41, align 1, !tbaa !5
  %52 = icmp eq i8 %51, 46
  br i1 %52, label %53, label %64

53:                                               ; preds = %40
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %4) #24
  %54 = invoke noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B7v160006IDnEEPKc(ptr noundef nonnull align 8 dereferenceable(24) %4, ptr noundef nonnull @.str.6)
          to label %55 unwind label %57

55:                                               ; preds = %53
  invoke void @_ZN7DNSName19throwSafeRangeErrorERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEPKcm(ptr noundef nonnull align 8 dereferenceable(24) %4, ptr noundef %13, i64 noundef %15)
          to label %56 unwind label %59

56:                                               ; preds = %55
  unreachable

57:                                               ; preds = %53
  %58 = landingpad { ptr, i32 }
          cleanup
  br label %62

59:                                               ; preds = %55
  %60 = landingpad { ptr, i32 }
          cleanup
  %61 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #24
  br label %62

62:                                               ; preds = %59, %57
  %63 = phi { ptr, i32 } [ %60, %59 ], [ %58, %57 ]
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %4) #24
  br label %170

64:                                               ; preds = %40
  %65 = invoke noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6appendEmc(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef 1, i8 noundef signext 0)
          to label %66 unwind label %83

66:                                               ; preds = %64
  %67 = icmp ne ptr %41, %27
  br i1 %67, label %68, label %85

68:                                               ; preds = %66
  %69 = getelementptr i8, ptr %41, i64 %35
  %70 = sub i64 0, %42
  %71 = getelementptr i8, ptr %69, i64 %70
  %72 = load i8, ptr %41, align 1, !tbaa !5
  %73 = icmp eq i8 %72, 46
  br i1 %73, label %85, label %77

74:                                               ; preds = %77
  %75 = load i8, ptr %81, align 1, !tbaa !5
  %76 = icmp eq i8 %75, 46
  br i1 %76, label %85, label %77, !llvm.loop !11

77:                                               ; preds = %68, %74
  %78 = phi i8 [ %80, %74 ], [ 0, %68 ]
  %79 = phi ptr [ %81, %74 ], [ %41, %68 ]
  %80 = add i8 %78, 1
  %81 = getelementptr inbounds i8, ptr %79, i64 1
  %82 = icmp ne ptr %81, %27
  br i1 %82, label %74, label %85, !llvm.loop !11

83:                                               ; preds = %64
  %84 = landingpad { ptr, i32 }
          cleanup
  br label %170

85:                                               ; preds = %77, %74, %68, %66
  %86 = phi i8 [ 0, %66 ], [ 0, %68 ], [ %80, %74 ], [ %80, %77 ]
  %87 = phi ptr [ %41, %66 ], [ %41, %68 ], [ %81, %74 ], [ %71, %77 ]
  %88 = phi i1 [ %67, %66 ], [ %67, %68 ], [ %82, %74 ], [ %82, %77 ]
  %89 = invoke noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6appendIPKcEERS5_T_SA_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull %41, ptr noundef nonnull %87)
          to label %90 unwind label %94

90:                                               ; preds = %85
  %91 = zext i1 %88 to i64
  %92 = getelementptr i8, ptr %87, i64 %91
  %93 = icmp ugt i8 %86, 63
  br i1 %93, label %96, label %107

94:                                               ; preds = %85
  %95 = landingpad { ptr, i32 }
          cleanup
  br label %170

96:                                               ; preds = %90
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %5) #24
  %97 = invoke noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B7v160006IDnEEPKc(ptr noundef nonnull align 8 dereferenceable(24) %5, ptr noundef nonnull @.str.7)
          to label %98 unwind label %100

98:                                               ; preds = %96
  invoke void @_ZN7DNSName19throwSafeRangeErrorERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEPKcm(ptr noundef nonnull align 8 dereferenceable(24) %5, ptr noundef %13, i64 noundef %15)
          to label %99 unwind label %102

99:                                               ; preds = %98
  unreachable

100:                                              ; preds = %96
  %101 = landingpad { ptr, i32 }
          cleanup
  br label %105

102:                                              ; preds = %98
  %103 = landingpad { ptr, i32 }
          cleanup
  %104 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %5) #24
  br label %105

105:                                              ; preds = %102, %100
  %106 = phi { ptr, i32 } [ %103, %102 ], [ %101, %100 ]
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %5) #24
  br label %170

107:                                              ; preds = %90
  %108 = ptrtoint ptr %92 to i64
  %109 = sub i64 %108, %32
  %110 = icmp sgt i64 %109, 254
  br i1 %110, label %111, label %122

111:                                              ; preds = %107
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %6) #24
  %112 = invoke noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B7v160006IDnEEPKc(ptr noundef nonnull align 8 dereferenceable(24) %6, ptr noundef nonnull @.str.8)
          to label %113 unwind label %115

113:                                              ; preds = %111
  invoke void @_ZN7DNSName19throwSafeRangeErrorERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEPKcm(ptr noundef nonnull align 8 dereferenceable(24) %6, ptr noundef %13, i64 noundef %15)
          to label %114 unwind label %117

114:                                              ; preds = %113
  unreachable

115:                                              ; preds = %111
  %116 = landingpad { ptr, i32 }
          cleanup
  br label %120

117:                                              ; preds = %113
  %118 = landingpad { ptr, i32 }
          cleanup
  %119 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %6) #24
  br label %120

120:                                              ; preds = %117, %115
  %121 = phi { ptr, i32 } [ %118, %117 ], [ %116, %115 ]
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %6) #24
  br label %170

122:                                              ; preds = %107
  %123 = and i64 %50, 255
  %124 = load i8, ptr %0, align 8, !tbaa !5
  %125 = and i8 %124, 1
  %126 = icmp eq i8 %125, 0
  %127 = lshr i8 %124, 1
  %128 = zext i8 %127 to i64
  %129 = load i64, ptr %0, align 8
  %130 = lshr i64 %129, 1
  %131 = select i1 %126, i64 %130, i64 %128
  %132 = icmp ugt i64 %131, %123
  br i1 %132, label %138, label %133, !prof !12

133:                                              ; preds = %122
  invoke void @__assert_rtn(ptr noundef nonnull @__func__._ZNK5boost9container12basic_stringIcNSt3__111char_traitsIcEEvEixEm, ptr noundef nonnull @.str.47, i32 noundef 1340, ptr noundef nonnull @.str.48) #26
          to label %134 unwind label %135

134:                                              ; preds = %133
  unreachable

135:                                              ; preds = %133
  %136 = landingpad { ptr, i32 }
          catch ptr null
  %137 = extractvalue { ptr, i32 } %136, 0
  call void @__clang_call_terminate(ptr %137) #27
  unreachable

138:                                              ; preds = %122
  %139 = load i8, ptr %0, align 8, !tbaa !5
  %140 = and i8 %139, 1
  %141 = icmp eq i8 %140, 0
  %142 = load ptr, ptr %34, align 8
  %143 = select i1 %141, ptr %142, ptr %33
  %144 = getelementptr inbounds i8, ptr %143, i64 %123
  store i8 %86, ptr %144, align 1, !tbaa !5
  %145 = icmp eq ptr %92, %27
  br i1 %145, label %36, label %40, !llvm.loop !13

146:                                              ; preds = %23
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %7) #24
  invoke void @_Z17segmentDNSNameRawPKcm(ptr nonnull sret(%"class.boost::container::basic_string") align 8 %7, ptr noundef %13, i64 noundef %15)
          to label %147 unwind label %160

147:                                              ; preds = %146
  %148 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvEaSEOS5_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %7) #24
  %149 = call noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %7) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %7) #24
  %150 = load i8, ptr %0, align 8, !tbaa !5
  %151 = and i8 %150, 1
  %152 = icmp eq i8 %151, 0
  %153 = load i64, ptr %0, align 8
  %154 = icmp ugt i64 %153, 511
  %155 = select i1 %152, i1 %154, i1 false
  br i1 %155, label %156, label %169

156:                                              ; preds = %147
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %8) #24
  %157 = invoke noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B7v160006IDnEEPKc(ptr noundef nonnull align 8 dereferenceable(24) %8, ptr noundef nonnull @.str.9)
          to label %158 unwind label %162

158:                                              ; preds = %156
  invoke void @_ZN7DNSName19throwSafeRangeErrorERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEPKcm(ptr noundef nonnull align 8 dereferenceable(24) %8, ptr noundef %13, i64 noundef %15)
          to label %159 unwind label %164

159:                                              ; preds = %158
  unreachable

160:                                              ; preds = %146
  %161 = landingpad { ptr, i32 }
          cleanup
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %7) #24
  br label %170

162:                                              ; preds = %156
  %163 = landingpad { ptr, i32 }
          cleanup
  br label %167

164:                                              ; preds = %158
  %165 = landingpad { ptr, i32 }
          cleanup
  %166 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %8) #24
  br label %167

167:                                              ; preds = %164, %162
  %168 = phi { ptr, i32 } [ %165, %164 ], [ %163, %162 ]
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %8) #24
  br label %170

169:                                              ; preds = %36, %147, %19
  ret ptr %0

170:                                              ; preds = %38, %94, %105, %120, %83, %62, %167, %160, %21
  %171 = phi { ptr, i32 } [ %22, %21 ], [ %168, %167 ], [ %161, %160 ], [ %39, %38 ], [ %84, %83 ], [ %63, %62 ], [ %121, %120 ], [ %106, %105 ], [ %95, %94 ]
  %172 = call noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  resume { ptr, i32 } %171
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvEC1Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #2 align 2 {
  %2 = tail call noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvEC2Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  ret ptr %0
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE4dataB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) local_unnamed_addr #7 align 2 {
  %2 = load ptr, ptr %0, align 8, !tbaa !14
  ret ptr %2
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNKSt3__117basic_string_viewIcNS_11char_traitsIcEEE6lengthB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) local_unnamed_addr #7 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::basic_string_view", ptr %0, i64 0, i32 1
  %3 = load i64, ptr %2, align 8, !tbaa !18
  ret i64 %3
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6assignEmc(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1, i8 noundef signext %2) local_unnamed_addr #0 align 2 {
  %4 = alloca i8, align 1
  store i8 %2, ptr %4, align 1, !tbaa !5
  %5 = ptrtoint ptr %4 to i64
  %6 = insertvalue [2 x i64] poison, i64 %5, 0
  %7 = insertvalue [2 x i64] %6, i64 %1, 1
  %8 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6assignINS0_17constant_iteratorIcEEEERS5_T_SA_PNS_11move_detail22disable_if_convertibleISA_mvE4typeE(ptr noundef nonnull align 8 dereferenceable(24) %0, [2 x i64] %7, [2 x i64] zeroinitializer, ptr noundef null)
  ret ptr %8
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_Z6memchrB7v160006Ua9enable_ifILb1EEPKvim(ptr noundef %0, i32 noundef %1, i64 noundef %2) local_unnamed_addr #7 {
  %4 = tail call ptr @memchr(ptr noundef %0, i32 noundef %1, i64 noundef %2) #24
  ret ptr %4
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr void @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE7reserveEm(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) local_unnamed_addr #4 align 2 {
  tail call void @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE12priv_reserveEmb(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1, i1 noundef zeroext true)
  ret void
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B7v160006IDnEEPKc(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef %1) unnamed_addr #0 align 2 {
  %3 = tail call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B7v160006IDnEEPKc(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1)
  ret ptr %0
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6appendEmc(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1, i8 noundef signext %2) local_unnamed_addr #0 align 2 {
  %4 = alloca i8, align 1
  store i8 %2, ptr %4, align 1, !tbaa !5
  %5 = ptrtoint ptr %4 to i64
  %6 = insertvalue [2 x i64] poison, i64 %5, 0
  %7 = insertvalue [2 x i64] %6, i64 %1, 1
  %8 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6appendINS0_17constant_iteratorIcEEEERS5_T_SA_(ptr noundef nonnull align 8 dereferenceable(24) %0, [2 x i64] %7, [2 x i64] zeroinitializer)
  ret ptr %8
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6appendIPKcEERS5_T_SA_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1, ptr noundef %2) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %4 = load i8, ptr %0, align 8, !tbaa !5
  %5 = and i8 %4, 1
  %6 = icmp eq i8 %5, 0
  %7 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %0, i64 0, i32 1
  %8 = lshr i8 %4, 1
  %9 = zext i8 %8 to i64
  %10 = getelementptr inbounds i8, ptr %7, i64 %9
  %11 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 2
  %12 = load ptr, ptr %11, align 8
  %13 = load i64, ptr %0, align 8
  %14 = lshr i64 %13, 1
  %15 = getelementptr inbounds i8, ptr %12, i64 %14
  %16 = select i1 %6, ptr %15, ptr %10
  %17 = tail call noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6insertIPKcEEPcS8_T_SA_PNS_11move_detail13disable_if_orIvNSB_14is_convertibleISA_mEENS0_3dtl17is_input_iteratorISA_Xsr21has_iterator_categoryISA_EE5valueEEENSB_5bool_ILb0EEESJ_E4typeE(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %16, ptr noundef %1, ptr noundef %2, ptr noundef null)
  ret ptr %0
}

declare void @_Z17segmentDNSNameRawPKcm(ptr sret(%"class.boost::container::basic_string") align 8, ptr noundef, i64 noundef) local_unnamed_addr #8

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvEaSEOS5_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) local_unnamed_addr #7 align 2 personality ptr @__gxx_personality_v0 {
  %3 = icmp eq ptr %0, %1
  br i1 %3, label %7, label %4, !prof !19

4:                                                ; preds = %2
  %5 = tail call noundef zeroext i1 @_ZN5boost9containereqERKNS0_13new_allocatorIcEES4_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef nonnull align 1 dereferenceable(1) %1) #24
  tail call void @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE5clearEv(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %6 = tail call noundef nonnull align 1 dereferenceable(1) ptr @_ZN5boost9container13new_allocatorIcEaSERKS2_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef nonnull align 1 dereferenceable(1) %1) #24
  invoke void @_ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE9swap_dataERS5_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1)
          to label %7 unwind label %8

7:                                                ; preds = %4, %2
  ret ptr %0

8:                                                ; preds = %4
  %9 = landingpad { ptr, i32 }
          catch ptr null
  %10 = extractvalue { ptr, i32 } %9, 0
  tail call void @__clang_call_terminate(ptr %10) #27
  unreachable
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvED1Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #2 align 2 {
  %2 = tail call noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvED2Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  ret ptr %0
}

; Function Attrs: noinline ssp uwtable(sync)
define noundef nonnull ptr @_ZN7DNSNameC2EPKciibPtS2_Pjt(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef %1, i32 noundef %2, i32 noundef %3, i1 noundef zeroext %4, ptr noundef %5, ptr noundef %6, ptr noundef %7, i16 noundef zeroext %8) unnamed_addr #0 align 2 personality ptr @__gxx_personality_v0 {
  %10 = alloca %"class.std::__1::basic_string", align 8
  %11 = alloca %"class.std::__1::basic_string", align 8
  %12 = alloca %"class.std::__1::basic_string", align 8
  %13 = alloca %"class.std::__1::basic_string", align 8
  %14 = alloca %"class.std::__1::basic_string", align 8
  %15 = alloca %"class.std::__1::basic_string", align 8
  %16 = tail call noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvEC1Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %17 = icmp sgt i32 %2, %3
  br i1 %17, label %68, label %18

18:                                               ; preds = %9
  %19 = tail call ptr @__cxa_allocate_exception(i64 16) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %10) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %11) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %12) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %13) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %14) #24
  invoke void @_ZNSt3__19to_stringEi(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %14, i32 noundef %3)
          to label %20 unwind label %28

20:                                               ; preds = %18
  invoke void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEPKS6_OS9_(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %13, ptr noundef nonnull @.str.10, ptr noundef nonnull align 8 dereferenceable(24) %14)
          to label %21 unwind label %30

21:                                               ; preds = %20
  invoke void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_PKS6_(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %12, ptr noundef nonnull align 8 dereferenceable(24) %13, ptr noundef nonnull @.str.11)
          to label %22 unwind label %32

22:                                               ; preds = %21
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %15) #24
  invoke void @_ZNSt3__19to_stringEi(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %15, i32 noundef %2)
          to label %23 unwind label %34

23:                                               ; preds = %22
  invoke void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_SA_(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %11, ptr noundef nonnull align 8 dereferenceable(24) %12, ptr noundef nonnull align 8 dereferenceable(24) %15)
          to label %24 unwind label %36

24:                                               ; preds = %23
  invoke void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_PKS6_(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %10, ptr noundef nonnull align 8 dereferenceable(24) %11, ptr noundef nonnull @.str.12)
          to label %25 unwind label %38

25:                                               ; preds = %24
  %26 = invoke noundef ptr @_ZNSt11range_errorC1B7v160006ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(ptr noundef nonnull align 8 dereferenceable(16) %19, ptr noundef nonnull align 8 dereferenceable(24) %10)
          to label %27 unwind label %40

27:                                               ; preds = %25
  invoke void @__cxa_throw(ptr nonnull %19, ptr nonnull @_ZTISt11range_error, ptr nonnull @_ZNSt11range_errorD1Ev) #25
          to label %90 unwind label %40

28:                                               ; preds = %18
  %29 = landingpad { ptr, i32 }
          cleanup
  br label %64

30:                                               ; preds = %20
  %31 = landingpad { ptr, i32 }
          cleanup
  br label %60

32:                                               ; preds = %21
  %33 = landingpad { ptr, i32 }
          cleanup
  br label %56

34:                                               ; preds = %22
  %35 = landingpad { ptr, i32 }
          cleanup
  br label %52

36:                                               ; preds = %23
  %37 = landingpad { ptr, i32 }
          cleanup
  br label %48

38:                                               ; preds = %24
  %39 = landingpad { ptr, i32 }
          cleanup
  br label %44

40:                                               ; preds = %27, %25
  %41 = phi i1 [ false, %27 ], [ true, %25 ]
  %42 = landingpad { ptr, i32 }
          cleanup
  %43 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %10) #24
  br label %44

44:                                               ; preds = %40, %38
  %45 = phi { ptr, i32 } [ %42, %40 ], [ %39, %38 ]
  %46 = phi i1 [ %41, %40 ], [ true, %38 ]
  %47 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %11) #24
  br label %48

48:                                               ; preds = %44, %36
  %49 = phi { ptr, i32 } [ %45, %44 ], [ %37, %36 ]
  %50 = phi i1 [ %46, %44 ], [ true, %36 ]
  %51 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %15) #24
  br label %52

52:                                               ; preds = %48, %34
  %53 = phi { ptr, i32 } [ %49, %48 ], [ %35, %34 ]
  %54 = phi i1 [ %50, %48 ], [ true, %34 ]
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %15) #24
  %55 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %12) #24
  br label %56

56:                                               ; preds = %52, %32
  %57 = phi { ptr, i32 } [ %53, %52 ], [ %33, %32 ]
  %58 = phi i1 [ %54, %52 ], [ true, %32 ]
  %59 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %13) #24
  br label %60

60:                                               ; preds = %56, %30
  %61 = phi { ptr, i32 } [ %57, %56 ], [ %31, %30 ]
  %62 = phi i1 [ %58, %56 ], [ true, %30 ]
  %63 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %14) #24
  br label %64

64:                                               ; preds = %60, %28
  %65 = phi { ptr, i32 } [ %61, %60 ], [ %29, %28 ]
  %66 = phi i1 [ %62, %60 ], [ true, %28 ]
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %14) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %13) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %12) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %11) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %10) #24
  br i1 %66, label %67, label %87

67:                                               ; preds = %64
  call void @__cxa_free_exception(ptr %19) #24
  br label %87

68:                                               ; preds = %9
  br i1 %4, label %83, label %69

69:                                               ; preds = %68
  %70 = sext i32 %3 to i64
  %71 = getelementptr inbounds i8, ptr %1, i64 %70
  %72 = sub nsw i32 %2, %3
  %73 = sext i32 %72 to i64
  %74 = tail call noundef ptr @_Z6memchrB7v160006Ua9enable_ifILb1EEPKvim(ptr noundef %71, i32 noundef 0, i64 noundef %73)
  %75 = icmp eq ptr %74, null
  br i1 %75, label %83, label %76

76:                                               ; preds = %69
  %77 = getelementptr inbounds i8, ptr %74, i64 2
  %78 = ptrtoint ptr %77 to i64
  %79 = ptrtoint ptr %71 to i64
  %80 = sub i64 %78, %79
  invoke void @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE7reserveEm(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %80)
          to label %83 unwind label %81

81:                                               ; preds = %76
  %82 = landingpad { ptr, i32 }
          cleanup
  br label %87

83:                                               ; preds = %69, %76, %68
  invoke void @_ZN7DNSName12packetParserEPKciibPtS2_Pjit(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1, i32 noundef %2, i32 noundef %3, i1 noundef zeroext %4, ptr noundef %5, ptr noundef %6, ptr noundef %7, i32 noundef 0, i16 noundef zeroext %8)
          to label %84 unwind label %85

84:                                               ; preds = %83
  ret ptr %0

85:                                               ; preds = %83
  %86 = landingpad { ptr, i32 }
          cleanup
  br label %87

87:                                               ; preds = %64, %67, %85, %81
  %88 = phi { ptr, i32 } [ %65, %67 ], [ %65, %64 ], [ %86, %85 ], [ %82, %81 ]
  %89 = call noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  resume { ptr, i32 } %88

90:                                               ; preds = %27
  unreachable
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_PKS6_(ptr noalias sret(%"class.std::__1::basic_string") align 8 %0, ptr noundef nonnull align 8 dereferenceable(24) %1, ptr noundef %2) local_unnamed_addr #4 {
  %4 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKc(ptr noundef nonnull align 8 dereferenceable(24) %1, ptr noundef %2)
  %5 = tail call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B7v160006EOS5_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %4) #24
  ret void
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_SA_(ptr noalias sret(%"class.std::__1::basic_string") align 8 %0, ptr noundef nonnull align 8 dereferenceable(24) %1, ptr noundef nonnull align 8 dereferenceable(24) %2) local_unnamed_addr #4 {
  %4 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendB7v160006ERKS5_(ptr noundef nonnull align 8 dereferenceable(24) %1, ptr noundef nonnull align 8 dereferenceable(24) %2)
  %5 = tail call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B7v160006EOS5_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %4) #24
  ret void
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEPKS6_OS9_(ptr noalias sret(%"class.std::__1::basic_string") align 8 %0, ptr noundef %1, ptr noundef nonnull align 8 dereferenceable(24) %2) local_unnamed_addr #4 {
  %4 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6insertEmPKc(ptr noundef nonnull align 8 dereferenceable(24) %2, i64 noundef 0, ptr noundef %1)
  %5 = tail call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B7v160006EOS5_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %4) #24
  ret void
}

declare void @_ZNSt3__19to_stringEi(ptr sret(%"class.std::__1::basic_string") align 8, i32 noundef) local_unnamed_addr #8

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_ZN7DNSName12packetParserEPKciibPtS2_Pjit(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1, i32 noundef %2, i32 noundef %3, i1 noundef zeroext %4, ptr noundef writeonly %5, ptr noundef writeonly %6, ptr noundef writeonly %7, i32 noundef %8, i16 noundef zeroext %9) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %11 = alloca %"class.std::__1::basic_string", align 8
  %12 = alloca %"class.std::__1::basic_string", align 8
  %13 = alloca %"class.std::__1::basic_string", align 8
  %14 = alloca %"class.std::__1::basic_string", align 8
  %15 = alloca %"class.std::__1::basic_string", align 8
  %16 = alloca %"class.std::__1::basic_string", align 8
  %17 = alloca %"class.std::__1::basic_string", align 8
  %18 = alloca %"class.std::__1::basic_string", align 8
  %19 = alloca %"class.std::__1::basic_string", align 8
  %20 = alloca %"class.std::__1::basic_string", align 8
  %21 = alloca %"class.std::__1::basic_string", align 8
  %22 = alloca %"class.std::__1::basic_string", align 8
  %23 = alloca %"class.std::__1::basic_string", align 8
  %24 = alloca %"class.std::__1::basic_string", align 8
  %25 = alloca %"class.std::__1::basic_string", align 8
  %26 = alloca %"class.std::__1::basic_string", align 8
  %27 = alloca %"class.std::__1::basic_string", align 8
  %28 = alloca %"class.std::__1::basic_string", align 8
  %29 = alloca %"class.std::__1::basic_string", align 8
  %30 = alloca %"class.std::__1::basic_string", align 8
  %31 = alloca %"class.std::__1::basic_string", align 8
  %32 = alloca %"class.std::__1::basic_string", align 8
  %33 = alloca %"class.std::__1::basic_string", align 8
  %34 = alloca %"class.std::__1::basic_string", align 8
  %35 = alloca %"class.std::__1::basic_string", align 8
  %36 = alloca %"class.std::__1::basic_string", align 8
  %37 = alloca %"class.std::__1::basic_string", align 8
  %38 = alloca %"class.std::__1::basic_string", align 8
  %39 = alloca %"class.std::__1::basic_string", align 8
  %40 = alloca %"class.std::__1::basic_string", align 8
  %41 = icmp slt i32 %3, %2
  br i1 %41, label %91, label %42

42:                                               ; preds = %10
  %43 = tail call ptr @__cxa_allocate_exception(i64 16) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %11) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %12) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %13) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %14) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %15) #24
  invoke void @_ZNSt3__19to_stringEi(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %15, i32 noundef %3)
          to label %44 unwind label %52

44:                                               ; preds = %42
  invoke void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEPKS6_OS9_(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %14, ptr noundef nonnull @.str.10, ptr noundef nonnull align 8 dereferenceable(24) %15)
          to label %45 unwind label %54

45:                                               ; preds = %44
  invoke void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_PKS6_(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %13, ptr noundef nonnull align 8 dereferenceable(24) %14, ptr noundef nonnull @.str.11)
          to label %46 unwind label %56

46:                                               ; preds = %45
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %16) #24
  invoke void @_ZNSt3__19to_stringEi(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %16, i32 noundef %2)
          to label %47 unwind label %58

47:                                               ; preds = %46
  invoke void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_SA_(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %12, ptr noundef nonnull align 8 dereferenceable(24) %13, ptr noundef nonnull align 8 dereferenceable(24) %16)
          to label %48 unwind label %60

48:                                               ; preds = %47
  invoke void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_PKS6_(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %11, ptr noundef nonnull align 8 dereferenceable(24) %12, ptr noundef nonnull @.str.12)
          to label %49 unwind label %62

49:                                               ; preds = %48
  %50 = invoke noundef ptr @_ZNSt11range_errorC1B7v160006ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(ptr noundef nonnull align 8 dereferenceable(16) %43, ptr noundef nonnull align 8 dereferenceable(24) %11)
          to label %51 unwind label %64

51:                                               ; preds = %49
  invoke void @__cxa_throw(ptr nonnull %43, ptr nonnull @_ZTISt11range_error, ptr nonnull @_ZNSt11range_errorD1Ev) #25
          to label %430 unwind label %64

52:                                               ; preds = %42
  %53 = landingpad { ptr, i32 }
          cleanup
  br label %88

54:                                               ; preds = %44
  %55 = landingpad { ptr, i32 }
          cleanup
  br label %84

56:                                               ; preds = %45
  %57 = landingpad { ptr, i32 }
          cleanup
  br label %80

58:                                               ; preds = %46
  %59 = landingpad { ptr, i32 }
          cleanup
  br label %76

60:                                               ; preds = %47
  %61 = landingpad { ptr, i32 }
          cleanup
  br label %72

62:                                               ; preds = %48
  %63 = landingpad { ptr, i32 }
          cleanup
  br label %68

64:                                               ; preds = %51, %49
  %65 = phi i1 [ false, %51 ], [ true, %49 ]
  %66 = landingpad { ptr, i32 }
          cleanup
  %67 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %11) #24
  br label %68

68:                                               ; preds = %64, %62
  %69 = phi { ptr, i32 } [ %66, %64 ], [ %63, %62 ]
  %70 = phi i1 [ %65, %64 ], [ true, %62 ]
  %71 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %12) #24
  br label %72

72:                                               ; preds = %68, %60
  %73 = phi { ptr, i32 } [ %69, %68 ], [ %61, %60 ]
  %74 = phi i1 [ %70, %68 ], [ true, %60 ]
  %75 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %16) #24
  br label %76

76:                                               ; preds = %72, %58
  %77 = phi { ptr, i32 } [ %73, %72 ], [ %59, %58 ]
  %78 = phi i1 [ %74, %72 ], [ true, %58 ]
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %16) #24
  %79 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %13) #24
  br label %80

80:                                               ; preds = %76, %56
  %81 = phi { ptr, i32 } [ %77, %76 ], [ %57, %56 ]
  %82 = phi i1 [ %78, %76 ], [ true, %56 ]
  %83 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %14) #24
  br label %84

84:                                               ; preds = %80, %54
  %85 = phi { ptr, i32 } [ %81, %80 ], [ %55, %54 ]
  %86 = phi i1 [ %82, %80 ], [ true, %54 ]
  %87 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %15) #24
  br label %88

88:                                               ; preds = %84, %52
  %89 = phi { ptr, i32 } [ %85, %84 ], [ %53, %52 ]
  %90 = phi i1 [ %86, %84 ], [ true, %52 ]
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %15) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %14) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %13) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %12) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %11) #24
  br i1 %90, label %425, label %428

91:                                               ; preds = %10
  %92 = zext i16 %9 to i32
  %93 = icmp sgt i32 %92, %3
  br i1 %93, label %94, label %143

94:                                               ; preds = %91
  %95 = tail call ptr @__cxa_allocate_exception(i64 16) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %17) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %18) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %19) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %20) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %21) #24
  invoke void @_ZNSt3__19to_stringEi(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %21, i32 noundef %3)
          to label %96 unwind label %104

96:                                               ; preds = %94
  invoke void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEPKS6_OS9_(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %20, ptr noundef nonnull @.str.13, ptr noundef nonnull align 8 dereferenceable(24) %21)
          to label %97 unwind label %106

97:                                               ; preds = %96
  invoke void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_PKS6_(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %19, ptr noundef nonnull align 8 dereferenceable(24) %20, ptr noundef nonnull @.str.14)
          to label %98 unwind label %108

98:                                               ; preds = %97
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %22) #24
  invoke void @_ZNSt3__19to_stringEi(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %22, i32 noundef %92)
          to label %99 unwind label %110

99:                                               ; preds = %98
  invoke void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_SA_(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %18, ptr noundef nonnull align 8 dereferenceable(24) %19, ptr noundef nonnull align 8 dereferenceable(24) %22)
          to label %100 unwind label %112

100:                                              ; preds = %99
  invoke void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_PKS6_(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %17, ptr noundef nonnull align 8 dereferenceable(24) %18, ptr noundef nonnull @.str.12)
          to label %101 unwind label %114

101:                                              ; preds = %100
  %102 = invoke noundef ptr @_ZNSt11range_errorC1B7v160006ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(ptr noundef nonnull align 8 dereferenceable(16) %95, ptr noundef nonnull align 8 dereferenceable(24) %17)
          to label %103 unwind label %116

103:                                              ; preds = %101
  invoke void @__cxa_throw(ptr nonnull %95, ptr nonnull @_ZTISt11range_error, ptr nonnull @_ZNSt11range_errorD1Ev) #25
          to label %430 unwind label %116

104:                                              ; preds = %94
  %105 = landingpad { ptr, i32 }
          cleanup
  br label %140

106:                                              ; preds = %96
  %107 = landingpad { ptr, i32 }
          cleanup
  br label %136

108:                                              ; preds = %97
  %109 = landingpad { ptr, i32 }
          cleanup
  br label %132

110:                                              ; preds = %98
  %111 = landingpad { ptr, i32 }
          cleanup
  br label %128

112:                                              ; preds = %99
  %113 = landingpad { ptr, i32 }
          cleanup
  br label %124

114:                                              ; preds = %100
  %115 = landingpad { ptr, i32 }
          cleanup
  br label %120

116:                                              ; preds = %103, %101
  %117 = phi i1 [ false, %103 ], [ true, %101 ]
  %118 = landingpad { ptr, i32 }
          cleanup
  %119 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %17) #24
  br label %120

120:                                              ; preds = %116, %114
  %121 = phi { ptr, i32 } [ %118, %116 ], [ %115, %114 ]
  %122 = phi i1 [ %117, %116 ], [ true, %114 ]
  %123 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %18) #24
  br label %124

124:                                              ; preds = %120, %112
  %125 = phi { ptr, i32 } [ %121, %120 ], [ %113, %112 ]
  %126 = phi i1 [ %122, %120 ], [ true, %112 ]
  %127 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %22) #24
  br label %128

128:                                              ; preds = %124, %110
  %129 = phi { ptr, i32 } [ %125, %124 ], [ %111, %110 ]
  %130 = phi i1 [ %126, %124 ], [ true, %110 ]
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %22) #24
  %131 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %19) #24
  br label %132

132:                                              ; preds = %128, %108
  %133 = phi { ptr, i32 } [ %129, %128 ], [ %109, %108 ]
  %134 = phi i1 [ %130, %128 ], [ true, %108 ]
  %135 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %20) #24
  br label %136

136:                                              ; preds = %132, %106
  %137 = phi { ptr, i32 } [ %133, %132 ], [ %107, %106 ]
  %138 = phi i1 [ %134, %132 ], [ true, %106 ]
  %139 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %21) #24
  br label %140

140:                                              ; preds = %136, %104
  %141 = phi { ptr, i32 } [ %137, %136 ], [ %105, %104 ]
  %142 = phi i1 [ %138, %136 ], [ true, %104 ]
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %21) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %20) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %19) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %18) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %17) #24
  br i1 %142, label %425, label %428

143:                                              ; preds = %91
  %144 = sext i32 %2 to i64
  %145 = getelementptr inbounds i8, ptr %1, i64 %144
  %146 = zext i32 %3 to i64
  %147 = getelementptr inbounds i8, ptr %1, i64 %146
  %148 = getelementptr inbounds i8, ptr %147, i64 1
  %149 = load i8, ptr %147, align 1, !tbaa !5
  %150 = icmp ne i8 %149, 0
  %151 = icmp ult ptr %148, %145
  %152 = select i1 %150, i1 %151, i1 false
  br i1 %152, label %153, label %270

153:                                              ; preds = %143
  %154 = icmp ugt i8 %149, -65
  br i1 %154, label %157, label %243

155:                                              ; preds = %258
  %156 = icmp ugt i8 %260, -65
  br i1 %156, label %157, label %243, !llvm.loop !20

157:                                              ; preds = %155, %153
  %158 = phi i8 [ %149, %153 ], [ %260, %155 ]
  %159 = phi ptr [ %148, %153 ], [ %259, %155 ]
  %160 = phi ptr [ %147, %153 ], [ %256, %155 ]
  br i1 %4, label %167, label %161

161:                                              ; preds = %157
  %162 = tail call ptr @__cxa_allocate_exception(i64 16) #24
  %163 = invoke noundef ptr @_ZNSt11range_errorC1B7v160006EPKc(ptr noundef nonnull align 8 dereferenceable(16) %162, ptr noundef nonnull @.str.15)
          to label %164 unwind label %165

164:                                              ; preds = %161
  tail call void @__cxa_throw(ptr nonnull %162, ptr nonnull @_ZTISt11range_error, ptr nonnull @_ZNSt11range_errorD1Ev) #25
  unreachable

165:                                              ; preds = %161
  %166 = landingpad { ptr, i32 }
          cleanup
  br label %425

167:                                              ; preds = %157
  %168 = and i8 %158, 63
  %169 = zext i8 %168 to i32
  %170 = shl nuw nsw i32 %169, 8
  %171 = load i8, ptr %159, align 1, !tbaa !5
  %172 = zext i8 %171 to i32
  %173 = or i32 %170, %172
  %174 = icmp slt i32 %173, %3
  br i1 %174, label %175, label %237

175:                                              ; preds = %167
  %176 = icmp ult i32 %173, %92
  br i1 %176, label %177, label %226

177:                                              ; preds = %175
  %178 = tail call ptr @__cxa_allocate_exception(i64 16) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %23) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %24) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %25) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %26) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %27) #24
  invoke void @_ZNSt3__19to_stringEi(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %27, i32 noundef %173)
          to label %179 unwind label %187

179:                                              ; preds = %177
  invoke void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEPKS6_OS9_(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %26, ptr noundef nonnull @.str.16, ptr noundef nonnull align 8 dereferenceable(24) %27)
          to label %180 unwind label %189

180:                                              ; preds = %179
  invoke void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_PKS6_(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %25, ptr noundef nonnull align 8 dereferenceable(24) %26, ptr noundef nonnull @.str.14)
          to label %181 unwind label %191

181:                                              ; preds = %180
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %28) #24
  invoke void @_ZNSt3__19to_stringEi(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %28, i32 noundef %92)
          to label %182 unwind label %193

182:                                              ; preds = %181
  invoke void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_SA_(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %24, ptr noundef nonnull align 8 dereferenceable(24) %25, ptr noundef nonnull align 8 dereferenceable(24) %28)
          to label %183 unwind label %195

183:                                              ; preds = %182
  invoke void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_PKS6_(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %23, ptr noundef nonnull align 8 dereferenceable(24) %24, ptr noundef nonnull @.str.12)
          to label %184 unwind label %197

184:                                              ; preds = %183
  %185 = invoke noundef ptr @_ZNSt11range_errorC1B7v160006ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(ptr noundef nonnull align 8 dereferenceable(16) %178, ptr noundef nonnull align 8 dereferenceable(24) %23)
          to label %186 unwind label %199

186:                                              ; preds = %184
  invoke void @__cxa_throw(ptr nonnull %178, ptr nonnull @_ZTISt11range_error, ptr nonnull @_ZNSt11range_errorD1Ev) #25
          to label %430 unwind label %199

187:                                              ; preds = %177
  %188 = landingpad { ptr, i32 }
          cleanup
  br label %223

189:                                              ; preds = %179
  %190 = landingpad { ptr, i32 }
          cleanup
  br label %219

191:                                              ; preds = %180
  %192 = landingpad { ptr, i32 }
          cleanup
  br label %215

193:                                              ; preds = %181
  %194 = landingpad { ptr, i32 }
          cleanup
  br label %211

195:                                              ; preds = %182
  %196 = landingpad { ptr, i32 }
          cleanup
  br label %207

197:                                              ; preds = %183
  %198 = landingpad { ptr, i32 }
          cleanup
  br label %203

199:                                              ; preds = %186, %184
  %200 = phi i1 [ false, %186 ], [ true, %184 ]
  %201 = landingpad { ptr, i32 }
          cleanup
  %202 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %23) #24
  br label %203

203:                                              ; preds = %199, %197
  %204 = phi { ptr, i32 } [ %201, %199 ], [ %198, %197 ]
  %205 = phi i1 [ %200, %199 ], [ true, %197 ]
  %206 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %24) #24
  br label %207

207:                                              ; preds = %203, %195
  %208 = phi { ptr, i32 } [ %204, %203 ], [ %196, %195 ]
  %209 = phi i1 [ %205, %203 ], [ true, %195 ]
  %210 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %28) #24
  br label %211

211:                                              ; preds = %207, %193
  %212 = phi { ptr, i32 } [ %208, %207 ], [ %194, %193 ]
  %213 = phi i1 [ %209, %207 ], [ true, %193 ]
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %28) #24
  %214 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %25) #24
  br label %215

215:                                              ; preds = %211, %191
  %216 = phi { ptr, i32 } [ %212, %211 ], [ %192, %191 ]
  %217 = phi i1 [ %213, %211 ], [ true, %191 ]
  %218 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %26) #24
  br label %219

219:                                              ; preds = %215, %189
  %220 = phi { ptr, i32 } [ %216, %215 ], [ %190, %189 ]
  %221 = phi i1 [ %217, %215 ], [ true, %189 ]
  %222 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %27) #24
  br label %223

223:                                              ; preds = %219, %187
  %224 = phi { ptr, i32 } [ %220, %219 ], [ %188, %187 ]
  %225 = phi i1 [ %221, %219 ], [ true, %187 ]
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %27) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %26) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %25) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %24) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %23) #24
  br i1 %225, label %425, label %428

226:                                              ; preds = %175
  %227 = icmp sgt i32 %8, 99
  br i1 %227, label %228, label %234

228:                                              ; preds = %226
  %229 = tail call ptr @__cxa_allocate_exception(i64 16) #24
  %230 = invoke noundef ptr @_ZNSt11range_errorC1B7v160006EPKc(ptr noundef nonnull align 8 dereferenceable(16) %229, ptr noundef nonnull @.str.17)
          to label %231 unwind label %232

231:                                              ; preds = %228
  tail call void @__cxa_throw(ptr nonnull %229, ptr nonnull @_ZTISt11range_error, ptr nonnull @_ZNSt11range_errorD1Ev) #25
  unreachable

232:                                              ; preds = %228
  %233 = landingpad { ptr, i32 }
          cleanup
  br label %425

234:                                              ; preds = %226
  %235 = add nsw i32 %8, 1
  tail call void @_ZN7DNSName12packetParserEPKciibPtS2_Pjit(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1, i32 noundef %2, i32 noundef %173, i1 noundef zeroext true, ptr noundef null, ptr noundef null, ptr noundef null, i32 noundef %235, i16 noundef zeroext %9)
  %236 = getelementptr inbounds i8, ptr %160, i64 2
  br label %270

237:                                              ; preds = %167
  %238 = tail call ptr @__cxa_allocate_exception(i64 16) #24
  %239 = invoke noundef ptr @_ZNSt11range_errorC1B7v160006EPKc(ptr noundef nonnull align 8 dereferenceable(16) %238, ptr noundef nonnull @.str.18)
          to label %240 unwind label %241

240:                                              ; preds = %237
  tail call void @__cxa_throw(ptr nonnull %238, ptr nonnull @_ZTISt11range_error, ptr nonnull @_ZNSt11range_errorD1Ev) #25
  unreachable

241:                                              ; preds = %237
  %242 = landingpad { ptr, i32 }
          cleanup
  br label %425

243:                                              ; preds = %153, %155
  %244 = phi ptr [ %259, %155 ], [ %148, %153 ]
  %245 = phi i8 [ %260, %155 ], [ %149, %153 ]
  %246 = zext i8 %245 to i32
  %247 = icmp ult i8 %245, 64
  br i1 %247, label %254, label %248

248:                                              ; preds = %243
  %249 = tail call ptr @__cxa_allocate_exception(i64 16) #24
  %250 = invoke noundef ptr @_ZNSt11range_errorC1B7v160006EPKc(ptr noundef nonnull align 8 dereferenceable(16) %249, ptr noundef nonnull @.str.19)
          to label %251 unwind label %252

251:                                              ; preds = %248
  tail call void @__cxa_throw(ptr nonnull %249, ptr nonnull @_ZTISt11range_error, ptr nonnull @_ZNSt11range_errorD1Ev) #25
  unreachable

252:                                              ; preds = %248
  %253 = landingpad { ptr, i32 }
          cleanup
  br label %425

254:                                              ; preds = %243
  %255 = zext i8 %245 to i64
  %256 = getelementptr inbounds i8, ptr %244, i64 %255
  %257 = icmp ult ptr %256, %145
  br i1 %257, label %258, label %264

258:                                              ; preds = %254
  tail call void @_ZN7DNSName14appendRawLabelEPKcj(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull %244, i32 noundef %246)
  %259 = getelementptr inbounds i8, ptr %256, i64 1
  %260 = load i8, ptr %256, align 1, !tbaa !5
  %261 = icmp ne i8 %260, 0
  %262 = icmp ult ptr %259, %145
  %263 = select i1 %261, i1 %262, i1 false
  br i1 %263, label %155, label %270, !llvm.loop !20

264:                                              ; preds = %254
  %265 = tail call ptr @__cxa_allocate_exception(i64 16) #24
  %266 = invoke noundef ptr @_ZNSt11range_errorC1B7v160006EPKc(ptr noundef nonnull align 8 dereferenceable(16) %265, ptr noundef nonnull @.str.20)
          to label %267 unwind label %268

267:                                              ; preds = %264
  tail call void @__cxa_throw(ptr nonnull %265, ptr nonnull @_ZTISt11range_error, ptr nonnull @_ZNSt11range_errorD1Ev) #25
  unreachable

268:                                              ; preds = %264
  %269 = landingpad { ptr, i32 }
          cleanup
  br label %425

270:                                              ; preds = %258, %143, %234
  %271 = phi ptr [ %236, %234 ], [ %148, %143 ], [ %259, %258 ]
  %272 = load i8, ptr %0, align 8, !tbaa !5
  %273 = and i8 %272, 1
  %274 = icmp eq i8 %273, 0
  %275 = lshr i8 %272, 1
  %276 = zext i8 %275 to i64
  %277 = load i64, ptr %0, align 8
  %278 = lshr i64 %277, 1
  %279 = select i1 %274, i64 %278, i64 %276
  %280 = icmp eq i64 %279, 0
  br i1 %280, label %281, label %283

281:                                              ; preds = %270
  %282 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6appendEmc(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef 1, i8 noundef signext 0)
  br label %283

283:                                              ; preds = %281, %270
  %284 = icmp eq ptr %7, null
  br i1 %284, label %291, label %285

285:                                              ; preds = %283
  %286 = ptrtoint ptr %271 to i64
  %287 = ptrtoint ptr %1 to i64
  %288 = add i64 %146, %287
  %289 = sub i64 %286, %288
  %290 = trunc i64 %289 to i32
  store i32 %290, ptr %7, align 4, !tbaa !21
  br label %291

291:                                              ; preds = %285, %283
  %292 = icmp eq ptr %5, null
  br i1 %292, label %357, label %293

293:                                              ; preds = %291
  %294 = getelementptr inbounds i8, ptr %271, i64 2
  %295 = icmp ugt ptr %294, %145
  br i1 %295, label %296, label %349

296:                                              ; preds = %293
  %297 = tail call ptr @__cxa_allocate_exception(i64 16) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %29) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %30) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %31) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %32) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %33) #24
  %298 = ptrtoint ptr %271 to i64
  %299 = ptrtoint ptr %1 to i64
  %300 = sub i64 2, %299
  %301 = add i64 %300, %298
  invoke void @_ZNSt3__19to_stringEl(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %33, i64 noundef %301)
          to label %302 unwind label %310

302:                                              ; preds = %296
  invoke void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEPKS6_OS9_(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %32, ptr noundef nonnull @.str.21, ptr noundef nonnull align 8 dereferenceable(24) %33)
          to label %303 unwind label %312

303:                                              ; preds = %302
  invoke void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_PKS6_(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %31, ptr noundef nonnull align 8 dereferenceable(24) %32, ptr noundef nonnull @.str.22)
          to label %304 unwind label %314

304:                                              ; preds = %303
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %34) #24
  invoke void @_ZNSt3__19to_stringEi(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %34, i32 noundef %2)
          to label %305 unwind label %316

305:                                              ; preds = %304
  invoke void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_SA_(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %30, ptr noundef nonnull align 8 dereferenceable(24) %31, ptr noundef nonnull align 8 dereferenceable(24) %34)
          to label %306 unwind label %318

306:                                              ; preds = %305
  invoke void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_PKS6_(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %29, ptr noundef nonnull align 8 dereferenceable(24) %30, ptr noundef nonnull @.str.12)
          to label %307 unwind label %320

307:                                              ; preds = %306
  %308 = invoke noundef ptr @_ZNSt11range_errorC1B7v160006ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(ptr noundef nonnull align 8 dereferenceable(16) %297, ptr noundef nonnull align 8 dereferenceable(24) %29)
          to label %309 unwind label %322

309:                                              ; preds = %307
  invoke void @__cxa_throw(ptr nonnull %297, ptr nonnull @_ZTISt11range_error, ptr nonnull @_ZNSt11range_errorD1Ev) #25
          to label %430 unwind label %322

310:                                              ; preds = %296
  %311 = landingpad { ptr, i32 }
          cleanup
  br label %346

312:                                              ; preds = %302
  %313 = landingpad { ptr, i32 }
          cleanup
  br label %342

314:                                              ; preds = %303
  %315 = landingpad { ptr, i32 }
          cleanup
  br label %338

316:                                              ; preds = %304
  %317 = landingpad { ptr, i32 }
          cleanup
  br label %334

318:                                              ; preds = %305
  %319 = landingpad { ptr, i32 }
          cleanup
  br label %330

320:                                              ; preds = %306
  %321 = landingpad { ptr, i32 }
          cleanup
  br label %326

322:                                              ; preds = %309, %307
  %323 = phi i1 [ false, %309 ], [ true, %307 ]
  %324 = landingpad { ptr, i32 }
          cleanup
  %325 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %29) #24
  br label %326

326:                                              ; preds = %322, %320
  %327 = phi { ptr, i32 } [ %324, %322 ], [ %321, %320 ]
  %328 = phi i1 [ %323, %322 ], [ true, %320 ]
  %329 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %30) #24
  br label %330

330:                                              ; preds = %326, %318
  %331 = phi { ptr, i32 } [ %327, %326 ], [ %319, %318 ]
  %332 = phi i1 [ %328, %326 ], [ true, %318 ]
  %333 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %34) #24
  br label %334

334:                                              ; preds = %330, %316
  %335 = phi { ptr, i32 } [ %331, %330 ], [ %317, %316 ]
  %336 = phi i1 [ %332, %330 ], [ true, %316 ]
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %34) #24
  %337 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %31) #24
  br label %338

338:                                              ; preds = %334, %314
  %339 = phi { ptr, i32 } [ %335, %334 ], [ %315, %314 ]
  %340 = phi i1 [ %336, %334 ], [ true, %314 ]
  %341 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %32) #24
  br label %342

342:                                              ; preds = %338, %312
  %343 = phi { ptr, i32 } [ %339, %338 ], [ %313, %312 ]
  %344 = phi i1 [ %340, %338 ], [ true, %312 ]
  %345 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %33) #24
  br label %346

346:                                              ; preds = %342, %310
  %347 = phi { ptr, i32 } [ %343, %342 ], [ %311, %310 ]
  %348 = phi i1 [ %344, %342 ], [ true, %310 ]
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %33) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %32) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %31) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %30) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %29) #24
  br i1 %348, label %425, label %428

349:                                              ; preds = %293
  %350 = load i8, ptr %271, align 1, !tbaa !5
  %351 = zext i8 %350 to i16
  %352 = shl nuw i16 %351, 8
  %353 = getelementptr inbounds i8, ptr %271, i64 1
  %354 = load i8, ptr %353, align 1, !tbaa !5
  %355 = zext i8 %354 to i16
  %356 = or i16 %352, %355
  store i16 %356, ptr %5, align 2, !tbaa !23
  br label %357

357:                                              ; preds = %349, %291
  %358 = getelementptr inbounds i8, ptr %271, i64 2
  %359 = icmp eq ptr %6, null
  br i1 %359, label %424, label %360

360:                                              ; preds = %357
  %361 = getelementptr inbounds i8, ptr %271, i64 4
  %362 = icmp ugt ptr %361, %145
  br i1 %362, label %363, label %416

363:                                              ; preds = %360
  %364 = tail call ptr @__cxa_allocate_exception(i64 16) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %35) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %36) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %37) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %38) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %39) #24
  %365 = ptrtoint ptr %358 to i64
  %366 = ptrtoint ptr %1 to i64
  %367 = sub i64 2, %366
  %368 = add i64 %367, %365
  invoke void @_ZNSt3__19to_stringEl(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %39, i64 noundef %368)
          to label %369 unwind label %377

369:                                              ; preds = %363
  invoke void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEPKS6_OS9_(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %38, ptr noundef nonnull @.str.23, ptr noundef nonnull align 8 dereferenceable(24) %39)
          to label %370 unwind label %379

370:                                              ; preds = %369
  invoke void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_PKS6_(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %37, ptr noundef nonnull align 8 dereferenceable(24) %38, ptr noundef nonnull @.str.22)
          to label %371 unwind label %381

371:                                              ; preds = %370
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %40) #24
  invoke void @_ZNSt3__19to_stringEi(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %40, i32 noundef %2)
          to label %372 unwind label %383

372:                                              ; preds = %371
  invoke void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_SA_(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %36, ptr noundef nonnull align 8 dereferenceable(24) %37, ptr noundef nonnull align 8 dereferenceable(24) %40)
          to label %373 unwind label %385

373:                                              ; preds = %372
  invoke void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_PKS6_(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %35, ptr noundef nonnull align 8 dereferenceable(24) %36, ptr noundef nonnull @.str.12)
          to label %374 unwind label %387

374:                                              ; preds = %373
  %375 = invoke noundef ptr @_ZNSt11range_errorC1B7v160006ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(ptr noundef nonnull align 8 dereferenceable(16) %364, ptr noundef nonnull align 8 dereferenceable(24) %35)
          to label %376 unwind label %389

376:                                              ; preds = %374
  invoke void @__cxa_throw(ptr nonnull %364, ptr nonnull @_ZTISt11range_error, ptr nonnull @_ZNSt11range_errorD1Ev) #25
          to label %430 unwind label %389

377:                                              ; preds = %363
  %378 = landingpad { ptr, i32 }
          cleanup
  br label %413

379:                                              ; preds = %369
  %380 = landingpad { ptr, i32 }
          cleanup
  br label %409

381:                                              ; preds = %370
  %382 = landingpad { ptr, i32 }
          cleanup
  br label %405

383:                                              ; preds = %371
  %384 = landingpad { ptr, i32 }
          cleanup
  br label %401

385:                                              ; preds = %372
  %386 = landingpad { ptr, i32 }
          cleanup
  br label %397

387:                                              ; preds = %373
  %388 = landingpad { ptr, i32 }
          cleanup
  br label %393

389:                                              ; preds = %376, %374
  %390 = phi i1 [ false, %376 ], [ true, %374 ]
  %391 = landingpad { ptr, i32 }
          cleanup
  %392 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %35) #24
  br label %393

393:                                              ; preds = %389, %387
  %394 = phi { ptr, i32 } [ %391, %389 ], [ %388, %387 ]
  %395 = phi i1 [ %390, %389 ], [ true, %387 ]
  %396 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %36) #24
  br label %397

397:                                              ; preds = %393, %385
  %398 = phi { ptr, i32 } [ %394, %393 ], [ %386, %385 ]
  %399 = phi i1 [ %395, %393 ], [ true, %385 ]
  %400 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %40) #24
  br label %401

401:                                              ; preds = %397, %383
  %402 = phi { ptr, i32 } [ %398, %397 ], [ %384, %383 ]
  %403 = phi i1 [ %399, %397 ], [ true, %383 ]
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %40) #24
  %404 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %37) #24
  br label %405

405:                                              ; preds = %401, %381
  %406 = phi { ptr, i32 } [ %402, %401 ], [ %382, %381 ]
  %407 = phi i1 [ %403, %401 ], [ true, %381 ]
  %408 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %38) #24
  br label %409

409:                                              ; preds = %405, %379
  %410 = phi { ptr, i32 } [ %406, %405 ], [ %380, %379 ]
  %411 = phi i1 [ %407, %405 ], [ true, %379 ]
  %412 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %39) #24
  br label %413

413:                                              ; preds = %409, %377
  %414 = phi { ptr, i32 } [ %410, %409 ], [ %378, %377 ]
  %415 = phi i1 [ %411, %409 ], [ true, %377 ]
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %39) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %38) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %37) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %36) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %35) #24
  br i1 %415, label %425, label %428

416:                                              ; preds = %360
  %417 = load i8, ptr %358, align 1, !tbaa !5
  %418 = zext i8 %417 to i16
  %419 = shl nuw i16 %418, 8
  %420 = getelementptr inbounds i8, ptr %271, i64 3
  %421 = load i8, ptr %420, align 1, !tbaa !5
  %422 = zext i8 %421 to i16
  %423 = or i16 %419, %422
  store i16 %423, ptr %6, align 2, !tbaa !23
  br label %424

424:                                              ; preds = %416, %357
  ret void

425:                                              ; preds = %413, %346, %223, %140, %88, %232, %241, %268, %252, %165
  %426 = phi ptr [ %162, %165 ], [ %249, %252 ], [ %265, %268 ], [ %238, %241 ], [ %229, %232 ], [ %43, %88 ], [ %95, %140 ], [ %178, %223 ], [ %297, %346 ], [ %364, %413 ]
  %427 = phi { ptr, i32 } [ %166, %165 ], [ %253, %252 ], [ %269, %268 ], [ %242, %241 ], [ %233, %232 ], [ %89, %88 ], [ %141, %140 ], [ %224, %223 ], [ %347, %346 ], [ %414, %413 ]
  call void @__cxa_free_exception(ptr %426) #24
  br label %428

428:                                              ; preds = %425, %346, %413, %223, %140, %88
  %429 = phi { ptr, i32 } [ %89, %88 ], [ %141, %140 ], [ %347, %346 ], [ %414, %413 ], [ %224, %223 ], [ %427, %425 ]
  resume { ptr, i32 } %429

430:                                              ; preds = %376, %309, %186, %103, %51
  unreachable
}

; Function Attrs: noinline ssp uwtable(sync)
define noundef nonnull ptr @_ZN7DNSNameC1EPKciibPtS2_Pjt(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef %1, i32 noundef %2, i32 noundef %3, i1 noundef zeroext %4, ptr noundef %5, ptr noundef %6, ptr noundef %7, i16 noundef zeroext %8) unnamed_addr #0 align 2 {
  %10 = tail call noundef ptr @_ZN7DNSNameC2EPKciibPtS2_Pjt(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1, i32 noundef %2, i32 noundef %3, i1 noundef zeroext %4, ptr noundef %5, ptr noundef %6, ptr noundef %7, i16 noundef zeroext %8)
  ret ptr %0
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt11range_errorC1B7v160006EPKc(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #0 align 2 {
  %3 = tail call noundef ptr @_ZNSt11range_errorC2B7v160006EPKc(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef %1)
  ret ptr %0
}

; Function Attrs: noinline ssp uwtable(sync)
define void @_ZN7DNSName14appendRawLabelEPKcj(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1, i32 noundef %2) local_unnamed_addr #0 align 2 personality ptr @__gxx_personality_v0 {
  %4 = icmp eq i32 %2, 0
  br i1 %4, label %5, label %11

5:                                                ; preds = %3
  %6 = tail call ptr @__cxa_allocate_exception(i64 16) #24
  %7 = invoke noundef ptr @_ZNSt11range_errorC1B7v160006EPKc(ptr noundef nonnull align 8 dereferenceable(16) %6, ptr noundef nonnull @.str.30)
          to label %8 unwind label %9

8:                                                ; preds = %5
  tail call void @__cxa_throw(ptr nonnull %6, ptr nonnull @_ZTISt11range_error, ptr nonnull @_ZNSt11range_errorD1Ev) #25
  unreachable

9:                                                ; preds = %5
  %10 = landingpad { ptr, i32 }
          cleanup
  br label %68

11:                                               ; preds = %3
  %12 = icmp ugt i32 %2, 63
  br i1 %12, label %13, label %19

13:                                               ; preds = %11
  %14 = tail call ptr @__cxa_allocate_exception(i64 16) #24
  %15 = invoke noundef ptr @_ZNSt11range_errorC1B7v160006EPKc(ptr noundef nonnull align 8 dereferenceable(16) %14, ptr noundef nonnull @.str.31)
          to label %16 unwind label %17

16:                                               ; preds = %13
  tail call void @__cxa_throw(ptr nonnull %14, ptr nonnull @_ZTISt11range_error, ptr nonnull @_ZNSt11range_errorD1Ev) #25
  unreachable

17:                                               ; preds = %13
  %18 = landingpad { ptr, i32 }
          cleanup
  br label %68

19:                                               ; preds = %11
  %20 = load i8, ptr %0, align 8, !tbaa !5
  %21 = and i8 %20, 1
  %22 = icmp eq i8 %21, 0
  %23 = lshr i8 %20, 1
  %24 = zext i8 %23 to i64
  %25 = load i64, ptr %0, align 8
  %26 = lshr i64 %25, 1
  %27 = select i1 %22, i64 %26, i64 %24
  %28 = zext i32 %2 to i64
  %29 = add nuw i64 %27, %28
  %30 = icmp ugt i64 %29, 254
  br i1 %30, label %31, label %37

31:                                               ; preds = %19
  %32 = tail call ptr @__cxa_allocate_exception(i64 16) #24
  %33 = invoke noundef ptr @_ZNSt11range_errorC1B7v160006EPKc(ptr noundef nonnull align 8 dereferenceable(16) %32, ptr noundef nonnull @.str.32)
          to label %34 unwind label %35

34:                                               ; preds = %31
  tail call void @__cxa_throw(ptr nonnull %32, ptr nonnull @_ZTISt11range_error, ptr nonnull @_ZNSt11range_errorD1Ev) #25
  unreachable

35:                                               ; preds = %31
  %36 = landingpad { ptr, i32 }
          cleanup
  br label %68

37:                                               ; preds = %19
  %38 = load i8, ptr %0, align 8, !tbaa !5
  %39 = and i8 %38, 1
  %40 = icmp eq i8 %39, 0
  %41 = lshr i8 %38, 1
  %42 = zext i8 %41 to i64
  %43 = load i64, ptr %0, align 8
  %44 = lshr i64 %43, 1
  %45 = select i1 %40, i64 %44, i64 %42
  %46 = icmp eq i64 %45, 0
  %47 = trunc i32 %2 to i8
  br i1 %46, label %48, label %50

48:                                               ; preds = %37
  %49 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6appendEmc(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef 1, i8 noundef signext %47)
  br label %65

50:                                               ; preds = %37
  %51 = load i8, ptr %0, align 8, !tbaa !5, !noalias !25
  %52 = and i8 %51, 1
  %53 = icmp eq i8 %52, 0
  %54 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %0, i64 0, i32 1
  %55 = lshr i8 %51, 1
  %56 = zext i8 %55 to i64
  %57 = getelementptr inbounds i8, ptr %54, i64 %56
  %58 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 2
  %59 = load ptr, ptr %58, align 8, !noalias !25
  %60 = load i64, ptr %0, align 8, !noalias !25
  %61 = lshr i64 %60, 1
  %62 = getelementptr inbounds i8, ptr %59, i64 %61
  %63 = select i1 %53, ptr %62, ptr %57
  %64 = getelementptr inbounds i8, ptr %63, i64 -1
  store i8 %47, ptr %64, align 1, !tbaa !5
  br label %65

65:                                               ; preds = %50, %48
  %66 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6appendEPKcm(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1, i64 noundef %28)
  %67 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6appendEmc(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef 1, i8 noundef signext 0)
  ret void

68:                                               ; preds = %35, %17, %9
  %69 = phi ptr [ %32, %35 ], [ %14, %17 ], [ %6, %9 ]
  %70 = phi { ptr, i32 } [ %36, %35 ], [ %18, %17 ], [ %10, %9 ]
  tail call void @__cxa_free_exception(ptr %69) #24
  resume { ptr, i32 } %70
}

declare void @_ZNSt3__19to_stringEl(ptr sret(%"class.std::__1::basic_string") align 8, i64 noundef) local_unnamed_addr #8

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_ZNK7DNSName8toStringERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEb(ptr noalias nonnull sret(%"class.std::__1::basic_string") align 8 %0, ptr noundef nonnull align 8 dereferenceable(24) %1, ptr noundef nonnull align 8 dereferenceable(24) %2, i1 noundef zeroext %3) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %5 = tail call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  invoke void @_ZNK7DNSName8toStringERNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEERKS6_b(ptr noundef nonnull align 8 dereferenceable(24) %1, ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %2, i1 noundef zeroext %3)
          to label %9 unwind label %6

6:                                                ; preds = %4
  %7 = landingpad { ptr, i32 }
          cleanup
  %8 = tail call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  resume { ptr, i32 } %7

9:                                                ; preds = %4
  ret void
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_ZNK7DNSName8toStringERNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEERKS6_b(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1, ptr noundef nonnull align 8 dereferenceable(24) %2, i1 noundef zeroext %3) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %5 = alloca %"class.std::__1::basic_string", align 8
  %6 = tail call noundef zeroext i1 @_ZNK7DNSName5emptyEv(ptr noundef nonnull align 8 dereferenceable(24) %0)
  br i1 %6, label %7, label %13

7:                                                ; preds = %4
  %8 = tail call ptr @__cxa_allocate_exception(i64 16) #24
  %9 = invoke noundef ptr @_ZNSt12out_of_rangeC1B7v160006EPKc(ptr noundef nonnull align 8 dereferenceable(16) %8, ptr noundef nonnull @.str.24)
          to label %10 unwind label %11

10:                                               ; preds = %7
  tail call void @__cxa_throw(ptr nonnull %8, ptr nonnull @_ZTISt12out_of_range, ptr nonnull @_ZNSt12out_of_rangeD1Ev) #25
  unreachable

11:                                               ; preds = %7
  %12 = landingpad { ptr, i32 }
          cleanup
  tail call void @__cxa_free_exception(ptr %8) #24
  br label %85

13:                                               ; preds = %4
  %14 = tail call noundef zeroext i1 @_ZNK7DNSName6isRootEv(ptr noundef nonnull align 8 dereferenceable(24) %0)
  br i1 %14, label %15, label %27

15:                                               ; preds = %13
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %5) #24
  br i1 %3, label %16, label %18

16:                                               ; preds = %15
  %17 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1ERKS5_(ptr noundef nonnull align 8 dereferenceable(24) %5, ptr noundef nonnull align 8 dereferenceable(24) %2)
  br label %20

18:                                               ; preds = %15
  %19 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B7v160006IDnEEPKc(ptr noundef nonnull align 8 dereferenceable(24) %5, ptr noundef nonnull @.str.25)
  br label %20

20:                                               ; preds = %18, %16
  %21 = invoke noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEpLB7v160006ERKS5_(ptr noundef nonnull align 8 dereferenceable(24) %1, ptr noundef nonnull align 8 dereferenceable(24) %5)
          to label %22 unwind label %24

22:                                               ; preds = %20
  %23 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %5) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %5) #24
  br label %84

24:                                               ; preds = %20
  %25 = landingpad { ptr, i32 }
          cleanup
  %26 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %5) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %5) #24
  br label %85

27:                                               ; preds = %13
  %28 = tail call noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE8capacityB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %1) #24
  %29 = tail call noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %1) #24
  %30 = load i8, ptr %0, align 8, !tbaa !5
  %31 = and i8 %30, 1
  %32 = icmp eq i8 %31, 0
  %33 = lshr i8 %30, 1
  %34 = zext i8 %33 to i64
  %35 = load i64, ptr %0, align 8
  %36 = lshr i64 %35, 1
  %37 = select i1 %32, i64 %36, i64 %34
  %38 = add i64 %37, %29
  %39 = icmp ult i64 %28, %38
  br i1 %39, label %40, label %51

40:                                               ; preds = %27
  %41 = tail call noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %1) #24
  %42 = load i8, ptr %0, align 8, !tbaa !5
  %43 = and i8 %42, 1
  %44 = icmp eq i8 %43, 0
  %45 = lshr i8 %42, 1
  %46 = zext i8 %45 to i64
  %47 = load i64, ptr %0, align 8
  %48 = lshr i64 %47, 1
  %49 = select i1 %44, i64 %48, i64 %46
  %50 = add i64 %49, %41
  tail call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7reserveEm(ptr noundef nonnull align 8 dereferenceable(24) %1, i64 noundef %50)
  br label %51

51:                                               ; preds = %40, %27
  %52 = load i8, ptr %0, align 8, !tbaa !5
  %53 = and i8 %52, 1
  %54 = icmp eq i8 %53, 0
  %55 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %0, i64 0, i32 1
  %56 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 2
  %57 = load ptr, ptr %56, align 8
  %58 = select i1 %54, ptr %57, ptr %55
  %59 = lshr i8 %52, 1
  %60 = zext i8 %59 to i64
  %61 = load i64, ptr %0, align 8
  %62 = lshr i64 %61, 1
  %63 = select i1 %54, i64 %62, i64 %60
  %64 = getelementptr inbounds i8, ptr %58, i64 %63
  %65 = icmp eq i64 %63, 0
  br i1 %65, label %79, label %66

66:                                               ; preds = %51, %70
  %67 = phi ptr [ %77, %70 ], [ %58, %51 ]
  %68 = load i8, ptr %67, align 1, !tbaa !5
  %69 = icmp eq i8 %68, 0
  br i1 %69, label %79, label %70

70:                                               ; preds = %66
  %71 = getelementptr inbounds i8, ptr %67, i64 1
  %72 = sext i8 %68 to i64
  tail call void @_ZN7DNSName18appendEscapedLabelERNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEPKcm(ptr noundef nonnull align 8 dereferenceable(24) %1, ptr noundef nonnull %71, i64 noundef %72)
  %73 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEpLB7v160006ERKS5_(ptr noundef nonnull align 8 dereferenceable(24) %1, ptr noundef nonnull align 8 dereferenceable(24) %2)
  %74 = load i8, ptr %67, align 1, !tbaa !5
  %75 = sext i8 %74 to i64
  %76 = add nsw i64 %75, 1
  %77 = getelementptr inbounds i8, ptr %67, i64 %76
  %78 = icmp ult ptr %77, %64
  br i1 %78, label %66, label %79, !llvm.loop !28

79:                                               ; preds = %66, %70, %51
  br i1 %3, label %84, label %80

80:                                               ; preds = %79
  %81 = tail call noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %1) #24
  %82 = tail call noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %2) #24
  %83 = sub i64 %81, %82
  tail call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6resizeB7v160006Em(ptr noundef nonnull align 8 dereferenceable(24) %1, i64 noundef %83)
  br label %84

84:                                               ; preds = %22, %80, %79
  ret void

85:                                               ; preds = %24, %11
  %86 = phi { ptr, i32 } [ %12, %11 ], [ %25, %24 ]
  resume { ptr, i32 } %86
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef zeroext i1 @_ZNK7DNSName5emptyEv(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 personality ptr @__gxx_personality_v0 {
  %2 = load i8, ptr %0, align 8, !tbaa !5
  %3 = and i8 %2, 1
  %4 = icmp eq i8 %3, 0
  %5 = lshr i8 %2, 1
  %6 = zext i8 %5 to i64
  %7 = load i64, ptr %0, align 8
  %8 = lshr i64 %7, 1
  %9 = select i1 %4, i64 %8, i64 %6
  %10 = icmp eq i64 %9, 0
  ret i1 %10
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt12out_of_rangeC1B7v160006EPKc(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #0 align 2 {
  %3 = tail call noundef ptr @_ZNSt12out_of_rangeC2B7v160006EPKc(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef %1)
  ret ptr %0
}

; Function Attrs: nounwind
declare noundef ptr @_ZNSt12out_of_rangeD1Ev(ptr noundef nonnull returned align 8 dereferenceable(16)) unnamed_addr #6

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef zeroext i1 @_ZNK7DNSName6isRootEv(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 personality ptr @__gxx_personality_v0 {
  %2 = load i8, ptr %0, align 8, !tbaa !5
  %3 = and i8 %2, 1
  %4 = icmp eq i8 %3, 0
  %5 = lshr i8 %2, 1
  %6 = zext i8 %5 to i64
  %7 = load i64, ptr %0, align 8
  %8 = lshr i64 %7, 1
  %9 = select i1 %4, i64 %8, i64 %6
  %10 = icmp eq i64 %9, 1
  br i1 %10, label %11, label %36

11:                                               ; preds = %1
  %12 = load i8, ptr %0, align 8, !tbaa !5
  %13 = and i8 %12, 1
  %14 = icmp eq i8 %13, 0
  %15 = lshr i8 %12, 1
  %16 = zext i8 %15 to i64
  %17 = load i64, ptr %0, align 8
  %18 = lshr i64 %17, 1
  %19 = select i1 %14, i64 %18, i64 %16
  %20 = icmp eq i64 %19, 0
  br i1 %20, label %21, label %26, !prof !19

21:                                               ; preds = %11
  invoke void @__assert_rtn(ptr noundef nonnull @__func__._ZNK5boost9container12basic_stringIcNSt3__111char_traitsIcEEvEixEm, ptr noundef nonnull @.str.47, i32 noundef 1355, ptr noundef nonnull @.str.48) #26
          to label %22 unwind label %23

22:                                               ; preds = %21
  unreachable

23:                                               ; preds = %21
  %24 = landingpad { ptr, i32 }
          catch ptr null
  %25 = extractvalue { ptr, i32 } %24, 0
  tail call void @__clang_call_terminate(ptr %25) #27
  unreachable

26:                                               ; preds = %11
  %27 = load i8, ptr %0, align 8, !tbaa !5
  %28 = and i8 %27, 1
  %29 = icmp eq i8 %28, 0
  %30 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %0, i64 0, i32 1
  %31 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 2
  %32 = load ptr, ptr %31, align 8
  %33 = select i1 %29, ptr %32, ptr %30
  %34 = load i8, ptr %33, align 1, !tbaa !5
  %35 = icmp eq i8 %34, 0
  br label %36

36:                                               ; preds = %26, %1
  %37 = phi i1 [ false, %1 ], [ %35, %26 ]
  ret i1 %37
}

declare noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1ERKS5_(ptr noundef nonnull returned align 8 dereferenceable(24), ptr noundef nonnull align 8 dereferenceable(24)) unnamed_addr #8

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEpLB7v160006ERKS5_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) local_unnamed_addr #4 align 2 {
  %3 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendB7v160006ERKS5_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1)
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE8capacityB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef zeroext i1 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  br i1 %2, label %3, label %6

3:                                                ; preds = %1
  %4 = tail call noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE14__get_long_capB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %5 = add i64 %4, -1
  br label %6

6:                                                ; preds = %1, %3
  %7 = phi i64 [ %5, %3 ], [ 22, %1 ]
  ret i64 %7
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef zeroext i1 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  br i1 %2, label %3, label %5

3:                                                ; preds = %1
  %4 = tail call noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE15__get_long_sizeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  br label %7

5:                                                ; preds = %1
  %6 = tail call noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16__get_short_sizeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  br label %7

7:                                                ; preds = %5, %3
  %8 = phi i64 [ %4, %3 ], [ %6, %5 ]
  ret i64 %8
}

declare void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7reserveEm(ptr noundef nonnull align 8 dereferenceable(24), i64 noundef) local_unnamed_addr #8

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6resizeB7v160006Em(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) local_unnamed_addr #4 align 2 {
  tail call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6resizeEmc(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1, i8 noundef signext 0)
  ret void
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr void @_ZNK7DNSName15toStringRootDotEv(ptr noalias sret(%"class.std::__1::basic_string") align 8 %0, ptr noundef nonnull align 8 dereferenceable(24) %1) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %3 = alloca %"class.std::__1::basic_string", align 8
  %4 = tail call noundef zeroext i1 @_ZNK7DNSName6isRootEv(ptr noundef nonnull align 8 dereferenceable(24) %1)
  br i1 %4, label %5, label %7

5:                                                ; preds = %2
  %6 = tail call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B7v160006IDnEEPKc(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull @.str)
  br label %14

7:                                                ; preds = %2
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %3) #24
  %8 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B7v160006IDnEEPKc(ptr noundef nonnull align 8 dereferenceable(24) %3, ptr noundef nonnull @.str)
  invoke void @_ZNK7DNSName8toStringERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEb(ptr sret(%"class.std::__1::basic_string") align 8 %0, ptr noundef nonnull align 8 dereferenceable(24) %1, ptr noundef nonnull align 8 dereferenceable(24) %3, i1 noundef zeroext false)
          to label %9 unwind label %11

9:                                                ; preds = %7
  %10 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %3) #24
  br label %14

11:                                               ; preds = %7
  %12 = landingpad { ptr, i32 }
          cleanup
  %13 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %3) #24
  resume { ptr, i32 } %12

14:                                               ; preds = %9, %5
  ret void
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_ZNK7DNSName11toDNSStringEv(ptr noalias sret(%"class.std::__1::basic_string") align 8 %0, ptr noundef nonnull align 8 dereferenceable(24) %1) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %3 = tail call noundef zeroext i1 @_ZNK7DNSName5emptyEv(ptr noundef nonnull align 8 dereferenceable(24) %1)
  br i1 %3, label %4, label %10

4:                                                ; preds = %2
  %5 = tail call ptr @__cxa_allocate_exception(i64 16) #24
  %6 = invoke noundef ptr @_ZNSt12out_of_rangeC1B7v160006EPKc(ptr noundef nonnull align 8 dereferenceable(16) %5, ptr noundef nonnull @.str.27)
          to label %7 unwind label %8

7:                                                ; preds = %4
  tail call void @__cxa_throw(ptr nonnull %5, ptr nonnull @_ZTISt12out_of_range, ptr nonnull @_ZNSt12out_of_rangeD1Ev) #25
  unreachable

8:                                                ; preds = %4
  %9 = landingpad { ptr, i32 }
          cleanup
  tail call void @__cxa_free_exception(ptr %5) #24
  resume { ptr, i32 } %9

10:                                               ; preds = %2
  %11 = load i8, ptr %1, align 8, !tbaa !5
  %12 = and i8 %11, 1
  %13 = icmp eq i8 %12, 0
  %14 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %1, i64 0, i32 1
  %15 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %1, i64 0, i32 2
  %16 = load ptr, ptr %15, align 8
  %17 = select i1 %13, ptr %16, ptr %14
  %18 = lshr i8 %11, 1
  %19 = zext i8 %18 to i64
  %20 = load i64, ptr %1, align 8
  %21 = lshr i64 %20, 1
  %22 = select i1 %13, i64 %21, i64 %19
  %23 = tail call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B7v160006EPKcm(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %17, i64 noundef %22)
  ret void
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B7v160006EPKcm(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef %1, i64 noundef %2) unnamed_addr #0 align 2 {
  %4 = tail call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B7v160006EPKcm(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1, i64 noundef %2)
  ret ptr %0
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_ZNK7DNSName13toDNSStringLCEv(ptr noalias sret(%"class.std::__1::basic_string") align 8 %0, ptr noundef nonnull align 8 dereferenceable(24) %1) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  tail call void @_ZNK7DNSName11toDNSStringEv(ptr sret(%"class.std::__1::basic_string") align 8 %0, ptr noundef nonnull align 8 dereferenceable(24) %1)
  invoke void @_Z14toLowerInPlaceRNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(ptr noundef nonnull align 8 dereferenceable(24) %0)
          to label %6 unwind label %3

3:                                                ; preds = %2
  %4 = landingpad { ptr, i32 }
          cleanup
  %5 = tail call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  resume { ptr, i32 } %4

6:                                                ; preds = %2
  ret void
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr void @_Z14toLowerInPlaceRNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #4 {
  %2 = tail call noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6lengthB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %3 = icmp eq i64 %2, 0
  br i1 %3, label %4, label %5

4:                                                ; preds = %15, %1
  ret void

5:                                                ; preds = %1, %15
  %6 = phi i64 [ %16, %15 ], [ 0, %1 ]
  %7 = tail call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEixB7v160006Em(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %6) #24
  %8 = load i8, ptr %7, align 1, !tbaa !5
  %9 = tail call noundef zeroext i8 @_Z11dns_tolowerh(i8 noundef zeroext %8)
  %10 = tail call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEixB7v160006Em(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %6) #24
  %11 = load i8, ptr %10, align 1, !tbaa !5
  %12 = icmp eq i8 %9, %11
  br i1 %12, label %15, label %13

13:                                               ; preds = %5
  %14 = tail call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEixB7v160006Em(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %6) #24
  store i8 %9, ptr %14, align 1, !tbaa !5
  br label %15

15:                                               ; preds = %5, %13
  %16 = add nuw i64 %6, 1
  %17 = icmp eq i64 %16, %2
  br i1 %17, label %4, label %5, !llvm.loop !29
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind ssp willreturn memory(argmem: read) uwtable(sync)
define noundef i64 @_ZNK7DNSName10wirelengthEv(ptr nocapture noundef nonnull readonly align 8 dereferenceable(24) %0) local_unnamed_addr #9 align 2 personality ptr @__gxx_personality_v0 {
  %2 = load i8, ptr %0, align 8, !tbaa !5
  %3 = and i8 %2, 1
  %4 = icmp eq i8 %3, 0
  %5 = lshr i8 %2, 1
  %6 = zext i8 %5 to i64
  %7 = load i64, ptr %0, align 8
  %8 = lshr i64 %7, 1
  %9 = select i1 %4, i64 %8, i64 %6
  ret i64 %9
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef zeroext i1 @_ZNK7DNSName8isPartOfERKS_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %3 = tail call noundef zeroext i1 @_ZNK7DNSName5emptyEv(ptr noundef nonnull align 8 dereferenceable(24) %1)
  br i1 %3, label %6, label %4

4:                                                ; preds = %2
  %5 = tail call noundef zeroext i1 @_ZNK7DNSName5emptyEv(ptr noundef nonnull align 8 dereferenceable(24) %0)
  br i1 %5, label %6, label %12

6:                                                ; preds = %4, %2
  %7 = tail call ptr @__cxa_allocate_exception(i64 16) #24
  %8 = invoke noundef ptr @_ZNSt12out_of_rangeC1B7v160006EPKc(ptr noundef nonnull align 8 dereferenceable(16) %7, ptr noundef nonnull @.str.28)
          to label %9 unwind label %10

9:                                                ; preds = %6
  tail call void @__cxa_throw(ptr nonnull %7, ptr nonnull @_ZTISt12out_of_range, ptr nonnull @_ZNSt12out_of_rangeD1Ev) #25
  unreachable

10:                                               ; preds = %6
  %11 = landingpad { ptr, i32 }
          cleanup
  br label %169

12:                                               ; preds = %4
  %13 = load i8, ptr %1, align 8, !tbaa !5
  %14 = and i8 %13, 1
  %15 = icmp eq i8 %14, 0
  %16 = lshr i8 %13, 1
  %17 = zext i8 %16 to i64
  %18 = load i64, ptr %1, align 8
  %19 = lshr i64 %18, 1
  %20 = select i1 %15, i64 %19, i64 %17
  %21 = load i8, ptr %0, align 8, !tbaa !5
  %22 = and i8 %21, 1
  %23 = icmp eq i8 %22, 0
  %24 = lshr i8 %21, 1
  %25 = zext i8 %24 to i64
  %26 = load i64, ptr %0, align 8
  %27 = lshr i64 %26, 1
  %28 = select i1 %23, i64 %27, i64 %25
  %29 = icmp ugt i64 %20, %28
  br i1 %29, label %167, label %30

30:                                               ; preds = %12
  %31 = load i8, ptr %0, align 8, !tbaa !5
  %32 = and i8 %31, 1
  %33 = icmp eq i8 %32, 0
  %34 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %0, i64 0, i32 1
  %35 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 2
  %36 = load ptr, ptr %35, align 8
  %37 = select i1 %33, ptr %36, ptr %34
  %38 = load i8, ptr %0, align 8, !tbaa !5
  %39 = and i8 %38, 1
  %40 = icmp eq i8 %39, 0
  %41 = lshr i8 %38, 1
  %42 = zext i8 %41 to i64
  %43 = getelementptr inbounds i8, ptr %34, i64 %42
  %44 = load ptr, ptr %35, align 8
  %45 = load i64, ptr %0, align 8
  %46 = lshr i64 %45, 1
  %47 = getelementptr inbounds i8, ptr %44, i64 %46
  %48 = select i1 %40, ptr %47, ptr %43
  %49 = icmp ult ptr %37, %48
  br i1 %49, label %50, label %162

50:                                               ; preds = %30
  %51 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %1, i64 0, i32 1
  %52 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %1, i64 0, i32 2
  br label %53

53:                                               ; preds = %50, %145
  %54 = phi ptr [ %44, %50 ], [ %156, %145 ]
  %55 = phi i1 [ undef, %50 ], [ %144, %145 ]
  %56 = phi ptr [ %37, %50 ], [ %149, %145 ]
  %57 = load i8, ptr %0, align 8, !tbaa !5
  %58 = and i8 %57, 1
  %59 = icmp eq i8 %58, 0
  %60 = lshr i8 %57, 1
  %61 = zext i8 %60 to i64
  %62 = getelementptr inbounds i8, ptr %34, i64 %61
  %63 = load i64, ptr %0, align 8
  %64 = lshr i64 %63, 1
  %65 = getelementptr inbounds i8, ptr %54, i64 %64
  %66 = select i1 %59, ptr %65, ptr %62
  %67 = tail call noundef i64 @_ZNSt3__18distanceB7v160006IPKcEENS_15iterator_traitsIT_E15difference_typeES4_S4_(ptr noundef %56, ptr noundef %66)
  %68 = icmp slt i64 %67, 0
  br i1 %68, label %140, label %69

69:                                               ; preds = %53
  %70 = load i8, ptr %1, align 8, !tbaa !5
  %71 = and i8 %70, 1
  %72 = icmp eq i8 %71, 0
  %73 = lshr i8 %70, 1
  %74 = zext i8 %73 to i64
  %75 = load i64, ptr %1, align 8
  %76 = lshr i64 %75, 1
  %77 = select i1 %72, i64 %76, i64 %74
  %78 = icmp ult i64 %67, %77
  br i1 %78, label %140, label %79

79:                                               ; preds = %69
  %80 = load i8, ptr %1, align 8, !tbaa !5
  %81 = and i8 %80, 1
  %82 = icmp eq i8 %81, 0
  %83 = lshr i8 %80, 1
  %84 = zext i8 %83 to i64
  %85 = load i64, ptr %1, align 8
  %86 = lshr i64 %85, 1
  %87 = select i1 %82, i64 %86, i64 %84
  %88 = icmp eq i64 %67, %87
  br i1 %88, label %89, label %131

89:                                               ; preds = %79
  %90 = load i8, ptr %0, align 8, !tbaa !5
  %91 = and i8 %90, 1
  %92 = icmp eq i8 %91, 0
  %93 = lshr i8 %90, 1
  %94 = zext i8 %93 to i64
  %95 = getelementptr inbounds i8, ptr %34, i64 %94
  %96 = load ptr, ptr %35, align 8
  %97 = load i64, ptr %0, align 8
  %98 = lshr i64 %97, 1
  %99 = getelementptr inbounds i8, ptr %96, i64 %98
  %100 = select i1 %92, ptr %99, ptr %95
  %101 = icmp eq ptr %56, %100
  br i1 %101, label %140, label %102

102:                                              ; preds = %89
  %103 = load i8, ptr %1, align 8, !tbaa !5
  %104 = and i8 %103, 1
  %105 = icmp eq i8 %104, 0
  %106 = load ptr, ptr %52, align 8
  %107 = select i1 %105, ptr %106, ptr %51
  br label %108

108:                                              ; preds = %102, %116
  %109 = phi ptr [ %118, %116 ], [ %107, %102 ]
  %110 = phi ptr [ %117, %116 ], [ %56, %102 ]
  %111 = load i8, ptr %109, align 1, !tbaa !5
  %112 = tail call noundef zeroext i8 @_Z11dns_tolowerh(i8 noundef zeroext %111)
  %113 = load i8, ptr %110, align 1, !tbaa !5
  %114 = tail call noundef zeroext i8 @_Z11dns_tolowerh(i8 noundef zeroext %113)
  %115 = icmp eq i8 %112, %114
  br i1 %115, label %116, label %140

116:                                              ; preds = %108
  %117 = getelementptr inbounds i8, ptr %110, i64 1
  %118 = getelementptr inbounds i8, ptr %109, i64 1
  %119 = load i8, ptr %0, align 8, !tbaa !5
  %120 = and i8 %119, 1
  %121 = icmp eq i8 %120, 0
  %122 = lshr i8 %119, 1
  %123 = zext i8 %122 to i64
  %124 = getelementptr inbounds i8, ptr %34, i64 %123
  %125 = load ptr, ptr %35, align 8
  %126 = load i64, ptr %0, align 8
  %127 = lshr i64 %126, 1
  %128 = getelementptr inbounds i8, ptr %125, i64 %127
  %129 = select i1 %121, ptr %128, ptr %124
  %130 = icmp eq ptr %117, %129
  br i1 %130, label %140, label %108, !llvm.loop !30

131:                                              ; preds = %79
  %132 = load i8, ptr %56, align 1, !tbaa !5
  %133 = icmp ugt i8 %132, 63
  br i1 %133, label %134, label %140

134:                                              ; preds = %131
  %135 = tail call ptr @__cxa_allocate_exception(i64 16) #24
  %136 = invoke noundef ptr @_ZNSt12out_of_rangeC1B7v160006EPKc(ptr noundef nonnull align 8 dereferenceable(16) %135, ptr noundef nonnull @.str.29)
          to label %137 unwind label %138

137:                                              ; preds = %134
  tail call void @__cxa_throw(ptr nonnull %135, ptr nonnull @_ZTISt12out_of_range, ptr nonnull @_ZNSt12out_of_rangeD1Ev) #25
  unreachable

138:                                              ; preds = %134
  %139 = landingpad { ptr, i32 }
          cleanup
  br label %169

140:                                              ; preds = %116, %108, %89, %131, %53, %69
  %141 = phi ptr [ %56, %69 ], [ %56, %53 ], [ %56, %131 ], [ %56, %89 ], [ %110, %108 ], [ %117, %116 ]
  %142 = phi i1 [ false, %69 ], [ false, %53 ], [ true, %131 ], [ false, %89 ], [ false, %108 ], [ false, %116 ]
  %143 = phi i32 [ 2, %69 ], [ 2, %53 ], [ 0, %131 ], [ 1, %89 ], [ 1, %108 ], [ 1, %116 ]
  %144 = phi i1 [ %55, %69 ], [ %55, %53 ], [ %55, %131 ], [ %101, %89 ], [ false, %108 ], [ %130, %116 ]
  br i1 %142, label %145, label %162

145:                                              ; preds = %140
  %146 = load i8, ptr %141, align 1, !tbaa !5
  %147 = sext i8 %146 to i64
  %148 = add nsw i64 %147, 1
  %149 = getelementptr inbounds i8, ptr %141, i64 %148
  %150 = load i8, ptr %0, align 8, !tbaa !5
  %151 = and i8 %150, 1
  %152 = icmp eq i8 %151, 0
  %153 = lshr i8 %150, 1
  %154 = zext i8 %153 to i64
  %155 = getelementptr inbounds i8, ptr %34, i64 %154
  %156 = load ptr, ptr %35, align 8
  %157 = load i64, ptr %0, align 8
  %158 = lshr i64 %157, 1
  %159 = getelementptr inbounds i8, ptr %156, i64 %158
  %160 = select i1 %152, ptr %159, ptr %155
  %161 = icmp ult ptr %149, %160
  br i1 %161, label %53, label %162, !llvm.loop !31

162:                                              ; preds = %140, %145, %30
  %163 = phi i32 [ 2, %30 ], [ %143, %140 ], [ 2, %145 ]
  %164 = phi i1 [ undef, %30 ], [ %144, %145 ], [ %144, %140 ]
  %165 = icmp ne i32 %163, 2
  %166 = select i1 %165, i1 %164, i1 false
  br label %167

167:                                              ; preds = %162, %12
  %168 = phi i1 [ false, %12 ], [ %166, %162 ]
  ret i1 %168

169:                                              ; preds = %138, %10
  %170 = phi ptr [ %135, %138 ], [ %7, %10 ]
  %171 = phi { ptr, i32 } [ %139, %138 ], [ %11, %10 ]
  tail call void @__cxa_free_exception(ptr %170) #24
  resume { ptr, i32 } %171
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNSt3__18distanceB7v160006IPKcEENS_15iterator_traitsIT_E15difference_typeES4_S4_(ptr noundef %0, ptr noundef %1) local_unnamed_addr #4 {
  %3 = tail call noundef i64 @_ZNSt3__110__distanceB7v160006IPKcEENS_15iterator_traitsIT_E15difference_typeES4_S4_NS_26random_access_iterator_tagE(ptr noundef %0, ptr noundef %1)
  ret i64 %3
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef zeroext i8 @_Z11dns_tolowerh(i8 noundef zeroext %0) local_unnamed_addr #7 {
  %2 = zext i8 %0 to i64
  %3 = getelementptr inbounds [256 x i8], ptr @dns_tolower_table, i64 0, i64 %2
  %4 = load i8, ptr %3, align 1, !tbaa !5
  ret i8 %4
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_ZNK7DNSName12makeRelativeERKS_(ptr noalias nonnull sret(%class.DNSName) align 8 %0, ptr noundef nonnull align 8 dereferenceable(24) %1, ptr noundef nonnull align 8 dereferenceable(24) %2) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %4 = tail call noundef ptr @_ZN7DNSNameC1ERKS_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1)
  invoke void @_ZN7DNSName14makeUsRelativeERKS_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %2)
          to label %8 unwind label %5

5:                                                ; preds = %3
  %6 = landingpad { ptr, i32 }
          cleanup
  %7 = tail call noundef ptr @_ZN7DNSNameD1Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  resume { ptr, i32 } %6

8:                                                ; preds = %3
  ret void
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7DNSNameC1ERKS_(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #0 align 2 {
  %3 = tail call noundef ptr @_ZN7DNSNameC2ERKS_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1)
  ret ptr %0
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_ZN7DNSName14makeUsRelativeERKS_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %3 = tail call noundef zeroext i1 @_ZNK7DNSName8isPartOfERKS_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1)
  br i1 %3, label %4, label %24

4:                                                ; preds = %2
  %5 = load i8, ptr %0, align 8, !tbaa !5
  %6 = and i8 %5, 1
  %7 = icmp eq i8 %6, 0
  %8 = lshr i8 %5, 1
  %9 = zext i8 %8 to i64
  %10 = load i64, ptr %0, align 8
  %11 = lshr i64 %10, 1
  %12 = select i1 %7, i64 %11, i64 %9
  %13 = load i8, ptr %1, align 8, !tbaa !5
  %14 = and i8 %13, 1
  %15 = icmp eq i8 %14, 0
  %16 = lshr i8 %13, 1
  %17 = zext i8 %16 to i64
  %18 = load i64, ptr %1, align 8
  %19 = lshr i64 %18, 1
  %20 = select i1 %15, i64 %19, i64 %17
  %21 = sub nsw i64 %12, %20
  %22 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE5eraseEmm(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %21, i64 noundef -1)
  %23 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6appendEmc(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef 1, i8 noundef signext 0)
  br label %25

24:                                               ; preds = %2
  tail call void @_ZN7DNSName5clearEv(ptr noundef nonnull align 8 dereferenceable(24) %0)
  br label %25

25:                                               ; preds = %24, %4
  ret void
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE5eraseEmm(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1, i64 noundef %2) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  store i64 %2, ptr %4, align 8, !tbaa !32
  %6 = load i8, ptr %0, align 8, !tbaa !5
  %7 = and i8 %6, 1
  %8 = icmp eq i8 %7, 0
  %9 = lshr i8 %6, 1
  %10 = zext i8 %9 to i64
  %11 = load i64, ptr %0, align 8
  %12 = lshr i64 %11, 1
  %13 = select i1 %8, i64 %12, i64 %10
  %14 = icmp ult i64 %13, %1
  br i1 %14, label %15, label %16

15:                                               ; preds = %3
  tail call void @_ZN5boost9container18throw_out_of_rangeEPKc(ptr noundef nonnull @.str.58) #25
  unreachable

16:                                               ; preds = %3
  %17 = load i8, ptr %0, align 8, !tbaa !5
  %18 = and i8 %17, 1
  %19 = icmp eq i8 %18, 0
  %20 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %0, i64 0, i32 1
  %21 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 2
  %22 = load ptr, ptr %21, align 8
  %23 = select i1 %19, ptr %22, ptr %20
  %24 = getelementptr inbounds i8, ptr %23, i64 %1
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %5) #24
  %25 = lshr i8 %17, 1
  %26 = zext i8 %25 to i64
  %27 = load i64, ptr %0, align 8
  %28 = lshr i64 %27, 1
  %29 = select i1 %19, i64 %28, i64 %26
  %30 = sub i64 %29, %1
  store i64 %30, ptr %5, align 8, !tbaa !32
  %31 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZN5boost9container3dtl9min_valueImEERKT_S5_S5_(ptr noundef nonnull align 8 dereferenceable(8) %4, ptr noundef nonnull align 8 dereferenceable(8) %5)
  %32 = load i64, ptr %31, align 8, !tbaa !32
  %33 = getelementptr inbounds i8, ptr %24, i64 %32
  %34 = call noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE5eraseEPKcS7_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %24, ptr noundef %33) #24
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %5) #24
  ret ptr %0
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr void @_ZN7DNSName5clearEv(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  tail call void @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE5clearEv(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  ret void
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_ZNK7DNSName15getCommonLabelsERKS_(ptr noalias sret(%class.DNSName) align 8 %0, ptr noundef nonnull align 8 dereferenceable(24) %1, ptr noundef nonnull align 8 dereferenceable(24) %2) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %4 = alloca %"class.std::__1::vector", align 8
  %5 = alloca %"class.std::__1::vector", align 8
  %6 = tail call noundef zeroext i1 @_ZNK7DNSName5emptyEv(ptr noundef nonnull align 8 dereferenceable(24) %1)
  br i1 %6, label %9, label %7

7:                                                ; preds = %3
  %8 = tail call noundef zeroext i1 @_ZNK7DNSName5emptyEv(ptr noundef nonnull align 8 dereferenceable(24) %2)
  br i1 %8, label %9, label %11

9:                                                ; preds = %7, %3
  %10 = tail call noundef ptr @_ZN7DNSNameC1Ev(ptr noundef nonnull align 8 dereferenceable(24) %0)
  br label %58

11:                                               ; preds = %7
  %12 = tail call noundef ptr @_ZN7DNSNameC1ERKS_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) @g_rootdnsname)
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %4) #24
  invoke void @_ZNK7DNSName12getRawLabelsEv(ptr nonnull sret(%"class.std::__1::vector") align 8 %4, ptr noundef nonnull align 8 dereferenceable(24) %1)
          to label %13 unwind label %25

13:                                               ; preds = %11
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %5) #24
  invoke void @_ZNK7DNSName12getRawLabelsEv(ptr nonnull sret(%"class.std::__1::vector") align 8 %5, ptr noundef nonnull align 8 dereferenceable(24) %2)
          to label %14 unwind label %27

14:                                               ; preds = %13
  %15 = call noundef i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4sizeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #24
  %16 = icmp eq i64 %15, 0
  br i1 %16, label %49, label %21

17:                                               ; preds = %45
  %18 = add nuw i64 %22, 1
  %19 = call noundef i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4sizeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #24
  %20 = icmp ugt i64 %19, %18
  br i1 %20, label %21, label %49, !llvm.loop !33

21:                                               ; preds = %14, %17
  %22 = phi i64 [ %18, %17 ], [ 0, %14 ]
  %23 = call noundef i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4sizeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %5) #24
  %24 = icmp ugt i64 %23, %22
  br i1 %24, label %29, label %49

25:                                               ; preds = %11
  %26 = landingpad { ptr, i32 }
          cleanup
  br label %55

27:                                               ; preds = %13
  %28 = landingpad { ptr, i32 }
          cleanup
  br label %52

29:                                               ; preds = %21
  %30 = call noundef i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4sizeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #24
  %31 = xor i64 %22, -1
  %32 = add i64 %30, %31
  %33 = invoke noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE2atEm(ptr noundef nonnull align 8 dereferenceable(24) %4, i64 noundef %32)
          to label %34 unwind label %40

34:                                               ; preds = %29
  %35 = call noundef i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4sizeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %5) #24
  %36 = add i64 %35, %31
  %37 = invoke noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE2atEm(ptr noundef nonnull align 8 dereferenceable(24) %5, i64 noundef %36)
          to label %38 unwind label %42

38:                                               ; preds = %34
  %39 = call noundef zeroext i1 @_Z12pdns_iequalsRKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES7_(ptr noundef nonnull align 8 dereferenceable(24) %33, ptr noundef nonnull align 8 dereferenceable(24) %37) #28
  br i1 %39, label %44, label %49

40:                                               ; preds = %29
  %41 = landingpad { ptr, i32 }
          cleanup
  br label %46

42:                                               ; preds = %44, %34
  %43 = landingpad { ptr, i32 }
          cleanup
  br label %46

44:                                               ; preds = %38
  invoke void @_ZN7DNSName15prependRawLabelERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %33)
          to label %45 unwind label %42

45:                                               ; preds = %44
  br i1 %39, label %17, label %49

46:                                               ; preds = %42, %40
  %47 = phi { ptr, i32 } [ %43, %42 ], [ %41, %40 ]
  %48 = call noundef ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEED1B7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %5) #24
  br label %52

49:                                               ; preds = %45, %17, %21, %38, %14
  %50 = call noundef ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEED1B7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %5) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %5) #24
  %51 = call noundef ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEED1B7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %4) #24
  br label %58

52:                                               ; preds = %46, %27
  %53 = phi { ptr, i32 } [ %47, %46 ], [ %28, %27 ]
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %5) #24
  %54 = call noundef ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEED1B7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #24
  br label %55

55:                                               ; preds = %52, %25
  %56 = phi { ptr, i32 } [ %53, %52 ], [ %26, %25 ]
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %4) #24
  %57 = call noundef ptr @_ZN7DNSNameD1Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  resume { ptr, i32 } %56

58:                                               ; preds = %49, %9
  ret void
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7DNSNameC1Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #0 align 2 {
  %2 = tail call noundef ptr @_ZN7DNSNameC2Ev(ptr noundef nonnull align 8 dereferenceable(24) %0)
  ret ptr %0
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_ZNK7DNSName12getRawLabelsEv(ptr noalias nonnull sret(%"class.std::__1::vector") align 8 %0, ptr noundef nonnull align 8 dereferenceable(24) %1) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %3 = alloca %"class.std::__1::basic_string", align 8
  %4 = tail call noundef ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEC1B7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %5 = tail call noundef i32 @_ZNK7DNSName11countLabelsEv(ptr noundef nonnull align 8 dereferenceable(24) %1)
  %6 = zext i32 %5 to i64
  invoke void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE7reserveEm(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %6)
          to label %7 unwind label %30

7:                                                ; preds = %2
  %8 = load i8, ptr %1, align 8, !tbaa !5
  %9 = and i8 %8, 1
  %10 = icmp eq i8 %9, 0
  %11 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %1, i64 0, i32 1
  %12 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %1, i64 0, i32 2
  %13 = load ptr, ptr %12, align 8
  %14 = select i1 %10, ptr %13, ptr %11
  %15 = load i8, ptr %1, align 8, !tbaa !5
  %16 = and i8 %15, 1
  %17 = icmp eq i8 %16, 0
  %18 = select i1 %17, ptr %13, ptr %11
  %19 = lshr i8 %15, 1
  %20 = zext i8 %19 to i64
  %21 = load i64, ptr %1, align 8
  %22 = lshr i64 %21, 1
  %23 = select i1 %17, i64 %22, i64 %20
  %24 = getelementptr inbounds i8, ptr %18, i64 %23
  %25 = icmp ult ptr %14, %24
  br i1 %25, label %26, label %63

26:                                               ; preds = %7, %38
  %27 = phi ptr [ %43, %38 ], [ %14, %7 ]
  %28 = load i8, ptr %27, align 1, !tbaa !5
  %29 = icmp eq i8 %28, 0
  br i1 %29, label %63, label %32

30:                                               ; preds = %2
  %31 = landingpad { ptr, i32 }
          cleanup
  br label %64

32:                                               ; preds = %26
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %3) #24
  %33 = getelementptr inbounds i8, ptr %27, i64 1
  %34 = load i8, ptr %27, align 1, !tbaa !5
  %35 = zext i8 %34 to i64
  %36 = invoke noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B7v160006EPKcm(ptr noundef nonnull align 8 dereferenceable(24) %3, ptr noundef nonnull %33, i64 noundef %35)
          to label %37 unwind label %56

37:                                               ; preds = %32
  invoke void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE9push_backB7v160006EOS6_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %3)
          to label %38 unwind label %58

38:                                               ; preds = %37
  %39 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %3) #24
  %40 = load i8, ptr %27, align 1, !tbaa !5
  %41 = zext i8 %40 to i64
  %42 = add nuw nsw i64 %41, 1
  %43 = getelementptr inbounds i8, ptr %27, i64 %42
  %44 = load i8, ptr %1, align 8, !tbaa !5
  %45 = and i8 %44, 1
  %46 = icmp eq i8 %45, 0
  %47 = load ptr, ptr %12, align 8
  %48 = select i1 %46, ptr %47, ptr %11
  %49 = lshr i8 %44, 1
  %50 = zext i8 %49 to i64
  %51 = load i64, ptr %1, align 8
  %52 = lshr i64 %51, 1
  %53 = select i1 %46, i64 %52, i64 %50
  %54 = getelementptr inbounds i8, ptr %48, i64 %53
  %55 = icmp ult ptr %43, %54
  br i1 %55, label %26, label %63, !llvm.loop !34

56:                                               ; preds = %32
  %57 = landingpad { ptr, i32 }
          cleanup
  br label %61

58:                                               ; preds = %37
  %59 = landingpad { ptr, i32 }
          cleanup
  %60 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #24
  br label %61

61:                                               ; preds = %58, %56
  %62 = phi { ptr, i32 } [ %59, %58 ], [ %57, %56 ]
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %3) #24
  br label %64

63:                                               ; preds = %38, %26, %7
  ret void

64:                                               ; preds = %61, %30
  %65 = phi { ptr, i32 } [ %62, %61 ], [ %31, %30 ]
  %66 = call noundef ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEED1B7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  resume { ptr, i32 } %65
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4sizeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::vector", ptr %0, i64 0, i32 1
  %3 = load ptr, ptr %2, align 8, !tbaa !35
  %4 = load ptr, ptr %0, align 8, !tbaa !39
  %5 = ptrtoint ptr %3 to i64
  %6 = ptrtoint ptr %4 to i64
  %7 = sub i64 %5, %6
  %8 = sdiv exact i64 %7, 24
  ret i64 %8
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE2atEm(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) local_unnamed_addr #4 align 2 {
  %3 = tail call noundef i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4sizeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %4 = icmp ugt i64 %3, %1
  br i1 %4, label %6, label %5

5:                                                ; preds = %2
  tail call void @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE20__throw_out_of_rangeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #25
  unreachable

6:                                                ; preds = %2
  %7 = load ptr, ptr %0, align 8, !tbaa !39
  %8 = getelementptr inbounds %"class.std::__1::basic_string", ptr %7, i64 %1
  ret ptr %8
}

; Function Attrs: mustprogress nofree noinline nounwind ssp willreturn memory(read) uwtable(sync)
define linkonce_odr noundef zeroext i1 @_Z12pdns_iequalsRKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES7_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) local_unnamed_addr #10 {
  %3 = tail call noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6lengthB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %4 = tail call noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6lengthB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %1) #24
  %5 = icmp eq i64 %3, %4
  br i1 %5, label %6, label %27

6:                                                ; preds = %2
  %7 = tail call noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5c_strB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %8 = tail call noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5c_strB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %1) #24
  %9 = tail call noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6lengthB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %10 = getelementptr inbounds i8, ptr %7, i64 %9
  %11 = icmp eq i64 %9, 0
  br i1 %11, label %27, label %12

12:                                               ; preds = %6, %23
  %13 = phi ptr [ %25, %23 ], [ %8, %6 ]
  %14 = phi ptr [ %24, %23 ], [ %7, %6 ]
  %15 = load i8, ptr %14, align 1, !tbaa !5
  %16 = load i8, ptr %13, align 1, !tbaa !5
  %17 = icmp eq i8 %15, %16
  br i1 %17, label %23, label %18

18:                                               ; preds = %12
  %19 = tail call noundef zeroext i8 @_Z11dns_tolowerh(i8 noundef zeroext %15)
  %20 = load i8, ptr %13, align 1, !tbaa !5
  %21 = tail call noundef zeroext i8 @_Z11dns_tolowerh(i8 noundef zeroext %20)
  %22 = icmp eq i8 %19, %21
  br i1 %22, label %23, label %27

23:                                               ; preds = %18, %12
  %24 = getelementptr inbounds i8, ptr %14, i64 1
  %25 = getelementptr inbounds i8, ptr %13, i64 1
  %26 = icmp eq ptr %24, %10
  br i1 %26, label %27, label %12, !llvm.loop !40

27:                                               ; preds = %23, %18, %6, %2
  %28 = phi i1 [ false, %2 ], [ %11, %6 ], [ false, %18 ], [ %26, %23 ]
  ret i1 %28
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_ZN7DNSName15prependRawLabelERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %3 = alloca %"class.boost::container::basic_string", align 8
  %4 = alloca %"class.boost::container::basic_string", align 8
  %5 = tail call noundef zeroext i1 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5emptyB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %1) #24
  br i1 %5, label %6, label %12

6:                                                ; preds = %2
  %7 = tail call ptr @__cxa_allocate_exception(i64 16) #24
  %8 = invoke noundef ptr @_ZNSt11range_errorC1B7v160006EPKc(ptr noundef nonnull align 8 dereferenceable(16) %7, ptr noundef nonnull @.str.33)
          to label %9 unwind label %10

9:                                                ; preds = %6
  tail call void @__cxa_throw(ptr nonnull %7, ptr nonnull @_ZTISt11range_error, ptr nonnull @_ZNSt11range_errorD1Ev) #25
  unreachable

10:                                               ; preds = %6
  %11 = landingpad { ptr, i32 }
          cleanup
  tail call void @__cxa_free_exception(ptr %7) #24
  br label %70

12:                                               ; preds = %2
  %13 = tail call noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %1) #24
  %14 = icmp ugt i64 %13, 63
  br i1 %14, label %15, label %21

15:                                               ; preds = %12
  %16 = tail call ptr @__cxa_allocate_exception(i64 16) #24
  %17 = invoke noundef ptr @_ZNSt11range_errorC1B7v160006EPKc(ptr noundef nonnull align 8 dereferenceable(16) %16, ptr noundef nonnull @.str.34)
          to label %18 unwind label %19

18:                                               ; preds = %15
  tail call void @__cxa_throw(ptr nonnull %16, ptr nonnull @_ZTISt11range_error, ptr nonnull @_ZNSt11range_errorD1Ev) #25
  unreachable

19:                                               ; preds = %15
  %20 = landingpad { ptr, i32 }
          cleanup
  tail call void @__cxa_free_exception(ptr %16) #24
  br label %70

21:                                               ; preds = %12
  %22 = load i8, ptr %0, align 8, !tbaa !5
  %23 = and i8 %22, 1
  %24 = icmp eq i8 %23, 0
  %25 = lshr i8 %22, 1
  %26 = zext i8 %25 to i64
  %27 = load i64, ptr %0, align 8
  %28 = lshr i64 %27, 1
  %29 = select i1 %24, i64 %28, i64 %26
  %30 = tail call noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %1) #24
  %31 = add i64 %29, %30
  %32 = icmp ugt i64 %31, 254
  br i1 %32, label %33, label %39

33:                                               ; preds = %21
  %34 = tail call ptr @__cxa_allocate_exception(i64 16) #24
  %35 = invoke noundef ptr @_ZNSt11range_errorC1B7v160006EPKc(ptr noundef nonnull align 8 dereferenceable(16) %34, ptr noundef nonnull @.str.35)
          to label %36 unwind label %37

36:                                               ; preds = %33
  tail call void @__cxa_throw(ptr nonnull %34, ptr nonnull @_ZTISt11range_error, ptr nonnull @_ZNSt11range_errorD1Ev) #25
  unreachable

37:                                               ; preds = %33
  %38 = landingpad { ptr, i32 }
          cleanup
  tail call void @__cxa_free_exception(ptr %34) #24
  br label %70

39:                                               ; preds = %21
  %40 = load i8, ptr %0, align 8, !tbaa !5
  %41 = and i8 %40, 1
  %42 = icmp eq i8 %41, 0
  %43 = lshr i8 %40, 1
  %44 = zext i8 %43 to i64
  %45 = load i64, ptr %0, align 8
  %46 = lshr i64 %45, 1
  %47 = select i1 %42, i64 %46, i64 %44
  %48 = icmp eq i64 %47, 0
  br i1 %48, label %49, label %51

49:                                               ; preds = %39
  %50 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6appendEmc(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef 1, i8 noundef signext 0)
  br label %51

51:                                               ; preds = %49, %39
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %3) #24
  %52 = tail call noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %1) #24
  %53 = trunc i64 %52 to i8
  %54 = call noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvEC1Emc(ptr noundef nonnull align 8 dereferenceable(24) %3, i64 noundef 1, i8 noundef signext %53)
  %55 = call noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5c_strB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %1) #24
  %56 = call noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %1) #24
  %57 = invoke noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6appendEPKcm(ptr noundef nonnull align 8 dereferenceable(24) %3, ptr noundef %55, i64 noundef %56)
          to label %58 unwind label %63

58:                                               ; preds = %51
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %4) #24
  invoke void @_ZN5boost9containerplIcNSt3__111char_traitsIcEEvEENS0_12basic_stringIT_T0_T1_EERKS9_SB_(ptr nonnull sret(%"class.boost::container::basic_string") align 8 %4, ptr noundef nonnull align 8 dereferenceable(24) %3, ptr noundef nonnull align 8 dereferenceable(24) %0)
          to label %59 unwind label %65

59:                                               ; preds = %58
  %60 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvEaSEOS5_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %4) #24
  %61 = call noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %4) #24
  %62 = call noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %3) #24
  ret void

63:                                               ; preds = %51
  %64 = landingpad { ptr, i32 }
          cleanup
  br label %67

65:                                               ; preds = %58
  %66 = landingpad { ptr, i32 }
          cleanup
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %4) #24
  br label %67

67:                                               ; preds = %65, %63
  %68 = phi { ptr, i32 } [ %66, %65 ], [ %64, %63 ]
  %69 = call noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %3) #24
  br label %70

70:                                               ; preds = %67, %37, %19, %10
  %71 = phi { ptr, i32 } [ %11, %10 ], [ %20, %19 ], [ %38, %37 ], [ %68, %67 ]
  resume { ptr, i32 } %71
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEED1B7v160006Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #2 align 2 {
  %2 = tail call noundef ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEED2B7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  ret ptr %0
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_ZNK7DNSName12labelReverseEv(ptr noalias sret(%class.DNSName) align 8 %0, ptr noundef nonnull align 8 dereferenceable(24) %1) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %3 = alloca %class.DNSName, align 8
  %4 = alloca %"class.std::__1::vector", align 8
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %3) #24
  %5 = call noundef ptr @_ZN7DNSNameC1Ev(ptr noundef nonnull align 8 dereferenceable(24) %3)
  %6 = call noundef zeroext i1 @_ZNK7DNSName6isRootEv(ptr noundef nonnull align 8 dereferenceable(24) %1)
  br i1 %6, label %7, label %11

7:                                                ; preds = %2
  %8 = invoke noundef ptr @_ZN7DNSNameC1ERKS_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1)
          to label %31 unwind label %9

9:                                                ; preds = %7
  %10 = landingpad { ptr, i32 }
          cleanup
  br label %33

11:                                               ; preds = %2
  %12 = call noundef zeroext i1 @_ZNK7DNSName5emptyEv(ptr noundef nonnull align 8 dereferenceable(24) %1)
  br i1 %12, label %29, label %13

13:                                               ; preds = %11
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %4) #24
  invoke void @_ZNK7DNSName12getRawLabelsEv(ptr nonnull sret(%"class.std::__1::vector") align 8 %4, ptr noundef nonnull align 8 dereferenceable(24) %1)
          to label %14 unwind label %20

14:                                               ; preds = %13
  %15 = call noundef zeroext i1 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE5emptyB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #24
  br i1 %15, label %25, label %16

16:                                               ; preds = %14, %18
  %17 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4backB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #24
  invoke void @_ZN7DNSName14appendRawLabelERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(ptr noundef nonnull align 8 dereferenceable(24) %3, ptr noundef nonnull align 8 dereferenceable(24) %17)
          to label %18 unwind label %22

18:                                               ; preds = %16
  call void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE8pop_backEv(ptr noundef nonnull align 8 dereferenceable(24) %4)
  %19 = call noundef zeroext i1 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE5emptyB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #24
  br i1 %19, label %25, label %16, !llvm.loop !41

20:                                               ; preds = %13
  %21 = landingpad { ptr, i32 }
          cleanup
  br label %27

22:                                               ; preds = %16
  %23 = landingpad { ptr, i32 }
          cleanup
  %24 = call noundef ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEED1B7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #24
  br label %27

25:                                               ; preds = %18, %14
  %26 = call noundef ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEED1B7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %4) #24
  br label %29

27:                                               ; preds = %22, %20
  %28 = phi { ptr, i32 } [ %23, %22 ], [ %21, %20 ]
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %4) #24
  br label %33

29:                                               ; preds = %25, %11
  %30 = call noundef ptr @_ZN7DNSNameC1EOS_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %3) #24
  br label %31

31:                                               ; preds = %7, %29
  %32 = call noundef ptr @_ZN7DNSNameD1Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %3) #24
  ret void

33:                                               ; preds = %27, %9
  %34 = phi { ptr, i32 } [ %10, %9 ], [ %28, %27 ]
  %35 = call noundef ptr @_ZN7DNSNameD1Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %3) #24
  resume { ptr, i32 } %34
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef zeroext i1 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE5emptyB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = load ptr, ptr %0, align 8, !tbaa !39
  %3 = getelementptr inbounds %"class.std::__1::vector", ptr %0, i64 0, i32 1
  %4 = load ptr, ptr %3, align 8, !tbaa !35
  %5 = icmp eq ptr %2, %4
  ret i1 %5
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_ZN7DNSName14appendRawLabelERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) local_unnamed_addr #4 align 2 {
  %3 = tail call noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5c_strB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %1) #24
  %4 = tail call noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6lengthB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %1) #24
  %5 = trunc i64 %4 to i32
  tail call void @_ZN7DNSName14appendRawLabelEPKcj(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %3, i32 noundef %5)
  ret void
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4backB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::vector", ptr %0, i64 0, i32 1
  %3 = load ptr, ptr %2, align 8, !tbaa !35
  %4 = getelementptr inbounds %"class.std::__1::basic_string", ptr %3, i64 -1
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE8pop_backEv(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::vector", ptr %0, i64 0, i32 1
  %3 = load ptr, ptr %2, align 8, !tbaa !35
  %4 = getelementptr inbounds %"class.std::__1::basic_string", ptr %3, i64 -1
  tail call void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE17__destruct_at_endB7v160006EPS6_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull %4) #24
  ret void
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7DNSNameC1EOS_(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #2 align 2 {
  %3 = tail call noundef ptr @_ZN7DNSNameC2EOS_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) #24
  ret ptr %0
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5c_strB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  ret ptr %2
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6lengthB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  ret i64 %2
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6appendEPKcm(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1, i64 noundef %2) local_unnamed_addr #4 align 2 {
  %4 = getelementptr inbounds i8, ptr %1, i64 %2
  %5 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6appendIPKcEERS5_T_SA_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1, ptr noundef %4)
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef zeroext i1 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5emptyB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %3 = icmp eq i64 %2, 0
  ret i1 %3
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvEC1Emc(ptr noundef nonnull returned align 8 dereferenceable(24) %0, i64 noundef %1, i8 noundef signext %2) unnamed_addr #0 align 2 {
  %4 = tail call noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvEC2Emc(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1, i8 noundef signext %2)
  ret ptr %0
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr void @_ZN5boost9containerplIcNSt3__111char_traitsIcEEvEENS0_12basic_stringIT_T0_T1_EERKS9_SB_(ptr noalias sret(%"class.boost::container::basic_string") align 8 %0, ptr noundef nonnull align 8 dereferenceable(24) %1, ptr noundef nonnull align 8 dereferenceable(24) %2) local_unnamed_addr #4 personality ptr @__gxx_personality_v0 {
  %4 = load i8, ptr %1, align 8, !tbaa !5
  %5 = and i8 %4, 1
  %6 = icmp eq i8 %5, 0
  %7 = lshr i8 %4, 1
  %8 = zext i8 %7 to i64
  %9 = load i64, ptr %1, align 8
  %10 = lshr i64 %9, 1
  %11 = select i1 %6, i64 %10, i64 %8
  %12 = load i8, ptr %2, align 8, !tbaa !5
  %13 = and i8 %12, 1
  %14 = icmp eq i8 %13, 0
  %15 = lshr i8 %12, 1
  %16 = zext i8 %15 to i64
  %17 = load i64, ptr %2, align 8
  %18 = lshr i64 %17, 1
  %19 = select i1 %14, i64 %18, i64 %16
  %20 = add nuw i64 %19, %11
  %21 = tail call noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvEC1ENS5_9reserve_tEmRKNS0_13new_allocatorIcEE(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %20, ptr noundef nonnull align 1 dereferenceable(1) %1)
  %22 = invoke noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6appendERKS5_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1)
          to label %23 unwind label %25

23:                                               ; preds = %3
  %24 = invoke noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6appendERKS5_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %2)
          to label %28 unwind label %25

25:                                               ; preds = %23, %3
  %26 = landingpad { ptr, i32 }
          cleanup
  %27 = tail call noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  resume { ptr, i32 } %26

28:                                               ; preds = %23
  ret void
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef zeroext i1 @_ZNK7DNSName16slowCanonCompareERKS_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %3 = alloca %"class.std::__1::vector", align 8
  %4 = alloca %"class.std::__1::vector", align 8
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %3) #24
  call void @_ZNK7DNSName12getRawLabelsEv(ptr nonnull sret(%"class.std::__1::vector") align 8 %3, ptr noundef nonnull align 8 dereferenceable(24) %0)
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %4) #24
  invoke void @_ZNK7DNSName12getRawLabelsEv(ptr nonnull sret(%"class.std::__1::vector") align 8 %4, ptr noundef nonnull align 8 dereferenceable(24) %1)
          to label %5 unwind label %14

5:                                                ; preds = %2
  %6 = call [2 x i64] @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE6rbeginB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #24
  %7 = call [2 x i64] @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4rendB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #24
  %8 = call [2 x i64] @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE6rbeginB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #24
  %9 = call [2 x i64] @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4rendB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #24
  %10 = invoke noundef zeroext i1 @_ZNSt3__123lexicographical_compareB7v160006INS_16reverse_iteratorINS_11__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEEESB_15CIStringCompareEEbT_SD_T0_SE_T1_([2 x i64] %6, [2 x i64] %7, [2 x i64] %8, [2 x i64] %9)
          to label %11 unwind label %16

11:                                               ; preds = %5
  %12 = call noundef ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEED1B7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %4) #24
  %13 = call noundef ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEED1B7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %3) #24
  ret i1 %10

14:                                               ; preds = %2
  %15 = landingpad { ptr, i32 }
          cleanup
  br label %19

16:                                               ; preds = %5
  %17 = landingpad { ptr, i32 }
          cleanup
  %18 = call noundef ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEED1B7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #24
  br label %19

19:                                               ; preds = %16, %14
  %20 = phi { ptr, i32 } [ %17, %16 ], [ %15, %14 ]
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %4) #24
  %21 = call noundef ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEED1B7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %3) #24
  resume { ptr, i32 } %20
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef zeroext i1 @_ZNSt3__123lexicographical_compareB7v160006INS_16reverse_iteratorINS_11__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEEESB_15CIStringCompareEEbT_SD_T0_SE_T1_([2 x i64] %0, [2 x i64] %1, [2 x i64] %2, [2 x i64] %3) local_unnamed_addr #4 {
  %5 = alloca %struct.CIStringCompare, align 1
  %6 = call noundef zeroext i1 @_ZNSt3__125__lexicographical_compareB7v160006IR15CIStringCompareNS_16reverse_iteratorINS_11__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEEESD_EEbT0_SE_T1_SF_T_([2 x i64] %0, [2 x i64] %1, [2 x i64] %2, [2 x i64] %3, ptr noundef nonnull align 1 dereferenceable(1) %5)
  ret i1 %6
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden [2 x i64] @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE6rbeginB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 personality ptr @__gxx_personality_v0 {
  %2 = alloca %"class.std::__1::reverse_iterator", align 8
  %3 = tail call i64 @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE3endB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %4 = invoke noundef ptr @_ZNSt3__116reverse_iteratorINS_11__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEEC1B7v160006ES9_(ptr noundef nonnull align 8 dereferenceable(16) %2, i64 %3)
          to label %5 unwind label %11

5:                                                ; preds = %1
  %6 = load i64, ptr %2, align 8
  %7 = insertvalue [2 x i64] poison, i64 %6, 0
  %8 = getelementptr inbounds [2 x i64], ptr %2, i64 0, i64 1
  %9 = load i64, ptr %8, align 8
  %10 = insertvalue [2 x i64] %7, i64 %9, 1
  ret [2 x i64] %10

11:                                               ; preds = %1
  %12 = landingpad { ptr, i32 }
          catch ptr null
  %13 = extractvalue { ptr, i32 } %12, 0
  call void @__clang_call_terminate(ptr %13) #27
  unreachable
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden [2 x i64] @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4rendB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 personality ptr @__gxx_personality_v0 {
  %2 = alloca %"class.std::__1::reverse_iterator", align 8
  %3 = tail call i64 @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE5beginB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %4 = invoke noundef ptr @_ZNSt3__116reverse_iteratorINS_11__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEEC1B7v160006ES9_(ptr noundef nonnull align 8 dereferenceable(16) %2, i64 %3)
          to label %5 unwind label %11

5:                                                ; preds = %1
  %6 = load i64, ptr %2, align 8
  %7 = insertvalue [2 x i64] poison, i64 %6, 0
  %8 = getelementptr inbounds [2 x i64], ptr %2, i64 0, i64 1
  %9 = load i64, ptr %8, align 8
  %10 = insertvalue [2 x i64] %7, i64 %9, 1
  ret [2 x i64] %10

11:                                               ; preds = %1
  %12 = landingpad { ptr, i32 }
          catch ptr null
  %13 = extractvalue { ptr, i32 } %12, 0
  call void @__clang_call_terminate(ptr %13) #27
  unreachable
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEC1B7v160006Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #2 align 2 {
  %2 = tail call noundef ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEC2B7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  ret ptr %0
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE7reserveEm(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %3 = alloca %"struct.std::__1::__split_buffer", align 8
  %4 = tail call noundef i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE8capacityB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %5 = icmp ult i64 %4, %1
  br i1 %5, label %6, label %19

6:                                                ; preds = %2
  %7 = tail call noundef i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE8max_sizeEv(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %8 = icmp ult i64 %7, %1
  br i1 %8, label %9, label %10

9:                                                ; preds = %6
  tail call void @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE20__throw_length_errorB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #25
  unreachable

10:                                               ; preds = %6
  %11 = tail call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE7__allocB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %3) #24
  %12 = tail call noundef i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4sizeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %13 = call noundef ptr @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEEC1EmmS8_(ptr noundef nonnull align 8 dereferenceable(40) %3, i64 noundef %1, i64 noundef %12, ptr noundef nonnull align 1 dereferenceable(1) %11)
  invoke void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS6_RS7_EE(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(40) %3)
          to label %14 unwind label %16

14:                                               ; preds = %10
  %15 = call noundef ptr @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEED1Ev(ptr noundef nonnull align 8 dereferenceable(40) %3) #24
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %3) #24
  br label %19

16:                                               ; preds = %10
  %17 = landingpad { ptr, i32 }
          cleanup
  %18 = call noundef ptr @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEED1Ev(ptr noundef nonnull align 8 dereferenceable(40) %3) #24
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %3) #24
  resume { ptr, i32 } %17

19:                                               ; preds = %14, %2
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind ssp willreturn memory(read, inaccessiblemem: none) uwtable(sync)
define noundef i32 @_ZNK7DNSName11countLabelsEv(ptr noundef nonnull readonly align 8 dereferenceable(24) %0) local_unnamed_addr #11 align 2 personality ptr @__gxx_personality_v0 {
  %2 = load i8, ptr %0, align 8, !tbaa !5
  %3 = and i8 %2, 1
  %4 = icmp eq i8 %3, 0
  %5 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %0, i64 0, i32 1
  %6 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 2
  %7 = load ptr, ptr %6, align 8
  %8 = select i1 %4, ptr %7, ptr %5
  %9 = lshr i8 %2, 1
  %10 = zext i8 %9 to i64
  %11 = load i64, ptr %0, align 8
  %12 = lshr i64 %11, 1
  %13 = select i1 %4, i64 %12, i64 %10
  %14 = getelementptr inbounds i8, ptr %8, i64 %13
  %15 = icmp eq i64 %13, 0
  br i1 %15, label %27, label %16

16:                                               ; preds = %1, %21
  %17 = phi i32 [ %22, %21 ], [ 0, %1 ]
  %18 = phi ptr [ %25, %21 ], [ %8, %1 ]
  %19 = load i8, ptr %18, align 1, !tbaa !5
  %20 = icmp eq i8 %19, 0
  br i1 %20, label %27, label %21

21:                                               ; preds = %16
  %22 = add i32 %17, 1
  %23 = zext i8 %19 to i64
  %24 = add nuw nsw i64 %23, 1
  %25 = getelementptr inbounds i8, ptr %18, i64 %24
  %26 = icmp ult ptr %25, %14
  br i1 %26, label %16, label %27, !llvm.loop !42

27:                                               ; preds = %16, %21, %1
  %28 = phi i32 [ 0, %1 ], [ %17, %16 ], [ %22, %21 ]
  ret i32 %28
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE9push_backB7v160006EOS6_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) local_unnamed_addr #4 align 2 {
  %3 = getelementptr inbounds %"class.std::__1::vector", ptr %0, i64 0, i32 1
  %4 = load ptr, ptr %3, align 8, !tbaa !35
  %5 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE9__end_capB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %6 = load ptr, ptr %5, align 8, !tbaa !43
  %7 = icmp ult ptr %4, %6
  br i1 %7, label %8, label %9

8:                                                ; preds = %2
  tail call void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE22__construct_one_at_endB7v160006IJS6_EEEvDpOT_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1)
  br label %10

9:                                                ; preds = %2
  tail call void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE21__push_back_slow_pathIS6_EEvOT_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1)
  br label %10

10:                                               ; preds = %9, %8
  ret void
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_ZNK7DNSName11getRawLabelEj(ptr noalias sret(%"class.std::__1::basic_string") align 8 %0, ptr noundef nonnull align 8 dereferenceable(24) %1, i32 noundef %2) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %4 = alloca %"class.std::__1::basic_string", align 8
  %5 = alloca %"class.std::__1::basic_string", align 8
  %6 = alloca %"class.std::__1::basic_string", align 8
  %7 = alloca %"class.std::__1::basic_string", align 8
  %8 = alloca %"class.std::__1::basic_string", align 8
  %9 = alloca %"class.std::__1::basic_string", align 8
  %10 = load i8, ptr %1, align 8, !tbaa !5
  %11 = and i8 %10, 1
  %12 = icmp eq i8 %11, 0
  %13 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %1, i64 0, i32 1
  %14 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %1, i64 0, i32 2
  %15 = load ptr, ptr %14, align 8
  %16 = select i1 %12, ptr %15, ptr %13
  %17 = lshr i8 %10, 1
  %18 = zext i8 %17 to i64
  %19 = load i64, ptr %1, align 8
  %20 = lshr i64 %19, 1
  %21 = select i1 %12, i64 %20, i64 %18
  %22 = getelementptr inbounds i8, ptr %16, i64 %21
  %23 = icmp eq i64 %21, 0
  br i1 %23, label %41, label %24

24:                                               ; preds = %3, %35
  %25 = phi ptr [ %38, %35 ], [ %16, %3 ]
  %26 = phi i32 [ %39, %35 ], [ 0, %3 ]
  %27 = load i8, ptr %25, align 1, !tbaa !5
  %28 = icmp eq i8 %27, 0
  br i1 %28, label %41, label %29

29:                                               ; preds = %24
  %30 = icmp eq i32 %26, %2
  br i1 %30, label %31, label %35

31:                                               ; preds = %29
  %32 = getelementptr inbounds i8, ptr %25, i64 1
  %33 = zext i8 %27 to i64
  %34 = tail call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B7v160006EPKcm(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull %32, i64 noundef %33)
  ret void

35:                                               ; preds = %29
  %36 = zext i8 %27 to i64
  %37 = add nuw nsw i64 %36, 1
  %38 = getelementptr inbounds i8, ptr %25, i64 %37
  %39 = add i32 %26, 1
  %40 = icmp ult ptr %38, %22
  br i1 %40, label %24, label %41, !llvm.loop !44

41:                                               ; preds = %24, %35, %3
  %42 = phi i32 [ 0, %3 ], [ %26, %24 ], [ %39, %35 ]
  %43 = tail call ptr @__cxa_allocate_exception(i64 16) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %4) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %5) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %6) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %7) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %8) #24
  invoke void @_ZNSt3__19to_stringEj(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %8, i32 noundef %2)
          to label %44 unwind label %52

44:                                               ; preds = %41
  invoke void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEPKS6_OS9_(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %7, ptr noundef nonnull @.str.36, ptr noundef nonnull align 8 dereferenceable(24) %8)
          to label %45 unwind label %54

45:                                               ; preds = %44
  invoke void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_PKS6_(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %6, ptr noundef nonnull align 8 dereferenceable(24) %7, ptr noundef nonnull @.str.37)
          to label %46 unwind label %56

46:                                               ; preds = %45
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %9) #24
  invoke void @_ZNSt3__19to_stringEj(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %9, i32 noundef %42)
          to label %47 unwind label %58

47:                                               ; preds = %46
  invoke void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_SA_(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %5, ptr noundef nonnull align 8 dereferenceable(24) %6, ptr noundef nonnull align 8 dereferenceable(24) %9)
          to label %48 unwind label %60

48:                                               ; preds = %47
  invoke void @_ZNSt3__1plB7v160006IcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_PKS6_(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %4, ptr noundef nonnull align 8 dereferenceable(24) %5, ptr noundef nonnull @.str.38)
          to label %49 unwind label %62

49:                                               ; preds = %48
  %50 = invoke noundef ptr @_ZNSt12out_of_rangeC1B7v160006ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(ptr noundef nonnull align 8 dereferenceable(16) %43, ptr noundef nonnull align 8 dereferenceable(24) %4)
          to label %51 unwind label %64

51:                                               ; preds = %49
  invoke void @__cxa_throw(ptr nonnull %43, ptr nonnull @_ZTISt12out_of_range, ptr nonnull @_ZNSt12out_of_rangeD1Ev) #25
          to label %93 unwind label %64

52:                                               ; preds = %41
  %53 = landingpad { ptr, i32 }
          cleanup
  br label %88

54:                                               ; preds = %44
  %55 = landingpad { ptr, i32 }
          cleanup
  br label %84

56:                                               ; preds = %45
  %57 = landingpad { ptr, i32 }
          cleanup
  br label %80

58:                                               ; preds = %46
  %59 = landingpad { ptr, i32 }
          cleanup
  br label %76

60:                                               ; preds = %47
  %61 = landingpad { ptr, i32 }
          cleanup
  br label %72

62:                                               ; preds = %48
  %63 = landingpad { ptr, i32 }
          cleanup
  br label %68

64:                                               ; preds = %51, %49
  %65 = phi i1 [ false, %51 ], [ true, %49 ]
  %66 = landingpad { ptr, i32 }
          cleanup
  %67 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #24
  br label %68

68:                                               ; preds = %64, %62
  %69 = phi { ptr, i32 } [ %66, %64 ], [ %63, %62 ]
  %70 = phi i1 [ %65, %64 ], [ true, %62 ]
  %71 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %5) #24
  br label %72

72:                                               ; preds = %68, %60
  %73 = phi { ptr, i32 } [ %69, %68 ], [ %61, %60 ]
  %74 = phi i1 [ %70, %68 ], [ true, %60 ]
  %75 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %9) #24
  br label %76

76:                                               ; preds = %72, %58
  %77 = phi { ptr, i32 } [ %73, %72 ], [ %59, %58 ]
  %78 = phi i1 [ %74, %72 ], [ true, %58 ]
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %9) #24
  %79 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %6) #24
  br label %80

80:                                               ; preds = %76, %56
  %81 = phi { ptr, i32 } [ %77, %76 ], [ %57, %56 ]
  %82 = phi i1 [ %78, %76 ], [ true, %56 ]
  %83 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %7) #24
  br label %84

84:                                               ; preds = %80, %54
  %85 = phi { ptr, i32 } [ %81, %80 ], [ %55, %54 ]
  %86 = phi i1 [ %82, %80 ], [ true, %54 ]
  %87 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %8) #24
  br label %88

88:                                               ; preds = %84, %52
  %89 = phi { ptr, i32 } [ %85, %84 ], [ %53, %52 ]
  %90 = phi i1 [ %86, %84 ], [ true, %52 ]
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %8) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %7) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %6) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %5) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %4) #24
  br i1 %90, label %91, label %92

91:                                               ; preds = %88
  call void @__cxa_free_exception(ptr %43) #24
  br label %92

92:                                               ; preds = %91, %88
  resume { ptr, i32 } %89

93:                                               ; preds = %51
  unreachable
}

declare void @_ZNSt3__19to_stringEj(ptr sret(%"class.std::__1::basic_string") align 8, i32 noundef) local_unnamed_addr #8

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt12out_of_rangeC1B7v160006ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #0 align 2 {
  %3 = tail call noundef ptr @_ZNSt12out_of_rangeC2B7v160006ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef nonnull align 8 dereferenceable(24) %1)
  ret ptr %0
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_ZNK7DNSName12getLastLabelEv(ptr noalias nonnull sret(%class.DNSName) align 8 %0, ptr noundef nonnull align 8 dereferenceable(24) %1) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %3 = tail call noundef ptr @_ZN7DNSNameC1ERKS_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1)
  invoke void @_ZN7DNSName12trimToLabelsEj(ptr noundef nonnull align 8 dereferenceable(24) %0, i32 noundef 1)
          to label %7 unwind label %4

4:                                                ; preds = %2
  %5 = landingpad { ptr, i32 }
          cleanup
  %6 = tail call noundef ptr @_ZN7DNSNameD1Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  resume { ptr, i32 } %5

7:                                                ; preds = %2
  ret void
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_ZN7DNSName12trimToLabelsEj(ptr noundef nonnull align 8 dereferenceable(24) %0, i32 noundef %1) local_unnamed_addr #4 align 2 {
  br label %3

3:                                                ; preds = %6, %2
  %4 = tail call noundef i32 @_ZNK7DNSName11countLabelsEv(ptr noundef nonnull align 8 dereferenceable(24) %0)
  %5 = icmp ugt i32 %4, %1
  br i1 %5, label %6, label %8

6:                                                ; preds = %3
  %7 = tail call noundef zeroext i1 @_ZN7DNSName7chopOffEv(ptr noundef nonnull align 8 dereferenceable(24) %0)
  br i1 %7, label %3, label %8, !llvm.loop !45

8:                                                ; preds = %3, %6
  ret void
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef zeroext i1 @_ZN7DNSName7chopOffEv(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %2 = load i8, ptr %0, align 8, !tbaa !5
  %3 = and i8 %2, 1
  %4 = icmp eq i8 %3, 0
  %5 = lshr i8 %2, 1
  %6 = zext i8 %5 to i64
  %7 = load i64, ptr %0, align 8
  %8 = lshr i64 %7, 1
  %9 = select i1 %4, i64 %8, i64 %6
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %58, label %11

11:                                               ; preds = %1
  %12 = load i8, ptr %0, align 8, !tbaa !5
  %13 = and i8 %12, 1
  %14 = icmp eq i8 %13, 0
  %15 = lshr i8 %12, 1
  %16 = zext i8 %15 to i64
  %17 = load i64, ptr %0, align 8
  %18 = lshr i64 %17, 1
  %19 = select i1 %14, i64 %18, i64 %16
  %20 = icmp eq i64 %19, 0
  br i1 %20, label %21, label %26, !prof !19

21:                                               ; preds = %11
  invoke void @__assert_rtn(ptr noundef nonnull @__func__._ZNK5boost9container12basic_stringIcNSt3__111char_traitsIcEEvEixEm, ptr noundef nonnull @.str.47, i32 noundef 1340, ptr noundef nonnull @.str.48) #26
          to label %22 unwind label %23

22:                                               ; preds = %21
  unreachable

23:                                               ; preds = %21
  %24 = landingpad { ptr, i32 }
          catch ptr null
  %25 = extractvalue { ptr, i32 } %24, 0
  tail call void @__clang_call_terminate(ptr %25) #27
  unreachable

26:                                               ; preds = %11
  %27 = load i8, ptr %0, align 8, !tbaa !5
  %28 = and i8 %27, 1
  %29 = icmp eq i8 %28, 0
  %30 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %0, i64 0, i32 1
  %31 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 2
  %32 = load ptr, ptr %31, align 8
  %33 = select i1 %29, ptr %32, ptr %30
  %34 = load i8, ptr %33, align 1, !tbaa !5
  %35 = icmp eq i8 %34, 0
  br i1 %35, label %58, label %36

36:                                               ; preds = %26
  %37 = lshr i8 %27, 1
  %38 = zext i8 %37 to i64
  %39 = load i64, ptr %0, align 8
  %40 = lshr i64 %39, 1
  %41 = select i1 %29, i64 %40, i64 %38
  %42 = icmp eq i64 %41, 0
  br i1 %42, label %43, label %48, !prof !19

43:                                               ; preds = %36
  invoke void @__assert_rtn(ptr noundef nonnull @__func__._ZNK5boost9container12basic_stringIcNSt3__111char_traitsIcEEvEixEm, ptr noundef nonnull @.str.47, i32 noundef 1340, ptr noundef nonnull @.str.48) #26
          to label %44 unwind label %45

44:                                               ; preds = %43
  unreachable

45:                                               ; preds = %43
  %46 = landingpad { ptr, i32 }
          catch ptr null
  %47 = extractvalue { ptr, i32 } %46, 0
  tail call void @__clang_call_terminate(ptr %47) #27
  unreachable

48:                                               ; preds = %36
  %49 = load i8, ptr %0, align 8, !tbaa !5
  %50 = and i8 %49, 1
  %51 = icmp eq i8 %50, 0
  %52 = select i1 %51, ptr %32, ptr %30
  %53 = load i8, ptr %52, align 1, !tbaa !5
  %54 = sext i8 %53 to i64
  %55 = add nsw i64 %54, 1
  %56 = and i64 %55, 4294967295
  %57 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE5eraseEmm(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef 0, i64 noundef %56)
  br label %58

58:                                               ; preds = %1, %26, %48
  %59 = phi i1 [ true, %48 ], [ false, %26 ], [ false, %1 ]
  ret i1 %59
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind ssp willreturn memory(read, inaccessiblemem: none) uwtable(sync)
define noundef zeroext i1 @_ZNK7DNSName10isWildcardEv(ptr nocapture noundef nonnull readonly align 8 dereferenceable(24) %0) local_unnamed_addr #11 align 2 personality ptr @__gxx_personality_v0 {
  %2 = load i8, ptr %0, align 8, !tbaa !5
  %3 = and i8 %2, 1
  %4 = icmp eq i8 %3, 0
  %5 = lshr i8 %2, 1
  %6 = zext i8 %5 to i64
  %7 = load i64, ptr %0, align 8
  %8 = lshr i64 %7, 1
  %9 = select i1 %4, i64 %8, i64 %6
  %10 = icmp ult i64 %9, 2
  br i1 %10, label %25, label %11

11:                                               ; preds = %1
  %12 = load i8, ptr %0, align 8, !tbaa !5
  %13 = and i8 %12, 1
  %14 = icmp eq i8 %13, 0
  %15 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %0, i64 0, i32 1
  %16 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 2
  %17 = load ptr, ptr %16, align 8
  %18 = select i1 %14, ptr %17, ptr %15
  %19 = load i8, ptr %18, align 1, !tbaa !5
  %20 = icmp eq i8 %19, 1
  br i1 %20, label %21, label %25

21:                                               ; preds = %11
  %22 = getelementptr inbounds i8, ptr %18, i64 1
  %23 = load i8, ptr %22, align 1, !tbaa !5
  %24 = icmp eq i8 %23, 42
  br label %25

25:                                               ; preds = %11, %21, %1
  %26 = phi i1 [ false, %1 ], [ false, %11 ], [ %24, %21 ]
  ret i1 %26
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef zeroext i1 @_ZNK7DNSName10isHostnameEv(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %2 = alloca %"class.std::__1::basic_string", align 8
  %3 = alloca %"class.std::__1::basic_string", align 8
  %4 = alloca %"class.std::__1::basic_string", align 8
  %5 = load atomic i8, ptr @_ZGVZNK7DNSName10isHostnameEvE13hostNameRegex acquire, align 8
  %6 = and i8 %5, 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %8, label %18, !prof !46

8:                                                ; preds = %1
  %9 = tail call i32 @__cxa_guard_acquire(ptr nonnull @_ZGVZNK7DNSName10isHostnameEvE13hostNameRegex) #24
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %18, label %11

11:                                               ; preds = %8
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %2) #24
  %12 = invoke noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B7v160006IDnEEPKc(ptr noundef nonnull align 8 dereferenceable(24) %2, ptr noundef nonnull @.str.39)
          to label %13 unwind label %25

13:                                               ; preds = %11
  %14 = invoke noundef ptr @_ZN5RegexC1ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(ptr noundef nonnull align 8 dereferenceable(32) @_ZZNK7DNSName10isHostnameEvE13hostNameRegex, ptr noundef nonnull align 8 dereferenceable(24) %2)
          to label %15 unwind label %27

15:                                               ; preds = %13
  %16 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %2) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %2) #24
  %17 = call i32 @__cxa_atexit(ptr nonnull @_ZN5RegexD1Ev, ptr nonnull @_ZZNK7DNSName10isHostnameEvE13hostNameRegex, ptr nonnull @__dso_handle) #24
  call void @__cxa_guard_release(ptr nonnull @_ZGVZNK7DNSName10isHostnameEvE13hostNameRegex) #24
  br label %18

18:                                               ; preds = %15, %8, %1
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %3) #24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %4) #24
  %19 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B7v160006IDnEEPKc(ptr noundef nonnull align 8 dereferenceable(24) %4, ptr noundef nonnull @.str)
  invoke void @_ZNK7DNSName8toStringERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEb(ptr nonnull sret(%"class.std::__1::basic_string") align 8 %3, ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %4, i1 noundef zeroext true)
          to label %20 unwind label %32

20:                                               ; preds = %18
  %21 = invoke noundef zeroext i1 @_ZNK5Regex5matchERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(ptr noundef nonnull align 8 dereferenceable(32) @_ZZNK7DNSName10isHostnameEvE13hostNameRegex, ptr noundef nonnull align 8 dereferenceable(24) %3)
          to label %22 unwind label %34

22:                                               ; preds = %20
  %23 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #24
  %24 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %4) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %3) #24
  ret i1 %21

25:                                               ; preds = %11
  %26 = landingpad { ptr, i32 }
          cleanup
  br label %30

27:                                               ; preds = %13
  %28 = landingpad { ptr, i32 }
          cleanup
  %29 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %2) #24
  br label %30

30:                                               ; preds = %27, %25
  %31 = phi { ptr, i32 } [ %28, %27 ], [ %26, %25 ]
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %2) #24
  call void @__cxa_guard_abort(ptr nonnull @_ZGVZNK7DNSName10isHostnameEvE13hostNameRegex) #24
  br label %40

32:                                               ; preds = %18
  %33 = landingpad { ptr, i32 }
          cleanup
  br label %37

34:                                               ; preds = %20
  %35 = landingpad { ptr, i32 }
          cleanup
  %36 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #24
  br label %37

37:                                               ; preds = %34, %32
  %38 = phi { ptr, i32 } [ %35, %34 ], [ %33, %32 ]
  %39 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %4) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %3) #24
  br label %40

40:                                               ; preds = %37, %30
  %41 = phi { ptr, i32 } [ %38, %37 ], [ %31, %30 ]
  resume { ptr, i32 } %41
}

; Function Attrs: nofree nounwind
declare i32 @__cxa_guard_acquire(ptr) local_unnamed_addr #3

declare noundef ptr @_ZN5RegexC1ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(ptr noundef nonnull returned align 8 dereferenceable(32), ptr noundef nonnull align 8 dereferenceable(24)) unnamed_addr #8

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5RegexD1Ev(ptr noundef nonnull returned align 8 dereferenceable(32) %0) unnamed_addr #2 align 2 {
  %2 = tail call noundef ptr @_ZN5RegexD2Ev(ptr noundef nonnull align 8 dereferenceable(32) %0) #24
  ret ptr %0
}

; Function Attrs: nofree nounwind
declare void @__cxa_guard_abort(ptr) local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare void @__cxa_guard_release(ptr) local_unnamed_addr #3

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr noundef zeroext i1 @_ZNK5Regex5matchERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(ptr noundef nonnull align 8 dereferenceable(32) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) local_unnamed_addr #4 align 2 {
  %3 = tail call noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5c_strB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %1) #24
  %4 = tail call i32 @regexec(ptr noundef nonnull %0, ptr noundef %3, i64 noundef 0, ptr noundef null, i32 noundef 0)
  %5 = icmp eq i32 %4, 0
  ret i1 %5
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef i64 @_Z10hash_valueRK7DNSName(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #4 {
  %2 = tail call noundef i64 @_ZNK7DNSName4hashEm(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef 0)
  ret i64 %2
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr noundef i64 @_ZNK7DNSName4hashEm(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %3 = load i8, ptr %0, align 8, !tbaa !5
  %4 = and i8 %3, 1
  %5 = icmp eq i8 %4, 0
  %6 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %0, i64 0, i32 1
  %7 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 2
  %8 = load ptr, ptr %7, align 8
  %9 = select i1 %5, ptr %8, ptr %6
  %10 = lshr i8 %3, 1
  %11 = zext i8 %10 to i64
  %12 = load i64, ptr %0, align 8
  %13 = lshr i64 %12, 1
  %14 = select i1 %5, i64 %13, i64 %11
  %15 = trunc i64 %14 to i32
  %16 = trunc i64 %1 to i32
  %17 = tail call noundef i32 @_Z8burtleCIPKhjj(ptr noundef %9, i32 noundef %15, i32 noundef %16)
  %18 = zext i32 %17 to i64
  ret i64 %18
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEpLB7v160006EPKc(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1) local_unnamed_addr #4 align 2 {
  %3 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKc(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1)
  ret ptr %3
}

declare noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEmc(ptr noundef nonnull align 8 dereferenceable(24), i64 noundef, i8 noundef signext) local_unnamed_addr #8

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #12

; Function Attrs: nofree nounwind
declare noundef i32 @snprintf(ptr noalias nocapture noundef writeonly, i64 noundef, ptr nocapture noundef readonly, ...) local_unnamed_addr #13

declare noundef ptr @_ZNSt13runtime_errorC1ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(ptr noundef nonnull returned align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(24)) unnamed_addr #8

; Function Attrs: nounwind
declare noundef ptr @_ZNSt13runtime_errorD1Ev(ptr noundef nonnull returned align 8 dereferenceable(16)) unnamed_addr #6

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define noundef zeroext i1 @_ZNK7DNSName12has8bitBytesEv(ptr nocapture noundef nonnull readonly align 8 dereferenceable(24) %0) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %2 = load i8, ptr %0, align 8, !tbaa !5
  %3 = and i8 %2, 1
  %4 = icmp eq i8 %3, 0
  %5 = lshr i8 %2, 1
  %6 = zext i8 %5 to i64
  %7 = load i64, ptr %0, align 8
  %8 = lshr i64 %7, 1
  %9 = select i1 %4, i64 %8, i64 %6
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %1
  tail call void @_ZN5boost9container18throw_out_of_rangeEPKc(ptr noundef nonnull @.str.60) #25
  unreachable

12:                                               ; preds = %1
  %13 = load i8, ptr %0, align 8, !tbaa !5
  %14 = and i8 %13, 1
  %15 = icmp eq i8 %14, 0
  %16 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %0, i64 0, i32 1
  %17 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 2
  %18 = load ptr, ptr %17, align 8
  %19 = select i1 %15, ptr %18, ptr %16
  %20 = load i8, ptr %19, align 1, !tbaa !5
  %21 = icmp ne i8 %20, 0
  br i1 %21, label %22, label %82

22:                                               ; preds = %12
  %23 = lshr i8 %13, 1
  %24 = zext i8 %23 to i64
  %25 = load i64, ptr %0, align 8
  %26 = lshr i64 %25, 1
  %27 = select i1 %15, i64 %26, i64 %24
  %28 = load i8, ptr %0, align 8
  %29 = and i8 %28, 1
  %30 = icmp eq i8 %29, 0
  %31 = select i1 %30, ptr %18, ptr %16
  %32 = lshr i8 %13, 1
  %33 = zext i8 %32 to i64
  %34 = load i64, ptr %0, align 8
  %35 = lshr i64 %34, 1
  %36 = select i1 %15, i64 %35, i64 %33
  %37 = load i8, ptr %0, align 8
  %38 = and i8 %37, 1
  %39 = icmp eq i8 %38, 0
  %40 = select i1 %39, ptr %18, ptr %16
  br label %41

41:                                               ; preds = %22, %78
  %42 = phi i1 [ %21, %22 ], [ %81, %78 ]
  %43 = phi i8 [ %20, %22 ], [ %80, %78 ]
  %44 = phi i64 [ 0, %22 ], [ %75, %78 ]
  %45 = zext i8 %43 to i64
  %46 = add i64 %44, -1
  %47 = tail call i64 @llvm.umax.i64(i64 %45, i64 1)
  %48 = add i64 %46, %47
  br label %49

49:                                               ; preds = %41, %67
  %50 = phi i1 [ true, %41 ], [ %69, %67 ]
  %51 = phi i64 [ 0, %41 ], [ %68, %67 ]
  %52 = phi i64 [ %44, %41 ], [ %53, %67 ]
  %53 = add i64 %52, 1
  %54 = icmp ugt i64 %27, %53
  br i1 %54, label %56, label %55

55:                                               ; preds = %49
  tail call void @_ZN5boost9container18throw_out_of_rangeEPKc(ptr noundef nonnull @.str.60) #25
  unreachable

56:                                               ; preds = %49
  %57 = getelementptr inbounds i8, ptr %31, i64 %53
  %58 = load i8, ptr %57, align 1, !tbaa !5
  %59 = freeze i8 %58
  %60 = and i8 %59, -33
  %61 = add i8 %60, -65
  %62 = icmp ult i8 %61, 26
  %63 = add i8 %59, -48
  %64 = icmp ult i8 %63, 10
  %65 = or i1 %64, %62
  br i1 %65, label %67, label %66

66:                                               ; preds = %56
  switch i8 %59, label %71 [
    i8 95, label %67
    i8 92, label %67
    i8 64, label %67
    i8 58, label %67
    i8 47, label %67
    i8 46, label %67
    i8 45, label %67
    i8 42, label %67
    i8 32, label %67
  ]

67:                                               ; preds = %66, %66, %66, %66, %66, %66, %66, %66, %66, %56
  %68 = add nuw nsw i64 %51, 1
  %69 = icmp ult i64 %68, %45
  %70 = icmp eq i64 %68, %47
  br i1 %70, label %71, label %49, !llvm.loop !47

71:                                               ; preds = %66, %67
  %72 = phi i64 [ %52, %66 ], [ %48, %67 ]
  %73 = phi i1 [ %50, %66 ], [ %69, %67 ]
  br i1 %73, label %82, label %74

74:                                               ; preds = %71
  %75 = add i64 %72, 2
  %76 = icmp ugt i64 %36, %75
  br i1 %76, label %78, label %77

77:                                               ; preds = %74
  tail call void @_ZN5boost9container18throw_out_of_rangeEPKc(ptr noundef nonnull @.str.60) #25
  unreachable

78:                                               ; preds = %74
  %79 = getelementptr inbounds i8, ptr %40, i64 %75
  %80 = load i8, ptr %79, align 1, !tbaa !5
  %81 = icmp ne i8 %80, 0
  br i1 %81, label %41, label %82, !llvm.loop !48

82:                                               ; preds = %71, %78, %12
  %83 = phi i1 [ %21, %12 ], [ %42, %71 ], [ %81, %78 ]
  ret i1 %83
}

; Function Attrs: noinline ssp uwtable(sync)
define noundef nonnull ptr @_ZN7DNSName16RawLabelsVisitorC2ERKN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvEE(ptr noundef nonnull returned align 8 dereferenceable(144) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #0 align 2 personality ptr @__gxx_personality_v0 {
  %3 = getelementptr inbounds %"class.DNSName::RawLabelsVisitor", ptr %0, i64 0, i32 1
  store ptr %1, ptr %3, align 8, !tbaa !43
  %4 = getelementptr inbounds %"class.DNSName::RawLabelsVisitor", ptr %0, i64 0, i32 2
  store i64 0, ptr %4, align 8, !tbaa !49
  %5 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %1, i64 0, i32 1
  %6 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %1, i64 0, i32 2
  br label %7

7:                                                ; preds = %47, %2
  %8 = phi i64 [ 0, %2 ], [ %48, %47 ]
  %9 = load i8, ptr %1, align 8, !tbaa !5
  %10 = and i8 %9, 1
  %11 = icmp eq i8 %10, 0
  %12 = lshr i8 %9, 1
  %13 = zext i8 %12 to i64
  %14 = load i64, ptr %1, align 8
  %15 = lshr i64 %14, 1
  %16 = select i1 %11, i64 %15, i64 %13
  %17 = icmp ult i64 %8, %16
  br i1 %17, label %18, label %49

18:                                               ; preds = %7
  %19 = load i8, ptr %1, align 8, !tbaa !5
  %20 = and i8 %19, 1
  %21 = icmp eq i8 %20, 0
  %22 = lshr i8 %19, 1
  %23 = zext i8 %22 to i64
  %24 = load i64, ptr %1, align 8
  %25 = lshr i64 %24, 1
  %26 = select i1 %21, i64 %25, i64 %23
  %27 = icmp ugt i64 %26, %8
  br i1 %27, label %29, label %28

28:                                               ; preds = %18
  tail call void @_ZN5boost9container18throw_out_of_rangeEPKc(ptr noundef nonnull @.str.60) #25
  unreachable

29:                                               ; preds = %18
  %30 = load i8, ptr %1, align 8, !tbaa !5
  %31 = and i8 %30, 1
  %32 = icmp eq i8 %31, 0
  %33 = load ptr, ptr %6, align 8
  %34 = select i1 %32, ptr %33, ptr %5
  %35 = getelementptr inbounds i8, ptr %34, i64 %8
  %36 = load i8, ptr %35, align 1, !tbaa !5
  %37 = icmp eq i8 %36, 0
  br i1 %37, label %47, label %38

38:                                               ; preds = %29
  %39 = zext i8 %36 to i64
  %40 = trunc i64 %8 to i8
  %41 = load i64, ptr %4, align 8, !tbaa !49
  %42 = tail call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__15arrayIhLm128EE2atEm(ptr noundef nonnull align 1 dereferenceable(128) %0, i64 noundef %41)
  store i8 %40, ptr %42, align 1, !tbaa !5
  %43 = load i64, ptr %4, align 8, !tbaa !49
  %44 = add i64 %43, 1
  store i64 %44, ptr %4, align 8, !tbaa !49
  %45 = add nuw nsw i64 %8, 1
  %46 = add i64 %45, %39
  br label %47

47:                                               ; preds = %29, %38
  %48 = phi i64 [ %46, %38 ], [ %8, %29 ]
  br i1 %37, label %49, label %7

49:                                               ; preds = %47, %7
  ret ptr %0
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__15arrayIhLm128EE2atEm(ptr noundef nonnull align 1 dereferenceable(128) %0, i64 noundef %1) local_unnamed_addr #4 align 2 {
  %3 = icmp ugt i64 %1, 127
  br i1 %3, label %4, label %5

4:                                                ; preds = %2
  tail call void @_ZNSt3__120__throw_out_of_rangeB7v160006EPKc(ptr noundef nonnull @.str.54) #25
  unreachable

5:                                                ; preds = %2
  %6 = getelementptr inbounds [128 x i8], ptr %0, i64 0, i64 %1
  ret ptr %6
}

; Function Attrs: noinline ssp uwtable(sync)
define noundef nonnull ptr @_ZN7DNSName16RawLabelsVisitorC1ERKN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvEE(ptr noundef nonnull returned align 8 dereferenceable(144) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #0 align 2 {
  %3 = tail call noundef ptr @_ZN7DNSName16RawLabelsVisitorC2ERKN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvEE(ptr noundef nonnull align 8 dereferenceable(144) %0, ptr noundef nonnull align 8 dereferenceable(24) %1)
  ret ptr %0
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define void @_ZNK7DNSName19getRawLabelsVisitorEv(ptr noalias sret(%"class.DNSName::RawLabelsVisitor") align 8 %0, ptr noundef nonnull align 8 dereferenceable(24) %1) local_unnamed_addr #4 align 2 {
  %3 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZNK7DNSName10getStorageEv(ptr noundef nonnull align 8 dereferenceable(24) %1)
  %4 = tail call noundef ptr @_ZN7DNSName16RawLabelsVisitorC1ERKN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvEE(ptr noundef nonnull align 8 dereferenceable(144) %0, ptr noundef nonnull align 8 dereferenceable(24) %3)
  ret void
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(24) ptr @_ZNK7DNSName10getStorageEv(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  ret ptr %0
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define [2 x i64] @_ZNK7DNSName16RawLabelsVisitor5frontEv(ptr nocapture noundef nonnull readonly align 8 dereferenceable(144) %0) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %2 = alloca %"class.std::__1::basic_string_view", align 8
  %3 = getelementptr inbounds %"class.DNSName::RawLabelsVisitor", ptr %0, i64 0, i32 2
  %4 = load i64, ptr %3, align 8, !tbaa !49
  %5 = icmp eq i64 %4, 0
  br i1 %5, label %6, label %12

6:                                                ; preds = %1
  %7 = tail call ptr @__cxa_allocate_exception(i64 16) #24
  %8 = invoke noundef ptr @_ZNSt12out_of_rangeC1B7v160006EPKc(ptr noundef nonnull align 8 dereferenceable(16) %7, ptr noundef nonnull @.str.45)
          to label %9 unwind label %10

9:                                                ; preds = %6
  tail call void @__cxa_throw(ptr nonnull %7, ptr nonnull @_ZTISt12out_of_range, ptr nonnull @_ZNSt12out_of_rangeD1Ev) #25
  unreachable

10:                                               ; preds = %6
  %11 = landingpad { ptr, i32 }
          cleanup
  tail call void @__cxa_free_exception(ptr %7) #24
  resume { ptr, i32 } %11

12:                                               ; preds = %1
  %13 = getelementptr inbounds %"class.DNSName::RawLabelsVisitor", ptr %0, i64 0, i32 1
  %14 = load ptr, ptr %13, align 8, !tbaa !52
  %15 = load i8, ptr %14, align 8, !tbaa !5
  %16 = and i8 %15, 1
  %17 = icmp eq i8 %16, 0
  %18 = lshr i8 %15, 1
  %19 = zext i8 %18 to i64
  %20 = load i64, ptr %14, align 8
  %21 = lshr i64 %20, 1
  %22 = select i1 %17, i64 %21, i64 %19
  %23 = icmp eq i64 %22, 0
  br i1 %23, label %24, label %25

24:                                               ; preds = %12
  tail call void @_ZN5boost9container18throw_out_of_rangeEPKc(ptr noundef nonnull @.str.60) #25
  unreachable

25:                                               ; preds = %12
  %26 = load i8, ptr %14, align 8, !tbaa !5
  %27 = and i8 %26, 1
  %28 = icmp eq i8 %27, 0
  %29 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %14, i64 0, i32 1
  %30 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %14, i64 0, i32 2
  %31 = load ptr, ptr %30, align 8
  %32 = select i1 %28, ptr %31, ptr %29
  %33 = load i8, ptr %32, align 1, !tbaa !5
  %34 = icmp eq i8 %33, 0
  br i1 %34, label %35, label %37

35:                                               ; preds = %25
  %36 = call noundef ptr @_ZNSt3__117basic_string_viewIcNS_11char_traitsIcEEEC1B7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %2) #24
  br label %53

37:                                               ; preds = %25
  %38 = lshr i8 %26, 1
  %39 = zext i8 %38 to i64
  %40 = load i64, ptr %14, align 8
  %41 = lshr i64 %40, 1
  %42 = select i1 %28, i64 %41, i64 %39
  %43 = icmp ugt i64 %42, 1
  br i1 %43, label %45, label %44

44:                                               ; preds = %37
  tail call void @_ZN5boost9container18throw_out_of_rangeEPKc(ptr noundef nonnull @.str.60) #25
  unreachable

45:                                               ; preds = %37
  %46 = load i8, ptr %14, align 8, !tbaa !5
  %47 = and i8 %46, 1
  %48 = icmp eq i8 %47, 0
  %49 = select i1 %48, ptr %31, ptr %29
  %50 = getelementptr inbounds i8, ptr %49, i64 1
  %51 = zext i8 %33 to i64
  %52 = call noundef ptr @_ZNSt3__117basic_string_viewIcNS_11char_traitsIcEEEC1B7v160006EPKcm(ptr noundef nonnull align 8 dereferenceable(16) %2, ptr noundef nonnull %50, i64 noundef %51) #24
  br label %53

53:                                               ; preds = %45, %35
  %54 = load i64, ptr %2, align 8
  %55 = insertvalue [2 x i64] poison, i64 %54, 0
  %56 = getelementptr inbounds [2 x i64], ptr %2, i64 0, i64 1
  %57 = load i64, ptr %56, align 8
  %58 = insertvalue [2 x i64] %55, i64 %57, 1
  ret [2 x i64] %58
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__117basic_string_viewIcNS_11char_traitsIcEEEC1B7v160006Ev(ptr noundef nonnull returned align 8 dereferenceable(16) %0) unnamed_addr #2 align 2 {
  %2 = tail call noundef ptr @_ZNSt3__117basic_string_viewIcNS_11char_traitsIcEEEC2B7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) #24
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__117basic_string_viewIcNS_11char_traitsIcEEEC1B7v160006EPKcm(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1, i64 noundef %2) unnamed_addr #2 align 2 {
  %4 = tail call noundef ptr @_ZNSt3__117basic_string_viewIcNS_11char_traitsIcEEEC2B7v160006EPKcm(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef %1, i64 noundef %2) #24
  ret ptr %0
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define [2 x i64] @_ZNK7DNSName16RawLabelsVisitor4backEv(ptr noundef nonnull align 8 dereferenceable(144) %0) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %2 = alloca %"class.std::__1::basic_string_view", align 8
  %3 = getelementptr inbounds %"class.DNSName::RawLabelsVisitor", ptr %0, i64 0, i32 2
  %4 = load i64, ptr %3, align 8, !tbaa !49
  %5 = icmp eq i64 %4, 0
  br i1 %5, label %6, label %12

6:                                                ; preds = %1
  %7 = tail call ptr @__cxa_allocate_exception(i64 16) #24
  %8 = invoke noundef ptr @_ZNSt12out_of_rangeC1B7v160006EPKc(ptr noundef nonnull align 8 dereferenceable(16) %7, ptr noundef nonnull @.str.46)
          to label %9 unwind label %10

9:                                                ; preds = %6
  tail call void @__cxa_throw(ptr nonnull %7, ptr nonnull @_ZTISt12out_of_range, ptr nonnull @_ZNSt12out_of_rangeD1Ev) #25
  unreachable

10:                                               ; preds = %6
  %11 = landingpad { ptr, i32 }
          cleanup
  tail call void @__cxa_free_exception(ptr %7) #24
  resume { ptr, i32 } %11

12:                                               ; preds = %1
  %13 = add i64 %4, -1
  %14 = tail call noundef nonnull align 1 dereferenceable(1) ptr @_ZNKSt3__15arrayIhLm128EE2atEm(ptr noundef nonnull align 1 dereferenceable(128) %0, i64 noundef %13)
  %15 = load i8, ptr %14, align 1, !tbaa !5
  %16 = zext i8 %15 to i64
  %17 = getelementptr inbounds %"class.DNSName::RawLabelsVisitor", ptr %0, i64 0, i32 1
  %18 = load ptr, ptr %17, align 8, !tbaa !52
  %19 = load i8, ptr %18, align 8, !tbaa !5
  %20 = and i8 %19, 1
  %21 = icmp eq i8 %20, 0
  %22 = lshr i8 %19, 1
  %23 = zext i8 %22 to i64
  %24 = load i64, ptr %18, align 8
  %25 = lshr i64 %24, 1
  %26 = select i1 %21, i64 %25, i64 %23
  %27 = icmp ugt i64 %26, %16
  br i1 %27, label %29, label %28

28:                                               ; preds = %12
  tail call void @_ZN5boost9container18throw_out_of_rangeEPKc(ptr noundef nonnull @.str.60) #25
  unreachable

29:                                               ; preds = %12
  %30 = load i8, ptr %18, align 8, !tbaa !5
  %31 = and i8 %30, 1
  %32 = icmp eq i8 %31, 0
  %33 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %18, i64 0, i32 1
  %34 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %18, i64 0, i32 2
  %35 = load ptr, ptr %34, align 8
  %36 = select i1 %32, ptr %35, ptr %33
  %37 = getelementptr inbounds i8, ptr %36, i64 %16
  %38 = load i8, ptr %37, align 1, !tbaa !5
  %39 = icmp eq i8 %38, 0
  br i1 %39, label %40, label %42

40:                                               ; preds = %29
  %41 = call noundef ptr @_ZNSt3__117basic_string_viewIcNS_11char_traitsIcEEEC1B7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %2) #24
  br label %59

42:                                               ; preds = %29
  %43 = add nuw nsw i64 %16, 1
  %44 = lshr i8 %30, 1
  %45 = zext i8 %44 to i64
  %46 = load i64, ptr %18, align 8
  %47 = lshr i64 %46, 1
  %48 = select i1 %32, i64 %47, i64 %45
  %49 = icmp ugt i64 %48, %43
  br i1 %49, label %51, label %50

50:                                               ; preds = %42
  tail call void @_ZN5boost9container18throw_out_of_rangeEPKc(ptr noundef nonnull @.str.60) #25
  unreachable

51:                                               ; preds = %42
  %52 = load i8, ptr %18, align 8, !tbaa !5
  %53 = and i8 %52, 1
  %54 = icmp eq i8 %53, 0
  %55 = select i1 %54, ptr %35, ptr %33
  %56 = getelementptr inbounds i8, ptr %55, i64 %43
  %57 = zext i8 %38 to i64
  %58 = call noundef ptr @_ZNSt3__117basic_string_viewIcNS_11char_traitsIcEEEC1B7v160006EPKcm(ptr noundef nonnull align 8 dereferenceable(16) %2, ptr noundef nonnull %56, i64 noundef %57) #24
  br label %59

59:                                               ; preds = %51, %40
  %60 = load i64, ptr %2, align 8
  %61 = insertvalue [2 x i64] poison, i64 %60, 0
  %62 = getelementptr inbounds [2 x i64], ptr %2, i64 0, i64 1
  %63 = load i64, ptr %62, align 8
  %64 = insertvalue [2 x i64] %61, i64 %63, 1
  ret [2 x i64] %64
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr noundef nonnull align 1 dereferenceable(1) ptr @_ZNKSt3__15arrayIhLm128EE2atEm(ptr noundef nonnull align 1 dereferenceable(128) %0, i64 noundef %1) local_unnamed_addr #4 align 2 {
  %3 = icmp ugt i64 %1, 127
  br i1 %3, label %4, label %5

4:                                                ; preds = %2
  tail call void @_ZNSt3__120__throw_out_of_rangeB7v160006EPKc(ptr noundef nonnull @.str.54) #25
  unreachable

5:                                                ; preds = %2
  %6 = getelementptr inbounds [128 x i8], ptr %0, i64 0, i64 %1
  ret ptr %6
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind ssp willreturn memory(argmem: readwrite) uwtable(sync)
define noundef zeroext i1 @_ZN7DNSName16RawLabelsVisitor8pop_backEv(ptr nocapture noundef nonnull align 8 dereferenceable(144) %0) local_unnamed_addr #14 align 2 {
  %2 = getelementptr inbounds %"class.DNSName::RawLabelsVisitor", ptr %0, i64 0, i32 2
  %3 = load i64, ptr %2, align 8, !tbaa !49
  %4 = icmp ne i64 %3, 0
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = add i64 %3, -1
  store i64 %6, ptr %2, align 8, !tbaa !49
  br label %7

7:                                                ; preds = %1, %5
  ret i1 %4
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind ssp willreturn memory(argmem: read) uwtable(sync)
define noundef zeroext i1 @_ZNK7DNSName16RawLabelsVisitor5emptyEv(ptr nocapture noundef nonnull readonly align 8 dereferenceable(144) %0) local_unnamed_addr #9 align 2 {
  %2 = getelementptr inbounds %"class.DNSName::RawLabelsVisitor", ptr %0, i64 0, i32 2
  %3 = load i64, ptr %2, align 8, !tbaa !49
  %4 = icmp eq i64 %3, 0
  ret i1 %4
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost11optional_ns15in_place_init_tC2ENS1_8init_tagE(ptr noundef nonnull returned align 1 dereferenceable(1) %0) unnamed_addr #2 align 2 {
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost11optional_ns18in_place_init_if_tC2ENS1_8init_tagE(ptr noundef nonnull returned align 1 dereferenceable(1) %0) unnamed_addr #2 align 2 {
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__117basic_string_viewIcNS_11char_traitsIcEEEC2B7v160006EPKc(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #2 align 2 {
  store ptr %1, ptr %0, align 8, !tbaa !14
  %3 = getelementptr inbounds %"class.std::__1::basic_string_view", ptr %0, i64 0, i32 1
  %4 = tail call noundef i64 @_ZNSt3__128__char_traits_length_checkedB7v160006INS_11char_traitsIcEEEEmPKNT_9char_typeE(ptr noundef %1) #24
  store i64 %4, ptr %3, align 8, !tbaa !18
  ret ptr %0
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNSt3__128__char_traits_length_checkedB7v160006INS_11char_traitsIcEEEEmPKNT_9char_typeE(ptr noundef %0) local_unnamed_addr #7 {
  %2 = icmp ne ptr %0, null
  tail call void @llvm.assume(i1 %2)
  %3 = tail call noundef i64 @_ZNSt3__111char_traitsIcE6lengthEPKc(ptr noundef nonnull %0) #24
  ret i64 %3
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #15

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i64 @_ZNSt3__111char_traitsIcE6lengthEPKc(ptr noundef %0) local_unnamed_addr #7 align 2 personality ptr @__gxx_personality_v0 {
  %2 = tail call noundef i64 @_ZNSt3__118__constexpr_strlenB7v160006EPKc(ptr noundef %0)
  ret i64 %2
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNSt3__118__constexpr_strlenB7v160006EPKc(ptr noundef %0) local_unnamed_addr #7 {
  %2 = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %0) #24
  ret i64 %2
}

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(ptr noundef %0) local_unnamed_addr #16 {
  %2 = tail call ptr @__cxa_begin_catch(ptr %0) #24
  tail call void @_ZSt9terminatev() #27
  unreachable
}

declare ptr @__cxa_begin_catch(ptr) local_unnamed_addr

declare void @_ZSt9terminatev() local_unnamed_addr

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare i64 @strlen(ptr nocapture noundef) local_unnamed_addr #17

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7DNSNameD2Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #2 align 2 {
  %2 = tail call noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  ret ptr %0
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt11range_errorC2B7v160006ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #0 align 2 {
  %3 = tail call noundef ptr @_ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef nonnull align 8 dereferenceable(24) %1)
  store ptr getelementptr inbounds ({ [5 x ptr] }, ptr @_ZTVSt11range_error, i64 0, inrange i32 0, i64 2), ptr %0, align 8, !tbaa !53
  ret ptr %0
}

declare noundef ptr @_ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(ptr noundef nonnull returned align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(24)) unnamed_addr #8

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare ptr @memchr(ptr noundef, i32 noundef, i64 noundef) local_unnamed_addr #17

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt11range_errorC2B7v160006EPKc(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #0 align 2 {
  %3 = tail call noundef ptr @_ZNSt13runtime_errorC2EPKc(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef %1)
  store ptr getelementptr inbounds ({ [5 x ptr] }, ptr @_ZTVSt11range_error, i64 0, inrange i32 0, i64 2), ptr %0, align 8, !tbaa !53
  ret ptr %0
}

declare noundef ptr @_ZNSt13runtime_errorC2EPKc(ptr noundef nonnull returned align 8 dereferenceable(16), ptr noundef) unnamed_addr #8

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt12out_of_rangeC2B7v160006EPKc(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #0 align 2 {
  %3 = tail call noundef ptr @_ZNSt11logic_errorC2EPKc(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef %1)
  store ptr getelementptr inbounds ({ [5 x ptr] }, ptr @_ZTVSt12out_of_range, i64 0, inrange i32 0, i64 2), ptr %0, align 8, !tbaa !53
  ret ptr %0
}

declare noundef ptr @_ZNSt11logic_errorC2EPKc(ptr noundef nonnull returned align 8 dereferenceable(16), ptr noundef) unnamed_addr #8

; Function Attrs: cold noreturn
declare void @__assert_rtn(ptr noundef, ptr noundef, i32 noundef, ptr noundef) local_unnamed_addr #18

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEixB7v160006Em(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) local_unnamed_addr #7 align 2 {
  %3 = tail call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %4 = getelementptr inbounds i8, ptr %3, i64 %1
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef zeroext i1 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  br i1 %2, label %3, label %5

3:                                                ; preds = %1
  %4 = tail call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  br label %7

5:                                                ; preds = %1
  %6 = tail call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  br label %7

7:                                                ; preds = %5, %3
  %8 = phi ptr [ %4, %3 ], [ %6, %5 ]
  ret ptr %8
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef zeroext i1 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %3 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short", ptr %2, i64 0, i32 2
  %4 = load i8, ptr %3, align 1
  %5 = icmp slt i8 %4, 0
  ret i1 %5
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %3 = load ptr, ptr %2, align 8, !tbaa !5
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %3 = tail call noundef ptr @_ZNSt3__114pointer_traitsIPcE10pointer_toB7v160006ERc(ptr noundef nonnull align 1 dereferenceable(1) %2) #24
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  ret ptr %2
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  ret ptr %0
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  ret ptr %2
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  ret ptr %0
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__114pointer_traitsIPcE10pointer_toB7v160006ERc(ptr noundef nonnull align 1 dereferenceable(1) %0) local_unnamed_addr #7 align 2 {
  ret ptr %0
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNSt3__110__distanceB7v160006IPKcEENS_15iterator_traitsIT_E15difference_typeES4_S4_NS_26random_access_iterator_tagE(ptr noundef %0, ptr noundef %1) local_unnamed_addr #7 {
  %3 = ptrtoint ptr %1 to i64
  %4 = ptrtoint ptr %0 to i64
  %5 = sub i64 %3, %4
  ret i64 %5
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7DNSNameC2ERKS_(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #0 align 2 {
  %3 = tail call noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvEC1ERKS5_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1)
  ret ptr %0
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvEC1ERKS5_(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #0 align 2 {
  %3 = tail call noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvEC2ERKS5_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1)
  ret ptr %0
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvEC2ERKS5_(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #0 align 2 personality ptr @__gxx_personality_v0 {
  %3 = tail call noundef ptr @_ZN5boost9container13new_allocatorIcEC2ERKS2_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef nonnull align 1 dereferenceable(1) %1) #24
  store i8 1, ptr %0, align 8
  %4 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %0, i64 0, i32 1
  %5 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 2
  %6 = tail call noundef ptr @_ZnwmPv21boost_container_new_t(i64 noundef 1, ptr noundef nonnull %4)
  store i8 0, ptr %6, align 1, !tbaa !5
  %7 = load i8, ptr %1, align 8, !tbaa !5
  %8 = and i8 %7, 1
  %9 = icmp eq i8 %8, 0
  %10 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %1, i64 0, i32 1
  %11 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %1, i64 0, i32 2
  %12 = load ptr, ptr %11, align 8
  %13 = select i1 %9, ptr %12, ptr %10
  %14 = lshr i8 %7, 1
  %15 = zext i8 %14 to i64
  %16 = getelementptr inbounds i8, ptr %10, i64 %15
  %17 = load i64, ptr %1, align 8
  %18 = lshr i64 %17, 1
  %19 = getelementptr inbounds i8, ptr %12, i64 %18
  %20 = select i1 %9, ptr %19, ptr %16
  %21 = invoke noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6assignEPKcS7_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %13, ptr noundef %20)
          to label %22 unwind label %23

22:                                               ; preds = %2
  ret ptr %0

23:                                               ; preds = %2
  %24 = landingpad { ptr, i32 }
          cleanup
  %25 = load i8, ptr %0, align 8, !tbaa !5
  %26 = and i8 %25, 1
  %27 = icmp eq i8 %26, 0
  br i1 %27, label %28, label %32

28:                                               ; preds = %23
  %29 = load ptr, ptr %5, align 8, !tbaa !55
  %30 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 1
  %31 = load i64, ptr %30, align 8, !tbaa !57
  tail call void @_ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE10deallocateEPcm(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %29, i64 noundef %31)
  br label %32

32:                                               ; preds = %23, %28
  resume { ptr, i32 } %24
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6assignEPKcS7_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1, ptr noundef %2) local_unnamed_addr #4 align 2 {
  %4 = ptrtoint ptr %2 to i64
  %5 = ptrtoint ptr %1 to i64
  %6 = sub i64 %4, %5
  tail call void @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE7reserveEm(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %6)
  %7 = load i8, ptr %0, align 8, !tbaa !5
  %8 = and i8 %7, 1
  %9 = icmp eq i8 %8, 0
  %10 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %0, i64 0, i32 1
  %11 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 2
  %12 = load ptr, ptr %11, align 8
  %13 = select i1 %9, ptr %12, ptr %10
  %14 = tail call noundef ptr @_ZNSt3__111char_traitsIcE4copyEPcPKcm(ptr noundef %13, ptr noundef %1, i64 noundef %6) #24
  %15 = getelementptr inbounds i8, ptr %13, i64 %6
  %16 = tail call noundef ptr @_ZnwmPv21boost_container_new_t(i64 noundef 1, ptr noundef %15)
  store i8 0, ptr %16, align 1, !tbaa !5
  %17 = load i8, ptr %0, align 8, !tbaa !5
  %18 = and i8 %17, 1
  %19 = icmp eq i8 %18, 0
  br i1 %19, label %27, label %20

20:                                               ; preds = %3
  %21 = icmp ugt i64 %6, 127
  br i1 %21, label %22, label %23, !prof !19

22:                                               ; preds = %20
  tail call void @__assert_rtn(ptr noundef nonnull @__func__._ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE15priv_short_sizeEm, ptr noundef nonnull @.str.47, i32 noundef 484, ptr noundef nonnull @.str.49) #26
  unreachable

23:                                               ; preds = %20
  %24 = trunc i64 %6 to i8
  %25 = shl i8 %24, 1
  %26 = or i8 %18, %25
  store i8 %26, ptr %0, align 8
  br label %35

27:                                               ; preds = %3
  %28 = icmp slt i64 %6, 0
  br i1 %28, label %29, label %30, !prof !19

29:                                               ; preds = %27
  tail call void @__assert_rtn(ptr noundef nonnull @__func__._ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE14priv_long_sizeEm, ptr noundef nonnull @.str.47, i32 noundef 492, ptr noundef nonnull @.str.49) #26
  unreachable

30:                                               ; preds = %27
  %31 = load i64, ptr %0, align 8
  %32 = shl i64 %6, 1
  %33 = and i64 %31, 1
  %34 = or i64 %33, %32
  store i64 %34, ptr %0, align 8
  br label %35

35:                                               ; preds = %23, %30
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container13new_allocatorIcEC2ERKS2_(ptr noundef nonnull returned align 1 dereferenceable(1) %0, ptr noundef nonnull align 1 dereferenceable(1) %1) unnamed_addr #2 align 2 {
  ret ptr %0
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZnwmPv21boost_container_new_t(i64 noundef %0, ptr noundef %1) local_unnamed_addr #7 {
  ret ptr %1
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNSt3__111char_traitsIcE4copyEPcPKcm(ptr noundef %0, ptr noundef %1, i64 noundef %2) local_unnamed_addr #7 align 2 personality ptr @__gxx_personality_v0 {
  %4 = icmp ult ptr %1, %0
  %5 = getelementptr inbounds i8, ptr %0, i64 %2
  %6 = icmp ule ptr %5, %1
  %7 = select i1 %4, i1 true, i1 %6
  tail call void @llvm.assume(i1 %7)
  %8 = invoke noundef ptr @_ZNSt3__16copy_nB7v160006IPKcmPcEENS_9enable_ifIXsr33__is_cpp17_random_access_iteratorIT_EE5valueET1_E4typeES5_T0_S6_(ptr noundef %1, i64 noundef %2, ptr noundef %0)
          to label %9 unwind label %10

9:                                                ; preds = %3
  ret ptr %0

10:                                               ; preds = %3
  %11 = landingpad { ptr, i32 }
          catch ptr null
  %12 = extractvalue { ptr, i32 } %11, 0
  tail call void @__clang_call_terminate(ptr %12) #27
  unreachable
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__16copy_nB7v160006IPKcmPcEENS_9enable_ifIXsr33__is_cpp17_random_access_iteratorIT_EE5valueET1_E4typeES5_T0_S6_(ptr noundef %0, i64 noundef %1, ptr noundef %2) local_unnamed_addr #4 {
  %4 = getelementptr inbounds i8, ptr %0, i64 %1
  %5 = tail call noundef ptr @_ZNSt3__14copyB7v160006IPKcPcEET0_T_S5_S4_(ptr noundef %0, ptr noundef %4, ptr noundef %2)
  ret ptr %5
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__14copyB7v160006IPKcPcEET0_T_S5_S4_(ptr noundef %0, ptr noundef %1, ptr noundef %2) local_unnamed_addr #4 {
  %4 = tail call [2 x i64] @_ZNSt3__16__copyB7v160006INS_17_ClassicAlgPolicyEPKcS3_PcEENS_4pairIT0_T2_EES6_T1_S7_(ptr noundef %0, ptr noundef %1, ptr noundef %2)
  %5 = extractvalue [2 x i64] %4, 1
  %6 = inttoptr i64 %5 to ptr
  ret ptr %6
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden [2 x i64] @_ZNSt3__16__copyB7v160006INS_17_ClassicAlgPolicyEPKcS3_PcEENS_4pairIT0_T2_EES6_T1_S7_(ptr noundef %0, ptr noundef %1, ptr noundef %2) local_unnamed_addr #4 {
  %4 = tail call [2 x i64] @_ZNSt3__123__dispatch_copy_or_moveB7v160006INS_17_ClassicAlgPolicyENS_11__copy_loopIS1_EENS_14__copy_trivialEPKcS6_PcEENS_4pairIT2_T4_EES9_T3_SA_(ptr noundef %0, ptr noundef %1, ptr noundef %2)
  ret [2 x i64] %4
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden [2 x i64] @_ZNSt3__123__dispatch_copy_or_moveB7v160006INS_17_ClassicAlgPolicyENS_11__copy_loopIS1_EENS_14__copy_trivialEPKcS6_PcEENS_4pairIT2_T4_EES9_T3_SA_(ptr noundef %0, ptr noundef %1, ptr noundef %2) local_unnamed_addr #4 {
  %4 = tail call [2 x i64] @_ZNSt3__121__unwrap_and_dispatchB7v160006INS_10__overloadINS_11__copy_loopINS_17_ClassicAlgPolicyEEENS_14__copy_trivialEEEPKcS8_PcLi0EEENS_4pairIT0_T2_EESB_T1_SC_(ptr noundef %0, ptr noundef %1, ptr noundef %2)
  ret [2 x i64] %4
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden [2 x i64] @_ZNSt3__121__unwrap_and_dispatchB7v160006INS_10__overloadINS_11__copy_loopINS_17_ClassicAlgPolicyEEENS_14__copy_trivialEEEPKcS8_PcLi0EEENS_4pairIT0_T2_EESB_T1_SC_(ptr noundef %0, ptr noundef %1, ptr noundef %2) local_unnamed_addr #4 {
  %4 = alloca %"struct.std::__1::__overload", align 1
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = tail call [2 x i64] @_ZNSt3__114__unwrap_rangeB7v160006IPKcS2_EENS_4pairIT0_S4_EET_S6_(ptr noundef %0, ptr noundef %1)
  %8 = extractvalue [2 x i64] %7, 0
  %9 = inttoptr i64 %8 to ptr
  %10 = extractvalue [2 x i64] %7, 1
  %11 = inttoptr i64 %10 to ptr
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %4) #24
  %12 = tail call noundef ptr @_ZNSt3__113__unwrap_iterB7v160006IPcNS_18__unwrap_iter_implIS1_Lb1EEELi0EEEDTclsrT0_8__unwrapclsr3stdE7declvalIT_EEEES5_(ptr noundef %2) #24
  %13 = call [2 x i64] @_ZNKSt3__114__copy_trivialclB7v160006IKccLi0EEENS_4pairIPT_PT0_EES5_S5_S7_(ptr noundef nonnull align 1 dereferenceable(1) %4, ptr noundef %9, ptr noundef %11, ptr noundef %12)
  %14 = extractvalue [2 x i64] %13, 0
  %15 = inttoptr i64 %14 to ptr
  %16 = extractvalue [2 x i64] %13, 1
  %17 = inttoptr i64 %16 to ptr
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %4) #24
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %5) #24
  %18 = call noundef ptr @_ZNSt3__114__rewrap_rangeB7v160006IPKcS2_EET_S3_T0_(ptr noundef %0, ptr noundef %15)
  store ptr %18, ptr %5, align 8, !tbaa !43
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %6) #24
  %19 = call noundef ptr @_ZNSt3__113__rewrap_iterB7v160006IPcS1_NS_18__unwrap_iter_implIS1_Lb1EEEEET_S4_T0_(ptr noundef %2, ptr noundef %17) #24
  store ptr %19, ptr %6, align 8, !tbaa !43
  %20 = call [2 x i64] @_ZNSt3__19make_pairB7v160006IPKcPcEENS_4pairINS_18__unwrap_ref_decayIT_E4typeENS5_IT0_E4typeEEEOS6_OS9_(ptr noundef nonnull align 8 dereferenceable(8) %5, ptr noundef nonnull align 8 dereferenceable(8) %6)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %6) #24
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %5) #24
  ret [2 x i64] %20
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden [2 x i64] @_ZNSt3__114__unwrap_rangeB7v160006IPKcS2_EENS_4pairIT0_S4_EET_S6_(ptr noundef %0, ptr noundef %1) local_unnamed_addr #4 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %3) #24
  %5 = tail call noundef ptr @_ZNSt3__113__unwrap_iterB7v160006IPKcNS_18__unwrap_iter_implIS2_Lb1EEELi0EEEDTclsrT0_8__unwrapclsr3stdE7declvalIT_EEEES6_(ptr noundef %0) #24
  store ptr %5, ptr %3, align 8, !tbaa !43
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %4) #24
  %6 = tail call noundef ptr @_ZNSt3__113__unwrap_iterB7v160006IPKcNS_18__unwrap_iter_implIS2_Lb1EEELi0EEEDTclsrT0_8__unwrapclsr3stdE7declvalIT_EEEES6_(ptr noundef %1) #24
  store ptr %6, ptr %4, align 8, !tbaa !43
  %7 = call [2 x i64] @_ZNSt3__19make_pairB7v160006IPKcS2_EENS_4pairINS_18__unwrap_ref_decayIT_E4typeENS4_IT0_E4typeEEEOS5_OS8_(ptr noundef nonnull align 8 dereferenceable(8) %3, ptr noundef nonnull align 8 dereferenceable(8) %4)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %4) #24
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3) #24
  ret [2 x i64] %7
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden [2 x i64] @_ZNKSt3__114__copy_trivialclB7v160006IKccLi0EEENS_4pairIPT_PT0_EES5_S5_S7_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) local_unnamed_addr #4 align 2 {
  %5 = tail call [2 x i64] @_ZNSt3__119__copy_trivial_implB7v160006IKccEENS_4pairIPT_PT0_EES4_S4_S6_(ptr noundef %1, ptr noundef %2, ptr noundef %3)
  ret [2 x i64] %5
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__113__unwrap_iterB7v160006IPcNS_18__unwrap_iter_implIS1_Lb1EEELi0EEEDTclsrT0_8__unwrapclsr3stdE7declvalIT_EEEES5_(ptr noundef %0) local_unnamed_addr #7 {
  %2 = tail call noundef ptr @_ZNSt3__118__unwrap_iter_implIPcLb1EE8__unwrapB7v160006ES1_(ptr noundef %0) #24
  ret ptr %2
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden [2 x i64] @_ZNSt3__19make_pairB7v160006IPKcPcEENS_4pairINS_18__unwrap_ref_decayIT_E4typeENS5_IT0_E4typeEEEOS6_OS9_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) local_unnamed_addr #7 {
  %3 = alloca %"struct.std::__1::pair", align 8
  %4 = call noundef ptr @_ZNSt3__14pairIPKcPcEC1B7v160006IS2_S3_LPv0EEEOT_OT0_(ptr noundef nonnull align 8 dereferenceable(16) %3, ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #24
  %5 = load i64, ptr %3, align 8
  %6 = insertvalue [2 x i64] poison, i64 %5, 0
  %7 = getelementptr inbounds [2 x i64], ptr %3, i64 0, i64 1
  %8 = load i64, ptr %7, align 8
  %9 = insertvalue [2 x i64] %6, i64 %8, 1
  ret [2 x i64] %9
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__114__rewrap_rangeB7v160006IPKcS2_EET_S3_T0_(ptr noundef %0, ptr noundef %1) local_unnamed_addr #7 {
  %3 = tail call noundef ptr @_ZNSt3__113__rewrap_iterB7v160006IPKcS2_NS_18__unwrap_iter_implIS2_Lb1EEEEET_S5_T0_(ptr noundef %0, ptr noundef %1) #24
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__113__rewrap_iterB7v160006IPcS1_NS_18__unwrap_iter_implIS1_Lb1EEEEET_S4_T0_(ptr noundef %0, ptr noundef %1) local_unnamed_addr #7 personality ptr @__gxx_personality_v0 {
  %3 = tail call noundef ptr @_ZNSt3__118__unwrap_iter_implIPcLb1EE8__rewrapB7v160006ES1_S1_(ptr noundef %0, ptr noundef %1)
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden [2 x i64] @_ZNSt3__19make_pairB7v160006IPKcS2_EENS_4pairINS_18__unwrap_ref_decayIT_E4typeENS4_IT0_E4typeEEEOS5_OS8_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) local_unnamed_addr #7 {
  %3 = alloca %"struct.std::__1::pair.7", align 8
  %4 = call noundef ptr @_ZNSt3__14pairIPKcS2_EC1B7v160006IS2_S2_LPv0EEEOT_OT0_(ptr noundef nonnull align 8 dereferenceable(16) %3, ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #24
  %5 = load i64, ptr %3, align 8
  %6 = insertvalue [2 x i64] poison, i64 %5, 0
  %7 = getelementptr inbounds [2 x i64], ptr %3, i64 0, i64 1
  %8 = load i64, ptr %7, align 8
  %9 = insertvalue [2 x i64] %6, i64 %8, 1
  ret [2 x i64] %9
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__113__unwrap_iterB7v160006IPKcNS_18__unwrap_iter_implIS2_Lb1EEELi0EEEDTclsrT0_8__unwrapclsr3stdE7declvalIT_EEEES6_(ptr noundef %0) local_unnamed_addr #7 {
  %2 = tail call noundef ptr @_ZNSt3__118__unwrap_iter_implIPKcLb1EE8__unwrapB7v160006ES2_(ptr noundef %0) #24
  ret ptr %2
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNSt3__14pairIPKcS2_EC1B7v160006IS2_S2_LPv0EEEOT_OT0_(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 8 dereferenceable(8) %2) unnamed_addr #2 align 2 {
  %4 = tail call noundef ptr @_ZNSt3__14pairIPKcS2_EC2B7v160006IS2_S2_LPv0EEEOT_OT0_(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 8 dereferenceable(8) %2) #24
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNSt3__14pairIPKcS2_EC2B7v160006IS2_S2_LPv0EEEOT_OT0_(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 8 dereferenceable(8) %2) unnamed_addr #2 align 2 {
  %4 = load ptr, ptr %1, align 8, !tbaa !43
  store ptr %4, ptr %0, align 8, !tbaa !58
  %5 = getelementptr inbounds %"struct.std::__1::pair.7", ptr %0, i64 0, i32 1
  %6 = load ptr, ptr %2, align 8, !tbaa !43
  store ptr %6, ptr %5, align 8, !tbaa !60
  ret ptr %0
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__118__unwrap_iter_implIPKcLb1EE8__unwrapB7v160006ES2_(ptr noundef %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef ptr @_ZNSt3__112__to_addressB7v160006IKcEEPT_S3_(ptr noundef %0) #24
  ret ptr %2
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__112__to_addressB7v160006IKcEEPT_S3_(ptr noundef %0) local_unnamed_addr #7 {
  ret ptr %0
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden [2 x i64] @_ZNSt3__119__copy_trivial_implB7v160006IKccEENS_4pairIPT_PT0_EES4_S4_S6_(ptr noundef %0, ptr noundef %1, ptr noundef %2) local_unnamed_addr #4 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %1, ptr %4, align 8, !tbaa !43
  %6 = ptrtoint ptr %1 to i64
  %7 = ptrtoint ptr %0 to i64
  %8 = sub i64 %6, %7
  tail call void @llvm.memmove.p0.p0.i64(ptr align 1 %2, ptr align 1 %0, i64 %8, i1 false)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %5) #24
  %9 = getelementptr inbounds i8, ptr %2, i64 %8
  store ptr %9, ptr %5, align 8, !tbaa !43
  %10 = call [2 x i64] @_ZNSt3__19make_pairB7v160006IRPKcPcEENS_4pairINS_18__unwrap_ref_decayIT_E4typeENS6_IT0_E4typeEEEOS7_OSA_(ptr noundef nonnull align 8 dereferenceable(8) %4, ptr noundef nonnull align 8 dereferenceable(8) %5)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %5) #24
  ret [2 x i64] %10
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memmove.p0.p0.i64(ptr nocapture writeonly, ptr nocapture readonly, i64, i1 immarg) #12

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden [2 x i64] @_ZNSt3__19make_pairB7v160006IRPKcPcEENS_4pairINS_18__unwrap_ref_decayIT_E4typeENS6_IT0_E4typeEEEOS7_OSA_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) local_unnamed_addr #7 {
  %3 = alloca %"struct.std::__1::pair", align 8
  %4 = call noundef ptr @_ZNSt3__14pairIPKcPcEC1B7v160006IRS2_S3_LPv0EEEOT_OT0_(ptr noundef nonnull align 8 dereferenceable(16) %3, ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #24
  %5 = load i64, ptr %3, align 8
  %6 = insertvalue [2 x i64] poison, i64 %5, 0
  %7 = getelementptr inbounds [2 x i64], ptr %3, i64 0, i64 1
  %8 = load i64, ptr %7, align 8
  %9 = insertvalue [2 x i64] %6, i64 %8, 1
  ret [2 x i64] %9
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNSt3__14pairIPKcPcEC1B7v160006IRS2_S3_LPv0EEEOT_OT0_(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 8 dereferenceable(8) %2) unnamed_addr #2 align 2 {
  %4 = tail call noundef ptr @_ZNSt3__14pairIPKcPcEC2B7v160006IRS2_S3_LPv0EEEOT_OT0_(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 8 dereferenceable(8) %2) #24
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNSt3__14pairIPKcPcEC2B7v160006IRS2_S3_LPv0EEEOT_OT0_(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 8 dereferenceable(8) %2) unnamed_addr #2 align 2 {
  %4 = load ptr, ptr %1, align 8, !tbaa !43
  store ptr %4, ptr %0, align 8, !tbaa !61
  %5 = getelementptr inbounds %"struct.std::__1::pair", ptr %0, i64 0, i32 1
  %6 = load ptr, ptr %2, align 8, !tbaa !43
  store ptr %6, ptr %5, align 8, !tbaa !63
  ret ptr %0
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__118__unwrap_iter_implIPcLb1EE8__unwrapB7v160006ES1_(ptr noundef %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef ptr @_ZNSt3__112__to_addressB7v160006IcEEPT_S2_(ptr noundef %0) #24
  ret ptr %2
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__112__to_addressB7v160006IcEEPT_S2_(ptr noundef %0) local_unnamed_addr #7 {
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNSt3__14pairIPKcPcEC1B7v160006IS2_S3_LPv0EEEOT_OT0_(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 8 dereferenceable(8) %2) unnamed_addr #2 align 2 {
  %4 = tail call noundef ptr @_ZNSt3__14pairIPKcPcEC2B7v160006IS2_S3_LPv0EEEOT_OT0_(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 8 dereferenceable(8) %2) #24
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNSt3__14pairIPKcPcEC2B7v160006IS2_S3_LPv0EEEOT_OT0_(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 8 dereferenceable(8) %2) unnamed_addr #2 align 2 {
  %4 = load ptr, ptr %1, align 8, !tbaa !43
  store ptr %4, ptr %0, align 8, !tbaa !61
  %5 = getelementptr inbounds %"struct.std::__1::pair", ptr %0, i64 0, i32 1
  %6 = load ptr, ptr %2, align 8, !tbaa !43
  store ptr %6, ptr %5, align 8, !tbaa !63
  ret ptr %0
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__113__rewrap_iterB7v160006IPKcS2_NS_18__unwrap_iter_implIS2_Lb1EEEEET_S5_T0_(ptr noundef %0, ptr noundef %1) local_unnamed_addr #7 personality ptr @__gxx_personality_v0 {
  %3 = tail call noundef ptr @_ZNSt3__118__unwrap_iter_implIPKcLb1EE8__rewrapB7v160006ES2_S2_(ptr noundef %0, ptr noundef %1)
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__118__unwrap_iter_implIPKcLb1EE8__rewrapB7v160006ES2_S2_(ptr noundef %0, ptr noundef %1) local_unnamed_addr #7 align 2 {
  %3 = tail call noundef ptr @_ZNSt3__112__to_addressB7v160006IKcEEPT_S3_(ptr noundef %0) #24
  %4 = ptrtoint ptr %1 to i64
  %5 = ptrtoint ptr %3 to i64
  %6 = sub i64 %4, %5
  %7 = getelementptr inbounds i8, ptr %0, i64 %6
  ret ptr %7
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__118__unwrap_iter_implIPcLb1EE8__rewrapB7v160006ES1_S1_(ptr noundef %0, ptr noundef %1) local_unnamed_addr #7 align 2 {
  %3 = tail call noundef ptr @_ZNSt3__112__to_addressB7v160006IcEEPT_S2_(ptr noundef %0) #24
  %4 = ptrtoint ptr %1 to i64
  %5 = ptrtoint ptr %3 to i64
  %6 = sub i64 %4, %5
  %7 = getelementptr inbounds i8, ptr %0, i64 %6
  ret ptr %7
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr void @_ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE10deallocateEPcm(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1, i64 noundef %2) local_unnamed_addr #7 align 2 {
  %4 = icmp ne ptr %1, null
  %5 = icmp ugt i64 %2, 23
  %6 = and i1 %4, %5
  br i1 %6, label %7, label %8

7:                                                ; preds = %3
  tail call void @_ZN5boost9container13new_allocatorIcE10deallocateEPcm(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef nonnull %1, i64 noundef %2) #24
  br label %8

8:                                                ; preds = %7, %3
  ret void
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr void @_ZN5boost9container13new_allocatorIcE10deallocateEPcm(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %1, i64 noundef %2) local_unnamed_addr #7 align 2 {
  tail call void @_ZdlPv(ptr noundef %1) #24
  ret void
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(ptr noundef) local_unnamed_addr #19

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr void @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE5clearEv(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 personality ptr @__gxx_personality_v0 {
  %2 = alloca i8, align 1
  %3 = alloca i8, align 1
  %4 = load i8, ptr %0, align 8, !tbaa !5
  %5 = and i8 %4, 1
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %11, label %7

7:                                                ; preds = %1
  %8 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %0, i64 0, i32 1
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %2) #24
  store i8 0, ptr %2, align 1, !tbaa !5
  call void @_ZNSt3__111char_traitsIcE6assignERcRKc(ptr noundef nonnull align 1 dereferenceable(1) %8, ptr noundef nonnull align 1 dereferenceable(1) %2) #24
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %2) #24
  %9 = load i8, ptr %0, align 8
  %10 = and i8 %9, 1
  store i8 %10, ptr %0, align 8
  br label %16

11:                                               ; preds = %1
  %12 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 2
  %13 = load ptr, ptr %12, align 8, !tbaa !55
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %3) #24
  store i8 0, ptr %3, align 1, !tbaa !5
  call void @_ZNSt3__111char_traitsIcE6assignERcRKc(ptr noundef nonnull align 1 dereferenceable(1) %13, ptr noundef nonnull align 1 dereferenceable(1) %3) #24
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %3) #24
  %14 = load i64, ptr %0, align 8
  %15 = and i64 %14, 1
  store i64 %15, ptr %0, align 8
  br label %16

16:                                               ; preds = %11, %7
  ret void
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr void @_ZNSt3__111char_traitsIcE6assignERcRKc(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef nonnull align 1 dereferenceable(1) %1) local_unnamed_addr #7 align 2 {
  %3 = load i8, ptr %1, align 1, !tbaa !5
  store i8 %3, ptr %0, align 1, !tbaa !5
  ret void
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7DNSNameC2Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #2 align 2 {
  %2 = tail call noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvEC1Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7DNSNameC2EOS_(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #2 align 2 {
  %3 = tail call noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvEC1EOS5_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) #24
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvEC1EOS5_(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #2 align 2 {
  %3 = tail call noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvEC2EOS5_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) #24
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvEC2EOS5_(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #2 align 2 personality ptr @__gxx_personality_v0 {
  %3 = tail call noundef ptr @_ZN5boost9container13new_allocatorIcEC2ERKS2_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef nonnull align 1 dereferenceable(1) %1) #24
  store i8 1, ptr %0, align 8
  %4 = tail call noundef zeroext i1 @_ZN5boost9containereqERKNS0_13new_allocatorIcEES4_(ptr noundef nonnull align 1 dereferenceable(1) %1, ptr noundef nonnull align 1 dereferenceable(1) %0) #24
  br i1 %4, label %5, label %6

5:                                                ; preds = %2
  invoke void @_ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE9swap_dataERS5_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1)
          to label %22 unwind label %23

6:                                                ; preds = %2
  %7 = load i8, ptr %1, align 8, !tbaa !5
  %8 = and i8 %7, 1
  %9 = icmp eq i8 %8, 0
  %10 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %1, i64 0, i32 1
  %11 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %1, i64 0, i32 2
  %12 = load ptr, ptr %11, align 8
  %13 = select i1 %9, ptr %12, ptr %10
  %14 = lshr i8 %7, 1
  %15 = zext i8 %14 to i64
  %16 = getelementptr inbounds i8, ptr %10, i64 %15
  %17 = load i64, ptr %1, align 8
  %18 = lshr i64 %17, 1
  %19 = getelementptr inbounds i8, ptr %12, i64 %18
  %20 = select i1 %9, ptr %19, ptr %16
  %21 = invoke noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6assignIPcEERS5_T_S9_PNS_11move_detail22disable_if_convertibleIS9_mvE4typeE(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %13, ptr noundef %20, ptr noundef null)
          to label %22 unwind label %23

22:                                               ; preds = %6, %5
  ret ptr %0

23:                                               ; preds = %6, %5
  %24 = landingpad { ptr, i32 }
          catch ptr null
  %25 = extractvalue { ptr, i32 } %24, 0
  tail call void @__clang_call_terminate(ptr %25) #27
  unreachable
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef zeroext i1 @_ZN5boost9containereqERKNS0_13new_allocatorIcEES4_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef nonnull align 1 dereferenceable(1) %1) local_unnamed_addr #7 {
  ret i1 true
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr void @_ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE9swap_dataERS5_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) local_unnamed_addr #0 align 2 {
  %3 = alloca [24 x i8], align 8
  %4 = alloca %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", align 1
  %5 = alloca %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", align 1
  %6 = load i8, ptr %0, align 8, !tbaa !5
  %7 = and i8 %6, 1
  %8 = icmp eq i8 %7, 0
  %9 = load i8, ptr %1, align 8, !tbaa !5
  %10 = and i8 %9, 1
  %11 = icmp eq i8 %10, 0
  br i1 %8, label %25, label %12

12:                                               ; preds = %2
  br i1 %11, label %14, label %13

13:                                               ; preds = %12
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %3)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %3, ptr noundef nonnull align 8 dereferenceable(24) %0, i64 24, i1 false), !tbaa.struct !64
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1, i64 24, i1 false), !tbaa.struct !64
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %1, ptr noundef nonnull align 8 dereferenceable(24) %3, i64 24, i1 false), !tbaa.struct !64
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %3)
  br label %38

14:                                               ; preds = %12
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %4)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 1 dereferenceable(24) %4, ptr noundef nonnull align 8 dereferenceable(24) %0, i64 24, i1 false), !tbaa.struct !65
  %15 = load i64, ptr %0, align 8
  %16 = and i64 %15, -2
  store i64 %16, ptr %0, align 8
  %17 = load i64, ptr %1, align 8
  %18 = and i64 %17, -2
  store i64 %18, ptr %0, align 8
  %19 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %1, i64 0, i32 1
  %20 = load i64, ptr %19, align 8, !tbaa !57
  %21 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 1
  store i64 %20, ptr %21, align 8, !tbaa !57
  %22 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %1, i64 0, i32 2
  %23 = load ptr, ptr %22, align 8, !tbaa !55
  %24 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 2
  store ptr %23, ptr %24, align 8, !tbaa !55
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %1, ptr noundef nonnull align 1 dereferenceable(24) %4, i64 24, i1 false), !tbaa.struct !65
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %4)
  br label %38

25:                                               ; preds = %2
  br i1 %11, label %37, label %26

26:                                               ; preds = %25
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %5)
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 1 dereferenceable(24) %5, ptr noundef nonnull align 8 dereferenceable(24) %1, i64 24, i1 false), !tbaa.struct !65
  %27 = load i64, ptr %1, align 8
  %28 = and i64 %27, -2
  store i64 %28, ptr %1, align 8
  %29 = load i64, ptr %0, align 8
  %30 = and i64 %29, -2
  store i64 %30, ptr %1, align 8
  %31 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 1
  %32 = load i64, ptr %31, align 8, !tbaa !57
  %33 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %1, i64 0, i32 1
  store i64 %32, ptr %33, align 8, !tbaa !57
  %34 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 2
  %35 = load ptr, ptr %34, align 8, !tbaa !55
  %36 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %1, i64 0, i32 2
  store ptr %35, ptr %36, align 8, !tbaa !55
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 1 dereferenceable(24) %5, i64 24, i1 false), !tbaa.struct !65
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %5)
  br label %38

37:                                               ; preds = %25
  tail call void @_ZNSt3__14swapB7v160006IN5boost9container3dtl17basic_string_baseINS2_13new_allocatorIcEEE6long_tEEENS_9enable_ifIXaasr21is_move_constructibleIT_EE5valuesr18is_move_assignableISA_EE5valueEvE4typeERSA_SD_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1)
  br label %38

38:                                               ; preds = %26, %37, %13, %14
  ret void
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6assignIPcEERS5_T_S9_PNS_11move_detail22disable_if_convertibleIS9_mvE4typeE(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) local_unnamed_addr #4 align 2 {
  %5 = load i8, ptr %0, align 8, !tbaa !5
  %6 = and i8 %5, 1
  %7 = icmp eq i8 %6, 0
  %8 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %0, i64 0, i32 1
  %9 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 2
  %10 = load ptr, ptr %9, align 8
  %11 = select i1 %7, ptr %10, ptr %8
  %12 = lshr i8 %5, 1
  %13 = zext i8 %12 to i64
  %14 = load i64, ptr %0, align 8
  %15 = lshr i64 %14, 1
  %16 = select i1 %7, i64 %15, i64 %13
  %17 = icmp ne ptr %1, %2
  %18 = icmp ne i64 %16, 0
  %19 = select i1 %17, i1 %18, i1 false
  br i1 %19, label %20, label %30

20:                                               ; preds = %4, %20
  %21 = phi ptr [ %24, %20 ], [ %1, %4 ]
  %22 = phi ptr [ %26, %20 ], [ %11, %4 ]
  %23 = phi i64 [ %25, %20 ], [ 0, %4 ]
  tail call void @_ZNSt3__111char_traitsIcE6assignERcRKc(ptr noundef nonnull align 1 dereferenceable(1) %22, ptr noundef nonnull align 1 dereferenceable(1) %21) #24
  %24 = getelementptr inbounds i8, ptr %21, i64 1
  %25 = add nuw nsw i64 %23, 1
  %26 = getelementptr inbounds i8, ptr %22, i64 1
  %27 = icmp ne ptr %24, %2
  %28 = icmp ne i64 %25, %16
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %20, label %30, !llvm.loop !66

30:                                               ; preds = %20, %4
  %31 = phi i64 [ 0, %4 ], [ %25, %20 ]
  %32 = phi ptr [ %1, %4 ], [ %24, %20 ]
  %33 = icmp eq ptr %32, %2
  br i1 %33, label %34, label %38

34:                                               ; preds = %30
  %35 = getelementptr inbounds i8, ptr %11, i64 %31
  %36 = getelementptr inbounds i8, ptr %11, i64 %16
  %37 = tail call noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE5eraseEPKcS7_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %35, ptr noundef %36) #24
  br label %40

38:                                               ; preds = %30
  %39 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6appendIPcEERS5_T_S9_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %32, ptr noundef %2)
  br label %40

40:                                               ; preds = %38, %34
  ret ptr %0
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__14swapB7v160006IN5boost9container3dtl17basic_string_baseINS2_13new_allocatorIcEEE6long_tEEENS_9enable_ifIXaasr21is_move_constructibleIT_EE5valuesr18is_move_assignableISA_EE5valueEvE4typeERSA_SD_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) local_unnamed_addr #0 {
  %3 = load i64, ptr %0, align 8
  %4 = and i64 %3, -2
  %5 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 1
  %6 = load i64, ptr %5, align 8, !tbaa !57
  %7 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 2
  %8 = load ptr, ptr %7, align 8, !tbaa !55
  %9 = load i64, ptr %1, align 8
  %10 = and i64 %9, -2
  %11 = and i64 %3, 1
  %12 = or i64 %10, %11
  store i64 %12, ptr %0, align 8
  %13 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %1, i64 0, i32 1
  %14 = load i64, ptr %13, align 8, !tbaa !57
  store i64 %14, ptr %5, align 8, !tbaa !57
  %15 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %1, i64 0, i32 2
  %16 = load ptr, ptr %15, align 8, !tbaa !55
  store ptr %16, ptr %7, align 8, !tbaa !55
  %17 = load i64, ptr %1, align 8
  %18 = and i64 %17, 1
  %19 = or i64 %18, %4
  store i64 %19, ptr %1, align 8
  store i64 %6, ptr %13, align 8, !tbaa !57
  store ptr %8, ptr %15, align 8, !tbaa !55
  ret void
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE5eraseEPKcS7_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1, ptr noundef %2) local_unnamed_addr #7 align 2 personality ptr @__gxx_personality_v0 {
  %4 = icmp eq ptr %1, %2
  br i1 %4, label %50, label %5

5:                                                ; preds = %3
  %6 = ptrtoint ptr %2 to i64
  %7 = ptrtoint ptr %1 to i64
  %8 = sub i64 %7, %6
  %9 = load i8, ptr %0, align 8, !tbaa !5
  %10 = and i8 %9, 1
  %11 = icmp eq i8 %10, 0
  %12 = lshr i8 %9, 1
  %13 = zext i8 %12 to i64
  %14 = load i64, ptr %0, align 8
  %15 = lshr i64 %14, 1
  %16 = select i1 %11, i64 %15, i64 %13
  %17 = load i8, ptr %0, align 8, !tbaa !5
  %18 = and i8 %17, 1
  %19 = icmp eq i8 %18, 0
  %20 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %0, i64 0, i32 1
  %21 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 2
  %22 = load ptr, ptr %21, align 8
  %23 = select i1 %19, ptr %22, ptr %20
  %24 = ptrtoint ptr %23 to i64
  %25 = sub i64 1, %6
  %26 = add i64 %25, %16
  %27 = add i64 %26, %24
  %28 = tail call noundef ptr @_ZNSt3__111char_traitsIcE4moveEPcPKcm(ptr noundef %1, ptr noundef %2, i64 noundef %27) #24
  %29 = add i64 %16, %8
  %30 = load i8, ptr %0, align 8, !tbaa !5
  %31 = and i8 %30, 1
  %32 = icmp eq i8 %31, 0
  br i1 %32, label %39, label %33

33:                                               ; preds = %5
  %34 = icmp ugt i64 %29, 127
  br i1 %34, label %41, label %35, !prof !19

35:                                               ; preds = %33
  %36 = trunc i64 %29 to i8
  %37 = shl i8 %36, 1
  %38 = or i8 %31, %37
  store i8 %38, ptr %0, align 8
  br label %50

39:                                               ; preds = %5
  %40 = icmp slt i64 %29, 0
  br i1 %40, label %41, label %45, !prof !19

41:                                               ; preds = %39, %33
  %42 = phi ptr [ @__func__._ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE15priv_short_sizeEm, %33 ], [ @__func__._ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE14priv_long_sizeEm, %39 ]
  %43 = phi i32 [ 484, %33 ], [ 492, %39 ]
  invoke void @__assert_rtn(ptr noundef nonnull %42, ptr noundef nonnull @.str.47, i32 noundef %43, ptr noundef nonnull @.str.49) #26
          to label %44 unwind label %51

44:                                               ; preds = %41
  unreachable

45:                                               ; preds = %39
  %46 = load i64, ptr %0, align 8
  %47 = shl i64 %29, 1
  %48 = and i64 %46, 1
  %49 = or i64 %48, %47
  store i64 %49, ptr %0, align 8
  br label %50

50:                                               ; preds = %45, %35, %3
  ret ptr %1

51:                                               ; preds = %41
  %52 = landingpad { ptr, i32 }
          catch ptr null
  %53 = extractvalue { ptr, i32 } %52, 0
  tail call void @__clang_call_terminate(ptr %53) #27
  unreachable
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6appendIPcEERS5_T_S9_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1, ptr noundef %2) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %4 = load i8, ptr %0, align 8, !tbaa !5
  %5 = and i8 %4, 1
  %6 = icmp eq i8 %5, 0
  %7 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %0, i64 0, i32 1
  %8 = lshr i8 %4, 1
  %9 = zext i8 %8 to i64
  %10 = getelementptr inbounds i8, ptr %7, i64 %9
  %11 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 2
  %12 = load ptr, ptr %11, align 8
  %13 = load i64, ptr %0, align 8
  %14 = lshr i64 %13, 1
  %15 = getelementptr inbounds i8, ptr %12, i64 %14
  %16 = select i1 %6, ptr %15, ptr %10
  %17 = tail call noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6insertIPcEES7_PKcT_SA_PNS_11move_detail13disable_if_orIvNSB_14is_convertibleISA_mEENS0_3dtl17is_input_iteratorISA_Xsr21has_iterator_categoryISA_EE5valueEEENSB_5bool_ILb0EEESJ_E4typeE(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %16, ptr noundef %1, ptr noundef %2, ptr noundef null)
  ret ptr %0
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNSt3__111char_traitsIcE4moveEPcPKcm(ptr noundef %0, ptr noundef %1, i64 noundef %2) local_unnamed_addr #7 align 2 {
  %4 = tail call fastcc noundef ptr @_ZNSt3__1L18__char_traits_moveB7v160006IcEEPT_S2_PKS1_m(ptr noundef %0, ptr noundef %1, i64 noundef %2) #24
  ret ptr %0
}

; Function Attrs: mustprogress nofree noinline nosync nounwind ssp willreturn memory(argmem: readwrite) uwtable(sync)
define internal fastcc noundef ptr @_ZNSt3__1L18__char_traits_moveB7v160006IcEEPT_S2_PKS1_m(ptr noundef returned writeonly %0, ptr nocapture noundef readonly %1, i64 noundef %2) unnamed_addr #20 {
  tail call void @llvm.memmove.p0.p0.i64(ptr align 1 %0, ptr align 1 %1, i64 %2, i1 false)
  ret ptr %0
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6insertIPcEES7_PKcT_SA_PNS_11move_detail13disable_if_orIvNSB_14is_convertibleISA_mEENS0_3dtl17is_input_iteratorISA_Xsr21has_iterator_categoryISA_EE5valueEEENSB_5bool_ILb0EEESJ_E4typeE(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = load i8, ptr %0, align 8, !tbaa !5
  %9 = and i8 %8, 1
  %10 = icmp eq i8 %9, 0
  %11 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %0, i64 0, i32 1
  %12 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 2
  %13 = load ptr, ptr %12, align 8
  %14 = ptrtoint ptr %1 to i64
  %15 = icmp eq ptr %2, %3
  br i1 %15, label %171, label %16

16:                                               ; preds = %5
  %17 = ptrtoint ptr %3 to i64
  %18 = ptrtoint ptr %2 to i64
  %19 = sub i64 %17, %18
  %20 = lshr i8 %8, 1
  %21 = zext i8 %20 to i64
  %22 = load i64, ptr %0, align 8
  %23 = lshr i64 %22, 1
  %24 = select i1 %10, i64 %23, i64 %21
  %25 = load i8, ptr %0, align 8, !tbaa !5
  %26 = and i8 %25, 1
  %27 = icmp eq i8 %26, 0
  %28 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 1
  %29 = load i64, ptr %28, align 8
  %30 = add i64 %29, -1
  %31 = select i1 %27, i64 %30, i64 22
  %32 = sub i64 %31, %24
  %33 = select i1 %27, ptr %13, ptr %11
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %6) #24
  store i64 0, ptr %6, align 8, !tbaa !32
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %7) #24
  store ptr null, ptr %7, align 8, !tbaa !43
  %34 = icmp ult i64 %32, %19
  br i1 %34, label %35, label %47

35:                                               ; preds = %16
  %36 = tail call noundef i64 @_ZNK5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE13next_capacityEm(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %19)
  store i64 %36, ptr %6, align 8, !tbaa !32
  store ptr %33, ptr %7, align 8, !tbaa !43
  %37 = add i64 %24, %19
  %38 = add i64 %37, 1
  %39 = call noundef ptr @_ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE18allocation_commandEjmRmRPc(ptr noundef nonnull align 8 dereferenceable(24) %0, i32 noundef 7, i64 noundef %38, ptr noundef nonnull align 8 dereferenceable(8) %6, ptr noundef nonnull align 8 dereferenceable(8) %7)
  %40 = icmp eq ptr %33, %39
  br i1 %40, label %41, label %47

41:                                               ; preds = %35
  %42 = load i8, ptr %0, align 8, !tbaa !5
  %43 = and i8 %42, 1
  %44 = icmp eq i8 %43, 0
  br i1 %44, label %45, label %47

45:                                               ; preds = %41
  %46 = load i64, ptr %6, align 8, !tbaa !32
  store i64 %46, ptr %28, align 8, !tbaa !57
  br label %47

47:                                               ; preds = %45, %41, %16, %35
  %48 = phi ptr [ %39, %35 ], [ null, %16 ], [ %39, %41 ], [ %39, %45 ]
  %49 = phi i1 [ false, %35 ], [ true, %16 ], [ true, %41 ], [ true, %45 ]
  br i1 %49, label %50, label %118

50:                                               ; preds = %47
  %51 = ptrtoint ptr %33 to i64
  %52 = sub i64 %51, %14
  %53 = add i64 %52, %24
  %54 = icmp ugt i64 %19, %53
  %55 = add nuw i64 %24, 1
  br i1 %54, label %66, label %56

56:                                               ; preds = %50
  %57 = add nuw i64 %24, 1
  %58 = getelementptr inbounds i8, ptr %33, i64 %57
  %59 = sub i64 %55, %19
  %60 = getelementptr inbounds i8, ptr %33, i64 %59
  %61 = call noundef i64 @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE23priv_uninitialized_copyIPcS7_EEmT_S8_T0_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %60, ptr noundef nonnull %58, ptr noundef nonnull %58)
  %62 = getelementptr inbounds i8, ptr %1, i64 %19
  %63 = sub i64 1, %19
  %64 = add i64 %63, %53
  %65 = call noundef ptr @_ZNSt3__111char_traitsIcE4moveEPcPKcm(ptr noundef %62, ptr noundef %1, i64 noundef %64) #24
  br label %94

66:                                               ; preds = %50
  %67 = add i64 %53, 1
  %68 = getelementptr inbounds i8, ptr %2, i64 %67
  %69 = getelementptr inbounds i8, ptr %33, i64 %55
  %70 = call noundef i64 @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE23priv_uninitialized_copyIPcS7_EEmT_S8_T0_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %68, ptr noundef %3, ptr noundef nonnull %69)
  %71 = sub i64 %19, %53
  %72 = add i64 %71, %24
  %73 = load i8, ptr %0, align 8, !tbaa !5
  %74 = and i8 %73, 1
  %75 = icmp eq i8 %74, 0
  br i1 %75, label %83, label %76

76:                                               ; preds = %66
  %77 = icmp ugt i64 %72, 127
  br i1 %77, label %78, label %79, !prof !19

78:                                               ; preds = %76
  call void @__assert_rtn(ptr noundef nonnull @__func__._ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE15priv_short_sizeEm, ptr noundef nonnull @.str.47, i32 noundef 484, ptr noundef nonnull @.str.49) #26
  unreachable

79:                                               ; preds = %76
  %80 = trunc i64 %72 to i8
  %81 = shl i8 %80, 1
  %82 = or i8 %74, %81
  store i8 %82, ptr %0, align 8
  br label %91

83:                                               ; preds = %66
  %84 = icmp slt i64 %72, 0
  br i1 %84, label %85, label %86, !prof !19

85:                                               ; preds = %83
  call void @__assert_rtn(ptr noundef nonnull @__func__._ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE14priv_long_sizeEm, ptr noundef nonnull @.str.47, i32 noundef 492, ptr noundef nonnull @.str.49) #26
  unreachable

86:                                               ; preds = %83
  %87 = load i64, ptr %0, align 8
  %88 = shl i64 %72, 1
  %89 = and i64 %87, 1
  %90 = or i64 %89, %88
  store i64 %90, ptr %0, align 8
  br label %91

91:                                               ; preds = %79, %86
  %92 = getelementptr inbounds i8, ptr %33, i64 %72
  %93 = call noundef i64 @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE23priv_uninitialized_copyIPKcPcEEmT_SA_T0_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1, ptr noundef nonnull %69, ptr noundef %92)
  br label %94

94:                                               ; preds = %91, %56
  %95 = phi ptr [ %68, %91 ], [ %3, %56 ]
  call void @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE9priv_copyIPcS7_EEvT_S8_T0_(ptr noundef %2, ptr noundef %95, ptr noundef %1)
  %96 = add i64 %24, %19
  %97 = load i8, ptr %0, align 8, !tbaa !5
  %98 = and i8 %97, 1
  %99 = icmp eq i8 %98, 0
  br i1 %99, label %107, label %100

100:                                              ; preds = %94
  %101 = icmp ugt i64 %96, 127
  br i1 %101, label %102, label %103, !prof !19

102:                                              ; preds = %100
  call void @__assert_rtn(ptr noundef nonnull @__func__._ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE15priv_short_sizeEm, ptr noundef nonnull @.str.47, i32 noundef 484, ptr noundef nonnull @.str.49) #26
  unreachable

103:                                              ; preds = %100
  %104 = trunc i64 %96 to i8
  %105 = shl i8 %104, 1
  %106 = or i8 %98, %105
  store i8 %106, ptr %0, align 8
  br label %115

107:                                              ; preds = %94
  %108 = icmp slt i64 %96, 0
  br i1 %108, label %109, label %110, !prof !19

109:                                              ; preds = %107
  call void @__assert_rtn(ptr noundef nonnull @__func__._ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE14priv_long_sizeEm, ptr noundef nonnull @.str.47, i32 noundef 492, ptr noundef nonnull @.str.49) #26
  unreachable

110:                                              ; preds = %107
  %111 = load i64, ptr %0, align 8
  %112 = shl i64 %96, 1
  %113 = and i64 %111, 1
  %114 = or i64 %113, %112
  store i64 %114, ptr %0, align 8
  br label %115

115:                                              ; preds = %103, %110
  %116 = getelementptr inbounds i8, ptr %33, i64 %96
  %117 = call noundef ptr @_ZnwmPv21boost_container_new_t(i64 noundef 1, ptr noundef %116)
  store i8 0, ptr %117, align 1, !tbaa !5
  br label %170

118:                                              ; preds = %47
  %119 = load ptr, ptr %7, align 8, !tbaa !43
  %120 = icmp eq ptr %119, null
  br i1 %120, label %121, label %148

121:                                              ; preds = %118
  %122 = call noundef i64 @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE23priv_uninitialized_copyIPKcPcEEmT_SA_T0_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %33, ptr noundef %1, ptr noundef %48)
  %123 = getelementptr inbounds i8, ptr %48, i64 %122
  %124 = call noundef i64 @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE23priv_uninitialized_copyIPcS7_EEmT_S8_T0_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %2, ptr noundef %3, ptr noundef %123)
  %125 = add i64 %124, %122
  %126 = getelementptr inbounds i8, ptr %33, i64 %24
  %127 = getelementptr inbounds i8, ptr %48, i64 %125
  %128 = call noundef i64 @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE23priv_uninitialized_copyIPKcPcEEmT_SA_T0_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1, ptr noundef %126, ptr noundef %127)
  %129 = add i64 %125, %128
  %130 = getelementptr inbounds i8, ptr %48, i64 %129
  %131 = call noundef ptr @_ZnwmPv21boost_container_new_t(i64 noundef 1, ptr noundef %130)
  store i8 0, ptr %131, align 1, !tbaa !5
  %132 = load i8, ptr %0, align 8, !tbaa !5
  %133 = and i8 %132, 1
  %134 = icmp eq i8 %133, 0
  %135 = load ptr, ptr %12, align 8
  %136 = select i1 %134, ptr %135, ptr %11
  %137 = load i64, ptr %28, align 8
  %138 = select i1 %134, i64 %137, i64 23
  call void @_ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE10deallocateEPcm(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %136, i64 noundef %138)
  %139 = call noundef ptr @_ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE11assure_longEv(ptr noundef nonnull align 8 dereferenceable(24) %0)
  store ptr %48, ptr %12, align 8, !tbaa !55
  %140 = icmp slt i64 %129, 0
  br i1 %140, label %141, label %142, !prof !19

141:                                              ; preds = %121
  call void @__assert_rtn(ptr noundef nonnull @__func__._ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE14priv_long_sizeEm, ptr noundef nonnull @.str.47, i32 noundef 492, ptr noundef nonnull @.str.49) #26
  unreachable

142:                                              ; preds = %121
  %143 = load i64, ptr %0, align 8
  %144 = shl i64 %129, 1
  %145 = and i64 %143, 1
  %146 = or i64 %145, %144
  store i64 %146, ptr %0, align 8
  %147 = load i64, ptr %6, align 8, !tbaa !32
  store i64 %147, ptr %28, align 8, !tbaa !57
  br label %170

148:                                              ; preds = %118
  %149 = ptrtoint ptr %33 to i64
  %150 = sub i64 %14, %149
  %151 = call noundef ptr @_ZNSt3__111char_traitsIcE4moveEPcPKcm(ptr noundef %48, ptr noundef %33, i64 noundef %150) #24
  %152 = add i64 %150, %19
  %153 = getelementptr inbounds i8, ptr %48, i64 %152
  %154 = sub i64 %24, %150
  %155 = call noundef ptr @_ZNSt3__111char_traitsIcE4moveEPcPKcm(ptr noundef %153, ptr noundef %1, i64 noundef %154) #24
  %156 = getelementptr inbounds i8, ptr %48, i64 %150
  %157 = call noundef i64 @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE23priv_uninitialized_copyIPcS7_EEmT_S8_T0_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %2, ptr noundef %3, ptr noundef %156)
  %158 = add i64 %24, %19
  %159 = getelementptr inbounds i8, ptr %48, i64 %158
  %160 = call noundef ptr @_ZnwmPv21boost_container_new_t(i64 noundef 1, ptr noundef %159)
  store i8 0, ptr %160, align 1, !tbaa !5
  %161 = call noundef ptr @_ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE11assure_longEv(ptr noundef nonnull align 8 dereferenceable(24) %0)
  store ptr %48, ptr %12, align 8, !tbaa !55
  %162 = icmp slt i64 %158, 0
  br i1 %162, label %163, label %164, !prof !19

163:                                              ; preds = %148
  call void @__assert_rtn(ptr noundef nonnull @__func__._ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE14priv_long_sizeEm, ptr noundef nonnull @.str.47, i32 noundef 492, ptr noundef nonnull @.str.49) #26
  unreachable

164:                                              ; preds = %148
  %165 = load i64, ptr %0, align 8
  %166 = shl i64 %158, 1
  %167 = and i64 %165, 1
  %168 = or i64 %167, %166
  store i64 %168, ptr %0, align 8
  %169 = load i64, ptr %6, align 8, !tbaa !32
  store i64 %169, ptr %28, align 8, !tbaa !57
  br label %170

170:                                              ; preds = %142, %164, %115
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %7) #24
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %6) #24
  br label %171

171:                                              ; preds = %170, %5
  %172 = select i1 %10, ptr %13, ptr %11
  %173 = ptrtoint ptr %172 to i64
  %174 = sub i64 %14, %173
  %175 = load i8, ptr %0, align 8, !tbaa !5
  %176 = and i8 %175, 1
  %177 = icmp eq i8 %176, 0
  %178 = load ptr, ptr %12, align 8
  %179 = select i1 %177, ptr %178, ptr %11
  %180 = getelementptr inbounds i8, ptr %179, i64 %174
  ret ptr %180
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr noundef i64 @_ZNK5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE13next_capacityEm(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) local_unnamed_addr #4 align 2 {
  %3 = alloca %"struct.boost::container::growth_factor_100", align 1
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %3) #24
  %4 = load i8, ptr %0, align 8, !tbaa !5
  %5 = and i8 %4, 1
  %6 = icmp eq i8 %5, 0
  %7 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 1
  %8 = load i64, ptr %7, align 8
  %9 = select i1 %6, i64 %8, i64 23
  %10 = tail call noundef i64 @_ZNK5boost9container13new_allocatorIcE8max_sizeEv(ptr noundef nonnull align 1 dereferenceable(1) %0) #24
  %11 = call noundef i64 @_ZNK5boost9container3dtl17grow_factor_ratioILj0ELj2ELj1EEclImEET_S5_S5_S5_(ptr noundef nonnull align 1 dereferenceable(1) %3, i64 noundef %9, i64 noundef %1, i64 noundef %10)
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %3) #24
  ret i64 %11
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE18allocation_commandEjmRmRPc(ptr noundef nonnull align 8 dereferenceable(24) %0, i32 noundef %1, i64 noundef %2, ptr noundef nonnull align 8 dereferenceable(8) %3, ptr noundef nonnull align 8 dereferenceable(8) %4) local_unnamed_addr #4 align 2 {
  %6 = load i8, ptr %0, align 8, !tbaa !5
  %7 = and i8 %6, 1
  %8 = icmp eq i8 %7, 0
  %9 = and i32 %1, 6
  %10 = icmp eq i32 %9, 0
  %11 = or i1 %10, %8
  br i1 %11, label %14, label %12

12:                                               ; preds = %5
  store ptr null, ptr %4, align 8, !tbaa !43
  %13 = and i32 %1, -7
  br label %14

14:                                               ; preds = %12, %5
  %15 = phi i32 [ %13, %12 ], [ %1, %5 ]
  %16 = tail call noundef ptr @_ZN5boost9container3dtl24allocator_version_traitsINS0_13new_allocatorIcEELj1EE18allocation_commandERS4_jmRmRPc(ptr noundef nonnull align 1 dereferenceable(1) %0, i32 noundef %15, i64 noundef %2, ptr noundef nonnull align 8 dereferenceable(8) %3, ptr noundef nonnull align 8 dereferenceable(8) %4)
  ret ptr %16
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr noundef i64 @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE23priv_uninitialized_copyIPcS7_EEmT_S8_T0_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %5 = ptrtoint ptr %1 to i64
  %6 = ptrtoint ptr %2 to i64
  %7 = icmp eq ptr %1, %2
  br i1 %7, label %18, label %8

8:                                                ; preds = %4, %8
  %9 = phi ptr [ %13, %8 ], [ %3, %4 ]
  %10 = phi ptr [ %14, %8 ], [ %1, %4 ]
  %11 = tail call noundef ptr @_ZnwmPv21boost_container_new_t(i64 noundef 1, ptr noundef %9)
  %12 = load i8, ptr %10, align 1, !tbaa !5
  store i8 %12, ptr %11, align 1, !tbaa !5
  %13 = getelementptr inbounds i8, ptr %9, i64 1
  %14 = getelementptr inbounds i8, ptr %10, i64 1
  %15 = icmp eq ptr %14, %2
  br i1 %15, label %16, label %8, !llvm.loop !67

16:                                               ; preds = %8
  %17 = sub i64 %6, %5
  br label %18

18:                                               ; preds = %16, %4
  %19 = phi i64 [ 0, %4 ], [ %17, %16 ]
  ret i64 %19
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr void @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE9priv_copyIPcS7_EEvT_S8_T0_(ptr noundef %0, ptr noundef %1, ptr noundef %2) local_unnamed_addr #7 align 2 {
  %4 = icmp eq ptr %0, %1
  br i1 %4, label %11, label %5

5:                                                ; preds = %3, %5
  %6 = phi ptr [ %9, %5 ], [ %2, %3 ]
  %7 = phi ptr [ %8, %5 ], [ %0, %3 ]
  tail call void @_ZNSt3__111char_traitsIcE6assignERcRKc(ptr noundef nonnull align 1 dereferenceable(1) %6, ptr noundef nonnull align 1 dereferenceable(1) %7) #24
  %8 = getelementptr inbounds i8, ptr %7, i64 1
  %9 = getelementptr inbounds i8, ptr %6, i64 1
  %10 = icmp eq ptr %8, %1
  br i1 %10, label %11, label %5, !llvm.loop !68

11:                                               ; preds = %5, %3
  ret void
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr noundef i64 @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE23priv_uninitialized_copyIPKcPcEEmT_SA_T0_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %5 = ptrtoint ptr %1 to i64
  %6 = ptrtoint ptr %2 to i64
  %7 = icmp eq ptr %1, %2
  br i1 %7, label %18, label %8

8:                                                ; preds = %4, %8
  %9 = phi ptr [ %13, %8 ], [ %3, %4 ]
  %10 = phi ptr [ %14, %8 ], [ %1, %4 ]
  %11 = tail call noundef ptr @_ZnwmPv21boost_container_new_t(i64 noundef 1, ptr noundef %9)
  %12 = load i8, ptr %10, align 1, !tbaa !5
  store i8 %12, ptr %11, align 1, !tbaa !5
  %13 = getelementptr inbounds i8, ptr %9, i64 1
  %14 = getelementptr inbounds i8, ptr %10, i64 1
  %15 = icmp eq ptr %14, %2
  br i1 %15, label %16, label %8, !llvm.loop !69

16:                                               ; preds = %8
  %17 = sub i64 %6, %5
  br label %18

18:                                               ; preds = %16, %4
  %19 = phi i64 [ 0, %4 ], [ %17, %16 ]
  ret i64 %19
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE11assure_longEv(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #0 align 2 {
  %2 = load i8, ptr %0, align 8, !tbaa !5
  %3 = and i8 %2, 1
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %8, label %5

5:                                                ; preds = %1
  %6 = load i64, ptr %0, align 8
  %7 = and i64 %6, -2
  store i64 %7, ptr %0, align 8
  br label %8

8:                                                ; preds = %1, %5
  ret ptr %0
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr noundef i64 @_ZNK5boost9container3dtl17grow_factor_ratioILj0ELj2ELj1EEclImEET_S5_S5_S5_(ptr noundef nonnull align 1 dereferenceable(1) %0, i64 noundef %1, i64 noundef %2, i64 noundef %3) local_unnamed_addr #4 align 2 {
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  store i64 %3, ptr %5, align 8, !tbaa !32
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %6) #24
  %9 = icmp sgt i64 %1, -1
  %10 = shl i64 %1, 1
  %11 = select i1 %9, i64 %10, i64 -1
  store i64 %11, ptr %6, align 8, !tbaa !32
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %7) #24
  store i64 0, ptr %7, align 8, !tbaa !32
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %8) #24
  %12 = add i64 %2, %1
  store i64 %12, ptr %8, align 8, !tbaa !32
  %13 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZN5boost9container3dtl9min_valueImEERKT_S5_S5_(ptr noundef nonnull align 8 dereferenceable(8) %5, ptr noundef nonnull align 8 dereferenceable(8) %6)
  %14 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZN5boost9container3dtl9max_valueImEERKT_S5_S5_(ptr noundef nonnull align 8 dereferenceable(8) %8, ptr noundef nonnull align 8 dereferenceable(8) %13)
  %15 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZN5boost9container3dtl9max_valueImEERKT_S5_S5_(ptr noundef nonnull align 8 dereferenceable(8) %7, ptr noundef nonnull align 8 dereferenceable(8) %14)
  %16 = load i64, ptr %15, align 8, !tbaa !32
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %8) #24
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %7) #24
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %6) #24
  ret i64 %16
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(8) ptr @_ZN5boost9container3dtl9max_valueImEERKT_S5_S5_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) local_unnamed_addr #7 {
  %3 = load i64, ptr %0, align 8, !tbaa !32
  %4 = load i64, ptr %1, align 8, !tbaa !32
  %5 = icmp ugt i64 %3, %4
  %6 = select i1 %5, ptr %0, ptr %1
  ret ptr %6
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(8) ptr @_ZN5boost9container3dtl9min_valueImEERKT_S5_S5_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) local_unnamed_addr #7 {
  %3 = load i64, ptr %0, align 8, !tbaa !32
  %4 = load i64, ptr %1, align 8, !tbaa !32
  %5 = icmp ult i64 %3, %4
  %6 = select i1 %5, ptr %0, ptr %1
  ret ptr %6
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i64 @_ZNK5boost9container13new_allocatorIcE8max_sizeEv(ptr noundef nonnull align 1 dereferenceable(1) %0) local_unnamed_addr #7 align 2 {
  ret i64 9223372036854775807
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container3dtl24allocator_version_traitsINS0_13new_allocatorIcEELj1EE18allocation_commandERS4_jmRmRPc(ptr noundef nonnull align 1 dereferenceable(1) %0, i32 noundef %1, i64 noundef %2, ptr noundef nonnull align 8 dereferenceable(8) %3, ptr noundef nonnull align 8 dereferenceable(8) %4) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %6 = and i32 %1, 16
  %7 = icmp eq i32 %6, 0
  %8 = and i32 %1, 17
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %11, !prof !19

10:                                               ; preds = %5
  tail call void @_ZN5boost9container17throw_logic_errorEPKc(ptr noundef nonnull @.str.50) #25
  unreachable

11:                                               ; preds = %5
  %12 = load i64, ptr %3, align 8, !tbaa !32
  %13 = invoke noundef ptr @_ZN5boost9container13new_allocatorIcE8allocateEm(ptr noundef nonnull align 1 dereferenceable(1) %0, i64 noundef %12)
          to label %22 unwind label %14

14:                                               ; preds = %11
  %15 = landingpad { ptr, i32 }
          catch ptr null
  %16 = extractvalue { ptr, i32 } %15, 0
  %17 = tail call ptr @__cxa_begin_catch(ptr %16) #24
  br i1 %7, label %18, label %21

18:                                               ; preds = %14
  invoke void @__cxa_rethrow() #25
          to label %28 unwind label %19

19:                                               ; preds = %18
  %20 = landingpad { ptr, i32 }
          cleanup
  invoke void @__cxa_end_catch()
          to label %24 unwind label %25

21:                                               ; preds = %14
  tail call void @__cxa_end_catch()
  br label %22

22:                                               ; preds = %11, %21
  %23 = phi ptr [ null, %21 ], [ %13, %11 ]
  store ptr null, ptr %4, align 8, !tbaa !43
  ret ptr %23

24:                                               ; preds = %19
  resume { ptr, i32 } %20

25:                                               ; preds = %19
  %26 = landingpad { ptr, i32 }
          catch ptr null
  %27 = extractvalue { ptr, i32 } %26, 0
  tail call void @__clang_call_terminate(ptr %27) #27
  unreachable

28:                                               ; preds = %18
  unreachable
}

; Function Attrs: mustprogress noinline noreturn ssp uwtable(sync)
define linkonce_odr void @_ZN5boost9container17throw_logic_errorEPKc(ptr noundef %0) local_unnamed_addr #5 personality ptr @__gxx_personality_v0 {
  %2 = tail call ptr @__cxa_allocate_exception(i64 16) #24
  %3 = invoke noundef ptr @_ZN5boost9container11logic_errorC1EPKc(ptr noundef nonnull align 8 dereferenceable(16) %2, ptr noundef %0)
          to label %4 unwind label %5

4:                                                ; preds = %1
  tail call void @__cxa_throw(ptr nonnull %2, ptr nonnull @_ZTIN5boost9container11logic_errorE, ptr nonnull @_ZN5boost9container11logic_errorD1Ev) #25
  unreachable

5:                                                ; preds = %1
  %6 = landingpad { ptr, i32 }
          cleanup
  tail call void @__cxa_free_exception(ptr %2) #24
  resume { ptr, i32 } %6
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container13new_allocatorIcE8allocateEm(ptr noundef nonnull align 1 dereferenceable(1) %0, i64 noundef %1) local_unnamed_addr #4 align 2 {
  %3 = icmp slt i64 %1, 0
  br i1 %3, label %4, label %5, !prof !19

4:                                                ; preds = %2
  tail call void @_ZN5boost9container15throw_bad_allocEv() #25
  unreachable

5:                                                ; preds = %2
  %6 = tail call noalias noundef nonnull ptr @_Znwm(i64 noundef %1) #29
  ret ptr %6
}

declare void @__cxa_rethrow() local_unnamed_addr

declare void @__cxa_end_catch() local_unnamed_addr

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container11logic_errorC1EPKc(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #0 align 2 {
  %3 = tail call noundef ptr @_ZN5boost9container11logic_errorC2EPKc(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef %1)
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container11logic_errorD1Ev(ptr noundef nonnull returned align 8 dereferenceable(16) %0) unnamed_addr #2 align 2 {
  %2 = tail call noundef ptr @_ZN5boost9container11logic_errorD2Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) #24
  ret ptr %0
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container11logic_errorC2EPKc(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #0 align 2 {
  %3 = tail call noundef ptr @_ZN5boost9container9exceptionC2EPKc(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef %1)
  store ptr getelementptr inbounds ({ [5 x ptr] }, ptr @_ZTVN5boost9container11logic_errorE, i64 0, inrange i32 0, i64 2), ptr %0, align 8, !tbaa !53
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container9exceptionC2EPKc(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #2 align 2 {
  %3 = tail call noundef ptr @_ZNSt9exceptionC2B7v160006Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) #24
  store ptr getelementptr inbounds ({ [5 x ptr] }, ptr @_ZTVN5boost9container9exceptionE, i64 0, inrange i32 0, i64 2), ptr %0, align 8, !tbaa !53
  %4 = getelementptr inbounds %"class.boost::container::exception", ptr %0, i64 0, i32 1
  store ptr %1, ptr %4, align 8, !tbaa !70
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr void @_ZN5boost9container11logic_errorD0Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) unnamed_addr #2 align 2 {
  %2 = tail call noundef ptr @_ZN5boost9container11logic_errorD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) #24
  tail call void @_ZdlPv(ptr noundef %0) #30
  ret void
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNK5boost9container9exception4whatEv(ptr noundef nonnull align 8 dereferenceable(16) %0) unnamed_addr #7 align 2 {
  %2 = getelementptr inbounds %"class.boost::container::exception", ptr %0, i64 0, i32 1
  %3 = load ptr, ptr %2, align 8, !tbaa !70
  %4 = icmp eq ptr %3, null
  %5 = select i1 %4, ptr @.str.51, ptr %3
  ret ptr %5
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt9exceptionC2B7v160006Ev(ptr noundef nonnull returned align 8 dereferenceable(8) %0) unnamed_addr #2 align 2 {
  store ptr getelementptr inbounds ({ [5 x ptr] }, ptr @_ZTVSt9exception, i64 0, inrange i32 0, i64 2), ptr %0, align 8, !tbaa !53
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container9exceptionD1Ev(ptr noundef nonnull returned align 8 dereferenceable(16) %0) unnamed_addr #2 align 2 {
  %2 = tail call noundef ptr @_ZN5boost9container9exceptionD2Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) #24
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr void @_ZN5boost9container9exceptionD0Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) unnamed_addr #2 align 2 {
  %2 = tail call noundef ptr @_ZN5boost9container9exceptionD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) #24
  tail call void @_ZdlPv(ptr noundef %0) #30
  ret void
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container9exceptionD2Ev(ptr noundef nonnull returned align 8 dereferenceable(16) %0) unnamed_addr #2 align 2 {
  %2 = tail call noundef ptr @_ZNSt9exceptionD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) #24
  ret ptr %0
}

; Function Attrs: nounwind
declare noundef ptr @_ZNSt9exceptionD2Ev(ptr noundef nonnull returned align 8 dereferenceable(8)) unnamed_addr #6

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container11logic_errorD2Ev(ptr noundef nonnull returned align 8 dereferenceable(16) %0) unnamed_addr #2 align 2 {
  %2 = tail call noundef ptr @_ZN5boost9container9exceptionD2Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) #24
  ret ptr %0
}

; Function Attrs: mustprogress noinline noreturn ssp uwtable(sync)
define linkonce_odr void @_ZN5boost9container15throw_bad_allocEv() local_unnamed_addr #5 personality ptr @__gxx_personality_v0 {
  %1 = tail call ptr @__cxa_allocate_exception(i64 16) #24
  %2 = invoke noundef ptr @_ZN5boost9container9bad_allocC1Ev(ptr noundef nonnull align 8 dereferenceable(16) %1)
          to label %3 unwind label %4

3:                                                ; preds = %0
  tail call void @__cxa_throw(ptr nonnull %1, ptr nonnull @_ZTIN5boost9container9bad_allocE, ptr nonnull @_ZN5boost9container9bad_allocD1Ev) #25
  unreachable

4:                                                ; preds = %0
  %5 = landingpad { ptr, i32 }
          cleanup
  tail call void @__cxa_free_exception(ptr %1) #24
  resume { ptr, i32 } %5
}

; Function Attrs: nobuiltin allocsize(0)
declare noundef nonnull ptr @_Znwm(i64 noundef) local_unnamed_addr #21

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container9bad_allocC1Ev(ptr noundef nonnull returned align 8 dereferenceable(16) %0) unnamed_addr #0 align 2 {
  %2 = tail call noundef ptr @_ZN5boost9container9bad_allocC2Ev(ptr noundef nonnull align 8 dereferenceable(16) %0)
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container9bad_allocD1Ev(ptr noundef nonnull returned align 8 dereferenceable(16) %0) unnamed_addr #2 align 2 {
  %2 = tail call noundef ptr @_ZN5boost9container9bad_allocD2Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) #24
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container9bad_allocC2Ev(ptr noundef nonnull returned align 8 dereferenceable(16) %0) unnamed_addr #2 align 2 {
  %2 = tail call noundef ptr @_ZN5boost9container9exceptionC2EPKc(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef nonnull @.str.52)
  store ptr getelementptr inbounds ({ [5 x ptr] }, ptr @_ZTVN5boost9container9bad_allocE, i64 0, inrange i32 0, i64 2), ptr %0, align 8, !tbaa !53
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr void @_ZN5boost9container9bad_allocD0Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) unnamed_addr #2 align 2 {
  %2 = tail call noundef ptr @_ZN5boost9container9bad_allocD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) #24
  tail call void @_ZdlPv(ptr noundef %0) #30
  ret void
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container9bad_allocD2Ev(ptr noundef nonnull returned align 8 dereferenceable(16) %0) unnamed_addr #2 align 2 {
  %2 = tail call noundef ptr @_ZN5boost9container9exceptionD2Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) #24
  ret ptr %0
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt12out_of_rangeC2B7v160006ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #0 align 2 {
  %3 = tail call noundef ptr @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef nonnull align 8 dereferenceable(24) %1)
  store ptr getelementptr inbounds ({ [5 x ptr] }, ptr @_ZTVSt12out_of_range, i64 0, inrange i32 0, i64 2), ptr %0, align 8, !tbaa !53
  ret ptr %0
}

declare noundef ptr @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(ptr noundef nonnull returned align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(24)) unnamed_addr #8

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5RegexD2Ev(ptr noundef nonnull returned align 8 dereferenceable(32) %0) unnamed_addr #2 align 2 personality ptr @__gxx_personality_v0 {
  invoke void @regfree(ptr noundef nonnull %0)
          to label %2 unwind label %3

2:                                                ; preds = %1
  ret ptr %0

3:                                                ; preds = %1
  %4 = landingpad { ptr, i32 }
          catch ptr null
  %5 = extractvalue { ptr, i32 } %4, 0
  tail call void @__clang_call_terminate(ptr %5) #27
  unreachable
}

declare void @regfree(ptr noundef) local_unnamed_addr #8

declare i32 @regexec(ptr noundef, ptr noundef, i64 noundef, ptr noundef, i32 noundef) local_unnamed_addr #8

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr noundef i32 @_Z8burtleCIPKhjj(ptr noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #4 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4) #24
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %5) #24
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %6) #24
  store i32 -1640531527, ptr %5, align 4, !tbaa !21
  store i32 -1640531527, ptr %4, align 4, !tbaa !21
  store i32 %2, ptr %6, align 4, !tbaa !21
  %7 = icmp ugt i32 %1, 11
  br i1 %7, label %8, label %85

8:                                                ; preds = %3, %8
  %9 = phi i32 [ %83, %8 ], [ %1, %3 ]
  %10 = phi ptr [ %82, %8 ], [ %0, %3 ]
  %11 = load i8, ptr %10, align 1, !tbaa !5
  %12 = call noundef zeroext i8 @_Z11dns_tolowerh(i8 noundef zeroext %11)
  %13 = zext i8 %12 to i32
  %14 = getelementptr inbounds i8, ptr %10, i64 1
  %15 = load i8, ptr %14, align 1, !tbaa !5
  %16 = call noundef zeroext i8 @_Z11dns_tolowerh(i8 noundef zeroext %15)
  %17 = zext i8 %16 to i32
  %18 = shl nuw nsw i32 %17, 8
  %19 = or i32 %18, %13
  %20 = getelementptr inbounds i8, ptr %10, i64 2
  %21 = load i8, ptr %20, align 1, !tbaa !5
  %22 = call noundef zeroext i8 @_Z11dns_tolowerh(i8 noundef zeroext %21)
  %23 = zext i8 %22 to i32
  %24 = shl nuw nsw i32 %23, 16
  %25 = or i32 %19, %24
  %26 = getelementptr inbounds i8, ptr %10, i64 3
  %27 = load i8, ptr %26, align 1, !tbaa !5
  %28 = call noundef zeroext i8 @_Z11dns_tolowerh(i8 noundef zeroext %27)
  %29 = zext i8 %28 to i32
  %30 = shl nuw i32 %29, 24
  %31 = load i32, ptr %4, align 4, !tbaa !21
  %32 = add i32 %25, %31
  %33 = add i32 %32, %30
  store i32 %33, ptr %4, align 4, !tbaa !21
  %34 = getelementptr inbounds i8, ptr %10, i64 4
  %35 = load i8, ptr %34, align 1, !tbaa !5
  %36 = call noundef zeroext i8 @_Z11dns_tolowerh(i8 noundef zeroext %35)
  %37 = zext i8 %36 to i32
  %38 = getelementptr inbounds i8, ptr %10, i64 5
  %39 = load i8, ptr %38, align 1, !tbaa !5
  %40 = call noundef zeroext i8 @_Z11dns_tolowerh(i8 noundef zeroext %39)
  %41 = zext i8 %40 to i32
  %42 = shl nuw nsw i32 %41, 8
  %43 = or i32 %42, %37
  %44 = getelementptr inbounds i8, ptr %10, i64 6
  %45 = load i8, ptr %44, align 1, !tbaa !5
  %46 = call noundef zeroext i8 @_Z11dns_tolowerh(i8 noundef zeroext %45)
  %47 = zext i8 %46 to i32
  %48 = shl nuw nsw i32 %47, 16
  %49 = or i32 %43, %48
  %50 = getelementptr inbounds i8, ptr %10, i64 7
  %51 = load i8, ptr %50, align 1, !tbaa !5
  %52 = call noundef zeroext i8 @_Z11dns_tolowerh(i8 noundef zeroext %51)
  %53 = zext i8 %52 to i32
  %54 = shl nuw i32 %53, 24
  %55 = load i32, ptr %5, align 4, !tbaa !21
  %56 = add i32 %49, %55
  %57 = add i32 %56, %54
  store i32 %57, ptr %5, align 4, !tbaa !21
  %58 = getelementptr inbounds i8, ptr %10, i64 8
  %59 = load i8, ptr %58, align 1, !tbaa !5
  %60 = call noundef zeroext i8 @_Z11dns_tolowerh(i8 noundef zeroext %59)
  %61 = zext i8 %60 to i32
  %62 = getelementptr inbounds i8, ptr %10, i64 9
  %63 = load i8, ptr %62, align 1, !tbaa !5
  %64 = call noundef zeroext i8 @_Z11dns_tolowerh(i8 noundef zeroext %63)
  %65 = zext i8 %64 to i32
  %66 = shl nuw nsw i32 %65, 8
  %67 = or i32 %66, %61
  %68 = getelementptr inbounds i8, ptr %10, i64 10
  %69 = load i8, ptr %68, align 1, !tbaa !5
  %70 = call noundef zeroext i8 @_Z11dns_tolowerh(i8 noundef zeroext %69)
  %71 = zext i8 %70 to i32
  %72 = shl nuw nsw i32 %71, 16
  %73 = or i32 %67, %72
  %74 = getelementptr inbounds i8, ptr %10, i64 11
  %75 = load i8, ptr %74, align 1, !tbaa !5
  %76 = call noundef zeroext i8 @_Z11dns_tolowerh(i8 noundef zeroext %75)
  %77 = zext i8 %76 to i32
  %78 = shl nuw i32 %77, 24
  %79 = load i32, ptr %6, align 4, !tbaa !21
  %80 = add i32 %73, %79
  %81 = add i32 %80, %78
  store i32 %81, ptr %6, align 4, !tbaa !21
  call void @_Z9burtlemixRjS_S_(ptr noundef nonnull align 4 dereferenceable(4) %4, ptr noundef nonnull align 4 dereferenceable(4) %5, ptr noundef nonnull align 4 dereferenceable(4) %6)
  %82 = getelementptr inbounds i8, ptr %10, i64 12
  %83 = add i32 %9, -12
  %84 = icmp ugt i32 %83, 11
  br i1 %84, label %8, label %85, !llvm.loop !73

85:                                               ; preds = %8, %3
  %86 = phi ptr [ %0, %3 ], [ %82, %8 ]
  %87 = phi i32 [ %1, %3 ], [ %83, %8 ]
  %88 = load i32, ptr %6, align 4, !tbaa !21
  %89 = add i32 %88, %1
  store i32 %89, ptr %6, align 4, !tbaa !21
  switch i32 %87, label %175 [
    i32 11, label %90
    i32 10, label %98
    i32 9, label %106
    i32 8, label %114
    i32 7, label %122
    i32 6, label %130
    i32 5, label %138
    i32 4, label %145
    i32 3, label %153
    i32 2, label %161
    i32 1, label %169
  ]

90:                                               ; preds = %85
  %91 = getelementptr inbounds i8, ptr %86, i64 10
  %92 = load i8, ptr %91, align 1, !tbaa !5
  %93 = call noundef zeroext i8 @_Z11dns_tolowerh(i8 noundef zeroext %92)
  %94 = zext i8 %93 to i32
  %95 = shl nuw i32 %94, 24
  %96 = load i32, ptr %6, align 4, !tbaa !21
  %97 = add i32 %95, %96
  store i32 %97, ptr %6, align 4, !tbaa !21
  br label %98

98:                                               ; preds = %85, %90
  %99 = getelementptr inbounds i8, ptr %86, i64 9
  %100 = load i8, ptr %99, align 1, !tbaa !5
  %101 = call noundef zeroext i8 @_Z11dns_tolowerh(i8 noundef zeroext %100)
  %102 = zext i8 %101 to i32
  %103 = shl nuw nsw i32 %102, 16
  %104 = load i32, ptr %6, align 4, !tbaa !21
  %105 = add i32 %103, %104
  store i32 %105, ptr %6, align 4, !tbaa !21
  br label %106

106:                                              ; preds = %85, %98
  %107 = getelementptr inbounds i8, ptr %86, i64 8
  %108 = load i8, ptr %107, align 1, !tbaa !5
  %109 = call noundef zeroext i8 @_Z11dns_tolowerh(i8 noundef zeroext %108)
  %110 = zext i8 %109 to i32
  %111 = shl nuw nsw i32 %110, 8
  %112 = load i32, ptr %6, align 4, !tbaa !21
  %113 = add i32 %111, %112
  store i32 %113, ptr %6, align 4, !tbaa !21
  br label %114

114:                                              ; preds = %85, %106
  %115 = getelementptr inbounds i8, ptr %86, i64 7
  %116 = load i8, ptr %115, align 1, !tbaa !5
  %117 = call noundef zeroext i8 @_Z11dns_tolowerh(i8 noundef zeroext %116)
  %118 = zext i8 %117 to i32
  %119 = shl nuw i32 %118, 24
  %120 = load i32, ptr %5, align 4, !tbaa !21
  %121 = add i32 %119, %120
  store i32 %121, ptr %5, align 4, !tbaa !21
  br label %122

122:                                              ; preds = %85, %114
  %123 = getelementptr inbounds i8, ptr %86, i64 6
  %124 = load i8, ptr %123, align 1, !tbaa !5
  %125 = call noundef zeroext i8 @_Z11dns_tolowerh(i8 noundef zeroext %124)
  %126 = zext i8 %125 to i32
  %127 = shl nuw nsw i32 %126, 16
  %128 = load i32, ptr %5, align 4, !tbaa !21
  %129 = add i32 %127, %128
  store i32 %129, ptr %5, align 4, !tbaa !21
  br label %130

130:                                              ; preds = %85, %122
  %131 = getelementptr inbounds i8, ptr %86, i64 5
  %132 = load i8, ptr %131, align 1, !tbaa !5
  %133 = call noundef zeroext i8 @_Z11dns_tolowerh(i8 noundef zeroext %132)
  %134 = zext i8 %133 to i32
  %135 = shl nuw nsw i32 %134, 8
  %136 = load i32, ptr %5, align 4, !tbaa !21
  %137 = add i32 %135, %136
  store i32 %137, ptr %5, align 4, !tbaa !21
  br label %138

138:                                              ; preds = %85, %130
  %139 = getelementptr inbounds i8, ptr %86, i64 4
  %140 = load i8, ptr %139, align 1, !tbaa !5
  %141 = call noundef zeroext i8 @_Z11dns_tolowerh(i8 noundef zeroext %140)
  %142 = zext i8 %141 to i32
  %143 = load i32, ptr %5, align 4, !tbaa !21
  %144 = add i32 %143, %142
  store i32 %144, ptr %5, align 4, !tbaa !21
  br label %145

145:                                              ; preds = %85, %138
  %146 = getelementptr inbounds i8, ptr %86, i64 3
  %147 = load i8, ptr %146, align 1, !tbaa !5
  %148 = call noundef zeroext i8 @_Z11dns_tolowerh(i8 noundef zeroext %147)
  %149 = zext i8 %148 to i32
  %150 = shl nuw i32 %149, 24
  %151 = load i32, ptr %4, align 4, !tbaa !21
  %152 = add i32 %150, %151
  store i32 %152, ptr %4, align 4, !tbaa !21
  br label %153

153:                                              ; preds = %85, %145
  %154 = getelementptr inbounds i8, ptr %86, i64 2
  %155 = load i8, ptr %154, align 1, !tbaa !5
  %156 = call noundef zeroext i8 @_Z11dns_tolowerh(i8 noundef zeroext %155)
  %157 = zext i8 %156 to i32
  %158 = shl nuw nsw i32 %157, 16
  %159 = load i32, ptr %4, align 4, !tbaa !21
  %160 = add i32 %158, %159
  store i32 %160, ptr %4, align 4, !tbaa !21
  br label %161

161:                                              ; preds = %85, %153
  %162 = getelementptr inbounds i8, ptr %86, i64 1
  %163 = load i8, ptr %162, align 1, !tbaa !5
  %164 = call noundef zeroext i8 @_Z11dns_tolowerh(i8 noundef zeroext %163)
  %165 = zext i8 %164 to i32
  %166 = shl nuw nsw i32 %165, 8
  %167 = load i32, ptr %4, align 4, !tbaa !21
  %168 = add i32 %166, %167
  store i32 %168, ptr %4, align 4, !tbaa !21
  br label %169

169:                                              ; preds = %85, %161
  %170 = load i8, ptr %86, align 1, !tbaa !5
  %171 = call noundef zeroext i8 @_Z11dns_tolowerh(i8 noundef zeroext %170)
  %172 = zext i8 %171 to i32
  %173 = load i32, ptr %4, align 4, !tbaa !21
  %174 = add i32 %173, %172
  store i32 %174, ptr %4, align 4, !tbaa !21
  br label %175

175:                                              ; preds = %169, %85
  call void @_Z9burtlemixRjS_S_(ptr noundef nonnull align 4 dereferenceable(4) %4, ptr noundef nonnull align 4 dereferenceable(4) %5, ptr noundef nonnull align 4 dereferenceable(4) %6)
  %176 = load i32, ptr %6, align 4, !tbaa !21
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %6) #24
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %5) #24
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4) #24
  ret i32 %176
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr void @_Z9burtlemixRjS_S_(ptr noundef nonnull align 4 dereferenceable(4) %0, ptr noundef nonnull align 4 dereferenceable(4) %1, ptr noundef nonnull align 4 dereferenceable(4) %2) local_unnamed_addr #7 {
  %4 = load i32, ptr %1, align 4, !tbaa !21
  %5 = load i32, ptr %0, align 4, !tbaa !21
  %6 = sub i32 %5, %4
  store i32 %6, ptr %0, align 4, !tbaa !21
  %7 = load i32, ptr %2, align 4, !tbaa !21
  %8 = sub i32 %6, %7
  store i32 %8, ptr %0, align 4, !tbaa !21
  %9 = load i32, ptr %2, align 4, !tbaa !21
  %10 = lshr i32 %9, 13
  %11 = xor i32 %10, %8
  store i32 %11, ptr %0, align 4, !tbaa !21
  %12 = load i32, ptr %2, align 4, !tbaa !21
  %13 = load i32, ptr %1, align 4, !tbaa !21
  %14 = sub i32 %13, %12
  store i32 %14, ptr %1, align 4, !tbaa !21
  %15 = load i32, ptr %0, align 4, !tbaa !21
  %16 = sub i32 %14, %15
  store i32 %16, ptr %1, align 4, !tbaa !21
  %17 = load i32, ptr %0, align 4, !tbaa !21
  %18 = shl i32 %17, 8
  %19 = xor i32 %18, %16
  store i32 %19, ptr %1, align 4, !tbaa !21
  %20 = load i32, ptr %0, align 4, !tbaa !21
  %21 = load i32, ptr %2, align 4, !tbaa !21
  %22 = sub i32 %21, %20
  store i32 %22, ptr %2, align 4, !tbaa !21
  %23 = load i32, ptr %1, align 4, !tbaa !21
  %24 = sub i32 %22, %23
  store i32 %24, ptr %2, align 4, !tbaa !21
  %25 = load i32, ptr %1, align 4, !tbaa !21
  %26 = lshr i32 %25, 13
  %27 = xor i32 %26, %24
  store i32 %27, ptr %2, align 4, !tbaa !21
  %28 = load i32, ptr %1, align 4, !tbaa !21
  %29 = load i32, ptr %0, align 4, !tbaa !21
  %30 = sub i32 %29, %28
  store i32 %30, ptr %0, align 4, !tbaa !21
  %31 = load i32, ptr %2, align 4, !tbaa !21
  %32 = sub i32 %30, %31
  store i32 %32, ptr %0, align 4, !tbaa !21
  %33 = load i32, ptr %2, align 4, !tbaa !21
  %34 = lshr i32 %33, 12
  %35 = xor i32 %34, %32
  store i32 %35, ptr %0, align 4, !tbaa !21
  %36 = load i32, ptr %2, align 4, !tbaa !21
  %37 = load i32, ptr %1, align 4, !tbaa !21
  %38 = sub i32 %37, %36
  store i32 %38, ptr %1, align 4, !tbaa !21
  %39 = load i32, ptr %0, align 4, !tbaa !21
  %40 = sub i32 %38, %39
  store i32 %40, ptr %1, align 4, !tbaa !21
  %41 = load i32, ptr %0, align 4, !tbaa !21
  %42 = shl i32 %41, 16
  %43 = xor i32 %42, %40
  store i32 %43, ptr %1, align 4, !tbaa !21
  %44 = load i32, ptr %0, align 4, !tbaa !21
  %45 = load i32, ptr %2, align 4, !tbaa !21
  %46 = sub i32 %45, %44
  store i32 %46, ptr %2, align 4, !tbaa !21
  %47 = load i32, ptr %1, align 4, !tbaa !21
  %48 = sub i32 %46, %47
  store i32 %48, ptr %2, align 4, !tbaa !21
  %49 = load i32, ptr %1, align 4, !tbaa !21
  %50 = lshr i32 %49, 5
  %51 = xor i32 %50, %48
  store i32 %51, ptr %2, align 4, !tbaa !21
  %52 = load i32, ptr %1, align 4, !tbaa !21
  %53 = load i32, ptr %0, align 4, !tbaa !21
  %54 = sub i32 %53, %52
  store i32 %54, ptr %0, align 4, !tbaa !21
  %55 = load i32, ptr %2, align 4, !tbaa !21
  %56 = sub i32 %54, %55
  store i32 %56, ptr %0, align 4, !tbaa !21
  %57 = load i32, ptr %2, align 4, !tbaa !21
  %58 = lshr i32 %57, 3
  %59 = xor i32 %58, %56
  store i32 %59, ptr %0, align 4, !tbaa !21
  %60 = load i32, ptr %2, align 4, !tbaa !21
  %61 = load i32, ptr %1, align 4, !tbaa !21
  %62 = sub i32 %61, %60
  store i32 %62, ptr %1, align 4, !tbaa !21
  %63 = load i32, ptr %0, align 4, !tbaa !21
  %64 = sub i32 %62, %63
  store i32 %64, ptr %1, align 4, !tbaa !21
  %65 = load i32, ptr %0, align 4, !tbaa !21
  %66 = shl i32 %65, 10
  %67 = xor i32 %66, %64
  store i32 %67, ptr %1, align 4, !tbaa !21
  %68 = load i32, ptr %0, align 4, !tbaa !21
  %69 = load i32, ptr %2, align 4, !tbaa !21
  %70 = sub i32 %69, %68
  store i32 %70, ptr %2, align 4, !tbaa !21
  %71 = load i32, ptr %1, align 4, !tbaa !21
  %72 = sub i32 %70, %71
  store i32 %72, ptr %2, align 4, !tbaa !21
  %73 = load i32, ptr %1, align 4, !tbaa !21
  %74 = lshr i32 %73, 15
  %75 = xor i32 %74, %72
  store i32 %75, ptr %2, align 4, !tbaa !21
  ret void
}

; Function Attrs: mustprogress noinline noreturn ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__120__throw_out_of_rangeB7v160006EPKc(ptr noundef %0) local_unnamed_addr #5 personality ptr @__gxx_personality_v0 {
  %2 = tail call ptr @__cxa_allocate_exception(i64 16) #24
  %3 = invoke noundef ptr @_ZNSt12out_of_rangeC1B7v160006EPKc(ptr noundef nonnull align 8 dereferenceable(16) %2, ptr noundef %0)
          to label %4 unwind label %5

4:                                                ; preds = %1
  tail call void @__cxa_throw(ptr nonnull %2, ptr nonnull @_ZTISt12out_of_range, ptr nonnull @_ZNSt12out_of_rangeD1Ev) #25
  unreachable

5:                                                ; preds = %1
  %6 = landingpad { ptr, i32 }
          cleanup
  tail call void @__cxa_free_exception(ptr %2) #24
  resume { ptr, i32 } %6
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__117basic_string_viewIcNS_11char_traitsIcEEEC2B7v160006Ev(ptr noundef nonnull returned align 8 dereferenceable(16) %0) unnamed_addr #2 align 2 {
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %0, i8 0, i64 16, i1 false)
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__117basic_string_viewIcNS_11char_traitsIcEEEC2B7v160006EPKcm(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1, i64 noundef %2) unnamed_addr #2 align 2 {
  store ptr %1, ptr %0, align 8, !tbaa !14
  %4 = getelementptr inbounds %"class.std::__1::basic_string_view", ptr %0, i64 0, i32 1
  store i64 %2, ptr %4, align 8, !tbaa !18
  %5 = icmp eq i64 %2, 0
  %6 = icmp ne ptr %1, null
  %7 = or i1 %6, %5
  tail call void @llvm.assume(i1 %7)
  ret ptr %0
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B7v160006EPKcm(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef %1, i64 noundef %2) unnamed_addr #0 align 2 {
  %4 = alloca %"struct.std::__1::__default_init_tag", align 1
  %5 = alloca %"struct.std::__1::__default_init_tag", align 1
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %4) #24
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %5) #24
  %6 = call noundef ptr @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC1B7v160006INS_18__default_init_tagESA_EEOT_OT0_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 1 dereferenceable(1) %4, ptr noundef nonnull align 1 dereferenceable(1) %5)
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %5) #24
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %4) #24
  %7 = icmp eq i64 %2, 0
  %8 = icmp ne ptr %1, null
  %9 = or i1 %8, %7
  call void @llvm.assume(i1 %9)
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEPKcm(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1, i64 noundef %2)
  call void @_ZNSt3__119__debug_db_insert_cB7v160006INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEvPT_(ptr noundef nonnull %0)
  ret ptr %0
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC1B7v160006INS_18__default_init_tagESA_EEOT_OT0_(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef nonnull align 1 dereferenceable(1) %1, ptr noundef nonnull align 1 dereferenceable(1) %2) unnamed_addr #0 align 2 {
  %4 = tail call noundef ptr @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC2B7v160006INS_18__default_init_tagESA_EEOT_OT0_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 1 dereferenceable(1) %1, ptr noundef nonnull align 1 dereferenceable(1) %2)
  ret ptr %0
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
declare void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEPKcm(ptr noundef nonnull align 8 dereferenceable(24), ptr noundef, i64 noundef) local_unnamed_addr #4 align 2

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__119__debug_db_insert_cB7v160006INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEvPT_(ptr noundef %0) local_unnamed_addr #7 {
  ret void
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC2B7v160006INS_18__default_init_tagESA_EEOT_OT0_(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef nonnull align 1 dereferenceable(1) %1, ptr noundef nonnull align 1 dereferenceable(1) %2) unnamed_addr #0 align 2 {
  %4 = tail call noundef ptr @_ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EEC2B7v160006ENS_18__default_init_tagE(ptr noundef nonnull align 8 dereferenceable(24) %0)
  %5 = tail call noundef ptr @_ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EEC2B7v160006ENS_18__default_init_tagE(ptr noundef nonnull align 1 dereferenceable(1) %0)
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EEC2B7v160006ENS_18__default_init_tagE(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #2 align 2 {
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EEC2B7v160006ENS_18__default_init_tagE(ptr noundef nonnull returned align 1 dereferenceable(1) %0) unnamed_addr #2 align 2 {
  %2 = tail call noundef ptr @_ZNSt3__19allocatorIcEC2B7v160006Ev(ptr noundef nonnull align 1 dereferenceable(1) %0) #24
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__19allocatorIcEC2B7v160006Ev(ptr noundef nonnull returned align 1 dereferenceable(1) %0) unnamed_addr #2 align 2 {
  %2 = tail call noundef ptr @_ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIcEEEC2B7v160006Ev(ptr noundef nonnull align 1 dereferenceable(1) %0) #24
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIcEEEC2B7v160006Ev(ptr noundef nonnull returned align 1 dereferenceable(1) %0) unnamed_addr #2 align 2 {
  ret ptr %0
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE8max_sizeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef nonnull align 1 dereferenceable(1) ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7__allocB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %3 = tail call noundef i64 @_ZNSt3__116allocator_traitsINS_9allocatorIcEEE8max_sizeB7v160006IS2_vEEmRKS2_(ptr noundef nonnull align 1 dereferenceable(1) %2) #24
  %4 = tail call noundef i64 @_ZNSt3__114numeric_limitsImE3maxB7v160006Ev() #24
  %5 = lshr i64 %4, 1
  %6 = icmp ugt i64 %3, %5
  %7 = zext i1 %6 to i64
  %8 = lshr i64 %3, %7
  %9 = add i64 %8, -16
  ret i64 %9
}

; Function Attrs: mustprogress noinline noreturn ssp uwtable(sync)
define linkonce_odr hidden void @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #5 align 2 {
  tail call void @_ZNSt3__120__throw_length_errorB7v160006EPKc(ptr noundef nonnull @.str.55) #25
  unreachable
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef zeroext i1 @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__fits_in_ssoB7v160006Em(i64 noundef %0) local_unnamed_addr #7 align 2 {
  %2 = icmp ult i64 %0, 23
  ret i1 %2
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16__set_short_sizeB7v160006Em(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) local_unnamed_addr #7 align 2 {
  %3 = icmp ult i64 %1, 23
  tail call void @llvm.assume(i1 %3)
  %4 = trunc i64 %1 to i8
  %5 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %6 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short", ptr %5, i64 0, i32 2
  %7 = load i8, ptr %6, align 1
  %8 = and i8 %7, -128
  %9 = or i8 %8, %4
  store i8 %9, ptr %6, align 1
  %10 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %11 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short", ptr %10, i64 0, i32 2
  %12 = load i8, ptr %11, align 1
  %13 = and i8 %12, 127
  store i8 %13, ptr %11, align 1
  ret void
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7__allocB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E6secondB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  ret ptr %2
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE11__recommendB7v160006Em(i64 noundef %0) local_unnamed_addr #7 align 2 {
  %2 = icmp ult i64 %0, 23
  br i1 %2, label %9, label %3

3:                                                ; preds = %1
  %4 = add i64 %0, 1
  %5 = tail call noundef i64 @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE10__align_itB7v160006ILm16EEEmm(i64 noundef %4) #24
  %6 = add i64 %5, -1
  %7 = icmp eq i64 %6, 23
  %8 = select i1 %7, i64 %5, i64 %6
  br label %9

9:                                                ; preds = %1, %3
  %10 = phi i64 [ %8, %3 ], [ 22, %1 ]
  ret i64 %10
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16__begin_lifetimeB7v160006EPcm(ptr noundef %0, i64 noundef %1) local_unnamed_addr #7 align 2 {
  ret void
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__set_long_pointerB7v160006EPc(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1) local_unnamed_addr #7 align 2 {
  %3 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  store ptr %1, ptr %3, align 8, !tbaa !5
  ret void
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE14__set_long_capB7v160006Em(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) local_unnamed_addr #7 align 2 {
  %3 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %4 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__long", ptr %3, i64 0, i32 2
  %5 = load i64, ptr %4, align 8
  %6 = and i64 %1, 9223372036854775807
  %7 = and i64 %5, -9223372036854775808
  %8 = or i64 %7, %6
  store i64 %8, ptr %4, align 8
  %9 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %10 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__long", ptr %9, i64 0, i32 2
  %11 = load i64, ptr %10, align 8
  %12 = or i64 %11, -9223372036854775808
  store i64 %12, ptr %10, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE15__set_long_sizeB7v160006Em(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) local_unnamed_addr #7 align 2 {
  %3 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %4 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__long", ptr %3, i64 0, i32 1
  store i64 %1, ptr %4, align 8, !tbaa !5
  ret void
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i64 @_ZNSt3__116allocator_traitsINS_9allocatorIcEEE8max_sizeB7v160006IS2_vEEmRKS2_(ptr noundef nonnull align 1 dereferenceable(1) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef i64 @_ZNKSt3__19allocatorIcE8max_sizeB7v160006Ev(ptr noundef nonnull align 1 dereferenceable(1) %0) #24
  ret i64 %2
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 1 dereferenceable(1) ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7__allocB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef nonnull align 1 dereferenceable(1) ptr @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E6secondB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  ret ptr %2
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNSt3__114numeric_limitsImE3maxB7v160006Ev() local_unnamed_addr #7 align 2 {
  %1 = tail call noundef i64 @_ZNSt3__123__libcpp_numeric_limitsImLb1EE3maxB7v160006Ev() #24
  ret i64 %1
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNKSt3__19allocatorIcE8max_sizeB7v160006Ev(ptr noundef nonnull align 1 dereferenceable(1) %0) local_unnamed_addr #7 align 2 {
  ret i64 -1
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 1 dereferenceable(1) ptr @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E6secondB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef nonnull align 1 dereferenceable(1) ptr @_ZNKSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EE5__getB7v160006Ev(ptr noundef nonnull align 1 dereferenceable(1) %0) #24
  ret ptr %2
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 1 dereferenceable(1) ptr @_ZNKSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EE5__getB7v160006Ev(ptr noundef nonnull align 1 dereferenceable(1) %0) local_unnamed_addr #7 align 2 {
  ret ptr %0
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNSt3__123__libcpp_numeric_limitsImLb1EE3maxB7v160006Ev() local_unnamed_addr #7 align 2 {
  ret i64 -1
}

; Function Attrs: mustprogress noinline noreturn ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__120__throw_length_errorB7v160006EPKc(ptr noundef %0) local_unnamed_addr #5 personality ptr @__gxx_personality_v0 {
  %2 = tail call ptr @__cxa_allocate_exception(i64 16) #24
  %3 = invoke noundef ptr @_ZNSt12length_errorC1B7v160006EPKc(ptr noundef nonnull align 8 dereferenceable(16) %2, ptr noundef %0)
          to label %4 unwind label %5

4:                                                ; preds = %1
  tail call void @__cxa_throw(ptr nonnull %2, ptr nonnull @_ZTISt12length_error, ptr nonnull @_ZNSt12length_errorD1Ev) #25
  unreachable

5:                                                ; preds = %1
  %6 = landingpad { ptr, i32 }
          cleanup
  tail call void @__cxa_free_exception(ptr %2) #24
  resume { ptr, i32 } %6
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt12length_errorC1B7v160006EPKc(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #0 align 2 {
  %3 = tail call noundef ptr @_ZNSt12length_errorC2B7v160006EPKc(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef %1)
  ret ptr %0
}

; Function Attrs: nounwind
declare noundef ptr @_ZNSt12length_errorD1Ev(ptr noundef nonnull returned align 8 dereferenceable(16)) unnamed_addr #6

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt12length_errorC2B7v160006EPKc(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #0 align 2 {
  %3 = tail call noundef ptr @_ZNSt11logic_errorC2EPKc(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef %1)
  store ptr getelementptr inbounds ({ [5 x ptr] }, ptr @_ZTVSt12length_error, i64 0, inrange i32 0, i64 2), ptr %0, align 8, !tbaa !53
  ret ptr %0
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__19allocatorIcE8allocateB7v160006Em(ptr noundef nonnull align 1 dereferenceable(1) %0, i64 noundef %1) local_unnamed_addr #4 align 2 {
  %3 = tail call noundef i64 @_ZNSt3__116allocator_traitsINS_9allocatorIcEEE8max_sizeB7v160006IS2_vEEmRKS2_(ptr noundef nonnull align 1 dereferenceable(1) %0) #24
  %4 = icmp ult i64 %3, %1
  br i1 %4, label %5, label %6

5:                                                ; preds = %2
  tail call void @_ZSt28__throw_bad_array_new_lengthB7v160006v() #25
  unreachable

6:                                                ; preds = %2
  %7 = tail call noundef ptr @_ZNSt3__117__libcpp_allocateB7v160006Emm(i64 noundef %1, i64 noundef 1)
  ret ptr %7
}

; Function Attrs: mustprogress noinline noreturn ssp uwtable(sync)
define linkonce_odr hidden void @_ZSt28__throw_bad_array_new_lengthB7v160006v() local_unnamed_addr #5 {
  %1 = tail call ptr @__cxa_allocate_exception(i64 8) #24
  %2 = tail call noundef ptr @_ZNSt20bad_array_new_lengthC1Ev(ptr noundef nonnull align 8 dereferenceable(8) %1) #24
  tail call void @__cxa_throw(ptr nonnull %1, ptr nonnull @_ZTISt20bad_array_new_length, ptr nonnull @_ZNSt20bad_array_new_lengthD1Ev) #25
  unreachable
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__117__libcpp_allocateB7v160006Emm(i64 noundef %0, i64 noundef %1) local_unnamed_addr #4 {
  %3 = tail call noundef zeroext i1 @_ZNSt3__124__is_overaligned_for_newB7v160006Em(i64 noundef %1) #24
  br i1 %3, label %4, label %6

4:                                                ; preds = %2
  %5 = tail call noundef ptr @_ZNSt3__121__libcpp_operator_newB7v160006IJmSt11align_val_tEEEPvDpT_(i64 noundef %0, i64 noundef %1)
  br label %8

6:                                                ; preds = %2
  %7 = tail call noundef ptr @_ZNSt3__121__libcpp_operator_newB7v160006IJmEEEPvDpT_(i64 noundef %0)
  br label %8

8:                                                ; preds = %6, %4
  %9 = phi ptr [ %5, %4 ], [ %7, %6 ]
  ret ptr %9
}

; Function Attrs: nounwind
declare noundef ptr @_ZNSt20bad_array_new_lengthC1Ev(ptr noundef nonnull returned align 8 dereferenceable(8)) unnamed_addr #6

; Function Attrs: nounwind
declare noundef ptr @_ZNSt20bad_array_new_lengthD1Ev(ptr noundef nonnull returned align 8 dereferenceable(8)) unnamed_addr #6

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef zeroext i1 @_ZNSt3__124__is_overaligned_for_newB7v160006Em(i64 noundef %0) local_unnamed_addr #7 {
  %2 = icmp ugt i64 %0, 16
  ret i1 %2
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__121__libcpp_operator_newB7v160006IJmSt11align_val_tEEEPvDpT_(i64 noundef %0, i64 noundef %1) local_unnamed_addr #4 {
  %3 = tail call noalias noundef nonnull ptr @_ZnwmSt11align_val_t(i64 noundef %0, i64 noundef %1) #31
  ; FIXME
  ; call void @llvm.assume(i1 true) [ "align"(ptr %3, i64 %1) ]
  ret ptr %3
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__121__libcpp_operator_newB7v160006IJmEEEPvDpT_(i64 noundef %0) local_unnamed_addr #4 {
  %2 = tail call noalias noundef nonnull ptr @_Znwm(i64 noundef %0) #31
  ret ptr %2
}

; Function Attrs: nobuiltin allocsize(0)
declare noundef nonnull ptr @_ZnwmSt11align_val_t(i64 noundef, i64 noundef) local_unnamed_addr #21

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E6secondB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EE5__getB7v160006Ev(ptr noundef nonnull align 1 dereferenceable(1) %0) #24
  ret ptr %2
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EE5__getB7v160006Ev(ptr noundef nonnull align 1 dereferenceable(1) %0) local_unnamed_addr #7 align 2 {
  ret ptr %0
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i64 @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE10__align_itB7v160006ILm16EEEmm(i64 noundef %0) local_unnamed_addr #7 align 2 {
  %2 = add i64 %0, 15
  %3 = and i64 %2, -16
  ret i64 %3
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE14__get_long_capB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %3 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__long", ptr %2, i64 0, i32 2
  %4 = load i64, ptr %3, align 8
  %5 = and i64 %4, 9223372036854775807
  ret i64 %5
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__119__libcpp_deallocateB7v160006EPvmm(ptr noundef %0, i64 noundef %1, i64 noundef %2) local_unnamed_addr #4 {
  %4 = tail call noundef zeroext i1 @_ZNSt3__124__is_overaligned_for_newB7v160006Em(i64 noundef %2) #24
  br i1 %4, label %5, label %6

5:                                                ; preds = %3
  tail call void @_ZNSt3__127__do_deallocate_handle_sizeB7v160006IJSt11align_val_tEEEvPvmDpT_(ptr noundef %0, i64 noundef %1, i64 noundef %2)
  br label %7

6:                                                ; preds = %3
  tail call void @_ZNSt3__127__do_deallocate_handle_sizeB7v160006IJEEEvPvmDpT_(ptr noundef %0, i64 noundef %1)
  br label %7

7:                                                ; preds = %6, %5
  ret void
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__127__do_deallocate_handle_sizeB7v160006IJSt11align_val_tEEEvPvmDpT_(ptr noundef %0, i64 noundef %1, i64 noundef %2) local_unnamed_addr #4 {
  tail call void @_ZNSt3__124__libcpp_operator_deleteB7v160006IJPvSt11align_val_tEEEvDpT_(ptr noundef %0, i64 noundef %2)
  ret void
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__127__do_deallocate_handle_sizeB7v160006IJEEEvPvmDpT_(ptr noundef %0, i64 noundef %1) local_unnamed_addr #4 {
  tail call void @_ZNSt3__124__libcpp_operator_deleteB7v160006IJPvEEEvDpT_(ptr noundef %0)
  ret void
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__124__libcpp_operator_deleteB7v160006IJPvSt11align_val_tEEEvDpT_(ptr noundef %0, i64 noundef %1) local_unnamed_addr #7 {
  tail call void @_ZdlPvSt11align_val_t(ptr noundef %0, i64 noundef %1) #30
  ret void
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPvSt11align_val_t(ptr noundef, i64 noundef) local_unnamed_addr #19

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__124__libcpp_operator_deleteB7v160006IJPvEEEvDpT_(ptr noundef %0) local_unnamed_addr #7 {
  tail call void @_ZdlPv(ptr noundef %0) #30
  ret void
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvEC2Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #2 align 2 personality ptr @__gxx_personality_v0 {
  %2 = tail call noundef ptr @_ZN5boost9container13new_allocatorIcEC2Ev(ptr noundef nonnull align 1 dereferenceable(1) %0) #24
  store i8 1, ptr %0, align 8
  %3 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %0, i64 0, i32 1
  %4 = tail call noundef ptr @_ZnwmPv21boost_container_new_t(i64 noundef 1, ptr noundef nonnull %3)
  store i8 0, ptr %4, align 1, !tbaa !5
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container13new_allocatorIcEC2Ev(ptr noundef nonnull returned align 1 dereferenceable(1) %0) unnamed_addr #2 align 2 {
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvED2Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #2 align 2 personality ptr @__gxx_personality_v0 {
  %2 = load i8, ptr %0, align 8, !tbaa !5
  %3 = and i8 %2, 1
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %5, label %10

5:                                                ; preds = %1
  %6 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 2
  %7 = load ptr, ptr %6, align 8, !tbaa !55
  %8 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 1
  %9 = load i64, ptr %8, align 8, !tbaa !57
  tail call void @_ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE10deallocateEPcm(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %7, i64 noundef %9)
  br label %10

10:                                               ; preds = %1, %5
  ret ptr %0
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef nonnull align 1 dereferenceable(1) ptr @_ZN5boost9container13new_allocatorIcEaSERKS2_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef nonnull align 1 dereferenceable(1) %1) local_unnamed_addr #7 align 2 {
  ret ptr %0
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B7v160006IDnEEPKc(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef %1) unnamed_addr #0 align 2 {
  %3 = alloca %"struct.std::__1::__default_init_tag", align 1
  %4 = alloca %"struct.std::__1::__default_init_tag", align 1
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %3) #24
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %4) #24
  %5 = call noundef ptr @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC1B7v160006INS_18__default_init_tagESA_EEOT_OT0_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 1 dereferenceable(1) %3, ptr noundef nonnull align 1 dereferenceable(1) %4)
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %4) #24
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %3) #24
  %6 = icmp ne ptr %1, null
  call void @llvm.assume(i1 %6)
  %7 = call noundef i64 @_ZNSt3__111char_traitsIcE6lengthEPKc(ptr noundef nonnull %1) #24
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEPKcm(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull %1, i64 noundef %7)
  call void @_ZNSt3__119__debug_db_insert_cB7v160006INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEvPT_(ptr noundef nonnull %0)
  ret ptr %0
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE17__destruct_at_endB7v160006EPS6_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1) local_unnamed_addr #7 align 2 personality ptr @__gxx_personality_v0 {
  tail call void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE27__invalidate_iterators_pastB7v160006EPS6_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1)
  %3 = tail call noundef i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4sizeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  tail call void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE22__base_destruct_at_endB7v160006EPS6_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1) #24
  tail call void @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE17__annotate_shrinkB7v160006Em(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %3) #24
  ret void
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE27__invalidate_iterators_pastB7v160006EPS6_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1) local_unnamed_addr #7 align 2 {
  ret void
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE22__base_destruct_at_endB7v160006EPS6_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1) local_unnamed_addr #7 align 2 personality ptr @__gxx_personality_v0 {
  %3 = getelementptr inbounds %"class.std::__1::vector", ptr %0, i64 0, i32 1
  %4 = load ptr, ptr %3, align 8, !tbaa !35
  br label %5

5:                                                ; preds = %8, %2
  %6 = phi ptr [ %4, %2 ], [ %10, %8 ]
  %7 = icmp eq ptr %6, %1
  br i1 %7, label %12, label %8

8:                                                ; preds = %5
  %9 = tail call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE7__allocB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %10 = getelementptr inbounds %"class.std::__1::basic_string", ptr %6, i64 -1
  %11 = tail call noundef ptr @_ZNSt3__112__to_addressB7v160006INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEPT_S8_(ptr noundef nonnull %10) #24
  invoke void @_ZNSt3__116allocator_traitsINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEE7destroyB7v160006IS6_vEEvRS7_PT_(ptr noundef nonnull align 1 dereferenceable(1) %9, ptr noundef %11)
          to label %5 unwind label %13, !llvm.loop !74

12:                                               ; preds = %5
  store ptr %1, ptr %3, align 8, !tbaa !35
  ret void

13:                                               ; preds = %8
  %14 = landingpad { ptr, i32 }
          catch ptr null
  %15 = extractvalue { ptr, i32 } %14, 0
  tail call void @__clang_call_terminate(ptr %15) #27
  unreachable
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden void @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE17__annotate_shrinkB7v160006Em(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) local_unnamed_addr #7 align 2 {
  %3 = tail call noundef ptr @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4dataB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %4 = tail call noundef ptr @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4dataB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %5 = tail call noundef i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE8capacityB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %6 = getelementptr inbounds %"class.std::__1::basic_string", ptr %4, i64 %5
  %7 = tail call noundef ptr @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4dataB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %8 = getelementptr inbounds %"class.std::__1::basic_string", ptr %7, i64 %1
  %9 = tail call noundef ptr @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4dataB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %10 = tail call noundef i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4sizeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %11 = getelementptr inbounds %"class.std::__1::basic_string", ptr %9, i64 %10
  tail call void @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE31__annotate_contiguous_containerB7v160006EPKvSA_SA_SA_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %3, ptr noundef %6, ptr noundef %8, ptr noundef %11) #24
  ret void
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr void @_ZNSt3__116allocator_traitsINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEE7destroyB7v160006IS6_vEEvRS7_PT_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %1) local_unnamed_addr #4 align 2 {
  tail call void @_ZNSt3__19allocatorINS_12basic_stringIcNS_11char_traitsIcEENS0_IcEEEEE7destroyB7v160006EPS5_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %1)
  ret void
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE7__allocB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::vector", ptr %0, i64 0, i32 2
  %3 = tail call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE6secondB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(8) %2) #24
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__112__to_addressB7v160006INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEPT_S8_(ptr noundef %0) local_unnamed_addr #7 {
  ret ptr %0
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__19allocatorINS_12basic_stringIcNS_11char_traitsIcEENS0_IcEEEEE7destroyB7v160006EPS5_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %1) local_unnamed_addr #7 align 2 {
  %3 = tail call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %1) #24
  ret void
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE6secondB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__122__compressed_pair_elemINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEELi1ELb1EE5__getB7v160006Ev(ptr noundef nonnull align 1 dereferenceable(1) %0) #24
  ret ptr %2
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__122__compressed_pair_elemINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEELi1ELb1EE5__getB7v160006Ev(ptr noundef nonnull align 1 dereferenceable(1) %0) local_unnamed_addr #7 align 2 {
  ret ptr %0
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden void @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE31__annotate_contiguous_containerB7v160006EPKvSA_SA_SA_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4) local_unnamed_addr #7 align 2 {
  ret void
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4dataB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = load ptr, ptr %0, align 8, !tbaa !39
  %3 = tail call noundef ptr @_ZNSt3__112__to_addressB7v160006INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEPT_S8_(ptr noundef %2) #24
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE8capacityB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE9__end_capB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %3 = load ptr, ptr %2, align 8, !tbaa !43
  %4 = load ptr, ptr %0, align 8, !tbaa !39
  %5 = ptrtoint ptr %3 to i64
  %6 = ptrtoint ptr %4 to i64
  %7 = sub i64 %5, %6
  %8 = sdiv exact i64 %7, 24
  ret i64 %8
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE9__end_capB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::vector", ptr %0, i64 0, i32 2
  %3 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(8) %2) #24
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__122__compressed_pair_elemIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEELi0ELb0EE5__getB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) #24
  ret ptr %2
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__122__compressed_pair_elemIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEELi0ELb0EE5__getB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) local_unnamed_addr #7 align 2 {
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B7v160006Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #2 align 2 personality ptr @__gxx_personality_v0 {
  %2 = alloca %"struct.std::__1::__default_init_tag", align 1
  %3 = alloca %"struct.std::__1::__default_init_tag", align 1
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %2) #24
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %3) #24
  %4 = invoke noundef ptr @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC1B7v160006INS_18__default_init_tagESA_EEOT_OT0_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 1 dereferenceable(1) %2, ptr noundef nonnull align 1 dereferenceable(1) %3)
          to label %5 unwind label %6

5:                                                ; preds = %1
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %3) #24
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %2) #24
  call void @_ZNSt3__119__debug_db_insert_cB7v160006INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEvPT_(ptr noundef nonnull %0)
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE14__default_initB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0)
  ret ptr %0

6:                                                ; preds = %1
  %7 = landingpad { ptr, i32 }
          catch ptr null
  %8 = extractvalue { ptr, i32 } %7, 0
  call void @__clang_call_terminate(ptr %8) #27
  unreachable
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE14__default_initB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %2, i8 0, i64 24, i1 false)
  ret void
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #22

declare noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKc(ptr noundef nonnull align 8 dereferenceable(24), ptr noundef) local_unnamed_addr #8

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendB7v160006ERKS5_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) local_unnamed_addr #4 align 2 {
  %3 = tail call noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %1) #24
  %4 = tail call noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %1) #24
  %5 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKcm(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %3, i64 noundef %4)
  ret ptr %5
}

declare noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKcm(ptr noundef nonnull align 8 dereferenceable(24), ptr noundef, i64 noundef) local_unnamed_addr #8

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %3 = tail call noundef ptr @_ZNSt3__112__to_addressB7v160006IKcEEPT_S3_(ptr noundef %2) #24
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef zeroext i1 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  br i1 %2, label %3, label %5

3:                                                ; preds = %1
  %4 = tail call noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  br label %7

5:                                                ; preds = %1
  %6 = tail call noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  br label %7

7:                                                ; preds = %5, %3
  %8 = phi ptr [ %4, %3 ], [ %6, %5 ]
  ret ptr %8
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %3 = load ptr, ptr %2, align 8, !tbaa !5
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %3 = tail call noundef ptr @_ZNSt3__114pointer_traitsIPKcE10pointer_toB7v160006ERS1_(ptr noundef nonnull align 1 dereferenceable(1) %2) #24
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__114pointer_traitsIPKcE10pointer_toB7v160006ERS1_(ptr noundef nonnull align 1 dereferenceable(1) %0) local_unnamed_addr #7 align 2 {
  ret ptr %0
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__124__put_character_sequenceB7v160006IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef %1, i64 noundef %2) local_unnamed_addr #4 personality ptr @__gxx_personality_v0 {
  %4 = alloca %"class.std::__1::basic_ostream<char>::sentry", align 8
  %5 = alloca %"class.std::__1::ostreambuf_iterator", align 8
  %6 = alloca %"class.std::__1::ostreambuf_iterator", align 8
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %4) #24
  %7 = invoke noundef ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_(ptr noundef nonnull align 8 dereferenceable(16) %4, ptr noundef nonnull align 8 dereferenceable(8) %0)
          to label %8 unwind label %38

8:                                                ; preds = %3
  %9 = call noundef zeroext i1 @_ZNKSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentrycvbB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %4)
  br i1 %9, label %10, label %44

10:                                               ; preds = %8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %5) #24
  %11 = call noundef ptr @_ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC1B7v160006ERNS_13basic_ostreamIcS2_EE(ptr noundef nonnull align 8 dereferenceable(8) %6, ptr noundef nonnull align 8 dereferenceable(8) %0) #24
  %12 = load ptr, ptr %0, align 8, !tbaa !53
  %13 = getelementptr i8, ptr %12, i64 -24
  %14 = load i64, ptr %13, align 8
  %15 = getelementptr inbounds i8, ptr %0, i64 %14
  %16 = call noundef i32 @_ZNKSt3__18ios_base5flagsB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(136) %15)
  %17 = load ptr, ptr %0, align 8, !tbaa !53
  %18 = getelementptr i8, ptr %17, i64 -24
  %19 = load i64, ptr %18, align 8
  %20 = getelementptr inbounds i8, ptr %0, i64 %19
  %21 = invoke noundef signext i8 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE4fillB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(148) %20)
          to label %22 unwind label %42

22:                                               ; preds = %10
  %23 = and i32 %16, 176
  %24 = icmp eq i32 %23, 32
  %25 = getelementptr inbounds i8, ptr %1, i64 %2
  %26 = select i1 %24, ptr %25, ptr %1
  %27 = load ptr, ptr %6, align 8
  %28 = ptrtoint ptr %27 to i64
  %29 = invoke i64 @_ZNSt3__116__pad_and_outputB7v160006IcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_(i64 %28, ptr noundef %1, ptr noundef %26, ptr noundef %25, ptr noundef nonnull align 8 dereferenceable(136) %20, i8 noundef signext %21)
          to label %30 unwind label %42

30:                                               ; preds = %22
  %31 = inttoptr i64 %29 to ptr
  store ptr %31, ptr %5, align 8
  %32 = call noundef zeroext i1 @_ZNKSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEE6failedB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(8) %5) #24
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %5) #24
  br i1 %32, label %33, label %44

33:                                               ; preds = %30
  %34 = load ptr, ptr %0, align 8, !tbaa !53
  %35 = getelementptr i8, ptr %34, i64 -24
  %36 = load i64, ptr %35, align 8
  %37 = getelementptr inbounds i8, ptr %0, i64 %36
  invoke void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateB7v160006Ej(ptr noundef nonnull align 8 dereferenceable(148) %37, i32 noundef 5)
          to label %44 unwind label %40

38:                                               ; preds = %3
  %39 = landingpad { ptr, i32 }
          catch ptr null
  br label %49

40:                                               ; preds = %33
  %41 = landingpad { ptr, i32 }
          catch ptr null
  br label %46

42:                                               ; preds = %22, %10
  %43 = landingpad { ptr, i32 }
          catch ptr null
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %5) #24
  br label %46

44:                                               ; preds = %30, %33, %8
  %45 = call noundef ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %4) #24
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %4) #24
  br label %58

46:                                               ; preds = %42, %40
  %47 = phi { ptr, i32 } [ %41, %40 ], [ %43, %42 ]
  %48 = call noundef ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %4) #24
  br label %49

49:                                               ; preds = %46, %38
  %50 = phi { ptr, i32 } [ %47, %46 ], [ %39, %38 ]
  %51 = extractvalue { ptr, i32 } %50, 0
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %4) #24
  %52 = call ptr @__cxa_begin_catch(ptr %51) #24
  %53 = load ptr, ptr %0, align 8, !tbaa !53
  %54 = getelementptr i8, ptr %53, i64 -24
  %55 = load i64, ptr %54, align 8
  %56 = getelementptr inbounds i8, ptr %0, i64 %55
  invoke void @_ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv(ptr noundef nonnull align 8 dereferenceable(136) %56)
          to label %57 unwind label %59

57:                                               ; preds = %49
  call void @__cxa_end_catch()
  br label %58

58:                                               ; preds = %57, %44
  ret ptr %0

59:                                               ; preds = %49
  %60 = landingpad { ptr, i32 }
          cleanup
  invoke void @__cxa_end_catch()
          to label %61 unwind label %62

61:                                               ; preds = %59
  resume { ptr, i32 } %60

62:                                               ; preds = %59
  %63 = landingpad { ptr, i32 }
          catch ptr null
  %64 = extractvalue { ptr, i32 } %63, 0
  call void @__clang_call_terminate(ptr %64) #27
  unreachable
}

declare noundef ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_(ptr noundef nonnull returned align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(8)) unnamed_addr #8

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef zeroext i1 @_ZNKSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentrycvbB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) local_unnamed_addr #7 align 2 {
  %2 = load i8, ptr %0, align 8, !tbaa !75, !range !78, !noundef !79
  %3 = icmp ne i8 %2, 0
  ret i1 %3
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNSt3__116__pad_and_outputB7v160006IcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_(i64 %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef nonnull align 8 dereferenceable(136) %4, i8 noundef signext %5) local_unnamed_addr #4 personality ptr @__gxx_personality_v0 {
  %7 = alloca %"class.std::__1::basic_string", align 8
  %8 = inttoptr i64 %0 to ptr
  %9 = icmp eq i64 %0, 0
  br i1 %9, label %46, label %10

10:                                               ; preds = %6
  %11 = ptrtoint ptr %3 to i64
  %12 = ptrtoint ptr %1 to i64
  %13 = sub i64 %11, %12
  %14 = tail call noundef i64 @_ZNKSt3__18ios_base5widthB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(136) %4)
  %15 = icmp sgt i64 %14, %13
  %16 = sub nsw i64 %14, %13
  %17 = select i1 %15, i64 %16, i64 0
  %18 = ptrtoint ptr %2 to i64
  %19 = sub i64 %18, %12
  %20 = icmp sgt i64 %19, 0
  br i1 %20, label %21, label %24

21:                                               ; preds = %10
  %22 = tail call noundef i64 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnB7v160006EPKcl(ptr noundef nonnull align 8 dereferenceable(64) %8, ptr noundef %1, i64 noundef %19)
  %23 = icmp eq i64 %22, %19
  br i1 %23, label %24, label %46

24:                                               ; preds = %21, %10
  %25 = icmp sgt i64 %17, 0
  br i1 %25, label %26, label %37

26:                                               ; preds = %24
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %7) #24
  %27 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B7v160006Emc(ptr noundef nonnull align 8 dereferenceable(24) %7, i64 noundef %17, i8 noundef signext %5)
  %28 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %7) #24
  %29 = invoke noundef i64 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnB7v160006EPKcl(ptr noundef nonnull align 8 dereferenceable(64) %8, ptr noundef %28, i64 noundef %17)
          to label %30 unwind label %34

30:                                               ; preds = %26
  %31 = icmp eq i64 %29, %17
  %32 = select i1 %31, ptr %8, ptr null
  %33 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %7) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %7) #24
  br i1 %31, label %37, label %46

34:                                               ; preds = %26
  %35 = landingpad { ptr, i32 }
          cleanup
  %36 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %7) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %7) #24
  resume { ptr, i32 } %35

37:                                               ; preds = %30, %24
  %38 = phi ptr [ %32, %30 ], [ %8, %24 ]
  %39 = sub i64 %11, %18
  %40 = icmp sgt i64 %39, 0
  br i1 %40, label %41, label %44

41:                                               ; preds = %37
  %42 = call noundef i64 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnB7v160006EPKcl(ptr noundef nonnull align 8 dereferenceable(64) %38, ptr noundef %2, i64 noundef %39)
  %43 = icmp eq i64 %42, %39
  br i1 %43, label %44, label %46

44:                                               ; preds = %41, %37
  %45 = call noundef i64 @_ZNSt3__18ios_base5widthB7v160006El(ptr noundef nonnull align 8 dereferenceable(136) %4, i64 noundef 0)
  br label %46

46:                                               ; preds = %44, %30, %21, %41, %6
  %47 = phi ptr [ null, %6 ], [ %38, %44 ], [ null, %30 ], [ null, %21 ], [ null, %41 ]
  %48 = ptrtoint ptr %47 to i64
  ret i64 %48
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC1B7v160006ERNS_13basic_ostreamIcS2_EE(ptr noundef nonnull returned align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) unnamed_addr #2 align 2 {
  %3 = tail call noundef ptr @_ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC2B7v160006ERNS_13basic_ostreamIcS2_EE(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #24
  ret ptr %0
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef i32 @_ZNKSt3__18ios_base5flagsB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(136) %0) local_unnamed_addr #7 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::ios_base", ptr %0, i64 0, i32 1
  %3 = load i32, ptr %2, align 8, !tbaa !80
  ret i32 %3
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef signext i8 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE4fillB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(148) %0) local_unnamed_addr #4 align 2 {
  %2 = tail call noundef i32 @_ZNSt3__111char_traitsIcE3eofEv() #24
  %3 = getelementptr inbounds %"class.std::__1::basic_ios", ptr %0, i64 0, i32 2
  %4 = load i32, ptr %3, align 8, !tbaa !82
  %5 = tail call noundef zeroext i1 @_ZNSt3__111char_traitsIcE11eq_int_typeEii(i32 noundef %2, i32 noundef %4) #24
  br i1 %5, label %6, label %9

6:                                                ; preds = %1
  %7 = tail call noundef signext i8 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenB7v160006Ec(ptr noundef nonnull align 8 dereferenceable(148) %0, i8 noundef signext 32)
  %8 = sext i8 %7 to i32
  store i32 %8, ptr %3, align 8, !tbaa !82
  br label %9

9:                                                ; preds = %6, %1
  %10 = load i32, ptr %3, align 8, !tbaa !82
  %11 = trunc i32 %10 to i8
  ret i8 %11
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef zeroext i1 @_ZNKSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEE6failedB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) local_unnamed_addr #7 align 2 {
  %2 = load ptr, ptr %0, align 8, !tbaa !84
  %3 = icmp eq ptr %2, null
  ret i1 %3
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateB7v160006Ej(ptr noundef nonnull align 8 dereferenceable(148) %0, i32 noundef %1) local_unnamed_addr #4 align 2 {
  tail call void @_ZNSt3__18ios_base8setstateB7v160006Ej(ptr noundef nonnull align 8 dereferenceable(136) %0, i32 noundef %1)
  ret void
}

; Function Attrs: nounwind
declare noundef ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev(ptr noundef nonnull returned align 8 dereferenceable(16)) unnamed_addr #6

declare void @_ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv(ptr noundef nonnull align 8 dereferenceable(136)) local_unnamed_addr #8

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNKSt3__18ios_base5widthB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(136) %0) local_unnamed_addr #7 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::ios_base", ptr %0, i64 0, i32 3
  %3 = load i64, ptr %2, align 8, !tbaa !86
  ret i64 %3
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnB7v160006EPKcl(ptr noundef nonnull align 8 dereferenceable(64) %0, ptr noundef %1, i64 noundef %2) local_unnamed_addr #4 align 2 {
  %4 = load ptr, ptr %0, align 8, !tbaa !53
  %5 = getelementptr inbounds ptr, ptr %4, i64 12
  %6 = load ptr, ptr %5, align 8
  %7 = tail call noundef i64 %6(ptr noundef nonnull align 8 dereferenceable(64) %0, ptr noundef %1, i64 noundef %2)
  ret i64 %7
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B7v160006Emc(ptr noundef nonnull returned align 8 dereferenceable(24) %0, i64 noundef %1, i8 noundef signext %2) unnamed_addr #0 align 2 {
  %4 = tail call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B7v160006Emc(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1, i8 noundef signext %2)
  ret ptr %0
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %3 = tail call noundef ptr @_ZNSt3__112__to_addressB7v160006IcEEPT_S2_(ptr noundef %2) #24
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNSt3__18ios_base5widthB7v160006El(ptr noundef nonnull align 8 dereferenceable(136) %0, i64 noundef %1) local_unnamed_addr #7 align 2 {
  %3 = getelementptr inbounds %"class.std::__1::ios_base", ptr %0, i64 0, i32 3
  %4 = load i64, ptr %3, align 8, !tbaa !86
  store i64 %1, ptr %3, align 8, !tbaa !86
  ret i64 %4
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B7v160006Emc(ptr noundef nonnull returned align 8 dereferenceable(24) %0, i64 noundef %1, i8 noundef signext %2) unnamed_addr #0 align 2 {
  %4 = alloca %"struct.std::__1::__default_init_tag", align 1
  %5 = alloca %"struct.std::__1::__default_init_tag", align 1
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %4) #24
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %5) #24
  %6 = call noundef ptr @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC1B7v160006INS_18__default_init_tagESA_EEOT_OT0_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 1 dereferenceable(1) %4, ptr noundef nonnull align 1 dereferenceable(1) %5)
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %5) #24
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %4) #24
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEmc(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1, i8 noundef signext %2)
  call void @_ZNSt3__119__debug_db_insert_cB7v160006INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEvPT_(ptr noundef nonnull %0)
  ret ptr %0
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
declare void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEmc(ptr noundef nonnull align 8 dereferenceable(24), i64 noundef, i8 noundef signext) local_unnamed_addr #4 align 2

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNSt3__111char_traitsIcE6assignEPcmc(ptr noundef %0, i64 noundef %1, i8 noundef signext %2) local_unnamed_addr #7 align 2 personality ptr @__gxx_personality_v0 {
  %4 = alloca i8, align 1
  store i8 %2, ptr %4, align 1, !tbaa !5
  %5 = invoke noundef ptr @_ZNSt3__16fill_nB7v160006IPcmcEET_S2_T0_RKT1_(ptr noundef %0, i64 noundef %1, ptr noundef nonnull align 1 dereferenceable(1) %4)
          to label %6 unwind label %7

6:                                                ; preds = %3
  ret ptr %0

7:                                                ; preds = %3
  %8 = landingpad { ptr, i32 }
          catch ptr null
  %9 = extractvalue { ptr, i32 } %8, 0
  call void @__clang_call_terminate(ptr %9) #27
  unreachable
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__16fill_nB7v160006IPcmcEET_S2_T0_RKT1_(ptr noundef %0, i64 noundef %1, ptr noundef nonnull align 1 dereferenceable(1) %2) local_unnamed_addr #4 {
  %4 = tail call noundef i64 @_ZNSt3__121__convert_to_integralB7v160006Em(i64 noundef %1)
  %5 = tail call noundef ptr @_ZNSt3__18__fill_nB7v160006IPcmcEET_S2_T0_RKT1_(ptr noundef %0, i64 noundef %4, ptr noundef nonnull align 1 dereferenceable(1) %2)
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__18__fill_nB7v160006IPcmcEET_S2_T0_RKT1_(ptr noundef %0, i64 noundef %1, ptr noundef nonnull align 1 dereferenceable(1) %2) local_unnamed_addr #7 {
  %4 = icmp eq i64 %1, 0
  br i1 %4, label %12, label %5

5:                                                ; preds = %3, %5
  %6 = phi ptr [ %9, %5 ], [ %0, %3 ]
  %7 = phi i64 [ %10, %5 ], [ %1, %3 ]
  %8 = load i8, ptr %2, align 1, !tbaa !5
  store i8 %8, ptr %6, align 1, !tbaa !5
  %9 = getelementptr inbounds i8, ptr %6, i64 1
  %10 = add i64 %7, -1
  %11 = icmp eq i64 %10, 0
  br i1 %11, label %12, label %5, !llvm.loop !87

12:                                               ; preds = %5, %3
  %13 = phi ptr [ %0, %3 ], [ %9, %5 ]
  ret ptr %13
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNSt3__121__convert_to_integralB7v160006Em(i64 noundef %0) local_unnamed_addr #7 {
  ret i64 %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC2B7v160006ERNS_13basic_ostreamIcS2_EE(ptr noundef nonnull returned align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) unnamed_addr #2 align 2 personality ptr @__gxx_personality_v0 {
  %3 = load ptr, ptr %1, align 8, !tbaa !53
  %4 = getelementptr i8, ptr %3, i64 -24
  %5 = load i64, ptr %4, align 8
  %6 = getelementptr inbounds i8, ptr %1, i64 %5
  %7 = invoke noundef ptr @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5rdbufB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(148) %6)
          to label %8 unwind label %9

8:                                                ; preds = %2
  store ptr %7, ptr %0, align 8, !tbaa !84
  ret ptr %0

9:                                                ; preds = %2
  %10 = landingpad { ptr, i32 }
          catch ptr null
  %11 = extractvalue { ptr, i32 } %10, 0
  tail call void @__clang_call_terminate(ptr %11) #27
  unreachable
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5rdbufB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(148) %0) local_unnamed_addr #4 align 2 {
  %2 = tail call noundef ptr @_ZNKSt3__18ios_base5rdbufB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(136) %0)
  ret ptr %2
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNKSt3__18ios_base5rdbufB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(136) %0) local_unnamed_addr #7 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::ios_base", ptr %0, i64 0, i32 6
  %3 = load ptr, ptr %2, align 8, !tbaa !88
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef zeroext i1 @_ZNSt3__111char_traitsIcE11eq_int_typeEii(i32 noundef %0, i32 noundef %1) local_unnamed_addr #7 align 2 {
  %3 = icmp eq i32 %0, %1
  ret i1 %3
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i32 @_ZNSt3__111char_traitsIcE3eofEv() local_unnamed_addr #7 align 2 {
  ret i32 -1
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef signext i8 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenB7v160006Ec(ptr noundef nonnull align 8 dereferenceable(148) %0, i8 noundef signext %1) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %3 = alloca %"class.std::__1::locale", align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %3) #24
  call void @_ZNKSt3__18ios_base6getlocEv(ptr nonnull sret(%"class.std::__1::locale") align 8 %3, ptr noundef nonnull align 8 dereferenceable(136) %0)
  %4 = invoke noundef nonnull align 8 dereferenceable(25) ptr @_ZNSt3__19use_facetB7v160006INS_5ctypeIcEEEERKT_RKNS_6localeE(ptr noundef nonnull align 8 dereferenceable(8) %3)
          to label %5 unwind label %9

5:                                                ; preds = %2
  %6 = invoke noundef signext i8 @_ZNKSt3__15ctypeIcE5widenB7v160006Ec(ptr noundef nonnull align 8 dereferenceable(25) %4, i8 noundef signext %1)
          to label %7 unwind label %9

7:                                                ; preds = %5
  %8 = call noundef ptr @_ZNSt3__16localeD1Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #24
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3) #24
  ret i8 %6

9:                                                ; preds = %5, %2
  %10 = landingpad { ptr, i32 }
          cleanup
  %11 = call noundef ptr @_ZNSt3__16localeD1Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #24
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3) #24
  resume { ptr, i32 } %10
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(25) ptr @_ZNSt3__19use_facetB7v160006INS_5ctypeIcEEEERKT_RKNS_6localeE(ptr noundef nonnull align 8 dereferenceable(8) %0) local_unnamed_addr #4 {
  %2 = tail call noundef ptr @_ZNKSt3__16locale9use_facetERNS0_2idE(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(12) @_ZNSt3__15ctypeIcE2idE)
  ret ptr %2
}

declare void @_ZNKSt3__18ios_base6getlocEv(ptr sret(%"class.std::__1::locale") align 8, ptr noundef nonnull align 8 dereferenceable(136)) local_unnamed_addr #8

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef signext i8 @_ZNKSt3__15ctypeIcE5widenB7v160006Ec(ptr noundef nonnull align 8 dereferenceable(25) %0, i8 noundef signext %1) local_unnamed_addr #4 align 2 {
  %3 = load ptr, ptr %0, align 8, !tbaa !53
  %4 = getelementptr inbounds ptr, ptr %3, i64 7
  %5 = load ptr, ptr %4, align 8
  %6 = tail call noundef signext i8 %5(ptr noundef nonnull align 8 dereferenceable(25) %0, i8 noundef signext %1)
  ret i8 %6
}

; Function Attrs: nounwind
declare noundef ptr @_ZNSt3__16localeD1Ev(ptr noundef nonnull returned align 8 dereferenceable(8)) unnamed_addr #6

declare noundef ptr @_ZNKSt3__16locale9use_facetERNS0_2idE(ptr noundef nonnull align 8 dereferenceable(8), ptr noundef nonnull align 8 dereferenceable(12)) local_unnamed_addr #8

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__18ios_base8setstateB7v160006Ej(ptr noundef nonnull align 8 dereferenceable(136) %0, i32 noundef %1) local_unnamed_addr #4 align 2 {
  %3 = getelementptr inbounds %"class.std::__1::ios_base", ptr %0, i64 0, i32 4
  %4 = load i32, ptr %3, align 8, !tbaa !89
  %5 = or i32 %4, %1
  tail call void @_ZNSt3__18ios_base5clearEj(ptr noundef nonnull align 8 dereferenceable(136) %0, i32 noundef %5)
  ret void
}

declare void @_ZNSt3__18ios_base5clearEj(ptr noundef nonnull align 8 dereferenceable(136), i32 noundef) local_unnamed_addr #8

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE15__get_long_sizeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %3 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__long", ptr %2, i64 0, i32 1
  %4 = load i64, ptr %3, align 8, !tbaa !5
  ret i64 %4
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16__get_short_sizeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %3 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short", ptr %2, i64 0, i32 2
  %4 = load i8, ptr %3, align 1
  %5 = and i8 %4, 127
  %6 = zext i8 %5 to i64
  ret i64 %6
}

declare void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6resizeEmc(ptr noundef nonnull align 8 dereferenceable(24), i64 noundef, i8 noundef signext) local_unnamed_addr #8

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B7v160006EOS5_(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #2 align 2 {
  %3 = tail call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B7v160006EOS5_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) #24
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B7v160006EOS5_(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #2 align 2 personality ptr @__gxx_personality_v0 {
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1, i64 24, i1 false)
  tail call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE14__default_initB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %1)
  tail call void @_ZNSt3__119__debug_db_insert_cB7v160006INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEvPT_(ptr noundef nonnull %0)
  %3 = tail call noundef zeroext i1 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  br i1 %3, label %4, label %5

4:                                                ; preds = %2
  tail call void @_ZNSt3__115__debug_db_swapB7v160006INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEvPT_S8_(ptr noundef nonnull %0, ptr noundef nonnull %1)
  br label %5

5:                                                ; preds = %4, %2
  ret ptr %0
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__115__debug_db_swapB7v160006INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEvPT_S8_(ptr noundef %0, ptr noundef %1) local_unnamed_addr #7 {
  ret void
}

declare noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6insertEmPKc(ptr noundef nonnull align 8 dereferenceable(24), i64 noundef, ptr noundef) local_unnamed_addr #8

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE9__end_capB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::vector", ptr %0, i64 0, i32 2
  %3 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(8) %2) #24
  ret ptr %3
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE22__construct_one_at_endB7v160006IJS6_EEEvDpOT_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %3 = alloca %"struct.std::__1::vector<std::__1::string>::_ConstructTransaction", align 8
  call void @llvm.lifetime.start.p0(i64 24, ptr nonnull %3) #24
  %4 = call noundef ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE21_ConstructTransactionC1B7v160006ERS8_m(ptr noundef nonnull align 8 dereferenceable(24) %3, ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef 1)
  %5 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE7__allocB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %6 = getelementptr inbounds %"struct.std::__1::vector<std::__1::string>::_ConstructTransaction", ptr %3, i64 0, i32 1
  %7 = load ptr, ptr %6, align 8, !tbaa !90
  %8 = call noundef ptr @_ZNSt3__112__to_addressB7v160006INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEPT_S8_(ptr noundef %7) #24
  invoke void @_ZNSt3__116allocator_traitsINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEE9constructB7v160006IS6_JS6_EvEEvRS7_PT_DpOT0_(ptr noundef nonnull align 1 dereferenceable(1) %5, ptr noundef %8, ptr noundef nonnull align 8 dereferenceable(24) %1)
          to label %9 unwind label %13

9:                                                ; preds = %2
  %10 = load ptr, ptr %6, align 8, !tbaa !90
  %11 = getelementptr inbounds %"class.std::__1::basic_string", ptr %10, i64 1
  store ptr %11, ptr %6, align 8, !tbaa !90
  %12 = call noundef ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE21_ConstructTransactionD1B7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %3) #24
  ret void

13:                                               ; preds = %2
  %14 = landingpad { ptr, i32 }
          cleanup
  %15 = call noundef ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE21_ConstructTransactionD1B7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #24
  call void @llvm.lifetime.end.p0(i64 24, ptr nonnull %3) #24
  resume { ptr, i32 } %14
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE21__push_back_slow_pathIS6_EEvOT_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %3 = alloca %"struct.std::__1::__split_buffer", align 8
  %4 = tail call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE7__allocB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %3) #24
  %5 = tail call noundef i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4sizeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %6 = add i64 %5, 1
  %7 = tail call noundef i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE11__recommendB7v160006Em(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %6)
  %8 = tail call noundef i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4sizeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %9 = call noundef ptr @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEEC1EmmS8_(ptr noundef nonnull align 8 dereferenceable(40) %3, i64 noundef %7, i64 noundef %8, ptr noundef nonnull align 1 dereferenceable(1) %4)
  %10 = getelementptr inbounds %"struct.std::__1::__split_buffer", ptr %3, i64 0, i32 2
  %11 = load ptr, ptr %10, align 8, !tbaa !92
  %12 = call noundef ptr @_ZNSt3__112__to_addressB7v160006INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEPT_S8_(ptr noundef %11) #24
  invoke void @_ZNSt3__116allocator_traitsINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEE9constructB7v160006IS6_JS6_EvEEvRS7_PT_DpOT0_(ptr noundef nonnull align 1 dereferenceable(1) %4, ptr noundef %12, ptr noundef nonnull align 8 dereferenceable(24) %1)
          to label %13 unwind label %18

13:                                               ; preds = %2
  %14 = load ptr, ptr %10, align 8, !tbaa !92
  %15 = getelementptr inbounds %"class.std::__1::basic_string", ptr %14, i64 1
  store ptr %15, ptr %10, align 8, !tbaa !92
  invoke void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS6_RS7_EE(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(40) %3)
          to label %16 unwind label %18

16:                                               ; preds = %13
  %17 = call noundef ptr @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEED1Ev(ptr noundef nonnull align 8 dereferenceable(40) %3) #24
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %3) #24
  ret void

18:                                               ; preds = %13, %2
  %19 = landingpad { ptr, i32 }
          cleanup
  %20 = call noundef ptr @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEED1Ev(ptr noundef nonnull align 8 dereferenceable(40) %3) #24
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %3) #24
  resume { ptr, i32 } %19
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__122__compressed_pair_elemIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEELi0ELb0EE5__getB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) #24
  ret ptr %2
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__122__compressed_pair_elemIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEELi0ELb0EE5__getB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) local_unnamed_addr #7 align 2 {
  ret ptr %0
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE21_ConstructTransactionC1B7v160006ERS8_m(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1, i64 noundef %2) unnamed_addr #0 align 2 {
  %4 = tail call noundef ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE21_ConstructTransactionC2B7v160006ERS8_m(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1, i64 noundef %2)
  ret ptr %0
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr void @_ZNSt3__116allocator_traitsINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEE9constructB7v160006IS6_JS6_EvEEvRS7_PT_DpOT0_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %1, ptr noundef nonnull align 8 dereferenceable(24) %2) local_unnamed_addr #4 align 2 {
  tail call void @_ZNSt3__19allocatorINS_12basic_stringIcNS_11char_traitsIcEENS0_IcEEEEE9constructB7v160006IS5_JS5_EEEvPT_DpOT0_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %1, ptr noundef nonnull align 8 dereferenceable(24) %2)
  ret void
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE21_ConstructTransactionD1B7v160006Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #2 align 2 {
  %2 = tail call noundef ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE21_ConstructTransactionD2B7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE21_ConstructTransactionC2B7v160006ERS8_m(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1, i64 noundef %2) unnamed_addr #2 align 2 {
  store ptr %1, ptr %0, align 8, !tbaa !43
  %4 = getelementptr inbounds %"struct.std::__1::vector<std::__1::string>::_ConstructTransaction", ptr %0, i64 0, i32 1
  %5 = getelementptr inbounds %"class.std::__1::vector", ptr %1, i64 0, i32 1
  %6 = load ptr, ptr %5, align 8, !tbaa !35
  store ptr %6, ptr %4, align 8, !tbaa !90
  %7 = getelementptr inbounds %"struct.std::__1::vector<std::__1::string>::_ConstructTransaction", ptr %0, i64 0, i32 2
  %8 = getelementptr inbounds %"class.std::__1::basic_string", ptr %6, i64 %2
  store ptr %8, ptr %7, align 8, !tbaa !96
  ret ptr %0
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr void @_ZNSt3__19allocatorINS_12basic_stringIcNS_11char_traitsIcEENS0_IcEEEEE9constructB7v160006IS5_JS5_EEEvPT_DpOT0_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %1, ptr noundef nonnull align 8 dereferenceable(24) %2) local_unnamed_addr #7 align 2 {
  %4 = tail call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B7v160006EOS5_(ptr noundef nonnull align 8 dereferenceable(24) %1, ptr noundef nonnull align 8 dereferenceable(24) %2) #24
  ret void
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE21_ConstructTransactionD2B7v160006Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #2 align 2 {
  %2 = getelementptr inbounds %"struct.std::__1::vector<std::__1::string>::_ConstructTransaction", ptr %0, i64 0, i32 1
  %3 = load ptr, ptr %2, align 8, !tbaa !90
  %4 = load ptr, ptr %0, align 8, !tbaa !97
  %5 = getelementptr inbounds %"class.std::__1::vector", ptr %4, i64 0, i32 1
  store ptr %3, ptr %5, align 8, !tbaa !35
  ret ptr %0
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE11__recommendB7v160006Em(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) local_unnamed_addr #4 align 2 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i64 %1, ptr %3, align 8, !tbaa !32
  %5 = tail call noundef i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE8max_sizeEv(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %6 = load i64, ptr %3, align 8, !tbaa !32
  %7 = icmp ugt i64 %6, %5
  br i1 %7, label %8, label %9

8:                                                ; preds = %2
  tail call void @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE20__throw_length_errorB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #25
  unreachable

9:                                                ; preds = %2
  %10 = tail call noundef i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE8capacityB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %11 = lshr i64 %5, 1
  %12 = icmp ult i64 %10, %11
  br i1 %12, label %13, label %17

13:                                               ; preds = %9
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %4) #24
  %14 = shl i64 %10, 1
  store i64 %14, ptr %4, align 8, !tbaa !32
  %15 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__13maxB7v160006ImEERKT_S3_S3_(ptr noundef nonnull align 8 dereferenceable(8) %4, ptr noundef nonnull align 8 dereferenceable(8) %3)
  %16 = load i64, ptr %15, align 8, !tbaa !32
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %4) #24
  br label %17

17:                                               ; preds = %9, %13
  %18 = phi i64 [ %16, %13 ], [ %5, %9 ]
  ret i64 %18
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEEC1EmmS8_(ptr noundef nonnull returned align 8 dereferenceable(40) %0, i64 noundef %1, i64 noundef %2, ptr noundef nonnull align 1 dereferenceable(1) %3) unnamed_addr #0 align 2 {
  %5 = tail call noundef ptr @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEEC2EmmS8_(ptr noundef nonnull align 8 dereferenceable(40) %0, i64 noundef %1, i64 noundef %2, ptr noundef nonnull align 1 dereferenceable(1) %3)
  ret ptr %0
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS6_RS7_EE(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(40) %1) local_unnamed_addr #4 align 2 {
  %3 = alloca %"class.std::__1::reverse_iterator.14", align 8
  %4 = alloca %"class.std::__1::reverse_iterator.14", align 8
  %5 = alloca %"class.std::__1::reverse_iterator.14", align 8
  %6 = alloca %"class.std::__1::reverse_iterator.14", align 8
  tail call void @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE17__annotate_deleteB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %3) #24
  %7 = tail call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE7__allocB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %8 = getelementptr inbounds %"class.std::__1::vector", ptr %0, i64 0, i32 1
  %9 = load ptr, ptr %8, align 8, !tbaa !35
  %10 = call noundef ptr @_ZNSt3__116reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEC1B7v160006ES7_(ptr noundef nonnull align 8 dereferenceable(16) %4, ptr noundef %9)
  %11 = load ptr, ptr %0, align 8, !tbaa !39
  %12 = call noundef ptr @_ZNSt3__116reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEC1B7v160006ES7_(ptr noundef nonnull align 8 dereferenceable(16) %5, ptr noundef %11)
  %13 = getelementptr inbounds %"struct.std::__1::__split_buffer", ptr %1, i64 0, i32 1
  %14 = load ptr, ptr %13, align 8, !tbaa !98
  %15 = call noundef ptr @_ZNSt3__116reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEC1B7v160006ES7_(ptr noundef nonnull align 8 dereferenceable(16) %6, ptr noundef %14)
  %16 = load i64, ptr %4, align 8
  %17 = insertvalue [2 x i64] poison, i64 %16, 0
  %18 = getelementptr inbounds [2 x i64], ptr %4, i64 0, i64 1
  %19 = load i64, ptr %18, align 8
  %20 = insertvalue [2 x i64] %17, i64 %19, 1
  %21 = load i64, ptr %5, align 8
  %22 = insertvalue [2 x i64] poison, i64 %21, 0
  %23 = getelementptr inbounds [2 x i64], ptr %5, i64 0, i64 1
  %24 = load i64, ptr %23, align 8
  %25 = insertvalue [2 x i64] %22, i64 %24, 1
  %26 = load i64, ptr %6, align 8
  %27 = insertvalue [2 x i64] poison, i64 %26, 0
  %28 = getelementptr inbounds [2 x i64], ptr %6, i64 0, i64 1
  %29 = load i64, ptr %28, align 8
  %30 = insertvalue [2 x i64] %27, i64 %29, 1
  %31 = call [2 x i64] @_ZNSt3__142__uninitialized_allocator_move_if_noexceptB7v160006INS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEENS_16reverse_iteratorIPS6_EESA_SA_EET2_RT_T0_T1_SB_(ptr noundef nonnull align 1 dereferenceable(1) %7, [2 x i64] %20, [2 x i64] %25, [2 x i64] %30)
  %32 = extractvalue [2 x i64] %31, 0
  store i64 %32, ptr %3, align 8
  %33 = extractvalue [2 x i64] %31, 1
  %34 = getelementptr inbounds [2 x i64], ptr %3, i64 0, i64 1
  store i64 %33, ptr %34, align 8
  %35 = call noundef ptr @_ZNKSt3__116reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEE4baseB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %3)
  store ptr %35, ptr %13, align 8, !tbaa !98
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %3) #24
  call void @_ZNSt3__14swapB7v160006IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEENS_9enable_ifIXaasr21is_move_constructibleIT_EE5valuesr18is_move_assignableIS9_EE5valueEvE4typeERS9_SC_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %13) #24
  %36 = getelementptr inbounds %"struct.std::__1::__split_buffer", ptr %1, i64 0, i32 2
  call void @_ZNSt3__14swapB7v160006IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEENS_9enable_ifIXaasr21is_move_constructibleIT_EE5valuesr18is_move_assignableIS9_EE5valueEvE4typeERS9_SC_(ptr noundef nonnull align 8 dereferenceable(8) %8, ptr noundef nonnull align 8 dereferenceable(8) %36) #24
  %37 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE9__end_capB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %38 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE9__end_capB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(40) %1) #24
  call void @_ZNSt3__14swapB7v160006IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEENS_9enable_ifIXaasr21is_move_constructibleIT_EE5valuesr18is_move_assignableIS9_EE5valueEvE4typeERS9_SC_(ptr noundef nonnull align 8 dereferenceable(8) %37, ptr noundef nonnull align 8 dereferenceable(8) %38) #24
  %39 = load ptr, ptr %13, align 8, !tbaa !98
  store ptr %39, ptr %1, align 8, !tbaa !99
  %40 = call noundef i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4sizeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  call void @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE14__annotate_newB7v160006Em(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %40) #24
  call void @_ZNSt3__125__debug_db_invalidate_allB7v160006INS_6vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS5_IS7_EEEEEEvPT_(ptr noundef nonnull %0)
  ret void
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEED1Ev(ptr noundef nonnull returned align 8 dereferenceable(40) %0) unnamed_addr #2 align 2 {
  %2 = tail call noundef ptr @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEED2Ev(ptr noundef nonnull align 8 dereferenceable(40) %0) #24
  ret ptr %0
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE8max_sizeEv(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 personality ptr @__gxx_personality_v0 {
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %2) #24
  %4 = tail call noundef nonnull align 1 dereferenceable(1) ptr @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE7__allocB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %5 = tail call noundef i64 @_ZNSt3__116allocator_traitsINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEE8max_sizeB7v160006IS7_vEEmRKS7_(ptr noundef nonnull align 1 dereferenceable(1) %4) #24
  store i64 %5, ptr %2, align 8, !tbaa !32
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %3) #24
  %6 = tail call noundef i64 @_ZNSt3__114numeric_limitsIlE3maxB7v160006Ev() #24
  store i64 %6, ptr %3, align 8, !tbaa !32
  %7 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__13minB7v160006ImEERKT_S3_S3_(ptr noundef nonnull align 8 dereferenceable(8) %2, ptr noundef nonnull align 8 dereferenceable(8) %3)
          to label %8 unwind label %10

8:                                                ; preds = %1
  %9 = load i64, ptr %7, align 8, !tbaa !32
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3) #24
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %2) #24
  ret i64 %9

10:                                               ; preds = %1
  %11 = landingpad { ptr, i32 }
          catch ptr null
  %12 = extractvalue { ptr, i32 } %11, 0
  call void @__clang_call_terminate(ptr %12) #27
  unreachable
}

; Function Attrs: mustprogress noinline noreturn ssp uwtable(sync)
define linkonce_odr hidden void @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE20__throw_length_errorB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #5 align 2 {
  tail call void @_ZNSt3__120__throw_length_errorB7v160006EPKc(ptr noundef nonnull @.str.56) #25
  unreachable
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__13maxB7v160006ImEERKT_S3_S3_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) local_unnamed_addr #4 {
  %3 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__13maxB7v160006ImNS_6__lessImmEEEERKT_S5_S5_T0_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1)
  ret ptr %3
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__13minB7v160006ImEERKT_S3_S3_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) local_unnamed_addr #4 {
  %3 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__13minB7v160006ImNS_6__lessImmEEEERKT_S5_S5_T0_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1)
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef i64 @_ZNSt3__116allocator_traitsINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEE8max_sizeB7v160006IS7_vEEmRKS7_(ptr noundef nonnull align 1 dereferenceable(1) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef i64 @_ZNKSt3__19allocatorINS_12basic_stringIcNS_11char_traitsIcEENS0_IcEEEEE8max_sizeB7v160006Ev(ptr noundef nonnull align 1 dereferenceable(1) %0) #24
  ret i64 %2
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 1 dereferenceable(1) ptr @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE7__allocB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::vector", ptr %0, i64 0, i32 2
  %3 = tail call noundef nonnull align 1 dereferenceable(1) ptr @_ZNKSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE6secondB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(8) %2) #24
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNSt3__114numeric_limitsIlE3maxB7v160006Ev() local_unnamed_addr #7 align 2 {
  %1 = tail call noundef i64 @_ZNSt3__123__libcpp_numeric_limitsIlLb1EE3maxB7v160006Ev() #24
  ret i64 %1
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__13minB7v160006ImNS_6__lessImmEEEERKT_S5_S5_T0_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) local_unnamed_addr #4 {
  %3 = alloca %"struct.std::__1::__less", align 1
  %4 = call noundef zeroext i1 @_ZNKSt3__16__lessImmEclB7v160006ERKmS3_(ptr noundef nonnull align 1 dereferenceable(1) %3, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 8 dereferenceable(8) %0)
  %5 = select i1 %4, ptr %1, ptr %0
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef zeroext i1 @_ZNKSt3__16__lessImmEclB7v160006ERKmS3_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 8 dereferenceable(8) %2) local_unnamed_addr #7 align 2 {
  %4 = load i64, ptr %1, align 8, !tbaa !32
  %5 = load i64, ptr %2, align 8, !tbaa !32
  %6 = icmp ult i64 %4, %5
  ret i1 %6
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNKSt3__19allocatorINS_12basic_stringIcNS_11char_traitsIcEENS0_IcEEEEE8max_sizeB7v160006Ev(ptr noundef nonnull align 1 dereferenceable(1) %0) local_unnamed_addr #7 align 2 {
  ret i64 768614336404564650
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 1 dereferenceable(1) ptr @_ZNKSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE6secondB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef nonnull align 1 dereferenceable(1) ptr @_ZNKSt3__122__compressed_pair_elemINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEELi1ELb1EE5__getB7v160006Ev(ptr noundef nonnull align 1 dereferenceable(1) %0) #24
  ret ptr %2
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 1 dereferenceable(1) ptr @_ZNKSt3__122__compressed_pair_elemINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEELi1ELb1EE5__getB7v160006Ev(ptr noundef nonnull align 1 dereferenceable(1) %0) local_unnamed_addr #7 align 2 {
  ret ptr %0
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNSt3__123__libcpp_numeric_limitsIlLb1EE3maxB7v160006Ev() local_unnamed_addr #7 align 2 {
  ret i64 9223372036854775807
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__13maxB7v160006ImNS_6__lessImmEEEERKT_S5_S5_T0_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) local_unnamed_addr #7 {
  %3 = alloca %"struct.std::__1::__less", align 1
  %4 = call noundef zeroext i1 @_ZNKSt3__16__lessImmEclB7v160006ERKmS3_(ptr noundef nonnull align 1 dereferenceable(1) %3, ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1)
  %5 = select i1 %4, ptr %1, ptr %0
  ret ptr %5
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEEC2EmmS8_(ptr noundef nonnull returned align 8 dereferenceable(40) %0, i64 noundef %1, i64 noundef %2, ptr noundef nonnull align 1 dereferenceable(1) %3) unnamed_addr #0 align 2 {
  %5 = alloca ptr, align 8
  %6 = getelementptr inbounds %"struct.std::__1::__split_buffer", ptr %0, i64 0, i32 3
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %5) #24
  store ptr null, ptr %5, align 8, !tbaa !100
  %7 = call noundef ptr @_ZNSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEEC1B7v160006IDnS9_EEOT_OT0_(ptr noundef nonnull align 8 dereferenceable(16) %6, ptr noundef nonnull align 8 dereferenceable(8) %5, ptr noundef nonnull align 1 dereferenceable(1) %3)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %5) #24
  %8 = icmp eq i64 %1, 0
  br i1 %8, label %15, label %9

9:                                                ; preds = %4
  %10 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE7__allocB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(40) %0) #24
  %11 = call [2 x i64] @_ZNSt3__119__allocate_at_leastB7v160006INS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERSA_m(ptr noundef nonnull align 1 dereferenceable(1) %10, i64 noundef %1)
  %12 = extractvalue [2 x i64] %11, 0
  %13 = inttoptr i64 %12 to ptr
  %14 = extractvalue [2 x i64] %11, 1
  br label %15

15:                                               ; preds = %4, %9
  %16 = phi ptr [ %13, %9 ], [ null, %4 ]
  %17 = phi i64 [ %14, %9 ], [ 0, %4 ]
  store ptr %16, ptr %0, align 8, !tbaa !99
  %18 = getelementptr inbounds %"class.std::__1::basic_string", ptr %16, i64 %2
  %19 = getelementptr inbounds %"struct.std::__1::__split_buffer", ptr %0, i64 0, i32 2
  store ptr %18, ptr %19, align 8, !tbaa !92
  %20 = getelementptr inbounds %"struct.std::__1::__split_buffer", ptr %0, i64 0, i32 1
  store ptr %18, ptr %20, align 8, !tbaa !98
  %21 = getelementptr inbounds %"class.std::__1::basic_string", ptr %16, i64 %17
  %22 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE9__end_capB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(40) %0) #24
  store ptr %21, ptr %22, align 8, !tbaa !43
  ret ptr %0
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEEC1B7v160006IDnS9_EEOT_OT0_(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 1 dereferenceable(1) %2) unnamed_addr #0 align 2 {
  %4 = tail call noundef ptr @_ZNSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEEC2B7v160006IDnS9_EEOT_OT0_(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 1 dereferenceable(1) %2)
  ret ptr %0
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden [2 x i64] @_ZNSt3__119__allocate_at_leastB7v160006INS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERSA_m(ptr noundef nonnull align 1 dereferenceable(1) %0, i64 noundef %1) local_unnamed_addr #4 {
  %3 = tail call noundef ptr @_ZNSt3__19allocatorINS_12basic_stringIcNS_11char_traitsIcEENS0_IcEEEEE8allocateB7v160006Em(ptr noundef nonnull align 1 dereferenceable(1) %0, i64 noundef %1)
  %4 = ptrtoint ptr %3 to i64
  %5 = insertvalue [2 x i64] poison, i64 %4, 0
  %6 = insertvalue [2 x i64] %5, i64 %1, 1
  ret [2 x i64] %6
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE7__allocB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(40) %0) local_unnamed_addr #7 align 2 {
  %2 = getelementptr inbounds %"struct.std::__1::__split_buffer", ptr %0, i64 0, i32 3
  %3 = tail call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE6secondB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %2) #24
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE9__end_capB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(40) %0) local_unnamed_addr #7 align 2 {
  %2 = getelementptr inbounds %"struct.std::__1::__split_buffer", ptr %0, i64 0, i32 3
  %3 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %2) #24
  ret ptr %3
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEEC2B7v160006IDnS9_EEOT_OT0_(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 1 dereferenceable(1) %2) unnamed_addr #0 align 2 {
  %4 = tail call noundef ptr @_ZNSt3__122__compressed_pair_elemIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEELi0ELb0EEC2B7v160006IDnvEEOT_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1)
  %5 = getelementptr inbounds i8, ptr %0, i64 8
  %6 = tail call noundef ptr @_ZNSt3__122__compressed_pair_elemIRNS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEELi1ELb0EEC2B7v160006IS8_vEEOT_(ptr noundef nonnull align 8 dereferenceable(8) %5, ptr noundef nonnull align 1 dereferenceable(1) %2)
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNSt3__122__compressed_pair_elemIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEELi0ELb0EEC2B7v160006IDnvEEOT_(ptr noundef nonnull returned align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) unnamed_addr #2 align 2 {
  store ptr null, ptr %0, align 8, !tbaa !102
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNSt3__122__compressed_pair_elemIRNS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEELi1ELb0EEC2B7v160006IS8_vEEOT_(ptr noundef nonnull returned align 8 dereferenceable(8) %0, ptr noundef nonnull align 1 dereferenceable(1) %1) unnamed_addr #2 align 2 {
  store ptr %1, ptr %0, align 8, !tbaa !43
  ret ptr %0
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__19allocatorINS_12basic_stringIcNS_11char_traitsIcEENS0_IcEEEEE8allocateB7v160006Em(ptr noundef nonnull align 1 dereferenceable(1) %0, i64 noundef %1) local_unnamed_addr #4 align 2 {
  %3 = tail call noundef i64 @_ZNSt3__116allocator_traitsINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEE8max_sizeB7v160006IS7_vEEmRKS7_(ptr noundef nonnull align 1 dereferenceable(1) %0) #24
  %4 = icmp ult i64 %3, %1
  br i1 %4, label %5, label %6

5:                                                ; preds = %2
  tail call void @_ZSt28__throw_bad_array_new_lengthB7v160006v() #25
  unreachable

6:                                                ; preds = %2
  %7 = mul i64 %1, 24
  %8 = tail call noundef ptr @_ZNSt3__117__libcpp_allocateB7v160006Emm(i64 noundef %7, i64 noundef 8)
  ret ptr %8
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE6secondB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) local_unnamed_addr #7 align 2 {
  %2 = getelementptr inbounds i8, ptr %0, i64 8
  %3 = tail call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__122__compressed_pair_elemIRNS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEELi1ELb0EE5__getB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(8) %2) #24
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__122__compressed_pair_elemIRNS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEELi1ELb0EE5__getB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) local_unnamed_addr #7 align 2 {
  %2 = load ptr, ptr %0, align 8, !tbaa !103
  ret ptr %2
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__122__compressed_pair_elemIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEELi0ELb0EE5__getB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) #24
  ret ptr %2
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden void @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE17__annotate_deleteB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef ptr @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4dataB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %3 = tail call noundef ptr @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4dataB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %4 = tail call noundef i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE8capacityB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %5 = getelementptr inbounds %"class.std::__1::basic_string", ptr %3, i64 %4
  %6 = tail call noundef ptr @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4dataB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %7 = tail call noundef i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4sizeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %8 = getelementptr inbounds %"class.std::__1::basic_string", ptr %6, i64 %7
  %9 = tail call noundef ptr @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4dataB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %10 = tail call noundef i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE8capacityB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %11 = getelementptr inbounds %"class.std::__1::basic_string", ptr %9, i64 %10
  tail call void @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE31__annotate_contiguous_containerB7v160006EPKvSA_SA_SA_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %2, ptr noundef %5, ptr noundef %8, ptr noundef %11) #24
  ret void
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden [2 x i64] @_ZNSt3__142__uninitialized_allocator_move_if_noexceptB7v160006INS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEENS_16reverse_iteratorIPS6_EESA_SA_EET2_RT_T0_T1_SB_(ptr noundef nonnull align 1 dereferenceable(1) %0, [2 x i64] %1, [2 x i64] %2, [2 x i64] %3) local_unnamed_addr #4 personality ptr @__gxx_personality_v0 {
  %5 = alloca %"class.std::__1::reverse_iterator.14", align 8
  %6 = alloca %"class.std::__1::reverse_iterator.14", align 8
  %7 = alloca %"class.std::__1::reverse_iterator.14", align 8
  %8 = alloca %"class.std::__1::reverse_iterator.14", align 8
  %9 = alloca %"struct.std::__1::__exception_guard_exceptions", align 8
  %10 = alloca %"class.std::__1::_AllocatorDestroyRangeReverse", align 8
  %11 = extractvalue [2 x i64] %1, 0
  store i64 %11, ptr %5, align 8
  %12 = extractvalue [2 x i64] %1, 1
  %13 = getelementptr inbounds [2 x i64], ptr %5, i64 0, i64 1
  store i64 %12, ptr %13, align 8
  %14 = extractvalue [2 x i64] %2, 0
  store i64 %14, ptr %6, align 8
  %15 = extractvalue [2 x i64] %2, 1
  %16 = getelementptr inbounds [2 x i64], ptr %6, i64 0, i64 1
  store i64 %15, ptr %16, align 8
  %17 = extractvalue [2 x i64] %3, 0
  store i64 %17, ptr %7, align 8
  %18 = extractvalue [2 x i64] %3, 1
  %19 = getelementptr inbounds [2 x i64], ptr %7, i64 0, i64 1
  store i64 %18, ptr %19, align 8
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %8) #24
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %8, ptr noundef nonnull align 8 dereferenceable(16) %7, i64 16, i1 false)
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %9) #24
  %20 = call noundef ptr @_ZNSt3__129_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEENS_16reverse_iteratorIPS6_EEEC1B7v160006ERS7_RSA_SD_(ptr noundef nonnull align 8 dereferenceable(24) %10, ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef nonnull align 8 dereferenceable(16) %8, ptr noundef nonnull align 8 dereferenceable(16) %7)
  call void @_ZNSt3__122__make_exception_guardB7v160006INS_29_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS2_IcEEEEEENS_16reverse_iteratorIPS7_EEEEEENS_28__exception_guard_exceptionsIT_EESE_(ptr nonnull sret(%"struct.std::__1::__exception_guard_exceptions") align 8 %9, ptr noundef nonnull %10)
  br label %21

21:                                               ; preds = %27, %4
  %22 = invoke noundef zeroext i1 @_ZNSt3__1neB7v160006IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES7_EEbRKNS_16reverse_iteratorIT_EERKNS8_IT0_EE(ptr noundef nonnull align 8 dereferenceable(16) %5, ptr noundef nonnull align 8 dereferenceable(16) %6)
          to label %23 unwind label %30

23:                                               ; preds = %21
  br i1 %22, label %24, label %33

24:                                               ; preds = %23
  %25 = call noundef ptr @_ZNSt3__112__to_addressB7v160006INS_16reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEvEENS_5decayIDTclsr19__to_address_helperIT_EE6__callclsr3stdE7declvalIRKSB_EEEEE4typeESD_(ptr noundef nonnull align 8 dereferenceable(16) %7) #24
  %26 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__116reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEdeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %5)
  invoke void @_ZNSt3__116allocator_traitsINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEE9constructB7v160006IS6_JS6_EvEEvRS7_PT_DpOT0_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %25, ptr noundef nonnull align 8 dereferenceable(24) %26)
          to label %27 unwind label %30

27:                                               ; preds = %24
  %28 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZNSt3__116reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEppB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %5)
  %29 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZNSt3__116reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEppB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %7)
  br label %21, !llvm.loop !104

30:                                               ; preds = %24, %21
  %31 = landingpad { ptr, i32 }
          cleanup
  %32 = call noundef ptr @_ZNSt3__128__exception_guard_exceptionsINS_29_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS2_IcEEEEEENS_16reverse_iteratorIPS7_EEEEED1B7v160006Ev(ptr noundef nonnull align 8 dereferenceable(25) %9) #24
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %9) #24
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %8) #24
  resume { ptr, i32 } %31

33:                                               ; preds = %23
  call void @_ZNSt3__128__exception_guard_exceptionsINS_29_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS2_IcEEEEEENS_16reverse_iteratorIPS7_EEEEE10__completeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(25) %9) #24
  %34 = load i64, ptr %7, align 8
  %35 = getelementptr inbounds i8, ptr %7, i64 8
  %36 = load i64, ptr %35, align 8
  %37 = call noundef ptr @_ZNSt3__128__exception_guard_exceptionsINS_29_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS2_IcEEEEEENS_16reverse_iteratorIPS7_EEEEED1B7v160006Ev(ptr noundef nonnull align 8 dereferenceable(25) %9) #24
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %9) #24
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %8) #24
  %38 = insertvalue [2 x i64] poison, i64 %34, 0
  %39 = insertvalue [2 x i64] %38, i64 %36, 1
  ret [2 x i64] %39
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__116reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEC1B7v160006ES7_(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #0 align 2 {
  %3 = tail call noundef ptr @_ZNSt3__116reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEC2B7v160006ES7_(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef %1)
  ret ptr %0
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNKSt3__116reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEE4baseB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) local_unnamed_addr #7 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::reverse_iterator.14", ptr %0, i64 0, i32 1
  %3 = load ptr, ptr %2, align 8, !tbaa !105
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__14swapB7v160006IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEENS_9enable_ifIXaasr21is_move_constructibleIT_EE5valuesr18is_move_assignableIS9_EE5valueEvE4typeERS9_SC_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) local_unnamed_addr #7 {
  %3 = load ptr, ptr %0, align 8, !tbaa !43
  %4 = load ptr, ptr %1, align 8, !tbaa !43
  store ptr %4, ptr %0, align 8, !tbaa !43
  store ptr %3, ptr %1, align 8, !tbaa !43
  ret void
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden void @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE14__annotate_newB7v160006Em(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) local_unnamed_addr #7 align 2 {
  %3 = tail call noundef ptr @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4dataB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %4 = tail call noundef ptr @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4dataB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %5 = tail call noundef i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE8capacityB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %6 = getelementptr inbounds %"class.std::__1::basic_string", ptr %4, i64 %5
  %7 = tail call noundef ptr @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4dataB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %8 = tail call noundef i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE8capacityB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %9 = getelementptr inbounds %"class.std::__1::basic_string", ptr %7, i64 %8
  %10 = tail call noundef ptr @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE4dataB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %11 = getelementptr inbounds %"class.std::__1::basic_string", ptr %10, i64 %1
  tail call void @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE31__annotate_contiguous_containerB7v160006EPKvSA_SA_SA_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %3, ptr noundef %6, ptr noundef %9, ptr noundef %11) #24
  ret void
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__125__debug_db_invalidate_allB7v160006INS_6vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS5_IS7_EEEEEEvPT_(ptr noundef %0) local_unnamed_addr #7 {
  ret void
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__122__make_exception_guardB7v160006INS_29_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS2_IcEEEEEENS_16reverse_iteratorIPS7_EEEEEENS_28__exception_guard_exceptionsIT_EESE_(ptr noalias sret(%"struct.std::__1::__exception_guard_exceptions") align 8 %0, ptr noundef %1) local_unnamed_addr #4 {
  %3 = alloca %"class.std::__1::_AllocatorDestroyRangeReverse", align 8
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %3, ptr noundef nonnull align 8 dereferenceable(24) %1, i64 24, i1 false), !tbaa.struct !107
  %4 = call noundef ptr @_ZNSt3__128__exception_guard_exceptionsINS_29_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS2_IcEEEEEENS_16reverse_iteratorIPS7_EEEEEC1B7v160006ESC_(ptr noundef nonnull align 8 dereferenceable(25) %0, ptr noundef nonnull %3)
  ret void
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__129_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEENS_16reverse_iteratorIPS6_EEEC1B7v160006ERS7_RSA_SD_(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef nonnull align 1 dereferenceable(1) %1, ptr noundef nonnull align 8 dereferenceable(16) %2, ptr noundef nonnull align 8 dereferenceable(16) %3) unnamed_addr #0 align 2 {
  %5 = tail call noundef ptr @_ZNSt3__129_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEENS_16reverse_iteratorIPS6_EEEC2B7v160006ERS7_RSA_SD_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 1 dereferenceable(1) %1, ptr noundef nonnull align 8 dereferenceable(16) %2, ptr noundef nonnull align 8 dereferenceable(16) %3)
  ret ptr %0
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef zeroext i1 @_ZNSt3__1neB7v160006IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES7_EEbRKNS_16reverse_iteratorIT_EERKNS8_IT0_EE(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef nonnull align 8 dereferenceable(16) %1) local_unnamed_addr #4 {
  %3 = tail call noundef ptr @_ZNKSt3__116reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEE4baseB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %0)
  %4 = tail call noundef ptr @_ZNKSt3__116reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEE4baseB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %1)
  %5 = icmp ne ptr %3, %4
  ret i1 %5
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__112__to_addressB7v160006INS_16reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEvEENS_5decayIDTclsr19__to_address_helperIT_EE6__callclsr3stdE7declvalIRKSB_EEEEE4typeESD_(ptr noundef nonnull align 8 dereferenceable(16) %0) local_unnamed_addr #7 {
  %2 = tail call noundef ptr @_ZNSt3__119__to_address_helperINS_16reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEvE6__callB7v160006ERKS9_(ptr noundef nonnull align 8 dereferenceable(16) %0) #24
  ret ptr %2
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__116reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEdeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) local_unnamed_addr #7 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::reverse_iterator.14", ptr %0, i64 0, i32 1
  %3 = load ptr, ptr %2, align 8, !tbaa !105
  %4 = getelementptr inbounds %"class.std::__1::basic_string", ptr %3, i64 -1
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(16) ptr @_ZNSt3__116reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEppB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) local_unnamed_addr #7 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::reverse_iterator.14", ptr %0, i64 0, i32 1
  %3 = load ptr, ptr %2, align 8, !tbaa !105
  %4 = getelementptr inbounds %"class.std::__1::basic_string", ptr %3, i64 -1
  store ptr %4, ptr %2, align 8, !tbaa !105
  ret ptr %0
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__128__exception_guard_exceptionsINS_29_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS2_IcEEEEEENS_16reverse_iteratorIPS7_EEEEE10__completeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(25) %0) local_unnamed_addr #7 align 2 {
  %2 = getelementptr inbounds %"struct.std::__1::__exception_guard_exceptions", ptr %0, i64 0, i32 1
  store i8 1, ptr %2, align 8, !tbaa !108
  ret void
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__128__exception_guard_exceptionsINS_29_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS2_IcEEEEEENS_16reverse_iteratorIPS7_EEEEED1B7v160006Ev(ptr noundef nonnull returned align 8 dereferenceable(25) %0) unnamed_addr #2 align 2 {
  %2 = tail call noundef ptr @_ZNSt3__128__exception_guard_exceptionsINS_29_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS2_IcEEEEEENS_16reverse_iteratorIPS7_EEEEED2B7v160006Ev(ptr noundef nonnull align 8 dereferenceable(25) %0) #24
  ret ptr %0
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__128__exception_guard_exceptionsINS_29_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS2_IcEEEEEENS_16reverse_iteratorIPS7_EEEEEC1B7v160006ESC_(ptr noundef nonnull returned align 8 dereferenceable(25) %0, ptr noundef %1) unnamed_addr #0 align 2 {
  %3 = tail call noundef ptr @_ZNSt3__128__exception_guard_exceptionsINS_29_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS2_IcEEEEEENS_16reverse_iteratorIPS7_EEEEEC2B7v160006ESC_(ptr noundef nonnull align 8 dereferenceable(25) %0, ptr noundef %1)
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__128__exception_guard_exceptionsINS_29_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS2_IcEEEEEENS_16reverse_iteratorIPS7_EEEEEC2B7v160006ESC_(ptr noundef nonnull returned align 8 dereferenceable(25) %0, ptr noundef %1) unnamed_addr #2 align 2 {
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1, i64 24, i1 false), !tbaa.struct !107
  %3 = getelementptr inbounds %"struct.std::__1::__exception_guard_exceptions", ptr %0, i64 0, i32 1
  store i8 0, ptr %3, align 8, !tbaa !108
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__129_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEENS_16reverse_iteratorIPS6_EEEC2B7v160006ERS7_RSA_SD_(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef nonnull align 1 dereferenceable(1) %1, ptr noundef nonnull align 8 dereferenceable(16) %2, ptr noundef nonnull align 8 dereferenceable(16) %3) unnamed_addr #2 align 2 {
  store ptr %1, ptr %0, align 8, !tbaa !43
  %5 = getelementptr inbounds %"class.std::__1::_AllocatorDestroyRangeReverse", ptr %0, i64 0, i32 1
  store ptr %2, ptr %5, align 8, !tbaa !43
  %6 = getelementptr inbounds %"class.std::__1::_AllocatorDestroyRangeReverse", ptr %0, i64 0, i32 2
  store ptr %3, ptr %6, align 8, !tbaa !43
  ret ptr %0
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__119__to_address_helperINS_16reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEvE6__callB7v160006ERKS9_(ptr noundef nonnull align 8 dereferenceable(16) %0) local_unnamed_addr #7 align 2 personality ptr @__gxx_personality_v0 {
  %2 = invoke noundef ptr @_ZNKSt3__116reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEptB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %0)
          to label %3 unwind label %5

3:                                                ; preds = %1
  %4 = tail call noundef ptr @_ZNSt3__112__to_addressB7v160006INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEPT_S8_(ptr noundef %2) #24
  ret ptr %4

5:                                                ; preds = %1
  %6 = landingpad { ptr, i32 }
          catch ptr null
  %7 = extractvalue { ptr, i32 } %6, 0
  tail call void @__clang_call_terminate(ptr %7) #27
  unreachable
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNKSt3__116reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEptB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) local_unnamed_addr #4 align 2 {
  %2 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__116reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEdeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %0)
  ret ptr %2
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__128__exception_guard_exceptionsINS_29_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS2_IcEEEEEENS_16reverse_iteratorIPS7_EEEEED2B7v160006Ev(ptr noundef nonnull returned align 8 dereferenceable(25) %0) unnamed_addr #2 align 2 personality ptr @__gxx_personality_v0 {
  %2 = getelementptr inbounds %"struct.std::__1::__exception_guard_exceptions", ptr %0, i64 0, i32 1
  %3 = load i8, ptr %2, align 8, !tbaa !108, !range !78, !noundef !79
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %5, label %6

5:                                                ; preds = %1
  invoke void @_ZNKSt3__129_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEENS_16reverse_iteratorIPS6_EEEclB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0)
          to label %6 unwind label %7

6:                                                ; preds = %5, %1
  ret ptr %0

7:                                                ; preds = %5
  %8 = landingpad { ptr, i32 }
          catch ptr null
  %9 = extractvalue { ptr, i32 } %8, 0
  tail call void @__clang_call_terminate(ptr %9) #27
  unreachable
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden void @_ZNKSt3__129_AllocatorDestroyRangeReverseINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEENS_16reverse_iteratorIPS6_EEEclB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #4 align 2 {
  %2 = alloca %"class.std::__1::reverse_iterator.15", align 8
  %3 = alloca %"class.std::__1::reverse_iterator.15", align 8
  %4 = load ptr, ptr %0, align 8, !tbaa !111
  %5 = getelementptr inbounds %"class.std::__1::_AllocatorDestroyRangeReverse", ptr %0, i64 0, i32 2
  %6 = load ptr, ptr %5, align 8, !tbaa !112
  %7 = load i64, ptr %6, align 8
  %8 = getelementptr inbounds i8, ptr %6, i64 8
  %9 = load i64, ptr %8, align 8
  %10 = insertvalue [2 x i64] poison, i64 %7, 0
  %11 = insertvalue [2 x i64] %10, i64 %9, 1
  %12 = call noundef ptr @_ZNSt3__116reverse_iteratorINS0_IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEEC1B7v160006ES8_(ptr noundef nonnull align 8 dereferenceable(40) %2, [2 x i64] %11)
  %13 = getelementptr inbounds %"class.std::__1::_AllocatorDestroyRangeReverse", ptr %0, i64 0, i32 1
  %14 = load ptr, ptr %13, align 8, !tbaa !113
  %15 = load i64, ptr %14, align 8
  %16 = getelementptr inbounds i8, ptr %14, i64 8
  %17 = load i64, ptr %16, align 8
  %18 = insertvalue [2 x i64] poison, i64 %15, 0
  %19 = insertvalue [2 x i64] %18, i64 %17, 1
  %20 = call noundef ptr @_ZNSt3__116reverse_iteratorINS0_IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEEC1B7v160006ES8_(ptr noundef nonnull align 8 dereferenceable(40) %3, [2 x i64] %19)
  call void @_ZNSt3__119__allocator_destroyB7v160006INS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEENS_16reverse_iteratorINS8_IPS6_EEEESB_EEvRT_T0_T1_(ptr noundef nonnull align 1 dereferenceable(1) %4, ptr noundef nonnull %2, ptr noundef nonnull %3)
  ret void
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__119__allocator_destroyB7v160006INS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEENS_16reverse_iteratorINS8_IPS6_EEEESB_EEvRT_T0_T1_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %1, ptr noundef %2) local_unnamed_addr #4 {
  %4 = tail call noundef zeroext i1 @_ZNSt3__1neB7v160006INS_16reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEES9_EEbRKNS1_IT_EERKNS1_IT0_EE(ptr noundef nonnull align 8 dereferenceable(40) %1, ptr noundef nonnull align 8 dereferenceable(40) %2)
  br i1 %4, label %5, label %9

5:                                                ; preds = %3, %5
  %6 = tail call noundef ptr @_ZNSt3__112__to_addressB7v160006INS_16reverse_iteratorINS1_IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEEEvEENS_5decayIDTclsr19__to_address_helperIT_EE6__callclsr3stdE7declvalIRKSC_EEEEE4typeESE_(ptr noundef nonnull align 8 dereferenceable(40) %1) #24
  tail call void @_ZNSt3__116allocator_traitsINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEE7destroyB7v160006IS6_vEEvRS7_PT_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %6)
  %7 = tail call noundef nonnull align 8 dereferenceable(40) ptr @_ZNSt3__116reverse_iteratorINS0_IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEEppB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(40) %1)
  %8 = tail call noundef zeroext i1 @_ZNSt3__1neB7v160006INS_16reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEES9_EEbRKNS1_IT_EERKNS1_IT0_EE(ptr noundef nonnull align 8 dereferenceable(40) %1, ptr noundef nonnull align 8 dereferenceable(40) %2)
  br i1 %8, label %5, label %9, !llvm.loop !114

9:                                                ; preds = %5, %3
  ret void
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__116reverse_iteratorINS0_IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEEC1B7v160006ES8_(ptr noundef nonnull returned align 8 dereferenceable(40) %0, [2 x i64] %1) unnamed_addr #0 align 2 {
  %3 = tail call noundef ptr @_ZNSt3__116reverse_iteratorINS0_IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEEC2B7v160006ES8_(ptr noundef nonnull align 8 dereferenceable(40) %0, [2 x i64] %1)
  ret ptr %0
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef zeroext i1 @_ZNSt3__1neB7v160006INS_16reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEES9_EEbRKNS1_IT_EERKNS1_IT0_EE(ptr noundef nonnull align 8 dereferenceable(40) %0, ptr noundef nonnull align 8 dereferenceable(40) %1) local_unnamed_addr #4 {
  %3 = alloca %"class.std::__1::reverse_iterator.14", align 8
  %4 = alloca %"class.std::__1::reverse_iterator.14", align 8
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %3) #24
  %5 = tail call [2 x i64] @_ZNKSt3__116reverse_iteratorINS0_IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEE4baseB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(40) %0)
  %6 = extractvalue [2 x i64] %5, 0
  store i64 %6, ptr %3, align 8
  %7 = extractvalue [2 x i64] %5, 1
  %8 = getelementptr inbounds [2 x i64], ptr %3, i64 0, i64 1
  store i64 %7, ptr %8, align 8
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %4) #24
  %9 = tail call [2 x i64] @_ZNKSt3__116reverse_iteratorINS0_IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEE4baseB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(40) %1)
  %10 = extractvalue [2 x i64] %9, 0
  store i64 %10, ptr %4, align 8
  %11 = extractvalue [2 x i64] %9, 1
  %12 = getelementptr inbounds [2 x i64], ptr %4, i64 0, i64 1
  store i64 %11, ptr %12, align 8
  %13 = call noundef zeroext i1 @_ZNSt3__1neB7v160006IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES7_EEbRKNS_16reverse_iteratorIT_EERKNS8_IT0_EE(ptr noundef nonnull align 8 dereferenceable(16) %3, ptr noundef nonnull align 8 dereferenceable(16) %4)
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %4) #24
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %3) #24
  ret i1 %13
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__112__to_addressB7v160006INS_16reverse_iteratorINS1_IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEEEvEENS_5decayIDTclsr19__to_address_helperIT_EE6__callclsr3stdE7declvalIRKSC_EEEEE4typeESE_(ptr noundef nonnull align 8 dereferenceable(40) %0) local_unnamed_addr #7 {
  %2 = tail call noundef ptr @_ZNSt3__119__to_address_helperINS_16reverse_iteratorINS1_IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEEEvE6__callB7v160006ERKSA_(ptr noundef nonnull align 8 dereferenceable(40) %0) #24
  ret ptr %2
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(40) ptr @_ZNSt3__116reverse_iteratorINS0_IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEEppB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(40) %0) local_unnamed_addr #7 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::reverse_iterator.15", ptr %0, i64 0, i32 2
  %3 = tail call noundef nonnull align 8 dereferenceable(16) ptr @_ZNSt3__116reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEmmB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %2)
  ret ptr %0
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden [2 x i64] @_ZNKSt3__116reverse_iteratorINS0_IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEE4baseB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(40) %0) local_unnamed_addr #7 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::reverse_iterator.15", ptr %0, i64 0, i32 2
  %3 = load i64, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::reverse_iterator.15", ptr %0, i64 0, i32 2, i32 1
  %5 = load i64, ptr %4, align 8
  %6 = insertvalue [2 x i64] poison, i64 %3, 0
  %7 = insertvalue [2 x i64] %6, i64 %5, 1
  ret [2 x i64] %7
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__119__to_address_helperINS_16reverse_iteratorINS1_IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEEEvE6__callB7v160006ERKSA_(ptr noundef nonnull align 8 dereferenceable(40) %0) local_unnamed_addr #7 align 2 personality ptr @__gxx_personality_v0 {
  %2 = invoke noundef ptr @_ZNKSt3__116reverse_iteratorINS0_IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEEptB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(40) %0)
          to label %3 unwind label %5

3:                                                ; preds = %1
  %4 = tail call noundef ptr @_ZNSt3__112__to_addressB7v160006INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEPT_S8_(ptr noundef %2) #24
  ret ptr %4

5:                                                ; preds = %1
  %6 = landingpad { ptr, i32 }
          catch ptr null
  %7 = extractvalue { ptr, i32 } %6, 0
  tail call void @__clang_call_terminate(ptr %7) #27
  unreachable
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNKSt3__116reverse_iteratorINS0_IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEEptB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(40) %0) local_unnamed_addr #4 align 2 {
  %2 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__116reverse_iteratorINS0_IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEEdeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(40) %0)
  ret ptr %2
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__116reverse_iteratorINS0_IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEEdeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(40) %0) local_unnamed_addr #4 align 2 {
  %2 = alloca %"class.std::__1::reverse_iterator.14", align 8
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %2) #24
  %3 = getelementptr inbounds %"class.std::__1::reverse_iterator.15", ptr %0, i64 0, i32 2
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %2, ptr noundef nonnull align 8 dereferenceable(16) %3, i64 16, i1 false)
  %4 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZNSt3__116reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEmmB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %2)
  %5 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__116reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEdeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %4)
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %2) #24
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(16) ptr @_ZNSt3__116reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEmmB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) local_unnamed_addr #7 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::reverse_iterator.14", ptr %0, i64 0, i32 1
  %3 = load ptr, ptr %2, align 8, !tbaa !105
  %4 = getelementptr inbounds %"class.std::__1::basic_string", ptr %3, i64 1
  store ptr %4, ptr %2, align 8, !tbaa !105
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__116reverse_iteratorINS0_IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEEC2B7v160006ES8_(ptr noundef nonnull returned align 8 dereferenceable(40) %0, [2 x i64] %1) unnamed_addr #2 align 2 {
  %3 = extractvalue [2 x i64] %1, 0
  %4 = extractvalue [2 x i64] %1, 1
  %5 = getelementptr inbounds %"class.std::__1::reverse_iterator.15", ptr %0, i64 0, i32 1
  store i64 %3, ptr %5, align 8
  %6 = getelementptr inbounds %"class.std::__1::reverse_iterator.15", ptr %0, i64 0, i32 1, i32 1
  store i64 %4, ptr %6, align 8
  %7 = getelementptr inbounds %"class.std::__1::reverse_iterator.15", ptr %0, i64 0, i32 2
  store i64 %3, ptr %7, align 8
  %8 = getelementptr inbounds %"class.std::__1::reverse_iterator.15", ptr %0, i64 0, i32 2, i32 1
  store i64 %4, ptr %8, align 8
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__116reverse_iteratorIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEC2B7v160006ES7_(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #2 align 2 {
  store ptr %1, ptr %0, align 8, !tbaa !115
  %3 = getelementptr inbounds %"class.std::__1::reverse_iterator.14", ptr %0, i64 0, i32 1
  store ptr %1, ptr %3, align 8, !tbaa !105
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEED2Ev(ptr noundef nonnull returned align 8 dereferenceable(40) %0) unnamed_addr #2 align 2 personality ptr @__gxx_personality_v0 {
  tail call void @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE5clearB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(40) %0) #24
  %2 = load ptr, ptr %0, align 8, !tbaa !99
  %3 = icmp eq ptr %2, null
  br i1 %3, label %8, label %4

4:                                                ; preds = %1
  %5 = tail call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE7__allocB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(40) %0) #24
  %6 = load ptr, ptr %0, align 8, !tbaa !99
  %7 = tail call noundef i64 @_ZNKSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE8capacityB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(40) %0)
  tail call void @_ZNSt3__116allocator_traitsINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEE10deallocateB7v160006ERS7_PS6_m(ptr noundef nonnull align 1 dereferenceable(1) %5, ptr noundef %6, i64 noundef %7) #24
  br label %8

8:                                                ; preds = %4, %1
  ret ptr %0
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE5clearB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(40) %0) local_unnamed_addr #7 align 2 {
  %2 = getelementptr inbounds %"struct.std::__1::__split_buffer", ptr %0, i64 0, i32 1
  %3 = load ptr, ptr %2, align 8, !tbaa !98
  tail call void @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE17__destruct_at_endB7v160006EPS6_(ptr noundef nonnull align 8 dereferenceable(40) %0, ptr noundef %3) #24
  ret void
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__116allocator_traitsINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEE10deallocateB7v160006ERS7_PS6_m(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %1, i64 noundef %2) local_unnamed_addr #7 align 2 {
  tail call void @_ZNSt3__19allocatorINS_12basic_stringIcNS_11char_traitsIcEENS0_IcEEEEE10deallocateB7v160006EPS5_m(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %1, i64 noundef %2) #24
  ret void
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNKSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE8capacityB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(40) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE9__end_capB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(40) %0) #24
  %3 = load ptr, ptr %2, align 8, !tbaa !43
  %4 = load ptr, ptr %0, align 8, !tbaa !99
  %5 = ptrtoint ptr %3 to i64
  %6 = ptrtoint ptr %4 to i64
  %7 = sub i64 %5, %6
  %8 = sdiv exact i64 %7, 24
  ret i64 %8
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE17__destruct_at_endB7v160006EPS6_(ptr noundef nonnull align 8 dereferenceable(40) %0, ptr noundef %1) local_unnamed_addr #7 align 2 {
  tail call void @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE17__destruct_at_endB7v160006EPS6_NS_17integral_constantIbLb0EEE(ptr noundef nonnull align 8 dereferenceable(40) %0, ptr noundef %1) #24
  ret void
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE17__destruct_at_endB7v160006EPS6_NS_17integral_constantIbLb0EEE(ptr noundef nonnull align 8 dereferenceable(40) %0, ptr noundef %1) local_unnamed_addr #7 align 2 personality ptr @__gxx_personality_v0 {
  %3 = getelementptr inbounds %"struct.std::__1::__split_buffer", ptr %0, i64 0, i32 2
  br label %4

4:                                                ; preds = %7, %2
  %5 = load ptr, ptr %3, align 8, !tbaa !92
  %6 = icmp eq ptr %5, %1
  br i1 %6, label %12, label %7

7:                                                ; preds = %4
  %8 = tail call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE7__allocB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(40) %0) #24
  %9 = load ptr, ptr %3, align 8, !tbaa !92
  %10 = getelementptr inbounds %"class.std::__1::basic_string", ptr %9, i64 -1
  store ptr %10, ptr %3, align 8, !tbaa !92
  %11 = tail call noundef ptr @_ZNSt3__112__to_addressB7v160006INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEPT_S8_(ptr noundef nonnull %10) #24
  invoke void @_ZNSt3__116allocator_traitsINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEE7destroyB7v160006IS6_vEEvRS7_PT_(ptr noundef nonnull align 1 dereferenceable(1) %8, ptr noundef %11)
          to label %4 unwind label %13, !llvm.loop !116

12:                                               ; preds = %4
  ret void

13:                                               ; preds = %7
  %14 = landingpad { ptr, i32 }
          catch ptr null
  %15 = extractvalue { ptr, i32 } %14, 0
  tail call void @__clang_call_terminate(ptr %15) #27
  unreachable
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__19allocatorINS_12basic_stringIcNS_11char_traitsIcEENS0_IcEEEEE10deallocateB7v160006EPS5_m(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %1, i64 noundef %2) local_unnamed_addr #7 align 2 personality ptr @__gxx_personality_v0 {
  %4 = mul i64 %2, 24
  invoke void @_ZNSt3__119__libcpp_deallocateB7v160006EPvmm(ptr noundef %1, i64 noundef %4, i64 noundef 8)
          to label %5 unwind label %6

5:                                                ; preds = %3
  ret void

6:                                                ; preds = %3
  %7 = landingpad { ptr, i32 }
          catch ptr null
  %8 = extractvalue { ptr, i32 } %7, 0
  tail call void @__clang_call_terminate(ptr %8) #27
  unreachable
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__114__split_bufferINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE9__end_capB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(40) %0) local_unnamed_addr #7 align 2 {
  %2 = getelementptr inbounds %"struct.std::__1::__split_buffer", ptr %0, i64 0, i32 3
  %3 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %2) #24
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERNS4_IS6_EEE5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__122__compressed_pair_elemIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEELi0ELb0EE5__getB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) #24
  ret ptr %2
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEC2B7v160006Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #2 align 2 personality ptr @__gxx_personality_v0 {
  %2 = alloca ptr, align 8
  %3 = alloca %"struct.std::__1::__default_init_tag", align 1
  %4 = getelementptr inbounds %"class.std::__1::vector", ptr %0, i64 0, i32 2
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %0, i8 0, i64 16, i1 false)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %2) #24
  store ptr null, ptr %2, align 8, !tbaa !100
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %3) #24
  %5 = invoke noundef ptr @_ZNSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEC1B7v160006IDnNS_18__default_init_tagEEEOT_OT0_(ptr noundef nonnull align 8 dereferenceable(8) %4, ptr noundef nonnull align 8 dereferenceable(8) %2, ptr noundef nonnull align 1 dereferenceable(1) %3)
          to label %6 unwind label %7

6:                                                ; preds = %1
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %3) #24
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %2) #24
  call void @_ZNSt3__119__debug_db_insert_cB7v160006INS_6vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS5_IS7_EEEEEEvPT_(ptr noundef nonnull %0)
  ret ptr %0

7:                                                ; preds = %1
  %8 = landingpad { ptr, i32 }
          catch ptr null
  %9 = extractvalue { ptr, i32 } %8, 0
  call void @__clang_call_terminate(ptr %9) #27
  unreachable
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEC1B7v160006IDnNS_18__default_init_tagEEEOT_OT0_(ptr noundef nonnull returned align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 1 dereferenceable(1) %2) unnamed_addr #0 align 2 {
  %4 = tail call noundef ptr @_ZNSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEC2B7v160006IDnNS_18__default_init_tagEEEOT_OT0_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 1 dereferenceable(1) %2)
  ret ptr %0
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__119__debug_db_insert_cB7v160006INS_6vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS5_IS7_EEEEEEvPT_(ptr noundef %0) local_unnamed_addr #7 {
  ret void
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNSt3__117__compressed_pairIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEEC2B7v160006IDnNS_18__default_init_tagEEEOT_OT0_(ptr noundef nonnull returned align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 1 dereferenceable(1) %2) unnamed_addr #0 align 2 {
  %4 = tail call noundef ptr @_ZNSt3__122__compressed_pair_elemIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEELi0ELb0EEC2B7v160006IDnvEEOT_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1)
  %5 = tail call noundef ptr @_ZNSt3__122__compressed_pair_elemINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEELi1ELb1EEC2B7v160006ENS_18__default_init_tagE(ptr noundef nonnull align 1 dereferenceable(1) %0)
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__122__compressed_pair_elemINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEELi1ELb1EEC2B7v160006ENS_18__default_init_tagE(ptr noundef nonnull returned align 1 dereferenceable(1) %0) unnamed_addr #2 align 2 {
  %2 = tail call noundef ptr @_ZNSt3__19allocatorINS_12basic_stringIcNS_11char_traitsIcEENS0_IcEEEEEC2B7v160006Ev(ptr noundef nonnull align 1 dereferenceable(1) %0) #24
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__19allocatorINS_12basic_stringIcNS_11char_traitsIcEENS0_IcEEEEEC2B7v160006Ev(ptr noundef nonnull returned align 1 dereferenceable(1) %0) unnamed_addr #2 align 2 {
  %2 = tail call noundef ptr @_ZNSt3__116__non_trivial_ifILb1ENS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEEC2B7v160006Ev(ptr noundef nonnull align 1 dereferenceable(1) %0) #24
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__116__non_trivial_ifILb1ENS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEEC2B7v160006Ev(ptr noundef nonnull returned align 1 dereferenceable(1) %0) unnamed_addr #2 align 2 {
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEED2B7v160006Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #2 align 2 personality ptr @__gxx_personality_v0 {
  %2 = alloca %"class.std::__1::vector<std::__1::string>::__destroy_vector", align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %2) #24
  %3 = invoke noundef ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE16__destroy_vectorC1ERS8_(ptr noundef nonnull align 8 dereferenceable(8) %2, ptr noundef nonnull align 8 dereferenceable(24) %0)
          to label %4 unwind label %6

4:                                                ; preds = %1
  invoke void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE16__destroy_vectorclB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(8) %2)
          to label %5 unwind label %6

5:                                                ; preds = %4
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %2) #24
  ret ptr %0

6:                                                ; preds = %4, %1
  %7 = landingpad { ptr, i32 }
          catch ptr null
  %8 = extractvalue { ptr, i32 } %7, 0
  call void @__clang_call_terminate(ptr %8) #27
  unreachable
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE16__destroy_vectorC1ERS8_(ptr noundef nonnull returned align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #0 align 2 {
  %3 = tail call noundef ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE16__destroy_vectorC2ERS8_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(24) %1)
  ret ptr %0
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE16__destroy_vectorclB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) local_unnamed_addr #4 align 2 {
  %2 = load ptr, ptr %0, align 8, !tbaa !117
  tail call void @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE17__annotate_deleteB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %2) #24
  %3 = load ptr, ptr %0, align 8, !tbaa !117
  tail call void @_ZNSt3__118__debug_db_erase_cB7v160006INS_6vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS5_IS7_EEEEEEvPT_(ptr noundef %3)
  %4 = load ptr, ptr %0, align 8, !tbaa !117
  %5 = load ptr, ptr %4, align 8, !tbaa !39
  %6 = icmp eq ptr %5, null
  br i1 %6, label %13, label %7

7:                                                ; preds = %1
  tail call void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE7__clearB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #24
  %8 = load ptr, ptr %0, align 8, !tbaa !117
  %9 = tail call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE7__allocB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %8) #24
  %10 = load ptr, ptr %0, align 8, !tbaa !117
  %11 = load ptr, ptr %10, align 8, !tbaa !39
  %12 = tail call noundef i64 @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE8capacityB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %10) #24
  tail call void @_ZNSt3__116allocator_traitsINS_9allocatorINS_12basic_stringIcNS_11char_traitsIcEENS1_IcEEEEEEE10deallocateB7v160006ERS7_PS6_m(ptr noundef nonnull align 1 dereferenceable(1) %9, ptr noundef %11, i64 noundef %12) #24
  br label %13

13:                                               ; preds = %7, %1
  ret void
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE16__destroy_vectorC2ERS8_(ptr noundef nonnull returned align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #2 align 2 {
  store ptr %1, ptr %0, align 8, !tbaa !43
  ret ptr %0
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__118__debug_db_erase_cB7v160006INS_6vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS5_IS7_EEEEEEvPT_(ptr noundef %0) local_unnamed_addr #7 {
  ret void
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE7__clearB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = load ptr, ptr %0, align 8, !tbaa !39
  tail call void @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE22__base_destruct_at_endB7v160006EPS6_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %2) #24
  ret void
}

declare noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6assignEPKc(ptr noundef nonnull align 8 dereferenceable(24), ptr noundef) local_unnamed_addr #8

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr void @_ZNSt3__116allocator_traitsINS_9allocatorIcEEE37select_on_container_copy_constructionB7v160006IS2_vvEES2_RKS2_(ptr noundef nonnull align 1 dereferenceable(1) %0) local_unnamed_addr #7 align 2 {
  ret void
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden void @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13get_allocatorB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = tail call noundef nonnull align 1 dereferenceable(1) ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7__allocB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  ret void
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B7v160006ENS_24__uninitialized_size_tagEmRKS4_(ptr noundef nonnull returned align 8 dereferenceable(24) %0, i64 noundef %1, ptr noundef nonnull align 1 dereferenceable(1) %2) unnamed_addr #0 align 2 {
  %4 = tail call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B7v160006ENS_24__uninitialized_size_tagEmRKS4_(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1, ptr noundef nonnull align 1 dereferenceable(1) %2)
  ret ptr %0
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B7v160006ENS_24__uninitialized_size_tagEmRKS4_(ptr noundef nonnull returned align 8 dereferenceable(24) %0, i64 noundef %1, ptr noundef nonnull align 1 dereferenceable(1) %2) unnamed_addr #0 align 2 {
  %4 = alloca %"struct.std::__1::__default_init_tag", align 1
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %4) #24
  %5 = call noundef ptr @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC1B7v160006INS_18__default_init_tagERKS5_EEOT_OT0_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 1 dereferenceable(1) %4, ptr noundef nonnull align 1 dereferenceable(1) %2)
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %4) #24
  %6 = call noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE8max_sizeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %7 = icmp ult i64 %6, %1
  br i1 %7, label %8, label %9

8:                                                ; preds = %3
  call void @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE20__throw_length_errorB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #25
  unreachable

9:                                                ; preds = %3
  %10 = call noundef zeroext i1 @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__fits_in_ssoB7v160006Em(i64 noundef %1)
  br i1 %10, label %11, label %13

11:                                               ; preds = %9
  %12 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(24) %12, i8 0, i64 24, i1 false)
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16__set_short_sizeB7v160006Em(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) #24
  br label %18

13:                                               ; preds = %9
  %14 = call noundef i64 @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE11__recommendB7v160006Em(i64 noundef %1) #24
  %15 = add i64 %14, 1
  %16 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7__allocB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %17 = call noundef ptr @_ZNSt3__116allocator_traitsINS_9allocatorIcEEE8allocateB7v160006ERS2_m(ptr noundef nonnull align 1 dereferenceable(1) %16, i64 noundef %15)
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16__begin_lifetimeB7v160006EPcm(ptr noundef %17, i64 noundef %15)
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE14__set_long_capB7v160006Em(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %15) #24
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__set_long_pointerB7v160006EPc(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %17) #24
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE15__set_long_sizeB7v160006Em(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) #24
  br label %18

18:                                               ; preds = %13, %11
  call void @_ZNSt3__119__debug_db_insert_cB7v160006INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEvPT_(ptr noundef nonnull %0)
  ret ptr %0
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC1B7v160006INS_18__default_init_tagERKS5_EEOT_OT0_(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef nonnull align 1 dereferenceable(1) %1, ptr noundef nonnull align 1 dereferenceable(1) %2) unnamed_addr #0 align 2 {
  %4 = tail call noundef ptr @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC2B7v160006INS_18__default_init_tagERKS5_EEOT_OT0_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 1 dereferenceable(1) %1, ptr noundef nonnull align 1 dereferenceable(1) %2)
  ret ptr %0
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__116allocator_traitsINS_9allocatorIcEEE8allocateB7v160006ERS2_m(ptr noundef nonnull align 1 dereferenceable(1) %0, i64 noundef %1) local_unnamed_addr #4 align 2 {
  %3 = tail call noundef ptr @_ZNSt3__19allocatorIcE8allocateB7v160006Em(ptr noundef nonnull align 1 dereferenceable(1) %0, i64 noundef %1)
  ret ptr %3
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC2B7v160006INS_18__default_init_tagERKS5_EEOT_OT0_(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef nonnull align 1 dereferenceable(1) %1, ptr noundef nonnull align 1 dereferenceable(1) %2) unnamed_addr #0 align 2 {
  %4 = tail call noundef ptr @_ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EEC2B7v160006ENS_18__default_init_tagE(ptr noundef nonnull align 8 dereferenceable(24) %0)
  %5 = tail call noundef ptr @_ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EEC2B7v160006IRKS2_vEEOT_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef nonnull align 1 dereferenceable(1) %2)
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EEC2B7v160006IRKS2_vEEOT_(ptr noundef nonnull returned align 1 dereferenceable(1) %0, ptr noundef nonnull align 1 dereferenceable(1) %1) unnamed_addr #2 align 2 {
  ret ptr %0
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6assignINS0_17constant_iteratorIcEEEERS5_T_SA_PNS_11move_detail22disable_if_convertibleISA_mvE4typeE(ptr noundef nonnull align 8 dereferenceable(24) %0, [2 x i64] %1, [2 x i64] %2, ptr noundef %3) local_unnamed_addr #4 align 2 {
  %5 = extractvalue [2 x i64] %1, 0
  %6 = inttoptr i64 %5 to ptr
  %7 = extractvalue [2 x i64] %1, 1
  %8 = extractvalue [2 x i64] %2, 1
  %9 = load i8, ptr %0, align 8, !tbaa !5
  %10 = and i8 %9, 1
  %11 = icmp eq i8 %10, 0
  %12 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %0, i64 0, i32 1
  %13 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 2
  %14 = load ptr, ptr %13, align 8
  %15 = select i1 %11, ptr %14, ptr %12
  %16 = lshr i8 %9, 1
  %17 = zext i8 %16 to i64
  %18 = load i64, ptr %0, align 8
  %19 = lshr i64 %18, 1
  %20 = select i1 %11, i64 %19, i64 %17
  %21 = icmp ne i64 %7, %8
  %22 = icmp ne i64 %20, 0
  %23 = select i1 %21, i1 %22, i1 false
  br i1 %23, label %24, label %34

24:                                               ; preds = %4, %24
  %25 = phi i64 [ %29, %24 ], [ 0, %4 ]
  %26 = phi ptr [ %30, %24 ], [ %15, %4 ]
  %27 = phi i64 [ %28, %24 ], [ %7, %4 ]
  tail call void @_ZNSt3__111char_traitsIcE6assignERcRKc(ptr noundef nonnull align 1 dereferenceable(1) %26, ptr noundef nonnull align 1 dereferenceable(1) %6) #24
  %28 = add i64 %27, -1
  %29 = add nuw nsw i64 %25, 1
  %30 = getelementptr inbounds i8, ptr %26, i64 1
  %31 = icmp ne i64 %28, %8
  %32 = icmp ne i64 %29, %20
  %33 = select i1 %31, i1 %32, i1 false
  br i1 %33, label %24, label %34, !llvm.loop !119

34:                                               ; preds = %24, %4
  %35 = phi i64 [ %7, %4 ], [ %28, %24 ]
  %36 = phi i64 [ 0, %4 ], [ %29, %24 ]
  %37 = icmp eq i64 %35, %8
  br i1 %37, label %38, label %42

38:                                               ; preds = %34
  %39 = getelementptr inbounds i8, ptr %15, i64 %36
  %40 = getelementptr inbounds i8, ptr %15, i64 %20
  %41 = tail call noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE5eraseEPKcS7_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %39, ptr noundef %40) #24
  br label %45

42:                                               ; preds = %34
  %43 = insertvalue [2 x i64] %1, i64 %35, 1
  %44 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6appendINS0_17constant_iteratorIcEEEERS5_T_SA_(ptr noundef nonnull align 8 dereferenceable(24) %0, [2 x i64] %43, [2 x i64] %2)
  br label %45

45:                                               ; preds = %42, %38
  ret ptr %0
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6appendINS0_17constant_iteratorIcEEEERS5_T_SA_(ptr noundef nonnull align 8 dereferenceable(24) %0, [2 x i64] %1, [2 x i64] %2) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %4 = load i8, ptr %0, align 8, !tbaa !5
  %5 = and i8 %4, 1
  %6 = icmp eq i8 %5, 0
  %7 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %0, i64 0, i32 1
  %8 = lshr i8 %4, 1
  %9 = zext i8 %8 to i64
  %10 = getelementptr inbounds i8, ptr %7, i64 %9
  %11 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 2
  %12 = load ptr, ptr %11, align 8
  %13 = load i64, ptr %0, align 8
  %14 = lshr i64 %13, 1
  %15 = getelementptr inbounds i8, ptr %12, i64 %14
  %16 = select i1 %6, ptr %15, ptr %10
  %17 = tail call noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6insertINS0_17constant_iteratorIcEEEEPcPKcT_SC_PNS_11move_detail13disable_if_orIvNSD_14is_convertibleISC_mEENS0_3dtl17is_input_iteratorISC_Xsr21has_iterator_categoryISC_EE5valueEEENSD_5bool_ILb0EEESL_E4typeE(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %16, [2 x i64] %1, [2 x i64] %2, ptr noundef null)
  ret ptr %0
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6insertINS0_17constant_iteratorIcEEEEPcPKcT_SC_PNS_11move_detail13disable_if_orIvNSD_14is_convertibleISC_mEENS0_3dtl17is_input_iteratorISC_Xsr21has_iterator_categoryISC_EE5valueEEENSD_5bool_ILb0EEESL_E4typeE(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1, [2 x i64] %2, [2 x i64] %3, ptr noundef %4) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = extractvalue [2 x i64] %2, 1
  %9 = extractvalue [2 x i64] %3, 1
  %10 = load i8, ptr %0, align 8, !tbaa !5
  %11 = and i8 %10, 1
  %12 = icmp eq i8 %11, 0
  %13 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %0, i64 0, i32 1
  %14 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 2
  %15 = load ptr, ptr %14, align 8
  %16 = ptrtoint ptr %1 to i64
  %17 = icmp eq i64 %8, %9
  br i1 %17, label %172, label %18

18:                                               ; preds = %5
  %19 = sub i64 %8, %9
  %20 = lshr i8 %10, 1
  %21 = zext i8 %20 to i64
  %22 = load i64, ptr %0, align 8
  %23 = lshr i64 %22, 1
  %24 = select i1 %12, i64 %23, i64 %21
  %25 = load i8, ptr %0, align 8, !tbaa !5
  %26 = and i8 %25, 1
  %27 = icmp eq i8 %26, 0
  %28 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 1
  %29 = load i64, ptr %28, align 8
  %30 = add i64 %29, -1
  %31 = select i1 %27, i64 %30, i64 22
  %32 = sub i64 %31, %24
  %33 = select i1 %27, ptr %15, ptr %13
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %6) #24
  store i64 0, ptr %6, align 8, !tbaa !32
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %7) #24
  store ptr null, ptr %7, align 8, !tbaa !43
  %34 = icmp ult i64 %32, %19
  br i1 %34, label %35, label %47

35:                                               ; preds = %18
  %36 = tail call noundef i64 @_ZNK5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE13next_capacityEm(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %19)
  store i64 %36, ptr %6, align 8, !tbaa !32
  store ptr %33, ptr %7, align 8, !tbaa !43
  %37 = add i64 %24, %19
  %38 = add i64 %37, 1
  %39 = call noundef ptr @_ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE18allocation_commandEjmRmRPc(ptr noundef nonnull align 8 dereferenceable(24) %0, i32 noundef 7, i64 noundef %38, ptr noundef nonnull align 8 dereferenceable(8) %6, ptr noundef nonnull align 8 dereferenceable(8) %7)
  %40 = icmp eq ptr %33, %39
  br i1 %40, label %41, label %47

41:                                               ; preds = %35
  %42 = load i8, ptr %0, align 8, !tbaa !5
  %43 = and i8 %42, 1
  %44 = icmp eq i8 %43, 0
  br i1 %44, label %45, label %47

45:                                               ; preds = %41
  %46 = load i64, ptr %6, align 8, !tbaa !32
  store i64 %46, ptr %28, align 8, !tbaa !57
  br label %47

47:                                               ; preds = %45, %41, %18, %35
  %48 = phi ptr [ %39, %35 ], [ null, %18 ], [ %39, %41 ], [ %39, %45 ]
  %49 = phi i1 [ false, %35 ], [ true, %18 ], [ true, %41 ], [ true, %45 ]
  br i1 %49, label %50, label %119

50:                                               ; preds = %47
  %51 = ptrtoint ptr %33 to i64
  %52 = sub i64 %51, %16
  %53 = add i64 %52, %24
  %54 = icmp ugt i64 %19, %53
  %55 = add nuw i64 %24, 1
  br i1 %54, label %66, label %56

56:                                               ; preds = %50
  %57 = add nuw i64 %24, 1
  %58 = getelementptr inbounds i8, ptr %33, i64 %57
  %59 = sub i64 %55, %19
  %60 = getelementptr inbounds i8, ptr %33, i64 %59
  %61 = call noundef i64 @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE23priv_uninitialized_copyIPcS7_EEmT_S8_T0_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %60, ptr noundef nonnull %58, ptr noundef nonnull %58)
  %62 = getelementptr inbounds i8, ptr %1, i64 %19
  %63 = sub i64 1, %19
  %64 = add i64 %63, %53
  %65 = call noundef ptr @_ZNSt3__111char_traitsIcE4moveEPcPKcm(ptr noundef %62, ptr noundef %1, i64 noundef %64) #24
  br label %95

66:                                               ; preds = %50
  %67 = xor i64 %53, -1
  %68 = add i64 %8, %67
  %69 = getelementptr inbounds i8, ptr %33, i64 %55
  %70 = insertvalue [2 x i64] %2, i64 %68, 1
  %71 = call noundef i64 @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE23priv_uninitialized_copyINS0_17constant_iteratorIcEEPcEEmT_SA_T0_(ptr noundef nonnull align 8 dereferenceable(24) %0, [2 x i64] %70, [2 x i64] %3, ptr noundef nonnull %69)
  %72 = sub i64 %19, %53
  %73 = add i64 %72, %24
  %74 = load i8, ptr %0, align 8, !tbaa !5
  %75 = and i8 %74, 1
  %76 = icmp eq i8 %75, 0
  br i1 %76, label %84, label %77

77:                                               ; preds = %66
  %78 = icmp ugt i64 %73, 127
  br i1 %78, label %79, label %80, !prof !19

79:                                               ; preds = %77
  call void @__assert_rtn(ptr noundef nonnull @__func__._ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE15priv_short_sizeEm, ptr noundef nonnull @.str.47, i32 noundef 484, ptr noundef nonnull @.str.49) #26
  unreachable

80:                                               ; preds = %77
  %81 = trunc i64 %73 to i8
  %82 = shl i8 %81, 1
  %83 = or i8 %75, %82
  store i8 %83, ptr %0, align 8
  br label %92

84:                                               ; preds = %66
  %85 = icmp slt i64 %73, 0
  br i1 %85, label %86, label %87, !prof !19

86:                                               ; preds = %84
  call void @__assert_rtn(ptr noundef nonnull @__func__._ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE14priv_long_sizeEm, ptr noundef nonnull @.str.47, i32 noundef 492, ptr noundef nonnull @.str.49) #26
  unreachable

87:                                               ; preds = %84
  %88 = load i64, ptr %0, align 8
  %89 = shl i64 %73, 1
  %90 = and i64 %88, 1
  %91 = or i64 %90, %89
  store i64 %91, ptr %0, align 8
  br label %92

92:                                               ; preds = %80, %87
  %93 = getelementptr inbounds i8, ptr %33, i64 %73
  %94 = call noundef i64 @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE23priv_uninitialized_copyIPKcPcEEmT_SA_T0_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1, ptr noundef nonnull %69, ptr noundef %93)
  br label %95

95:                                               ; preds = %92, %56
  %96 = phi [2 x i64] [ %70, %92 ], [ %3, %56 ]
  call void @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE9priv_copyINS0_17constant_iteratorIcEEPcEEvT_SA_T0_([2 x i64] %2, [2 x i64] %96, ptr noundef %1)
  %97 = add i64 %24, %19
  %98 = load i8, ptr %0, align 8, !tbaa !5
  %99 = and i8 %98, 1
  %100 = icmp eq i8 %99, 0
  br i1 %100, label %108, label %101

101:                                              ; preds = %95
  %102 = icmp ugt i64 %97, 127
  br i1 %102, label %103, label %104, !prof !19

103:                                              ; preds = %101
  call void @__assert_rtn(ptr noundef nonnull @__func__._ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE15priv_short_sizeEm, ptr noundef nonnull @.str.47, i32 noundef 484, ptr noundef nonnull @.str.49) #26
  unreachable

104:                                              ; preds = %101
  %105 = trunc i64 %97 to i8
  %106 = shl i8 %105, 1
  %107 = or i8 %99, %106
  store i8 %107, ptr %0, align 8
  br label %116

108:                                              ; preds = %95
  %109 = icmp slt i64 %97, 0
  br i1 %109, label %110, label %111, !prof !19

110:                                              ; preds = %108
  call void @__assert_rtn(ptr noundef nonnull @__func__._ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE14priv_long_sizeEm, ptr noundef nonnull @.str.47, i32 noundef 492, ptr noundef nonnull @.str.49) #26
  unreachable

111:                                              ; preds = %108
  %112 = load i64, ptr %0, align 8
  %113 = shl i64 %97, 1
  %114 = and i64 %112, 1
  %115 = or i64 %114, %113
  store i64 %115, ptr %0, align 8
  br label %116

116:                                              ; preds = %104, %111
  %117 = getelementptr inbounds i8, ptr %33, i64 %97
  %118 = call noundef ptr @_ZnwmPv21boost_container_new_t(i64 noundef 1, ptr noundef %117)
  store i8 0, ptr %118, align 1, !tbaa !5
  br label %171

119:                                              ; preds = %47
  %120 = load ptr, ptr %7, align 8, !tbaa !43
  %121 = icmp eq ptr %120, null
  br i1 %121, label %122, label %149

122:                                              ; preds = %119
  %123 = call noundef i64 @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE23priv_uninitialized_copyIPKcPcEEmT_SA_T0_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %33, ptr noundef %1, ptr noundef %48)
  %124 = getelementptr inbounds i8, ptr %48, i64 %123
  %125 = call noundef i64 @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE23priv_uninitialized_copyINS0_17constant_iteratorIcEEPcEEmT_SA_T0_(ptr noundef nonnull align 8 dereferenceable(24) %0, [2 x i64] %2, [2 x i64] %3, ptr noundef %124)
  %126 = add i64 %125, %123
  %127 = getelementptr inbounds i8, ptr %33, i64 %24
  %128 = getelementptr inbounds i8, ptr %48, i64 %126
  %129 = call noundef i64 @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE23priv_uninitialized_copyIPKcPcEEmT_SA_T0_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1, ptr noundef %127, ptr noundef %128)
  %130 = add i64 %126, %129
  %131 = getelementptr inbounds i8, ptr %48, i64 %130
  %132 = call noundef ptr @_ZnwmPv21boost_container_new_t(i64 noundef 1, ptr noundef %131)
  store i8 0, ptr %132, align 1, !tbaa !5
  %133 = load i8, ptr %0, align 8, !tbaa !5
  %134 = and i8 %133, 1
  %135 = icmp eq i8 %134, 0
  %136 = load ptr, ptr %14, align 8
  %137 = select i1 %135, ptr %136, ptr %13
  %138 = load i64, ptr %28, align 8
  %139 = select i1 %135, i64 %138, i64 23
  call void @_ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE10deallocateEPcm(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %137, i64 noundef %139)
  %140 = call noundef ptr @_ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE11assure_longEv(ptr noundef nonnull align 8 dereferenceable(24) %0)
  store ptr %48, ptr %14, align 8, !tbaa !55
  %141 = icmp slt i64 %130, 0
  br i1 %141, label %142, label %143, !prof !19

142:                                              ; preds = %122
  call void @__assert_rtn(ptr noundef nonnull @__func__._ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE14priv_long_sizeEm, ptr noundef nonnull @.str.47, i32 noundef 492, ptr noundef nonnull @.str.49) #26
  unreachable

143:                                              ; preds = %122
  %144 = load i64, ptr %0, align 8
  %145 = shl i64 %130, 1
  %146 = and i64 %144, 1
  %147 = or i64 %146, %145
  store i64 %147, ptr %0, align 8
  %148 = load i64, ptr %6, align 8, !tbaa !32
  store i64 %148, ptr %28, align 8, !tbaa !57
  br label %171

149:                                              ; preds = %119
  %150 = ptrtoint ptr %33 to i64
  %151 = sub i64 %16, %150
  %152 = call noundef ptr @_ZNSt3__111char_traitsIcE4moveEPcPKcm(ptr noundef %48, ptr noundef %33, i64 noundef %151) #24
  %153 = add i64 %151, %19
  %154 = getelementptr inbounds i8, ptr %48, i64 %153
  %155 = sub i64 %24, %151
  %156 = call noundef ptr @_ZNSt3__111char_traitsIcE4moveEPcPKcm(ptr noundef %154, ptr noundef %1, i64 noundef %155) #24
  %157 = getelementptr inbounds i8, ptr %48, i64 %151
  %158 = call noundef i64 @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE23priv_uninitialized_copyINS0_17constant_iteratorIcEEPcEEmT_SA_T0_(ptr noundef nonnull align 8 dereferenceable(24) %0, [2 x i64] %2, [2 x i64] %3, ptr noundef %157)
  %159 = add i64 %24, %19
  %160 = getelementptr inbounds i8, ptr %48, i64 %159
  %161 = call noundef ptr @_ZnwmPv21boost_container_new_t(i64 noundef 1, ptr noundef %160)
  store i8 0, ptr %161, align 1, !tbaa !5
  %162 = call noundef ptr @_ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE11assure_longEv(ptr noundef nonnull align 8 dereferenceable(24) %0)
  store ptr %48, ptr %14, align 8, !tbaa !55
  %163 = icmp slt i64 %159, 0
  br i1 %163, label %164, label %165, !prof !19

164:                                              ; preds = %149
  call void @__assert_rtn(ptr noundef nonnull @__func__._ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE14priv_long_sizeEm, ptr noundef nonnull @.str.47, i32 noundef 492, ptr noundef nonnull @.str.49) #26
  unreachable

165:                                              ; preds = %149
  %166 = load i64, ptr %0, align 8
  %167 = shl i64 %159, 1
  %168 = and i64 %166, 1
  %169 = or i64 %168, %167
  store i64 %169, ptr %0, align 8
  %170 = load i64, ptr %6, align 8, !tbaa !32
  store i64 %170, ptr %28, align 8, !tbaa !57
  br label %171

171:                                              ; preds = %143, %165, %116
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %7) #24
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %6) #24
  br label %172

172:                                              ; preds = %171, %5
  %173 = select i1 %12, ptr %15, ptr %13
  %174 = ptrtoint ptr %173 to i64
  %175 = sub i64 %16, %174
  %176 = load i8, ptr %0, align 8, !tbaa !5
  %177 = and i8 %176, 1
  %178 = icmp eq i8 %177, 0
  %179 = load ptr, ptr %14, align 8
  %180 = select i1 %178, ptr %179, ptr %13
  %181 = getelementptr inbounds i8, ptr %180, i64 %175
  ret ptr %181
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr void @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE9priv_copyINS0_17constant_iteratorIcEEPcEEvT_SA_T0_([2 x i64] %0, [2 x i64] %1, ptr noundef %2) local_unnamed_addr #4 align 2 {
  %4 = extractvalue [2 x i64] %0, 0
  %5 = inttoptr i64 %4 to ptr
  %6 = extractvalue [2 x i64] %0, 1
  %7 = extractvalue [2 x i64] %1, 1
  %8 = icmp eq i64 %6, %7
  br i1 %8, label %15, label %9

9:                                                ; preds = %3, %9
  %10 = phi ptr [ %13, %9 ], [ %2, %3 ]
  %11 = phi i64 [ %12, %9 ], [ %6, %3 ]
  tail call void @_ZNSt3__111char_traitsIcE6assignERcRKc(ptr noundef nonnull align 1 dereferenceable(1) %10, ptr noundef nonnull align 1 dereferenceable(1) %5) #24
  %12 = add i64 %11, -1
  %13 = getelementptr inbounds i8, ptr %10, i64 1
  %14 = icmp eq i64 %12, %7
  br i1 %14, label %15, label %9, !llvm.loop !120

15:                                               ; preds = %9, %3
  ret void
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr noundef i64 @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE23priv_uninitialized_copyINS0_17constant_iteratorIcEEPcEEmT_SA_T0_(ptr noundef nonnull align 8 dereferenceable(24) %0, [2 x i64] %1, [2 x i64] %2, ptr noundef %3) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %5 = extractvalue [2 x i64] %1, 0
  %6 = inttoptr i64 %5 to ptr
  %7 = extractvalue [2 x i64] %1, 1
  %8 = extractvalue [2 x i64] %2, 1
  %9 = icmp eq i64 %7, %8
  br i1 %9, label %20, label %10

10:                                               ; preds = %4, %10
  %11 = phi ptr [ %16, %10 ], [ %3, %4 ]
  %12 = phi i64 [ %15, %10 ], [ %7, %4 ]
  %13 = tail call noundef ptr @_ZnwmPv21boost_container_new_t(i64 noundef 1, ptr noundef %11)
  %14 = load i8, ptr %6, align 1, !tbaa !5
  store i8 %14, ptr %13, align 1, !tbaa !5
  %15 = add i64 %12, -1
  %16 = getelementptr inbounds i8, ptr %11, i64 1
  %17 = icmp eq i64 %15, %8
  br i1 %17, label %18, label %10, !llvm.loop !121

18:                                               ; preds = %10
  %19 = sub i64 %7, %8
  br label %20

20:                                               ; preds = %18, %4
  %21 = phi i64 [ 0, %4 ], [ %19, %18 ]
  ret i64 %21
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr void @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE12priv_reserveEmb(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1, i1 noundef zeroext %2) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  store i64 %1, ptr %4, align 8, !tbaa !32
  %8 = tail call noundef i64 @_ZNK5boost9container13new_allocatorIcE8max_sizeEv(ptr noundef nonnull align 1 dereferenceable(1) %0) #24
  %9 = add i64 %8, -1
  %10 = icmp ult i64 %9, %1
  br i1 %10, label %11, label %12

11:                                               ; preds = %3
  tail call void @_ZN5boost9container18throw_length_errorEPKc(ptr noundef nonnull @.str.57) #25
  unreachable

12:                                               ; preds = %3
  %13 = load i8, ptr %0, align 8, !tbaa !5
  %14 = and i8 %13, 1
  %15 = icmp eq i8 %14, 0
  %16 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 1
  %17 = load i64, ptr %16, align 8
  %18 = add i64 %17, -1
  %19 = select i1 %15, i64 %18, i64 22
  %20 = load i64, ptr %4, align 8, !tbaa !32
  %21 = icmp ult i64 %19, %20
  br i1 %21, label %22, label %72

22:                                               ; preds = %12
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %5) #24
  %23 = lshr i8 %13, 1
  %24 = zext i8 %23 to i64
  %25 = load i64, ptr %0, align 8
  %26 = lshr i64 %25, 1
  %27 = select i1 %15, i64 %26, i64 %24
  store i64 %27, ptr %5, align 8, !tbaa !32
  %28 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZN5boost9container3dtl9max_valueImEERKT_S5_S5_(ptr noundef nonnull align 8 dereferenceable(8) %4, ptr noundef nonnull align 8 dereferenceable(8) %5)
  %29 = load i64, ptr %28, align 8, !tbaa !32
  %30 = add i64 %29, 1
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %5) #24
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %6) #24
  %31 = call noundef i64 @_ZNK5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE13next_capacityEm(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %30)
  store i64 %31, ptr %6, align 8, !tbaa !32
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %7) #24
  store ptr null, ptr %7, align 8, !tbaa !43
  %32 = call noundef ptr @_ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE18allocation_commandEjmRmRPc(ptr noundef nonnull align 8 dereferenceable(24) %0, i32 noundef 1, i64 noundef %30, ptr noundef nonnull align 8 dereferenceable(8) %6, ptr noundef nonnull align 8 dereferenceable(8) %7)
  %33 = load i8, ptr %0, align 8, !tbaa !5
  %34 = and i8 %33, 1
  %35 = icmp eq i8 %34, 0
  %36 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %0, i64 0, i32 1
  %37 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 2
  %38 = load ptr, ptr %37, align 8
  %39 = select i1 %35, ptr %38, ptr %36
  %40 = lshr i8 %33, 1
  %41 = zext i8 %40 to i64
  %42 = load i64, ptr %0, align 8
  %43 = lshr i64 %42, 1
  %44 = select i1 %35, i64 %43, i64 %41
  %45 = getelementptr inbounds i8, ptr %39, i64 %44
  %46 = call noundef i64 @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE23priv_uninitialized_copyIPcS7_EEmT_S8_T0_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %39, ptr noundef %45, ptr noundef %32)
  br i1 %2, label %47, label %50

47:                                               ; preds = %22
  %48 = getelementptr inbounds i8, ptr %32, i64 %46
  %49 = call noundef ptr @_ZnwmPv21boost_container_new_t(i64 noundef 1, ptr noundef %48)
  store i8 0, ptr %49, align 1, !tbaa !5
  br label %50

50:                                               ; preds = %47, %22
  %51 = load i8, ptr %0, align 8, !tbaa !5
  %52 = and i8 %51, 1
  %53 = icmp eq i8 %52, 0
  %54 = load ptr, ptr %37, align 8
  %55 = select i1 %53, ptr %54, ptr %36
  %56 = load i64, ptr %16, align 8
  %57 = select i1 %53, i64 %56, i64 23
  call void @_ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE10deallocateEPcm(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %55, i64 noundef %57)
  %58 = call noundef ptr @_ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE11assure_longEv(ptr noundef nonnull align 8 dereferenceable(24) %0)
  store ptr %32, ptr %37, align 8, !tbaa !55
  %59 = icmp slt i64 %46, 0
  br i1 %59, label %60, label %61, !prof !19

60:                                               ; preds = %50
  call void @__assert_rtn(ptr noundef nonnull @__func__._ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE14priv_long_sizeEm, ptr noundef nonnull @.str.47, i32 noundef 492, ptr noundef nonnull @.str.49) #26
  unreachable

61:                                               ; preds = %50
  %62 = load i64, ptr %0, align 8
  %63 = shl i64 %46, 1
  %64 = and i64 %62, 1
  %65 = or i64 %64, %63
  store i64 %65, ptr %0, align 8
  %66 = load i8, ptr %0, align 8, !tbaa !5
  %67 = and i8 %66, 1
  %68 = icmp eq i8 %67, 0
  br i1 %68, label %69, label %71

69:                                               ; preds = %61
  %70 = load i64, ptr %6, align 8, !tbaa !32
  store i64 %70, ptr %16, align 8, !tbaa !57
  br label %71

71:                                               ; preds = %61, %69
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %7) #24
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %6) #24
  br label %72

72:                                               ; preds = %71, %12
  ret void
}

; Function Attrs: mustprogress noinline noreturn ssp uwtable(sync)
define linkonce_odr void @_ZN5boost9container18throw_length_errorEPKc(ptr noundef %0) local_unnamed_addr #5 personality ptr @__gxx_personality_v0 {
  %2 = tail call ptr @__cxa_allocate_exception(i64 16) #24
  %3 = invoke noundef ptr @_ZN5boost9container12length_errorC1EPKc(ptr noundef nonnull align 8 dereferenceable(16) %2, ptr noundef %0)
          to label %4 unwind label %5

4:                                                ; preds = %1
  tail call void @__cxa_throw(ptr nonnull %2, ptr nonnull @_ZTIN5boost9container12length_errorE, ptr nonnull @_ZN5boost9container12length_errorD1Ev) #25
  unreachable

5:                                                ; preds = %1
  %6 = landingpad { ptr, i32 }
          cleanup
  tail call void @__cxa_free_exception(ptr %2) #24
  resume { ptr, i32 } %6
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container12length_errorC1EPKc(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #0 align 2 {
  %3 = tail call noundef ptr @_ZN5boost9container12length_errorC2EPKc(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef %1)
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container12length_errorD1Ev(ptr noundef nonnull returned align 8 dereferenceable(16) %0) unnamed_addr #2 align 2 {
  %2 = tail call noundef ptr @_ZN5boost9container12length_errorD2Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) #24
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container12length_errorC2EPKc(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #2 align 2 {
  %3 = tail call noundef ptr @_ZN5boost9container9exceptionC2EPKc(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef %1)
  store ptr getelementptr inbounds ({ [5 x ptr] }, ptr @_ZTVN5boost9container12length_errorE, i64 0, inrange i32 0, i64 2), ptr %0, align 8, !tbaa !53
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr void @_ZN5boost9container12length_errorD0Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) unnamed_addr #2 align 2 {
  %2 = tail call noundef ptr @_ZN5boost9container12length_errorD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) #24
  tail call void @_ZdlPv(ptr noundef %0) #30
  ret void
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container12length_errorD2Ev(ptr noundef nonnull returned align 8 dereferenceable(16) %0) unnamed_addr #2 align 2 {
  %2 = tail call noundef ptr @_ZN5boost9container9exceptionD2Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) #24
  ret ptr %0
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6insertIPKcEEPcS8_T_SA_PNS_11move_detail13disable_if_orIvNSB_14is_convertibleISA_mEENS0_3dtl17is_input_iteratorISA_Xsr21has_iterator_categoryISA_EE5valueEEENSB_5bool_ILb0EEESJ_E4typeE(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = load i8, ptr %0, align 8, !tbaa !5
  %9 = and i8 %8, 1
  %10 = icmp eq i8 %9, 0
  %11 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %0, i64 0, i32 1
  %12 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 2
  %13 = load ptr, ptr %12, align 8
  %14 = ptrtoint ptr %1 to i64
  %15 = icmp eq ptr %2, %3
  br i1 %15, label %172, label %16

16:                                               ; preds = %5
  %17 = ptrtoint ptr %3 to i64
  %18 = ptrtoint ptr %2 to i64
  %19 = sub i64 %17, %18
  %20 = lshr i8 %8, 1
  %21 = zext i8 %20 to i64
  %22 = load i64, ptr %0, align 8
  %23 = lshr i64 %22, 1
  %24 = select i1 %10, i64 %23, i64 %21
  %25 = load i8, ptr %0, align 8, !tbaa !5
  %26 = and i8 %25, 1
  %27 = icmp eq i8 %26, 0
  %28 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 1
  %29 = load i64, ptr %28, align 8
  %30 = add i64 %29, -1
  %31 = select i1 %27, i64 %30, i64 22
  %32 = sub i64 %31, %24
  %33 = select i1 %27, ptr %13, ptr %11
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %6) #24
  store i64 0, ptr %6, align 8, !tbaa !32
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %7) #24
  store ptr null, ptr %7, align 8, !tbaa !43
  %34 = icmp ult i64 %32, %19
  br i1 %34, label %35, label %47

35:                                               ; preds = %16
  %36 = tail call noundef i64 @_ZNK5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE13next_capacityEm(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %19)
  store i64 %36, ptr %6, align 8, !tbaa !32
  store ptr %33, ptr %7, align 8, !tbaa !43
  %37 = add i64 %24, %19
  %38 = add i64 %37, 1
  %39 = call noundef ptr @_ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE18allocation_commandEjmRmRPc(ptr noundef nonnull align 8 dereferenceable(24) %0, i32 noundef 7, i64 noundef %38, ptr noundef nonnull align 8 dereferenceable(8) %6, ptr noundef nonnull align 8 dereferenceable(8) %7)
  %40 = icmp eq ptr %33, %39
  br i1 %40, label %41, label %47

41:                                               ; preds = %35
  %42 = load i8, ptr %0, align 8, !tbaa !5
  %43 = and i8 %42, 1
  %44 = icmp eq i8 %43, 0
  br i1 %44, label %45, label %47

45:                                               ; preds = %41
  %46 = load i64, ptr %6, align 8, !tbaa !32
  store i64 %46, ptr %28, align 8, !tbaa !57
  br label %47

47:                                               ; preds = %45, %41, %16, %35
  %48 = phi ptr [ %39, %35 ], [ null, %16 ], [ %39, %41 ], [ %39, %45 ]
  %49 = phi i1 [ false, %35 ], [ true, %16 ], [ true, %41 ], [ true, %45 ]
  br i1 %49, label %50, label %119

50:                                               ; preds = %47
  %51 = ptrtoint ptr %33 to i64
  %52 = sub i64 %51, %14
  %53 = add i64 %52, %24
  %54 = icmp ugt i64 %19, %53
  %55 = add nuw i64 %24, 1
  br i1 %54, label %66, label %56

56:                                               ; preds = %50
  %57 = add nuw i64 %24, 1
  %58 = getelementptr inbounds i8, ptr %33, i64 %57
  %59 = sub i64 %55, %19
  %60 = getelementptr inbounds i8, ptr %33, i64 %59
  %61 = call noundef i64 @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE23priv_uninitialized_copyIPcS7_EEmT_S8_T0_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %60, ptr noundef nonnull %58, ptr noundef nonnull %58)
  %62 = getelementptr inbounds i8, ptr %1, i64 %19
  %63 = sub i64 1, %19
  %64 = add i64 %63, %53
  %65 = call noundef ptr @_ZNSt3__111char_traitsIcE4moveEPcPKcm(ptr noundef %62, ptr noundef %1, i64 noundef %64) #24
  br label %94

66:                                               ; preds = %50
  %67 = add i64 %53, 1
  %68 = getelementptr inbounds i8, ptr %2, i64 %67
  %69 = getelementptr inbounds i8, ptr %33, i64 %55
  %70 = call noundef i64 @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE23priv_uninitialized_copyIPKcPcEEmT_SA_T0_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %68, ptr noundef %3, ptr noundef nonnull %69)
  %71 = sub i64 %19, %53
  %72 = add i64 %71, %24
  %73 = load i8, ptr %0, align 8, !tbaa !5
  %74 = and i8 %73, 1
  %75 = icmp eq i8 %74, 0
  br i1 %75, label %83, label %76

76:                                               ; preds = %66
  %77 = icmp ugt i64 %72, 127
  br i1 %77, label %78, label %79, !prof !19

78:                                               ; preds = %76
  call void @__assert_rtn(ptr noundef nonnull @__func__._ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE15priv_short_sizeEm, ptr noundef nonnull @.str.47, i32 noundef 484, ptr noundef nonnull @.str.49) #26
  unreachable

79:                                               ; preds = %76
  %80 = trunc i64 %72 to i8
  %81 = shl i8 %80, 1
  %82 = or i8 %74, %81
  store i8 %82, ptr %0, align 8
  br label %91

83:                                               ; preds = %66
  %84 = icmp slt i64 %72, 0
  br i1 %84, label %85, label %86, !prof !19

85:                                               ; preds = %83
  call void @__assert_rtn(ptr noundef nonnull @__func__._ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE14priv_long_sizeEm, ptr noundef nonnull @.str.47, i32 noundef 492, ptr noundef nonnull @.str.49) #26
  unreachable

86:                                               ; preds = %83
  %87 = load i64, ptr %0, align 8
  %88 = shl i64 %72, 1
  %89 = and i64 %87, 1
  %90 = or i64 %89, %88
  store i64 %90, ptr %0, align 8
  br label %91

91:                                               ; preds = %79, %86
  %92 = getelementptr inbounds i8, ptr %33, i64 %72
  %93 = call noundef i64 @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE23priv_uninitialized_copyIPKcPcEEmT_SA_T0_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1, ptr noundef nonnull %69, ptr noundef %92)
  br label %94

94:                                               ; preds = %91, %56
  %95 = phi i64 [ %67, %91 ], [ %19, %56 ]
  %96 = call noundef ptr @_ZNSt3__111char_traitsIcE4copyEPcPKcm(ptr noundef %1, ptr noundef %2, i64 noundef %95) #24
  %97 = add i64 %24, %19
  %98 = load i8, ptr %0, align 8, !tbaa !5
  %99 = and i8 %98, 1
  %100 = icmp eq i8 %99, 0
  br i1 %100, label %108, label %101

101:                                              ; preds = %94
  %102 = icmp ugt i64 %97, 127
  br i1 %102, label %103, label %104, !prof !19

103:                                              ; preds = %101
  call void @__assert_rtn(ptr noundef nonnull @__func__._ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE15priv_short_sizeEm, ptr noundef nonnull @.str.47, i32 noundef 484, ptr noundef nonnull @.str.49) #26
  unreachable

104:                                              ; preds = %101
  %105 = trunc i64 %97 to i8
  %106 = shl i8 %105, 1
  %107 = or i8 %99, %106
  store i8 %107, ptr %0, align 8
  br label %116

108:                                              ; preds = %94
  %109 = icmp slt i64 %97, 0
  br i1 %109, label %110, label %111, !prof !19

110:                                              ; preds = %108
  call void @__assert_rtn(ptr noundef nonnull @__func__._ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE14priv_long_sizeEm, ptr noundef nonnull @.str.47, i32 noundef 492, ptr noundef nonnull @.str.49) #26
  unreachable

111:                                              ; preds = %108
  %112 = load i64, ptr %0, align 8
  %113 = shl i64 %97, 1
  %114 = and i64 %112, 1
  %115 = or i64 %114, %113
  store i64 %115, ptr %0, align 8
  br label %116

116:                                              ; preds = %104, %111
  %117 = getelementptr inbounds i8, ptr %33, i64 %97
  %118 = call noundef ptr @_ZnwmPv21boost_container_new_t(i64 noundef 1, ptr noundef %117)
  store i8 0, ptr %118, align 1, !tbaa !5
  br label %171

119:                                              ; preds = %47
  %120 = load ptr, ptr %7, align 8, !tbaa !43
  %121 = icmp eq ptr %120, null
  br i1 %121, label %122, label %149

122:                                              ; preds = %119
  %123 = call noundef i64 @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE23priv_uninitialized_copyIPKcPcEEmT_SA_T0_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %33, ptr noundef %1, ptr noundef %48)
  %124 = getelementptr inbounds i8, ptr %48, i64 %123
  %125 = call noundef i64 @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE23priv_uninitialized_copyIPKcPcEEmT_SA_T0_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %2, ptr noundef %3, ptr noundef %124)
  %126 = add i64 %125, %123
  %127 = getelementptr inbounds i8, ptr %33, i64 %24
  %128 = getelementptr inbounds i8, ptr %48, i64 %126
  %129 = call noundef i64 @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE23priv_uninitialized_copyIPKcPcEEmT_SA_T0_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1, ptr noundef %127, ptr noundef %128)
  %130 = add i64 %126, %129
  %131 = getelementptr inbounds i8, ptr %48, i64 %130
  %132 = call noundef ptr @_ZnwmPv21boost_container_new_t(i64 noundef 1, ptr noundef %131)
  store i8 0, ptr %132, align 1, !tbaa !5
  %133 = load i8, ptr %0, align 8, !tbaa !5
  %134 = and i8 %133, 1
  %135 = icmp eq i8 %134, 0
  %136 = load ptr, ptr %12, align 8
  %137 = select i1 %135, ptr %136, ptr %11
  %138 = load i64, ptr %28, align 8
  %139 = select i1 %135, i64 %138, i64 23
  call void @_ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE10deallocateEPcm(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %137, i64 noundef %139)
  %140 = call noundef ptr @_ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE11assure_longEv(ptr noundef nonnull align 8 dereferenceable(24) %0)
  store ptr %48, ptr %12, align 8, !tbaa !55
  %141 = icmp slt i64 %130, 0
  br i1 %141, label %142, label %143, !prof !19

142:                                              ; preds = %122
  call void @__assert_rtn(ptr noundef nonnull @__func__._ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE14priv_long_sizeEm, ptr noundef nonnull @.str.47, i32 noundef 492, ptr noundef nonnull @.str.49) #26
  unreachable

143:                                              ; preds = %122
  %144 = load i64, ptr %0, align 8
  %145 = shl i64 %130, 1
  %146 = and i64 %144, 1
  %147 = or i64 %146, %145
  store i64 %147, ptr %0, align 8
  %148 = load i64, ptr %6, align 8, !tbaa !32
  store i64 %148, ptr %28, align 8, !tbaa !57
  br label %171

149:                                              ; preds = %119
  %150 = ptrtoint ptr %33 to i64
  %151 = sub i64 %14, %150
  %152 = call noundef ptr @_ZNSt3__111char_traitsIcE4moveEPcPKcm(ptr noundef %48, ptr noundef %33, i64 noundef %151) #24
  %153 = add i64 %151, %19
  %154 = getelementptr inbounds i8, ptr %48, i64 %153
  %155 = sub i64 %24, %151
  %156 = call noundef ptr @_ZNSt3__111char_traitsIcE4moveEPcPKcm(ptr noundef %154, ptr noundef %1, i64 noundef %155) #24
  %157 = getelementptr inbounds i8, ptr %48, i64 %151
  %158 = call noundef i64 @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE23priv_uninitialized_copyIPKcPcEEmT_SA_T0_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %2, ptr noundef %3, ptr noundef %157)
  %159 = add i64 %24, %19
  %160 = getelementptr inbounds i8, ptr %48, i64 %159
  %161 = call noundef ptr @_ZnwmPv21boost_container_new_t(i64 noundef 1, ptr noundef %160)
  store i8 0, ptr %161, align 1, !tbaa !5
  %162 = call noundef ptr @_ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE11assure_longEv(ptr noundef nonnull align 8 dereferenceable(24) %0)
  store ptr %48, ptr %12, align 8, !tbaa !55
  %163 = icmp slt i64 %159, 0
  br i1 %163, label %164, label %165, !prof !19

164:                                              ; preds = %149
  call void @__assert_rtn(ptr noundef nonnull @__func__._ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE14priv_long_sizeEm, ptr noundef nonnull @.str.47, i32 noundef 492, ptr noundef nonnull @.str.49) #26
  unreachable

165:                                              ; preds = %149
  %166 = load i64, ptr %0, align 8
  %167 = shl i64 %159, 1
  %168 = and i64 %166, 1
  %169 = or i64 %168, %167
  store i64 %169, ptr %0, align 8
  %170 = load i64, ptr %6, align 8, !tbaa !32
  store i64 %170, ptr %28, align 8, !tbaa !57
  br label %171

171:                                              ; preds = %143, %165, %116
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %7) #24
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %6) #24
  br label %172

172:                                              ; preds = %171, %5
  %173 = select i1 %10, ptr %13, ptr %11
  %174 = ptrtoint ptr %173 to i64
  %175 = sub i64 %14, %174
  %176 = load i8, ptr %0, align 8, !tbaa !5
  %177 = and i8 %176, 1
  %178 = icmp eq i8 %177, 0
  %179 = load ptr, ptr %12, align 8
  %180 = select i1 %178, ptr %179, ptr %11
  %181 = getelementptr inbounds i8, ptr %180, i64 %175
  ret ptr %181
}

; Function Attrs: mustprogress noinline noreturn ssp uwtable(sync)
define linkonce_odr void @_ZN5boost9container18throw_out_of_rangeEPKc(ptr noundef %0) local_unnamed_addr #5 personality ptr @__gxx_personality_v0 {
  %2 = tail call ptr @__cxa_allocate_exception(i64 16) #24
  %3 = invoke noundef ptr @_ZN5boost9container12out_of_rangeC1EPKc(ptr noundef nonnull align 8 dereferenceable(16) %2, ptr noundef %0)
          to label %4 unwind label %5

4:                                                ; preds = %1
  tail call void @__cxa_throw(ptr nonnull %2, ptr nonnull @_ZTIN5boost9container12out_of_rangeE, ptr nonnull @_ZN5boost9container12out_of_rangeD1Ev) #25
  unreachable

5:                                                ; preds = %1
  %6 = landingpad { ptr, i32 }
          cleanup
  tail call void @__cxa_free_exception(ptr %2) #24
  resume { ptr, i32 } %6
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container12out_of_rangeC1EPKc(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #0 align 2 {
  %3 = tail call noundef ptr @_ZN5boost9container12out_of_rangeC2EPKc(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef %1)
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container12out_of_rangeD1Ev(ptr noundef nonnull returned align 8 dereferenceable(16) %0) unnamed_addr #2 align 2 {
  %2 = tail call noundef ptr @_ZN5boost9container12out_of_rangeD2Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) #24
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container12out_of_rangeC2EPKc(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #2 align 2 {
  %3 = tail call noundef ptr @_ZN5boost9container9exceptionC2EPKc(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef %1)
  store ptr getelementptr inbounds ({ [5 x ptr] }, ptr @_ZTVN5boost9container12out_of_rangeE, i64 0, inrange i32 0, i64 2), ptr %0, align 8, !tbaa !53
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr void @_ZN5boost9container12out_of_rangeD0Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) unnamed_addr #2 align 2 {
  %2 = tail call noundef ptr @_ZN5boost9container12out_of_rangeD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) #24
  tail call void @_ZdlPv(ptr noundef %0) #30
  ret void
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container12out_of_rangeD2Ev(ptr noundef nonnull returned align 8 dereferenceable(16) %0) unnamed_addr #2 align 2 {
  %2 = tail call noundef ptr @_ZN5boost9container9exceptionD2Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) #24
  ret ptr %0
}

; Function Attrs: mustprogress noinline noreturn ssp uwtable(sync)
define linkonce_odr hidden void @_ZNKSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE20__throw_out_of_rangeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #5 align 2 {
  tail call void @_ZNSt3__120__throw_out_of_rangeB7v160006EPKc(ptr noundef nonnull @.str.56) #25
  unreachable
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvEC2Emc(ptr noundef nonnull returned align 8 dereferenceable(24) %0, i64 noundef %1, i8 noundef signext %2) unnamed_addr #0 align 2 personality ptr @__gxx_personality_v0 {
  %4 = tail call noundef ptr @_ZN5boost9container13new_allocatorIcEC2Ev(ptr noundef nonnull align 1 dereferenceable(1) %0) #24
  store i8 1, ptr %0, align 8
  %5 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %0, i64 0, i32 1
  %6 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 2
  %7 = tail call noundef ptr @_ZnwmPv21boost_container_new_t(i64 noundef 1, ptr noundef nonnull %5)
  store i8 0, ptr %7, align 1, !tbaa !5
  %8 = invoke noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6assignEmc(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1, i8 noundef signext %2)
          to label %9 unwind label %10

9:                                                ; preds = %3
  ret ptr %0

10:                                               ; preds = %3
  %11 = landingpad { ptr, i32 }
          cleanup
  %12 = load i8, ptr %0, align 8, !tbaa !5
  %13 = and i8 %12, 1
  %14 = icmp eq i8 %13, 0
  br i1 %14, label %15, label %19

15:                                               ; preds = %10
  %16 = load ptr, ptr %6, align 8, !tbaa !55
  %17 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 1
  %18 = load i64, ptr %17, align 8, !tbaa !57
  tail call void @_ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE10deallocateEPcm(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %16, i64 noundef %18)
  br label %19

19:                                               ; preds = %10, %15
  resume { ptr, i32 } %11
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvEC1ENS5_9reserve_tEmRKNS0_13new_allocatorIcEE(ptr noundef nonnull returned align 8 dereferenceable(24) %0, i64 noundef %1, ptr noundef nonnull align 1 dereferenceable(1) %2) unnamed_addr #0 align 2 {
  %4 = tail call noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvEC2ENS5_9reserve_tEmRKNS0_13new_allocatorIcEE(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1, ptr noundef nonnull align 1 dereferenceable(1) %2)
  ret ptr %0
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6appendERKS5_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) local_unnamed_addr #4 align 2 personality ptr @__gxx_personality_v0 {
  %3 = load i8, ptr %1, align 8, !tbaa !5
  %4 = and i8 %3, 1
  %5 = icmp eq i8 %4, 0
  %6 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %1, i64 0, i32 1
  %7 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %1, i64 0, i32 2
  %8 = load ptr, ptr %7, align 8
  %9 = select i1 %5, ptr %8, ptr %6
  %10 = lshr i8 %3, 1
  %11 = zext i8 %10 to i64
  %12 = getelementptr inbounds i8, ptr %6, i64 %11
  %13 = load i64, ptr %1, align 8
  %14 = lshr i64 %13, 1
  %15 = getelementptr inbounds i8, ptr %8, i64 %14
  %16 = select i1 %5, ptr %15, ptr %12
  %17 = tail call noundef nonnull align 8 dereferenceable(24) ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvE6appendIPKcEERS5_T_SA_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %9, ptr noundef %16)
  ret ptr %17
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN5boost9container12basic_stringIcNSt3__111char_traitsIcEEvEC2ENS5_9reserve_tEmRKNS0_13new_allocatorIcEE(ptr noundef nonnull returned align 8 dereferenceable(24) %0, i64 noundef %1, ptr noundef nonnull align 1 dereferenceable(1) %2) unnamed_addr #0 align 2 personality ptr @__gxx_personality_v0 {
  %4 = add i64 %1, 1
  %5 = tail call noundef ptr @_ZN5boost9container13new_allocatorIcEC2ERKS2_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef nonnull align 1 dereferenceable(1) %2) #24
  store i8 1, ptr %0, align 8
  tail call void @_ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE22allocate_initial_blockEm(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %4)
  %6 = load i8, ptr %0, align 8, !tbaa !5
  %7 = and i8 %6, 1
  %8 = icmp eq i8 %7, 0
  %9 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::short_t", ptr %0, i64 0, i32 1
  %10 = lshr i8 %6, 1
  %11 = zext i8 %10 to i64
  %12 = getelementptr inbounds i8, ptr %9, i64 %11
  %13 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 2
  %14 = load ptr, ptr %13, align 8
  %15 = load i64, ptr %0, align 8
  %16 = lshr i64 %15, 1
  %17 = getelementptr inbounds i8, ptr %14, i64 %16
  %18 = select i1 %8, ptr %17, ptr %12
  %19 = tail call noundef ptr @_ZnwmPv21boost_container_new_t(i64 noundef 1, ptr noundef %18)
  store i8 0, ptr %19, align 1, !tbaa !5
  ret ptr %0
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr void @_ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE22allocate_initial_blockEm(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) local_unnamed_addr #0 align 2 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = tail call noundef i64 @_ZNK5boost9container13new_allocatorIcE8max_sizeEv(ptr noundef nonnull align 1 dereferenceable(1) %0) #24
  %6 = add i64 %5, -1
  %7 = icmp ult i64 %6, %1
  br i1 %7, label %23, label %8

8:                                                ; preds = %2
  %9 = icmp ugt i64 %1, 23
  br i1 %9, label %10, label %24

10:                                               ; preds = %8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %3) #24
  %11 = tail call noundef i64 @_ZNK5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE13next_capacityEm(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1)
  store i64 %11, ptr %3, align 8, !tbaa !32
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %4) #24
  store ptr null, ptr %4, align 8, !tbaa !43
  %12 = call noundef ptr @_ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE18allocation_commandEjmRmRPc(ptr noundef nonnull align 8 dereferenceable(24) %0, i32 noundef 1, i64 noundef %1, ptr noundef nonnull align 8 dereferenceable(8) %3, ptr noundef nonnull align 8 dereferenceable(8) %4)
  %13 = load i8, ptr %0, align 8, !tbaa !5
  %14 = and i8 %13, 1
  %15 = icmp eq i8 %14, 0
  br i1 %15, label %16, label %17, !prof !19

16:                                               ; preds = %10
  call void @__assert_rtn(ptr noundef nonnull @__func__._ZN5boost9container3dtl17basic_string_baseINS0_13new_allocatorIcEEE22allocate_initial_blockEm, ptr noundef nonnull @.str.47, i32 noundef 390, ptr noundef nonnull @.str.53) #26
  unreachable

17:                                               ; preds = %10
  %18 = load i64, ptr %0, align 8
  %19 = and i64 %18, -2
  store i64 %19, ptr %0, align 8
  %20 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 2
  store ptr %12, ptr %20, align 8, !tbaa !55
  store i64 0, ptr %0, align 8
  %21 = load i64, ptr %3, align 8, !tbaa !32
  %22 = getelementptr inbounds %"struct.boost::container::dtl::basic_string_base<boost::container::new_allocator<char>>::long_t", ptr %0, i64 0, i32 1
  store i64 %21, ptr %22, align 8, !tbaa !57
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %4) #24
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3) #24
  br label %24

23:                                               ; preds = %2
  tail call void @_ZN5boost9container18throw_length_errorEPKc(ptr noundef nonnull @.str.59) #25
  unreachable

24:                                               ; preds = %8, %17
  ret void
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE3endB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::vector", ptr %0, i64 0, i32 1
  %3 = load ptr, ptr %2, align 8, !tbaa !35
  %4 = tail call i64 @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE11__make_iterB7v160006EPS6_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %3) #24
  ret i64 %4
}

; Function Attrs: noinline ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__116reverse_iteratorINS_11__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEEC1B7v160006ES9_(ptr noundef nonnull returned align 8 dereferenceable(16) %0, i64 %1) unnamed_addr #0 align 2 {
  %3 = tail call noundef ptr @_ZNSt3__116reverse_iteratorINS_11__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEEC2B7v160006ES9_(ptr noundef nonnull align 8 dereferenceable(16) %0, i64 %1)
  ret ptr %0
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE11__make_iterB7v160006EPS6_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1) local_unnamed_addr #7 align 2 {
  %3 = alloca %"class.std::__1::__wrap_iter", align 8
  %4 = call noundef ptr @_ZNSt3__111__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEC1B7v160006EPKvS7_(ptr noundef nonnull align 8 dereferenceable(8) %3, ptr noundef nonnull %0, ptr noundef %1) #24
  %5 = load ptr, ptr %3, align 8
  %6 = ptrtoint ptr %5 to i64
  ret i64 %6
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__111__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEC1B7v160006EPKvS7_(ptr noundef nonnull returned align 8 dereferenceable(8) %0, ptr noundef %1, ptr noundef %2) unnamed_addr #2 align 2 {
  %4 = tail call noundef ptr @_ZNSt3__111__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEC2B7v160006EPKvS7_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef %1, ptr noundef %2) #24
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__111__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEC2B7v160006EPKvS7_(ptr noundef nonnull returned align 8 dereferenceable(8) %0, ptr noundef %1, ptr noundef %2) unnamed_addr #2 align 2 {
  store ptr %2, ptr %0, align 8, !tbaa !122
  ret ptr %0
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__116reverse_iteratorINS_11__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEEC2B7v160006ES9_(ptr noundef nonnull returned align 8 dereferenceable(16) %0, i64 %1) unnamed_addr #2 align 2 {
  %3 = inttoptr i64 %1 to ptr
  store ptr %3, ptr %0, align 8, !tbaa.struct !124
  %4 = getelementptr inbounds %"class.std::__1::reverse_iterator", ptr %0, i64 0, i32 1
  store ptr %3, ptr %4, align 8, !tbaa.struct !124
  ret ptr %0
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE5beginB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #7 align 2 {
  %2 = load ptr, ptr %0, align 8, !tbaa !39
  %3 = tail call i64 @_ZNSt3__16vectorINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS4_IS6_EEE11__make_iterB7v160006EPS6_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %2) #24
  ret i64 %3
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef zeroext i1 @_ZNSt3__125__lexicographical_compareB7v160006IR15CIStringCompareNS_16reverse_iteratorINS_11__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEEESD_EEbT0_SE_T1_SF_T_([2 x i64] %0, [2 x i64] %1, [2 x i64] %2, [2 x i64] %3, ptr noundef nonnull align 1 dereferenceable(1) %4) local_unnamed_addr #4 {
  %6 = alloca %"class.std::__1::reverse_iterator", align 8
  %7 = alloca %"class.std::__1::reverse_iterator", align 8
  %8 = alloca %"class.std::__1::reverse_iterator", align 8
  %9 = alloca %"class.std::__1::reverse_iterator", align 8
  %10 = extractvalue [2 x i64] %0, 0
  store i64 %10, ptr %6, align 8
  %11 = extractvalue [2 x i64] %0, 1
  %12 = getelementptr inbounds [2 x i64], ptr %6, i64 0, i64 1
  store i64 %11, ptr %12, align 8
  %13 = extractvalue [2 x i64] %1, 0
  store i64 %13, ptr %7, align 8
  %14 = extractvalue [2 x i64] %1, 1
  %15 = getelementptr inbounds [2 x i64], ptr %7, i64 0, i64 1
  store i64 %14, ptr %15, align 8
  %16 = extractvalue [2 x i64] %2, 0
  store i64 %16, ptr %8, align 8
  %17 = extractvalue [2 x i64] %2, 1
  %18 = getelementptr inbounds [2 x i64], ptr %8, i64 0, i64 1
  store i64 %17, ptr %18, align 8
  %19 = extractvalue [2 x i64] %3, 0
  store i64 %19, ptr %9, align 8
  %20 = extractvalue [2 x i64] %3, 1
  %21 = getelementptr inbounds [2 x i64], ptr %9, i64 0, i64 1
  store i64 %20, ptr %21, align 8
  %22 = call noundef zeroext i1 @_ZNSt3__1neB7v160006INS_11__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEES9_EEbRKNS_16reverse_iteratorIT_EERKNSA_IT0_EE(ptr noundef nonnull align 8 dereferenceable(16) %8, ptr noundef nonnull align 8 dereferenceable(16) %9)
  br i1 %22, label %23, label %37

23:                                               ; preds = %5, %33
  %24 = call noundef zeroext i1 @_ZNSt3__1eqB7v160006INS_11__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEES9_EEbRKNS_16reverse_iteratorIT_EERKNSA_IT0_EE(ptr noundef nonnull align 8 dereferenceable(16) %6, ptr noundef nonnull align 8 dereferenceable(16) %7)
  br i1 %24, label %37, label %25

25:                                               ; preds = %23
  %26 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__116reverse_iteratorINS_11__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEEdeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %6)
  %27 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__116reverse_iteratorINS_11__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEEdeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %8)
  %28 = call noundef zeroext i1 @_ZNK15CIStringCompareclERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEES8_(ptr noundef nonnull align 1 dereferenceable(1) %4, ptr noundef nonnull align 8 dereferenceable(24) %26, ptr noundef nonnull align 8 dereferenceable(24) %27)
  br i1 %28, label %37, label %29

29:                                               ; preds = %25
  %30 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__116reverse_iteratorINS_11__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEEdeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %8)
  %31 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__116reverse_iteratorINS_11__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEEdeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %6)
  %32 = call noundef zeroext i1 @_ZNK15CIStringCompareclERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEES8_(ptr noundef nonnull align 1 dereferenceable(1) %4, ptr noundef nonnull align 8 dereferenceable(24) %30, ptr noundef nonnull align 8 dereferenceable(24) %31)
  br i1 %32, label %37, label %33

33:                                               ; preds = %29
  %34 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZNSt3__116reverse_iteratorINS_11__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEEppB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %6)
  %35 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZNSt3__116reverse_iteratorINS_11__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEEppB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %8)
  %36 = call noundef zeroext i1 @_ZNSt3__1neB7v160006INS_11__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEES9_EEbRKNS_16reverse_iteratorIT_EERKNSA_IT0_EE(ptr noundef nonnull align 8 dereferenceable(16) %8, ptr noundef nonnull align 8 dereferenceable(16) %9)
  br i1 %36, label %23, label %37, !llvm.loop !125

37:                                               ; preds = %25, %23, %29, %33, %5
  %38 = phi i1 [ false, %5 ], [ true, %25 ], [ true, %23 ], [ false, %29 ], [ false, %33 ]
  ret i1 %38
}

; Function Attrs: mustprogress noinline ssp uwtable(sync)
define linkonce_odr hidden noundef zeroext i1 @_ZNSt3__1neB7v160006INS_11__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEES9_EEbRKNS_16reverse_iteratorIT_EERKNSA_IT0_EE(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef nonnull align 8 dereferenceable(16) %1) local_unnamed_addr #4 {
  %3 = alloca %"class.std::__1::__wrap_iter", align 8
  %4 = alloca %"class.std::__1::__wrap_iter", align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %3) #24
  %5 = tail call i64 @_ZNKSt3__116reverse_iteratorINS_11__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEE4baseB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %0)
  %6 = inttoptr i64 %5 to ptr
  store ptr %6, ptr %3, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %4) #24
  %7 = tail call i64 @_ZNKSt3__116reverse_iteratorINS_11__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEE4baseB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %1)
  %8 = inttoptr i64 %7 to ptr
  store ptr %8, ptr %4, align 8
  %9 = call noundef zeroext i1 @_ZNSt3__1neB7v160006IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEbRKNS_11__wrap_iterIT_EESC_(ptr noundef nonnull align 8 dereferenceable(8) %3, ptr noundef nonnull align 8 dereferenceable(8) %4) #24
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %4) #24
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3) #24
  ret i1 %9
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef zeroext i1 @_ZNSt3__1eqB7v160006INS_11__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEES9_EEbRKNS_16reverse_iteratorIT_EERKNSA_IT0_EE(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef nonnull align 8 dereferenceable(16) %1) local_unnamed_addr #7 {
  %3 = alloca %"class.std::__1::__wrap_iter", align 8
  %4 = alloca %"class.std::__1::__wrap_iter", align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %3) #24
  %5 = tail call i64 @_ZNKSt3__116reverse_iteratorINS_11__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEE4baseB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %0)
  %6 = inttoptr i64 %5 to ptr
  store ptr %6, ptr %3, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %4) #24
  %7 = tail call i64 @_ZNKSt3__116reverse_iteratorINS_11__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEE4baseB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %1)
  %8 = inttoptr i64 %7 to ptr
  store ptr %8, ptr %4, align 8
  %9 = call noundef zeroext i1 @_ZNSt3__1eqB7v160006IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEbRKNS_11__wrap_iterIT_EESC_(ptr noundef nonnull align 8 dereferenceable(8) %3, ptr noundef nonnull align 8 dereferenceable(8) %4) #24
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %4) #24
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %3) #24
  ret i1 %9
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr noundef zeroext i1 @_ZNK15CIStringCompareclERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEES8_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef nonnull align 8 dereferenceable(24) %1, ptr noundef nonnull align 8 dereferenceable(24) %2) local_unnamed_addr #7 align 2 {
  %4 = tail call noundef zeroext i1 @_Z29pdns_ilexicographical_compareRKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES7_(ptr noundef nonnull align 8 dereferenceable(24) %1, ptr noundef nonnull align 8 dereferenceable(24) %2) #28
  ret i1 %4
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__116reverse_iteratorINS_11__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEEdeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) local_unnamed_addr #7 align 2 {
  %2 = alloca %"class.std::__1::__wrap_iter", align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %2) #24
  %3 = getelementptr inbounds %"class.std::__1::reverse_iterator", ptr %0, i64 0, i32 1
  %4 = load i64, ptr %3, align 8, !tbaa !43
  store i64 %4, ptr %2, align 8, !tbaa !43
  %5 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__111__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEmmB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(8) %2) #24
  %6 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__111__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEdeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(8) %5) #24
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %2) #24
  ret ptr %6
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(16) ptr @_ZNSt3__116reverse_iteratorINS_11__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEEppB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) local_unnamed_addr #7 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::reverse_iterator", ptr %0, i64 0, i32 1
  %3 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__111__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEmmB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(8) %2) #24
  ret ptr %0
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef zeroext i1 @_ZNSt3__1neB7v160006IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEbRKNS_11__wrap_iterIT_EESC_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) local_unnamed_addr #7 {
  %3 = tail call noundef zeroext i1 @_ZNSt3__1eqB7v160006IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEbRKNS_11__wrap_iterIT_EESC_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #24
  %4 = xor i1 %3, true
  ret i1 %4
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNKSt3__116reverse_iteratorINS_11__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEE4baseB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) local_unnamed_addr #7 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::reverse_iterator", ptr %0, i64 0, i32 1
  %3 = load ptr, ptr %2, align 8, !tbaa.struct !124
  %4 = ptrtoint ptr %3 to i64
  ret i64 %4
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef zeroext i1 @_ZNSt3__1eqB7v160006IPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEbRKNS_11__wrap_iterIT_EESC_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) local_unnamed_addr #7 {
  %3 = tail call noundef ptr @_ZNKSt3__111__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEE4baseB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) #24
  %4 = tail call noundef ptr @_ZNKSt3__111__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEE4baseB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(8) %1) #24
  %5 = icmp eq ptr %3, %4
  ret i1 %5
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNKSt3__111__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEE4baseB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) local_unnamed_addr #7 align 2 {
  %2 = load ptr, ptr %0, align 8, !tbaa !122
  ret ptr %2
}

; Function Attrs: mustprogress nofree noinline nounwind ssp willreturn memory(read) uwtable(sync)
define linkonce_odr noundef zeroext i1 @_Z29pdns_ilexicographical_compareRKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES7_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) local_unnamed_addr #10 {
  %3 = tail call noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5c_strB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %4 = tail call noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5c_strB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %1) #24
  %5 = tail call noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6lengthB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #24
  %6 = getelementptr inbounds i8, ptr %3, i64 %5
  %7 = tail call noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6lengthB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %1) #24
  %8 = getelementptr inbounds i8, ptr %4, i64 %7
  %9 = icmp ne i64 %5, 0
  %10 = icmp ne i64 %7, 0
  %11 = and i1 %9, %10
  br i1 %11, label %12, label %35

12:                                               ; preds = %2, %29
  %13 = phi ptr [ %30, %29 ], [ %3, %2 ]
  %14 = phi ptr [ %31, %29 ], [ %4, %2 ]
  %15 = load i8, ptr %13, align 1, !tbaa !5
  %16 = load i8, ptr %14, align 1, !tbaa !5
  %17 = icmp eq i8 %15, %16
  br i1 %17, label %29, label %18

18:                                               ; preds = %12
  %19 = tail call noundef zeroext i8 @_Z11dns_tolowerh(i8 noundef zeroext %15)
  %20 = load i8, ptr %14, align 1, !tbaa !5
  %21 = tail call noundef zeroext i8 @_Z11dns_tolowerh(i8 noundef zeroext %20)
  %22 = icmp eq i8 %19, %21
  br i1 %22, label %29, label %23

23:                                               ; preds = %18
  %24 = load i8, ptr %13, align 1, !tbaa !5
  %25 = tail call noundef zeroext i8 @_Z11dns_tolowerh(i8 noundef zeroext %24)
  %26 = load i8, ptr %14, align 1, !tbaa !5
  %27 = tail call noundef zeroext i8 @_Z11dns_tolowerh(i8 noundef zeroext %26)
  %28 = icmp ult i8 %25, %27
  br label %43

29:                                               ; preds = %18, %12
  %30 = getelementptr inbounds i8, ptr %13, i64 1
  %31 = getelementptr inbounds i8, ptr %14, i64 1
  %32 = icmp ne ptr %30, %6
  %33 = icmp ne ptr %31, %8
  %34 = select i1 %32, i1 %33, i1 false
  br i1 %34, label %12, label %35, !llvm.loop !126

35:                                               ; preds = %29, %2
  %36 = phi ptr [ %4, %2 ], [ %31, %29 ]
  %37 = phi ptr [ %3, %2 ], [ %30, %29 ]
  %38 = icmp eq ptr %37, %6
  %39 = icmp ne ptr %36, %8
  %40 = xor i1 %38, true
  %41 = select i1 %40, i1 true, i1 %39
  %42 = and i1 %38, %41
  br label %43

43:                                               ; preds = %35, %23
  %44 = phi i1 [ %28, %23 ], [ %42, %35 ]
  ret i1 %44
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__111__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEmmB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) local_unnamed_addr #7 align 2 {
  %2 = load ptr, ptr %0, align 8, !tbaa !122
  %3 = getelementptr inbounds %"class.std::__1::basic_string", ptr %2, i64 -1
  store ptr %3, ptr %0, align 8, !tbaa !122
  ret ptr %0
}

; Function Attrs: mustprogress noinline nounwind ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__111__wrap_iterIPNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEdeB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) local_unnamed_addr #7 align 2 {
  %2 = load ptr, ptr %0, align 8, !tbaa !122
  ret ptr %2
}

; Function Attrs: noinline ssp uwtable(sync)
define internal void @_GLOBAL__sub_I_dnsname.cc() #0 section "__TEXT,__StaticInit,regular,pure_instructions" {
  tail call fastcc void @__cxx_global_var_init()
  tail call fastcc void @__cxx_global_var_init.1()
  tail call fastcc void @__cxx_global_var_init.2()
  tail call fastcc void @__cxx_global_var_init.3()
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umax.i64(i64, i64) #23
