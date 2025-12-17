# Bind
> version 9.18.16

### Scope

> Bind can be configured as an authoritative name server or a resolver.
![](pics/recursive-query.png)
This analysis focuses specifically on the **authoritative name server implementation**. As such, `lib/dns/resolver.c` is currently out of scope. Instead, the main target logic lives in `lib/ns/query.c`.

The main concerning source file is `lib/ns/query.c`.
Query handling starts at `ns_query_start()`, which calls `query_setup()` to setup up a **query context** (`query_ctx_t`), which in turn calls `ns__query_start()` that really starts to properly fill the context as response.

We shall pick `ns__query_start()` as the analysis root, as `query_setup()` is not interesting. `ns_query_start()` mainly sets up flags and cleanup procedures, and denies ill-formed queries, which can be interesting. However, for now it is just easier to assume one fixed set of flags and non-ill queries.

Here is a rundown:

```c
/**
 * 1. Set up query context and other resources for a client
 *    query (query_setup())
 *
 * 2. Start the search (ns__query_start())
 *
 * 3. Identify authoritative data sources which may have an answer;
 *    search them (query_lookup()). If an answer is found, go to 7.
 *
 * 4. If recursion or cache access are allowed, search the cache
 *    (query_lookup() again, using the cache database) to find a better
 *    answer. If an answer is found, go to 7.
 *
 * 5. If recursion is allowed, begin recursion (ns_query_recurse()).
 *    Go to 15 to clean up this phase of the query. When recursion
 *    is complete, processing will resume at 6.
 *
 * 6. Resume from recursion; set up query context for resumed processing.
 *
 * 7. Determine what sort of answer we've found (query_gotanswer())
 *    and call other functions accordingly:
 *      - not found (auth or cache), go to 8
 *      - delegation, go to 9
 *      - no such domain (auth), go to 10
 *      - empty answer (auth), go to 11
 *      - negative response (cache), go to 12
 *      - answer found, go to 13
 *
 * 8. The answer was not found in the database (query_notfound().
 *    Set up a referral and go to 9.
 *
 * 9. Handle a delegation response (query_delegation()). If we need
 *    to and are allowed to recurse (query_delegation_recurse()), go to 5,
 *    otherwise go to 15 to clean up and return the delegation to the client.
 *
 * 10. No such domain (query_nxdomain()). Attempt redirection; if
 *     unsuccessful, add authority section records (query_addsoa(),
 *     query_addauth()), then go to 15 to return NXDOMAIN to client.
 *
 * 11. Empty answer (query_nodata()). Add authority section records
 *     (query_addsoa(), query_addauth()) and signatures if authoritative
 *     (query_sign_nodata()) then go to 15 and return
 *     NOERROR/ANCOUNT=0 to client.
 *
 * 12. No such domain or empty answer returned from cache (query_ncache()).
 *     Set response code appropriately, go to 11.
 *
 * 13. Prepare a response (query_prepresponse()) and then fill it
 *     appropriately (query_respond(), or for type ANY,
 *     query_respond_any()).
 *
 * 14. If a restart is needed due to CNAME/DNAME chaining, go to 2.
 *
 * 15. Clean up resources. If recursing, stop and wait for the event
 *     handler to be called back (step 6).  If an answer is ready,
 *     return it to the client.
 *
 * (This description omits several special cases including
 * DNS64, RPZ, RRL, and the SERVFAIL cache. It also doesn't discuss
 * plugins.)
 */
```

### `ns__query_start`

**Strippable**
* Call hooks
* Cookies
* Stub resolvers
* Stats
* Logs

**Important**

* `dns_rdata_checkowner()` for QNAME validity
(Not to be confused with `query_error()` checks, which checks for invariants. This fails with `QUERY_ERROR` macro that just early stops the resolution.)

* `query_getdb()` and `query_getzonedb()` for getting `db` (database). 
`zone` and `db` are thus interesting concepts. Also, `db` is potentially polymorphed with `db_implementation`, but currently only `rbtdb` is used, which is a Red-Black Tree.
Basically, `db` stores zone data, and `zone` holds the metadata.

* `query_lookup()` for actual lookup.

**Perhaps in scope**

* `root_key_sentinel_detect()` for root-key-sentinel (DNSSEC).

* Resource management with `attach` and `detach` pattern.

### `query_lookup`

**Strippable**

* `dns_view_staleanswerenabled()`, stale records and the cache

**Perhaps in scope**

* `qctx_prepare_buffers()` for memory allocation

**Important**

* `dns_db_findext()` for searching name in the database, specifically the Red-Black Tree implementation.
The method is invoked via registered callback. The function that is really called is `zone_find()` in `lib/dns/rbtdb.c`.

* `query_gotanswer()` for further handling of found results.

### `zone_find`

**Perhaps in scope**

* Locking, specifically RWLocks.
However, if the resolution process is strictly read-only, it is then tempting to strip the analysis of locks.
Also atomic reads and writes.

* `find_closest_nsec()` and DNSSEC.

* `dns_rbtnodechain_reset()` and other reference counting stuff.

**Important**

* `dns_rbt_findnode()` for the name matching.
Also `setup_delegation()` for delegation and `find_wildcard()` for wildcard match.


### `query_gotanswer`

**Perhaps in scope**

* `root_key_sentinel_return_servfail()` and DNSSEC

* `query_checkrpz()` and DNS RPZ

**Important**

* `query_prepresponse()`, `query_notfound()`, `query_delegation()`, `query_nodata()`, `query_nxdomain()`, `query_cname()`, `query_dname()` for handling responses by RCODE.
Some of the branches include DNSSEC and caching.

### Further Calls

The above functions further calls into `ns_query_recurse()`, `query_zone_delegation()`, `query_redirect()`, `query_delegation_recurse()`, `query_addsoa()`, `query_addauth()`, `ns_query_done()` and each other.

