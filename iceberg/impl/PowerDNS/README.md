# PowerDNS
> version 1.10.1

### Build

Note: `./configure --with-modules="bind" --disable-lua-records BOOST_ROOT=XXX` (`brew info boost` to find out the path) to tell `configure` where Boost is.

(We are interested in the `"bind"` backend, which understands bind zone files.)

`sphinx` seems not working, so disable the building of `docs` by modifying `Makefile`.

### Structure

PowerDNS is, again, an authoritative name server and also a recursor. We focus on the **authoritative name server** implementation.

The main entry point of the name server is `pdns/auth-main.cc::main()`. However it is probably more helpful to look at `pdns/nameserver.cc` documentation:
```txt
High level overview

The Distributor contains a configurable number of PacketHandler instances, each in its own thread, for connection pooling. 
PacketHandler instances are recycled of they let escape an PDNSException.

The PacketHandler implements the RFC1034 algorithm and converts question packets into DNSBackend queries.

A DNSBackend is an entity that returns DNSResourceRecord objects in return to explicit questions for domains with a specified QType

PowerDNS uses the UeberBackend, which hosts DNSBackends. By default it has no DNSBackends within itself, those are loaded by setting --load=<list of backends>. This way DNSBackend implementations can be kept completely separate, but most aren't.

If one or more DNSBackends are loaded, the UeberBackend fields the queries to all of them until one answers.
```

`pdns/packethandler.cc` has this huge function called `doQuestion()`, which **implements the full logic for resolving a query**. (500+ LOC)

Some other functions in `pdns/packethandler.cc` further handle addtionals, DNAME/CNAMEs, referals, etc. Yet, in general, this code severely **lacks modularity**.

### Backend

On the contrary, PowerDNS do not implement tree-like searching, like Bind or CoreDNS. Instead, the backend is a blackbox; or in the case of `bindbackend`, a `multi_index_container` from the Boost library.

Of course, we'll have to assume the correctness of the backend, and somehow model it. 

In general, if the implementation has its own tree-search code, it would also exhibit similar "backend-like" API that we can model. Above that, automated summary and SE work wonders. Below that, when it comes to byte-level strings, lists and blackboxes, we may have to use manual SPEC / invariant based methods for them.

### How to compile

Compile using `clang++ 16.0.6`, under `/pdns`:
```sh
clang++ -S -emit-llvm \
    -I/opt/homebrew/Cellar/boost/1.82.0_1/include \
    -I/opt/homebrew/Cellar/openssl@3/3.1.1_1/include \
    -I/opt/homebrew/Cellar/lua/5.4.6/include/lua -I../ \
    -fno-inline-functions -O1 \
    -fno-vectorize XXX.c
```
Replace the Boost include path as needed. If Boost was installed with `brew install boost`, `brew info boost` will give the path. Same goes for OpenSSL and Lua.

`sha.hh` and `misc.hh` may need fixing:
```c
// /--- sha.hh
// FIXME: the `defined(HAVE_EVP_MD_CTX_NEW)` checks seem messed up,
// Fix temporarily using definitions from <openssl/evp.h>.
#define EVP_MD_CTX_destroy EVP_MD_CTX_free
```

```c
// /--- misc.hh
// FIXME: `config.h` defined otherwise, making `getMessageFromErrno` not defined.
#define HAVE_LIBCRYPTO 0
```