; ModuleID = 'main_coalesced.bc'
source_filename = "main_coalesced.cu"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%"class.std::__1::basic_ostream.2" = type { ptr, %"class.std::__1::basic_ios.base.1" }
%"class.std::__1::basic_ios.base.1" = type <{ %"class.std::__1::ios_base.0", ptr, i32 }>
%"class.std::__1::ios_base.0" = type { ptr, i32, i64, i64, i32, i32, ptr, ptr, ptr, ptr, i64, i64, ptr, i64, i64, ptr, i64, i64 }
%"class.std::__1::locale::id.4" = type <{ %"struct.std::__1::once_flag.3", i32, [4 x i8] }>
%"struct.std::__1::once_flag.3" = type { i64 }
%"class.std::__1::basic_ifstream.11" = type { %"class.std::__1::basic_istream.base.6", %"class.std::__1::basic_filebuf.10", %"class.std::__1::basic_ios.base.1" }
%"class.std::__1::basic_istream.base.6" = type { ptr, i64 }
%"class.std::__1::basic_filebuf.10" = type <{ %"class.std::__1::basic_streambuf.7", ptr, ptr, ptr, [8 x i8], i64, ptr, i64, ptr, ptr, %struct.__mbstate_t.9, %struct.__mbstate_t.9, i32, i32, i8, i8, i8, [5 x i8] }>
%"class.std::__1::basic_streambuf.7" = type { ptr, %"class.std::__1::locale.5", ptr, ptr, ptr, ptr, ptr, ptr }
%"class.std::__1::locale.5" = type { ptr }
%struct.__mbstate_t.9 = type { i32, %union.anon.2.8 }
%union.anon.2.8 = type { i32 }
%"class.std::__1::basic_ofstream.13" = type { %"class.std::__1::basic_ostream.base.12", %"class.std::__1::basic_filebuf.10", %"class.std::__1::basic_ios.base.1" }
%"class.std::__1::basic_ostream.base.12" = type { ptr }
%struct.dim3.14 = type { i32, i32, i32 }
%"class.std::__1::basic_string.21" = type { %"class.std::__1::__compressed_pair.20" }
%"class.std::__1::__compressed_pair.20" = type { %"struct.std::__1::__compressed_pair_elem.19" }
%"struct.std::__1::__compressed_pair_elem.19" = type { %"struct.std::__1::basic_string<char>::__rep.18" }
%"struct.std::__1::basic_string<char>::__rep.18" = type { %union.anon.17 }
%union.anon.17 = type { %"struct.std::__1::basic_string<char>::__long.16" }
%"struct.std::__1::basic_string<char>::__long.16" = type { %struct.anon.15, i64, ptr }
%struct.anon.15 = type { i64 }
%"struct.std::__1::__default_init_tag.22" = type { i8 }
%"class.std::__1::unique_ptr.26" = type { %"class.std::__1::__compressed_pair.3.25" }
%"class.std::__1::__compressed_pair.3.25" = type { %"struct.std::__1::__compressed_pair_elem.4.23", %"struct.std::__1::__compressed_pair_elem.5.24" }
%"struct.std::__1::__compressed_pair_elem.4.23" = type { ptr }
%"struct.std::__1::__compressed_pair_elem.5.24" = type { ptr }
%"class.std::__1::fpos.27" = type { %struct.__mbstate_t.9, i64 }
%"class.std::__1::basic_istream.28" = type { ptr, i64, %"class.std::__1::basic_ios.base.1" }
%"class.std::__1::basic_ios.29" = type <{ %"class.std::__1::ios_base.0", ptr, i32, [4 x i8] }>
%"struct.std::__1::basic_string<char>::__short.31" = type { %struct.anon.0.30, [0 x i8], [23 x i8] }
%struct.anon.0.30 = type { i8 }
%"class.std::__1::basic_ostream<char>::sentry.32" = type { i8, ptr }
%"class.std::__1::ostreambuf_iterator.33" = type { ptr }

$_ZNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEC1ERKNS_12basic_stringIcS2_NS_9allocatorIcEEEEj = comdat any

$_ZNKSt3__114basic_ifstreamIcNS_11char_traitsIcEEE7is_openEv = comdat any

$_ZNSt3__1lsB7v160006INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc = comdat any

$_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEE3getB7v160006ERc = comdat any

$_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEEcvbB7v160006Ev = comdat any

$_ZNSt3__1lsB7v160006INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_c = comdat any

$_ZNSt3__114basic_ifstreamIcNS_11char_traitsIcEEE5closeEv = comdat any

$_ZNSt3__114basic_ifstreamIcNS_11char_traitsIcEEED1Ev = comdat any

$_ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEC1ERKNS_12basic_stringIcS2_NS_9allocatorIcEEEEj = comdat any

$_ZNKSt3__114basic_ofstreamIcNS_11char_traitsIcEEE7is_openEv = comdat any

$_ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEE5closeEv = comdat any

$_ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED1Ev = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B7v160006IDnEEPKc = comdat any

$_ZN4dim3C2Ejjj = comdat any

$_ZNSt3__114basic_ifstreamIcNS_11char_traitsIcEEED2Ev = comdat any

$_ZTv0_n24_NSt3__114basic_ifstreamIcNS_11char_traitsIcEEED1Ev = comdat any

$_ZNSt3__114basic_ifstreamIcNS_11char_traitsIcEEED0Ev = comdat any

$_ZTv0_n24_NSt3__114basic_ifstreamIcNS_11char_traitsIcEEED0Ev = comdat any

$_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED2Ev = comdat any

$_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE5closeEv = comdat any

$__clang_call_terminate = comdat any

$_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED0Ev = comdat any

$_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE5imbueERKNS_6localeE = comdat any

$_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE6setbufEPcl = comdat any

$_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE7seekoffExNS_8ios_base7seekdirEj = comdat any

$_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE7seekposENS_4fposI11__mbstate_tEEj = comdat any

$_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE4syncEv = comdat any

$_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE9underflowEv = comdat any

$_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE9pbackfailEi = comdat any

$_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE8overflowEi = comdat any

$_ZNSt3__110unique_ptrI8_IO_FILEPFiPS1_EEC2B7v160006ILb1EvEES2_NS_16__dependent_typeINS_27__unique_ptr_deleter_sfinaeIS4_EEXT_EE20__good_rval_ref_typeE = comdat any

$_ZNSt3__110unique_ptrI8_IO_FILEPFiPS1_EE7releaseB7v160006Ev = comdat any

$_ZNSt3__110unique_ptrI8_IO_FILEPFiPS1_EED2B7v160006Ev = comdat any

$_ZNSt3__117__compressed_pairIP8_IO_FILEPFiS2_EEC2B7v160006IRS2_S4_EEOT_OT0_ = comdat any

$_ZNSt3__122__compressed_pair_elemIP8_IO_FILELi0ELb0EEC2B7v160006IRS2_vEEOT_ = comdat any

$_ZNSt3__122__compressed_pair_elemIPFiP8_IO_FILEELi1ELb0EEC2B7v160006IS4_vEEOT_ = comdat any

$_ZNSt3__117__compressed_pairIP8_IO_FILEPFiS2_EE5firstB7v160006Ev = comdat any

$_ZNSt3__122__compressed_pair_elemIP8_IO_FILELi0ELb0EE5__getB7v160006Ev = comdat any

$_ZNSt3__110unique_ptrI8_IO_FILEPFiPS1_EE5resetB7v160006ES2_ = comdat any

$_ZNSt3__117__compressed_pairIP8_IO_FILEPFiS2_EE6secondB7v160006Ev = comdat any

$_ZNSt3__122__compressed_pair_elemIPFiP8_IO_FILEELi1ELb0EE5__getB7v160006Ev = comdat any

$_ZNSt3__19use_facetB7v160006INS_7codecvtIcc11__mbstate_tEEEERKT_RKNS_6localeE = comdat any

$_ZNKSt3__17codecvtIcc11__mbstate_tE13always_noconvB7v160006Ev = comdat any

$_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setgB7v160006EPcS4_S4_ = comdat any

$_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setpB7v160006EPcS4_ = comdat any

$_ZNSt3__13maxIlEEUa9enable_ifILb1EERKT_S3_S3_ = comdat any

$_ZNSt3__116__throw_bad_castB7v160006Ev = comdat any

$_ZNKSt3__17codecvtIcc11__mbstate_tE8encodingB7v160006Ev = comdat any

$_ZNSt3__14fposI11__mbstate_tEC2B7v160006Ex = comdat any

$_ZNSt3__14fposI11__mbstate_tE5stateB7v160006ES1_ = comdat any

$_ZNKSt3__14fposI11__mbstate_tEcvxB7v160006Ev = comdat any

$_ZNKSt3__14fposI11__mbstate_tE5stateB7v160006Ev = comdat any

$_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4pptrB7v160006Ev = comdat any

$_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5pbaseB7v160006Ev = comdat any

$_ZNSt3__111char_traitsIcE3eofEv = comdat any

$_ZNKSt3__17codecvtIcc11__mbstate_tE7unshiftB7v160006ERS1_PcS4_RS4_ = comdat any

$_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5egptrB7v160006Ev = comdat any

$_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4gptrB7v160006Ev = comdat any

$_ZNKSt3__17codecvtIcc11__mbstate_tE6lengthB7v160006ERS1_PKcS5_m = comdat any

$_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5ebackB7v160006Ev = comdat any

$_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE11__read_modeEv = comdat any

$_ZNSt3__13minImEEUa9enable_ifILb1EERKT_S3_S3_ = comdat any

$_ZNSt3__111char_traitsIcE11to_int_typeEc = comdat any

$_ZNKSt3__17codecvtIcc11__mbstate_tE2inB7v160006ERS1_PKcS5_RS5_PcS7_RS7_ = comdat any

$_ZNSt3__111char_traitsIcE11eq_int_typeEii = comdat any

$_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5gbumpB7v160006Ei = comdat any

$_ZNSt3__111char_traitsIcE7not_eofEi = comdat any

$_ZNSt3__111char_traitsIcE2eqEcc = comdat any

$_ZNSt3__111char_traitsIcE12to_char_typeEi = comdat any

$_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE12__write_modeEv = comdat any

$_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5epptrB7v160006Ev = comdat any

$_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5pbumpB7v160006Ei = comdat any

$_ZNKSt3__17codecvtIcc11__mbstate_tE3outB7v160006ERS1_PKcS5_RS5_PcS7_RS7_ = comdat any

$_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE7__pbumpB7v160006El = comdat any

$_ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED2Ev = comdat any

$_ZTv0_n24_NSt3__114basic_ofstreamIcNS_11char_traitsIcEEED1Ev = comdat any

$_ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED0Ev = comdat any

$_ZTv0_n24_NSt3__114basic_ofstreamIcNS_11char_traitsIcEEED0Ev = comdat any

$_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC2B7v160006INS_18__default_init_tagESA_EEOT_OT0_ = comdat any

$_ZNSt3__111char_traitsIcE6lengthEPKc = comdat any

$_ZNSt3__119__debug_db_insert_cB7v160006INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEvPT_ = comdat any

$_ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EEC2B7v160006ENS_18__default_init_tagE = comdat any

$_ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EEC2B7v160006ENS_18__default_init_tagE = comdat any

$_ZNSt3__19allocatorIcEC2B7v160006Ev = comdat any

$_ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIcEEEC2B7v160006Ev = comdat any

$_ZNSt3__118__constexpr_strlenB7v160006EPKc = comdat any

$_ZNSt3__19basic_iosIcNS_11char_traitsIcEEEC2B7v160006Ev = comdat any

$_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEEC2B7v160006EPNS_15basic_streambufIcS2_EE = comdat any

$_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEEC2Ev = comdat any

$_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE4openERKNS_12basic_stringIcS2_NS_9allocatorIcEEEEj = comdat any

$_ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateB7v160006Ej = comdat any

$_ZNSt3__18ios_baseC2B7v160006Ev = comdat any

$_ZNSt3__19basic_iosIcNS_11char_traitsIcEEE4initB7v160006EPNS_15basic_streambufIcS2_EE = comdat any

$_ZNSt3__19has_facetB7v160006INS_7codecvtIcc11__mbstate_tEEEEbRKNS_6localeE = comdat any

$_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE6getlocB7v160006Ev = comdat any

$_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE4openEPKcj = comdat any

$_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5c_strB7v160006Ev = comdat any

$_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE15__make_mdstringEj = comdat any

$_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB7v160006Ev = comdat any

$_ZNSt3__112__to_addressB7v160006IKcEEPT_S3_ = comdat any

$_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB7v160006Ev = comdat any

$_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB7v160006Ev = comdat any

$_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB7v160006Ev = comdat any

$_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB7v160006Ev = comdat any

$_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB7v160006Ev = comdat any

$_ZNKSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getB7v160006Ev = comdat any

$_ZNSt3__114pointer_traitsIPKcE10pointer_toB7v160006ERS1_ = comdat any

$_ZNSt3__18ios_base8setstateB7v160006Ej = comdat any

$_ZNKSt3__113basic_filebufIcNS_11char_traitsIcEEE7is_openEv = comdat any

$_ZNSt3__124__put_character_sequenceB7v160006IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m = comdat any

$_ZNKSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentrycvbB7v160006Ev = comdat any

$_ZNSt3__116__pad_and_outputB7v160006IcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_ = comdat any

$_ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC2B7v160006ERNS_13basic_ostreamIcS2_EE = comdat any

$_ZNKSt3__18ios_base5flagsB7v160006Ev = comdat any

$_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE4fillB7v160006Ev = comdat any

$_ZNKSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEE6failedB7v160006Ev = comdat any

$_ZNKSt3__18ios_base5widthB7v160006Ev = comdat any

$_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnB7v160006EPKcl = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B7v160006Emc = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB7v160006Ev = comdat any

$_ZNSt3__18ios_base5widthB7v160006El = comdat any

$_ZNSt3__112__to_addressB7v160006IcEEPT_S2_ = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB7v160006Ev = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB7v160006Ev = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB7v160006Ev = comdat any

$_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB7v160006Ev = comdat any

$_ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getB7v160006Ev = comdat any

$_ZNSt3__114pointer_traitsIPcE10pointer_toB7v160006ERc = comdat any

$_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5rdbufB7v160006Ev = comdat any

$_ZNKSt3__18ios_base5rdbufB7v160006Ev = comdat any

$_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenB7v160006Ec = comdat any

$_ZNSt3__19use_facetB7v160006INS_5ctypeIcEEEERKT_RKNS_6localeE = comdat any

$_ZNKSt3__15ctypeIcE5widenB7v160006Ec = comdat any

$_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE4failB7v160006Ev = comdat any

$_ZNKSt3__18ios_base4failB7v160006Ev = comdat any

$_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEEC2B7v160006EPNS_15basic_streambufIcS2_EE = comdat any

$_ZTVNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE = comdat any

$_ZTTNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE = comdat any

$_ZTCNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE0_NS_13basic_istreamIcS2_EE = comdat any

$_ZTSNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE = comdat any

$_ZTINSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE = comdat any

$_ZTVNSt3__113basic_filebufIcNS_11char_traitsIcEEEE = comdat any

$_ZTSNSt3__113basic_filebufIcNS_11char_traitsIcEEEE = comdat any

$_ZTINSt3__113basic_filebufIcNS_11char_traitsIcEEEE = comdat any

$_ZTVNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE = comdat any

$_ZTTNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE = comdat any

$_ZTCNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE0_NS_13basic_ostreamIcS2_EE = comdat any

$_ZTSNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE = comdat any

$_ZTINSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE = comdat any

@.str = private unnamed_addr constant [21 x i8] c"Error opening file!\0A\00", align 1
@_ZNSt3__14coutE = external global %"class.std::__1::basic_ostream.2", align 8
@.str.1 = private unnamed_addr constant [24 x i8] c"Skipping first line...\0A\00", align 1
@.str.2 = private unnamed_addr constant [22 x i8] c"Skipping comments...\0A\00", align 1
@.str.3 = private unnamed_addr constant [18 x i8] c"Reading width...\0A\00", align 1
@.str.4 = private unnamed_addr constant [19 x i8] c"Reading height...\0A\00", align 1
@.str.5 = private unnamed_addr constant [20 x i8] c"Reading max val...\0A\00", align 1
@.str.6 = private unnamed_addr constant [8 x i8] c"width: \00", align 1
@.str.7 = private unnamed_addr constant [11 x i8] c", height: \00", align 1
@.str.8 = private unnamed_addr constant [12 x i8] c", max_val: \00", align 1
@.str.9 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.10 = private unnamed_addr constant [19 x i8] c"Allocating mem...\0A\00", align 1
@.str.11 = private unnamed_addr constant [21 x i8] c"Reading rgb data...\0A\00", align 1
@.str.12 = private unnamed_addr constant [20 x i8] c"Read ppm succeeded\0A\00", align 1
@.str.13 = private unnamed_addr constant [19 x i8] c"Writing result...\0A\00", align 1
@.str.14 = private unnamed_addr constant [33 x i8] c"Error opening file for writing!\0A\00", align 1
@.str.15 = private unnamed_addr constant [13 x i8] c"images/1.ppm\00", align 1
@.str.16 = private unnamed_addr constant [22 x i8] c"images/1_modified.ppm\00", align 1
@_ZTVNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE = linkonce_odr dso_local unnamed_addr constant { [5 x ptr], [5 x ptr] } { [5 x ptr] [ptr inttoptr (i64 184 to ptr), ptr null, ptr @_ZTINSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE, ptr @_ZNSt3__114basic_ifstreamIcNS_11char_traitsIcEEED1Ev, ptr @_ZNSt3__114basic_ifstreamIcNS_11char_traitsIcEEED0Ev], [5 x ptr] [ptr inttoptr (i64 -184 to ptr), ptr inttoptr (i64 -184 to ptr), ptr @_ZTINSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE, ptr @_ZTv0_n24_NSt3__114basic_ifstreamIcNS_11char_traitsIcEEED1Ev, ptr @_ZTv0_n24_NSt3__114basic_ifstreamIcNS_11char_traitsIcEEED0Ev] }, comdat, align 8
@_ZTTNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE = linkonce_odr dso_local unnamed_addr constant [4 x ptr] [ptr getelementptr inbounds ({ [5 x ptr], [5 x ptr] }, ptr @_ZTVNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE, i32 0, inrange i32 0, i32 3), ptr getelementptr inbounds ({ [5 x ptr], [5 x ptr] }, ptr @_ZTCNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE0_NS_13basic_istreamIcS2_EE, i32 0, inrange i32 0, i32 3), ptr getelementptr inbounds ({ [5 x ptr], [5 x ptr] }, ptr @_ZTCNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE0_NS_13basic_istreamIcS2_EE, i32 0, inrange i32 1, i32 3), ptr getelementptr inbounds ({ [5 x ptr], [5 x ptr] }, ptr @_ZTVNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE, i32 0, inrange i32 1, i32 3)], comdat, align 8
@_ZTCNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE0_NS_13basic_istreamIcS2_EE = linkonce_odr dso_local unnamed_addr constant { [5 x ptr], [5 x ptr] } { [5 x ptr] [ptr inttoptr (i64 184 to ptr), ptr null, ptr @_ZTINSt3__113basic_istreamIcNS_11char_traitsIcEEEE, ptr @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEED1Ev, ptr @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEED0Ev], [5 x ptr] [ptr inttoptr (i64 -184 to ptr), ptr inttoptr (i64 -184 to ptr), ptr @_ZTINSt3__113basic_istreamIcNS_11char_traitsIcEEEE, ptr @_ZTv0_n24_NSt3__113basic_istreamIcNS_11char_traitsIcEEED1Ev, ptr @_ZTv0_n24_NSt3__113basic_istreamIcNS_11char_traitsIcEEED0Ev] }, comdat, align 8
@_ZTINSt3__113basic_istreamIcNS_11char_traitsIcEEEE = external constant ptr
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global ptr
@_ZTSNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE = linkonce_odr dso_local constant [48 x i8] c"NSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE\00", comdat, align 1
@_ZTINSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE = linkonce_odr dso_local constant { ptr, ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTSNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE, ptr @_ZTINSt3__113basic_istreamIcNS_11char_traitsIcEEEE }, comdat, align 8
@_ZTVNSt3__113basic_filebufIcNS_11char_traitsIcEEEE = linkonce_odr dso_local unnamed_addr constant { [16 x ptr] } { [16 x ptr] [ptr null, ptr @_ZTINSt3__113basic_filebufIcNS_11char_traitsIcEEEE, ptr @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED2Ev, ptr @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED0Ev, ptr @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE5imbueERKNS_6localeE, ptr @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE6setbufEPcl, ptr @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE7seekoffExNS_8ios_base7seekdirEj, ptr @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE7seekposENS_4fposI11__mbstate_tEEj, ptr @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE4syncEv, ptr @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE9showmanycEv, ptr @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE6xsgetnEPcl, ptr @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE9underflowEv, ptr @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5uflowEv, ptr @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE9pbackfailEi, ptr @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE6xsputnEPKcl, ptr @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE8overflowEi] }, comdat, align 8
@_ZTSNSt3__113basic_filebufIcNS_11char_traitsIcEEEE = linkonce_odr dso_local constant [47 x i8] c"NSt3__113basic_filebufIcNS_11char_traitsIcEEEE\00", comdat, align 1
@_ZTINSt3__115basic_streambufIcNS_11char_traitsIcEEEE = external constant ptr
@_ZTINSt3__113basic_filebufIcNS_11char_traitsIcEEEE = linkonce_odr dso_local constant { ptr, ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTSNSt3__113basic_filebufIcNS_11char_traitsIcEEEE, ptr @_ZTINSt3__115basic_streambufIcNS_11char_traitsIcEEEE }, comdat, align 8
@_ZNSt3__17codecvtIcc11__mbstate_tE2idE = external global %"class.std::__1::locale::id.4", align 8
@_ZTISt8bad_cast = external constant ptr
@_ZTVNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE = linkonce_odr dso_local unnamed_addr constant { [5 x ptr], [5 x ptr] } { [5 x ptr] [ptr inttoptr (i64 176 to ptr), ptr null, ptr @_ZTINSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE, ptr @_ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED1Ev, ptr @_ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED0Ev], [5 x ptr] [ptr inttoptr (i64 -176 to ptr), ptr inttoptr (i64 -176 to ptr), ptr @_ZTINSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE, ptr @_ZTv0_n24_NSt3__114basic_ofstreamIcNS_11char_traitsIcEEED1Ev, ptr @_ZTv0_n24_NSt3__114basic_ofstreamIcNS_11char_traitsIcEEED0Ev] }, comdat, align 8
@_ZTTNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE = linkonce_odr dso_local unnamed_addr constant [4 x ptr] [ptr getelementptr inbounds ({ [5 x ptr], [5 x ptr] }, ptr @_ZTVNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE, i32 0, inrange i32 0, i32 3), ptr getelementptr inbounds ({ [5 x ptr], [5 x ptr] }, ptr @_ZTCNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE0_NS_13basic_ostreamIcS2_EE, i32 0, inrange i32 0, i32 3), ptr getelementptr inbounds ({ [5 x ptr], [5 x ptr] }, ptr @_ZTCNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE0_NS_13basic_ostreamIcS2_EE, i32 0, inrange i32 1, i32 3), ptr getelementptr inbounds ({ [5 x ptr], [5 x ptr] }, ptr @_ZTVNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE, i32 0, inrange i32 1, i32 3)], comdat, align 8
@_ZTCNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE0_NS_13basic_ostreamIcS2_EE = linkonce_odr dso_local unnamed_addr constant { [5 x ptr], [5 x ptr] } { [5 x ptr] [ptr inttoptr (i64 176 to ptr), ptr null, ptr @_ZTINSt3__113basic_ostreamIcNS_11char_traitsIcEEEE, ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED1Ev, ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED0Ev], [5 x ptr] [ptr inttoptr (i64 -176 to ptr), ptr inttoptr (i64 -176 to ptr), ptr @_ZTINSt3__113basic_ostreamIcNS_11char_traitsIcEEEE, ptr @_ZTv0_n24_NSt3__113basic_ostreamIcNS_11char_traitsIcEEED1Ev, ptr @_ZTv0_n24_NSt3__113basic_ostreamIcNS_11char_traitsIcEEED0Ev] }, comdat, align 8
@_ZTINSt3__113basic_ostreamIcNS_11char_traitsIcEEEE = external constant ptr
@_ZTSNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE = linkonce_odr dso_local constant [48 x i8] c"NSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE\00", comdat, align 1
@_ZTINSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE = linkonce_odr dso_local constant { ptr, ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTSNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE, ptr @_ZTINSt3__113basic_ostreamIcNS_11char_traitsIcEEEE }, comdat, align 8
@_ZTVNSt3__19basic_iosIcNS_11char_traitsIcEEEE = external unnamed_addr constant { [4 x ptr] }, align 8
@_ZTVNSt3__18ios_baseE = external unnamed_addr constant { [4 x ptr] }, align 8
@.str.17 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.18 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.19 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.20 = private unnamed_addr constant [3 x i8] c"r+\00", align 1
@.str.21 = private unnamed_addr constant [3 x i8] c"w+\00", align 1
@.str.22 = private unnamed_addr constant [3 x i8] c"a+\00", align 1
@.str.23 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str.24 = private unnamed_addr constant [3 x i8] c"ab\00", align 1
@.str.25 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.26 = private unnamed_addr constant [4 x i8] c"r+b\00", align 1
@.str.27 = private unnamed_addr constant [4 x i8] c"w+b\00", align 1
@.str.28 = private unnamed_addr constant [4 x i8] c"a+b\00", align 1
@_ZNSt3__15ctypeIcE2idE = external global %"class.std::__1::locale::id.4", align 8

; Function Attrs: mustprogress noinline sspstrong uwtable
define dso_local noundef ptr @_Z8read_ppmNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERiS6_(ptr noundef %0, ptr noundef nonnull align 4 dereferenceable(4) %1, ptr noundef nonnull align 4 dereferenceable(4) %2) #0 personality ptr @__gxx_personality_v0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i8, align 1
  %8 = alloca i32, align 4
  %9 = alloca %"class.std::__1::basic_ifstream.11", align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i64, align 8
  %14 = alloca ptr, align 8
  %15 = alloca i64, align 8
  %16 = alloca i8, align 1
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %17 = load ptr, ptr %5, align 8
  store i32 0, ptr %17, align 4
  %18 = load ptr, ptr %6, align 8
  store i32 0, ptr %18, align 4
  store i32 0, ptr %8, align 4
  call void @_ZNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEC1ERKNS_12basic_stringIcS2_NS_9allocatorIcEEEEj(ptr noundef nonnull align 8 dereferenceable(184) %9, ptr noundef nonnull align 8 dereferenceable(24) %0, i32 noundef 4)
  %19 = invoke noundef zeroext i1 @_ZNKSt3__114basic_ifstreamIcNS_11char_traitsIcEEE7is_openEv(ptr noundef nonnull align 8 dereferenceable(184) %9)
          to label %20 unwind label %24

20:                                               ; preds = %3
  br i1 %19, label %28, label %21

21:                                               ; preds = %20
  %22 = invoke i32 (ptr, ...) @printf(ptr noundef @.str)
          to label %23 unwind label %24

23:                                               ; preds = %21
  store ptr null, ptr %4, align 8
  store i32 1, ptr %12, align 4
  br label %276

24:                                               ; preds = %272, %271, %254, %247, %241, %237, %222, %220, %218, %215, %213, %209, %207, %203, %201, %192, %189, %168, %166, %163, %152, %149, %128, %126, %123, %112, %109, %88, %86, %83, %79, %65, %63, %51, %49, %46, %33, %31, %28, %21, %3
  %25 = landingpad { ptr, i32 }
          cleanup
  %26 = extractvalue { ptr, i32 } %25, 0
  store ptr %26, ptr %10, align 8
  %27 = extractvalue { ptr, i32 } %25, 1
  store i32 %27, ptr %11, align 4
  call void @_ZNSt3__114basic_ifstreamIcNS_11char_traitsIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(184) %9) #17
  br label %278

28:                                               ; preds = %20
  %29 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB7v160006INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.1)
          to label %30 unwind label %24

30:                                               ; preds = %28
  br label %31

31:                                               ; preds = %45, %30
  %32 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEE3getB7v160006ERc(ptr noundef nonnull align 8 dereferenceable(16) %9, ptr noundef nonnull align 1 dereferenceable(1) %7)
          to label %33 unwind label %24

33:                                               ; preds = %31
  %34 = load ptr, ptr %32, align 8
  %35 = getelementptr i8, ptr %34, i64 -24
  %36 = load i64, ptr %35, align 8
  %37 = getelementptr inbounds i8, ptr %32, i64 %36
  %38 = invoke noundef zeroext i1 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEEcvbB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(148) %37)
          to label %39 unwind label %24

39:                                               ; preds = %33
  br i1 %38, label %40, label %46

40:                                               ; preds = %39
  %41 = load i8, ptr %7, align 1
  %42 = sext i8 %41 to i32
  %43 = icmp eq i32 %42, 10
  br i1 %43, label %44, label %45

44:                                               ; preds = %40
  br label %46

45:                                               ; preds = %40
  br label %31, !llvm.loop !7

46:                                               ; preds = %44, %39
  %47 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB7v160006INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.2)
          to label %48 unwind label %24

48:                                               ; preds = %46
  br label %49

49:                                               ; preds = %82, %48
  %50 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEE3getB7v160006ERc(ptr noundef nonnull align 8 dereferenceable(16) %9, ptr noundef nonnull align 1 dereferenceable(1) %7)
          to label %51 unwind label %24

51:                                               ; preds = %49
  %52 = load ptr, ptr %50, align 8
  %53 = getelementptr i8, ptr %52, i64 -24
  %54 = load i64, ptr %53, align 8
  %55 = getelementptr inbounds i8, ptr %50, i64 %54
  %56 = invoke noundef zeroext i1 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEEcvbB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(148) %55)
          to label %57 unwind label %24

57:                                               ; preds = %51
  br i1 %56, label %58, label %83

58:                                               ; preds = %57
  %59 = load i8, ptr %7, align 1
  %60 = sext i8 %59 to i32
  %61 = icmp eq i32 %60, 35
  br i1 %61, label %62, label %79

62:                                               ; preds = %58
  br label %63

63:                                               ; preds = %77, %62
  %64 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEE3getB7v160006ERc(ptr noundef nonnull align 8 dereferenceable(16) %9, ptr noundef nonnull align 1 dereferenceable(1) %7)
          to label %65 unwind label %24

65:                                               ; preds = %63
  %66 = load ptr, ptr %64, align 8
  %67 = getelementptr i8, ptr %66, i64 -24
  %68 = load i64, ptr %67, align 8
  %69 = getelementptr inbounds i8, ptr %64, i64 %68
  %70 = invoke noundef zeroext i1 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEEcvbB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(148) %69)
          to label %71 unwind label %24

71:                                               ; preds = %65
  br i1 %70, label %72, label %78

72:                                               ; preds = %71
  %73 = load i8, ptr %7, align 1
  %74 = sext i8 %73 to i32
  %75 = icmp eq i32 %74, 10
  br i1 %75, label %76, label %77

76:                                               ; preds = %72
  br label %78

77:                                               ; preds = %72
  br label %63, !llvm.loop !9

78:                                               ; preds = %76, %71
  br label %82

79:                                               ; preds = %58
  %80 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEE5ungetEv(ptr noundef nonnull align 8 dereferenceable(16) %9)
          to label %81 unwind label %24

81:                                               ; preds = %79
  br label %83

82:                                               ; preds = %78
  br label %49, !llvm.loop !10

83:                                               ; preds = %81, %57
  %84 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB7v160006INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.3)
          to label %85 unwind label %24

85:                                               ; preds = %83
  br label %86

86:                                               ; preds = %114, %99, %85
  %87 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEE3getB7v160006ERc(ptr noundef nonnull align 8 dereferenceable(16) %9, ptr noundef nonnull align 1 dereferenceable(1) %7)
          to label %88 unwind label %24

88:                                               ; preds = %86
  %89 = load ptr, ptr %87, align 8
  %90 = getelementptr i8, ptr %89, i64 -24
  %91 = load i64, ptr %90, align 8
  %92 = getelementptr inbounds i8, ptr %87, i64 %91
  %93 = invoke noundef zeroext i1 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEEcvbB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(148) %92)
          to label %94 unwind label %24

94:                                               ; preds = %88
  br i1 %93, label %95, label %123

95:                                               ; preds = %94
  %96 = load i8, ptr %7, align 1
  %97 = sext i8 %96 to i32
  %98 = icmp eq i32 %97, 13
  br i1 %98, label %99, label %100

99:                                               ; preds = %95
  br label %86, !llvm.loop !11

100:                                              ; preds = %95
  %101 = load i8, ptr %7, align 1
  %102 = sext i8 %101 to i32
  %103 = icmp eq i32 %102, 32
  br i1 %103, label %108, label %104

104:                                              ; preds = %100
  %105 = load i8, ptr %7, align 1
  %106 = sext i8 %105 to i32
  %107 = icmp eq i32 %106, 10
  br i1 %107, label %108, label %109

108:                                              ; preds = %104, %100
  br label %123

109:                                              ; preds = %104
  %110 = load i8, ptr %7, align 1
  %111 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB7v160006INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_c(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, i8 noundef signext %110)
          to label %112 unwind label %24

112:                                              ; preds = %109
  %113 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB7v160006INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_c(ptr noundef nonnull align 8 dereferenceable(8) %111, i8 noundef signext 10)
          to label %114 unwind label %24

114:                                              ; preds = %112
  %115 = load ptr, ptr %5, align 8
  %116 = load i32, ptr %115, align 4
  %117 = mul nsw i32 %116, 10
  %118 = load i8, ptr %7, align 1
  %119 = sext i8 %118 to i32
  %120 = sub nsw i32 %119, 48
  %121 = add nsw i32 %117, %120
  %122 = load ptr, ptr %5, align 8
  store i32 %121, ptr %122, align 4
  br label %86, !llvm.loop !11

123:                                              ; preds = %108, %94
  %124 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB7v160006INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.4)
          to label %125 unwind label %24

125:                                              ; preds = %123
  br label %126

126:                                              ; preds = %154, %139, %125
  %127 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEE3getB7v160006ERc(ptr noundef nonnull align 8 dereferenceable(16) %9, ptr noundef nonnull align 1 dereferenceable(1) %7)
          to label %128 unwind label %24

128:                                              ; preds = %126
  %129 = load ptr, ptr %127, align 8
  %130 = getelementptr i8, ptr %129, i64 -24
  %131 = load i64, ptr %130, align 8
  %132 = getelementptr inbounds i8, ptr %127, i64 %131
  %133 = invoke noundef zeroext i1 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEEcvbB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(148) %132)
          to label %134 unwind label %24

134:                                              ; preds = %128
  br i1 %133, label %135, label %163

135:                                              ; preds = %134
  %136 = load i8, ptr %7, align 1
  %137 = sext i8 %136 to i32
  %138 = icmp eq i32 %137, 13
  br i1 %138, label %139, label %140

139:                                              ; preds = %135
  br label %126, !llvm.loop !12

140:                                              ; preds = %135
  %141 = load i8, ptr %7, align 1
  %142 = sext i8 %141 to i32
  %143 = icmp eq i32 %142, 32
  br i1 %143, label %148, label %144

144:                                              ; preds = %140
  %145 = load i8, ptr %7, align 1
  %146 = sext i8 %145 to i32
  %147 = icmp eq i32 %146, 10
  br i1 %147, label %148, label %149

148:                                              ; preds = %144, %140
  br label %163

149:                                              ; preds = %144
  %150 = load i8, ptr %7, align 1
  %151 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB7v160006INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_c(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, i8 noundef signext %150)
          to label %152 unwind label %24

152:                                              ; preds = %149
  %153 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB7v160006INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_c(ptr noundef nonnull align 8 dereferenceable(8) %151, i8 noundef signext 10)
          to label %154 unwind label %24

154:                                              ; preds = %152
  %155 = load ptr, ptr %6, align 8
  %156 = load i32, ptr %155, align 4
  %157 = mul nsw i32 %156, 10
  %158 = load i8, ptr %7, align 1
  %159 = sext i8 %158 to i32
  %160 = sub nsw i32 %159, 48
  %161 = add nsw i32 %157, %160
  %162 = load ptr, ptr %6, align 8
  store i32 %161, ptr %162, align 4
  br label %126, !llvm.loop !12

163:                                              ; preds = %148, %134
  %164 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB7v160006INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.5)
          to label %165 unwind label %24

165:                                              ; preds = %163
  br label %166

166:                                              ; preds = %194, %179, %165
  %167 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEE3getB7v160006ERc(ptr noundef nonnull align 8 dereferenceable(16) %9, ptr noundef nonnull align 1 dereferenceable(1) %7)
          to label %168 unwind label %24

168:                                              ; preds = %166
  %169 = load ptr, ptr %167, align 8
  %170 = getelementptr i8, ptr %169, i64 -24
  %171 = load i64, ptr %170, align 8
  %172 = getelementptr inbounds i8, ptr %167, i64 %171
  %173 = invoke noundef zeroext i1 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEEcvbB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(148) %172)
          to label %174 unwind label %24

174:                                              ; preds = %168
  br i1 %173, label %175, label %201

175:                                              ; preds = %174
  %176 = load i8, ptr %7, align 1
  %177 = sext i8 %176 to i32
  %178 = icmp eq i32 %177, 13
  br i1 %178, label %179, label %180

179:                                              ; preds = %175
  br label %166, !llvm.loop !13

180:                                              ; preds = %175
  %181 = load i8, ptr %7, align 1
  %182 = sext i8 %181 to i32
  %183 = icmp eq i32 %182, 32
  br i1 %183, label %188, label %184

184:                                              ; preds = %180
  %185 = load i8, ptr %7, align 1
  %186 = sext i8 %185 to i32
  %187 = icmp eq i32 %186, 10
  br i1 %187, label %188, label %189

188:                                              ; preds = %184, %180
  br label %201

189:                                              ; preds = %184
  %190 = load i8, ptr %7, align 1
  %191 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB7v160006INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_c(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, i8 noundef signext %190)
          to label %192 unwind label %24

192:                                              ; preds = %189
  %193 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB7v160006INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_c(ptr noundef nonnull align 8 dereferenceable(8) %191, i8 noundef signext 10)
          to label %194 unwind label %24

194:                                              ; preds = %192
  %195 = load i32, ptr %8, align 4
  %196 = mul nsw i32 %195, 10
  %197 = load i8, ptr %7, align 1
  %198 = sext i8 %197 to i32
  %199 = sub nsw i32 %198, 48
  %200 = add nsw i32 %196, %199
  store i32 %200, ptr %8, align 4
  br label %166, !llvm.loop !13

201:                                              ; preds = %188, %174
  %202 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB7v160006INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.6)
          to label %203 unwind label %24

203:                                              ; preds = %201
  %204 = load ptr, ptr %5, align 8
  %205 = load i32, ptr %204, align 4
  %206 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi(ptr noundef nonnull align 8 dereferenceable(8) %202, i32 noundef %205)
          to label %207 unwind label %24

207:                                              ; preds = %203
  %208 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB7v160006INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) %206, ptr noundef @.str.7)
          to label %209 unwind label %24

209:                                              ; preds = %207
  %210 = load ptr, ptr %6, align 8
  %211 = load i32, ptr %210, align 4
  %212 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi(ptr noundef nonnull align 8 dereferenceable(8) %208, i32 noundef %211)
          to label %213 unwind label %24

213:                                              ; preds = %209
  %214 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB7v160006INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) %212, ptr noundef @.str.8)
          to label %215 unwind label %24

215:                                              ; preds = %213
  %216 = load i32, ptr %8, align 4
  %217 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi(ptr noundef nonnull align 8 dereferenceable(8) %214, i32 noundef %216)
          to label %218 unwind label %24

218:                                              ; preds = %215
  %219 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB7v160006INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) %217, ptr noundef @.str.9)
          to label %220 unwind label %24

220:                                              ; preds = %218
  %221 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB7v160006INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.10)
          to label %222 unwind label %24

222:                                              ; preds = %220
  %223 = load ptr, ptr %5, align 8
  %224 = load i32, ptr %223, align 4
  %225 = sext i32 %224 to i64
  %226 = mul nsw i64 3, %225
  %227 = load ptr, ptr %6, align 8
  %228 = load i32, ptr %227, align 4
  %229 = sext i32 %228 to i64
  %230 = mul nsw i64 %226, %229
  store i64 %230, ptr %13, align 8
  %231 = load i64, ptr %13, align 8
  %232 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %231, i64 4)
  %233 = extractvalue { i64, i1 } %232, 1
  %234 = extractvalue { i64, i1 } %232, 0
  %235 = select i1 %233, i64 -1, i64 %234
  %236 = invoke noalias noundef nonnull ptr @_Znam(i64 noundef %235) #18
          to label %237 unwind label %24

237:                                              ; preds = %222
  store ptr %236, ptr %14, align 8
  %238 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB7v160006INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.11)
          to label %239 unwind label %24

239:                                              ; preds = %237
  store i64 0, ptr %15, align 8
  br label %240

240:                                              ; preds = %270, %253, %239
  br label %241

241:                                              ; preds = %240
  %242 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEE3getB7v160006ERc(ptr noundef nonnull align 8 dereferenceable(16) %9, ptr noundef nonnull align 1 dereferenceable(1) %7)
          to label %243 unwind label %24

243:                                              ; preds = %241
  %244 = load i8, ptr %7, align 1
  %245 = sext i8 %244 to i32
  %246 = icmp eq i32 %245, 13
  br i1 %246, label %247, label %258

247:                                              ; preds = %243
  %248 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEE3getB7v160006ERc(ptr noundef nonnull align 8 dereferenceable(16) %9, ptr noundef nonnull align 1 dereferenceable(1) %16)
          to label %249 unwind label %24

249:                                              ; preds = %247
  %250 = load i8, ptr %16, align 1
  %251 = sext i8 %250 to i32
  %252 = icmp eq i32 %251, 10
  br i1 %252, label %253, label %254

253:                                              ; preds = %249
  br label %240, !llvm.loop !14

254:                                              ; preds = %249
  %255 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEE5ungetEv(ptr noundef nonnull align 8 dereferenceable(16) %9)
          to label %256 unwind label %24

256:                                              ; preds = %254
  br label %257

257:                                              ; preds = %256
  br label %258

258:                                              ; preds = %257, %243
  %259 = load i8, ptr %7, align 1
  %260 = zext i8 %259 to i32
  %261 = load ptr, ptr %14, align 8
  %262 = load i64, ptr %15, align 8
  %263 = getelementptr inbounds i32, ptr %261, i64 %262
  store i32 %260, ptr %263, align 4
  %264 = load i64, ptr %15, align 8
  %265 = add nsw i64 %264, 1
  store i64 %265, ptr %15, align 8
  %266 = load i64, ptr %15, align 8
  %267 = load i64, ptr %13, align 8
  %268 = icmp eq i64 %266, %267
  br i1 %268, label %269, label %270

269:                                              ; preds = %258
  br label %271

270:                                              ; preds = %258
  br label %240, !llvm.loop !14

271:                                              ; preds = %269
  invoke void @_ZNSt3__114basic_ifstreamIcNS_11char_traitsIcEEE5closeEv(ptr noundef nonnull align 8 dereferenceable(184) %9)
          to label %272 unwind label %24

272:                                              ; preds = %271
  %273 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB7v160006INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.12)
          to label %274 unwind label %24

274:                                              ; preds = %272
  %275 = load ptr, ptr %14, align 8
  store ptr %275, ptr %4, align 8
  store i32 1, ptr %12, align 4
  br label %276

276:                                              ; preds = %274, %23
  call void @_ZNSt3__114basic_ifstreamIcNS_11char_traitsIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(184) %9) #17
  %277 = load ptr, ptr %4, align 8
  ret ptr %277

278:                                              ; preds = %24
  %279 = load ptr, ptr %10, align 8
  %280 = load i32, ptr %11, align 4
  %281 = insertvalue { ptr, i32 } poison, ptr %279, 0
  %282 = insertvalue { ptr, i32 } %281, i32 %280, 1
  resume { ptr, i32 } %282
}

; Function Attrs: noinline sspstrong uwtable
define linkonce_odr hidden void @_ZNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEC1ERKNS_12basic_stringIcS2_NS_9allocatorIcEEEEj(ptr noundef nonnull align 8 dereferenceable(184) %0, ptr noundef nonnull align 8 dereferenceable(24) %1, i32 noundef %2) unnamed_addr #1 comdat align 2 personality ptr @__gxx_personality_v0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %9 = load ptr, ptr %4, align 8
  %10 = getelementptr inbounds i8, ptr %9, i64 184
  call void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEEC2B7v160006Ev(ptr noundef nonnull align 8 dereferenceable(148) %10)
  store ptr getelementptr inbounds ({ [5 x ptr], [5 x ptr] }, ptr @_ZTVNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE, i32 0, inrange i32 0, i32 3), ptr %9, align 8
  %11 = getelementptr inbounds i8, ptr %9, i64 184
  store ptr getelementptr inbounds ({ [5 x ptr], [5 x ptr] }, ptr @_ZTVNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE, i32 0, inrange i32 1, i32 3), ptr %11, align 8
  %12 = getelementptr inbounds %"class.std::__1::basic_ifstream.11", ptr %9, i32 0, i32 1
  invoke void @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEEC2B7v160006EPNS_15basic_streambufIcS2_EE(ptr noundef nonnull align 8 dereferenceable(16) %9, ptr noundef getelementptr inbounds ([4 x ptr], ptr @_ZTTNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE, i64 0, i64 1), ptr noundef %12)
          to label %13 unwind label %30

13:                                               ; preds = %3
  store ptr getelementptr inbounds ({ [5 x ptr], [5 x ptr] }, ptr @_ZTVNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE, i32 0, inrange i32 0, i32 3), ptr %9, align 8
  %14 = getelementptr inbounds i8, ptr %9, i64 184
  store ptr getelementptr inbounds ({ [5 x ptr], [5 x ptr] }, ptr @_ZTVNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE, i32 0, inrange i32 1, i32 3), ptr %14, align 8
  %15 = getelementptr inbounds %"class.std::__1::basic_ifstream.11", ptr %9, i32 0, i32 1
  invoke void @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEEC2Ev(ptr noundef nonnull align 8 dereferenceable(163) %15)
          to label %16 unwind label %34

16:                                               ; preds = %13
  %17 = getelementptr inbounds %"class.std::__1::basic_ifstream.11", ptr %9, i32 0, i32 1
  %18 = load ptr, ptr %5, align 8
  %19 = load i32, ptr %6, align 4
  %20 = or i32 %19, 8
  %21 = invoke noundef ptr @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE4openERKNS_12basic_stringIcS2_NS_9allocatorIcEEEEj(ptr noundef nonnull align 8 dereferenceable(163) %17, ptr noundef nonnull align 8 dereferenceable(24) %18, i32 noundef %20)
          to label %22 unwind label %38

22:                                               ; preds = %16
  %23 = icmp eq ptr %21, null
  br i1 %23, label %24, label %42

24:                                               ; preds = %22
  %25 = load ptr, ptr %9, align 8
  %26 = getelementptr i8, ptr %25, i64 -24
  %27 = load i64, ptr %26, align 8
  %28 = getelementptr inbounds i8, ptr %9, i64 %27
  invoke void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateB7v160006Ej(ptr noundef nonnull align 8 dereferenceable(148) %28, i32 noundef 4)
          to label %29 unwind label %38

29:                                               ; preds = %24
  br label %42

30:                                               ; preds = %3
  %31 = landingpad { ptr, i32 }
          cleanup
  %32 = extractvalue { ptr, i32 } %31, 0
  store ptr %32, ptr %7, align 8
  %33 = extractvalue { ptr, i32 } %31, 1
  store i32 %33, ptr %8, align 4
  br label %44

34:                                               ; preds = %13
  %35 = landingpad { ptr, i32 }
          cleanup
  %36 = extractvalue { ptr, i32 } %35, 0
  store ptr %36, ptr %7, align 8
  %37 = extractvalue { ptr, i32 } %35, 1
  store i32 %37, ptr %8, align 4
  br label %43

38:                                               ; preds = %24, %16
  %39 = landingpad { ptr, i32 }
          cleanup
  %40 = extractvalue { ptr, i32 } %39, 0
  store ptr %40, ptr %7, align 8
  %41 = extractvalue { ptr, i32 } %39, 1
  store i32 %41, ptr %8, align 4
  call void @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED2Ev(ptr noundef nonnull align 8 dereferenceable(163) %15) #17
  br label %43

42:                                               ; preds = %29, %22
  ret void

43:                                               ; preds = %38, %34
  call void @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEED2Ev(ptr noundef nonnull align 8 dereferenceable(16) %9, ptr noundef getelementptr inbounds ([4 x ptr], ptr @_ZTTNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE, i64 0, i64 1)) #17
  br label %44

44:                                               ; preds = %43, %30
  %45 = getelementptr inbounds i8, ptr %9, i64 184
  call void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev(ptr noundef nonnull align 8 dereferenceable(148) %45) #17
  br label %46

46:                                               ; preds = %44
  %47 = load ptr, ptr %7, align 8
  %48 = load i32, ptr %8, align 4
  %49 = insertvalue { ptr, i32 } poison, ptr %47, 0
  %50 = insertvalue { ptr, i32 } %49, i32 %48, 1
  resume { ptr, i32 } %50
}

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr hidden noundef zeroext i1 @_ZNKSt3__114basic_ifstreamIcNS_11char_traitsIcEEE7is_openEv(ptr noundef nonnull align 8 dereferenceable(184) %0) #0 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::basic_ifstream.11", ptr %3, i32 0, i32 1
  %5 = call noundef zeroext i1 @_ZNKSt3__113basic_filebufIcNS_11char_traitsIcEEE7is_openEv(ptr noundef nonnull align 8 dereferenceable(163) %4)
  ret i1 %5
}

declare i32 @__gxx_personality_v0(...)

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB7v160006INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef %1) #0 comdat {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = call noundef i64 @_ZNSt3__111char_traitsIcE6lengthEPKc(ptr noundef %7) #17
  %9 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__124__put_character_sequenceB7v160006IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m(ptr noundef nonnull align 8 dereferenceable(8) %5, ptr noundef %6, i64 noundef %8)
  ret ptr %9
}

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(16) ptr @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEE3getB7v160006ERc(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef nonnull align 1 dereferenceable(1) %1) #0 comdat align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = call noundef i32 @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEE3getEv(ptr noundef nonnull align 8 dereferenceable(16) %6)
  store i32 %7, ptr %5, align 4
  %8 = load i32, ptr %5, align 4
  %9 = call noundef i32 @_ZNSt3__111char_traitsIcE3eofEv() #17
  %10 = icmp ne i32 %8, %9
  br i1 %10, label %11, label %15

11:                                               ; preds = %2
  %12 = load i32, ptr %5, align 4
  %13 = call noundef signext i8 @_ZNSt3__111char_traitsIcE12to_char_typeEi(i32 noundef %12) #17
  %14 = load ptr, ptr %4, align 8
  store i8 %13, ptr %14, align 1
  br label %15

15:                                               ; preds = %11, %2
  ret ptr %6
}

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr hidden noundef zeroext i1 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEEcvbB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(148) %0) #0 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef zeroext i1 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE4failB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(148) %3)
  %5 = xor i1 %4, true
  ret i1 %5
}

declare noundef nonnull align 8 dereferenceable(16) ptr @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEE5ungetEv(ptr noundef nonnull align 8 dereferenceable(16)) #2

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB7v160006INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_c(ptr noundef nonnull align 8 dereferenceable(8) %0, i8 noundef signext %1) #0 comdat {
  %3 = alloca ptr, align 8
  %4 = alloca i8, align 1
  store ptr %0, ptr %3, align 8
  store i8 %1, ptr %4, align 1
  %5 = load ptr, ptr %3, align 8
  %6 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__124__put_character_sequenceB7v160006IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m(ptr noundef nonnull align 8 dereferenceable(8) %5, ptr noundef %4, i64 noundef 1)
  ret ptr %6
}

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi(ptr noundef nonnull align 8 dereferenceable(8), i32 noundef) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i64, i1 } @llvm.umul.with.overflow.i64(i64, i64) #3

; Function Attrs: nobuiltin allocsize(0)
declare noundef nonnull ptr @_Znam(i64 noundef) #4

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr hidden void @_ZNSt3__114basic_ifstreamIcNS_11char_traitsIcEEE5closeEv(ptr noundef nonnull align 8 dereferenceable(184) %0) #0 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::basic_ifstream.11", ptr %3, i32 0, i32 1
  %5 = call noundef ptr @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE5closeEv(ptr noundef nonnull align 8 dereferenceable(163) %4)
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %12

7:                                                ; preds = %1
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr i8, ptr %8, i64 -24
  %10 = load i64, ptr %9, align 8
  %11 = getelementptr inbounds i8, ptr %3, i64 %10
  call void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateB7v160006Ej(ptr noundef nonnull align 8 dereferenceable(148) %11, i32 noundef 4)
  br label %12

12:                                               ; preds = %7, %1
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define linkonce_odr dso_local void @_ZNSt3__114basic_ifstreamIcNS_11char_traitsIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(184) %0) unnamed_addr #5 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void @_ZNSt3__114basic_ifstreamIcNS_11char_traitsIcEEED2Ev(ptr noundef nonnull align 8 dereferenceable(184) %3, ptr noundef @_ZTTNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE) #17
  %4 = getelementptr inbounds i8, ptr %3, i64 184
  call void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev(ptr noundef nonnull align 8 dereferenceable(148) %4) #17
  ret void
}

; Function Attrs: mustprogress noinline sspstrong uwtable
define dso_local void @_Z9write_ppmNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPiii(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 personality ptr @__gxx_personality_v0 {
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %"class.std::__1::basic_ofstream.13", align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  store i32 %3, ptr %7, align 4
  %13 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB7v160006INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.13)
  call void @_ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEC1ERKNS_12basic_stringIcS2_NS_9allocatorIcEEEEj(ptr noundef nonnull align 8 dereferenceable(176) %8, ptr noundef nonnull align 8 dereferenceable(24) %0, i32 noundef 16)
  %14 = invoke noundef zeroext i1 @_ZNKSt3__114basic_ofstreamIcNS_11char_traitsIcEEE7is_openEv(ptr noundef nonnull align 8 dereferenceable(176) %8)
          to label %15 unwind label %19

15:                                               ; preds = %4
  br i1 %14, label %23, label %16

16:                                               ; preds = %15
  %17 = invoke i32 (ptr, ...) @printf(ptr noundef @.str.14)
          to label %18 unwind label %19

18:                                               ; preds = %16
  store i32 1, ptr %11, align 4
  br label %102

19:                                               ; preds = %100, %86, %76, %66, %57, %55, %53, %51, %49, %47, %45, %43, %41, %39, %37, %35, %33, %31, %29, %27, %25, %23, %16, %4
  %20 = landingpad { ptr, i32 }
          cleanup
  %21 = extractvalue { ptr, i32 } %20, 0
  store ptr %21, ptr %9, align 8
  %22 = extractvalue { ptr, i32 } %20, 1
  store i32 %22, ptr %10, align 4
  call void @_ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(176) %8) #17
  br label %103

23:                                               ; preds = %15
  %24 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(ptr noundef nonnull align 8 dereferenceable(8) %8, i8 noundef signext 80)
          to label %25 unwind label %19

25:                                               ; preds = %23
  %26 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(ptr noundef nonnull align 8 dereferenceable(8) %8, i8 noundef signext 54)
          to label %27 unwind label %19

27:                                               ; preds = %25
  %28 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(ptr noundef nonnull align 8 dereferenceable(8) %8, i8 noundef signext 13)
          to label %29 unwind label %19

29:                                               ; preds = %27
  %30 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(ptr noundef nonnull align 8 dereferenceable(8) %8, i8 noundef signext 10)
          to label %31 unwind label %19

31:                                               ; preds = %29
  %32 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(ptr noundef nonnull align 8 dereferenceable(8) %8, i8 noundef signext 50)
          to label %33 unwind label %19

33:                                               ; preds = %31
  %34 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(ptr noundef nonnull align 8 dereferenceable(8) %8, i8 noundef signext 53)
          to label %35 unwind label %19

35:                                               ; preds = %33
  %36 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(ptr noundef nonnull align 8 dereferenceable(8) %8, i8 noundef signext 54)
          to label %37 unwind label %19

37:                                               ; preds = %35
  %38 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(ptr noundef nonnull align 8 dereferenceable(8) %8, i8 noundef signext 32)
          to label %39 unwind label %19

39:                                               ; preds = %37
  %40 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(ptr noundef nonnull align 8 dereferenceable(8) %8, i8 noundef signext 50)
          to label %41 unwind label %19

41:                                               ; preds = %39
  %42 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(ptr noundef nonnull align 8 dereferenceable(8) %8, i8 noundef signext 53)
          to label %43 unwind label %19

43:                                               ; preds = %41
  %44 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(ptr noundef nonnull align 8 dereferenceable(8) %8, i8 noundef signext 54)
          to label %45 unwind label %19

45:                                               ; preds = %43
  %46 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(ptr noundef nonnull align 8 dereferenceable(8) %8, i8 noundef signext 13)
          to label %47 unwind label %19

47:                                               ; preds = %45
  %48 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(ptr noundef nonnull align 8 dereferenceable(8) %8, i8 noundef signext 10)
          to label %49 unwind label %19

49:                                               ; preds = %47
  %50 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(ptr noundef nonnull align 8 dereferenceable(8) %8, i8 noundef signext 50)
          to label %51 unwind label %19

51:                                               ; preds = %49
  %52 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(ptr noundef nonnull align 8 dereferenceable(8) %8, i8 noundef signext 53)
          to label %53 unwind label %19

53:                                               ; preds = %51
  %54 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(ptr noundef nonnull align 8 dereferenceable(8) %8, i8 noundef signext 53)
          to label %55 unwind label %19

55:                                               ; preds = %53
  %56 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(ptr noundef nonnull align 8 dereferenceable(8) %8, i8 noundef signext 13)
          to label %57 unwind label %19

57:                                               ; preds = %55
  %58 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(ptr noundef nonnull align 8 dereferenceable(8) %8, i8 noundef signext 10)
          to label %59 unwind label %19

59:                                               ; preds = %57
  store i32 0, ptr %12, align 4
  br label %60

60:                                               ; preds = %97, %59
  %61 = load i32, ptr %12, align 4
  %62 = load i32, ptr %7, align 4
  %63 = load i32, ptr %6, align 4
  %64 = mul nsw i32 %62, %63
  %65 = icmp slt i32 %61, %64
  br i1 %65, label %66, label %100

66:                                               ; preds = %60
  %67 = load ptr, ptr %5, align 8
  %68 = load i32, ptr %12, align 4
  %69 = mul nsw i32 3, %68
  %70 = add nsw i32 %69, 0
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i32, ptr %67, i64 %71
  %73 = load i32, ptr %72, align 4
  %74 = trunc i32 %73 to i8
  %75 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(ptr noundef nonnull align 8 dereferenceable(8) %8, i8 noundef signext %74)
          to label %76 unwind label %19

76:                                               ; preds = %66
  %77 = load ptr, ptr %5, align 8
  %78 = load i32, ptr %12, align 4
  %79 = mul nsw i32 3, %78
  %80 = add nsw i32 %79, 1
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i32, ptr %77, i64 %81
  %83 = load i32, ptr %82, align 4
  %84 = trunc i32 %83 to i8
  %85 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(ptr noundef nonnull align 8 dereferenceable(8) %8, i8 noundef signext %84)
          to label %86 unwind label %19

86:                                               ; preds = %76
  %87 = load ptr, ptr %5, align 8
  %88 = load i32, ptr %12, align 4
  %89 = mul nsw i32 3, %88
  %90 = add nsw i32 %89, 2
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i32, ptr %87, i64 %91
  %93 = load i32, ptr %92, align 4
  %94 = trunc i32 %93 to i8
  %95 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(ptr noundef nonnull align 8 dereferenceable(8) %8, i8 noundef signext %94)
          to label %96 unwind label %19

96:                                               ; preds = %86
  br label %97

97:                                               ; preds = %96
  %98 = load i32, ptr %12, align 4
  %99 = add nsw i32 %98, 1
  store i32 %99, ptr %12, align 4
  br label %60, !llvm.loop !15

100:                                              ; preds = %60
  invoke void @_ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEE5closeEv(ptr noundef nonnull align 8 dereferenceable(176) %8)
          to label %101 unwind label %19

101:                                              ; preds = %100
  store i32 1, ptr %11, align 4
  br label %102

102:                                              ; preds = %101, %18
  call void @_ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(176) %8) #17
  ret void

103:                                              ; preds = %19
  %104 = load ptr, ptr %9, align 8
  %105 = load i32, ptr %10, align 4
  %106 = insertvalue { ptr, i32 } poison, ptr %104, 0
  %107 = insertvalue { ptr, i32 } %106, i32 %105, 1
  resume { ptr, i32 } %107
}

; Function Attrs: noinline sspstrong uwtable
define linkonce_odr hidden void @_ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEC1ERKNS_12basic_stringIcS2_NS_9allocatorIcEEEEj(ptr noundef nonnull align 8 dereferenceable(176) %0, ptr noundef nonnull align 8 dereferenceable(24) %1, i32 noundef %2) unnamed_addr #1 comdat align 2 personality ptr @__gxx_personality_v0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %9 = load ptr, ptr %4, align 8
  %10 = getelementptr inbounds i8, ptr %9, i64 176
  call void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEEC2B7v160006Ev(ptr noundef nonnull align 8 dereferenceable(148) %10)
  store ptr getelementptr inbounds ({ [5 x ptr], [5 x ptr] }, ptr @_ZTVNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE, i32 0, inrange i32 0, i32 3), ptr %9, align 8
  %11 = getelementptr inbounds i8, ptr %9, i64 176
  store ptr getelementptr inbounds ({ [5 x ptr], [5 x ptr] }, ptr @_ZTVNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE, i32 0, inrange i32 1, i32 3), ptr %11, align 8
  %12 = getelementptr inbounds %"class.std::__1::basic_ofstream.13", ptr %9, i32 0, i32 1
  invoke void @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEEC2B7v160006EPNS_15basic_streambufIcS2_EE(ptr noundef nonnull align 8 dereferenceable(8) %9, ptr noundef getelementptr inbounds ([4 x ptr], ptr @_ZTTNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE, i64 0, i64 1), ptr noundef %12)
          to label %13 unwind label %30

13:                                               ; preds = %3
  store ptr getelementptr inbounds ({ [5 x ptr], [5 x ptr] }, ptr @_ZTVNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE, i32 0, inrange i32 0, i32 3), ptr %9, align 8
  %14 = getelementptr inbounds i8, ptr %9, i64 176
  store ptr getelementptr inbounds ({ [5 x ptr], [5 x ptr] }, ptr @_ZTVNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE, i32 0, inrange i32 1, i32 3), ptr %14, align 8
  %15 = getelementptr inbounds %"class.std::__1::basic_ofstream.13", ptr %9, i32 0, i32 1
  invoke void @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEEC2Ev(ptr noundef nonnull align 8 dereferenceable(163) %15)
          to label %16 unwind label %34

16:                                               ; preds = %13
  %17 = getelementptr inbounds %"class.std::__1::basic_ofstream.13", ptr %9, i32 0, i32 1
  %18 = load ptr, ptr %5, align 8
  %19 = load i32, ptr %6, align 4
  %20 = or i32 %19, 16
  %21 = invoke noundef ptr @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE4openERKNS_12basic_stringIcS2_NS_9allocatorIcEEEEj(ptr noundef nonnull align 8 dereferenceable(163) %17, ptr noundef nonnull align 8 dereferenceable(24) %18, i32 noundef %20)
          to label %22 unwind label %38

22:                                               ; preds = %16
  %23 = icmp eq ptr %21, null
  br i1 %23, label %24, label %42

24:                                               ; preds = %22
  %25 = load ptr, ptr %9, align 8
  %26 = getelementptr i8, ptr %25, i64 -24
  %27 = load i64, ptr %26, align 8
  %28 = getelementptr inbounds i8, ptr %9, i64 %27
  invoke void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateB7v160006Ej(ptr noundef nonnull align 8 dereferenceable(148) %28, i32 noundef 4)
          to label %29 unwind label %38

29:                                               ; preds = %24
  br label %42

30:                                               ; preds = %3
  %31 = landingpad { ptr, i32 }
          cleanup
  %32 = extractvalue { ptr, i32 } %31, 0
  store ptr %32, ptr %7, align 8
  %33 = extractvalue { ptr, i32 } %31, 1
  store i32 %33, ptr %8, align 4
  br label %44

34:                                               ; preds = %13
  %35 = landingpad { ptr, i32 }
          cleanup
  %36 = extractvalue { ptr, i32 } %35, 0
  store ptr %36, ptr %7, align 8
  %37 = extractvalue { ptr, i32 } %35, 1
  store i32 %37, ptr %8, align 4
  br label %43

38:                                               ; preds = %24, %16
  %39 = landingpad { ptr, i32 }
          cleanup
  %40 = extractvalue { ptr, i32 } %39, 0
  store ptr %40, ptr %7, align 8
  %41 = extractvalue { ptr, i32 } %39, 1
  store i32 %41, ptr %8, align 4
  call void @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED2Ev(ptr noundef nonnull align 8 dereferenceable(163) %15) #17
  br label %43

42:                                               ; preds = %29, %22
  ret void

43:                                               ; preds = %38, %34
  call void @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev(ptr noundef nonnull align 8 dereferenceable(8) %9, ptr noundef getelementptr inbounds ([4 x ptr], ptr @_ZTTNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE, i64 0, i64 1)) #17
  br label %44

44:                                               ; preds = %43, %30
  %45 = getelementptr inbounds i8, ptr %9, i64 176
  call void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev(ptr noundef nonnull align 8 dereferenceable(148) %45) #17
  br label %46

46:                                               ; preds = %44
  %47 = load ptr, ptr %7, align 8
  %48 = load i32, ptr %8, align 4
  %49 = insertvalue { ptr, i32 } poison, ptr %47, 0
  %50 = insertvalue { ptr, i32 } %49, i32 %48, 1
  resume { ptr, i32 } %50
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef zeroext i1 @_ZNKSt3__114basic_ofstreamIcNS_11char_traitsIcEEE7is_openEv(ptr noundef nonnull align 8 dereferenceable(176) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::basic_ofstream.13", ptr %3, i32 0, i32 1
  %5 = call noundef zeroext i1 @_ZNKSt3__113basic_filebufIcNS_11char_traitsIcEEE7is_openEv(ptr noundef nonnull align 8 dereferenceable(163) %4)
  ret i1 %5
}

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(ptr noundef nonnull align 8 dereferenceable(8), i8 noundef signext) #2

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr hidden void @_ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEE5closeEv(ptr noundef nonnull align 8 dereferenceable(176) %0) #0 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::basic_ofstream.13", ptr %3, i32 0, i32 1
  %5 = call noundef ptr @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE5closeEv(ptr noundef nonnull align 8 dereferenceable(163) %4)
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %12

7:                                                ; preds = %1
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr i8, ptr %8, i64 -24
  %10 = load i64, ptr %9, align 8
  %11 = getelementptr inbounds i8, ptr %3, i64 %10
  call void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateB7v160006Ej(ptr noundef nonnull align 8 dereferenceable(148) %11, i32 noundef 4)
  br label %12

12:                                               ; preds = %7, %1
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define linkonce_odr dso_local void @_ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(176) %0) unnamed_addr #5 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void @_ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED2Ev(ptr noundef nonnull align 8 dereferenceable(176) %3, ptr noundef @_ZTTNSt3__114basic_ofstreamIcNS_11char_traitsIcEEEE) #17
  %4 = getelementptr inbounds i8, ptr %3, i64 176
  call void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev(ptr noundef nonnull align 8 dereferenceable(148) %4) #17
  ret void
}

; Function Attrs: noinline norecurse sspstrong uwtable
define dso_local void @_Z59__device_stub__rgb_increase_brightness_pass_ready_coalescedPiS_if(ptr noundef %0, ptr noundef %1, i32 noundef %2, float noundef %3) #7 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca float, align 4
  %9 = alloca %struct.dim3.14, align 8
  %10 = alloca %struct.dim3.14, align 8
  %11 = alloca i64, align 8
  %12 = alloca ptr, align 8
  %13 = alloca { i64, i32 }, align 8
  %14 = alloca { i64, i32 }, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store float %3, ptr %8, align 4
  %15 = alloca ptr, i64 4, align 16
  %16 = getelementptr ptr, ptr %15, i32 0
  store ptr %5, ptr %16, align 8
  %17 = getelementptr ptr, ptr %15, i32 1
  store ptr %6, ptr %17, align 8
  %18 = getelementptr ptr, ptr %15, i32 2
  store ptr %7, ptr %18, align 8
  %19 = getelementptr ptr, ptr %15, i32 3
  store ptr %8, ptr %19, align 8
  %20 = call i32 @__cudaPopCallConfiguration(ptr %9, ptr %10, ptr %11, ptr %12)
  %21 = load i64, ptr %11, align 8
  %22 = load ptr, ptr %12, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %13, ptr align 8 %9, i64 12, i1 false)
  %23 = getelementptr inbounds { i64, i32 }, ptr %13, i32 0, i32 0
  %24 = load i64, ptr %23, align 8
  %25 = getelementptr inbounds { i64, i32 }, ptr %13, i32 0, i32 1
  %26 = load i32, ptr %25, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %14, ptr align 8 %10, i64 12, i1 false)
  %27 = getelementptr inbounds { i64, i32 }, ptr %14, i32 0, i32 0
  %28 = load i64, ptr %27, align 8
  %29 = getelementptr inbounds { i64, i32 }, ptr %14, i32 0, i32 1
  %30 = load i32, ptr %29, align 8
  %31 = call noundef i32 @cudaLaunchKernel(ptr noundef @_Z59__device_stub__rgb_increase_brightness_pass_ready_coalescedPiS_if, i64 %24, i32 %26, i64 %28, i32 %30, ptr noundef %15, i64 noundef %21, ptr noundef %22)
  br label %32

32:                                               ; preds = %4
  ret void
}

declare i32 @__cudaPopCallConfiguration(ptr, ptr, ptr, ptr)

declare i32 @cudaLaunchKernel(ptr, i64, i32, i64, i32, ptr, i64, ptr)

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #8

; Function Attrs: mustprogress noinline sspstrong uwtable
define dso_local void @_Z45test_increase_brightness_pass_ready_coalescedv() #0 personality ptr @__gxx_personality_v0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca %"class.std::__1::basic_string.21", align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i64, align 8
  %8 = alloca i32, align 4
  %9 = alloca %struct.dim3.14, align 4
  %10 = alloca %struct.dim3.14, align 4
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  %13 = alloca i64, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca %struct.dim3.14, align 4
  %17 = alloca %struct.dim3.14, align 4
  %18 = alloca { i64, i32 }, align 4
  %19 = alloca { i64, i32 }, align 4
  %20 = alloca %"class.std::__1::basic_string.21", align 8
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B7v160006IDnEEPKc(ptr noundef nonnull align 8 dereferenceable(24) %4, ptr noundef @.str.15)
  %21 = invoke noundef ptr @_Z8read_ppmNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERiS6_(ptr noundef %4, ptr noundef nonnull align 4 dereferenceable(4) %1, ptr noundef nonnull align 4 dereferenceable(4) %2)
          to label %22 unwind label %74

22:                                               ; preds = %0
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #17
  store ptr %21, ptr %3, align 8
  %23 = load i32, ptr %1, align 4
  %24 = load i32, ptr %2, align 4
  %25 = mul nsw i32 %23, %24
  %26 = sext i32 %25 to i64
  store i64 %26, ptr %7, align 8
  %27 = load i64, ptr %7, align 8
  %28 = add nsw i64 %27, 512
  %29 = sub nsw i64 %28, 1
  %30 = sdiv i64 %29, 512
  %31 = trunc i64 %30 to i32
  store i32 %31, ptr %8, align 4
  %32 = load i32, ptr %8, align 4
  call void @_ZN4dim3C2Ejjj(ptr noundef nonnull align 4 dereferenceable(12) %9, i32 noundef %32, i32 noundef 1, i32 noundef 1)
  call void @_ZN4dim3C2Ejjj(ptr noundef nonnull align 4 dereferenceable(12) %10, i32 noundef 512, i32 noundef 1, i32 noundef 1)
  %33 = load i32, ptr %1, align 4
  %34 = load i32, ptr %2, align 4
  %35 = mul nsw i32 %33, %34
  store i32 %35, ptr %11, align 4
  %36 = load i32, ptr %11, align 4
  %37 = mul nsw i32 3, %36
  %38 = zext i32 %37 to i64
  %39 = call ptr @llvm.stacksave()
  store ptr %39, ptr %12, align 8
  %40 = alloca i32, i64 %38, align 16
  store i64 %38, ptr %13, align 8
  %41 = load i32, ptr %11, align 4
  %42 = mul nsw i32 3, %41
  %43 = sext i32 %42 to i64
  %44 = mul i64 %43, 4
  %45 = call noundef i32 @_ZL10cudaMallocIiE9cudaErrorPPT_m(ptr noundef %14, i64 noundef %44)
  %46 = load i32, ptr %11, align 4
  %47 = mul nsw i32 3, %46
  %48 = sext i32 %47 to i64
  %49 = mul i64 %48, 4
  %50 = call noundef i32 @_ZL10cudaMallocIiE9cudaErrorPPT_m(ptr noundef %15, i64 noundef %49)
  %51 = load ptr, ptr %14, align 8
  %52 = load ptr, ptr %3, align 8
  %53 = load i32, ptr %11, align 4
  %54 = mul nsw i32 3, %53
  %55 = sext i32 %54 to i64
  %56 = mul i64 %55, 4
  %57 = call i32 @cudaMemcpy(ptr noundef %51, ptr noundef %52, i64 noundef %56, i32 noundef 1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %16, ptr align 4 %9, i64 12, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %17, ptr align 4 %10, i64 12, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %18, ptr align 4 %16, i64 12, i1 false)
  %58 = getelementptr inbounds { i64, i32 }, ptr %18, i32 0, i32 0
  %59 = load i64, ptr %58, align 4
  %60 = getelementptr inbounds { i64, i32 }, ptr %18, i32 0, i32 1
  %61 = load i32, ptr %60, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %19, ptr align 4 %17, i64 12, i1 false)
  %62 = getelementptr inbounds { i64, i32 }, ptr %19, i32 0, i32 0
  %63 = load i64, ptr %62, align 4
  %64 = getelementptr inbounds { i64, i32 }, ptr %19, i32 0, i32 1
  %65 = load i32, ptr %64, align 4
  %66 = call i32 @__cudaPushCallConfiguration(i64 %59, i32 %61, i64 %63, i32 %65, i64 noundef 0, ptr noundef null)
  %67 = icmp ne i32 %66, 0
  br i1 %67, label %78, label %68

68:                                               ; preds = %22
  %69 = load ptr, ptr %15, align 8
  %70 = load ptr, ptr %14, align 8
  %71 = load i32, ptr %1, align 4
  %72 = load i32, ptr %2, align 4
  %73 = mul nsw i32 %71, %72
  call void @_Z59__device_stub__rgb_increase_brightness_pass_ready_coalescedPiS_if(ptr noundef %69, ptr noundef %70, i32 noundef %73, float noundef 0x3FFCCCCCC0000000)
  br label %78

74:                                               ; preds = %0
  %75 = landingpad { ptr, i32 }
          cleanup
  %76 = extractvalue { ptr, i32 } %75, 0
  store ptr %76, ptr %5, align 8
  %77 = extractvalue { ptr, i32 } %75, 1
  store i32 %77, ptr %6, align 4
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #17
  br label %103

78:                                               ; preds = %68, %22
  %79 = call i32 @cudaDeviceSynchronize()
  %80 = load ptr, ptr %15, align 8
  %81 = load i32, ptr %11, align 4
  %82 = mul nsw i32 3, %81
  %83 = sext i32 %82 to i64
  %84 = mul i64 %83, 4
  %85 = call i32 @cudaMemcpy(ptr noundef %40, ptr noundef %80, i64 noundef %84, i32 noundef 2)
  %86 = call i32 @cudaDeviceSynchronize()
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B7v160006IDnEEPKc(ptr noundef nonnull align 8 dereferenceable(24) %20, ptr noundef @.str.16)
  %87 = load i32, ptr %1, align 4
  %88 = load i32, ptr %2, align 4
  invoke void @_Z9write_ppmNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPiii(ptr noundef %20, ptr noundef %40, i32 noundef %87, i32 noundef %88)
          to label %89 unwind label %99

89:                                               ; preds = %78
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %20) #17
  %90 = load ptr, ptr %3, align 8
  %91 = icmp eq ptr %90, null
  br i1 %91, label %93, label %92

92:                                               ; preds = %89
  call void @_ZdaPv(ptr noundef %90) #19
  br label %93

93:                                               ; preds = %92, %89
  %94 = load ptr, ptr %14, align 8
  %95 = call i32 @cudaFree(ptr noundef %94)
  %96 = load ptr, ptr %15, align 8
  %97 = call i32 @cudaFree(ptr noundef %96)
  %98 = load ptr, ptr %12, align 8
  call void @llvm.stackrestore(ptr %98)
  ret void

99:                                               ; preds = %78
  %100 = landingpad { ptr, i32 }
          cleanup
  %101 = extractvalue { ptr, i32 } %100, 0
  store ptr %101, ptr %5, align 8
  %102 = extractvalue { ptr, i32 } %100, 1
  store i32 %102, ptr %6, align 4
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %20) #17
  br label %103

103:                                              ; preds = %99, %74
  %104 = load ptr, ptr %5, align 8
  %105 = load i32, ptr %6, align 4
  %106 = insertvalue { ptr, i32 } poison, ptr %104, 0
  %107 = insertvalue { ptr, i32 } %106, i32 %105, 1
  resume { ptr, i32 } %107
}

; Function Attrs: noinline sspstrong uwtable
define linkonce_odr dso_local void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B7v160006IDnEEPKc(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1) unnamed_addr #1 comdat align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %"struct.std::__1::__default_init_tag.22", align 1
  %6 = alloca %"struct.std::__1::__default_init_tag.22", align 1
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds %"class.std::__1::basic_string.21", ptr %7, i32 0, i32 0
  call void @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC2B7v160006INS_18__default_init_tagESA_EEOT_OT0_(ptr noundef nonnull align 8 dereferenceable(24) %8, ptr noundef nonnull align 1 dereferenceable(1) %5, ptr noundef nonnull align 1 dereferenceable(1) %6)
  %9 = load ptr, ptr %4, align 8
  %10 = icmp ne ptr %9, null
  call void @llvm.assume(i1 %10)
  %11 = load ptr, ptr %4, align 8
  %12 = load ptr, ptr %4, align 8
  %13 = call noundef i64 @_ZNSt3__111char_traitsIcE6lengthEPKc(ptr noundef %12) #17
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEPKcm(ptr noundef nonnull align 8 dereferenceable(24) %7, ptr noundef %11, i64 noundef %13)
  call void @_ZNSt3__119__debug_db_insert_cB7v160006INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEvPT_(ptr noundef %7)
  ret void
}

; Function Attrs: nounwind
declare void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24)) unnamed_addr #9

; Function Attrs: noinline nounwind sspstrong uwtable
define linkonce_odr dso_local void @_ZN4dim3C2Ejjj(ptr noundef nonnull align 4 dereferenceable(12) %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) unnamed_addr #5 comdat align 2 {
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds %struct.dim3.14, ptr %9, i32 0, i32 0
  %11 = load i32, ptr %6, align 4
  store i32 %11, ptr %10, align 4
  %12 = getelementptr inbounds %struct.dim3.14, ptr %9, i32 0, i32 1
  %13 = load i32, ptr %7, align 4
  store i32 %13, ptr %12, align 4
  %14 = getelementptr inbounds %struct.dim3.14, ptr %9, i32 0, i32 2
  %15 = load i32, ptr %8, align 4
  store i32 %15, ptr %14, align 4
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare ptr @llvm.stacksave() #10

; Function Attrs: mustprogress noinline sspstrong uwtable
define internal noundef i32 @_ZL10cudaMallocIiE9cudaErrorPPT_m(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load i64, ptr %4, align 8
  %7 = call i32 @cudaMalloc(ptr noundef %5, i64 noundef %6)
  ret i32 %7
}

declare i32 @cudaMemcpy(ptr noundef, ptr noundef, i64 noundef, i32 noundef) #2

declare i32 @__cudaPushCallConfiguration(i64, i32, i64, i32, i64 noundef, ptr noundef) #2

declare i32 @cudaDeviceSynchronize() #2

; Function Attrs: nobuiltin nounwind
declare void @_ZdaPv(ptr noundef) #11

declare i32 @cudaFree(ptr noundef) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.stackrestore(ptr) #10

; Function Attrs: mustprogress noinline norecurse sspstrong uwtable
define dso_local noundef i32 @main() #12 {
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @_Z45test_increase_brightness_pass_ready_coalescedv()
  ret i32 0
}

; Function Attrs: noinline nounwind sspstrong uwtable
define linkonce_odr dso_local void @_ZNSt3__114basic_ifstreamIcNS_11char_traitsIcEEED2Ev(ptr noundef nonnull align 8 dereferenceable(184) %0, ptr noundef %1) unnamed_addr #5 comdat align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %5, align 8
  %8 = getelementptr inbounds ptr, ptr %6, i64 3
  %9 = load ptr, ptr %8, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = getelementptr i8, ptr %10, i64 -24
  %12 = load i64, ptr %11, align 8
  %13 = getelementptr inbounds i8, ptr %5, i64 %12
  store ptr %9, ptr %13, align 8
  %14 = getelementptr inbounds %"class.std::__1::basic_ifstream.11", ptr %5, i32 0, i32 1
  call void @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED2Ev(ptr noundef nonnull align 8 dereferenceable(163) %14) #17
  %15 = getelementptr inbounds ptr, ptr %6, i64 1
  call void @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEED2Ev(ptr noundef nonnull align 8 dereferenceable(16) %5, ptr noundef %15) #17
  ret void
}

; Function Attrs: nounwind
declare void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev(ptr noundef nonnull align 8 dereferenceable(148)) unnamed_addr #9

; Function Attrs: noinline nounwind sspstrong uwtable
define linkonce_odr dso_local void @_ZTv0_n24_NSt3__114basic_ifstreamIcNS_11char_traitsIcEEED1Ev(ptr noundef %0) unnamed_addr #5 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds i8, ptr %4, i64 -24
  %6 = load i64, ptr %5, align 8
  %7 = getelementptr inbounds i8, ptr %3, i64 %6
  tail call void @_ZNSt3__114basic_ifstreamIcNS_11char_traitsIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(184) %7) #17
  ret void
}

; Function Attrs: nounwind
declare void @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(16)) unnamed_addr #9

; Function Attrs: nounwind
declare void @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEED0Ev(ptr noundef nonnull align 8 dereferenceable(16)) unnamed_addr #9

; Function Attrs: nounwind
declare void @_ZTv0_n24_NSt3__113basic_istreamIcNS_11char_traitsIcEEED1Ev(ptr noundef) unnamed_addr #9

; Function Attrs: nounwind
declare void @_ZTv0_n24_NSt3__113basic_istreamIcNS_11char_traitsIcEEED0Ev(ptr noundef) unnamed_addr #9

; Function Attrs: noinline nounwind sspstrong uwtable
define linkonce_odr dso_local void @_ZNSt3__114basic_ifstreamIcNS_11char_traitsIcEEED0Ev(ptr noundef nonnull align 8 dereferenceable(184) %0) unnamed_addr #5 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void @_ZNSt3__114basic_ifstreamIcNS_11char_traitsIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(184) %3) #17
  call void @_ZdlPv(ptr noundef %3) #19
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define linkonce_odr dso_local void @_ZTv0_n24_NSt3__114basic_ifstreamIcNS_11char_traitsIcEEED0Ev(ptr noundef %0) unnamed_addr #5 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds i8, ptr %4, i64 -24
  %6 = load i64, ptr %5, align 8
  %7 = getelementptr inbounds i8, ptr %3, i64 %6
  tail call void @_ZNSt3__114basic_ifstreamIcNS_11char_traitsIcEEED0Ev(ptr noundef nonnull align 8 dereferenceable(184) %7) #17
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define linkonce_odr dso_local void @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED2Ev(ptr noundef nonnull align 8 dereferenceable(163) %0) unnamed_addr #5 comdat align 2 personality ptr @__gxx_personality_v0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  store ptr getelementptr inbounds ({ [16 x ptr] }, ptr @_ZTVNSt3__113basic_filebufIcNS_11char_traitsIcEEEE, i32 0, inrange i32 0, i32 2), ptr %5, align 8
  %6 = invoke noundef ptr @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE5closeEv(ptr noundef nonnull align 8 dereferenceable(163) %5)
          to label %7 unwind label %8

7:                                                ; preds = %1
  br label %16

8:                                                ; preds = %1
  %9 = landingpad { ptr, i32 }
          catch ptr null
  %10 = extractvalue { ptr, i32 } %9, 0
  store ptr %10, ptr %3, align 8
  %11 = extractvalue { ptr, i32 } %9, 1
  store i32 %11, ptr %4, align 4
  br label %12

12:                                               ; preds = %8
  %13 = load ptr, ptr %3, align 8
  %14 = call ptr @__cxa_begin_catch(ptr %13) #17
  invoke void @__cxa_end_catch()
          to label %15 unwind label %37

15:                                               ; preds = %12
  br label %16

16:                                               ; preds = %15, %7
  %17 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %5, i32 0, i32 14
  %18 = load i8, ptr %17, align 8
  %19 = trunc i8 %18 to i1
  br i1 %19, label %20, label %26

20:                                               ; preds = %16
  %21 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %5, i32 0, i32 1
  %22 = load ptr, ptr %21, align 8
  %23 = icmp eq ptr %22, null
  br i1 %23, label %25, label %24

24:                                               ; preds = %20
  call void @_ZdaPv(ptr noundef %22) #19
  br label %25

25:                                               ; preds = %24, %20
  br label %26

26:                                               ; preds = %25, %16
  %27 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %5, i32 0, i32 15
  %28 = load i8, ptr %27, align 1
  %29 = trunc i8 %28 to i1
  br i1 %29, label %30, label %36

30:                                               ; preds = %26
  %31 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %5, i32 0, i32 6
  %32 = load ptr, ptr %31, align 8
  %33 = icmp eq ptr %32, null
  br i1 %33, label %35, label %34

34:                                               ; preds = %30
  call void @_ZdaPv(ptr noundef %32) #19
  br label %35

35:                                               ; preds = %34, %30
  br label %36

36:                                               ; preds = %35, %26
  call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev(ptr noundef nonnull align 8 dereferenceable(64) %5) #17
  ret void

37:                                               ; preds = %12
  %38 = landingpad { ptr, i32 }
          catch ptr null
  %39 = extractvalue { ptr, i32 } %38, 0
  call void @__clang_call_terminate(ptr %39) #20
  unreachable
}

; Function Attrs: nounwind
declare void @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEED2Ev(ptr noundef nonnull align 8 dereferenceable(16), ptr noundef) unnamed_addr #9

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr dso_local noundef ptr @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE5closeEv(ptr noundef nonnull align 8 dereferenceable(163) %0) #0 comdat align 2 personality ptr @__gxx_personality_v0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca %"class.std::__1::unique_ptr.26", align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %8 = load ptr, ptr %2, align 8
  store ptr null, ptr %3, align 8
  %9 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %8, i32 0, i32 8
  %10 = load ptr, ptr %9, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %12, label %39

12:                                               ; preds = %1
  store ptr %8, ptr %3, align 8
  %13 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %8, i32 0, i32 8
  %14 = load ptr, ptr %13, align 8
  store ptr @fclose, ptr %5, align 8
  call void @_ZNSt3__110unique_ptrI8_IO_FILEPFiPS1_EEC2B7v160006ILb1EvEES2_NS_16__dependent_typeINS_27__unique_ptr_deleter_sfinaeIS4_EEXT_EE20__good_rval_ref_typeE(ptr noundef nonnull align 8 dereferenceable(16) %4, ptr noundef %14, ptr noundef nonnull align 8 dereferenceable(8) %5) #17
  %15 = load ptr, ptr %8, align 8
  %16 = getelementptr inbounds ptr, ptr %15, i64 6
  %17 = load ptr, ptr %16, align 8
  %18 = invoke noundef i32 %17(ptr noundef nonnull align 8 dereferenceable(163) %8)
          to label %19 unwind label %22

19:                                               ; preds = %12
  %20 = icmp ne i32 %18, 0
  br i1 %20, label %21, label %26

21:                                               ; preds = %19
  store ptr null, ptr %3, align 8
  br label %26

22:                                               ; preds = %32, %26, %12
  %23 = landingpad { ptr, i32 }
          cleanup
  %24 = extractvalue { ptr, i32 } %23, 0
  store ptr %24, ptr %6, align 8
  %25 = extractvalue { ptr, i32 } %23, 1
  store i32 %25, ptr %7, align 4
  call void @_ZNSt3__110unique_ptrI8_IO_FILEPFiPS1_EED2B7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %4) #17
  br label %41

26:                                               ; preds = %21, %19
  %27 = call noundef ptr @_ZNSt3__110unique_ptrI8_IO_FILEPFiPS1_EE7releaseB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %4) #17
  %28 = invoke i32 @fclose(ptr noundef %27)
          to label %29 unwind label %22

29:                                               ; preds = %26
  %30 = icmp ne i32 %28, 0
  br i1 %30, label %31, label %32

31:                                               ; preds = %29
  store ptr null, ptr %3, align 8
  br label %32

32:                                               ; preds = %31, %29
  %33 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %8, i32 0, i32 8
  store ptr null, ptr %33, align 8
  %34 = load ptr, ptr %8, align 8
  %35 = getelementptr inbounds ptr, ptr %34, i64 3
  %36 = load ptr, ptr %35, align 8
  %37 = invoke noundef ptr %36(ptr noundef nonnull align 8 dereferenceable(163) %8, ptr noundef null, i64 noundef 0)
          to label %38 unwind label %22

38:                                               ; preds = %32
  call void @_ZNSt3__110unique_ptrI8_IO_FILEPFiPS1_EED2B7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %4) #17
  br label %39

39:                                               ; preds = %38, %1
  %40 = load ptr, ptr %3, align 8
  ret ptr %40

41:                                               ; preds = %22
  %42 = load ptr, ptr %6, align 8
  %43 = load i32, ptr %7, align 4
  %44 = insertvalue { ptr, i32 } poison, ptr %42, 0
  %45 = insertvalue { ptr, i32 } %44, i32 %43, 1
  resume { ptr, i32 } %45
}

declare ptr @__cxa_begin_catch(ptr)

declare void @__cxa_end_catch()

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(ptr noundef %0) #13 comdat {
  %2 = call ptr @__cxa_begin_catch(ptr %0) #17
  call void @_ZSt9terminatev() #20
  unreachable
}

declare void @_ZSt9terminatev()

; Function Attrs: nounwind
declare void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev(ptr noundef nonnull align 8 dereferenceable(64)) unnamed_addr #9

; Function Attrs: noinline nounwind sspstrong uwtable
define linkonce_odr dso_local void @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED0Ev(ptr noundef nonnull align 8 dereferenceable(163) %0) unnamed_addr #5 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED2Ev(ptr noundef nonnull align 8 dereferenceable(163) %3) #17
  call void @_ZdlPv(ptr noundef %3) #19
  ret void
}

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr dso_local void @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE5imbueERKNS_6localeE(ptr noundef nonnull align 8 dereferenceable(163) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) unnamed_addr #0 comdat align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i8, align 1
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = load ptr, ptr %6, align 8
  %8 = getelementptr inbounds ptr, ptr %7, i64 6
  %9 = load ptr, ptr %8, align 8
  %10 = call noundef i32 %9(ptr noundef nonnull align 8 dereferenceable(163) %6)
  %11 = load ptr, ptr %4, align 8
  %12 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZNSt3__19use_facetB7v160006INS_7codecvtIcc11__mbstate_tEEEERKT_RKNS_6localeE(ptr noundef nonnull align 8 dereferenceable(8) %11)
  %13 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %6, i32 0, i32 9
  store ptr %12, ptr %13, align 8
  %14 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %6, i32 0, i32 16
  %15 = load i8, ptr %14, align 2
  %16 = trunc i8 %15 to i1
  %17 = zext i1 %16 to i8
  store i8 %17, ptr %5, align 1
  %18 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %6, i32 0, i32 9
  %19 = load ptr, ptr %18, align 8
  %20 = call noundef zeroext i1 @_ZNKSt3__17codecvtIcc11__mbstate_tE13always_noconvB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %19) #17
  %21 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %6, i32 0, i32 16
  %22 = zext i1 %20 to i8
  store i8 %22, ptr %21, align 2
  %23 = load i8, ptr %5, align 1
  %24 = trunc i8 %23 to i1
  %25 = zext i1 %24 to i32
  %26 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %6, i32 0, i32 16
  %27 = load i8, ptr %26, align 2
  %28 = trunc i8 %27 to i1
  %29 = zext i1 %28 to i32
  %30 = icmp ne i32 %25, %29
  br i1 %30, label %31, label %94

31:                                               ; preds = %2
  call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setgB7v160006EPcS4_S4_(ptr noundef nonnull align 8 dereferenceable(64) %6, ptr noundef null, ptr noundef null, ptr noundef null)
  call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setpB7v160006EPcS4_(ptr noundef nonnull align 8 dereferenceable(64) %6, ptr noundef null, ptr noundef null)
  %32 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %6, i32 0, i32 16
  %33 = load i8, ptr %32, align 2
  %34 = trunc i8 %33 to i1
  br i1 %34, label %35, label %60

35:                                               ; preds = %31
  %36 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %6, i32 0, i32 14
  %37 = load i8, ptr %36, align 8
  %38 = trunc i8 %37 to i1
  br i1 %38, label %39, label %45

39:                                               ; preds = %35
  %40 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %6, i32 0, i32 1
  %41 = load ptr, ptr %40, align 8
  %42 = icmp eq ptr %41, null
  br i1 %42, label %44, label %43

43:                                               ; preds = %39
  call void @_ZdaPv(ptr noundef %41) #19
  br label %44

44:                                               ; preds = %43, %39
  br label %45

45:                                               ; preds = %44, %35
  %46 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %6, i32 0, i32 15
  %47 = load i8, ptr %46, align 1
  %48 = trunc i8 %47 to i1
  %49 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %6, i32 0, i32 14
  %50 = zext i1 %48 to i8
  store i8 %50, ptr %49, align 8
  %51 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %6, i32 0, i32 7
  %52 = load i64, ptr %51, align 8
  %53 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %6, i32 0, i32 5
  store i64 %52, ptr %53, align 8
  %54 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %6, i32 0, i32 6
  %55 = load ptr, ptr %54, align 8
  %56 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %6, i32 0, i32 1
  store ptr %55, ptr %56, align 8
  %57 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %6, i32 0, i32 7
  store i64 0, ptr %57, align 8
  %58 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %6, i32 0, i32 6
  store ptr null, ptr %58, align 8
  %59 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %6, i32 0, i32 15
  store i8 0, ptr %59, align 1
  br label %93

60:                                               ; preds = %31
  %61 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %6, i32 0, i32 14
  %62 = load i8, ptr %61, align 8
  %63 = trunc i8 %62 to i1
  br i1 %63, label %83, label %64

64:                                               ; preds = %60
  %65 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %6, i32 0, i32 1
  %66 = load ptr, ptr %65, align 8
  %67 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %6, i32 0, i32 4
  %68 = getelementptr inbounds [8 x i8], ptr %67, i64 0, i64 0
  %69 = icmp ne ptr %66, %68
  br i1 %69, label %70, label %83

70:                                               ; preds = %64
  %71 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %6, i32 0, i32 5
  %72 = load i64, ptr %71, align 8
  %73 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %6, i32 0, i32 7
  store i64 %72, ptr %73, align 8
  %74 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %6, i32 0, i32 1
  %75 = load ptr, ptr %74, align 8
  %76 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %6, i32 0, i32 6
  store ptr %75, ptr %76, align 8
  %77 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %6, i32 0, i32 15
  store i8 0, ptr %77, align 1
  %78 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %6, i32 0, i32 5
  %79 = load i64, ptr %78, align 8
  %80 = call noalias noundef nonnull ptr @_Znam(i64 noundef %79) #18
  %81 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %6, i32 0, i32 1
  store ptr %80, ptr %81, align 8
  %82 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %6, i32 0, i32 14
  store i8 1, ptr %82, align 8
  br label %92

83:                                               ; preds = %64, %60
  %84 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %6, i32 0, i32 5
  %85 = load i64, ptr %84, align 8
  %86 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %6, i32 0, i32 7
  store i64 %85, ptr %86, align 8
  %87 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %6, i32 0, i32 7
  %88 = load i64, ptr %87, align 8
  %89 = call noalias noundef nonnull ptr @_Znam(i64 noundef %88) #18
  %90 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %6, i32 0, i32 6
  store ptr %89, ptr %90, align 8
  %91 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %6, i32 0, i32 15
  store i8 1, ptr %91, align 1
  br label %92

92:                                               ; preds = %83, %70
  br label %93

93:                                               ; preds = %92, %45
  br label %94

94:                                               ; preds = %93, %2
  ret void
}

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr dso_local noundef ptr @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE6setbufEPcl(ptr noundef nonnull align 8 dereferenceable(163) %0, ptr noundef %1, i64 noundef %2) unnamed_addr #0 comdat align 2 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %8 = load ptr, ptr %4, align 8
  call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setgB7v160006EPcS4_S4_(ptr noundef nonnull align 8 dereferenceable(64) %8, ptr noundef null, ptr noundef null, ptr noundef null)
  call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setpB7v160006EPcS4_(ptr noundef nonnull align 8 dereferenceable(64) %8, ptr noundef null, ptr noundef null)
  %9 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %8, i32 0, i32 14
  %10 = load i8, ptr %9, align 8
  %11 = trunc i8 %10 to i1
  br i1 %11, label %12, label %18

12:                                               ; preds = %3
  %13 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %8, i32 0, i32 1
  %14 = load ptr, ptr %13, align 8
  %15 = icmp eq ptr %14, null
  br i1 %15, label %17, label %16

16:                                               ; preds = %12
  call void @_ZdaPv(ptr noundef %14) #19
  br label %17

17:                                               ; preds = %16, %12
  br label %18

18:                                               ; preds = %17, %3
  %19 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %8, i32 0, i32 15
  %20 = load i8, ptr %19, align 1
  %21 = trunc i8 %20 to i1
  br i1 %21, label %22, label %28

22:                                               ; preds = %18
  %23 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %8, i32 0, i32 6
  %24 = load ptr, ptr %23, align 8
  %25 = icmp eq ptr %24, null
  br i1 %25, label %27, label %26

26:                                               ; preds = %22
  call void @_ZdaPv(ptr noundef %24) #19
  br label %27

27:                                               ; preds = %26, %22
  br label %28

28:                                               ; preds = %27, %18
  %29 = load i64, ptr %6, align 8
  %30 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %8, i32 0, i32 5
  store i64 %29, ptr %30, align 8
  %31 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %8, i32 0, i32 5
  %32 = load i64, ptr %31, align 8
  %33 = icmp ugt i64 %32, 8
  br i1 %33, label %34, label %52

34:                                               ; preds = %28
  %35 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %8, i32 0, i32 16
  %36 = load i8, ptr %35, align 2
  %37 = trunc i8 %36 to i1
  br i1 %37, label %38, label %45

38:                                               ; preds = %34
  %39 = load ptr, ptr %5, align 8
  %40 = icmp ne ptr %39, null
  br i1 %40, label %41, label %45

41:                                               ; preds = %38
  %42 = load ptr, ptr %5, align 8
  %43 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %8, i32 0, i32 1
  store ptr %42, ptr %43, align 8
  %44 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %8, i32 0, i32 14
  store i8 0, ptr %44, align 8
  br label %51

45:                                               ; preds = %38, %34
  %46 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %8, i32 0, i32 5
  %47 = load i64, ptr %46, align 8
  %48 = call noalias noundef nonnull ptr @_Znam(i64 noundef %47) #18
  %49 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %8, i32 0, i32 1
  store ptr %48, ptr %49, align 8
  %50 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %8, i32 0, i32 14
  store i8 1, ptr %50, align 8
  br label %51

51:                                               ; preds = %45, %41
  br label %58

52:                                               ; preds = %28
  %53 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %8, i32 0, i32 4
  %54 = getelementptr inbounds [8 x i8], ptr %53, i64 0, i64 0
  %55 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %8, i32 0, i32 1
  store ptr %54, ptr %55, align 8
  %56 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %8, i32 0, i32 5
  store i64 8, ptr %56, align 8
  %57 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %8, i32 0, i32 14
  store i8 0, ptr %57, align 8
  br label %58

58:                                               ; preds = %52, %51
  %59 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %8, i32 0, i32 16
  %60 = load i8, ptr %59, align 2
  %61 = trunc i8 %60 to i1
  br i1 %61, label %83, label %62

62:                                               ; preds = %58
  store i64 8, ptr %7, align 8
  %63 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__13maxIlEEUa9enable_ifILb1EERKT_S3_S3_(ptr noundef nonnull align 8 dereferenceable(8) %6, ptr noundef nonnull align 8 dereferenceable(8) %7)
  %64 = load i64, ptr %63, align 8
  %65 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %8, i32 0, i32 7
  store i64 %64, ptr %65, align 8
  %66 = load ptr, ptr %5, align 8
  %67 = icmp ne ptr %66, null
  br i1 %67, label %68, label %76

68:                                               ; preds = %62
  %69 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %8, i32 0, i32 7
  %70 = load i64, ptr %69, align 8
  %71 = icmp uge i64 %70, 8
  br i1 %71, label %72, label %76

72:                                               ; preds = %68
  %73 = load ptr, ptr %5, align 8
  %74 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %8, i32 0, i32 6
  store ptr %73, ptr %74, align 8
  %75 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %8, i32 0, i32 15
  store i8 0, ptr %75, align 1
  br label %82

76:                                               ; preds = %68, %62
  %77 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %8, i32 0, i32 7
  %78 = load i64, ptr %77, align 8
  %79 = call noalias noundef nonnull ptr @_Znam(i64 noundef %78) #18
  %80 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %8, i32 0, i32 6
  store ptr %79, ptr %80, align 8
  %81 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %8, i32 0, i32 15
  store i8 1, ptr %81, align 1
  br label %82

82:                                               ; preds = %76, %72
  br label %87

83:                                               ; preds = %58
  %84 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %8, i32 0, i32 7
  store i64 0, ptr %84, align 8
  %85 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %8, i32 0, i32 6
  store ptr null, ptr %85, align 8
  %86 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %8, i32 0, i32 15
  store i8 0, ptr %86, align 1
  br label %87

87:                                               ; preds = %83, %82
  ret ptr %8
}

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr dso_local { i64, i64 } @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE7seekoffExNS_8ios_base7seekdirEj(ptr noundef nonnull align 8 dereferenceable(163) %0, i64 noundef %1, i32 noundef %2, i32 noundef %3) unnamed_addr #0 comdat align 2 {
  %5 = alloca %"class.std::__1::fpos.27", align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca %struct.__mbstate_t.9, align 4
  store ptr %0, ptr %6, align 8
  store i64 %1, ptr %7, align 8
  store i32 %2, ptr %8, align 4
  store i32 %3, ptr %9, align 4
  %13 = load ptr, ptr %6, align 8
  %14 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %13, i32 0, i32 9
  %15 = load ptr, ptr %14, align 8
  %16 = icmp ne ptr %15, null
  br i1 %16, label %18, label %17

17:                                               ; preds = %4
  call void @_ZNSt3__116__throw_bad_castB7v160006Ev() #21
  unreachable

18:                                               ; preds = %4
  %19 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %13, i32 0, i32 9
  %20 = load ptr, ptr %19, align 8
  %21 = call noundef i32 @_ZNKSt3__17codecvtIcc11__mbstate_tE8encodingB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %20) #17
  store i32 %21, ptr %10, align 4
  %22 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %13, i32 0, i32 8
  %23 = load ptr, ptr %22, align 8
  %24 = icmp eq ptr %23, null
  br i1 %24, label %37, label %25

25:                                               ; preds = %18
  %26 = load i32, ptr %10, align 4
  %27 = icmp sle i32 %26, 0
  br i1 %27, label %28, label %31

28:                                               ; preds = %25
  %29 = load i64, ptr %7, align 8
  %30 = icmp ne i64 %29, 0
  br i1 %30, label %37, label %31

31:                                               ; preds = %28, %25
  %32 = load ptr, ptr %13, align 8
  %33 = getelementptr inbounds ptr, ptr %32, i64 6
  %34 = load ptr, ptr %33, align 8
  %35 = call noundef i32 %34(ptr noundef nonnull align 8 dereferenceable(163) %13)
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %38

37:                                               ; preds = %31, %28, %18
  call void @_ZNSt3__14fposI11__mbstate_tEC2B7v160006Ex(ptr noundef nonnull align 8 dereferenceable(16) %5, i64 noundef -1)
  br label %67

38:                                               ; preds = %31
  %39 = load i32, ptr %8, align 4
  switch i32 %39, label %43 [
    i32 0, label %40
    i32 1, label %41
    i32 2, label %42
  ]

40:                                               ; preds = %38
  store i32 0, ptr %11, align 4
  br label %44

41:                                               ; preds = %38
  store i32 1, ptr %11, align 4
  br label %44

42:                                               ; preds = %38
  store i32 2, ptr %11, align 4
  br label %44

43:                                               ; preds = %38
  call void @_ZNSt3__14fposI11__mbstate_tEC2B7v160006Ex(ptr noundef nonnull align 8 dereferenceable(16) %5, i64 noundef -1)
  br label %67

44:                                               ; preds = %42, %41, %40
  %45 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %13, i32 0, i32 8
  %46 = load ptr, ptr %45, align 8
  %47 = load i32, ptr %10, align 4
  %48 = icmp sgt i32 %47, 0
  br i1 %48, label %49, label %54

49:                                               ; preds = %44
  %50 = load i32, ptr %10, align 4
  %51 = sext i32 %50 to i64
  %52 = load i64, ptr %7, align 8
  %53 = mul nsw i64 %51, %52
  br label %55

54:                                               ; preds = %44
  br label %55

55:                                               ; preds = %54, %49
  %56 = phi i64 [ %53, %49 ], [ 0, %54 ]
  %57 = load i32, ptr %11, align 4
  %58 = call i32 @fseeko(ptr noundef %46, i64 noundef %56, i32 noundef %57)
  %59 = icmp ne i32 %58, 0
  br i1 %59, label %60, label %61

60:                                               ; preds = %55
  call void @_ZNSt3__14fposI11__mbstate_tEC2B7v160006Ex(ptr noundef nonnull align 8 dereferenceable(16) %5, i64 noundef -1)
  br label %67

61:                                               ; preds = %55
  %62 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %13, i32 0, i32 8
  %63 = load ptr, ptr %62, align 8
  %64 = call i64 @ftello(ptr noundef %63)
  call void @_ZNSt3__14fposI11__mbstate_tEC2B7v160006Ex(ptr noundef nonnull align 8 dereferenceable(16) %5, i64 noundef %64)
  %65 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %13, i32 0, i32 10
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %12, ptr align 8 %65, i64 8, i1 false)
  %66 = load i64, ptr %12, align 4
  call void @_ZNSt3__14fposI11__mbstate_tE5stateB7v160006ES1_(ptr noundef nonnull align 8 dereferenceable(16) %5, i64 %66)
  br label %67

67:                                               ; preds = %61, %60, %43, %37
  %68 = load { i64, i64 }, ptr %5, align 8
  ret { i64, i64 } %68
}

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr dso_local { i64, i64 } @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE7seekposENS_4fposI11__mbstate_tEEj(ptr noundef nonnull align 8 dereferenceable(163) %0, i64 %1, i64 %2, i32 noundef %3) unnamed_addr #0 comdat align 2 {
  %5 = alloca %"class.std::__1::fpos.27", align 8
  %6 = alloca %"class.std::__1::fpos.27", align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca %struct.__mbstate_t.9, align 4
  %10 = getelementptr inbounds { i64, i64 }, ptr %6, i32 0, i32 0
  store i64 %1, ptr %10, align 8
  %11 = getelementptr inbounds { i64, i64 }, ptr %6, i32 0, i32 1
  store i64 %2, ptr %11, align 8
  store ptr %0, ptr %7, align 8
  store i32 %3, ptr %8, align 4
  %12 = load ptr, ptr %7, align 8
  %13 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %12, i32 0, i32 8
  %14 = load ptr, ptr %13, align 8
  %15 = icmp eq ptr %14, null
  br i1 %15, label %22, label %16

16:                                               ; preds = %4
  %17 = load ptr, ptr %12, align 8
  %18 = getelementptr inbounds ptr, ptr %17, i64 6
  %19 = load ptr, ptr %18, align 8
  %20 = call noundef i32 %19(ptr noundef nonnull align 8 dereferenceable(163) %12)
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %23

22:                                               ; preds = %16, %4
  call void @_ZNSt3__14fposI11__mbstate_tEC2B7v160006Ex(ptr noundef nonnull align 8 dereferenceable(16) %5, i64 noundef -1)
  br label %33

23:                                               ; preds = %16
  %24 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %12, i32 0, i32 8
  %25 = load ptr, ptr %24, align 8
  %26 = call noundef i64 @_ZNKSt3__14fposI11__mbstate_tEcvxB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %6)
  %27 = call i32 @fseeko(ptr noundef %25, i64 noundef %26, i32 noundef 0)
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %30

29:                                               ; preds = %23
  call void @_ZNSt3__14fposI11__mbstate_tEC2B7v160006Ex(ptr noundef nonnull align 8 dereferenceable(16) %5, i64 noundef -1)
  br label %33

30:                                               ; preds = %23
  %31 = call i64 @_ZNKSt3__14fposI11__mbstate_tE5stateB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %6)
  store i64 %31, ptr %9, align 4
  %32 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %12, i32 0, i32 10
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %32, ptr align 4 %9, i64 8, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %5, ptr align 8 %6, i64 16, i1 false)
  br label %33

33:                                               ; preds = %30, %29, %22
  %34 = load { i64, i64 }, ptr %5, align 8
  ret { i64, i64 } %34
}

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr dso_local noundef i32 @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE4syncEv(ptr noundef nonnull align 8 dereferenceable(163) %0) unnamed_addr #0 comdat align 2 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca %struct.__mbstate_t.9, align 4
  %9 = alloca i8, align 1
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %12, i32 0, i32 8
  %14 = load ptr, ptr %13, align 8
  %15 = icmp eq ptr %14, null
  br i1 %15, label %16, label %17

16:                                               ; preds = %1
  store i32 0, ptr %2, align 4
  br label %176

17:                                               ; preds = %1
  %18 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %12, i32 0, i32 9
  %19 = load ptr, ptr %18, align 8
  %20 = icmp ne ptr %19, null
  br i1 %20, label %22, label %21

21:                                               ; preds = %17
  call void @_ZNSt3__116__throw_bad_castB7v160006Ev() #21
  unreachable

22:                                               ; preds = %17
  %23 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %12, i32 0, i32 13
  %24 = load i32, ptr %23, align 4
  %25 = and i32 %24, 16
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %84

27:                                               ; preds = %22
  %28 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4pptrB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %12)
  %29 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5pbaseB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %12)
  %30 = icmp ne ptr %28, %29
  br i1 %30, label %31, label %41

31:                                               ; preds = %27
  %32 = call noundef i32 @_ZNSt3__111char_traitsIcE3eofEv() #17
  %33 = load ptr, ptr %12, align 8
  %34 = getelementptr inbounds ptr, ptr %33, i64 13
  %35 = load ptr, ptr %34, align 8
  %36 = call noundef i32 %35(ptr noundef nonnull align 8 dereferenceable(163) %12, i32 noundef %32)
  %37 = call noundef i32 @_ZNSt3__111char_traitsIcE3eofEv() #17
  %38 = icmp eq i32 %36, %37
  br i1 %38, label %39, label %40

39:                                               ; preds = %31
  store i32 -1, ptr %2, align 4
  br label %176

40:                                               ; preds = %31
  br label %41

41:                                               ; preds = %40, %27
  br label %42

42:                                               ; preds = %70, %41
  %43 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %12, i32 0, i32 9
  %44 = load ptr, ptr %43, align 8
  %45 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %12, i32 0, i32 10
  %46 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %12, i32 0, i32 1
  %47 = load ptr, ptr %46, align 8
  %48 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %12, i32 0, i32 1
  %49 = load ptr, ptr %48, align 8
  %50 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %12, i32 0, i32 5
  %51 = load i64, ptr %50, align 8
  %52 = getelementptr inbounds i8, ptr %49, i64 %51
  %53 = call noundef i32 @_ZNKSt3__17codecvtIcc11__mbstate_tE7unshiftB7v160006ERS1_PcS4_RS4_(ptr noundef nonnull align 8 dereferenceable(16) %44, ptr noundef nonnull align 4 dereferenceable(8) %45, ptr noundef %47, ptr noundef %52, ptr noundef nonnull align 8 dereferenceable(8) %5)
  store i32 %53, ptr %4, align 4
  %54 = load ptr, ptr %5, align 8
  %55 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %12, i32 0, i32 1
  %56 = load ptr, ptr %55, align 8
  %57 = ptrtoint ptr %54 to i64
  %58 = ptrtoint ptr %56 to i64
  %59 = sub i64 %57, %58
  store i64 %59, ptr %6, align 8
  %60 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %12, i32 0, i32 1
  %61 = load ptr, ptr %60, align 8
  %62 = load i64, ptr %6, align 8
  %63 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %12, i32 0, i32 8
  %64 = load ptr, ptr %63, align 8
  %65 = call i64 @fwrite(ptr noundef %61, i64 noundef 1, i64 noundef %62, ptr noundef %64)
  %66 = load i64, ptr %6, align 8
  %67 = icmp ne i64 %65, %66
  br i1 %67, label %68, label %69

68:                                               ; preds = %42
  store i32 -1, ptr %2, align 4
  br label %176

69:                                               ; preds = %42
  br label %70

70:                                               ; preds = %69
  %71 = load i32, ptr %4, align 4
  %72 = icmp eq i32 %71, 1
  br i1 %72, label %42, label %73, !llvm.loop !16

73:                                               ; preds = %70
  %74 = load i32, ptr %4, align 4
  %75 = icmp eq i32 %74, 2
  br i1 %75, label %76, label %77

76:                                               ; preds = %73
  store i32 -1, ptr %2, align 4
  br label %176

77:                                               ; preds = %73
  %78 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %12, i32 0, i32 8
  %79 = load ptr, ptr %78, align 8
  %80 = call i32 @fflush(ptr noundef %79)
  %81 = icmp ne i32 %80, 0
  br i1 %81, label %82, label %83

82:                                               ; preds = %77
  store i32 -1, ptr %2, align 4
  br label %176

83:                                               ; preds = %77
  br label %175

84:                                               ; preds = %22
  %85 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %12, i32 0, i32 13
  %86 = load i32, ptr %85, align 4
  %87 = and i32 %86, 8
  %88 = icmp ne i32 %87, 0
  br i1 %88, label %89, label %174

89:                                               ; preds = %84
  %90 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %12, i32 0, i32 11
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %8, ptr align 8 %90, i64 8, i1 false)
  store i8 0, ptr %9, align 1
  %91 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %12, i32 0, i32 16
  %92 = load i8, ptr %91, align 2
  %93 = trunc i8 %92 to i1
  br i1 %93, label %94, label %100

94:                                               ; preds = %89
  %95 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5egptrB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %12)
  %96 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4gptrB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %12)
  %97 = ptrtoint ptr %95 to i64
  %98 = ptrtoint ptr %96 to i64
  %99 = sub i64 %97, %98
  store i64 %99, ptr %7, align 8
  br label %155

100:                                              ; preds = %89
  %101 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %12, i32 0, i32 9
  %102 = load ptr, ptr %101, align 8
  %103 = call noundef i32 @_ZNKSt3__17codecvtIcc11__mbstate_tE8encodingB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %102) #17
  store i32 %103, ptr %10, align 4
  %104 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %12, i32 0, i32 3
  %105 = load ptr, ptr %104, align 8
  %106 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %12, i32 0, i32 2
  %107 = load ptr, ptr %106, align 8
  %108 = ptrtoint ptr %105 to i64
  %109 = ptrtoint ptr %107 to i64
  %110 = sub i64 %108, %109
  store i64 %110, ptr %7, align 8
  %111 = load i32, ptr %10, align 4
  %112 = icmp sgt i32 %111, 0
  br i1 %112, label %113, label %124

113:                                              ; preds = %100
  %114 = load i32, ptr %10, align 4
  %115 = sext i32 %114 to i64
  %116 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5egptrB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %12)
  %117 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4gptrB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %12)
  %118 = ptrtoint ptr %116 to i64
  %119 = ptrtoint ptr %117 to i64
  %120 = sub i64 %118, %119
  %121 = mul nsw i64 %115, %120
  %122 = load i64, ptr %7, align 8
  %123 = add nsw i64 %122, %121
  store i64 %123, ptr %7, align 8
  br label %154

124:                                              ; preds = %100
  %125 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4gptrB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %12)
  %126 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5egptrB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %12)
  %127 = icmp ne ptr %125, %126
  br i1 %127, label %128, label %153

128:                                              ; preds = %124
  %129 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %12, i32 0, i32 9
  %130 = load ptr, ptr %129, align 8
  %131 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %12, i32 0, i32 1
  %132 = load ptr, ptr %131, align 8
  %133 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %12, i32 0, i32 2
  %134 = load ptr, ptr %133, align 8
  %135 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4gptrB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %12)
  %136 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5ebackB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %12)
  %137 = ptrtoint ptr %135 to i64
  %138 = ptrtoint ptr %136 to i64
  %139 = sub i64 %137, %138
  %140 = call noundef i32 @_ZNKSt3__17codecvtIcc11__mbstate_tE6lengthB7v160006ERS1_PKcS5_m(ptr noundef nonnull align 8 dereferenceable(16) %130, ptr noundef nonnull align 4 dereferenceable(8) %8, ptr noundef %132, ptr noundef %134, i64 noundef %139)
  store i32 %140, ptr %11, align 4
  %141 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %12, i32 0, i32 2
  %142 = load ptr, ptr %141, align 8
  %143 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %12, i32 0, i32 1
  %144 = load ptr, ptr %143, align 8
  %145 = ptrtoint ptr %142 to i64
  %146 = ptrtoint ptr %144 to i64
  %147 = sub i64 %145, %146
  %148 = load i32, ptr %11, align 4
  %149 = sext i32 %148 to i64
  %150 = sub nsw i64 %147, %149
  %151 = load i64, ptr %7, align 8
  %152 = add nsw i64 %151, %150
  store i64 %152, ptr %7, align 8
  store i8 1, ptr %9, align 1
  br label %153

153:                                              ; preds = %128, %124
  br label %154

154:                                              ; preds = %153, %113
  br label %155

155:                                              ; preds = %154, %94
  %156 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %12, i32 0, i32 8
  %157 = load ptr, ptr %156, align 8
  %158 = load i64, ptr %7, align 8
  %159 = sub nsw i64 0, %158
  %160 = call i32 @fseeko(ptr noundef %157, i64 noundef %159, i32 noundef 1)
  %161 = icmp ne i32 %160, 0
  br i1 %161, label %162, label %163

162:                                              ; preds = %155
  store i32 -1, ptr %2, align 4
  br label %176

163:                                              ; preds = %155
  %164 = load i8, ptr %9, align 1
  %165 = trunc i8 %164 to i1
  br i1 %165, label %166, label %168

166:                                              ; preds = %163
  %167 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %12, i32 0, i32 10
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %167, ptr align 4 %8, i64 8, i1 false)
  br label %168

168:                                              ; preds = %166, %163
  %169 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %12, i32 0, i32 1
  %170 = load ptr, ptr %169, align 8
  %171 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %12, i32 0, i32 3
  store ptr %170, ptr %171, align 8
  %172 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %12, i32 0, i32 2
  store ptr %170, ptr %172, align 8
  call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setgB7v160006EPcS4_S4_(ptr noundef nonnull align 8 dereferenceable(64) %12, ptr noundef null, ptr noundef null, ptr noundef null)
  %173 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %12, i32 0, i32 13
  store i32 0, ptr %173, align 4
  br label %174

174:                                              ; preds = %168, %84
  br label %175

175:                                              ; preds = %174, %83
  store i32 0, ptr %2, align 4
  br label %176

176:                                              ; preds = %175, %162, %82, %76, %68, %39, %16
  %177 = load i32, ptr %2, align 4
  ret i32 %177
}

declare noundef i64 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE9showmanycEv(ptr noundef nonnull align 8 dereferenceable(64)) unnamed_addr #2

declare noundef i64 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE6xsgetnEPcl(ptr noundef nonnull align 8 dereferenceable(64), ptr noundef, i64 noundef) unnamed_addr #2

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr dso_local noundef i32 @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE9underflowEv(ptr noundef nonnull align 8 dereferenceable(163) %0) unnamed_addr #0 comdat align 2 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i8, align 1
  %5 = alloca i8, align 1
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i32, align 4
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i32, align 4
  %15 = alloca i64, align 8
  %16 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 8
  %19 = load ptr, ptr %18, align 8
  %20 = icmp eq ptr %19, null
  br i1 %20, label %21, label %23

21:                                               ; preds = %1
  %22 = call noundef i32 @_ZNSt3__111char_traitsIcE3eofEv() #17
  store i32 %22, ptr %2, align 4
  br label %234

23:                                               ; preds = %1
  %24 = call noundef zeroext i1 @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE11__read_modeEv(ptr noundef nonnull align 8 dereferenceable(163) %17)
  %25 = zext i1 %24 to i8
  store i8 %25, ptr %4, align 1
  %26 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4gptrB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %17)
  %27 = icmp eq ptr %26, null
  br i1 %27, label %28, label %31

28:                                               ; preds = %23
  %29 = getelementptr inbounds i8, ptr %5, i64 1
  %30 = getelementptr inbounds i8, ptr %5, i64 1
  call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setgB7v160006EPcS4_S4_(ptr noundef nonnull align 8 dereferenceable(64) %17, ptr noundef %5, ptr noundef %29, ptr noundef %30)
  br label %31

31:                                               ; preds = %28, %23
  %32 = load i8, ptr %4, align 1
  %33 = trunc i8 %32 to i1
  br i1 %33, label %34, label %35

34:                                               ; preds = %31
  br label %44

35:                                               ; preds = %31
  %36 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5egptrB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %17)
  %37 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5ebackB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %17)
  %38 = ptrtoint ptr %36 to i64
  %39 = ptrtoint ptr %37 to i64
  %40 = sub i64 %38, %39
  %41 = sdiv i64 %40, 2
  store i64 %41, ptr %7, align 8
  store i64 4, ptr %8, align 8
  %42 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__13minImEEUa9enable_ifILb1EERKT_S3_S3_(ptr noundef nonnull align 8 dereferenceable(8) %7, ptr noundef nonnull align 8 dereferenceable(8) %8)
  %43 = load i64, ptr %42, align 8
  br label %44

44:                                               ; preds = %35, %34
  %45 = phi i64 [ 0, %34 ], [ %43, %35 ]
  store i64 %45, ptr %6, align 8
  %46 = call noundef i32 @_ZNSt3__111char_traitsIcE3eofEv() #17
  store i32 %46, ptr %9, align 4
  %47 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4gptrB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %17)
  %48 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5egptrB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %17)
  %49 = icmp eq ptr %47, %48
  br i1 %49, label %50, label %224

50:                                               ; preds = %44
  %51 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5ebackB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %17)
  %52 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5egptrB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %17)
  %53 = load i64, ptr %6, align 8
  %54 = sub i64 0, %53
  %55 = getelementptr inbounds i8, ptr %52, i64 %54
  %56 = load i64, ptr %6, align 8
  %57 = mul i64 %56, 1
  call void @llvm.memmove.p0.p0.i64(ptr align 1 %51, ptr align 1 %55, i64 %57, i1 false)
  %58 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 16
  %59 = load i8, ptr %58, align 2
  %60 = trunc i8 %59 to i1
  br i1 %60, label %61, label %92

61:                                               ; preds = %50
  %62 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5egptrB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %17)
  %63 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5ebackB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %17)
  %64 = ptrtoint ptr %62 to i64
  %65 = ptrtoint ptr %63 to i64
  %66 = sub i64 %64, %65
  %67 = load i64, ptr %6, align 8
  %68 = sub i64 %66, %67
  store i64 %68, ptr %10, align 8
  %69 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5ebackB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %17)
  %70 = load i64, ptr %6, align 8
  %71 = getelementptr inbounds i8, ptr %69, i64 %70
  %72 = load i64, ptr %10, align 8
  %73 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 8
  %74 = load ptr, ptr %73, align 8
  %75 = call i64 @fread(ptr noundef %71, i64 noundef 1, i64 noundef %72, ptr noundef %74)
  store i64 %75, ptr %10, align 8
  %76 = load i64, ptr %10, align 8
  %77 = icmp ne i64 %76, 0
  br i1 %77, label %78, label %91

78:                                               ; preds = %61
  %79 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5ebackB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %17)
  %80 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5ebackB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %17)
  %81 = load i64, ptr %6, align 8
  %82 = getelementptr inbounds i8, ptr %80, i64 %81
  %83 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5ebackB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %17)
  %84 = load i64, ptr %6, align 8
  %85 = getelementptr inbounds i8, ptr %83, i64 %84
  %86 = load i64, ptr %10, align 8
  %87 = getelementptr inbounds i8, ptr %85, i64 %86
  call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setgB7v160006EPcS4_S4_(ptr noundef nonnull align 8 dereferenceable(64) %17, ptr noundef %79, ptr noundef %82, ptr noundef %87)
  %88 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4gptrB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %17)
  %89 = load i8, ptr %88, align 1
  %90 = call noundef i32 @_ZNSt3__111char_traitsIcE11to_int_typeEc(i8 noundef signext %89) #17
  store i32 %90, ptr %9, align 4
  br label %91

91:                                               ; preds = %78, %61
  br label %223

92:                                               ; preds = %50
  %93 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 3
  %94 = load ptr, ptr %93, align 8
  %95 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 2
  %96 = load ptr, ptr %95, align 8
  %97 = icmp ne ptr %94, %96
  br i1 %97, label %98, label %116

98:                                               ; preds = %92
  %99 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 2
  %100 = load ptr, ptr %99, align 8
  %101 = icmp ne ptr %100, null
  call void @llvm.assume(i1 %101)
  %102 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 1
  %103 = load ptr, ptr %102, align 8
  %104 = icmp ne ptr %103, null
  call void @llvm.assume(i1 %104)
  %105 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 1
  %106 = load ptr, ptr %105, align 8
  %107 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 2
  %108 = load ptr, ptr %107, align 8
  %109 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 3
  %110 = load ptr, ptr %109, align 8
  %111 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 2
  %112 = load ptr, ptr %111, align 8
  %113 = ptrtoint ptr %110 to i64
  %114 = ptrtoint ptr %112 to i64
  %115 = sub i64 %113, %114
  call void @llvm.memmove.p0.p0.i64(ptr align 1 %106, ptr align 1 %108, i64 %115, i1 false)
  br label %116

116:                                              ; preds = %98, %92
  %117 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 1
  %118 = load ptr, ptr %117, align 8
  %119 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 3
  %120 = load ptr, ptr %119, align 8
  %121 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 2
  %122 = load ptr, ptr %121, align 8
  %123 = ptrtoint ptr %120 to i64
  %124 = ptrtoint ptr %122 to i64
  %125 = sub i64 %123, %124
  %126 = getelementptr inbounds i8, ptr %118, i64 %125
  %127 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 2
  store ptr %126, ptr %127, align 8
  %128 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 1
  %129 = load ptr, ptr %128, align 8
  %130 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 1
  %131 = load ptr, ptr %130, align 8
  %132 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 4
  %133 = getelementptr inbounds [8 x i8], ptr %132, i64 0, i64 0
  %134 = icmp eq ptr %131, %133
  br i1 %134, label %135, label %136

135:                                              ; preds = %116
  br label %139

136:                                              ; preds = %116
  %137 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 5
  %138 = load i64, ptr %137, align 8
  br label %139

139:                                              ; preds = %136, %135
  %140 = phi i64 [ 8, %135 ], [ %138, %136 ]
  %141 = getelementptr inbounds i8, ptr %129, i64 %140
  %142 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 3
  store ptr %141, ptr %142, align 8
  %143 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 7
  %144 = load i64, ptr %143, align 8
  %145 = load i64, ptr %6, align 8
  %146 = sub i64 %144, %145
  store i64 %146, ptr %12, align 8
  %147 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 3
  %148 = load ptr, ptr %147, align 8
  %149 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 2
  %150 = load ptr, ptr %149, align 8
  %151 = ptrtoint ptr %148 to i64
  %152 = ptrtoint ptr %150 to i64
  %153 = sub i64 %151, %152
  store i64 %153, ptr %13, align 8
  %154 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__13minImEEUa9enable_ifILb1EERKT_S3_S3_(ptr noundef nonnull align 8 dereferenceable(8) %12, ptr noundef nonnull align 8 dereferenceable(8) %13)
  %155 = load i64, ptr %154, align 8
  store i64 %155, ptr %11, align 8
  %156 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 10
  %157 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 11
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %157, ptr align 8 %156, i64 8, i1 false)
  %158 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 2
  %159 = load ptr, ptr %158, align 8
  %160 = load i64, ptr %11, align 8
  %161 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 8
  %162 = load ptr, ptr %161, align 8
  %163 = call i64 @fread(ptr noundef %159, i64 noundef 1, i64 noundef %160, ptr noundef %162)
  store i64 %163, ptr %15, align 8
  %164 = load i64, ptr %15, align 8
  %165 = icmp ne i64 %164, 0
  br i1 %165, label %166, label %222

166:                                              ; preds = %139
  %167 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 9
  %168 = load ptr, ptr %167, align 8
  %169 = icmp ne ptr %168, null
  br i1 %169, label %171, label %170

170:                                              ; preds = %166
  call void @_ZNSt3__116__throw_bad_castB7v160006Ev() #21
  unreachable

171:                                              ; preds = %166
  %172 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 2
  %173 = load ptr, ptr %172, align 8
  %174 = load i64, ptr %15, align 8
  %175 = getelementptr inbounds i8, ptr %173, i64 %174
  %176 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 3
  store ptr %175, ptr %176, align 8
  %177 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 9
  %178 = load ptr, ptr %177, align 8
  %179 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 10
  %180 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 1
  %181 = load ptr, ptr %180, align 8
  %182 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 3
  %183 = load ptr, ptr %182, align 8
  %184 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 2
  %185 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5ebackB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %17)
  %186 = load i64, ptr %6, align 8
  %187 = getelementptr inbounds i8, ptr %185, i64 %186
  %188 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5ebackB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %17)
  %189 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 7
  %190 = load i64, ptr %189, align 8
  %191 = getelementptr inbounds i8, ptr %188, i64 %190
  %192 = call noundef i32 @_ZNKSt3__17codecvtIcc11__mbstate_tE2inB7v160006ERS1_PKcS5_RS5_PcS7_RS7_(ptr noundef nonnull align 8 dereferenceable(16) %178, ptr noundef nonnull align 4 dereferenceable(8) %179, ptr noundef %181, ptr noundef %183, ptr noundef nonnull align 8 dereferenceable(8) %184, ptr noundef %187, ptr noundef %191, ptr noundef nonnull align 8 dereferenceable(8) %16)
  store i32 %192, ptr %14, align 4
  %193 = load i32, ptr %14, align 4
  %194 = icmp eq i32 %193, 3
  br i1 %194, label %195, label %205

195:                                              ; preds = %171
  %196 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 1
  %197 = load ptr, ptr %196, align 8
  %198 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 1
  %199 = load ptr, ptr %198, align 8
  %200 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %17, i32 0, i32 3
  %201 = load ptr, ptr %200, align 8
  call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setgB7v160006EPcS4_S4_(ptr noundef nonnull align 8 dereferenceable(64) %17, ptr noundef %197, ptr noundef %199, ptr noundef %201)
  %202 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4gptrB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %17)
  %203 = load i8, ptr %202, align 1
  %204 = call noundef i32 @_ZNSt3__111char_traitsIcE11to_int_typeEc(i8 noundef signext %203) #17
  store i32 %204, ptr %9, align 4
  br label %221

205:                                              ; preds = %171
  %206 = load ptr, ptr %16, align 8
  %207 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5ebackB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %17)
  %208 = load i64, ptr %6, align 8
  %209 = getelementptr inbounds i8, ptr %207, i64 %208
  %210 = icmp ne ptr %206, %209
  br i1 %210, label %211, label %220

211:                                              ; preds = %205
  %212 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5ebackB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %17)
  %213 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5ebackB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %17)
  %214 = load i64, ptr %6, align 8
  %215 = getelementptr inbounds i8, ptr %213, i64 %214
  %216 = load ptr, ptr %16, align 8
  call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setgB7v160006EPcS4_S4_(ptr noundef nonnull align 8 dereferenceable(64) %17, ptr noundef %212, ptr noundef %215, ptr noundef %216)
  %217 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4gptrB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %17)
  %218 = load i8, ptr %217, align 1
  %219 = call noundef i32 @_ZNSt3__111char_traitsIcE11to_int_typeEc(i8 noundef signext %218) #17
  store i32 %219, ptr %9, align 4
  br label %220

220:                                              ; preds = %211, %205
  br label %221

221:                                              ; preds = %220, %195
  br label %222

222:                                              ; preds = %221, %139
  br label %223

223:                                              ; preds = %222, %91
  br label %228

224:                                              ; preds = %44
  %225 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4gptrB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %17)
  %226 = load i8, ptr %225, align 1
  %227 = call noundef i32 @_ZNSt3__111char_traitsIcE11to_int_typeEc(i8 noundef signext %226) #17
  store i32 %227, ptr %9, align 4
  br label %228

228:                                              ; preds = %224, %223
  %229 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5ebackB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %17)
  %230 = icmp eq ptr %229, %5
  br i1 %230, label %231, label %232

231:                                              ; preds = %228
  call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setgB7v160006EPcS4_S4_(ptr noundef nonnull align 8 dereferenceable(64) %17, ptr noundef null, ptr noundef null, ptr noundef null)
  br label %232

232:                                              ; preds = %231, %228
  %233 = load i32, ptr %9, align 4
  store i32 %233, ptr %2, align 4
  br label %234

234:                                              ; preds = %232, %21
  %235 = load i32, ptr %2, align 4
  ret i32 %235
}

declare noundef i32 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5uflowEv(ptr noundef nonnull align 8 dereferenceable(64)) unnamed_addr #2

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr dso_local noundef i32 @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE9pbackfailEi(ptr noundef nonnull align 8 dereferenceable(163) %0, i32 noundef %1) unnamed_addr #0 comdat align 2 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  %6 = load ptr, ptr %4, align 8
  %7 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %6, i32 0, i32 8
  %8 = load ptr, ptr %7, align 8
  %9 = icmp ne ptr %8, null
  br i1 %9, label %10, label %39

10:                                               ; preds = %2
  %11 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5ebackB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %6)
  %12 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4gptrB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %6)
  %13 = icmp ult ptr %11, %12
  br i1 %13, label %14, label %39

14:                                               ; preds = %10
  %15 = load i32, ptr %5, align 4
  %16 = call noundef i32 @_ZNSt3__111char_traitsIcE3eofEv() #17
  %17 = call noundef zeroext i1 @_ZNSt3__111char_traitsIcE11eq_int_typeEii(i32 noundef %15, i32 noundef %16) #17
  br i1 %17, label %18, label %21

18:                                               ; preds = %14
  call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5gbumpB7v160006Ei(ptr noundef nonnull align 8 dereferenceable(64) %6, i32 noundef -1)
  %19 = load i32, ptr %5, align 4
  %20 = call noundef i32 @_ZNSt3__111char_traitsIcE7not_eofEi(i32 noundef %19) #17
  store i32 %20, ptr %3, align 4
  br label %41

21:                                               ; preds = %14
  %22 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %6, i32 0, i32 12
  %23 = load i32, ptr %22, align 8
  %24 = and i32 %23, 16
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %33, label %26

26:                                               ; preds = %21
  %27 = load i32, ptr %5, align 4
  %28 = call noundef signext i8 @_ZNSt3__111char_traitsIcE12to_char_typeEi(i32 noundef %27) #17
  %29 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4gptrB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %6)
  %30 = getelementptr inbounds i8, ptr %29, i64 -1
  %31 = load i8, ptr %30, align 1
  %32 = call noundef zeroext i1 @_ZNSt3__111char_traitsIcE2eqEcc(i8 noundef signext %28, i8 noundef signext %31) #17
  br i1 %32, label %33, label %38

33:                                               ; preds = %26, %21
  call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5gbumpB7v160006Ei(ptr noundef nonnull align 8 dereferenceable(64) %6, i32 noundef -1)
  %34 = load i32, ptr %5, align 4
  %35 = call noundef signext i8 @_ZNSt3__111char_traitsIcE12to_char_typeEi(i32 noundef %34) #17
  %36 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4gptrB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %6)
  store i8 %35, ptr %36, align 1
  %37 = load i32, ptr %5, align 4
  store i32 %37, ptr %3, align 4
  br label %41

38:                                               ; preds = %26
  br label %39

39:                                               ; preds = %38, %10, %2
  %40 = call noundef i32 @_ZNSt3__111char_traitsIcE3eofEv() #17
  store i32 %40, ptr %3, align 4
  br label %41

41:                                               ; preds = %39, %33, %18
  %42 = load i32, ptr %3, align 4
  ret i32 %42
}

declare noundef i64 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE6xsputnEPKcl(ptr noundef nonnull align 8 dereferenceable(64), ptr noundef, i64 noundef) unnamed_addr #2

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr dso_local noundef i32 @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE8overflowEi(ptr noundef nonnull align 8 dereferenceable(163) %0, i32 noundef %1) unnamed_addr #0 comdat align 2 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8, align 1
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %15, i32 0, i32 8
  %17 = load ptr, ptr %16, align 8
  %18 = icmp eq ptr %17, null
  br i1 %18, label %19, label %21

19:                                               ; preds = %2
  %20 = call noundef i32 @_ZNSt3__111char_traitsIcE3eofEv() #17
  store i32 %20, ptr %3, align 4
  br label %155

21:                                               ; preds = %2
  call void @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE12__write_modeEv(ptr noundef nonnull align 8 dereferenceable(163) %15)
  %22 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5pbaseB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %15)
  store ptr %22, ptr %7, align 8
  %23 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5epptrB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %15)
  store ptr %23, ptr %8, align 8
  %24 = load i32, ptr %5, align 4
  %25 = call noundef i32 @_ZNSt3__111char_traitsIcE3eofEv() #17
  %26 = call noundef zeroext i1 @_ZNSt3__111char_traitsIcE11eq_int_typeEii(i32 noundef %24, i32 noundef %25) #17
  br i1 %26, label %36, label %27

27:                                               ; preds = %21
  %28 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4pptrB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %15)
  %29 = icmp eq ptr %28, null
  br i1 %29, label %30, label %32

30:                                               ; preds = %27
  %31 = getelementptr inbounds i8, ptr %6, i64 1
  call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setpB7v160006EPcS4_(ptr noundef nonnull align 8 dereferenceable(64) %15, ptr noundef %6, ptr noundef %31)
  br label %32

32:                                               ; preds = %30, %27
  %33 = load i32, ptr %5, align 4
  %34 = call noundef signext i8 @_ZNSt3__111char_traitsIcE12to_char_typeEi(i32 noundef %33) #17
  %35 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4pptrB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %15)
  store i8 %34, ptr %35, align 1
  call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5pbumpB7v160006Ei(ptr noundef nonnull align 8 dereferenceable(64) %15, i32 noundef 1)
  br label %36

36:                                               ; preds = %32, %21
  %37 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4pptrB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %15)
  %38 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5pbaseB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %15)
  %39 = icmp ne ptr %37, %38
  br i1 %39, label %40, label %152

40:                                               ; preds = %36
  %41 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %15, i32 0, i32 16
  %42 = load i8, ptr %41, align 2
  %43 = trunc i8 %42 to i1
  br i1 %43, label %44, label %60

44:                                               ; preds = %40
  %45 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4pptrB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %15)
  %46 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5pbaseB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %15)
  %47 = ptrtoint ptr %45 to i64
  %48 = ptrtoint ptr %46 to i64
  %49 = sub i64 %47, %48
  store i64 %49, ptr %9, align 8
  %50 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5pbaseB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %15)
  %51 = load i64, ptr %9, align 8
  %52 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %15, i32 0, i32 8
  %53 = load ptr, ptr %52, align 8
  %54 = call i64 @fwrite(ptr noundef %50, i64 noundef 1, i64 noundef %51, ptr noundef %53)
  %55 = load i64, ptr %9, align 8
  %56 = icmp ne i64 %54, %55
  br i1 %56, label %57, label %59

57:                                               ; preds = %44
  %58 = call noundef i32 @_ZNSt3__111char_traitsIcE3eofEv() #17
  store i32 %58, ptr %3, align 4
  br label %155

59:                                               ; preds = %44
  br label %149

60:                                               ; preds = %40
  %61 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %15, i32 0, i32 1
  %62 = load ptr, ptr %61, align 8
  store ptr %62, ptr %10, align 8
  br label %63

63:                                               ; preds = %145, %60
  %64 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %15, i32 0, i32 9
  %65 = load ptr, ptr %64, align 8
  %66 = icmp ne ptr %65, null
  br i1 %66, label %68, label %67

67:                                               ; preds = %63
  call void @_ZNSt3__116__throw_bad_castB7v160006Ev() #21
  unreachable

68:                                               ; preds = %63
  %69 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %15, i32 0, i32 9
  %70 = load ptr, ptr %69, align 8
  %71 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %15, i32 0, i32 10
  %72 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5pbaseB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %15)
  %73 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4pptrB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %15)
  %74 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %15, i32 0, i32 1
  %75 = load ptr, ptr %74, align 8
  %76 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %15, i32 0, i32 1
  %77 = load ptr, ptr %76, align 8
  %78 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %15, i32 0, i32 5
  %79 = load i64, ptr %78, align 8
  %80 = getelementptr inbounds i8, ptr %77, i64 %79
  %81 = call noundef i32 @_ZNKSt3__17codecvtIcc11__mbstate_tE3outB7v160006ERS1_PKcS5_RS5_PcS7_RS7_(ptr noundef nonnull align 8 dereferenceable(16) %70, ptr noundef nonnull align 4 dereferenceable(8) %71, ptr noundef %72, ptr noundef %73, ptr noundef nonnull align 8 dereferenceable(8) %12, ptr noundef %75, ptr noundef %80, ptr noundef nonnull align 8 dereferenceable(8) %10)
  store i32 %81, ptr %11, align 4
  %82 = load ptr, ptr %12, align 8
  %83 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5pbaseB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %15)
  %84 = icmp eq ptr %82, %83
  br i1 %84, label %85, label %87

85:                                               ; preds = %68
  %86 = call noundef i32 @_ZNSt3__111char_traitsIcE3eofEv() #17
  store i32 %86, ptr %3, align 4
  br label %155

87:                                               ; preds = %68
  %88 = load i32, ptr %11, align 4
  %89 = icmp eq i32 %88, 3
  br i1 %89, label %90, label %106

90:                                               ; preds = %87
  %91 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4pptrB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %15)
  %92 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5pbaseB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %15)
  %93 = ptrtoint ptr %91 to i64
  %94 = ptrtoint ptr %92 to i64
  %95 = sub i64 %93, %94
  store i64 %95, ptr %13, align 8
  %96 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5pbaseB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %15)
  %97 = load i64, ptr %13, align 8
  %98 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %15, i32 0, i32 8
  %99 = load ptr, ptr %98, align 8
  %100 = call i64 @fwrite(ptr noundef %96, i64 noundef 1, i64 noundef %97, ptr noundef %99)
  %101 = load i64, ptr %13, align 8
  %102 = icmp ne i64 %100, %101
  br i1 %102, label %103, label %105

103:                                              ; preds = %90
  %104 = call noundef i32 @_ZNSt3__111char_traitsIcE3eofEv() #17
  store i32 %104, ptr %3, align 4
  br label %155

105:                                              ; preds = %90
  br label %144

106:                                              ; preds = %87
  %107 = load i32, ptr %11, align 4
  %108 = icmp eq i32 %107, 0
  br i1 %108, label %112, label %109

109:                                              ; preds = %106
  %110 = load i32, ptr %11, align 4
  %111 = icmp eq i32 %110, 1
  br i1 %111, label %112, label %141

112:                                              ; preds = %109, %106
  %113 = load ptr, ptr %10, align 8
  %114 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %15, i32 0, i32 1
  %115 = load ptr, ptr %114, align 8
  %116 = ptrtoint ptr %113 to i64
  %117 = ptrtoint ptr %115 to i64
  %118 = sub i64 %116, %117
  store i64 %118, ptr %14, align 8
  %119 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %15, i32 0, i32 1
  %120 = load ptr, ptr %119, align 8
  %121 = load i64, ptr %14, align 8
  %122 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %15, i32 0, i32 8
  %123 = load ptr, ptr %122, align 8
  %124 = call i64 @fwrite(ptr noundef %120, i64 noundef 1, i64 noundef %121, ptr noundef %123)
  %125 = load i64, ptr %14, align 8
  %126 = icmp ne i64 %124, %125
  br i1 %126, label %127, label %129

127:                                              ; preds = %112
  %128 = call noundef i32 @_ZNSt3__111char_traitsIcE3eofEv() #17
  store i32 %128, ptr %3, align 4
  br label %155

129:                                              ; preds = %112
  %130 = load i32, ptr %11, align 4
  %131 = icmp eq i32 %130, 1
  br i1 %131, label %132, label %140

132:                                              ; preds = %129
  %133 = load ptr, ptr %12, align 8
  %134 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4pptrB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %15)
  call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setpB7v160006EPcS4_(ptr noundef nonnull align 8 dereferenceable(64) %15, ptr noundef %133, ptr noundef %134)
  %135 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5epptrB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %15)
  %136 = call noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5pbaseB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %15)
  %137 = ptrtoint ptr %135 to i64
  %138 = ptrtoint ptr %136 to i64
  %139 = sub i64 %137, %138
  call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE7__pbumpB7v160006El(ptr noundef nonnull align 8 dereferenceable(64) %15, i64 noundef %139)
  br label %140

140:                                              ; preds = %132, %129
  br label %143

141:                                              ; preds = %109
  %142 = call noundef i32 @_ZNSt3__111char_traitsIcE3eofEv() #17
  store i32 %142, ptr %3, align 4
  br label %155

143:                                              ; preds = %140
  br label %144

144:                                              ; preds = %143, %105
  br label %145

145:                                              ; preds = %144
  %146 = load i32, ptr %11, align 4
  %147 = icmp eq i32 %146, 1
  br i1 %147, label %63, label %148, !llvm.loop !17

148:                                              ; preds = %145
  br label %149

149:                                              ; preds = %148, %59
  %150 = load ptr, ptr %7, align 8
  %151 = load ptr, ptr %8, align 8
  call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setpB7v160006EPcS4_(ptr noundef nonnull align 8 dereferenceable(64) %15, ptr noundef %150, ptr noundef %151)
  br label %152

152:                                              ; preds = %149, %36
  %153 = load i32, ptr %5, align 4
  %154 = call noundef i32 @_ZNSt3__111char_traitsIcE7not_eofEi(i32 noundef %153) #17
  store i32 %154, ptr %3, align 4
  br label %155

155:                                              ; preds = %152, %141, %127, %103, %85, %57, %19
  %156 = load i32, ptr %3, align 4
  ret i32 %156
}

declare i32 @fclose(ptr noundef) #2

; Function Attrs: noinline nounwind sspstrong uwtable
define linkonce_odr dso_local void @_ZNSt3__110unique_ptrI8_IO_FILEPFiPS1_EEC2B7v160006ILb1EvEES2_NS_16__dependent_typeINS_27__unique_ptr_deleter_sfinaeIS4_EEXT_EE20__good_rval_ref_typeE(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef %1, ptr noundef nonnull align 8 dereferenceable(8) %2) unnamed_addr #5 comdat align 2 personality ptr @__gxx_personality_v0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = getelementptr inbounds %"class.std::__1::unique_ptr.26", ptr %7, i32 0, i32 0
  %9 = load ptr, ptr %6, align 8
  invoke void @_ZNSt3__117__compressed_pairIP8_IO_FILEPFiS2_EEC2B7v160006IRS2_S4_EEOT_OT0_(ptr noundef nonnull align 8 dereferenceable(16) %8, ptr noundef nonnull align 8 dereferenceable(8) %5, ptr noundef nonnull align 8 dereferenceable(8) %9)
          to label %10 unwind label %11

10:                                               ; preds = %3
  ret void

11:                                               ; preds = %3
  %12 = landingpad { ptr, i32 }
          catch ptr null
  %13 = extractvalue { ptr, i32 } %12, 0
  call void @__clang_call_terminate(ptr %13) #20
  unreachable
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef ptr @_ZNSt3__110unique_ptrI8_IO_FILEPFiPS1_EE7releaseB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %"class.std::__1::unique_ptr.26", ptr %4, i32 0, i32 0
  %6 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__117__compressed_pairIP8_IO_FILEPFiS2_EE5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %5) #17
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %3, align 8
  %8 = getelementptr inbounds %"class.std::__1::unique_ptr.26", ptr %4, i32 0, i32 0
  %9 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__117__compressed_pairIP8_IO_FILEPFiS2_EE5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %8) #17
  store ptr null, ptr %9, align 8
  %10 = load ptr, ptr %3, align 8
  ret ptr %10
}

; Function Attrs: noinline nounwind sspstrong uwtable
define linkonce_odr hidden void @_ZNSt3__110unique_ptrI8_IO_FILEPFiPS1_EED2B7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) unnamed_addr #5 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void @_ZNSt3__110unique_ptrI8_IO_FILEPFiPS1_EE5resetB7v160006ES2_(ptr noundef nonnull align 8 dereferenceable(16) %3, ptr noundef null) #17
  ret void
}

; Function Attrs: noinline sspstrong uwtable
define linkonce_odr dso_local void @_ZNSt3__117__compressed_pairIP8_IO_FILEPFiS2_EEC2B7v160006IRS2_S4_EEOT_OT0_(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 8 dereferenceable(8) %2) unnamed_addr #1 comdat align 2 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  call void @_ZNSt3__122__compressed_pair_elemIP8_IO_FILELi0ELb0EEC2B7v160006IRS2_vEEOT_(ptr noundef nonnull align 8 dereferenceable(8) %7, ptr noundef nonnull align 8 dereferenceable(8) %8)
  %9 = getelementptr inbounds i8, ptr %7, i64 8
  %10 = load ptr, ptr %6, align 8
  call void @_ZNSt3__122__compressed_pair_elemIPFiP8_IO_FILEELi1ELb0EEC2B7v160006IS4_vEEOT_(ptr noundef nonnull align 8 dereferenceable(8) %9, ptr noundef nonnull align 8 dereferenceable(8) %10)
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define linkonce_odr dso_local void @_ZNSt3__122__compressed_pair_elemIP8_IO_FILELi0ELb0EEC2B7v160006IRS2_vEEOT_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) unnamed_addr #5 comdat align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem.4.23", ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %7, align 8
  store ptr %8, ptr %6, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define linkonce_odr dso_local void @_ZNSt3__122__compressed_pair_elemIPFiP8_IO_FILEELi1ELb0EEC2B7v160006IS4_vEEOT_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) unnamed_addr #5 comdat align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem.5.24", ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %7, align 8
  store ptr %8, ptr %6, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__117__compressed_pairIP8_IO_FILEPFiS2_EE5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__122__compressed_pair_elemIP8_IO_FILELi0ELb0EE5__getB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #17
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__122__compressed_pair_elemIP8_IO_FILELi0ELb0EE5__getB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem.4.23", ptr %3, i32 0, i32 0
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden void @_ZNSt3__110unique_ptrI8_IO_FILEPFiPS1_EE5resetB7v160006ES2_(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef %1) #6 comdat align 2 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds %"class.std::__1::unique_ptr.26", ptr %6, i32 0, i32 0
  %8 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__117__compressed_pairIP8_IO_FILEPFiS2_EE5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %7) #17
  %9 = load ptr, ptr %8, align 8
  store ptr %9, ptr %5, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds %"class.std::__1::unique_ptr.26", ptr %6, i32 0, i32 0
  %12 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__117__compressed_pairIP8_IO_FILEPFiS2_EE5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %11) #17
  store ptr %10, ptr %12, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = icmp ne ptr %13, null
  br i1 %14, label %15, label %22

15:                                               ; preds = %2
  %16 = getelementptr inbounds %"class.std::__1::unique_ptr.26", ptr %6, i32 0, i32 0
  %17 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__117__compressed_pairIP8_IO_FILEPFiS2_EE6secondB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %16) #17
  %18 = load ptr, ptr %17, align 8
  %19 = load ptr, ptr %5, align 8
  %20 = invoke noundef i32 %18(ptr noundef %19)
          to label %21 unwind label %23

21:                                               ; preds = %15
  br label %22

22:                                               ; preds = %21, %2
  ret void

23:                                               ; preds = %15
  %24 = landingpad { ptr, i32 }
          catch ptr null
  %25 = extractvalue { ptr, i32 } %24, 0
  call void @__clang_call_terminate(ptr %25) #20
  unreachable
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__117__compressed_pairIP8_IO_FILEPFiS2_EE6secondB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds i8, ptr %3, i64 8
  %5 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__122__compressed_pair_elemIPFiP8_IO_FILEELi1ELb0EE5__getB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(8) %4) #17
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__122__compressed_pair_elemIPFiP8_IO_FILEELi1ELb0EE5__getB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem.5.24", ptr %3, i32 0, i32 0
  ret ptr %4
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(ptr noundef) #11

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(16) ptr @_ZNSt3__19use_facetB7v160006INS_7codecvtIcc11__mbstate_tEEEERKT_RKNS_6localeE(ptr noundef nonnull align 8 dereferenceable(8) %0) #0 comdat {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZNKSt3__16locale9use_facetERNS0_2idE(ptr noundef nonnull align 8 dereferenceable(8) %3, ptr noundef nonnull align 8 dereferenceable(12) @_ZNSt3__17codecvtIcc11__mbstate_tE2idE)
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef zeroext i1 @_ZNKSt3__17codecvtIcc11__mbstate_tE13always_noconvB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds ptr, ptr %4, i64 7
  %6 = load ptr, ptr %5, align 8
  %7 = call noundef zeroext i1 %6(ptr noundef nonnull align 8 dereferenceable(16) %3) #17
  ret i1 %7
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setgB7v160006EPcS4_S4_(ptr noundef nonnull align 8 dereferenceable(64) %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #6 comdat align 2 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = getelementptr inbounds %"class.std::__1::basic_streambuf.7", ptr %9, i32 0, i32 2
  store ptr %10, ptr %11, align 8
  %12 = load ptr, ptr %7, align 8
  %13 = getelementptr inbounds %"class.std::__1::basic_streambuf.7", ptr %9, i32 0, i32 3
  store ptr %12, ptr %13, align 8
  %14 = load ptr, ptr %8, align 8
  %15 = getelementptr inbounds %"class.std::__1::basic_streambuf.7", ptr %9, i32 0, i32 4
  store ptr %14, ptr %15, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setpB7v160006EPcS4_(ptr noundef nonnull align 8 dereferenceable(64) %0, ptr noundef %1, ptr noundef %2) #6 comdat align 2 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = getelementptr inbounds %"class.std::__1::basic_streambuf.7", ptr %7, i32 0, i32 6
  store ptr %8, ptr %9, align 8
  %10 = getelementptr inbounds %"class.std::__1::basic_streambuf.7", ptr %7, i32 0, i32 5
  store ptr %8, ptr %10, align 8
  %11 = load ptr, ptr %6, align 8
  %12 = getelementptr inbounds %"class.std::__1::basic_streambuf.7", ptr %7, i32 0, i32 7
  store ptr %11, ptr %12, align 8
  ret void
}

declare noundef ptr @_ZNKSt3__16locale9use_facetERNS0_2idE(ptr noundef nonnull align 8 dereferenceable(8), ptr noundef nonnull align 8 dereferenceable(12)) #2

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__13maxIlEEUa9enable_ifILb1EERKT_S3_S3_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #6 comdat {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load i64, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load i64, ptr %7, align 8
  %9 = icmp slt i64 %6, %8
  br i1 %9, label %10, label %12

10:                                               ; preds = %2
  %11 = load ptr, ptr %4, align 8
  br label %14

12:                                               ; preds = %2
  %13 = load ptr, ptr %3, align 8
  br label %14

14:                                               ; preds = %12, %10
  %15 = phi ptr [ %11, %10 ], [ %13, %12 ]
  ret ptr %15
}

; Function Attrs: mustprogress noinline noreturn sspstrong uwtable
define linkonce_odr hidden void @_ZNSt3__116__throw_bad_castB7v160006Ev() #14 comdat {
  %1 = call ptr @__cxa_allocate_exception(i64 8) #17
  call void @_ZNSt8bad_castC1Ev(ptr noundef nonnull align 8 dereferenceable(8) %1) #17
  call void @__cxa_throw(ptr %1, ptr @_ZTISt8bad_cast, ptr @_ZNSt8bad_castD1Ev) #21
  unreachable
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef i32 @_ZNKSt3__17codecvtIcc11__mbstate_tE8encodingB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds ptr, ptr %4, i64 6
  %6 = load ptr, ptr %5, align 8
  %7 = call noundef i32 %6(ptr noundef nonnull align 8 dereferenceable(16) %3) #17
  ret i32 %7
}

; Function Attrs: noinline nounwind sspstrong uwtable
define linkonce_odr hidden void @_ZNSt3__14fposI11__mbstate_tEC2B7v160006Ex(ptr noundef nonnull align 8 dereferenceable(16) %0, i64 noundef %1) unnamed_addr #5 comdat align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %"class.std::__1::fpos.27", ptr %5, i32 0, i32 0
  call void @llvm.memset.p0.i64(ptr align 8 %6, i8 0, i64 8, i1 false)
  %7 = getelementptr inbounds %"class.std::__1::fpos.27", ptr %5, i32 0, i32 1
  %8 = load i64, ptr %4, align 8
  store i64 %8, ptr %7, align 8
  ret void
}

declare i32 @fseeko(ptr noundef, i64 noundef, i32 noundef) #2

declare i64 @ftello(ptr noundef) #2

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden void @_ZNSt3__14fposI11__mbstate_tE5stateB7v160006ES1_(ptr noundef nonnull align 8 dereferenceable(16) %0, i64 %1) #6 comdat align 2 {
  %3 = alloca %struct.__mbstate_t.9, align 4
  %4 = alloca ptr, align 8
  store i64 %1, ptr %3, align 4
  store ptr %0, ptr %4, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds %"class.std::__1::fpos.27", ptr %5, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %6, ptr align 4 %3, i64 8, i1 false)
  ret void
}

declare ptr @__cxa_allocate_exception(i64)

; Function Attrs: nounwind
declare void @_ZNSt8bad_castC1Ev(ptr noundef nonnull align 8 dereferenceable(8)) unnamed_addr #9

; Function Attrs: nounwind
declare void @_ZNSt8bad_castD1Ev(ptr noundef nonnull align 8 dereferenceable(8)) unnamed_addr #9

declare void @__cxa_throw(ptr, ptr, ptr)

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #15

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef i64 @_ZNKSt3__14fposI11__mbstate_tEcvxB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::fpos.27", ptr %3, i32 0, i32 1
  %5 = load i64, ptr %4, align 8
  ret i64 %5
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden i64 @_ZNKSt3__14fposI11__mbstate_tE5stateB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) #6 comdat align 2 {
  %2 = alloca %struct.__mbstate_t.9, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds %"class.std::__1::fpos.27", ptr %4, i32 0, i32 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %2, ptr align 8 %5, i64 8, i1 false)
  %6 = load i64, ptr %2, align 4
  ret i64 %6
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4pptrB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::basic_streambuf.7", ptr %3, i32 0, i32 6
  %5 = load ptr, ptr %4, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5pbaseB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::basic_streambuf.7", ptr %3, i32 0, i32 5
  %5 = load ptr, ptr %4, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr dso_local noundef i32 @_ZNSt3__111char_traitsIcE3eofEv() #6 comdat align 2 {
  ret i32 -1
}

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr hidden noundef i32 @_ZNKSt3__17codecvtIcc11__mbstate_tE7unshiftB7v160006ERS1_PcS4_RS4_(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef nonnull align 4 dereferenceable(8) %1, ptr noundef %2, ptr noundef %3, ptr noundef nonnull align 8 dereferenceable(8) %4) #0 comdat align 2 {
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  store ptr %4, ptr %10, align 8
  %11 = load ptr, ptr %6, align 8
  %12 = load ptr, ptr %7, align 8
  %13 = load ptr, ptr %8, align 8
  %14 = load ptr, ptr %9, align 8
  %15 = load ptr, ptr %10, align 8
  %16 = load ptr, ptr %11, align 8
  %17 = getelementptr inbounds ptr, ptr %16, i64 5
  %18 = load ptr, ptr %17, align 8
  %19 = call noundef i32 %18(ptr noundef nonnull align 8 dereferenceable(16) %11, ptr noundef nonnull align 4 dereferenceable(8) %12, ptr noundef %13, ptr noundef %14, ptr noundef nonnull align 8 dereferenceable(8) %15)
  ret i32 %19
}

declare i64 @fwrite(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #2

declare i32 @fflush(ptr noundef) #2

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5egptrB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::basic_streambuf.7", ptr %3, i32 0, i32 4
  %5 = load ptr, ptr %4, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE4gptrB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::basic_streambuf.7", ptr %3, i32 0, i32 3
  %5 = load ptr, ptr %4, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr hidden noundef i32 @_ZNKSt3__17codecvtIcc11__mbstate_tE6lengthB7v160006ERS1_PKcS5_m(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef nonnull align 4 dereferenceable(8) %1, ptr noundef %2, ptr noundef %3, i64 noundef %4) #0 comdat align 2 {
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i64, align 8
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  store i64 %4, ptr %10, align 8
  %11 = load ptr, ptr %6, align 8
  %12 = load ptr, ptr %7, align 8
  %13 = load ptr, ptr %8, align 8
  %14 = load ptr, ptr %9, align 8
  %15 = load i64, ptr %10, align 8
  %16 = load ptr, ptr %11, align 8
  %17 = getelementptr inbounds ptr, ptr %16, i64 8
  %18 = load ptr, ptr %17, align 8
  %19 = call noundef i32 %18(ptr noundef nonnull align 8 dereferenceable(16) %11, ptr noundef nonnull align 4 dereferenceable(8) %12, ptr noundef %13, ptr noundef %14, i64 noundef %15)
  ret i32 %19
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5ebackB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::basic_streambuf.7", ptr %3, i32 0, i32 2
  %5 = load ptr, ptr %4, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr dso_local noundef zeroext i1 @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE11__read_modeEv(ptr noundef nonnull align 8 dereferenceable(163) %0) #6 comdat align 2 {
  %2 = alloca i1, align 1
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %4, i32 0, i32 13
  %6 = load i32, ptr %5, align 4
  %7 = and i32 %6, 8
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %41, label %9

9:                                                ; preds = %1
  call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setpB7v160006EPcS4_(ptr noundef nonnull align 8 dereferenceable(64) %4, ptr noundef null, ptr noundef null)
  %10 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %4, i32 0, i32 16
  %11 = load i8, ptr %10, align 2
  %12 = trunc i8 %11 to i1
  br i1 %12, label %13, label %26

13:                                               ; preds = %9
  %14 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %4, i32 0, i32 1
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %4, i32 0, i32 1
  %17 = load ptr, ptr %16, align 8
  %18 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %4, i32 0, i32 5
  %19 = load i64, ptr %18, align 8
  %20 = getelementptr inbounds i8, ptr %17, i64 %19
  %21 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %4, i32 0, i32 1
  %22 = load ptr, ptr %21, align 8
  %23 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %4, i32 0, i32 5
  %24 = load i64, ptr %23, align 8
  %25 = getelementptr inbounds i8, ptr %22, i64 %24
  call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setgB7v160006EPcS4_S4_(ptr noundef nonnull align 8 dereferenceable(64) %4, ptr noundef %15, ptr noundef %20, ptr noundef %25)
  br label %39

26:                                               ; preds = %9
  %27 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %4, i32 0, i32 6
  %28 = load ptr, ptr %27, align 8
  %29 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %4, i32 0, i32 6
  %30 = load ptr, ptr %29, align 8
  %31 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %4, i32 0, i32 7
  %32 = load i64, ptr %31, align 8
  %33 = getelementptr inbounds i8, ptr %30, i64 %32
  %34 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %4, i32 0, i32 6
  %35 = load ptr, ptr %34, align 8
  %36 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %4, i32 0, i32 7
  %37 = load i64, ptr %36, align 8
  %38 = getelementptr inbounds i8, ptr %35, i64 %37
  call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setgB7v160006EPcS4_S4_(ptr noundef nonnull align 8 dereferenceable(64) %4, ptr noundef %28, ptr noundef %33, ptr noundef %38)
  br label %39

39:                                               ; preds = %26, %13
  %40 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %4, i32 0, i32 13
  store i32 8, ptr %40, align 4
  store i1 true, ptr %2, align 1
  br label %42

41:                                               ; preds = %1
  store i1 false, ptr %2, align 1
  br label %42

42:                                               ; preds = %41, %39
  %43 = load i1, ptr %2, align 1
  ret i1 %43
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__13minImEEUa9enable_ifILb1EERKT_S3_S3_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #6 comdat {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load i64, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load i64, ptr %7, align 8
  %9 = icmp ult i64 %6, %8
  br i1 %9, label %10, label %12

10:                                               ; preds = %2
  %11 = load ptr, ptr %3, align 8
  br label %14

12:                                               ; preds = %2
  %13 = load ptr, ptr %4, align 8
  br label %14

14:                                               ; preds = %12, %10
  %15 = phi ptr [ %11, %10 ], [ %13, %12 ]
  ret ptr %15
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memmove.p0.p0.i64(ptr nocapture writeonly, ptr nocapture readonly, i64, i1 immarg) #8

declare i64 @fread(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #2

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr dso_local noundef i32 @_ZNSt3__111char_traitsIcE11to_int_typeEc(i8 noundef signext %0) #6 comdat align 2 {
  %2 = alloca i8, align 1
  store i8 %0, ptr %2, align 1
  %3 = load i8, ptr %2, align 1
  %4 = zext i8 %3 to i32
  ret i32 %4
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #16

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr hidden noundef i32 @_ZNKSt3__17codecvtIcc11__mbstate_tE2inB7v160006ERS1_PKcS5_RS5_PcS7_RS7_(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef nonnull align 4 dereferenceable(8) %1, ptr noundef %2, ptr noundef %3, ptr noundef nonnull align 8 dereferenceable(8) %4, ptr noundef %5, ptr noundef %6, ptr noundef nonnull align 8 dereferenceable(8) %7) #0 comdat align 2 {
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  store ptr %0, ptr %9, align 8
  store ptr %1, ptr %10, align 8
  store ptr %2, ptr %11, align 8
  store ptr %3, ptr %12, align 8
  store ptr %4, ptr %13, align 8
  store ptr %5, ptr %14, align 8
  store ptr %6, ptr %15, align 8
  store ptr %7, ptr %16, align 8
  %17 = load ptr, ptr %9, align 8
  %18 = load ptr, ptr %10, align 8
  %19 = load ptr, ptr %11, align 8
  %20 = load ptr, ptr %12, align 8
  %21 = load ptr, ptr %13, align 8
  %22 = load ptr, ptr %14, align 8
  %23 = load ptr, ptr %15, align 8
  %24 = load ptr, ptr %16, align 8
  %25 = load ptr, ptr %17, align 8
  %26 = getelementptr inbounds ptr, ptr %25, i64 4
  %27 = load ptr, ptr %26, align 8
  %28 = call noundef i32 %27(ptr noundef nonnull align 8 dereferenceable(16) %17, ptr noundef nonnull align 4 dereferenceable(8) %18, ptr noundef %19, ptr noundef %20, ptr noundef nonnull align 8 dereferenceable(8) %21, ptr noundef %22, ptr noundef %23, ptr noundef nonnull align 8 dereferenceable(8) %24)
  ret i32 %28
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr dso_local noundef zeroext i1 @_ZNSt3__111char_traitsIcE11eq_int_typeEii(i32 noundef %0, i32 noundef %1) #6 comdat align 2 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %3, align 4
  %6 = load i32, ptr %4, align 4
  %7 = icmp eq i32 %5, %6
  ret i1 %7
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5gbumpB7v160006Ei(ptr noundef nonnull align 8 dereferenceable(64) %0, i32 noundef %1) #6 comdat align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = load i32, ptr %4, align 4
  %7 = getelementptr inbounds %"class.std::__1::basic_streambuf.7", ptr %5, i32 0, i32 3
  %8 = load ptr, ptr %7, align 8
  %9 = sext i32 %6 to i64
  %10 = getelementptr inbounds i8, ptr %8, i64 %9
  store ptr %10, ptr %7, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr dso_local noundef i32 @_ZNSt3__111char_traitsIcE7not_eofEi(i32 noundef %0) #6 comdat align 2 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = call noundef i32 @_ZNSt3__111char_traitsIcE3eofEv() #17
  %5 = call noundef zeroext i1 @_ZNSt3__111char_traitsIcE11eq_int_typeEii(i32 noundef %3, i32 noundef %4) #17
  br i1 %5, label %6, label %9

6:                                                ; preds = %1
  %7 = call noundef i32 @_ZNSt3__111char_traitsIcE3eofEv() #17
  %8 = xor i32 %7, -1
  br label %11

9:                                                ; preds = %1
  %10 = load i32, ptr %2, align 4
  br label %11

11:                                               ; preds = %9, %6
  %12 = phi i32 [ %8, %6 ], [ %10, %9 ]
  ret i32 %12
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr dso_local noundef zeroext i1 @_ZNSt3__111char_traitsIcE2eqEcc(i8 noundef signext %0, i8 noundef signext %1) #6 comdat align 2 {
  %3 = alloca i8, align 1
  %4 = alloca i8, align 1
  store i8 %0, ptr %3, align 1
  store i8 %1, ptr %4, align 1
  %5 = load i8, ptr %3, align 1
  %6 = sext i8 %5 to i32
  %7 = load i8, ptr %4, align 1
  %8 = sext i8 %7 to i32
  %9 = icmp eq i32 %6, %8
  ret i1 %9
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr dso_local noundef signext i8 @_ZNSt3__111char_traitsIcE12to_char_typeEi(i32 noundef %0) #6 comdat align 2 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = trunc i32 %3 to i8
  ret i8 %4
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr dso_local void @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE12__write_modeEv(ptr noundef nonnull align 8 dereferenceable(163) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %3, i32 0, i32 13
  %5 = load i32, ptr %4, align 4
  %6 = and i32 %5, 16
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %38, label %8

8:                                                ; preds = %1
  call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setgB7v160006EPcS4_S4_(ptr noundef nonnull align 8 dereferenceable(64) %3, ptr noundef null, ptr noundef null, ptr noundef null)
  %9 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %3, i32 0, i32 5
  %10 = load i64, ptr %9, align 8
  %11 = icmp ugt i64 %10, 8
  br i1 %11, label %12, label %35

12:                                               ; preds = %8
  %13 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %3, i32 0, i32 16
  %14 = load i8, ptr %13, align 2
  %15 = trunc i8 %14 to i1
  br i1 %15, label %16, label %25

16:                                               ; preds = %12
  %17 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %3, i32 0, i32 1
  %18 = load ptr, ptr %17, align 8
  %19 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %3, i32 0, i32 1
  %20 = load ptr, ptr %19, align 8
  %21 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %3, i32 0, i32 5
  %22 = load i64, ptr %21, align 8
  %23 = sub i64 %22, 1
  %24 = getelementptr inbounds i8, ptr %20, i64 %23
  call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setpB7v160006EPcS4_(ptr noundef nonnull align 8 dereferenceable(64) %3, ptr noundef %18, ptr noundef %24)
  br label %34

25:                                               ; preds = %12
  %26 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %3, i32 0, i32 6
  %27 = load ptr, ptr %26, align 8
  %28 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %3, i32 0, i32 6
  %29 = load ptr, ptr %28, align 8
  %30 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %3, i32 0, i32 7
  %31 = load i64, ptr %30, align 8
  %32 = sub i64 %31, 1
  %33 = getelementptr inbounds i8, ptr %29, i64 %32
  call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setpB7v160006EPcS4_(ptr noundef nonnull align 8 dereferenceable(64) %3, ptr noundef %27, ptr noundef %33)
  br label %34

34:                                               ; preds = %25, %16
  br label %36

35:                                               ; preds = %8
  call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4setpB7v160006EPcS4_(ptr noundef nonnull align 8 dereferenceable(64) %3, ptr noundef null, ptr noundef null)
  br label %36

36:                                               ; preds = %35, %34
  %37 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %3, i32 0, i32 13
  store i32 16, ptr %37, align 4
  br label %38

38:                                               ; preds = %36, %1
  ret void
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef ptr @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE5epptrB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(64) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::basic_streambuf.7", ptr %3, i32 0, i32 7
  %5 = load ptr, ptr %4, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5pbumpB7v160006Ei(ptr noundef nonnull align 8 dereferenceable(64) %0, i32 noundef %1) #6 comdat align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = load i32, ptr %4, align 4
  %7 = getelementptr inbounds %"class.std::__1::basic_streambuf.7", ptr %5, i32 0, i32 6
  %8 = load ptr, ptr %7, align 8
  %9 = sext i32 %6 to i64
  %10 = getelementptr inbounds i8, ptr %8, i64 %9
  store ptr %10, ptr %7, align 8
  ret void
}

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr hidden noundef i32 @_ZNKSt3__17codecvtIcc11__mbstate_tE3outB7v160006ERS1_PKcS5_RS5_PcS7_RS7_(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef nonnull align 4 dereferenceable(8) %1, ptr noundef %2, ptr noundef %3, ptr noundef nonnull align 8 dereferenceable(8) %4, ptr noundef %5, ptr noundef %6, ptr noundef nonnull align 8 dereferenceable(8) %7) #0 comdat align 2 {
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  store ptr %0, ptr %9, align 8
  store ptr %1, ptr %10, align 8
  store ptr %2, ptr %11, align 8
  store ptr %3, ptr %12, align 8
  store ptr %4, ptr %13, align 8
  store ptr %5, ptr %14, align 8
  store ptr %6, ptr %15, align 8
  store ptr %7, ptr %16, align 8
  %17 = load ptr, ptr %9, align 8
  %18 = load ptr, ptr %10, align 8
  %19 = load ptr, ptr %11, align 8
  %20 = load ptr, ptr %12, align 8
  %21 = load ptr, ptr %13, align 8
  %22 = load ptr, ptr %14, align 8
  %23 = load ptr, ptr %15, align 8
  %24 = load ptr, ptr %16, align 8
  %25 = load ptr, ptr %17, align 8
  %26 = getelementptr inbounds ptr, ptr %25, i64 3
  %27 = load ptr, ptr %26, align 8
  %28 = call noundef i32 %27(ptr noundef nonnull align 8 dereferenceable(16) %17, ptr noundef nonnull align 4 dereferenceable(8) %18, ptr noundef %19, ptr noundef %20, ptr noundef nonnull align 8 dereferenceable(8) %21, ptr noundef %22, ptr noundef %23, ptr noundef nonnull align 8 dereferenceable(8) %24)
  ret i32 %28
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE7__pbumpB7v160006El(ptr noundef nonnull align 8 dereferenceable(64) %0, i64 noundef %1) #6 comdat align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load i64, ptr %4, align 8
  %7 = getelementptr inbounds %"class.std::__1::basic_streambuf.7", ptr %5, i32 0, i32 6
  %8 = load ptr, ptr %7, align 8
  %9 = getelementptr inbounds i8, ptr %8, i64 %6
  store ptr %9, ptr %7, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define linkonce_odr dso_local void @_ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED2Ev(ptr noundef nonnull align 8 dereferenceable(176) %0, ptr noundef %1) unnamed_addr #5 comdat align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %5, align 8
  %8 = getelementptr inbounds ptr, ptr %6, i64 3
  %9 = load ptr, ptr %8, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = getelementptr i8, ptr %10, i64 -24
  %12 = load i64, ptr %11, align 8
  %13 = getelementptr inbounds i8, ptr %5, i64 %12
  store ptr %9, ptr %13, align 8
  %14 = getelementptr inbounds %"class.std::__1::basic_ofstream.13", ptr %5, i32 0, i32 1
  call void @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED2Ev(ptr noundef nonnull align 8 dereferenceable(163) %14) #17
  %15 = getelementptr inbounds ptr, ptr %6, i64 1
  call void @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev(ptr noundef nonnull align 8 dereferenceable(8) %5, ptr noundef %15) #17
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define linkonce_odr dso_local void @_ZTv0_n24_NSt3__114basic_ofstreamIcNS_11char_traitsIcEEED1Ev(ptr noundef %0) unnamed_addr #5 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds i8, ptr %4, i64 -24
  %6 = load i64, ptr %5, align 8
  %7 = getelementptr inbounds i8, ptr %3, i64 %6
  tail call void @_ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(176) %7) #17
  ret void
}

; Function Attrs: nounwind
declare void @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(8)) unnamed_addr #9

; Function Attrs: nounwind
declare void @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED0Ev(ptr noundef nonnull align 8 dereferenceable(8)) unnamed_addr #9

; Function Attrs: nounwind
declare void @_ZTv0_n24_NSt3__113basic_ostreamIcNS_11char_traitsIcEEED1Ev(ptr noundef) unnamed_addr #9

; Function Attrs: nounwind
declare void @_ZTv0_n24_NSt3__113basic_ostreamIcNS_11char_traitsIcEEED0Ev(ptr noundef) unnamed_addr #9

; Function Attrs: noinline nounwind sspstrong uwtable
define linkonce_odr dso_local void @_ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED0Ev(ptr noundef nonnull align 8 dereferenceable(176) %0) unnamed_addr #5 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void @_ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(176) %3) #17
  call void @_ZdlPv(ptr noundef %3) #19
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define linkonce_odr dso_local void @_ZTv0_n24_NSt3__114basic_ofstreamIcNS_11char_traitsIcEEED0Ev(ptr noundef %0) unnamed_addr #5 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds i8, ptr %4, i64 -24
  %6 = load i64, ptr %5, align 8
  %7 = getelementptr inbounds i8, ptr %3, i64 %6
  tail call void @_ZNSt3__114basic_ofstreamIcNS_11char_traitsIcEEED0Ev(ptr noundef nonnull align 8 dereferenceable(176) %7) #17
  ret void
}

; Function Attrs: nounwind
declare void @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev(ptr noundef nonnull align 8 dereferenceable(8), ptr noundef) unnamed_addr #9

; Function Attrs: noinline sspstrong uwtable
define linkonce_odr dso_local void @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC2B7v160006INS_18__default_init_tagESA_EEOT_OT0_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 1 dereferenceable(1) %1, ptr noundef nonnull align 1 dereferenceable(1) %2) unnamed_addr #1 comdat align 2 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca %"struct.std::__1::__default_init_tag.22", align 1
  %8 = alloca %"struct.std::__1::__default_init_tag.22", align 1
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = load ptr, ptr %5, align 8
  call void @_ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EEC2B7v160006ENS_18__default_init_tagE(ptr noundef nonnull align 8 dereferenceable(24) %9)
  %11 = load ptr, ptr %6, align 8
  call void @_ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EEC2B7v160006ENS_18__default_init_tagE(ptr noundef nonnull align 1 dereferenceable(1) %9)
  ret void
}

declare void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEPKcm(ptr noundef nonnull align 8 dereferenceable(24), ptr noundef, i64 noundef) #2

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr dso_local noundef i64 @_ZNSt3__111char_traitsIcE6lengthEPKc(ptr noundef %0) #6 comdat align 2 personality ptr @__gxx_personality_v0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = invoke noundef i64 @_ZNSt3__118__constexpr_strlenB7v160006EPKc(ptr noundef %3)
          to label %5 unwind label %6

5:                                                ; preds = %1
  ret i64 %4

6:                                                ; preds = %1
  %7 = landingpad { ptr, i32 }
          catch ptr null
  %8 = extractvalue { ptr, i32 } %7, 0
  call void @__clang_call_terminate(ptr %8) #20
  unreachable
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden void @_ZNSt3__119__debug_db_insert_cB7v160006INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEvPT_(ptr noundef %0) #6 comdat {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define linkonce_odr hidden void @_ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EEC2B7v160006ENS_18__default_init_tagE(ptr noundef nonnull align 8 dereferenceable(24) %0) unnamed_addr #5 comdat align 2 {
  %2 = alloca %"struct.std::__1::__default_init_tag.22", align 1
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem.19", ptr %4, i32 0, i32 0
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define linkonce_odr hidden void @_ZNSt3__122__compressed_pair_elemINS_9allocatorIcEELi1ELb1EEC2B7v160006ENS_18__default_init_tagE(ptr noundef nonnull align 1 dereferenceable(1) %0) unnamed_addr #5 comdat align 2 {
  %2 = alloca %"struct.std::__1::__default_init_tag.22", align 1
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  call void @_ZNSt3__19allocatorIcEC2B7v160006Ev(ptr noundef nonnull align 1 dereferenceable(1) %4) #17
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define linkonce_odr hidden void @_ZNSt3__19allocatorIcEC2B7v160006Ev(ptr noundef nonnull align 1 dereferenceable(1) %0) unnamed_addr #5 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void @_ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIcEEEC2B7v160006Ev(ptr noundef nonnull align 1 dereferenceable(1) %3) #17
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define linkonce_odr hidden void @_ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIcEEEC2B7v160006Ev(ptr noundef nonnull align 1 dereferenceable(1) %0) unnamed_addr #5 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef i64 @_ZNSt3__118__constexpr_strlenB7v160006EPKc(ptr noundef %0) #6 comdat {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call i64 @strlen(ptr noundef %3) #17
  ret i64 %4
}

; Function Attrs: nounwind
declare i64 @strlen(ptr noundef) #9

; Function Attrs: noinline sspstrong uwtable
define linkonce_odr hidden void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEEC2B7v160006Ev(ptr noundef nonnull align 8 dereferenceable(148) %0) unnamed_addr #1 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void @_ZNSt3__18ios_baseC2B7v160006Ev(ptr noundef nonnull align 8 dereferenceable(136) %3)
  store ptr getelementptr inbounds ({ [4 x ptr] }, ptr @_ZTVNSt3__19basic_iosIcNS_11char_traitsIcEEEE, i32 0, inrange i32 0, i32 2), ptr %3, align 8
  ret void
}

; Function Attrs: noinline sspstrong uwtable
define linkonce_odr hidden void @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEEC2B7v160006EPNS_15basic_streambufIcS2_EE(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef %1, ptr noundef %2) unnamed_addr #1 comdat align 2 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load ptr, ptr %8, align 8
  store ptr %9, ptr %7, align 8
  %10 = getelementptr inbounds ptr, ptr %8, i64 1
  %11 = load ptr, ptr %10, align 8
  %12 = load ptr, ptr %7, align 8
  %13 = getelementptr i8, ptr %12, i64 -24
  %14 = load i64, ptr %13, align 8
  %15 = getelementptr inbounds i8, ptr %7, i64 %14
  store ptr %11, ptr %15, align 8
  %16 = getelementptr inbounds %"class.std::__1::basic_istream.28", ptr %7, i32 0, i32 1
  store i64 0, ptr %16, align 8
  %17 = load ptr, ptr %7, align 8
  %18 = getelementptr i8, ptr %17, i64 -24
  %19 = load i64, ptr %18, align 8
  %20 = getelementptr inbounds i8, ptr %7, i64 %19
  %21 = load ptr, ptr %6, align 8
  call void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEE4initB7v160006EPNS_15basic_streambufIcS2_EE(ptr noundef nonnull align 8 dereferenceable(148) %20, ptr noundef %21)
  ret void
}

; Function Attrs: noinline sspstrong uwtable
define linkonce_odr dso_local void @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEEC2Ev(ptr noundef nonnull align 8 dereferenceable(163) %0) unnamed_addr #1 comdat align 2 personality ptr @__gxx_personality_v0 {
  %2 = alloca ptr, align 8
  %3 = alloca %"class.std::__1::locale.5", align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca %"class.std::__1::locale.5", align 8
  store ptr %0, ptr %2, align 8
  %7 = load ptr, ptr %2, align 8
  call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEEC2Ev(ptr noundef nonnull align 8 dereferenceable(64) %7)
  store ptr getelementptr inbounds ({ [16 x ptr] }, ptr @_ZTVNSt3__113basic_filebufIcNS_11char_traitsIcEEEE, i32 0, inrange i32 0, i32 2), ptr %7, align 8
  %8 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %7, i32 0, i32 1
  store ptr null, ptr %8, align 8
  %9 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %7, i32 0, i32 2
  store ptr null, ptr %9, align 8
  %10 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %7, i32 0, i32 3
  store ptr null, ptr %10, align 8
  %11 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %7, i32 0, i32 5
  store i64 0, ptr %11, align 8
  %12 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %7, i32 0, i32 6
  store ptr null, ptr %12, align 8
  %13 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %7, i32 0, i32 7
  store i64 0, ptr %13, align 8
  %14 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %7, i32 0, i32 8
  store ptr null, ptr %14, align 8
  %15 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %7, i32 0, i32 9
  store ptr null, ptr %15, align 8
  %16 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %7, i32 0, i32 10
  call void @llvm.memset.p0.i64(ptr align 8 %16, i8 0, i64 8, i1 false)
  %17 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %7, i32 0, i32 11
  call void @llvm.memset.p0.i64(ptr align 8 %17, i8 0, i64 8, i1 false)
  %18 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %7, i32 0, i32 12
  store i32 0, ptr %18, align 8
  %19 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %7, i32 0, i32 13
  store i32 0, ptr %19, align 4
  %20 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %7, i32 0, i32 14
  store i8 0, ptr %20, align 8
  %21 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %7, i32 0, i32 15
  store i8 0, ptr %21, align 1
  %22 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %7, i32 0, i32 16
  store i8 0, ptr %22, align 2
  invoke void @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE6getlocB7v160006Ev(ptr sret(%"class.std::__1::locale.5") align 8 %3, ptr noundef nonnull align 8 dereferenceable(64) %7)
          to label %23 unwind label %35

23:                                               ; preds = %1
  %24 = call noundef zeroext i1 @_ZNSt3__19has_facetB7v160006INS_7codecvtIcc11__mbstate_tEEEEbRKNS_6localeE(ptr noundef nonnull align 8 dereferenceable(8) %3) #17
  call void @_ZNSt3__16localeD1Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #17
  br i1 %24, label %25, label %43

25:                                               ; preds = %23
  invoke void @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE6getlocB7v160006Ev(ptr sret(%"class.std::__1::locale.5") align 8 %6, ptr noundef nonnull align 8 dereferenceable(64) %7)
          to label %26 unwind label %35

26:                                               ; preds = %25
  %27 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZNSt3__19use_facetB7v160006INS_7codecvtIcc11__mbstate_tEEEERKT_RKNS_6localeE(ptr noundef nonnull align 8 dereferenceable(8) %6)
          to label %28 unwind label %39

28:                                               ; preds = %26
  %29 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %7, i32 0, i32 9
  store ptr %27, ptr %29, align 8
  call void @_ZNSt3__16localeD1Ev(ptr noundef nonnull align 8 dereferenceable(8) %6) #17
  %30 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %7, i32 0, i32 9
  %31 = load ptr, ptr %30, align 8
  %32 = call noundef zeroext i1 @_ZNKSt3__17codecvtIcc11__mbstate_tE13always_noconvB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %31) #17
  %33 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %7, i32 0, i32 16
  %34 = zext i1 %32 to i8
  store i8 %34, ptr %33, align 2
  br label %43

35:                                               ; preds = %43, %25, %1
  %36 = landingpad { ptr, i32 }
          cleanup
  %37 = extractvalue { ptr, i32 } %36, 0
  store ptr %37, ptr %4, align 8
  %38 = extractvalue { ptr, i32 } %36, 1
  store i32 %38, ptr %5, align 4
  br label %49

39:                                               ; preds = %26
  %40 = landingpad { ptr, i32 }
          cleanup
  %41 = extractvalue { ptr, i32 } %40, 0
  store ptr %41, ptr %4, align 8
  %42 = extractvalue { ptr, i32 } %40, 1
  store i32 %42, ptr %5, align 4
  call void @_ZNSt3__16localeD1Ev(ptr noundef nonnull align 8 dereferenceable(8) %6) #17
  br label %49

43:                                               ; preds = %28, %23
  %44 = load ptr, ptr %7, align 8
  %45 = getelementptr inbounds ptr, ptr %44, i64 3
  %46 = load ptr, ptr %45, align 8
  %47 = invoke noundef ptr %46(ptr noundef nonnull align 8 dereferenceable(163) %7, ptr noundef null, i64 noundef 4096)
          to label %48 unwind label %35

48:                                               ; preds = %43
  ret void

49:                                               ; preds = %39, %35
  call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev(ptr noundef nonnull align 8 dereferenceable(64) %7) #17
  br label %50

50:                                               ; preds = %49
  %51 = load ptr, ptr %4, align 8
  %52 = load i32, ptr %5, align 4
  %53 = insertvalue { ptr, i32 } poison, ptr %51, 0
  %54 = insertvalue { ptr, i32 } %53, i32 %52, 1
  resume { ptr, i32 } %54
}

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr hidden noundef ptr @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE4openERKNS_12basic_stringIcS2_NS_9allocatorIcEEEEj(ptr noundef nonnull align 8 dereferenceable(163) %0, ptr noundef nonnull align 8 dereferenceable(24) %1, i32 noundef %2) #0 comdat align 2 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = call noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5c_strB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %8) #17
  %10 = load i32, ptr %6, align 4
  %11 = call noundef ptr @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE4openEPKcj(ptr noundef nonnull align 8 dereferenceable(163) %7, ptr noundef %9, i32 noundef %10)
  ret ptr %11
}

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr hidden void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateB7v160006Ej(ptr noundef nonnull align 8 dereferenceable(148) %0, i32 noundef %1) #0 comdat align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = load i32, ptr %4, align 4
  call void @_ZNSt3__18ios_base8setstateB7v160006Ej(ptr noundef nonnull align 8 dereferenceable(136) %5, i32 noundef %6)
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define linkonce_odr hidden void @_ZNSt3__18ios_baseC2B7v160006Ev(ptr noundef nonnull align 8 dereferenceable(136) %0) unnamed_addr #5 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  store ptr getelementptr inbounds ({ [4 x ptr] }, ptr @_ZTVNSt3__18ios_baseE, i32 0, inrange i32 0, i32 2), ptr %3, align 8
  ret void
}

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr hidden void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEE4initB7v160006EPNS_15basic_streambufIcS2_EE(ptr noundef nonnull align 8 dereferenceable(148) %0, ptr noundef %1) #0 comdat align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  call void @_ZNSt3__18ios_base4initEPv(ptr noundef nonnull align 8 dereferenceable(136) %5, ptr noundef %6)
  %7 = getelementptr inbounds %"class.std::__1::basic_ios.29", ptr %5, i32 0, i32 1
  store ptr null, ptr %7, align 8
  %8 = call noundef i32 @_ZNSt3__111char_traitsIcE3eofEv() #17
  %9 = getelementptr inbounds %"class.std::__1::basic_ios.29", ptr %5, i32 0, i32 2
  store i32 %8, ptr %9, align 8
  ret void
}

declare void @_ZNSt3__18ios_base4initEPv(ptr noundef nonnull align 8 dereferenceable(136), ptr noundef) #2

declare void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEEC2Ev(ptr noundef nonnull align 8 dereferenceable(64)) unnamed_addr #2

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef zeroext i1 @_ZNSt3__19has_facetB7v160006INS_7codecvtIcc11__mbstate_tEEEEbRKNS_6localeE(ptr noundef nonnull align 8 dereferenceable(8) %0) #6 comdat personality ptr @__gxx_personality_v0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = invoke noundef zeroext i1 @_ZNKSt3__16locale9has_facetERNS0_2idE(ptr noundef nonnull align 8 dereferenceable(8) %3, ptr noundef nonnull align 8 dereferenceable(12) @_ZNSt3__17codecvtIcc11__mbstate_tE2idE)
          to label %5 unwind label %6

5:                                                ; preds = %1
  ret i1 %4

6:                                                ; preds = %1
  %7 = landingpad { ptr, i32 }
          catch ptr null
  %8 = extractvalue { ptr, i32 } %7, 0
  call void @__clang_call_terminate(ptr %8) #20
  unreachable
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden void @_ZNKSt3__115basic_streambufIcNS_11char_traitsIcEEE6getlocB7v160006Ev(ptr noalias sret(%"class.std::__1::locale.5") align 8 %0, ptr noundef nonnull align 8 dereferenceable(64) %1) #6 comdat align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds %"class.std::__1::basic_streambuf.7", ptr %5, i32 0, i32 1
  call void @_ZNSt3__16localeC1ERKS0_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %6) #17
  ret void
}

; Function Attrs: nounwind
declare void @_ZNSt3__16localeD1Ev(ptr noundef nonnull align 8 dereferenceable(8)) unnamed_addr #9

declare noundef zeroext i1 @_ZNKSt3__16locale9has_facetERNS0_2idE(ptr noundef nonnull align 8 dereferenceable(8), ptr noundef nonnull align 8 dereferenceable(12)) #2

; Function Attrs: nounwind
declare void @_ZNSt3__16localeC1ERKS0_(ptr noundef nonnull align 8 dereferenceable(8), ptr noundef nonnull align 8 dereferenceable(8)) unnamed_addr #9

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr dso_local noundef ptr @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE4openEPKcj(ptr noundef nonnull align 8 dereferenceable(163) %0, ptr noundef %1, i32 noundef %2) #0 comdat align 2 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %9 = load ptr, ptr %4, align 8
  store ptr null, ptr %7, align 8
  %10 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %9, i32 0, i32 8
  %11 = load ptr, ptr %10, align 8
  %12 = icmp eq ptr %11, null
  br i1 %12, label %13, label %47

13:                                               ; preds = %3
  %14 = load i32, ptr %6, align 4
  %15 = call noundef ptr @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE15__make_mdstringEj(i32 noundef %14) #17
  store ptr %15, ptr %8, align 8
  %16 = load ptr, ptr %8, align 8
  %17 = icmp ne ptr %16, null
  br i1 %17, label %18, label %46

18:                                               ; preds = %13
  store ptr %9, ptr %7, align 8
  %19 = load ptr, ptr %5, align 8
  %20 = load ptr, ptr %8, align 8
  %21 = call noalias ptr @fopen(ptr noundef %19, ptr noundef %20)
  %22 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %9, i32 0, i32 8
  store ptr %21, ptr %22, align 8
  %23 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %9, i32 0, i32 8
  %24 = load ptr, ptr %23, align 8
  %25 = icmp ne ptr %24, null
  br i1 %25, label %26, label %44

26:                                               ; preds = %18
  %27 = load i32, ptr %6, align 4
  %28 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %9, i32 0, i32 12
  store i32 %27, ptr %28, align 8
  %29 = load i32, ptr %6, align 4
  %30 = and i32 %29, 2
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %43

32:                                               ; preds = %26
  %33 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %9, i32 0, i32 8
  %34 = load ptr, ptr %33, align 8
  %35 = call i32 @fseek(ptr noundef %34, i64 noundef 0, i32 noundef 2)
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %42

37:                                               ; preds = %32
  %38 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %9, i32 0, i32 8
  %39 = load ptr, ptr %38, align 8
  %40 = call i32 @fclose(ptr noundef %39)
  %41 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %9, i32 0, i32 8
  store ptr null, ptr %41, align 8
  store ptr null, ptr %7, align 8
  br label %42

42:                                               ; preds = %37, %32
  br label %43

43:                                               ; preds = %42, %26
  br label %45

44:                                               ; preds = %18
  store ptr null, ptr %7, align 8
  br label %45

45:                                               ; preds = %44, %43
  br label %46

46:                                               ; preds = %45, %13
  br label %47

47:                                               ; preds = %46, %3
  %48 = load ptr, ptr %7, align 8
  ret ptr %48
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5c_strB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #17
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef ptr @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE15__make_mdstringEj(i32 noundef %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = and i32 %4, -3
  switch i32 %5, label %18 [
    i32 16, label %6
    i32 48, label %6
    i32 17, label %7
    i32 1, label %7
    i32 8, label %8
    i32 24, label %9
    i32 56, label %10
    i32 25, label %11
    i32 9, label %11
    i32 20, label %12
    i32 52, label %12
    i32 21, label %13
    i32 5, label %13
    i32 12, label %14
    i32 28, label %15
    i32 60, label %16
    i32 29, label %17
    i32 13, label %17
  ]

6:                                                ; preds = %1, %1
  store ptr @.str.17, ptr %2, align 8
  br label %19

7:                                                ; preds = %1, %1
  store ptr @.str.18, ptr %2, align 8
  br label %19

8:                                                ; preds = %1
  store ptr @.str.19, ptr %2, align 8
  br label %19

9:                                                ; preds = %1
  store ptr @.str.20, ptr %2, align 8
  br label %19

10:                                               ; preds = %1
  store ptr @.str.21, ptr %2, align 8
  br label %19

11:                                               ; preds = %1, %1
  store ptr @.str.22, ptr %2, align 8
  br label %19

12:                                               ; preds = %1, %1
  store ptr @.str.23, ptr %2, align 8
  br label %19

13:                                               ; preds = %1, %1
  store ptr @.str.24, ptr %2, align 8
  br label %19

14:                                               ; preds = %1
  store ptr @.str.25, ptr %2, align 8
  br label %19

15:                                               ; preds = %1
  store ptr @.str.26, ptr %2, align 8
  br label %19

16:                                               ; preds = %1
  store ptr @.str.27, ptr %2, align 8
  br label %19

17:                                               ; preds = %1, %1
  store ptr @.str.28, ptr %2, align 8
  br label %19

18:                                               ; preds = %1
  store ptr null, ptr %2, align 8
  br label %19

19:                                               ; preds = %18, %17, %16, %15, %14, %13, %12, %11, %10, %9, %8, %7, %6
  %20 = load ptr, ptr %2, align 8
  ret ptr %20
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #2

declare i32 @fseek(ptr noundef, i64 noundef, i32 noundef) #2

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #17
  %5 = call noundef ptr @_ZNSt3__112__to_addressB7v160006IKcEEPT_S3_(ptr noundef %4) #17
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef ptr @_ZNSt3__112__to_addressB7v160006IKcEEPT_S3_(ptr noundef %0) #6 comdat {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef zeroext i1 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #17
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = call noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #17
  br label %9

7:                                                ; preds = %1
  %8 = call noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #17
  br label %9

9:                                                ; preds = %7, %5
  %10 = phi ptr [ %6, %5 ], [ %8, %7 ]
  ret ptr %10
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef zeroext i1 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::basic_string.21", ptr %3, i32 0, i32 0
  %5 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #17
  %6 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__rep.18", ptr %5, i32 0, i32 0
  %7 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short.31", ptr %6, i32 0, i32 0
  %8 = load i8, ptr %7, align 8
  %9 = and i8 %8, 1
  %10 = icmp ne i8 %9, 0
  ret i1 %10
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::basic_string.21", ptr %3, i32 0, i32 0
  %5 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #17
  %6 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__rep.18", ptr %5, i32 0, i32 0
  %7 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__long.16", ptr %6, i32 0, i32 2
  %8 = load ptr, ptr %7, align 8
  ret ptr %8
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::basic_string.21", ptr %3, i32 0, i32 0
  %5 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #17
  %6 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__rep.18", ptr %5, i32 0, i32 0
  %7 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short.31", ptr %6, i32 0, i32 2
  %8 = getelementptr inbounds [23 x i8], ptr %7, i64 0, i64 0
  %9 = call noundef ptr @_ZNSt3__114pointer_traitsIPKcE10pointer_toB7v160006ERS1_(ptr noundef nonnull align 1 dereferenceable(1) %8) #17
  ret ptr %9
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #17
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(24) ptr @_ZNKSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem.19", ptr %3, i32 0, i32 0
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef ptr @_ZNSt3__114pointer_traitsIPKcE10pointer_toB7v160006ERS1_(ptr noundef nonnull align 1 dereferenceable(1) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr %3
}

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr hidden void @_ZNSt3__18ios_base8setstateB7v160006Ej(ptr noundef nonnull align 8 dereferenceable(136) %0, i32 noundef %1) #0 comdat align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %"class.std::__1::ios_base.0", ptr %5, i32 0, i32 4
  %7 = load i32, ptr %6, align 8
  %8 = load i32, ptr %4, align 4
  %9 = or i32 %7, %8
  call void @_ZNSt3__18ios_base5clearEj(ptr noundef nonnull align 8 dereferenceable(136) %5, i32 noundef %9)
  ret void
}

declare void @_ZNSt3__18ios_base5clearEj(ptr noundef nonnull align 8 dereferenceable(136), i32 noundef) #2

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef zeroext i1 @_ZNKSt3__113basic_filebufIcNS_11char_traitsIcEEE7is_openEv(ptr noundef nonnull align 8 dereferenceable(163) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::basic_filebuf.10", ptr %3, i32 0, i32 8
  %5 = load ptr, ptr %4, align 8
  %6 = icmp ne ptr %5, null
  ret i1 %6
}

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__124__put_character_sequenceB7v160006IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef %1, i64 noundef %2) #0 comdat personality ptr @__gxx_personality_v0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca %"class.std::__1::basic_ostream<char>::sentry.32", align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca %"class.std::__1::ostreambuf_iterator.33", align 8
  %11 = alloca %"class.std::__1::ostreambuf_iterator.33", align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %12 = load ptr, ptr %4, align 8
  invoke void @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_(ptr noundef nonnull align 8 dereferenceable(16) %7, ptr noundef nonnull align 8 dereferenceable(8) %12)
          to label %13 unwind label %64

13:                                               ; preds = %3
  %14 = invoke noundef zeroext i1 @_ZNKSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentrycvbB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %7)
          to label %15 unwind label %68

15:                                               ; preds = %13
  br i1 %14, label %16, label %84

16:                                               ; preds = %15
  %17 = load ptr, ptr %4, align 8
  call void @_ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC2B7v160006ERNS_13basic_ostreamIcS2_EE(ptr noundef nonnull align 8 dereferenceable(8) %11, ptr noundef nonnull align 8 dereferenceable(8) %17) #17
  %18 = load ptr, ptr %5, align 8
  %19 = load ptr, ptr %4, align 8
  %20 = load ptr, ptr %19, align 8
  %21 = getelementptr i8, ptr %20, i64 -24
  %22 = load i64, ptr %21, align 8
  %23 = getelementptr inbounds i8, ptr %19, i64 %22
  %24 = invoke noundef i32 @_ZNKSt3__18ios_base5flagsB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(136) %23)
          to label %25 unwind label %68

25:                                               ; preds = %16
  %26 = and i32 %24, 176
  %27 = icmp eq i32 %26, 32
  br i1 %27, label %28, label %32

28:                                               ; preds = %25
  %29 = load ptr, ptr %5, align 8
  %30 = load i64, ptr %6, align 8
  %31 = getelementptr inbounds i8, ptr %29, i64 %30
  br label %34

32:                                               ; preds = %25
  %33 = load ptr, ptr %5, align 8
  br label %34

34:                                               ; preds = %32, %28
  %35 = phi ptr [ %31, %28 ], [ %33, %32 ]
  %36 = load ptr, ptr %5, align 8
  %37 = load i64, ptr %6, align 8
  %38 = getelementptr inbounds i8, ptr %36, i64 %37
  %39 = load ptr, ptr %4, align 8
  %40 = load ptr, ptr %39, align 8
  %41 = getelementptr i8, ptr %40, i64 -24
  %42 = load i64, ptr %41, align 8
  %43 = getelementptr inbounds i8, ptr %39, i64 %42
  %44 = load ptr, ptr %4, align 8
  %45 = load ptr, ptr %44, align 8
  %46 = getelementptr i8, ptr %45, i64 -24
  %47 = load i64, ptr %46, align 8
  %48 = getelementptr inbounds i8, ptr %44, i64 %47
  %49 = invoke noundef signext i8 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE4fillB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(148) %48)
          to label %50 unwind label %68

50:                                               ; preds = %34
  %51 = getelementptr inbounds %"class.std::__1::ostreambuf_iterator.33", ptr %11, i32 0, i32 0
  %52 = load ptr, ptr %51, align 8
  %53 = invoke ptr @_ZNSt3__116__pad_and_outputB7v160006IcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_(ptr %52, ptr noundef %18, ptr noundef %35, ptr noundef %38, ptr noundef nonnull align 8 dereferenceable(136) %43, i8 noundef signext %49)
          to label %54 unwind label %68

54:                                               ; preds = %50
  %55 = getelementptr inbounds %"class.std::__1::ostreambuf_iterator.33", ptr %10, i32 0, i32 0
  store ptr %53, ptr %55, align 8
  %56 = call noundef zeroext i1 @_ZNKSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEE6failedB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(8) %10) #17
  br i1 %56, label %57, label %83

57:                                               ; preds = %54
  %58 = load ptr, ptr %4, align 8
  %59 = load ptr, ptr %58, align 8
  %60 = getelementptr i8, ptr %59, i64 -24
  %61 = load i64, ptr %60, align 8
  %62 = getelementptr inbounds i8, ptr %58, i64 %61
  invoke void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateB7v160006Ej(ptr noundef nonnull align 8 dereferenceable(148) %62, i32 noundef 5)
          to label %63 unwind label %68

63:                                               ; preds = %57
  br label %83

64:                                               ; preds = %3
  %65 = landingpad { ptr, i32 }
          catch ptr null
  %66 = extractvalue { ptr, i32 } %65, 0
  store ptr %66, ptr %8, align 8
  %67 = extractvalue { ptr, i32 } %65, 1
  store i32 %67, ptr %9, align 4
  br label %72

68:                                               ; preds = %57, %50, %34, %16, %13
  %69 = landingpad { ptr, i32 }
          catch ptr null
  %70 = extractvalue { ptr, i32 } %69, 0
  store ptr %70, ptr %8, align 8
  %71 = extractvalue { ptr, i32 } %69, 1
  store i32 %71, ptr %9, align 4
  call void @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %7) #17
  br label %72

72:                                               ; preds = %68, %64
  %73 = load ptr, ptr %8, align 8
  %74 = call ptr @__cxa_begin_catch(ptr %73) #17
  %75 = load ptr, ptr %4, align 8
  %76 = load ptr, ptr %75, align 8
  %77 = getelementptr i8, ptr %76, i64 -24
  %78 = load i64, ptr %77, align 8
  %79 = getelementptr inbounds i8, ptr %75, i64 %78
  invoke void @_ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv(ptr noundef nonnull align 8 dereferenceable(136) %79)
          to label %80 unwind label %85

80:                                               ; preds = %72
  call void @__cxa_end_catch()
  br label %81

81:                                               ; preds = %80, %84
  %82 = load ptr, ptr %4, align 8
  ret ptr %82

83:                                               ; preds = %63, %54
  br label %84

84:                                               ; preds = %83, %15
  call void @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %7) #17
  br label %81

85:                                               ; preds = %72
  %86 = landingpad { ptr, i32 }
          cleanup
  %87 = extractvalue { ptr, i32 } %86, 0
  store ptr %87, ptr %8, align 8
  %88 = extractvalue { ptr, i32 } %86, 1
  store i32 %88, ptr %9, align 4
  invoke void @__cxa_end_catch()
          to label %89 unwind label %95

89:                                               ; preds = %85
  br label %90

90:                                               ; preds = %89
  %91 = load ptr, ptr %8, align 8
  %92 = load i32, ptr %9, align 4
  %93 = insertvalue { ptr, i32 } poison, ptr %91, 0
  %94 = insertvalue { ptr, i32 } %93, i32 %92, 1
  resume { ptr, i32 } %94

95:                                               ; preds = %85
  %96 = landingpad { ptr, i32 }
          catch ptr null
  %97 = extractvalue { ptr, i32 } %96, 0
  call void @__clang_call_terminate(ptr %97) #20
  unreachable
}

declare void @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_(ptr noundef nonnull align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(8)) unnamed_addr #2

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef zeroext i1 @_ZNKSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentrycvbB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::basic_ostream<char>::sentry.32", ptr %3, i32 0, i32 0
  %5 = load i8, ptr %4, align 8
  %6 = trunc i8 %5 to i1
  ret i1 %6
}

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr hidden ptr @_ZNSt3__116__pad_and_outputB7v160006IcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_(ptr %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef nonnull align 8 dereferenceable(136) %4, i8 noundef signext %5) #0 comdat personality ptr @__gxx_personality_v0 {
  %7 = alloca %"class.std::__1::ostreambuf_iterator.33", align 8
  %8 = alloca %"class.std::__1::ostreambuf_iterator.33", align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i8, align 1
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  %17 = alloca %"class.std::__1::basic_string.21", align 8
  %18 = alloca ptr, align 8
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = getelementptr inbounds %"class.std::__1::ostreambuf_iterator.33", ptr %8, i32 0, i32 0
  store ptr %0, ptr %21, align 8
  store ptr %1, ptr %9, align 8
  store ptr %2, ptr %10, align 8
  store ptr %3, ptr %11, align 8
  store ptr %4, ptr %12, align 8
  store i8 %5, ptr %13, align 1
  %22 = getelementptr inbounds %"class.std::__1::ostreambuf_iterator.33", ptr %8, i32 0, i32 0
  %23 = load ptr, ptr %22, align 8
  %24 = icmp eq ptr %23, null
  br i1 %24, label %25, label %26

25:                                               ; preds = %6
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %7, ptr align 8 %8, i64 8, i1 false)
  br label %107

26:                                               ; preds = %6
  %27 = load ptr, ptr %11, align 8
  %28 = load ptr, ptr %9, align 8
  %29 = ptrtoint ptr %27 to i64
  %30 = ptrtoint ptr %28 to i64
  %31 = sub i64 %29, %30
  store i64 %31, ptr %14, align 8
  %32 = load ptr, ptr %12, align 8
  %33 = call noundef i64 @_ZNKSt3__18ios_base5widthB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(136) %32)
  store i64 %33, ptr %15, align 8
  %34 = load i64, ptr %15, align 8
  %35 = load i64, ptr %14, align 8
  %36 = icmp sgt i64 %34, %35
  br i1 %36, label %37, label %41

37:                                               ; preds = %26
  %38 = load i64, ptr %14, align 8
  %39 = load i64, ptr %15, align 8
  %40 = sub nsw i64 %39, %38
  store i64 %40, ptr %15, align 8
  br label %42

41:                                               ; preds = %26
  store i64 0, ptr %15, align 8
  br label %42

42:                                               ; preds = %41, %37
  %43 = load ptr, ptr %10, align 8
  %44 = load ptr, ptr %9, align 8
  %45 = ptrtoint ptr %43 to i64
  %46 = ptrtoint ptr %44 to i64
  %47 = sub i64 %45, %46
  store i64 %47, ptr %16, align 8
  %48 = load i64, ptr %16, align 8
  %49 = icmp sgt i64 %48, 0
  br i1 %49, label %50, label %61

50:                                               ; preds = %42
  %51 = getelementptr inbounds %"class.std::__1::ostreambuf_iterator.33", ptr %8, i32 0, i32 0
  %52 = load ptr, ptr %51, align 8
  %53 = load ptr, ptr %9, align 8
  %54 = load i64, ptr %16, align 8
  %55 = call noundef i64 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnB7v160006EPKcl(ptr noundef nonnull align 8 dereferenceable(64) %52, ptr noundef %53, i64 noundef %54)
  %56 = load i64, ptr %16, align 8
  %57 = icmp ne i64 %55, %56
  br i1 %57, label %58, label %60

58:                                               ; preds = %50
  %59 = getelementptr inbounds %"class.std::__1::ostreambuf_iterator.33", ptr %8, i32 0, i32 0
  store ptr null, ptr %59, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %7, ptr align 8 %8, i64 8, i1 false)
  br label %107

60:                                               ; preds = %50
  br label %61

61:                                               ; preds = %60, %42
  %62 = load i64, ptr %15, align 8
  %63 = icmp sgt i64 %62, 0
  br i1 %63, label %64, label %85

64:                                               ; preds = %61
  %65 = load i64, ptr %15, align 8
  %66 = load i8, ptr %13, align 1
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B7v160006Emc(ptr noundef nonnull align 8 dereferenceable(24) %17, i64 noundef %65, i8 noundef signext %66)
  %67 = getelementptr inbounds %"class.std::__1::ostreambuf_iterator.33", ptr %8, i32 0, i32 0
  %68 = load ptr, ptr %67, align 8
  %69 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %17) #17
  %70 = load i64, ptr %15, align 8
  %71 = invoke noundef i64 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnB7v160006EPKcl(ptr noundef nonnull align 8 dereferenceable(64) %68, ptr noundef %69, i64 noundef %70)
          to label %72 unwind label %77

72:                                               ; preds = %64
  %73 = load i64, ptr %15, align 8
  %74 = icmp ne i64 %71, %73
  br i1 %74, label %75, label %81

75:                                               ; preds = %72
  %76 = getelementptr inbounds %"class.std::__1::ostreambuf_iterator.33", ptr %8, i32 0, i32 0
  store ptr null, ptr %76, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %7, ptr align 8 %8, i64 8, i1 false)
  store i32 1, ptr %20, align 4
  br label %82

77:                                               ; preds = %64
  %78 = landingpad { ptr, i32 }
          cleanup
  %79 = extractvalue { ptr, i32 } %78, 0
  store ptr %79, ptr %18, align 8
  %80 = extractvalue { ptr, i32 } %78, 1
  store i32 %80, ptr %19, align 4
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %17) #17
  br label %110

81:                                               ; preds = %72
  store i32 0, ptr %20, align 4
  br label %82

82:                                               ; preds = %81, %75
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %17) #17
  %83 = load i32, ptr %20, align 4
  switch i32 %83, label %115 [
    i32 0, label %84
    i32 1, label %107
  ]

84:                                               ; preds = %82
  br label %85

85:                                               ; preds = %84, %61
  %86 = load ptr, ptr %11, align 8
  %87 = load ptr, ptr %10, align 8
  %88 = ptrtoint ptr %86 to i64
  %89 = ptrtoint ptr %87 to i64
  %90 = sub i64 %88, %89
  store i64 %90, ptr %16, align 8
  %91 = load i64, ptr %16, align 8
  %92 = icmp sgt i64 %91, 0
  br i1 %92, label %93, label %104

93:                                               ; preds = %85
  %94 = getelementptr inbounds %"class.std::__1::ostreambuf_iterator.33", ptr %8, i32 0, i32 0
  %95 = load ptr, ptr %94, align 8
  %96 = load ptr, ptr %10, align 8
  %97 = load i64, ptr %16, align 8
  %98 = call noundef i64 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnB7v160006EPKcl(ptr noundef nonnull align 8 dereferenceable(64) %95, ptr noundef %96, i64 noundef %97)
  %99 = load i64, ptr %16, align 8
  %100 = icmp ne i64 %98, %99
  br i1 %100, label %101, label %103

101:                                              ; preds = %93
  %102 = getelementptr inbounds %"class.std::__1::ostreambuf_iterator.33", ptr %8, i32 0, i32 0
  store ptr null, ptr %102, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %7, ptr align 8 %8, i64 8, i1 false)
  br label %107

103:                                              ; preds = %93
  br label %104

104:                                              ; preds = %103, %85
  %105 = load ptr, ptr %12, align 8
  %106 = call noundef i64 @_ZNSt3__18ios_base5widthB7v160006El(ptr noundef nonnull align 8 dereferenceable(136) %105, i64 noundef 0)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %7, ptr align 8 %8, i64 8, i1 false)
  br label %107

107:                                              ; preds = %104, %101, %82, %58, %25
  %108 = getelementptr inbounds %"class.std::__1::ostreambuf_iterator.33", ptr %7, i32 0, i32 0
  %109 = load ptr, ptr %108, align 8
  ret ptr %109

110:                                              ; preds = %77
  %111 = load ptr, ptr %18, align 8
  %112 = load i32, ptr %19, align 4
  %113 = insertvalue { ptr, i32 } poison, ptr %111, 0
  %114 = insertvalue { ptr, i32 } %113, i32 %112, 1
  resume { ptr, i32 } %114

115:                                              ; preds = %82
  unreachable
}

; Function Attrs: noinline nounwind sspstrong uwtable
define linkonce_odr hidden void @_ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC2B7v160006ERNS_13basic_ostreamIcS2_EE(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) unnamed_addr #5 comdat align 2 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %"class.std::__1::ostreambuf_iterator.33", ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %7, align 8
  %9 = getelementptr i8, ptr %8, i64 -24
  %10 = load i64, ptr %9, align 8
  %11 = getelementptr inbounds i8, ptr %7, i64 %10
  %12 = invoke noundef ptr @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5rdbufB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(148) %11)
          to label %13 unwind label %14

13:                                               ; preds = %2
  store ptr %12, ptr %6, align 8
  ret void

14:                                               ; preds = %2
  %15 = landingpad { ptr, i32 }
          catch ptr null
  %16 = extractvalue { ptr, i32 } %15, 0
  call void @__clang_call_terminate(ptr %16) #20
  unreachable
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef i32 @_ZNKSt3__18ios_base5flagsB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(136) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::ios_base.0", ptr %3, i32 0, i32 1
  %5 = load i32, ptr %4, align 8
  ret i32 %5
}

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr hidden noundef signext i8 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE4fillB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(148) %0) #0 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef i32 @_ZNSt3__111char_traitsIcE3eofEv() #17
  %5 = getelementptr inbounds %"class.std::__1::basic_ios.29", ptr %3, i32 0, i32 2
  %6 = load i32, ptr %5, align 8
  %7 = call noundef zeroext i1 @_ZNSt3__111char_traitsIcE11eq_int_typeEii(i32 noundef %4, i32 noundef %6) #17
  br i1 %7, label %8, label %12

8:                                                ; preds = %1
  %9 = call noundef signext i8 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenB7v160006Ec(ptr noundef nonnull align 8 dereferenceable(148) %3, i8 noundef signext 32)
  %10 = sext i8 %9 to i32
  %11 = getelementptr inbounds %"class.std::__1::basic_ios.29", ptr %3, i32 0, i32 2
  store i32 %10, ptr %11, align 8
  br label %12

12:                                               ; preds = %8, %1
  %13 = getelementptr inbounds %"class.std::__1::basic_ios.29", ptr %3, i32 0, i32 2
  %14 = load i32, ptr %13, align 8
  %15 = trunc i32 %14 to i8
  ret i8 %15
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef zeroext i1 @_ZNKSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEE6failedB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::ostreambuf_iterator.33", ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  %6 = icmp eq ptr %5, null
  ret i1 %6
}

; Function Attrs: nounwind
declare void @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev(ptr noundef nonnull align 8 dereferenceable(16)) unnamed_addr #9

declare void @_ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv(ptr noundef nonnull align 8 dereferenceable(136)) #2

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef i64 @_ZNKSt3__18ios_base5widthB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(136) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::ios_base.0", ptr %3, i32 0, i32 3
  %5 = load i64, ptr %4, align 8
  ret i64 %5
}

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr hidden noundef i64 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnB7v160006EPKcl(ptr noundef nonnull align 8 dereferenceable(64) %0, ptr noundef %1, i64 noundef %2) #0 comdat align 2 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load i64, ptr %6, align 8
  %10 = load ptr, ptr %7, align 8
  %11 = getelementptr inbounds ptr, ptr %10, i64 12
  %12 = load ptr, ptr %11, align 8
  %13 = call noundef i64 %12(ptr noundef nonnull align 8 dereferenceable(64) %7, ptr noundef %8, i64 noundef %9)
  ret i64 %13
}

; Function Attrs: noinline sspstrong uwtable
define linkonce_odr hidden void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B7v160006Emc(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1, i8 noundef signext %2) unnamed_addr #1 comdat align 2 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8, align 1
  %7 = alloca %"struct.std::__1::__default_init_tag.22", align 1
  %8 = alloca %"struct.std::__1::__default_init_tag.22", align 1
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store i8 %2, ptr %6, align 1
  %9 = load ptr, ptr %4, align 8
  %10 = getelementptr inbounds %"class.std::__1::basic_string.21", ptr %9, i32 0, i32 0
  call void @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EC2B7v160006INS_18__default_init_tagESA_EEOT_OT0_(ptr noundef nonnull align 8 dereferenceable(24) %10, ptr noundef nonnull align 1 dereferenceable(1) %7, ptr noundef nonnull align 1 dereferenceable(1) %8)
  %11 = load i64, ptr %5, align 8
  %12 = load i8, ptr %6, align 1
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEmc(ptr noundef nonnull align 8 dereferenceable(24) %9, i64 noundef %11, i8 noundef signext %12)
  call void @_ZNSt3__119__debug_db_insert_cB7v160006INS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEvPT_(ptr noundef %9)
  ret void
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #17
  %5 = call noundef ptr @_ZNSt3__112__to_addressB7v160006IcEEPT_S2_(ptr noundef %4) #17
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef i64 @_ZNSt3__18ios_base5widthB7v160006El(ptr noundef nonnull align 8 dereferenceable(136) %0, i64 noundef %1) #6 comdat align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds %"class.std::__1::ios_base.0", ptr %6, i32 0, i32 3
  %8 = load i64, ptr %7, align 8
  store i64 %8, ptr %5, align 8
  %9 = load i64, ptr %4, align 8
  %10 = getelementptr inbounds %"class.std::__1::ios_base.0", ptr %6, i32 0, i32 3
  store i64 %9, ptr %10, align 8
  %11 = load i64, ptr %5, align 8
  ret i64 %11
}

declare void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEmc(ptr noundef nonnull align 8 dereferenceable(24), i64 noundef, i8 noundef signext) #2

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef ptr @_ZNSt3__112__to_addressB7v160006IcEEPT_S2_(ptr noundef %0) #6 comdat {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef zeroext i1 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #17
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #17
  br label %9

7:                                                ; preds = %1
  %8 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #17
  br label %9

9:                                                ; preds = %7, %5
  %10 = phi ptr [ %6, %5 ], [ %8, %7 ]
  ret ptr %10
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::basic_string.21", ptr %3, i32 0, i32 0
  %5 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #17
  %6 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__rep.18", ptr %5, i32 0, i32 0
  %7 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__long.16", ptr %6, i32 0, i32 2
  %8 = load ptr, ptr %7, align 8
  ret ptr %8
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::basic_string.21", ptr %3, i32 0, i32 0
  %5 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #17
  %6 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__rep.18", ptr %5, i32 0, i32 0
  %7 = getelementptr inbounds %"struct.std::__1::basic_string<char>::__short.31", ptr %6, i32 0, i32 2
  %8 = getelementptr inbounds [23 x i8], ptr %7, i64 0, i64 0
  %9 = call noundef ptr @_ZNSt3__114pointer_traitsIPcE10pointer_toB7v160006ERc(ptr noundef nonnull align 1 dereferenceable(1) %8) #17
  ret ptr %9
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_E5firstB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #17
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(24) ptr @_ZNSt3__122__compressed_pair_elemINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repELi0ELb0EE5__getB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::__1::__compressed_pair_elem.19", ptr %3, i32 0, i32 0
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef ptr @_ZNSt3__114pointer_traitsIPcE10pointer_toB7v160006ERc(ptr noundef nonnull align 1 dereferenceable(1) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr %3
}

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr hidden noundef ptr @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5rdbufB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(148) %0) #0 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZNKSt3__18ios_base5rdbufB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(136) %3)
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef ptr @_ZNKSt3__18ios_base5rdbufB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(136) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::ios_base.0", ptr %3, i32 0, i32 6
  %5 = load ptr, ptr %4, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr hidden noundef signext i8 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenB7v160006Ec(ptr noundef nonnull align 8 dereferenceable(148) %0, i8 noundef signext %1) #0 comdat align 2 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca i8, align 1
  %5 = alloca %"class.std::__1::locale.5", align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i8 %1, ptr %4, align 1
  %8 = load ptr, ptr %3, align 8
  call void @_ZNKSt3__18ios_base6getlocEv(ptr sret(%"class.std::__1::locale.5") align 8 %5, ptr noundef nonnull align 8 dereferenceable(136) %8)
  %9 = invoke noundef nonnull align 8 dereferenceable(25) ptr @_ZNSt3__19use_facetB7v160006INS_5ctypeIcEEEERKT_RKNS_6localeE(ptr noundef nonnull align 8 dereferenceable(8) %5)
          to label %10 unwind label %14

10:                                               ; preds = %2
  %11 = load i8, ptr %4, align 1
  %12 = invoke noundef signext i8 @_ZNKSt3__15ctypeIcE5widenB7v160006Ec(ptr noundef nonnull align 8 dereferenceable(25) %9, i8 noundef signext %11)
          to label %13 unwind label %14

13:                                               ; preds = %10
  call void @_ZNSt3__16localeD1Ev(ptr noundef nonnull align 8 dereferenceable(8) %5) #17
  ret i8 %12

14:                                               ; preds = %10, %2
  %15 = landingpad { ptr, i32 }
          cleanup
  %16 = extractvalue { ptr, i32 } %15, 0
  store ptr %16, ptr %6, align 8
  %17 = extractvalue { ptr, i32 } %15, 1
  store i32 %17, ptr %7, align 4
  call void @_ZNSt3__16localeD1Ev(ptr noundef nonnull align 8 dereferenceable(8) %5) #17
  br label %18

18:                                               ; preds = %14
  %19 = load ptr, ptr %6, align 8
  %20 = load i32, ptr %7, align 4
  %21 = insertvalue { ptr, i32 } poison, ptr %19, 0
  %22 = insertvalue { ptr, i32 } %21, i32 %20, 1
  resume { ptr, i32 } %22
}

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(25) ptr @_ZNSt3__19use_facetB7v160006INS_5ctypeIcEEEERKT_RKNS_6localeE(ptr noundef nonnull align 8 dereferenceable(8) %0) #0 comdat {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZNKSt3__16locale9use_facetERNS0_2idE(ptr noundef nonnull align 8 dereferenceable(8) %3, ptr noundef nonnull align 8 dereferenceable(12) @_ZNSt3__15ctypeIcE2idE)
  ret ptr %4
}

declare void @_ZNKSt3__18ios_base6getlocEv(ptr sret(%"class.std::__1::locale.5") align 8, ptr noundef nonnull align 8 dereferenceable(136)) #2

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr hidden noundef signext i8 @_ZNKSt3__15ctypeIcE5widenB7v160006Ec(ptr noundef nonnull align 8 dereferenceable(25) %0, i8 noundef signext %1) #0 comdat align 2 {
  %3 = alloca ptr, align 8
  %4 = alloca i8, align 1
  store ptr %0, ptr %3, align 8
  store i8 %1, ptr %4, align 1
  %5 = load ptr, ptr %3, align 8
  %6 = load i8, ptr %4, align 1
  %7 = load ptr, ptr %5, align 8
  %8 = getelementptr inbounds ptr, ptr %7, i64 7
  %9 = load ptr, ptr %8, align 8
  %10 = call noundef signext i8 %9(ptr noundef nonnull align 8 dereferenceable(25) %5, i8 noundef signext %6)
  ret i8 %10
}

declare noundef i32 @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEE3getEv(ptr noundef nonnull align 8 dereferenceable(16)) #2

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr hidden noundef zeroext i1 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE4failB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(148) %0) #0 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef zeroext i1 @_ZNKSt3__18ios_base4failB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(136) %3)
  ret i1 %4
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr hidden noundef zeroext i1 @_ZNKSt3__18ios_base4failB7v160006Ev(ptr noundef nonnull align 8 dereferenceable(136) %0) #6 comdat align 2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__1::ios_base.0", ptr %3, i32 0, i32 4
  %5 = load i32, ptr %4, align 8
  %6 = and i32 %5, 5
  %7 = icmp ne i32 %6, 0
  ret i1 %7
}

; Function Attrs: noinline sspstrong uwtable
define linkonce_odr hidden void @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEEC2B7v160006EPNS_15basic_streambufIcS2_EE(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef %1, ptr noundef %2) unnamed_addr #1 comdat align 2 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load ptr, ptr %8, align 8
  store ptr %9, ptr %7, align 8
  %10 = getelementptr inbounds ptr, ptr %8, i64 1
  %11 = load ptr, ptr %10, align 8
  %12 = load ptr, ptr %7, align 8
  %13 = getelementptr i8, ptr %12, i64 -24
  %14 = load i64, ptr %13, align 8
  %15 = getelementptr inbounds i8, ptr %7, i64 %14
  store ptr %11, ptr %15, align 8
  %16 = load ptr, ptr %7, align 8
  %17 = getelementptr i8, ptr %16, i64 -24
  %18 = load i64, ptr %17, align 8
  %19 = getelementptr inbounds i8, ptr %7, i64 %18
  %20 = load ptr, ptr %6, align 8
  call void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEE4initB7v160006EPNS_15basic_streambufIcS2_EE(ptr noundef nonnull align 8 dereferenceable(148) %19, ptr noundef %20)
  ret void
}

declare i32 @cudaMalloc(ptr noundef, i64 noundef) #2

attributes #0 = { mustprogress noinline sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { noinline sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nobuiltin allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { noinline norecurse sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #9 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nocallback nofree nosync nounwind willreturn }
attributes #11 = { nobuiltin nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { mustprogress noinline norecurse sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #13 = { noinline noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #14 = { mustprogress noinline noreturn sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #15 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #16 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #17 = { nounwind }
attributes #18 = { builtin allocsize(0) }
attributes #19 = { builtin nounwind }
attributes #20 = { noreturn nounwind }
attributes #21 = { noreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5}
!llvm.linker.options = !{}
!llvm.ident = !{!6}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 11, i32 7]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = !{!"clang version 16.0.6"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = distinct !{!9, !8}
!10 = distinct !{!10, !8}
!11 = distinct !{!11, !8}
!12 = distinct !{!12, !8}
!13 = distinct !{!13, !8}
!14 = distinct !{!14, !8}
!15 = distinct !{!15, !8}
!16 = distinct !{!16, !8}
!17 = distinct !{!17, !8}
