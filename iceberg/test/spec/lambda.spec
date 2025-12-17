
fn fold<E, I>(list: List<E>, f: (I, E)->I, init: I) -> I {
    if len(list) == 0 {
        init
    } else {
        fold::<E, I>(list[1..], f, f(init, list[0]))
    }
}

fn all<E>(list: List<E>, f: (E)->Bool) -> Bool {
    fold::<E, Bool>(
        list,
        |res, elem| { res && f(elem) },
        true,
    )
}

fn string_find_first_not_of(self: Ptr, s: Ptr, pos: Int<64>) -> Int<64> {
    let len = self |> String.len |> *Int<64>;
    let _ = specialize(len);
    let _ = specialize(pos);
    __string_find(
        self |> String.data |> *Ptr, 
        pos, 
        len, 
        __str_to_list(s),
        |ch, aux| { all::<Int<8>>(aux, |c| { ch != c }) },
    )
}

fn __str_to_list(p: Ptr) -> List<Int<8>> {
    let ch = p |> *Int<8>;
    if ch == 0w8 {
        []
    } else {
        [ch] ++ __str_to_list(p |> Int<8>[1])
    }
}

fn __string_find(
    p: Ptr,
    cur: Int<64>,
    len: Int<64>,
    aux: List<Int<8>>,
    pred: (Int<8>, List<Int<8>>)->Bool,
) -> Int<64> {
    if cur >=s len {
        -1w64
    } else {
        if pred(p |> Int<8>[cur] |> *Int<8>, aux) {
            cur
        } else {
            __string_find(p, cur + 1w64, len, aux, pred)
        }
    }
}