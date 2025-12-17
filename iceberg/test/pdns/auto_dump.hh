
#include <unordered_map>
#include <set>
#include <cstdio>
#include <cstdint>
#include <signal.h>
#include <setjmp.h>
#include <elfio/elfio.hpp>

static FILE *f;
static sigjmp_buf jbuf;
static std::unordered_map<uint64_t, std::string> addr2name;
static std::unordered_map<std::string, uint64_t> name2addr;
static std::set<std::tuple<uint64_t, uint64_t>> dumped;
static ELFIO::elfio reader;
static uint64_t offset;

static void
deref_handler(int s) {
	if (s == SIGSEGV) {
		sigset_t sigset;
		sigemptyset(&sigset);
		sigaddset(&sigset, SIGSEGV);
		sigprocmask(SIG_UNBLOCK, &sigset, NULL); // Unblock SIGSEGV
		siglongjmp(jbuf, 1);
	}
}

int8_t __deref_error = 0;

static int
deref_error(const char *p) {
	static int installed = 0;
	if (!installed) {
		struct sigaction sa;
		sa.sa_handler = deref_handler;
		sigemptyset(&sa.sa_mask);
		sa.sa_flags = SA_RESTART; // Optionally use SA_SIGINFO for more
					  // detailed signal information
		sigaction(SIGSEGV, &sa, NULL);
		installed = 1;
	}

	if (!sigsetjmp(jbuf, 1)) { // Save the current signal mask
		__deref_error = *(int8_t *)(p);
		return 0;
	}
	return -1; // Error
}

static void
dump_start();

static void
dump_end();

static std::unordered_map<std::string, void(*)(const char *, int)> polydump;

static void
dump_polymorphic(const char *, int);

static void dump_anon_0x133e0c2a0(const char *p, int rep) ;

static void dump_class_BB2DomainInfo(const char *p, int rep) ;

static void dump_union_ComboAddress(const char *p, int rep) ;

static void dump__struct_boost__multi_index__detail__hashed_index_base_node_impl_(const char *p, int rep) ;

static void dump_class_LuaContext(const char *p, int rep) ;

static void dump_class_Bind2Backend(const char *p, int rep) ;

static void dump__struct_boost__multi_index__detail__ordered_index_node_impl_(const char *p, int rep) ;

static void dump_class_UeberBackend(const char *p, int rep) ;

static void dump_struct_lua_State(const char *p, int rep) ;

static void dump_anon_0x133e09480(const char *p, int rep) ;

static void dump_struct_DNSZoneRecord(const char *p, int rep) ;

static void dump_class_PDNSException(const char *p, int rep) ;

static void dump__struct_boost__multi_index__detail__hashed_index_node_530_(const char *p, int rep) ;

static void dump__struct_boost__multi_index__detail__hashed_index_node_impl_(const char *p, int rep) ;

static void dump__class_std___Sp_counted_base_(const char *p, int rep) ;

static void dump__struct_std__pair_2661_(const char *p, int rep) ;

static void dump__class_std__basic_ostream_base_(const char *p, int rep) ;

static void dump_class_DNSPacket(const char *p, int rep) ;

static void dump_class_AuthLua4_3473(const char *p, int rep) ;

static void dump_class_PacketHandler_3481(const char *p, int rep) ;

static void dump__class_boost__multi_index__multi_index_container_20_(const char *p, int rep) ;

static void dump_class_DNSBackend(const char *p, int rep) ;

static void dump__struct_boost__multi_index__detail__ordered_index_node_26_(const char *p, int rep) ;

static void dump_struct_Bind2DNSRecordExt(const char *p, int rep) ;

static void dump__class_std__basic_ofstream_(const char *p, int rep) ;

static void dump_anon_0x133e0c2a0(const char *p, int rep) {
    if (dumped.find({(uint64_t)p, (uint64_t)dump_anon_0x133e0c2a0}) != dumped.end()) return;
    dumped.insert({(uint64_t)p, (uint64_t)dump_anon_0x133e0c2a0});
    fprintf(f, "\"%p\": {\n", p);
    int r = 0;
again:
    if (r >= rep) goto exit;
    fprintf(f, "\t\"%d\": \"%p\",\n", 0+r*8, *(const char **)(p+0+r*8));
    r++; goto again;
exit:
    assert(rep >= 0);
    fprintf(f, "\t\"__size__\": %d\n},\n", 8 * rep);
}

static void dump_class_BB2DomainInfo(const char *p, int rep) {
    int len; int size = 0;
    if (dumped.find({(uint64_t)p, (uint64_t)dump_class_BB2DomainInfo}) != dumped.end()) return;
    dumped.insert({(uint64_t)p, (uint64_t)dump_class_BB2DomainInfo});
    fprintf(f, "\"%p\": {\n", p);
    int r = 0;
self_start:
    if (r >= rep) goto self_end;
    fprintf(f, "\t\"%d\": \"%p\",\n", 0+r*280, *(const char **)(p+0+r*280));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 8+r*280,  *(int64_t *)(p+8+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 16+r*280,  *(int8_t *)(p+16+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 17+r*280,  *(int8_t *)(p+17+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 18+r*280,  *(int8_t *)(p+18+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 19+r*280,  *(int8_t *)(p+19+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 20+r*280,  *(int8_t *)(p+20+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 21+r*280,  *(int8_t *)(p+21+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 22+r*280,  *(int8_t *)(p+22+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 23+r*280,  *(int8_t *)(p+23+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 24+r*280,  *(int8_t *)(p+24+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 25+r*280,  *(int8_t *)(p+25+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 26+r*280,  *(int8_t *)(p+26+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 27+r*280,  *(int8_t *)(p+27+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 28+r*280,  *(int8_t *)(p+28+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 29+r*280,  *(int8_t *)(p+29+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 30+r*280,  *(int8_t *)(p+30+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 31+r*280,  *(int8_t *)(p+31+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 32+r*280,  *(int8_t *)(p+32+r*280));
    fprintf(f, "\t\"%d\": \"%p\",\n", 40+r*280, *(const char **)(p+40+r*280));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 48+r*280,  *(int64_t *)(p+48+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 56+r*280,  *(int8_t *)(p+56+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 57+r*280,  *(int8_t *)(p+57+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 58+r*280,  *(int8_t *)(p+58+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 59+r*280,  *(int8_t *)(p+59+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 60+r*280,  *(int8_t *)(p+60+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 61+r*280,  *(int8_t *)(p+61+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 62+r*280,  *(int8_t *)(p+62+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 63+r*280,  *(int8_t *)(p+63+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 64+r*280,  *(int8_t *)(p+64+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 65+r*280,  *(int8_t *)(p+65+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 66+r*280,  *(int8_t *)(p+66+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 67+r*280,  *(int8_t *)(p+67+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 68+r*280,  *(int8_t *)(p+68+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 69+r*280,  *(int8_t *)(p+69+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 70+r*280,  *(int8_t *)(p+70+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 71+r*280,  *(int8_t *)(p+71+r*280));
    fprintf(f, "\t\"%d\": \"%p\",\n", 72+r*280, *(const char **)(p+72+r*280));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 80+r*280,  *(int64_t *)(p+80+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 88+r*280,  *(int8_t *)(p+88+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 89+r*280,  *(int8_t *)(p+89+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 90+r*280,  *(int8_t *)(p+90+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 91+r*280,  *(int8_t *)(p+91+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 92+r*280,  *(int8_t *)(p+92+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 93+r*280,  *(int8_t *)(p+93+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 94+r*280,  *(int8_t *)(p+94+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 95+r*280,  *(int8_t *)(p+95+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 96+r*280,  *(int8_t *)(p+96+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 97+r*280,  *(int8_t *)(p+97+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 98+r*280,  *(int8_t *)(p+98+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 99+r*280,  *(int8_t *)(p+99+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 100+r*280,  *(int8_t *)(p+100+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 101+r*280,  *(int8_t *)(p+101+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 102+r*280,  *(int8_t *)(p+102+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 103+r*280,  *(int8_t *)(p+103+r*280));
    fprintf(f, "\t\"%d\": \"%p\",\n", 104+r*280, *(const char **)(p+104+r*280));
    fprintf(f, "\t\"%d\": \"%p\",\n", 112+r*280, *(const char **)(p+112+r*280));
    fprintf(f, "\t\"%d\": \"%p\",\n", 120+r*280, *(const char **)(p+120+r*280));
    fprintf(f, "\t\"%d\": \"%p\",\n", 176+r*280, *(const char **)(p+176+r*280));
    fprintf(f, "\t\"%d\": \"%p\",\n", 184+r*280, *(const char **)(p+184+r*280));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 192+r*280,  *(int64_t *)(p+192+r*280));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 200+r*280,  *(int64_t *)(p+200+r*280));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 208+r*280,  *(int32_t *)(p+208+r*280));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 212+r*280,  *(int32_t *)(p+212+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 216+r*280,  *(int8_t *)(p+216+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 217+r*280,  *(int8_t *)(p+217+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 218+r*280,  *(int8_t *)(p+218+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 219+r*280,  *(int8_t *)(p+219+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 232+r*280,  *(int8_t *)(p+232+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 233+r*280,  *(int8_t *)(p+233+r*280));
    fprintf(f, "\t\"%d\": [ %d, 2 ],\n", 234+r*280,  *(int16_t *)(p+234+r*280));
    fprintf(f, "\t\"%d\": \"%p\",\n", 240+r*280, *(const char **)(p+240+r*280));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 248+r*280,  *(int64_t *)(p+248+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 256+r*280,  *(int8_t *)(p+256+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 257+r*280,  *(int8_t *)(p+257+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 258+r*280,  *(int8_t *)(p+258+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 259+r*280,  *(int8_t *)(p+259+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 260+r*280,  *(int8_t *)(p+260+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 261+r*280,  *(int8_t *)(p+261+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 262+r*280,  *(int8_t *)(p+262+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 263+r*280,  *(int8_t *)(p+263+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 264+r*280,  *(int8_t *)(p+264+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 265+r*280,  *(int8_t *)(p+265+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 266+r*280,  *(int8_t *)(p+266+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 267+r*280,  *(int8_t *)(p+267+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 268+r*280,  *(int8_t *)(p+268+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 269+r*280,  *(int8_t *)(p+269+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 270+r*280,  *(int8_t *)(p+270+r*280));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 271+r*280,  *(int8_t *)(p+271+r*280));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 272+r*280,  *(int64_t *)(p+272+r*280));
    r++; 
    size += 280;
    goto self_start;
self_end:
    fprintf(f, "\t\"__size__\": %d,\n\t\"__type__\": \"%%class.BB2DomainInfo\"},\n", size);
    r = 0;
field_start:
    if (r >= rep) goto field_end;
    if (deref_error(*(const char **)(p+0+r*280))) { goto skip_1; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+0+r*280), len);
skip_1:
    if (deref_error(*(const char **)(p+40+r*280))) { goto skip_2; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+40+r*280), len);
skip_2:
    if (deref_error(*(const char **)(p+72+r*280))) { goto skip_3; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+72+r*280), len);
skip_3:
    if (deref_error(*(const char **)(p+104+r*280))) { goto skip_4; }
    len = (*(int64_t *)(p+104+r*280+8) - *(int64_t *)(p+104+r*280)) / 28;
    dump_union_ComboAddress(*(const char **)(p+104+r*280), len);
skip_4:
    if (deref_error(*(const char **)(p+176+r*280))) { goto skip_5; }
    len = 1;
    dump__class_boost__multi_index__multi_index_container_20_(*(const char **)(p+176+r*280), len);
skip_5:
    if (deref_error(*(const char **)(p+184+r*280))) { goto skip_6; }
    len = 1;
    dump__class_std___Sp_counted_base_(*(const char **)(p+184+r*280), len);
skip_6:
    if (deref_error(*(const char **)(p+240+r*280))) { goto skip_7; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+240+r*280), len);
skip_7:

    r++;
    goto field_start;
field_end:
    return;
}

static void dump_union_ComboAddress(const char *p, int rep) {
    int len; int size = 0;
    if (dumped.find({(uint64_t)p, (uint64_t)dump_union_ComboAddress}) != dumped.end()) return;
    dumped.insert({(uint64_t)p, (uint64_t)dump_union_ComboAddress});
    fprintf(f, "\"%p\": {\n", p);
    int r = 0;
self_start:
    if (r >= rep) goto self_end;
    fprintf(f, "\t\"%d\": [ %d, 2 ],\n", 0+r*28,  *(int16_t *)(p+0+r*28));
    fprintf(f, "\t\"%d\": [ %d, 2 ],\n", 2+r*28,  *(int16_t *)(p+2+r*28));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 4+r*28,  *(int32_t *)(p+4+r*28));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 8+r*28,  *(int32_t *)(p+8+r*28));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 12+r*28,  *(int32_t *)(p+12+r*28));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 16+r*28,  *(int32_t *)(p+16+r*28));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 20+r*28,  *(int32_t *)(p+20+r*28));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 24+r*28,  *(int32_t *)(p+24+r*28));
    r++; 
    size += 28;
    goto self_start;
self_end:
    fprintf(f, "\t\"__size__\": %d,\n\t\"__type__\": \"%%union.ComboAddress\"},\n", size);
    r = 0;
field_start:
    if (r >= rep) goto field_end;

    r++;
    goto field_start;
field_end:
    return;
}

static void dump__struct_boost__multi_index__detail__hashed_index_base_node_impl_(const char *p, int rep) {
    int len; int size = 0;
    if (dumped.find({(uint64_t)p, (uint64_t)dump__struct_boost__multi_index__detail__hashed_index_base_node_impl_}) != dumped.end()) return;
    dumped.insert({(uint64_t)p, (uint64_t)dump__struct_boost__multi_index__detail__hashed_index_base_node_impl_});
    fprintf(f, "\"%p\": {\n", p);
    int r = 0;
self_start:
    if (r >= rep) goto self_end;
    fprintf(f, "\t\"%d\": \"%p\",\n", 0+r*8, *(const char **)(p+0+r*8));
    r++; 
    size += 8;
    goto self_start;
self_end:
    fprintf(f, "\t\"__size__\": %d,\n\t\"__type__\": \"%%\\\"struct.boost::multi_index::detail::hashed_index_base_node_impl\\\"\"},\n", size);
    r = 0;
field_start:
    if (r >= rep) goto field_end;
    if (deref_error(*(const char **)(p+0+r*8))) { goto skip_1; }
    len = 1;
    dump__struct_boost__multi_index__detail__hashed_index_node_impl_(*(const char **)(p+0+r*8), len);
skip_1:

    r++;
    goto field_start;
field_end:
    return;
}

static void dump_class_LuaContext(const char *p, int rep) {
    int len; int size = 0;
    if (dumped.find({(uint64_t)p, (uint64_t)dump_class_LuaContext}) != dumped.end()) return;
    dumped.insert({(uint64_t)p, (uint64_t)dump_class_LuaContext});
    fprintf(f, "\"%p\": {\n", p);
    int r = 0;
self_start:
    if (r >= rep) goto self_end;
    fprintf(f, "\t\"%d\": \"%p\",\n", 0+r*8, *(const char **)(p+0+r*8));
    r++; 
    size += 8;
    goto self_start;
self_end:
    fprintf(f, "\t\"__size__\": %d,\n\t\"__type__\": \"%%class.LuaContext\"},\n", size);
    r = 0;
field_start:
    if (r >= rep) goto field_end;
    if (deref_error(*(const char **)(p+0+r*8))) { goto skip_1; }
    len = 1;
    dump_struct_lua_State(*(const char **)(p+0+r*8), len);
skip_1:

    r++;
    goto field_start;
field_end:
    return;
}

static void dump_class_Bind2Backend(const char *p, int rep) {
    int len; int size = 0;
    if (dumped.find({(uint64_t)p, (uint64_t)dump_class_Bind2Backend}) != dumped.end()) return;
    dumped.insert({(uint64_t)p, (uint64_t)dump_class_Bind2Backend});
    fprintf(f, "\"%p\": {\n", p);
    int r = 0;
self_start:
    if (r >= rep) goto self_end;
    fprintf(f, "\t\"%d\": \"%p\",\n", 0+r*464, *(const char **)(p+0+r*464));
    fprintf(f, "\t\"%d\": \"%p\",\n", 8+r*464, *(const char **)(p+8+r*464));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 16+r*464,  *(int64_t *)(p+16+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 24+r*464,  *(int8_t *)(p+24+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 25+r*464,  *(int8_t *)(p+25+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 26+r*464,  *(int8_t *)(p+26+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 27+r*464,  *(int8_t *)(p+27+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 28+r*464,  *(int8_t *)(p+28+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 29+r*464,  *(int8_t *)(p+29+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 30+r*464,  *(int8_t *)(p+30+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 31+r*464,  *(int8_t *)(p+31+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 32+r*464,  *(int8_t *)(p+32+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 33+r*464,  *(int8_t *)(p+33+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 34+r*464,  *(int8_t *)(p+34+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 35+r*464,  *(int8_t *)(p+35+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 36+r*464,  *(int8_t *)(p+36+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 37+r*464,  *(int8_t *)(p+37+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 38+r*464,  *(int8_t *)(p+38+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 39+r*464,  *(int8_t *)(p+39+r*464));
    fprintf(f, "\t\"%d\": \"%p\",\n", 40+r*464, *(const char **)(p+40+r*464));
    fprintf(f, "\t\"%d\": \"%p\",\n", 48+r*464, *(const char **)(p+48+r*464));
    fprintf(f, "\t\"%d\": \"%p\",\n", 56+r*464, *(const char **)(p+56+r*464));
    fprintf(f, "\t\"%d\": \"%p\",\n", 64+r*464, *(const char **)(p+64+r*464));
    fprintf(f, "\t\"%d\": \"%p\",\n", 72+r*464, *(const char **)(p+72+r*464));
    fprintf(f, "\t\"%d\": \"%p\",\n", 80+r*464, *(const char **)(p+80+r*464));
    fprintf(f, "\t\"%d\": \"%p\",\n", 88+r*464, *(const char **)(p+88+r*464));
    fprintf(f, "\t\"%d\": \"%p\",\n", 96+r*464, *(const char **)(p+96+r*464));
    fprintf(f, "\t\"%d\": \"%p\",\n", 104+r*464, *(const char **)(p+104+r*464));
    fprintf(f, "\t\"%d\": \"%p\",\n", 112+r*464, *(const char **)(p+112+r*464));
    fprintf(f, "\t\"%d\": \"%p\",\n", 120+r*464, *(const char **)(p+120+r*464));
    fprintf(f, "\t\"%d\": \"%p\",\n", 128+r*464, *(const char **)(p+128+r*464));
    fprintf(f, "\t\"%d\": \"%p\",\n", 136+r*464, *(const char **)(p+136+r*464));
    fprintf(f, "\t\"%d\": \"%p\",\n", 144+r*464, *(const char **)(p+144+r*464));
    fprintf(f, "\t\"%d\": \"%p\",\n", 152+r*464, *(const char **)(p+152+r*464));
    fprintf(f, "\t\"%d\": \"%p\",\n", 160+r*464, *(const char **)(p+160+r*464));
    fprintf(f, "\t\"%d\": \"%p\",\n", 168+r*464, *(const char **)(p+168+r*464));
    fprintf(f, "\t\"%d\": \"%p\",\n", 176+r*464, *(const char **)(p+176+r*464));
    fprintf(f, "\t\"%d\": \"%p\",\n", 184+r*464, *(const char **)(p+184+r*464));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 192+r*464,  *(int64_t *)(p+192+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 200+r*464,  *(int8_t *)(p+200+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 201+r*464,  *(int8_t *)(p+201+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 202+r*464,  *(int8_t *)(p+202+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 203+r*464,  *(int8_t *)(p+203+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 204+r*464,  *(int8_t *)(p+204+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 205+r*464,  *(int8_t *)(p+205+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 206+r*464,  *(int8_t *)(p+206+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 207+r*464,  *(int8_t *)(p+207+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 208+r*464,  *(int8_t *)(p+208+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 209+r*464,  *(int8_t *)(p+209+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 210+r*464,  *(int8_t *)(p+210+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 211+r*464,  *(int8_t *)(p+211+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 212+r*464,  *(int8_t *)(p+212+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 213+r*464,  *(int8_t *)(p+213+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 214+r*464,  *(int8_t *)(p+214+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 215+r*464,  *(int8_t *)(p+215+r*464));
    fprintf(f, "\t\"%d\": \"%p\",\n", 216+r*464, *(const char **)(p+216+r*464));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 224+r*464,  *(int64_t *)(p+224+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 232+r*464,  *(int8_t *)(p+232+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 233+r*464,  *(int8_t *)(p+233+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 234+r*464,  *(int8_t *)(p+234+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 235+r*464,  *(int8_t *)(p+235+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 236+r*464,  *(int8_t *)(p+236+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 237+r*464,  *(int8_t *)(p+237+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 238+r*464,  *(int8_t *)(p+238+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 239+r*464,  *(int8_t *)(p+239+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 240+r*464,  *(int8_t *)(p+240+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 241+r*464,  *(int8_t *)(p+241+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 242+r*464,  *(int8_t *)(p+242+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 243+r*464,  *(int8_t *)(p+243+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 244+r*464,  *(int8_t *)(p+244+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 245+r*464,  *(int8_t *)(p+245+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 246+r*464,  *(int8_t *)(p+246+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 247+r*464,  *(int8_t *)(p+247+r*464));
    fprintf(f, "\t\"%d\": \"%p\",\n", 248+r*464, *(const char **)(p+248+r*464));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 256+r*464,  *(int64_t *)(p+256+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 264+r*464,  *(int8_t *)(p+264+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 265+r*464,  *(int8_t *)(p+265+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 266+r*464,  *(int8_t *)(p+266+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 267+r*464,  *(int8_t *)(p+267+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 268+r*464,  *(int8_t *)(p+268+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 269+r*464,  *(int8_t *)(p+269+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 270+r*464,  *(int8_t *)(p+270+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 271+r*464,  *(int8_t *)(p+271+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 272+r*464,  *(int8_t *)(p+272+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 273+r*464,  *(int8_t *)(p+273+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 274+r*464,  *(int8_t *)(p+274+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 275+r*464,  *(int8_t *)(p+275+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 276+r*464,  *(int8_t *)(p+276+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 277+r*464,  *(int8_t *)(p+277+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 278+r*464,  *(int8_t *)(p+278+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 279+r*464,  *(int8_t *)(p+279+r*464));
    fprintf(f, "\t\"%d\": \"%p\",\n", 328+r*464, *(const char **)(p+328+r*464));
    fprintf(f, "\t\"%d\": \"%p\",\n", 336+r*464, *(const char **)(p+336+r*464));
    fprintf(f, "\t\"%d\": \"%p\",\n", 344+r*464, *(const char **)(p+344+r*464));
    fprintf(f, "\t\"%d\": \"%p\",\n", 352+r*464, *(const char **)(p+352+r*464));
    fprintf(f, "\t\"%d\": \"%p\",\n", 360+r*464, *(const char **)(p+360+r*464));
    fprintf(f, "\t\"%d\": \"%p\",\n", 368+r*464, *(const char **)(p+368+r*464));
    fprintf(f, "\t\"%d\": \"%p\",\n", 376+r*464, *(const char **)(p+376+r*464));
    fprintf(f, "\t\"%d\": \"%p\",\n", 384+r*464, *(const char **)(p+384+r*464));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 392+r*464,  *(int64_t *)(p+392+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 400+r*464,  *(int8_t *)(p+400+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 401+r*464,  *(int8_t *)(p+401+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 402+r*464,  *(int8_t *)(p+402+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 403+r*464,  *(int8_t *)(p+403+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 404+r*464,  *(int8_t *)(p+404+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 405+r*464,  *(int8_t *)(p+405+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 406+r*464,  *(int8_t *)(p+406+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 407+r*464,  *(int8_t *)(p+407+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 408+r*464,  *(int8_t *)(p+408+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 409+r*464,  *(int8_t *)(p+409+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 410+r*464,  *(int8_t *)(p+410+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 411+r*464,  *(int8_t *)(p+411+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 412+r*464,  *(int8_t *)(p+412+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 413+r*464,  *(int8_t *)(p+413+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 414+r*464,  *(int8_t *)(p+414+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 415+r*464,  *(int8_t *)(p+415+r*464));
    fprintf(f, "\t\"%d\": \"%p\",\n", 416+r*464, *(const char **)(p+416+r*464));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 424+r*464,  *(int64_t *)(p+424+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 432+r*464,  *(int8_t *)(p+432+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 433+r*464,  *(int8_t *)(p+433+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 434+r*464,  *(int8_t *)(p+434+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 435+r*464,  *(int8_t *)(p+435+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 436+r*464,  *(int8_t *)(p+436+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 437+r*464,  *(int8_t *)(p+437+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 438+r*464,  *(int8_t *)(p+438+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 439+r*464,  *(int8_t *)(p+439+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 440+r*464,  *(int8_t *)(p+440+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 441+r*464,  *(int8_t *)(p+441+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 442+r*464,  *(int8_t *)(p+442+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 443+r*464,  *(int8_t *)(p+443+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 444+r*464,  *(int8_t *)(p+444+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 445+r*464,  *(int8_t *)(p+445+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 446+r*464,  *(int8_t *)(p+446+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 447+r*464,  *(int8_t *)(p+447+r*464));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 448+r*464,  *(int32_t *)(p+448+r*464));
    fprintf(f, "\t\"%d\": [ %d, 2 ],\n", 452+r*464,  *(int16_t *)(p+452+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 454+r*464,  *(int8_t *)(p+454+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 455+r*464,  *(int8_t *)(p+455+r*464));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 456+r*464,  *(int32_t *)(p+456+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 460+r*464,  *(int8_t *)(p+460+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 461+r*464,  *(int8_t *)(p+461+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 462+r*464,  *(int8_t *)(p+462+r*464));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 463+r*464,  *(int8_t *)(p+463+r*464));
    r++; 
    size += 464;
    goto self_start;
self_end:
    fprintf(f, "\t\"__size__\": %d,\n\t\"__type__\": \"%%class.Bind2Backend\"},\n", size);
    r = 0;
field_start:
    if (r >= rep) goto field_end;
    if (deref_error(*(const char **)(p+8+r*464))) { goto skip_1; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+8+r*464), len);
skip_1:
    if (deref_error(*(const char **)(p+40+r*464))) { goto skip_2; }
    len = 1;
    dump__class_std__basic_ostream_base_(*(const char **)(p+40+r*464), len);
skip_2:
    if (deref_error(*(const char **)(p+48+r*464))) { goto skip_3; }
    len = 1;
    dump__class_std___Sp_counted_base_(*(const char **)(p+48+r*464), len);
skip_3:
    if (deref_error(*(const char **)(p+56+r*464))) { goto skip_4; }
    len = 1;
    dump__class_std__basic_ostream_base_(*(const char **)(p+56+r*464), len);
skip_4:
    if (deref_error(*(const char **)(p+64+r*464))) { goto skip_5; }
    len = 1;
    dump__class_std__basic_ostream_base_(*(const char **)(p+64+r*464), len);
skip_5:
    if (deref_error(*(const char **)(p+72+r*464))) { goto skip_6; }
    len = 1;
    dump__class_std__basic_ostream_base_(*(const char **)(p+72+r*464), len);
skip_6:
    if (deref_error(*(const char **)(p+80+r*464))) { goto skip_7; }
    len = 1;
    dump__class_std__basic_ostream_base_(*(const char **)(p+80+r*464), len);
skip_7:
    if (deref_error(*(const char **)(p+88+r*464))) { goto skip_8; }
    len = 1;
    dump__class_std__basic_ostream_base_(*(const char **)(p+88+r*464), len);
skip_8:
    if (deref_error(*(const char **)(p+96+r*464))) { goto skip_9; }
    len = 1;
    dump__class_std__basic_ostream_base_(*(const char **)(p+96+r*464), len);
skip_9:
    if (deref_error(*(const char **)(p+104+r*464))) { goto skip_10; }
    len = 1;
    dump__class_std__basic_ostream_base_(*(const char **)(p+104+r*464), len);
skip_10:
    if (deref_error(*(const char **)(p+112+r*464))) { goto skip_11; }
    len = 1;
    dump__class_std__basic_ostream_base_(*(const char **)(p+112+r*464), len);
skip_11:
    if (deref_error(*(const char **)(p+120+r*464))) { goto skip_12; }
    len = 1;
    dump__class_std__basic_ostream_base_(*(const char **)(p+120+r*464), len);
skip_12:
    if (deref_error(*(const char **)(p+128+r*464))) { goto skip_13; }
    len = 1;
    dump__class_std__basic_ostream_base_(*(const char **)(p+128+r*464), len);
skip_13:
    if (deref_error(*(const char **)(p+136+r*464))) { goto skip_14; }
    len = 1;
    dump__class_std__basic_ostream_base_(*(const char **)(p+136+r*464), len);
skip_14:
    if (deref_error(*(const char **)(p+144+r*464))) { goto skip_15; }
    len = 1;
    dump__class_std__basic_ostream_base_(*(const char **)(p+144+r*464), len);
skip_15:
    if (deref_error(*(const char **)(p+152+r*464))) { goto skip_16; }
    len = 1;
    dump__class_std__basic_ostream_base_(*(const char **)(p+152+r*464), len);
skip_16:
    if (deref_error(*(const char **)(p+160+r*464))) { goto skip_17; }
    len = 1;
    dump__class_std__basic_ostream_base_(*(const char **)(p+160+r*464), len);
skip_17:
    if (deref_error(*(const char **)(p+168+r*464))) { goto skip_18; }
    len = 1;
    dump__class_std__basic_ostream_base_(*(const char **)(p+168+r*464), len);
skip_18:
    if (deref_error(*(const char **)(p+176+r*464))) { goto skip_19; }
    len = 1;
    dump__class_std__basic_ostream_base_(*(const char **)(p+176+r*464), len);
skip_19:
    if (deref_error(*(const char **)(p+184+r*464))) { goto skip_20; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+184+r*464), len);
skip_20:
    if (deref_error(*(const char **)(p+216+r*464))) { goto skip_21; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+216+r*464), len);
skip_21:
    if (deref_error(*(const char **)(p+248+r*464))) { goto skip_22; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+248+r*464), len);
skip_22:
    if (deref_error(*(const char **)(p+328+r*464))) { goto skip_23; }
    len = 1;
    dump__class_std__basic_ofstream_(*(const char **)(p+328+r*464), len);
skip_23:
    if (deref_error(*(const char **)(p+336+r*464))) { goto skip_24; }
    len = 1;
    dump__class_boost__multi_index__multi_index_container_20_(*(const char **)(p+336+r*464), len);
skip_24:
    if (deref_error(*(const char **)(p+344+r*464))) { goto skip_25; }
    len = 1;
    dump__class_std___Sp_counted_base_(*(const char **)(p+344+r*464), len);
skip_25:
    if (deref_error(*(const char **)(p+352+r*464))) { goto skip_26; }
    len = 1;
    dump__struct_boost__multi_index__detail__hashed_index_node_530_(*(const char **)(p+352+r*464), len);
skip_26:
    if (deref_error(*(const char **)(p+360+r*464))) { goto skip_27; }
    len = 1;
    dump__struct_boost__multi_index__detail__hashed_index_node_530_(*(const char **)(p+360+r*464), len);
skip_27:
    if (deref_error(*(const char **)(p+368+r*464))) { goto skip_28; }
    len = 1;
    dump__struct_boost__multi_index__detail__ordered_index_node_26_(*(const char **)(p+368+r*464), len);
skip_28:
    if (deref_error(*(const char **)(p+376+r*464))) { goto skip_29; }
    len = 1;
    dump__struct_boost__multi_index__detail__ordered_index_node_26_(*(const char **)(p+376+r*464), len);
skip_29:
    if (deref_error(*(const char **)(p+384+r*464))) { goto skip_30; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+384+r*464), len);
skip_30:
    if (deref_error(*(const char **)(p+416+r*464))) { goto skip_31; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+416+r*464), len);
skip_31:

    r++;
    goto field_start;
field_end:
    return;
}

static void dump__struct_boost__multi_index__detail__ordered_index_node_impl_(const char *p, int rep) {
    int len; int size = 0;
    if (dumped.find({(uint64_t)p, (uint64_t)dump__struct_boost__multi_index__detail__ordered_index_node_impl_}) != dumped.end()) return;
    dumped.insert({(uint64_t)p, (uint64_t)dump__struct_boost__multi_index__detail__ordered_index_node_impl_});
    fprintf(f, "\"%p\": {\n", p);
    int r = 0;
self_start:
    if (r >= rep) goto self_end;
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 0+r*24,  *(int64_t *)(p+0+r*24));
    fprintf(f, "\t\"%d\": \"%p\",\n", 8+r*24, *(const char **)(p+8+r*24));
    fprintf(f, "\t\"%d\": \"%p\",\n", 16+r*24, *(const char **)(p+16+r*24));
    r++; 
    size += 24;
    goto self_start;
self_end:
    fprintf(f, "\t\"__size__\": %d,\n\t\"__type__\": \"%%\\\"struct.boost::multi_index::detail::ordered_index_node_impl\\\"\"},\n", size);
    r = 0;
field_start:
    if (r >= rep) goto field_end;
    if (deref_error(*(const char **)(p+8+r*24))) { goto skip_1; }
    len = 1;
    dump__struct_boost__multi_index__detail__ordered_index_node_impl_(*(const char **)(p+8+r*24), len);
skip_1:
    if (deref_error(*(const char **)(p+16+r*24))) { goto skip_2; }
    len = 1;
    dump__struct_boost__multi_index__detail__ordered_index_node_impl_(*(const char **)(p+16+r*24), len);
skip_2:

    r++;
    goto field_start;
field_end:
    return;
}

static void dump_class_UeberBackend(const char *p, int rep) {
    int len; int size = 0;
    if (dumped.find({(uint64_t)p, (uint64_t)dump_class_UeberBackend}) != dumped.end()) return;
    dumped.insert({(uint64_t)p, (uint64_t)dump_class_UeberBackend});
    fprintf(f, "\"%p\": {\n", p);
    int r = 0;
self_start:
    if (r >= rep) goto self_end;
    fprintf(f, "\t\"%d\": \"%p\",\n", 0+r*184, *(const char **)(p+0+r*184));
    fprintf(f, "\t\"%d\": \"%p\",\n", 8+r*184, *(const char **)(p+8+r*184));
    fprintf(f, "\t\"%d\": \"%p\",\n", 16+r*184, *(const char **)(p+16+r*184));
    fprintf(f, "\t\"%d\": \"%p\",\n", 24+r*184, *(const char **)(p+24+r*184));
    fprintf(f, "\t\"%d\": \"%p\",\n", 32+r*184, *(const char **)(p+32+r*184));
    fprintf(f, "\t\"%d\": \"%p\",\n", 40+r*184, *(const char **)(p+40+r*184));
    fprintf(f, "\t\"%d\": \"%p\",\n", 48+r*184, *(const char **)(p+48+r*184));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 56+r*184,  *(int64_t *)(p+56+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 64+r*184,  *(int8_t *)(p+64+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 65+r*184,  *(int8_t *)(p+65+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 66+r*184,  *(int8_t *)(p+66+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 67+r*184,  *(int8_t *)(p+67+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 68+r*184,  *(int8_t *)(p+68+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 69+r*184,  *(int8_t *)(p+69+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 70+r*184,  *(int8_t *)(p+70+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 71+r*184,  *(int8_t *)(p+71+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 72+r*184,  *(int8_t *)(p+72+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 73+r*184,  *(int8_t *)(p+73+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 74+r*184,  *(int8_t *)(p+74+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 75+r*184,  *(int8_t *)(p+75+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 76+r*184,  *(int8_t *)(p+76+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 77+r*184,  *(int8_t *)(p+77+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 78+r*184,  *(int8_t *)(p+78+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 79+r*184,  *(int8_t *)(p+79+r*184));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 80+r*184,  *(int32_t *)(p+80+r*184));
    fprintf(f, "\t\"%d\": [ %d, 2 ],\n", 84+r*184,  *(int16_t *)(p+84+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 86+r*184,  *(int8_t *)(p+86+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 87+r*184,  *(int8_t *)(p+87+r*184));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 88+r*184,  *(int32_t *)(p+88+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 92+r*184,  *(int8_t *)(p+92+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 93+r*184,  *(int8_t *)(p+93+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 94+r*184,  *(int8_t *)(p+94+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 95+r*184,  *(int8_t *)(p+95+r*184));
    fprintf(f, "\t\"%d\": \"%p\",\n", 96+r*184, *(const char **)(p+96+r*184));
    fprintf(f, "\t\"%d\": \"%p\",\n", 104+r*184, *(const char **)(p+104+r*184));
    fprintf(f, "\t\"%d\": \"%p\",\n", 112+r*184, *(const char **)(p+112+r*184));
    fprintf(f, "\t\"%d\": \"%p\",\n", 120+r*184, *(const char **)(p+120+r*184));
    fprintf(f, "\t\"%d\": \"%p\",\n", 128+r*184, *(const char **)(p+128+r*184));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 136+r*184,  *(int64_t *)(p+136+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 144+r*184,  *(int8_t *)(p+144+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 145+r*184,  *(int8_t *)(p+145+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 146+r*184,  *(int8_t *)(p+146+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 147+r*184,  *(int8_t *)(p+147+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 148+r*184,  *(int8_t *)(p+148+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 149+r*184,  *(int8_t *)(p+149+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 150+r*184,  *(int8_t *)(p+150+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 151+r*184,  *(int8_t *)(p+151+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 152+r*184,  *(int8_t *)(p+152+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 153+r*184,  *(int8_t *)(p+153+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 154+r*184,  *(int8_t *)(p+154+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 155+r*184,  *(int8_t *)(p+155+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 156+r*184,  *(int8_t *)(p+156+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 157+r*184,  *(int8_t *)(p+157+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 158+r*184,  *(int8_t *)(p+158+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 159+r*184,  *(int8_t *)(p+159+r*184));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 160+r*184,  *(int32_t *)(p+160+r*184));
    fprintf(f, "\t\"%d\": [ %d, 2 ],\n", 164+r*184,  *(int16_t *)(p+164+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 166+r*184,  *(int8_t *)(p+166+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 167+r*184,  *(int8_t *)(p+167+r*184));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 168+r*184,  *(int32_t *)(p+168+r*184));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 172+r*184,  *(int32_t *)(p+172+r*184));
    fprintf(f, "\t\"%d\": [ %d, 2 ],\n", 176+r*184,  *(int16_t *)(p+176+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 178+r*184,  *(int8_t *)(p+178+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 179+r*184,  *(int8_t *)(p+179+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 180+r*184,  *(int8_t *)(p+180+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 181+r*184,  *(int8_t *)(p+181+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 182+r*184,  *(int8_t *)(p+182+r*184));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 183+r*184,  *(int8_t *)(p+183+r*184));
    r++; 
    size += 184;
    goto self_start;
self_end:
    fprintf(f, "\t\"__size__\": %d,\n\t\"__type__\": \"%%class.UeberBackend\"},\n", size);
    r = 0;
field_start:
    if (r >= rep) goto field_end;
    if (deref_error(*(const char **)(p+0+r*184))) { goto skip_1; }
    len = (*(int64_t *)(p+0+r*184+8) - *(int64_t *)(p+0+r*184)) / 8;
    dump_anon_0x133e0c2a0(*(const char **)(p+0+r*184), len);
    for (int j=0; j<len; j++) {
        const char *pp = *(const char **)(*(const char **)(p+0+r*184) + 8*j);
        if (!deref_error(pp)) dump_class_DNSBackend(pp, 1);
    }
skip_1:
    if (deref_error(*(const char **)(p+24+r*184))) { goto skip_2; }
    len = 1;
    dump_class_UeberBackend(*(const char **)(p+24+r*184), len);
skip_2:
    if (deref_error(*(const char **)(p+32+r*184))) { goto skip_3; }
    len = 1;
    dump_class_DNSBackend(*(const char **)(p+32+r*184), len);
skip_3:
    if (deref_error(*(const char **)(p+40+r*184))) { goto skip_4; }
    len = 1;
    dump_class_DNSPacket(*(const char **)(p+40+r*184), len);
skip_4:
    if (deref_error(*(const char **)(p+48+r*184))) { goto skip_5; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+48+r*184), len);
skip_5:
    if (deref_error(*(const char **)(p+96+r*184))) { goto skip_6; }
    len = (*(int64_t *)(p+96+r*184+8) - *(int64_t *)(p+96+r*184)) / 120;
    dump_struct_DNSZoneRecord(*(const char **)(p+96+r*184), len);
skip_6:
    if (deref_error(*(const char **)(p+120+r*184))) { goto skip_7; }
    len = 1;
    dump_struct_DNSZoneRecord(*(const char **)(p+120+r*184), len);
skip_7:
    if (deref_error(*(const char **)(p+128+r*184))) { goto skip_8; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+128+r*184), len);
skip_8:

    r++;
    goto field_start;
field_end:
    return;
}

static void dump_struct_lua_State(const char *p, int rep) {
    int len; int size = 0;
    if (dumped.find({(uint64_t)p, (uint64_t)dump_struct_lua_State}) != dumped.end()) return;
    dumped.insert({(uint64_t)p, (uint64_t)dump_struct_lua_State});
    fprintf(f, "\"%p\": {\n", p);
    int r = 0;
self_start:
    if (r >= rep) goto self_end;
    r++; 
    size += 0;
    goto self_start;
self_end:
    fprintf(f, "\t\"__size__\": %d,\n\t\"__type__\": \"%%struct.lua_State\"},\n", size);
    r = 0;
field_start:
    if (r >= rep) goto field_end;

    r++;
    goto field_start;
field_end:
    return;
}

static void dump_anon_0x133e09480(const char *p, int rep) {
    if (dumped.find({(uint64_t)p, (uint64_t)dump_anon_0x133e09480}) != dumped.end()) return;
    dumped.insert({(uint64_t)p, (uint64_t)dump_anon_0x133e09480});
    fprintf(f, "\"%p\": {\n", p);
    int r = 0;
again:
    if (r >= rep) goto exit;
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 0+r*1,  *(int8_t *)(p+0+r*1));
    r++; goto again;
exit:
    assert(rep >= 0);
    fprintf(f, "\t\"__size__\": %d\n},\n", 1 * rep);
}

static void dump_struct_DNSZoneRecord(const char *p, int rep) {
    int len; int size = 0;
    if (dumped.find({(uint64_t)p, (uint64_t)dump_struct_DNSZoneRecord}) != dumped.end()) return;
    dumped.insert({(uint64_t)p, (uint64_t)dump_struct_DNSZoneRecord});
    fprintf(f, "\"%p\": {\n", p);
    int r = 0;
self_start:
    if (r >= rep) goto self_end;
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 0+r*120,  *(int32_t *)(p+0+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 4+r*120,  *(int8_t *)(p+4+r*120));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 8+r*120,  *(int32_t *)(p+8+r*120));
    fprintf(f, "\t\"%d\": \"%p\",\n", 16+r*120, *(const char **)(p+16+r*120));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 24+r*120,  *(int64_t *)(p+24+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 32+r*120,  *(int8_t *)(p+32+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 33+r*120,  *(int8_t *)(p+33+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 34+r*120,  *(int8_t *)(p+34+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 35+r*120,  *(int8_t *)(p+35+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 36+r*120,  *(int8_t *)(p+36+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 37+r*120,  *(int8_t *)(p+37+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 38+r*120,  *(int8_t *)(p+38+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 39+r*120,  *(int8_t *)(p+39+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 40+r*120,  *(int8_t *)(p+40+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 41+r*120,  *(int8_t *)(p+41+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 42+r*120,  *(int8_t *)(p+42+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 43+r*120,  *(int8_t *)(p+43+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 44+r*120,  *(int8_t *)(p+44+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 45+r*120,  *(int8_t *)(p+45+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 46+r*120,  *(int8_t *)(p+46+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 47+r*120,  *(int8_t *)(p+47+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 48+r*120,  *(int8_t *)(p+48+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 49+r*120,  *(int8_t *)(p+49+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 50+r*120,  *(int8_t *)(p+50+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 51+r*120,  *(int8_t *)(p+51+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 52+r*120,  *(int8_t *)(p+52+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 53+r*120,  *(int8_t *)(p+53+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 54+r*120,  *(int8_t *)(p+54+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 55+r*120,  *(int8_t *)(p+55+r*120));
    fprintf(f, "\t\"%d\": \"%p\",\n", 56+r*120, *(const char **)(p+56+r*120));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 64+r*120,  *(int64_t *)(p+64+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 72+r*120,  *(int8_t *)(p+72+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 73+r*120,  *(int8_t *)(p+73+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 74+r*120,  *(int8_t *)(p+74+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 75+r*120,  *(int8_t *)(p+75+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 76+r*120,  *(int8_t *)(p+76+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 77+r*120,  *(int8_t *)(p+77+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 78+r*120,  *(int8_t *)(p+78+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 79+r*120,  *(int8_t *)(p+79+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 80+r*120,  *(int8_t *)(p+80+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 81+r*120,  *(int8_t *)(p+81+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 82+r*120,  *(int8_t *)(p+82+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 83+r*120,  *(int8_t *)(p+83+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 84+r*120,  *(int8_t *)(p+84+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 85+r*120,  *(int8_t *)(p+85+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 86+r*120,  *(int8_t *)(p+86+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 87+r*120,  *(int8_t *)(p+87+r*120));
    fprintf(f, "\t\"%d\": \"%p\",\n", 88+r*120, *(const char **)(p+88+r*120));
    fprintf(f, "\t\"%d\": \"%p\",\n", 96+r*120, *(const char **)(p+96+r*120));
    fprintf(f, "\t\"%d\": [ %d, 2 ],\n", 104+r*120,  *(int16_t *)(p+104+r*120));
    fprintf(f, "\t\"%d\": [ %d, 2 ],\n", 106+r*120,  *(int16_t *)(p+106+r*120));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 108+r*120,  *(int32_t *)(p+108+r*120));
    fprintf(f, "\t\"%d\": [ %d, 2 ],\n", 112+r*120,  *(int16_t *)(p+112+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 114+r*120,  *(int8_t *)(p+114+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 115+r*120,  *(int8_t *)(p+115+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 116+r*120,  *(int8_t *)(p+116+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 117+r*120,  *(int8_t *)(p+117+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 118+r*120,  *(int8_t *)(p+118+r*120));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 119+r*120,  *(int8_t *)(p+119+r*120));
    r++; 
    size += 120;
    goto self_start;
self_end:
    fprintf(f, "\t\"__size__\": %d,\n\t\"__type__\": \"%%struct.DNSZoneRecord\"},\n", size);
    r = 0;
field_start:
    if (r >= rep) goto field_end;
    if (deref_error(*(const char **)(p+16+r*120))) { goto skip_1; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+16+r*120), len);
skip_1:
    if (deref_error(*(const char **)(p+56+r*120))) { goto skip_2; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+56+r*120), len);
skip_2:
    if (deref_error(*(const char **)(p+88+r*120))) { goto skip_3; }
    len = 1;
    dump__class_std__basic_ostream_base_(*(const char **)(p+88+r*120), len);
skip_3:
    if (deref_error(*(const char **)(p+96+r*120))) { goto skip_4; }
    len = 1;
    dump__class_std___Sp_counted_base_(*(const char **)(p+96+r*120), len);
skip_4:

    r++;
    goto field_start;
field_end:
    return;
}

static void dump_class_PDNSException(const char *p, int rep) {
    int len; int size = 0;
    if (dumped.find({(uint64_t)p, (uint64_t)dump_class_PDNSException}) != dumped.end()) return;
    dumped.insert({(uint64_t)p, (uint64_t)dump_class_PDNSException});
    fprintf(f, "\"%p\": {\n", p);
    int r = 0;
self_start:
    if (r >= rep) goto self_end;
    fprintf(f, "\t\"%d\": \"%p\",\n", 0+r*32, *(const char **)(p+0+r*32));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 8+r*32,  *(int64_t *)(p+8+r*32));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 16+r*32,  *(int8_t *)(p+16+r*32));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 17+r*32,  *(int8_t *)(p+17+r*32));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 18+r*32,  *(int8_t *)(p+18+r*32));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 19+r*32,  *(int8_t *)(p+19+r*32));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 20+r*32,  *(int8_t *)(p+20+r*32));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 21+r*32,  *(int8_t *)(p+21+r*32));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 22+r*32,  *(int8_t *)(p+22+r*32));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 23+r*32,  *(int8_t *)(p+23+r*32));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 24+r*32,  *(int8_t *)(p+24+r*32));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 25+r*32,  *(int8_t *)(p+25+r*32));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 26+r*32,  *(int8_t *)(p+26+r*32));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 27+r*32,  *(int8_t *)(p+27+r*32));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 28+r*32,  *(int8_t *)(p+28+r*32));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 29+r*32,  *(int8_t *)(p+29+r*32));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 30+r*32,  *(int8_t *)(p+30+r*32));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 31+r*32,  *(int8_t *)(p+31+r*32));
    r++; 
    size += 32;
    goto self_start;
self_end:
    fprintf(f, "\t\"__size__\": %d,\n\t\"__type__\": \"%%class.PDNSException\"},\n", size);
    r = 0;
field_start:
    if (r >= rep) goto field_end;
    if (deref_error(*(const char **)(p+0+r*32))) { goto skip_1; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+0+r*32), len);
skip_1:

    r++;
    goto field_start;
field_end:
    return;
}

static void dump__struct_boost__multi_index__detail__hashed_index_node_530_(const char *p, int rep) {
    int len; int size = 0;
    if (dumped.find({(uint64_t)p, (uint64_t)dump__struct_boost__multi_index__detail__hashed_index_node_530_}) != dumped.end()) return;
    dumped.insert({(uint64_t)p, (uint64_t)dump__struct_boost__multi_index__detail__hashed_index_node_530_});
    fprintf(f, "\"%p\": {\n", p);
    int r = 0;
self_start:
    if (r >= rep) goto self_end;
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 0+r*144,  *(int8_t *)(p+0+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 1+r*144,  *(int8_t *)(p+1+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 2+r*144,  *(int8_t *)(p+2+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 3+r*144,  *(int8_t *)(p+3+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 4+r*144,  *(int8_t *)(p+4+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 5+r*144,  *(int8_t *)(p+5+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 6+r*144,  *(int8_t *)(p+6+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 7+r*144,  *(int8_t *)(p+7+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 8+r*144,  *(int8_t *)(p+8+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 9+r*144,  *(int8_t *)(p+9+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 10+r*144,  *(int8_t *)(p+10+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 11+r*144,  *(int8_t *)(p+11+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 12+r*144,  *(int8_t *)(p+12+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 13+r*144,  *(int8_t *)(p+13+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 14+r*144,  *(int8_t *)(p+14+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 15+r*144,  *(int8_t *)(p+15+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 16+r*144,  *(int8_t *)(p+16+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 17+r*144,  *(int8_t *)(p+17+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 18+r*144,  *(int8_t *)(p+18+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 19+r*144,  *(int8_t *)(p+19+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 20+r*144,  *(int8_t *)(p+20+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 21+r*144,  *(int8_t *)(p+21+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 22+r*144,  *(int8_t *)(p+22+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 23+r*144,  *(int8_t *)(p+23+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 24+r*144,  *(int8_t *)(p+24+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 25+r*144,  *(int8_t *)(p+25+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 26+r*144,  *(int8_t *)(p+26+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 27+r*144,  *(int8_t *)(p+27+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 28+r*144,  *(int8_t *)(p+28+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 29+r*144,  *(int8_t *)(p+29+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 30+r*144,  *(int8_t *)(p+30+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 31+r*144,  *(int8_t *)(p+31+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 32+r*144,  *(int8_t *)(p+32+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 33+r*144,  *(int8_t *)(p+33+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 34+r*144,  *(int8_t *)(p+34+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 35+r*144,  *(int8_t *)(p+35+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 36+r*144,  *(int8_t *)(p+36+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 37+r*144,  *(int8_t *)(p+37+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 38+r*144,  *(int8_t *)(p+38+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 39+r*144,  *(int8_t *)(p+39+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 40+r*144,  *(int8_t *)(p+40+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 41+r*144,  *(int8_t *)(p+41+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 42+r*144,  *(int8_t *)(p+42+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 43+r*144,  *(int8_t *)(p+43+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 44+r*144,  *(int8_t *)(p+44+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 45+r*144,  *(int8_t *)(p+45+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 46+r*144,  *(int8_t *)(p+46+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 47+r*144,  *(int8_t *)(p+47+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 48+r*144,  *(int8_t *)(p+48+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 49+r*144,  *(int8_t *)(p+49+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 50+r*144,  *(int8_t *)(p+50+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 51+r*144,  *(int8_t *)(p+51+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 52+r*144,  *(int8_t *)(p+52+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 53+r*144,  *(int8_t *)(p+53+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 54+r*144,  *(int8_t *)(p+54+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 55+r*144,  *(int8_t *)(p+55+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 56+r*144,  *(int8_t *)(p+56+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 57+r*144,  *(int8_t *)(p+57+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 58+r*144,  *(int8_t *)(p+58+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 59+r*144,  *(int8_t *)(p+59+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 60+r*144,  *(int8_t *)(p+60+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 61+r*144,  *(int8_t *)(p+61+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 62+r*144,  *(int8_t *)(p+62+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 63+r*144,  *(int8_t *)(p+63+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 64+r*144,  *(int8_t *)(p+64+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 65+r*144,  *(int8_t *)(p+65+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 66+r*144,  *(int8_t *)(p+66+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 67+r*144,  *(int8_t *)(p+67+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 68+r*144,  *(int8_t *)(p+68+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 69+r*144,  *(int8_t *)(p+69+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 70+r*144,  *(int8_t *)(p+70+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 71+r*144,  *(int8_t *)(p+71+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 72+r*144,  *(int8_t *)(p+72+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 73+r*144,  *(int8_t *)(p+73+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 74+r*144,  *(int8_t *)(p+74+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 75+r*144,  *(int8_t *)(p+75+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 76+r*144,  *(int8_t *)(p+76+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 77+r*144,  *(int8_t *)(p+77+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 78+r*144,  *(int8_t *)(p+78+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 79+r*144,  *(int8_t *)(p+79+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 80+r*144,  *(int8_t *)(p+80+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 81+r*144,  *(int8_t *)(p+81+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 82+r*144,  *(int8_t *)(p+82+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 83+r*144,  *(int8_t *)(p+83+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 84+r*144,  *(int8_t *)(p+84+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 85+r*144,  *(int8_t *)(p+85+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 86+r*144,  *(int8_t *)(p+86+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 87+r*144,  *(int8_t *)(p+87+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 88+r*144,  *(int8_t *)(p+88+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 89+r*144,  *(int8_t *)(p+89+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 90+r*144,  *(int8_t *)(p+90+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 91+r*144,  *(int8_t *)(p+91+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 92+r*144,  *(int8_t *)(p+92+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 93+r*144,  *(int8_t *)(p+93+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 94+r*144,  *(int8_t *)(p+94+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 95+r*144,  *(int8_t *)(p+95+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 96+r*144,  *(int8_t *)(p+96+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 97+r*144,  *(int8_t *)(p+97+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 98+r*144,  *(int8_t *)(p+98+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 99+r*144,  *(int8_t *)(p+99+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 100+r*144,  *(int8_t *)(p+100+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 101+r*144,  *(int8_t *)(p+101+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 102+r*144,  *(int8_t *)(p+102+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 103+r*144,  *(int8_t *)(p+103+r*144));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 104+r*144,  *(int64_t *)(p+104+r*144));
    fprintf(f, "\t\"%d\": \"%p\",\n", 112+r*144, *(const char **)(p+112+r*144));
    fprintf(f, "\t\"%d\": \"%p\",\n", 120+r*144, *(const char **)(p+120+r*144));
    fprintf(f, "\t\"%d\": \"%p\",\n", 128+r*144, *(const char **)(p+128+r*144));
    fprintf(f, "\t\"%d\": \"%p\",\n", 136+r*144, *(const char **)(p+136+r*144));
    r++; 
    size += 144;
    goto self_start;
self_end:
    fprintf(f, "\t\"__size__\": %d,\n\t\"__type__\": \"%%\\\"struct.boost::multi_index::detail::hashed_index_node.530\\\"\"},\n", size);
    r = 0;
field_start:
    if (r >= rep) goto field_end;
    if (deref_error(*(const char **)(p+112+r*144))) { goto skip_1; }
    len = 1;
    dump__struct_boost__multi_index__detail__ordered_index_node_impl_(*(const char **)(p+112+r*144), len);
skip_1:
    if (deref_error(*(const char **)(p+120+r*144))) { goto skip_2; }
    len = 1;
    dump__struct_boost__multi_index__detail__ordered_index_node_impl_(*(const char **)(p+120+r*144), len);
skip_2:
    if (deref_error(*(const char **)(p+128+r*144))) { goto skip_3; }
    len = 1;
    dump__struct_boost__multi_index__detail__hashed_index_node_impl_(*(const char **)(p+128+r*144), len);
skip_3:
    if (deref_error(*(const char **)(p+136+r*144))) { goto skip_4; }
    len = 1;
    dump__struct_boost__multi_index__detail__hashed_index_base_node_impl_(*(const char **)(p+136+r*144), len);
skip_4:

    r++;
    goto field_start;
field_end:
    return;
}

static void dump__struct_boost__multi_index__detail__hashed_index_node_impl_(const char *p, int rep) {
    int len; int size = 0;
    if (dumped.find({(uint64_t)p, (uint64_t)dump__struct_boost__multi_index__detail__hashed_index_node_impl_}) != dumped.end()) return;
    dumped.insert({(uint64_t)p, (uint64_t)dump__struct_boost__multi_index__detail__hashed_index_node_impl_});
    fprintf(f, "\"%p\": {\n", p);
    int r = 0;
self_start:
    if (r >= rep) goto self_end;
    fprintf(f, "\t\"%d\": \"%p\",\n", 0+r*16, *(const char **)(p+0+r*16));
    fprintf(f, "\t\"%d\": \"%p\",\n", 8+r*16, *(const char **)(p+8+r*16));
    r++; 
    size += 16;
    goto self_start;
self_end:
    fprintf(f, "\t\"__size__\": %d,\n\t\"__type__\": \"%%\\\"struct.boost::multi_index::detail::hashed_index_node_impl\\\"\"},\n", size);
    r = 0;
field_start:
    if (r >= rep) goto field_end;
    if (deref_error(*(const char **)(p+0+r*16))) { goto skip_1; }
    len = 1;
    dump__struct_boost__multi_index__detail__hashed_index_node_impl_(*(const char **)(p+0+r*16), len);
skip_1:
    if (deref_error(*(const char **)(p+8+r*16))) { goto skip_2; }
    len = 1;
    dump__struct_boost__multi_index__detail__hashed_index_base_node_impl_(*(const char **)(p+8+r*16), len);
skip_2:

    r++;
    goto field_start;
field_end:
    return;
}

static void dump__class_std___Sp_counted_base_(const char *p, int rep) {
    int len; int size = 0;
    if (dumped.find({(uint64_t)p, (uint64_t)dump__class_std___Sp_counted_base_}) != dumped.end()) return;
    dumped.insert({(uint64_t)p, (uint64_t)dump__class_std___Sp_counted_base_});
    fprintf(f, "\"%p\": {\n", p);
    int r = 0;
self_start:
    if (r >= rep) goto self_end;
    fprintf(f, "\t\"%d\": \"%p\",\n", 0+r*16, *(const char **)(p+0+r*16));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 8+r*16,  *(int32_t *)(p+8+r*16));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 12+r*16,  *(int32_t *)(p+12+r*16));
    r++; 
    size += 16;
    goto self_start;
self_end:
    fprintf(f, "\t\"__size__\": %d,\n\t\"__type__\": \"%%\\\"class.std::_Sp_counted_base\\\"\"},\n", size);
    r = 0;
field_start:
    if (r >= rep) goto field_end;

    r++;
    goto field_start;
field_end:
    return;
}

static void dump__struct_std__pair_2661_(const char *p, int rep) {
    int len; int size = 0;
    if (dumped.find({(uint64_t)p, (uint64_t)dump__struct_std__pair_2661_}) != dumped.end()) return;
    dumped.insert({(uint64_t)p, (uint64_t)dump__struct_std__pair_2661_});
    fprintf(f, "\"%p\": {\n", p);
    int r = 0;
self_start:
    if (r >= rep) goto self_end;
    fprintf(f, "\t\"%d\": \"%p\",\n", 0+r*64, *(const char **)(p+0+r*64));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 8+r*64,  *(int64_t *)(p+8+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 16+r*64,  *(int8_t *)(p+16+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 17+r*64,  *(int8_t *)(p+17+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 18+r*64,  *(int8_t *)(p+18+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 19+r*64,  *(int8_t *)(p+19+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 20+r*64,  *(int8_t *)(p+20+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 21+r*64,  *(int8_t *)(p+21+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 22+r*64,  *(int8_t *)(p+22+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 23+r*64,  *(int8_t *)(p+23+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 24+r*64,  *(int8_t *)(p+24+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 25+r*64,  *(int8_t *)(p+25+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 26+r*64,  *(int8_t *)(p+26+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 27+r*64,  *(int8_t *)(p+27+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 28+r*64,  *(int8_t *)(p+28+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 29+r*64,  *(int8_t *)(p+29+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 30+r*64,  *(int8_t *)(p+30+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 31+r*64,  *(int8_t *)(p+31+r*64));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 32+r*64,  *(int32_t *)(p+32+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 36+r*64,  *(int8_t *)(p+36+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 37+r*64,  *(int8_t *)(p+37+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 38+r*64,  *(int8_t *)(p+38+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 39+r*64,  *(int8_t *)(p+39+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 40+r*64,  *(int8_t *)(p+40+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 41+r*64,  *(int8_t *)(p+41+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 42+r*64,  *(int8_t *)(p+42+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 43+r*64,  *(int8_t *)(p+43+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 44+r*64,  *(int8_t *)(p+44+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 45+r*64,  *(int8_t *)(p+45+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 46+r*64,  *(int8_t *)(p+46+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 47+r*64,  *(int8_t *)(p+47+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 48+r*64,  *(int8_t *)(p+48+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 49+r*64,  *(int8_t *)(p+49+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 50+r*64,  *(int8_t *)(p+50+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 51+r*64,  *(int8_t *)(p+51+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 52+r*64,  *(int8_t *)(p+52+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 53+r*64,  *(int8_t *)(p+53+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 54+r*64,  *(int8_t *)(p+54+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 55+r*64,  *(int8_t *)(p+55+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 56+r*64,  *(int8_t *)(p+56+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 57+r*64,  *(int8_t *)(p+57+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 58+r*64,  *(int8_t *)(p+58+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 59+r*64,  *(int8_t *)(p+59+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 60+r*64,  *(int8_t *)(p+60+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 61+r*64,  *(int8_t *)(p+61+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 62+r*64,  *(int8_t *)(p+62+r*64));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 63+r*64,  *(int8_t *)(p+63+r*64));
    r++; 
    size += 64;
    goto self_start;
self_end:
    fprintf(f, "\t\"__size__\": %d,\n\t\"__type__\": \"%%\\\"struct.std::pair.2661\\\"\"},\n", size);
    r = 0;
field_start:
    if (r >= rep) goto field_end;
    if (deref_error(*(const char **)(p+0+r*64))) { goto skip_1; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+0+r*64), len);
skip_1:

    r++;
    goto field_start;
field_end:
    return;
}

static void dump__class_std__basic_ostream_base_(const char *p, int rep) {
    int len; int size = 0;
    if (dumped.find({(uint64_t)p, (uint64_t)dump__class_std__basic_ostream_base_}) != dumped.end()) return;
    dumped.insert({(uint64_t)p, (uint64_t)dump__class_std__basic_ostream_base_});
    fprintf(f, "\"%p\": {\n", p);
    int r = 0;
self_start:
    if (r >= rep) goto self_end;
    r++; 
    size += 8;
    goto self_start;
self_end:
    fprintf(f, "\t\"__size__\": %d,\n\t\"__type__\": \"%%\\\"class.std::basic_ostream.base\\\"\"},\n", size);
    r = 0;
field_start:
    if (r >= rep) goto field_end;

    r++;
    goto field_start;
field_end:
    return;
}

static void dump_class_DNSPacket(const char *p, int rep) {
    int len; int size = 0;
    if (dumped.find({(uint64_t)p, (uint64_t)dump_class_DNSPacket}) != dumped.end()) return;
    dumped.insert({(uint64_t)p, (uint64_t)dump_class_DNSPacket});
    fprintf(f, "\"%p\": {\n", p);
    int r = 0;
self_start:
    if (r >= rep) goto self_end;
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 0+r*712,  *(int8_t *)(p+0+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 1+r*712,  *(int8_t *)(p+1+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 2+r*712,  *(int8_t *)(p+2+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 3+r*712,  *(int8_t *)(p+3+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 4+r*712,  *(int8_t *)(p+4+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 5+r*712,  *(int8_t *)(p+5+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 6+r*712,  *(int8_t *)(p+6+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 7+r*712,  *(int8_t *)(p+7+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 8+r*712,  *(int8_t *)(p+8+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 9+r*712,  *(int8_t *)(p+9+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 10+r*712,  *(int8_t *)(p+10+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 11+r*712,  *(int8_t *)(p+11+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 12+r*712,  *(int8_t *)(p+12+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 13+r*712,  *(int8_t *)(p+13+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 14+r*712,  *(int8_t *)(p+14+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 15+r*712,  *(int8_t *)(p+15+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 16+r*712,  *(int8_t *)(p+16+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 17+r*712,  *(int8_t *)(p+17+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 18+r*712,  *(int8_t *)(p+18+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 19+r*712,  *(int8_t *)(p+19+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 20+r*712,  *(int8_t *)(p+20+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 21+r*712,  *(int8_t *)(p+21+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 22+r*712,  *(int8_t *)(p+22+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 23+r*712,  *(int8_t *)(p+23+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 24+r*712,  *(int8_t *)(p+24+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 25+r*712,  *(int8_t *)(p+25+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 26+r*712,  *(int8_t *)(p+26+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 27+r*712,  *(int8_t *)(p+27+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 28+r*712,  *(int8_t *)(p+28+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 29+r*712,  *(int8_t *)(p+29+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 30+r*712,  *(int8_t *)(p+30+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 31+r*712,  *(int8_t *)(p+31+r*712));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 32+r*712,  *(int64_t *)(p+32+r*712));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 40+r*712,  *(int64_t *)(p+40+r*712));
    fprintf(f, "\t\"%d\": \"%p\",\n", 48+r*712, *(const char **)(p+48+r*712));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 56+r*712,  *(int64_t *)(p+56+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 64+r*712,  *(int8_t *)(p+64+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 65+r*712,  *(int8_t *)(p+65+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 66+r*712,  *(int8_t *)(p+66+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 67+r*712,  *(int8_t *)(p+67+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 68+r*712,  *(int8_t *)(p+68+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 69+r*712,  *(int8_t *)(p+69+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 70+r*712,  *(int8_t *)(p+70+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 71+r*712,  *(int8_t *)(p+71+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 72+r*712,  *(int8_t *)(p+72+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 73+r*712,  *(int8_t *)(p+73+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 74+r*712,  *(int8_t *)(p+74+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 75+r*712,  *(int8_t *)(p+75+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 76+r*712,  *(int8_t *)(p+76+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 77+r*712,  *(int8_t *)(p+77+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 78+r*712,  *(int8_t *)(p+78+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 79+r*712,  *(int8_t *)(p+79+r*712));
    fprintf(f, "\t\"%d\": \"%p\",\n", 80+r*712, *(const char **)(p+80+r*712));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 88+r*712,  *(int64_t *)(p+88+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 96+r*712,  *(int8_t *)(p+96+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 97+r*712,  *(int8_t *)(p+97+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 98+r*712,  *(int8_t *)(p+98+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 99+r*712,  *(int8_t *)(p+99+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 100+r*712,  *(int8_t *)(p+100+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 101+r*712,  *(int8_t *)(p+101+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 102+r*712,  *(int8_t *)(p+102+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 103+r*712,  *(int8_t *)(p+103+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 104+r*712,  *(int8_t *)(p+104+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 105+r*712,  *(int8_t *)(p+105+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 106+r*712,  *(int8_t *)(p+106+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 107+r*712,  *(int8_t *)(p+107+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 108+r*712,  *(int8_t *)(p+108+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 109+r*712,  *(int8_t *)(p+109+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 110+r*712,  *(int8_t *)(p+110+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 111+r*712,  *(int8_t *)(p+111+r*712));
    fprintf(f, "\t\"%d\": \"%p\",\n", 112+r*712, *(const char **)(p+112+r*712));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 120+r*712,  *(int64_t *)(p+120+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 128+r*712,  *(int8_t *)(p+128+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 129+r*712,  *(int8_t *)(p+129+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 130+r*712,  *(int8_t *)(p+130+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 131+r*712,  *(int8_t *)(p+131+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 132+r*712,  *(int8_t *)(p+132+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 133+r*712,  *(int8_t *)(p+133+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 134+r*712,  *(int8_t *)(p+134+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 135+r*712,  *(int8_t *)(p+135+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 136+r*712,  *(int8_t *)(p+136+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 137+r*712,  *(int8_t *)(p+137+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 138+r*712,  *(int8_t *)(p+138+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 139+r*712,  *(int8_t *)(p+139+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 140+r*712,  *(int8_t *)(p+140+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 141+r*712,  *(int8_t *)(p+141+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 142+r*712,  *(int8_t *)(p+142+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 143+r*712,  *(int8_t *)(p+143+r*712));
    fprintf(f, "\t\"%d\": \"%p\",\n", 144+r*712, *(const char **)(p+144+r*712));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 152+r*712,  *(int64_t *)(p+152+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 160+r*712,  *(int8_t *)(p+160+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 161+r*712,  *(int8_t *)(p+161+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 162+r*712,  *(int8_t *)(p+162+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 163+r*712,  *(int8_t *)(p+163+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 164+r*712,  *(int8_t *)(p+164+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 165+r*712,  *(int8_t *)(p+165+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 166+r*712,  *(int8_t *)(p+166+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 167+r*712,  *(int8_t *)(p+167+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 168+r*712,  *(int8_t *)(p+168+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 169+r*712,  *(int8_t *)(p+169+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 170+r*712,  *(int8_t *)(p+170+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 171+r*712,  *(int8_t *)(p+171+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 172+r*712,  *(int8_t *)(p+172+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 173+r*712,  *(int8_t *)(p+173+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 174+r*712,  *(int8_t *)(p+174+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 175+r*712,  *(int8_t *)(p+175+r*712));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 176+r*712,  *(int32_t *)(p+176+r*712));
    fprintf(f, "\t\"%d\": [ %d, 2 ],\n", 180+r*712,  *(int16_t *)(p+180+r*712));
    fprintf(f, "\t\"%d\": [ %d, 2 ],\n", 182+r*712,  *(int16_t *)(p+182+r*712));
    fprintf(f, "\t\"%d\": [ %d, 2 ],\n", 184+r*712,  *(int16_t *)(p+184+r*712));
    fprintf(f, "\t\"%d\": [ %d, 2 ],\n", 186+r*712,  *(int16_t *)(p+186+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 188+r*712,  *(int8_t *)(p+188+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 189+r*712,  *(int8_t *)(p+189+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 190+r*712,  *(int8_t *)(p+190+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 191+r*712,  *(int8_t *)(p+191+r*712));
    fprintf(f, "\t\"%d\": [ %d, 2 ],\n", 200+r*712,  *(int16_t *)(p+200+r*712));
    fprintf(f, "\t\"%d\": [ %d, 2 ],\n", 202+r*712,  *(int16_t *)(p+202+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 204+r*712,  *(int8_t *)(p+204+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 205+r*712,  *(int8_t *)(p+205+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 206+r*712,  *(int8_t *)(p+206+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 207+r*712,  *(int8_t *)(p+207+r*712));
    fprintf(f, "\t\"%d\": \"%p\",\n", 208+r*712, *(const char **)(p+208+r*712));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 216+r*712,  *(int64_t *)(p+216+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 224+r*712,  *(int8_t *)(p+224+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 225+r*712,  *(int8_t *)(p+225+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 226+r*712,  *(int8_t *)(p+226+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 227+r*712,  *(int8_t *)(p+227+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 228+r*712,  *(int8_t *)(p+228+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 229+r*712,  *(int8_t *)(p+229+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 230+r*712,  *(int8_t *)(p+230+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 231+r*712,  *(int8_t *)(p+231+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 232+r*712,  *(int8_t *)(p+232+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 233+r*712,  *(int8_t *)(p+233+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 234+r*712,  *(int8_t *)(p+234+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 235+r*712,  *(int8_t *)(p+235+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 236+r*712,  *(int8_t *)(p+236+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 237+r*712,  *(int8_t *)(p+237+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 238+r*712,  *(int8_t *)(p+238+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 239+r*712,  *(int8_t *)(p+239+r*712));
    fprintf(f, "\t\"%d\": \"%p\",\n", 240+r*712, *(const char **)(p+240+r*712));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 248+r*712,  *(int64_t *)(p+248+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 256+r*712,  *(int8_t *)(p+256+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 257+r*712,  *(int8_t *)(p+257+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 258+r*712,  *(int8_t *)(p+258+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 259+r*712,  *(int8_t *)(p+259+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 260+r*712,  *(int8_t *)(p+260+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 261+r*712,  *(int8_t *)(p+261+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 262+r*712,  *(int8_t *)(p+262+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 263+r*712,  *(int8_t *)(p+263+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 264+r*712,  *(int8_t *)(p+264+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 265+r*712,  *(int8_t *)(p+265+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 266+r*712,  *(int8_t *)(p+266+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 267+r*712,  *(int8_t *)(p+267+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 268+r*712,  *(int8_t *)(p+268+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 269+r*712,  *(int8_t *)(p+269+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 270+r*712,  *(int8_t *)(p+270+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 271+r*712,  *(int8_t *)(p+271+r*712));
    fprintf(f, "\t\"%d\": \"%p\",\n", 272+r*712, *(const char **)(p+272+r*712));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 280+r*712,  *(int64_t *)(p+280+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 288+r*712,  *(int8_t *)(p+288+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 289+r*712,  *(int8_t *)(p+289+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 290+r*712,  *(int8_t *)(p+290+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 291+r*712,  *(int8_t *)(p+291+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 292+r*712,  *(int8_t *)(p+292+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 293+r*712,  *(int8_t *)(p+293+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 294+r*712,  *(int8_t *)(p+294+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 295+r*712,  *(int8_t *)(p+295+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 296+r*712,  *(int8_t *)(p+296+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 297+r*712,  *(int8_t *)(p+297+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 298+r*712,  *(int8_t *)(p+298+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 299+r*712,  *(int8_t *)(p+299+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 300+r*712,  *(int8_t *)(p+300+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 301+r*712,  *(int8_t *)(p+301+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 302+r*712,  *(int8_t *)(p+302+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 303+r*712,  *(int8_t *)(p+303+r*712));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 304+r*712,  *(int64_t *)(p+304+r*712));
    fprintf(f, "\t\"%d\": [ %d, 2 ],\n", 312+r*712,  *(int16_t *)(p+312+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 314+r*712,  *(int8_t *)(p+314+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 315+r*712,  *(int8_t *)(p+315+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 316+r*712,  *(int8_t *)(p+316+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 317+r*712,  *(int8_t *)(p+317+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 318+r*712,  *(int8_t *)(p+318+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 319+r*712,  *(int8_t *)(p+319+r*712));
    fprintf(f, "\t\"%d\": [ %d, 2 ],\n", 320+r*712,  *(int16_t *)(p+320+r*712));
    fprintf(f, "\t\"%d\": [ %d, 2 ],\n", 322+r*712,  *(int16_t *)(p+322+r*712));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 324+r*712,  *(int32_t *)(p+324+r*712));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 328+r*712,  *(int32_t *)(p+328+r*712));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 332+r*712,  *(int32_t *)(p+332+r*712));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 336+r*712,  *(int32_t *)(p+336+r*712));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 340+r*712,  *(int32_t *)(p+340+r*712));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 344+r*712,  *(int32_t *)(p+344+r*712));
    fprintf(f, "\t\"%d\": [ %d, 2 ],\n", 348+r*712,  *(int16_t *)(p+348+r*712));
    fprintf(f, "\t\"%d\": [ %d, 2 ],\n", 350+r*712,  *(int16_t *)(p+350+r*712));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 352+r*712,  *(int32_t *)(p+352+r*712));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 356+r*712,  *(int32_t *)(p+356+r*712));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 360+r*712,  *(int32_t *)(p+360+r*712));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 364+r*712,  *(int32_t *)(p+364+r*712));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 368+r*712,  *(int32_t *)(p+368+r*712));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 372+r*712,  *(int32_t *)(p+372+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 376+r*712,  *(int8_t *)(p+376+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 377+r*712,  *(int8_t *)(p+377+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 378+r*712,  *(int8_t *)(p+378+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 379+r*712,  *(int8_t *)(p+379+r*712));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 380+r*712,  *(int32_t *)(p+380+r*712));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 384+r*712,  *(int32_t *)(p+384+r*712));
    fprintf(f, "\t\"%d\": [ %d, 2 ],\n", 388+r*712,  *(int16_t *)(p+388+r*712));
    fprintf(f, "\t\"%d\": [ %d, 2 ],\n", 390+r*712,  *(int16_t *)(p+390+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 392+r*712,  *(int8_t *)(p+392+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 393+r*712,  *(int8_t *)(p+393+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 394+r*712,  *(int8_t *)(p+394+r*712));
    fprintf(f, "\t\"%d\": \"%p\",\n", 400+r*712, *(const char **)(p+400+r*712));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 408+r*712,  *(int64_t *)(p+408+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 416+r*712,  *(int8_t *)(p+416+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 417+r*712,  *(int8_t *)(p+417+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 418+r*712,  *(int8_t *)(p+418+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 419+r*712,  *(int8_t *)(p+419+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 420+r*712,  *(int8_t *)(p+420+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 421+r*712,  *(int8_t *)(p+421+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 422+r*712,  *(int8_t *)(p+422+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 423+r*712,  *(int8_t *)(p+423+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 424+r*712,  *(int8_t *)(p+424+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 425+r*712,  *(int8_t *)(p+425+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 426+r*712,  *(int8_t *)(p+426+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 427+r*712,  *(int8_t *)(p+427+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 428+r*712,  *(int8_t *)(p+428+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 429+r*712,  *(int8_t *)(p+429+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 430+r*712,  *(int8_t *)(p+430+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 431+r*712,  *(int8_t *)(p+431+r*712));
    fprintf(f, "\t\"%d\": \"%p\",\n", 432+r*712, *(const char **)(p+432+r*712));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 440+r*712,  *(int64_t *)(p+440+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 448+r*712,  *(int8_t *)(p+448+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 449+r*712,  *(int8_t *)(p+449+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 450+r*712,  *(int8_t *)(p+450+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 451+r*712,  *(int8_t *)(p+451+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 452+r*712,  *(int8_t *)(p+452+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 453+r*712,  *(int8_t *)(p+453+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 454+r*712,  *(int8_t *)(p+454+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 455+r*712,  *(int8_t *)(p+455+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 456+r*712,  *(int8_t *)(p+456+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 457+r*712,  *(int8_t *)(p+457+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 458+r*712,  *(int8_t *)(p+458+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 459+r*712,  *(int8_t *)(p+459+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 460+r*712,  *(int8_t *)(p+460+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 461+r*712,  *(int8_t *)(p+461+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 462+r*712,  *(int8_t *)(p+462+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 463+r*712,  *(int8_t *)(p+463+r*712));
    fprintf(f, "\t\"%d\": \"%p\",\n", 464+r*712, *(const char **)(p+464+r*712));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 472+r*712,  *(int64_t *)(p+472+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 480+r*712,  *(int8_t *)(p+480+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 481+r*712,  *(int8_t *)(p+481+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 482+r*712,  *(int8_t *)(p+482+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 483+r*712,  *(int8_t *)(p+483+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 484+r*712,  *(int8_t *)(p+484+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 485+r*712,  *(int8_t *)(p+485+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 486+r*712,  *(int8_t *)(p+486+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 487+r*712,  *(int8_t *)(p+487+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 488+r*712,  *(int8_t *)(p+488+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 489+r*712,  *(int8_t *)(p+489+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 490+r*712,  *(int8_t *)(p+490+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 491+r*712,  *(int8_t *)(p+491+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 492+r*712,  *(int8_t *)(p+492+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 493+r*712,  *(int8_t *)(p+493+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 494+r*712,  *(int8_t *)(p+494+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 495+r*712,  *(int8_t *)(p+495+r*712));
    fprintf(f, "\t\"%d\": \"%p\",\n", 496+r*712, *(const char **)(p+496+r*712));
    fprintf(f, "\t\"%d\": \"%p\",\n", 504+r*712, *(const char **)(p+504+r*712));
    fprintf(f, "\t\"%d\": \"%p\",\n", 512+r*712, *(const char **)(p+512+r*712));
    fprintf(f, "\t\"%d\": \"%p\",\n", 520+r*712, *(const char **)(p+520+r*712));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 528+r*712,  *(int64_t *)(p+528+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 536+r*712,  *(int8_t *)(p+536+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 537+r*712,  *(int8_t *)(p+537+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 538+r*712,  *(int8_t *)(p+538+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 539+r*712,  *(int8_t *)(p+539+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 540+r*712,  *(int8_t *)(p+540+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 541+r*712,  *(int8_t *)(p+541+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 542+r*712,  *(int8_t *)(p+542+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 543+r*712,  *(int8_t *)(p+543+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 544+r*712,  *(int8_t *)(p+544+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 545+r*712,  *(int8_t *)(p+545+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 546+r*712,  *(int8_t *)(p+546+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 547+r*712,  *(int8_t *)(p+547+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 548+r*712,  *(int8_t *)(p+548+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 549+r*712,  *(int8_t *)(p+549+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 550+r*712,  *(int8_t *)(p+550+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 551+r*712,  *(int8_t *)(p+551+r*712));
    fprintf(f, "\t\"%d\": [ %d, 2 ],\n", 552+r*712,  *(int16_t *)(p+552+r*712));
    fprintf(f, "\t\"%d\": [ %d, 2 ],\n", 554+r*712,  *(int16_t *)(p+554+r*712));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 556+r*712,  *(int32_t *)(p+556+r*712));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 560+r*712,  *(int32_t *)(p+560+r*712));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 564+r*712,  *(int32_t *)(p+564+r*712));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 568+r*712,  *(int32_t *)(p+568+r*712));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 572+r*712,  *(int32_t *)(p+572+r*712));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 576+r*712,  *(int32_t *)(p+576+r*712));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 580+r*712,  *(int32_t *)(p+580+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 584+r*712,  *(int8_t *)(p+584+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 585+r*712,  *(int8_t *)(p+585+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 586+r*712,  *(int8_t *)(p+586+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 587+r*712,  *(int8_t *)(p+587+r*712));
    fprintf(f, "\t\"%d\": [ %d, 2 ],\n", 588+r*712,  *(int16_t *)(p+588+r*712));
    fprintf(f, "\t\"%d\": [ %d, 2 ],\n", 590+r*712,  *(int16_t *)(p+590+r*712));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 592+r*712,  *(int32_t *)(p+592+r*712));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 596+r*712,  *(int32_t *)(p+596+r*712));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 600+r*712,  *(int32_t *)(p+600+r*712));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 604+r*712,  *(int32_t *)(p+604+r*712));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 608+r*712,  *(int32_t *)(p+608+r*712));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 612+r*712,  *(int32_t *)(p+612+r*712));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 616+r*712,  *(int32_t *)(p+616+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 620+r*712,  *(int8_t *)(p+620+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 621+r*712,  *(int8_t *)(p+621+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 622+r*712,  *(int8_t *)(p+622+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 623+r*712,  *(int8_t *)(p+623+r*712));
    fprintf(f, "\t\"%d\": \"%p\",\n", 624+r*712, *(const char **)(p+624+r*712));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 632+r*712,  *(int64_t *)(p+632+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 640+r*712,  *(int8_t *)(p+640+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 641+r*712,  *(int8_t *)(p+641+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 642+r*712,  *(int8_t *)(p+642+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 643+r*712,  *(int8_t *)(p+643+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 644+r*712,  *(int8_t *)(p+644+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 645+r*712,  *(int8_t *)(p+645+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 646+r*712,  *(int8_t *)(p+646+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 647+r*712,  *(int8_t *)(p+647+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 648+r*712,  *(int8_t *)(p+648+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 649+r*712,  *(int8_t *)(p+649+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 650+r*712,  *(int8_t *)(p+650+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 651+r*712,  *(int8_t *)(p+651+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 652+r*712,  *(int8_t *)(p+652+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 653+r*712,  *(int8_t *)(p+653+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 654+r*712,  *(int8_t *)(p+654+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 655+r*712,  *(int8_t *)(p+655+r*712));
    fprintf(f, "\t\"%d\": \"%p\",\n", 656+r*712, *(const char **)(p+656+r*712));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 664+r*712,  *(int64_t *)(p+664+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 672+r*712,  *(int8_t *)(p+672+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 673+r*712,  *(int8_t *)(p+673+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 674+r*712,  *(int8_t *)(p+674+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 675+r*712,  *(int8_t *)(p+675+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 676+r*712,  *(int8_t *)(p+676+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 677+r*712,  *(int8_t *)(p+677+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 678+r*712,  *(int8_t *)(p+678+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 679+r*712,  *(int8_t *)(p+679+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 680+r*712,  *(int8_t *)(p+680+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 681+r*712,  *(int8_t *)(p+681+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 682+r*712,  *(int8_t *)(p+682+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 683+r*712,  *(int8_t *)(p+683+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 684+r*712,  *(int8_t *)(p+684+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 685+r*712,  *(int8_t *)(p+685+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 686+r*712,  *(int8_t *)(p+686+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 687+r*712,  *(int8_t *)(p+687+r*712));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 688+r*712,  *(int32_t *)(p+688+r*712));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 692+r*712,  *(int32_t *)(p+692+r*712));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 696+r*712,  *(int32_t *)(p+696+r*712));
    fprintf(f, "\t\"%d\": [ %d, 2 ],\n", 700+r*712,  *(int16_t *)(p+700+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 702+r*712,  *(int8_t *)(p+702+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 703+r*712,  *(int8_t *)(p+703+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 704+r*712,  *(int8_t *)(p+704+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 705+r*712,  *(int8_t *)(p+705+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 706+r*712,  *(int8_t *)(p+706+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 707+r*712,  *(int8_t *)(p+707+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 708+r*712,  *(int8_t *)(p+708+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 709+r*712,  *(int8_t *)(p+709+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 710+r*712,  *(int8_t *)(p+710+r*712));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 711+r*712,  *(int8_t *)(p+711+r*712));
    r++; 
    size += 712;
    goto self_start;
self_end:
    fprintf(f, "\t\"__size__\": %d,\n\t\"__type__\": \"%%class.DNSPacket\"},\n", size);
    r = 0;
field_start:
    if (r >= rep) goto field_end;
    if (deref_error(*(const char **)(p+48+r*712))) { goto skip_1; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+48+r*712), len);
skip_1:
    if (deref_error(*(const char **)(p+80+r*712))) { goto skip_2; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+80+r*712), len);
skip_2:
    if (deref_error(*(const char **)(p+112+r*712))) { goto skip_3; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+112+r*712), len);
skip_3:
    if (deref_error(*(const char **)(p+144+r*712))) { goto skip_4; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+144+r*712), len);
skip_4:
    if (deref_error(*(const char **)(p+208+r*712))) { goto skip_5; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+208+r*712), len);
skip_5:
    if (deref_error(*(const char **)(p+240+r*712))) { goto skip_6; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+240+r*712), len);
skip_6:
    if (deref_error(*(const char **)(p+272+r*712))) { goto skip_7; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+272+r*712), len);
skip_7:
    if (deref_error(*(const char **)(p+400+r*712))) { goto skip_8; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+400+r*712), len);
skip_8:
    if (deref_error(*(const char **)(p+432+r*712))) { goto skip_9; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+432+r*712), len);
skip_9:
    if (deref_error(*(const char **)(p+464+r*712))) { goto skip_10; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+464+r*712), len);
skip_10:
    if (deref_error(*(const char **)(p+496+r*712))) { goto skip_11; }
    len = (*(int64_t *)(p+496+r*712+8) - *(int64_t *)(p+496+r*712)) / 120;
    dump_struct_DNSZoneRecord(*(const char **)(p+496+r*712), len);
skip_11:
    if (deref_error(*(const char **)(p+520+r*712))) { goto skip_12; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+520+r*712), len);
skip_12:
    if (deref_error(*(const char **)(p+624+r*712))) { goto skip_13; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+624+r*712), len);
skip_13:
    if (deref_error(*(const char **)(p+656+r*712))) { goto skip_14; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+656+r*712), len);
skip_14:

    r++;
    goto field_start;
field_end:
    return;
}

static void dump_class_AuthLua4_3473(const char *p, int rep) {
    int len; int size = 0;
    if (dumped.find({(uint64_t)p, (uint64_t)dump_class_AuthLua4_3473}) != dumped.end()) return;
    dumped.insert({(uint64_t)p, (uint64_t)dump_class_AuthLua4_3473});
    fprintf(f, "\"%p\": {\n", p);
    int r = 0;
self_start:
    if (r >= rep) goto self_end;
    fprintf(f, "\t\"%d\": \"%p\",\n", 0+r*136, *(const char **)(p+0+r*136));
    fprintf(f, "\t\"%d\": \"%p\",\n", 8+r*136, *(const char **)(p+8+r*136));
    fprintf(f, "\t\"%d\": \"%p\",\n", 16+r*136, *(const char **)(p+16+r*136));
    fprintf(f, "\t\"%d\": \"%p\",\n", 24+r*136, *(const char **)(p+24+r*136));
    fprintf(f, "\t\"%d\": \"%p\",\n", 32+r*136, *(const char **)(p+32+r*136));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 40+r*136,  *(int64_t *)(p+40+r*136));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 48+r*136,  *(int64_t *)(p+48+r*136));
    fprintf(f, "\t\"%d\": \"%p\",\n", 56+r*136, *(const char **)(p+56+r*136));
    fprintf(f, "\t\"%d\": \"%p\",\n", 64+r*136, *(const char **)(p+64+r*136));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 72+r*136,  *(int64_t *)(p+72+r*136));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 80+r*136,  *(int64_t *)(p+80+r*136));
    fprintf(f, "\t\"%d\": \"%p\",\n", 88+r*136, *(const char **)(p+88+r*136));
    fprintf(f, "\t\"%d\": \"%p\",\n", 96+r*136, *(const char **)(p+96+r*136));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 104+r*136,  *(int64_t *)(p+104+r*136));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 112+r*136,  *(int64_t *)(p+112+r*136));
    fprintf(f, "\t\"%d\": \"%p\",\n", 120+r*136, *(const char **)(p+120+r*136));
    fprintf(f, "\t\"%d\": \"%p\",\n", 128+r*136, *(const char **)(p+128+r*136));
    r++; 
    size += 136;
    goto self_start;
self_end:
    fprintf(f, "\t\"__size__\": %d,\n\t\"__type__\": \"%%class.AuthLua4.3473\"},\n", size);
    r = 0;
field_start:
    if (r >= rep) goto field_end;
    if (deref_error(*(const char **)(p+8+r*136))) { goto skip_1; }
    len = 1;
    dump_class_LuaContext(*(const char **)(p+8+r*136), len);
skip_1:
    if (deref_error(*(const char **)(p+16+r*136))) { goto skip_2; }
    len = 1;
    dump__struct_std__pair_2661_(*(const char **)(p+16+r*136), len);
skip_2:
    if (deref_error(*(const char **)(p+24+r*136))) { goto skip_3; }
    len = 1;
    dump__struct_std__pair_2661_(*(const char **)(p+24+r*136), len);
skip_3:
    if (deref_error(*(const char **)(p+32+r*136))) { goto skip_4; }
    len = 1;
    dump__struct_std__pair_2661_(*(const char **)(p+32+r*136), len);
skip_4:

    r++;
    goto field_start;
field_end:
    return;
}

static void dump_class_PacketHandler_3481(const char *p, int rep) {
    int len; int size = 0;
    if (dumped.find({(uint64_t)p, (uint64_t)dump_class_PacketHandler_3481}) != dumped.end()) return;
    dumped.insert({(uint64_t)p, (uint64_t)dump_class_PacketHandler_3481});
    fprintf(f, "\"%p\": {\n", p);
    int r = 0;
self_start:
    if (r >= rep) goto self_end;
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 0+r*384,  *(int8_t *)(p+0+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 1+r*384,  *(int8_t *)(p+1+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 2+r*384,  *(int8_t *)(p+2+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 3+r*384,  *(int8_t *)(p+3+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 4+r*384,  *(int8_t *)(p+4+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 5+r*384,  *(int8_t *)(p+5+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 6+r*384,  *(int8_t *)(p+6+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 7+r*384,  *(int8_t *)(p+7+r*384));
    fprintf(f, "\t\"%d\": \"%p\",\n", 8+r*384, *(const char **)(p+8+r*384));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 16+r*384,  *(int64_t *)(p+16+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 24+r*384,  *(int8_t *)(p+24+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 25+r*384,  *(int8_t *)(p+25+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 26+r*384,  *(int8_t *)(p+26+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 27+r*384,  *(int8_t *)(p+27+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 28+r*384,  *(int8_t *)(p+28+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 29+r*384,  *(int8_t *)(p+29+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 30+r*384,  *(int8_t *)(p+30+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 31+r*384,  *(int8_t *)(p+31+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 32+r*384,  *(int8_t *)(p+32+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 33+r*384,  *(int8_t *)(p+33+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 34+r*384,  *(int8_t *)(p+34+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 35+r*384,  *(int8_t *)(p+35+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 36+r*384,  *(int8_t *)(p+36+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 37+r*384,  *(int8_t *)(p+37+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 38+r*384,  *(int8_t *)(p+38+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 39+r*384,  *(int8_t *)(p+39+r*384));
    fprintf(f, "\t\"%d\": \"%p\",\n", 40+r*384, *(const char **)(p+40+r*384));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 48+r*384,  *(int64_t *)(p+48+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 56+r*384,  *(int8_t *)(p+56+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 57+r*384,  *(int8_t *)(p+57+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 58+r*384,  *(int8_t *)(p+58+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 59+r*384,  *(int8_t *)(p+59+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 60+r*384,  *(int8_t *)(p+60+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 61+r*384,  *(int8_t *)(p+61+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 62+r*384,  *(int8_t *)(p+62+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 63+r*384,  *(int8_t *)(p+63+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 64+r*384,  *(int8_t *)(p+64+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 65+r*384,  *(int8_t *)(p+65+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 66+r*384,  *(int8_t *)(p+66+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 67+r*384,  *(int8_t *)(p+67+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 68+r*384,  *(int8_t *)(p+68+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 69+r*384,  *(int8_t *)(p+69+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 70+r*384,  *(int8_t *)(p+70+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 71+r*384,  *(int8_t *)(p+71+r*384));
    fprintf(f, "\t\"%d\": \"%p\",\n", 72+r*384, *(const char **)(p+72+r*384));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 80+r*384,  *(int64_t *)(p+80+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 88+r*384,  *(int8_t *)(p+88+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 89+r*384,  *(int8_t *)(p+89+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 90+r*384,  *(int8_t *)(p+90+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 91+r*384,  *(int8_t *)(p+91+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 92+r*384,  *(int8_t *)(p+92+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 93+r*384,  *(int8_t *)(p+93+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 94+r*384,  *(int8_t *)(p+94+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 95+r*384,  *(int8_t *)(p+95+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 96+r*384,  *(int8_t *)(p+96+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 97+r*384,  *(int8_t *)(p+97+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 98+r*384,  *(int8_t *)(p+98+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 99+r*384,  *(int8_t *)(p+99+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 100+r*384,  *(int8_t *)(p+100+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 101+r*384,  *(int8_t *)(p+101+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 102+r*384,  *(int8_t *)(p+102+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 103+r*384,  *(int8_t *)(p+103+r*384));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 104+r*384,  *(int32_t *)(p+104+r*384));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 108+r*384,  *(int32_t *)(p+108+r*384));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 112+r*384,  *(int32_t *)(p+112+r*384));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 116+r*384,  *(int32_t *)(p+116+r*384));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 120+r*384,  *(int32_t *)(p+120+r*384));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 124+r*384,  *(int32_t *)(p+124+r*384));
    fprintf(f, "\t\"%d\": \"%p\",\n", 128+r*384, *(const char **)(p+128+r*384));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 136+r*384,  *(int32_t *)(p+136+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 140+r*384,  *(int8_t *)(p+140+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 141+r*384,  *(int8_t *)(p+141+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 142+r*384,  *(int8_t *)(p+142+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 143+r*384,  *(int8_t *)(p+143+r*384));
    fprintf(f, "\t\"%d\": \"%p\",\n", 144+r*384, *(const char **)(p+144+r*384));
    fprintf(f, "\t\"%d\": \"%p\",\n", 152+r*384, *(const char **)(p+152+r*384));
    fprintf(f, "\t\"%d\": \"%p\",\n", 160+r*384, *(const char **)(p+160+r*384));
    fprintf(f, "\t\"%d\": \"%p\",\n", 168+r*384, *(const char **)(p+168+r*384));
    fprintf(f, "\t\"%d\": \"%p\",\n", 176+r*384, *(const char **)(p+176+r*384));
    fprintf(f, "\t\"%d\": \"%p\",\n", 184+r*384, *(const char **)(p+184+r*384));
    fprintf(f, "\t\"%d\": \"%p\",\n", 192+r*384, *(const char **)(p+192+r*384));
    fprintf(f, "\t\"%d\": \"%p\",\n", 200+r*384, *(const char **)(p+200+r*384));
    fprintf(f, "\t\"%d\": \"%p\",\n", 208+r*384, *(const char **)(p+208+r*384));
    fprintf(f, "\t\"%d\": \"%p\",\n", 216+r*384, *(const char **)(p+216+r*384));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 224+r*384,  *(int64_t *)(p+224+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 232+r*384,  *(int8_t *)(p+232+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 233+r*384,  *(int8_t *)(p+233+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 234+r*384,  *(int8_t *)(p+234+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 235+r*384,  *(int8_t *)(p+235+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 236+r*384,  *(int8_t *)(p+236+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 237+r*384,  *(int8_t *)(p+237+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 238+r*384,  *(int8_t *)(p+238+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 239+r*384,  *(int8_t *)(p+239+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 240+r*384,  *(int8_t *)(p+240+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 241+r*384,  *(int8_t *)(p+241+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 242+r*384,  *(int8_t *)(p+242+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 243+r*384,  *(int8_t *)(p+243+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 244+r*384,  *(int8_t *)(p+244+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 245+r*384,  *(int8_t *)(p+245+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 246+r*384,  *(int8_t *)(p+246+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 247+r*384,  *(int8_t *)(p+247+r*384));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 248+r*384,  *(int32_t *)(p+248+r*384));
    fprintf(f, "\t\"%d\": [ %d, 2 ],\n", 252+r*384,  *(int16_t *)(p+252+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 254+r*384,  *(int8_t *)(p+254+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 255+r*384,  *(int8_t *)(p+255+r*384));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 256+r*384,  *(int32_t *)(p+256+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 260+r*384,  *(int8_t *)(p+260+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 261+r*384,  *(int8_t *)(p+261+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 262+r*384,  *(int8_t *)(p+262+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 263+r*384,  *(int8_t *)(p+263+r*384));
    fprintf(f, "\t\"%d\": \"%p\",\n", 264+r*384, *(const char **)(p+264+r*384));
    fprintf(f, "\t\"%d\": \"%p\",\n", 272+r*384, *(const char **)(p+272+r*384));
    fprintf(f, "\t\"%d\": \"%p\",\n", 280+r*384, *(const char **)(p+280+r*384));
    fprintf(f, "\t\"%d\": \"%p\",\n", 288+r*384, *(const char **)(p+288+r*384));
    fprintf(f, "\t\"%d\": \"%p\",\n", 296+r*384, *(const char **)(p+296+r*384));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 304+r*384,  *(int64_t *)(p+304+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 312+r*384,  *(int8_t *)(p+312+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 313+r*384,  *(int8_t *)(p+313+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 314+r*384,  *(int8_t *)(p+314+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 315+r*384,  *(int8_t *)(p+315+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 316+r*384,  *(int8_t *)(p+316+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 317+r*384,  *(int8_t *)(p+317+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 318+r*384,  *(int8_t *)(p+318+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 319+r*384,  *(int8_t *)(p+319+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 320+r*384,  *(int8_t *)(p+320+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 321+r*384,  *(int8_t *)(p+321+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 322+r*384,  *(int8_t *)(p+322+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 323+r*384,  *(int8_t *)(p+323+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 324+r*384,  *(int8_t *)(p+324+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 325+r*384,  *(int8_t *)(p+325+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 326+r*384,  *(int8_t *)(p+326+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 327+r*384,  *(int8_t *)(p+327+r*384));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 328+r*384,  *(int32_t *)(p+328+r*384));
    fprintf(f, "\t\"%d\": [ %d, 2 ],\n", 332+r*384,  *(int16_t *)(p+332+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 334+r*384,  *(int8_t *)(p+334+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 335+r*384,  *(int8_t *)(p+335+r*384));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 336+r*384,  *(int32_t *)(p+336+r*384));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 340+r*384,  *(int32_t *)(p+340+r*384));
    fprintf(f, "\t\"%d\": [ %d, 2 ],\n", 344+r*384,  *(int16_t *)(p+344+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 346+r*384,  *(int8_t *)(p+346+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 347+r*384,  *(int8_t *)(p+347+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 348+r*384,  *(int8_t *)(p+348+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 349+r*384,  *(int8_t *)(p+349+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 350+r*384,  *(int8_t *)(p+350+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 351+r*384,  *(int8_t *)(p+351+r*384));
    fprintf(f, "\t\"%d\": \"%p\",\n", 352+r*384, *(const char **)(p+352+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 360+r*384,  *(int8_t *)(p+360+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 361+r*384,  *(int8_t *)(p+361+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 362+r*384,  *(int8_t *)(p+362+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 363+r*384,  *(int8_t *)(p+363+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 364+r*384,  *(int8_t *)(p+364+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 365+r*384,  *(int8_t *)(p+365+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 366+r*384,  *(int8_t *)(p+366+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 367+r*384,  *(int8_t *)(p+367+r*384));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 368+r*384,  *(int64_t *)(p+368+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 376+r*384,  *(int8_t *)(p+376+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 377+r*384,  *(int8_t *)(p+377+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 378+r*384,  *(int8_t *)(p+378+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 379+r*384,  *(int8_t *)(p+379+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 380+r*384,  *(int8_t *)(p+380+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 381+r*384,  *(int8_t *)(p+381+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 382+r*384,  *(int8_t *)(p+382+r*384));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 383+r*384,  *(int8_t *)(p+383+r*384));
    r++; 
    size += 384;
    goto self_start;
self_end:
    fprintf(f, "\t\"__size__\": %d,\n\t\"__type__\": \"%%class.PacketHandler.3481\"},\n", size);
    r = 0;
field_start:
    if (r >= rep) goto field_end;
    if (deref_error(*(const char **)(p+8+r*384))) { goto skip_1; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+8+r*384), len);
skip_1:
    if (deref_error(*(const char **)(p+40+r*384))) { goto skip_2; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+40+r*384), len);
skip_2:
    if (deref_error(*(const char **)(p+72+r*384))) { goto skip_3; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+72+r*384), len);
skip_3:
    if (deref_error(*(const char **)(p+128+r*384))) { goto skip_4; }
    len = 1;
    dump_class_DNSBackend(*(const char **)(p+128+r*384), len);
skip_4:
    if (deref_error(*(const char **)(p+144+r*384))) { goto skip_5; }
    len = 1;
    dump_class_AuthLua4_3473(*(const char **)(p+144+r*384), len);
skip_5:
    if (deref_error(*(const char **)(p+152+r*384))) { goto skip_6; }
    len = 1;
    dump_class_AuthLua4_3473(*(const char **)(p+152+r*384), len);
skip_6:
    if (deref_error(*(const char **)(p+160+r*384))) { goto skip_7; }
    len = 1;
    dump_class_AuthLua4_3473(*(const char **)(p+160+r*384), len);
skip_7:
    if (deref_error(*(const char **)(p+168+r*384))) { goto skip_8; }
    len = (*(int64_t *)(p+168+r*384+8) - *(int64_t *)(p+168+r*384)) / 8;
    dump_anon_0x133e0c2a0(*(const char **)(p+168+r*384), len);
    for (int j=0; j<len; j++) {
        const char *pp = *(const char **)(*(const char **)(p+168+r*384) + 8*j);
        if (!deref_error(pp)) dump_class_DNSBackend(pp, 1);
    }
skip_8:
    if (deref_error(*(const char **)(p+192+r*384))) { goto skip_9; }
    len = 1;
    dump_class_UeberBackend(*(const char **)(p+192+r*384), len);
skip_9:
    if (deref_error(*(const char **)(p+200+r*384))) { goto skip_10; }
    len = 1;
    dump_class_DNSBackend(*(const char **)(p+200+r*384), len);
skip_10:
    if (deref_error(*(const char **)(p+208+r*384))) { goto skip_11; }
    len = 1;
    dump_class_DNSPacket(*(const char **)(p+208+r*384), len);
skip_11:
    if (deref_error(*(const char **)(p+216+r*384))) { goto skip_12; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+216+r*384), len);
skip_12:
    if (deref_error(*(const char **)(p+264+r*384))) { goto skip_13; }
    len = (*(int64_t *)(p+264+r*384+8) - *(int64_t *)(p+264+r*384)) / 120;
    dump_struct_DNSZoneRecord(*(const char **)(p+264+r*384), len);
skip_13:
    if (deref_error(*(const char **)(p+288+r*384))) { goto skip_14; }
    len = 1;
    dump_struct_DNSZoneRecord(*(const char **)(p+288+r*384), len);
skip_14:
    if (deref_error(*(const char **)(p+296+r*384))) { goto skip_15; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+296+r*384), len);
skip_15:
    if (deref_error(*(const char **)(p+352+r*384))) { goto skip_16; }
    len = 1;
    dump_class_UeberBackend(*(const char **)(p+352+r*384), len);
skip_16:

    r++;
    goto field_start;
field_end:
    return;
}

static void dump__class_boost__multi_index__multi_index_container_20_(const char *p, int rep) {
    int len; int size = 0;
    if (dumped.find({(uint64_t)p, (uint64_t)dump__class_boost__multi_index__multi_index_container_20_}) != dumped.end()) return;
    dumped.insert({(uint64_t)p, (uint64_t)dump__class_boost__multi_index__multi_index_container_20_});
    fprintf(f, "\"%p\": {\n", p);
    int r = 0;
self_start:
    if (r >= rep) goto self_end;
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 0+r*88,  *(int8_t *)(p+0+r*88));
    fprintf(f, "\t\"%d\": \"%p\",\n", 8+r*88, *(const char **)(p+8+r*88));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 16+r*88,  *(int8_t *)(p+16+r*88));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 17+r*88,  *(int8_t *)(p+17+r*88));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 18+r*88,  *(int8_t *)(p+18+r*88));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 19+r*88,  *(int8_t *)(p+19+r*88));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 20+r*88,  *(int8_t *)(p+20+r*88));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 24+r*88,  *(int64_t *)(p+24+r*88));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 32+r*88,  *(int8_t *)(p+32+r*88));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 40+r*88,  *(int64_t *)(p+40+r*88));
    fprintf(f, "\t\"%d\": \"%p\",\n", 48+r*88, *(const char **)(p+48+r*88));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 56+r*88,  *(int32_t *)(p+56+r*88));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 64+r*88,  *(int64_t *)(p+64+r*88));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 72+r*88,  *(int8_t *)(p+72+r*88));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 73+r*88,  *(int8_t *)(p+73+r*88));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 80+r*88,  *(int64_t *)(p+80+r*88));
    r++; 
    size += 88;
    goto self_start;
self_end:
    fprintf(f, "\t\"__size__\": %d,\n\t\"__type__\": \"%%\\\"class.boost::multi_index::multi_index_container.20\\\"\"},\n", size);
    r = 0;
field_start:
    if (r >= rep) goto field_end;
    if (deref_error(*(const char **)(p+8+r*88))) { goto skip_1; }
    len = 1;
    dump__struct_boost__multi_index__detail__ordered_index_node_26_(*(const char **)(p+8+r*88), len);
skip_1:
    if (deref_error(*(const char **)(p+48+r*88))) { goto skip_2; }
    len = 1;
    dump__struct_boost__multi_index__detail__hashed_index_base_node_impl_(*(const char **)(p+48+r*88), len);
skip_2:

    r++;
    goto field_start;
field_end:
    return;
}

static void dump_class_DNSBackend(const char *p, int rep) {
    if (dumped.find({(uint64_t)p, (uint64_t)dump_class_DNSBackend}) != dumped.end()) return;
    dumped.insert({(uint64_t)p, (uint64_t)dump_class_DNSBackend});
    dump_polymorphic(p, rep);
}

static void dump__struct_boost__multi_index__detail__ordered_index_node_26_(const char *p, int rep) {
    int len; int size = 0;
    if (dumped.find({(uint64_t)p, (uint64_t)dump__struct_boost__multi_index__detail__ordered_index_node_26_}) != dumped.end()) return;
    dumped.insert({(uint64_t)p, (uint64_t)dump__struct_boost__multi_index__detail__ordered_index_node_26_});
    fprintf(f, "\"%p\": {\n", p);
    int r = 0;
self_start:
    if (r >= rep) goto self_end;
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 0+r*168,  *(int8_t *)(p+0+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 1+r*168,  *(int8_t *)(p+1+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 2+r*168,  *(int8_t *)(p+2+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 3+r*168,  *(int8_t *)(p+3+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 4+r*168,  *(int8_t *)(p+4+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 5+r*168,  *(int8_t *)(p+5+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 6+r*168,  *(int8_t *)(p+6+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 7+r*168,  *(int8_t *)(p+7+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 8+r*168,  *(int8_t *)(p+8+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 9+r*168,  *(int8_t *)(p+9+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 10+r*168,  *(int8_t *)(p+10+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 11+r*168,  *(int8_t *)(p+11+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 12+r*168,  *(int8_t *)(p+12+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 13+r*168,  *(int8_t *)(p+13+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 14+r*168,  *(int8_t *)(p+14+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 15+r*168,  *(int8_t *)(p+15+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 16+r*168,  *(int8_t *)(p+16+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 17+r*168,  *(int8_t *)(p+17+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 18+r*168,  *(int8_t *)(p+18+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 19+r*168,  *(int8_t *)(p+19+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 20+r*168,  *(int8_t *)(p+20+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 21+r*168,  *(int8_t *)(p+21+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 22+r*168,  *(int8_t *)(p+22+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 23+r*168,  *(int8_t *)(p+23+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 24+r*168,  *(int8_t *)(p+24+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 25+r*168,  *(int8_t *)(p+25+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 26+r*168,  *(int8_t *)(p+26+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 27+r*168,  *(int8_t *)(p+27+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 28+r*168,  *(int8_t *)(p+28+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 29+r*168,  *(int8_t *)(p+29+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 30+r*168,  *(int8_t *)(p+30+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 31+r*168,  *(int8_t *)(p+31+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 32+r*168,  *(int8_t *)(p+32+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 33+r*168,  *(int8_t *)(p+33+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 34+r*168,  *(int8_t *)(p+34+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 35+r*168,  *(int8_t *)(p+35+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 36+r*168,  *(int8_t *)(p+36+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 37+r*168,  *(int8_t *)(p+37+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 38+r*168,  *(int8_t *)(p+38+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 39+r*168,  *(int8_t *)(p+39+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 40+r*168,  *(int8_t *)(p+40+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 41+r*168,  *(int8_t *)(p+41+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 42+r*168,  *(int8_t *)(p+42+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 43+r*168,  *(int8_t *)(p+43+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 44+r*168,  *(int8_t *)(p+44+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 45+r*168,  *(int8_t *)(p+45+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 46+r*168,  *(int8_t *)(p+46+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 47+r*168,  *(int8_t *)(p+47+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 48+r*168,  *(int8_t *)(p+48+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 49+r*168,  *(int8_t *)(p+49+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 50+r*168,  *(int8_t *)(p+50+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 51+r*168,  *(int8_t *)(p+51+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 52+r*168,  *(int8_t *)(p+52+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 53+r*168,  *(int8_t *)(p+53+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 54+r*168,  *(int8_t *)(p+54+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 55+r*168,  *(int8_t *)(p+55+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 56+r*168,  *(int8_t *)(p+56+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 57+r*168,  *(int8_t *)(p+57+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 58+r*168,  *(int8_t *)(p+58+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 59+r*168,  *(int8_t *)(p+59+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 60+r*168,  *(int8_t *)(p+60+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 61+r*168,  *(int8_t *)(p+61+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 62+r*168,  *(int8_t *)(p+62+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 63+r*168,  *(int8_t *)(p+63+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 64+r*168,  *(int8_t *)(p+64+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 65+r*168,  *(int8_t *)(p+65+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 66+r*168,  *(int8_t *)(p+66+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 67+r*168,  *(int8_t *)(p+67+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 68+r*168,  *(int8_t *)(p+68+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 69+r*168,  *(int8_t *)(p+69+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 70+r*168,  *(int8_t *)(p+70+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 71+r*168,  *(int8_t *)(p+71+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 72+r*168,  *(int8_t *)(p+72+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 73+r*168,  *(int8_t *)(p+73+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 74+r*168,  *(int8_t *)(p+74+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 75+r*168,  *(int8_t *)(p+75+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 76+r*168,  *(int8_t *)(p+76+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 77+r*168,  *(int8_t *)(p+77+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 78+r*168,  *(int8_t *)(p+78+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 79+r*168,  *(int8_t *)(p+79+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 80+r*168,  *(int8_t *)(p+80+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 81+r*168,  *(int8_t *)(p+81+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 82+r*168,  *(int8_t *)(p+82+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 83+r*168,  *(int8_t *)(p+83+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 84+r*168,  *(int8_t *)(p+84+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 85+r*168,  *(int8_t *)(p+85+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 86+r*168,  *(int8_t *)(p+86+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 87+r*168,  *(int8_t *)(p+87+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 88+r*168,  *(int8_t *)(p+88+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 89+r*168,  *(int8_t *)(p+89+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 90+r*168,  *(int8_t *)(p+90+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 91+r*168,  *(int8_t *)(p+91+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 92+r*168,  *(int8_t *)(p+92+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 93+r*168,  *(int8_t *)(p+93+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 94+r*168,  *(int8_t *)(p+94+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 95+r*168,  *(int8_t *)(p+95+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 96+r*168,  *(int8_t *)(p+96+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 97+r*168,  *(int8_t *)(p+97+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 98+r*168,  *(int8_t *)(p+98+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 99+r*168,  *(int8_t *)(p+99+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 100+r*168,  *(int8_t *)(p+100+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 101+r*168,  *(int8_t *)(p+101+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 102+r*168,  *(int8_t *)(p+102+r*168));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 103+r*168,  *(int8_t *)(p+103+r*168));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 104+r*168,  *(int64_t *)(p+104+r*168));
    fprintf(f, "\t\"%d\": \"%p\",\n", 112+r*168, *(const char **)(p+112+r*168));
    fprintf(f, "\t\"%d\": \"%p\",\n", 120+r*168, *(const char **)(p+120+r*168));
    fprintf(f, "\t\"%d\": \"%p\",\n", 128+r*168, *(const char **)(p+128+r*168));
    fprintf(f, "\t\"%d\": \"%p\",\n", 136+r*168, *(const char **)(p+136+r*168));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 144+r*168,  *(int64_t *)(p+144+r*168));
    fprintf(f, "\t\"%d\": \"%p\",\n", 152+r*168, *(const char **)(p+152+r*168));
    fprintf(f, "\t\"%d\": \"%p\",\n", 160+r*168, *(const char **)(p+160+r*168));
    r++; 
    size += 168;
    goto self_start;
self_end:
    fprintf(f, "\t\"__size__\": %d,\n\t\"__type__\": \"%%\\\"struct.boost::multi_index::detail::ordered_index_node.26\\\"\"},\n", size);
    r = 0;
field_start:
    if (r >= rep) goto field_end;
    if (deref_error(*(const char **)(p+112+r*168))) { goto skip_1; }
    len = 1;
    dump__struct_boost__multi_index__detail__ordered_index_node_impl_(*(const char **)(p+112+r*168), len);
skip_1:
    if (deref_error(*(const char **)(p+120+r*168))) { goto skip_2; }
    len = 1;
    dump__struct_boost__multi_index__detail__ordered_index_node_impl_(*(const char **)(p+120+r*168), len);
skip_2:
    if (deref_error(*(const char **)(p+128+r*168))) { goto skip_3; }
    len = 1;
    dump__struct_boost__multi_index__detail__hashed_index_node_impl_(*(const char **)(p+128+r*168), len);
skip_3:
    if (deref_error(*(const char **)(p+136+r*168))) { goto skip_4; }
    len = 1;
    dump__struct_boost__multi_index__detail__hashed_index_base_node_impl_(*(const char **)(p+136+r*168), len);
skip_4:
    if (deref_error(*(const char **)(p+152+r*168))) { goto skip_5; }
    len = 1;
    dump__struct_boost__multi_index__detail__ordered_index_node_impl_(*(const char **)(p+152+r*168), len);
skip_5:
    if (deref_error(*(const char **)(p+160+r*168))) { goto skip_6; }
    len = 1;
    dump__struct_boost__multi_index__detail__ordered_index_node_impl_(*(const char **)(p+160+r*168), len);
skip_6:

    r++;
    goto field_start;
field_end:
    return;
}

static void dump_struct_Bind2DNSRecordExt(const char *p, int rep) {
    int len; int size = 0;
    if (dumped.find({(uint64_t)p, (uint64_t)dump_struct_Bind2DNSRecordExt}) != dumped.end()) return;
    dumped.insert({(uint64_t)p, (uint64_t)dump_struct_Bind2DNSRecordExt});
    fprintf(f, "\"%p\": {\n", p);
    int r = 0;
self_start:
    if (r >= rep) goto self_end;
    fprintf(f, "\t\"%d\": \"%p\",\n", 0+r*144, *(const char **)(p+0+r*144));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 8+r*144,  *(int64_t *)(p+8+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 16+r*144,  *(int8_t *)(p+16+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 17+r*144,  *(int8_t *)(p+17+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 18+r*144,  *(int8_t *)(p+18+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 19+r*144,  *(int8_t *)(p+19+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 20+r*144,  *(int8_t *)(p+20+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 21+r*144,  *(int8_t *)(p+21+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 22+r*144,  *(int8_t *)(p+22+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 23+r*144,  *(int8_t *)(p+23+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 24+r*144,  *(int8_t *)(p+24+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 25+r*144,  *(int8_t *)(p+25+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 26+r*144,  *(int8_t *)(p+26+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 27+r*144,  *(int8_t *)(p+27+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 28+r*144,  *(int8_t *)(p+28+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 29+r*144,  *(int8_t *)(p+29+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 30+r*144,  *(int8_t *)(p+30+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 31+r*144,  *(int8_t *)(p+31+r*144));
    fprintf(f, "\t\"%d\": \"%p\",\n", 32+r*144, *(const char **)(p+32+r*144));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 40+r*144,  *(int64_t *)(p+40+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 48+r*144,  *(int8_t *)(p+48+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 49+r*144,  *(int8_t *)(p+49+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 50+r*144,  *(int8_t *)(p+50+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 51+r*144,  *(int8_t *)(p+51+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 52+r*144,  *(int8_t *)(p+52+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 53+r*144,  *(int8_t *)(p+53+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 54+r*144,  *(int8_t *)(p+54+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 55+r*144,  *(int8_t *)(p+55+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 56+r*144,  *(int8_t *)(p+56+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 57+r*144,  *(int8_t *)(p+57+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 58+r*144,  *(int8_t *)(p+58+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 59+r*144,  *(int8_t *)(p+59+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 60+r*144,  *(int8_t *)(p+60+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 61+r*144,  *(int8_t *)(p+61+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 62+r*144,  *(int8_t *)(p+62+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 63+r*144,  *(int8_t *)(p+63+r*144));
    fprintf(f, "\t\"%d\": \"%p\",\n", 64+r*144, *(const char **)(p+64+r*144));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 72+r*144,  *(int64_t *)(p+72+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 80+r*144,  *(int8_t *)(p+80+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 81+r*144,  *(int8_t *)(p+81+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 82+r*144,  *(int8_t *)(p+82+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 83+r*144,  *(int8_t *)(p+83+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 84+r*144,  *(int8_t *)(p+84+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 85+r*144,  *(int8_t *)(p+85+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 86+r*144,  *(int8_t *)(p+86+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 87+r*144,  *(int8_t *)(p+87+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 88+r*144,  *(int8_t *)(p+88+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 89+r*144,  *(int8_t *)(p+89+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 90+r*144,  *(int8_t *)(p+90+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 91+r*144,  *(int8_t *)(p+91+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 92+r*144,  *(int8_t *)(p+92+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 93+r*144,  *(int8_t *)(p+93+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 94+r*144,  *(int8_t *)(p+94+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 95+r*144,  *(int8_t *)(p+95+r*144));
    fprintf(f, "\t\"%d\": [ %d, 4 ],\n", 96+r*144,  *(int32_t *)(p+96+r*144));
    fprintf(f, "\t\"%d\": [ %d, 2 ],\n", 100+r*144,  *(int16_t *)(p+100+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 102+r*144,  *(int8_t *)(p+102+r*144));
    fprintf(f, "\t\"%d\": [ %d, 1 ],\n", 103+r*144,  *(int8_t *)(p+103+r*144));
    fprintf(f, "\t\"%d\": [ %lld, 8 ],\n", 104+r*144,  *(int64_t *)(p+104+r*144));
    fprintf(f, "\t\"%d\": \"%p\",\n", 112+r*144, *(const char **)(p+112+r*144));
    fprintf(f, "\t\"%d\": \"%p\",\n", 120+r*144, *(const char **)(p+120+r*144));
    fprintf(f, "\t\"%d\": \"%p\",\n", 128+r*144, *(const char **)(p+128+r*144));
    fprintf(f, "\t\"%d\": \"%p\",\n", 136+r*144, *(const char **)(p+136+r*144));
    r++; 
    size += 144;
    goto self_start;
self_end:
    fprintf(f, "\t\"__size__\": %d,\n\t\"__type__\": \"%%struct.Bind2DNSRecordExt\"},\n", size);
    r = 0;
field_start:
    if (r >= rep) goto field_end;
    if (deref_error(*(const char **)(p+0+r*144))) { goto skip_1; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+0+r*144), len);
skip_1:
    if (deref_error(*(const char **)(p+32+r*144))) { goto skip_2; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+32+r*144), len);
skip_2:
    if (deref_error(*(const char **)(p+64+r*144))) { goto skip_3; }
    len = 1;
    dump_anon_0x133e09480(*(const char **)(p+64+r*144), len);
skip_3:
    if (deref_error(*(const char **)(p+112+r*144))) { goto skip_4; }
    len = 1;
    dump__struct_boost__multi_index__detail__ordered_index_node_impl_(*(const char **)(p+112+r*144), len);
skip_4:
    if (deref_error(*(const char **)(p+120+r*144))) { goto skip_5; }
    len = 1;
    dump__struct_boost__multi_index__detail__ordered_index_node_impl_(*(const char **)(p+120+r*144), len);
skip_5:
    if (deref_error(*(const char **)(p+128+r*144))) { goto skip_6; }
    len = 1;
    dump__struct_boost__multi_index__detail__hashed_index_node_impl_(*(const char **)(p+128+r*144), len);
skip_6:
    if (deref_error(*(const char **)(p+136+r*144))) { goto skip_7; }
    len = 1;
    dump__struct_boost__multi_index__detail__hashed_index_base_node_impl_(*(const char **)(p+136+r*144), len);
skip_7:

    r++;
    goto field_start;
field_end:
    return;
}

static void dump__class_std__basic_ofstream_(const char *p, int rep) {
    int len; int size = 0;
    if (dumped.find({(uint64_t)p, (uint64_t)dump__class_std__basic_ofstream_}) != dumped.end()) return;
    dumped.insert({(uint64_t)p, (uint64_t)dump__class_std__basic_ofstream_});
    fprintf(f, "\"%p\": {\n", p);
    int r = 0;
self_start:
    if (r >= rep) goto self_end;
    r++; 
    size += 512;
    goto self_start;
self_end:
    fprintf(f, "\t\"__size__\": %d,\n\t\"__type__\": \"%%\\\"class.std::basic_ofstream\\\"\"},\n", size);
    r = 0;
field_start:
    if (r >= rep) goto field_end;

    r++;
    goto field_start;
field_end:
    return;
}


static void
dump_start() {
    f = fopen("/app/dump.json", "w");
    reader.load("/app/pdns/pdns_server");
    ELFIO::Elf_Half sec_num = reader.sections.size();
    for ( int i = 0; i < sec_num; ++i ) {
        ELFIO::section* psec = reader.sections[i]; 
        const char* p = reader.sections[i]->get_data();
        if ( psec->get_type() == ELFIO::SHT_SYMTAB ) { 
            const ELFIO::symbol_section_accessor symbols(reader, psec); 
            ELFIO::Elf_Xword symbols_num = symbols.get_symbols_num();
            for ( unsigned int j = 0; j < symbols_num; ++j ) { 
                std::string name;
                ELFIO::Elf64_Addr value;
                ELFIO::Elf_Xword size;
                unsigned char bind;
                unsigned char type;
                ELFIO::Elf_Half section_index;
                unsigned char other;
                symbols.get_symbol( j, name, value, size, bind, type, section_index, other );
                addr2name[value] = name;
                name2addr[name] = value;
            }
        }
    }
    offset = (uint64_t)(&jbuf) - name2addr["_ZL4jbuf"];

    // populate the polymorphic map
    polydump["_ZTV12Bind2Backend"] = dump_class_Bind2Backend;
}

static void
dump_end() {
    fclose(f);
}

static void
dump_polymorphic(const char *p, int rep) {
    uint64_t vtable = *(uint64_t *)(p);
    std::string type_name = addr2name[vtable - 16 - offset];
    printf("dumping actual type: %s\n", type_name.c_str());
    polydump[type_name](p, rep);
}
