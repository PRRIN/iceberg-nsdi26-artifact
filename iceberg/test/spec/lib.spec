// Library for SPEC.
// TODO: all SPEC needs to be rewritten
// 
// Implements the generic `fold` function over `List<_>`s, and a bunch
// of other useful functional utilities.

fn fold<E, I>(list: List<E>, f: (I, E)->I, init: I) -> I {
    if len(list) == 0 {
        init
    } else {
        fold::<E, I>(list[1..], f, f(init, list[0]))
    }
}

fn map<S, T>(list: List<S>, f: (S)->T) -> List<T> {
    fold::<S, List<T>>(
        list, 
        |mapped, elem| {
            mapped ++ [f(elem)]
        },
        [],
    )
}

fn filter<E>(list: List<E>, f: (E)->Bool) -> List<E> {
    fold::<E, List<E>>(
        list, 
        |filtered, elem| {
            filtered ++ if f(elem) { [elem] } else { [] }
        },
        [],
    )
}

fn max<E>(list: List<E>, f: (E)->Int) -> Int {
    fold::<E, Int>(
        list, 
        |res, elem| {
            let new = f(elem);
            if new >s res { new } else { res }
        },
        0,
    )
}

fn any<E>(list: List<E>, f: (E)->Bool) -> Bool {
    fold::<E, Bool>(
        list,
        |res, elem| { res || f(elem) },
        false,
    )
}

fn all<E>(list: List<E>, f: (E)->Bool) -> Bool {
    fold::<E, Bool>(
        list,
        |res, elem| { res && f(elem) },
        true,
    )
}

fn rev<E>(list: List<E>) -> List<E> {
    fold::<E, List<E>>(
        list,
        |res, elem| { [elem] ++ res },
        [],
    )
}


fn fold2<A, B, I>(
    l0: List<A>,
    l1: List<B>,
    f: (I, A, B) -> I,
    init: I,
) -> I {
    let len0 = len(l0);
    let len1 = len(l1);
    if len0 == 0 || len1 == 0 {
        init
    } else {
        fold2::<A, B, I>(l0[1..], l1[1..], f, f(init, l0[0], l1[0]))
    }
}

fn list_eq<E>(l0: List<E>, l1: List<E>) -> Bool {
    let len0 = len(l0);
    let len1 = len(l1);
    len0 == len1
    && fold2::<E, E, Bool>(
        l0,
        l1,
        |eq, elem0, elem1| { eq && elem0 == elem1 },
        true,
    )
}

fn list_eq_by<E>(l0: List<E>, l1: List<E>, cmp: (E, E)->Bool) -> Bool {
    let len0 = len(l0);
    let len1 = len(l1);
    len0 == len1
    && fold2::<E, E, Bool>(
        l0,
        l1,
        |eq, elem0, elem1| { eq && cmp(elem0, elem1) },
        true,
    )
}

struct ListCmp {
    cnt: Int,
    diff: Bool,
}
fn list_cmp<E>(l0: List<E>, l1: List<E>) -> Int {
    fold2::<E, E, ListCmp>(
        l0,
        l1,
        |cmp, elem0, elem1| {
            if !cmp.diff && elem0 == elem1 {
                ListCmp {
                    cnt: cmp.cnt + 1,
                    diff: false,
                }
            } else {
                ListCmp {
                    cnt: cmp.cnt,
                    diff: true,
                }
            }
        },
        ListCmp {
            cnt: 0,
            diff: false,
        },
    ).cnt
}

// ------------
// Tests
// ------------

fn test_map(list: List<Int>) -> List<Bool> {
    map::<Int, Bool>(list, |e| { e >s 0 })
}

fn test_find_max(list: List<Int>) -> List<Int> {
    let max_value = max::<Int>(list, |e| {e});
    filter::<Int>(list, |elem| { elem == max_value })
}

fn test_list_cmp(l0: List<Int>, l1: List<Int>) -> Int {
    list_cmp::<Int>(l0, l1)
}