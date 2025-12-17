# CoreDNS
> version 1.10.1

### Scope

The analysis focuses on the **authoritative name server implementation**. The core implementation is located at `core/dnsserver/server.go`.

### `Server.ServeDNS`

This is the entry point for handling every request. It acts as a multiplexer for the requests zonename as defined in the request so that the correct zone (configuration and plugin stack) will handle the request.

Basically it does some checks, some error logging (strippable), metrics (strippable), formatting, then invoke a plugin chain (`h.pluginChain.ServeDNS(ctx, w, r)`). Some further handling follows.

**Plugins**

CoreDNS is built around the idea of chaining plugins, where each plugin implements one DNS function. In our scope, the **`plugin/file`** plugin implements an RFC-conformant resolution engine that resolve queries using a master zone file (what we need).

### `File.ServeDNS`

**Strippable**
* Logs

**Important**

* `Zones.Matches()` for finding the responsible zone
* `NextOrFailure()` for getting to the next zone
* `Zone.Lookup()` is the main search logic
* The rest of the code handles RCODE and more

**Perhaps in Scope**
* Locking

### `Zone.Lookup`
> In `plugin/file/lookup.go`.

* **Name manipulation**
Some care may need to be taken, because CoreDNS uses plain String to encode DNS name, which can be hard for SE.
Functions include `nameFromRight()`, `replaceWithAsteriskLabel()`, `synthesizeCNAME()`, `isSubDomain()` and more.

* **Searching**
`Tree.Search()`, `Tree.Glue()` do the job. `Zone.externalLookup()`, `Zone.doLookup()` and `Zone.additionalProcessing()` are merely variants of `Lookup()`, for iterative querying or additional processing.
The behavior based on RRTYPE is handled in `Zone.Lookup()`.

### `Tree.Search`
>  In `plugin/file/tree/tree.go`.

The tree implementation is a "Left-Leaning Red Black tree".
`Tree.Search` is a plain lookup.


### `Tree.Glue`
>  In `plugin/file/tree/glue.go`.

`Tree.Glue` wraps `Tree.Search` for searching for glue records.

