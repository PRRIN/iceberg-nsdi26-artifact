# Caveats in the Z3 Library

The `smt::context::log_stats` contains complicated statistics formatting,
that is only printed when verbosity >= 2. 

However, the current implementation of it means that even when we call it
with a low verbosity level, the statistics would still be formatted, albeit
not ultimately printed.

This, according to `perf`, leads to a whopping **13%** overhead in `--release`
builds.

For now we just manually fix it:

```c++
// ~/.cargo/registry/src/index.crates.io-XXX/z3-sys-0.8.1/z3/src/smt/smt_context_pp.cpp

void context::log_stats() {
    // ----
    // Add this:
    bool do_log = false;
    IF_VERBOSE(2, do_log = true);
    if (!do_log) {
        return;
    }
    // ----
    ..

```