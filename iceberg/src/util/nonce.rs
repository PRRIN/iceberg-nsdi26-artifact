/// A `Nonce` ("n"umber "once") is a utility struct that produces
/// a unique integer ID with each `get()` invocation.
///
/// It can be used for assigning unique identifiers, or managing
/// versions.
#[derive(Debug, Default)]
pub struct Nonce {
    counter: i64,
}

impl Nonce {
    pub fn new() -> Self {
        Default::default()
    }

    /// Returns a nonce.
    pub fn get(&mut self) -> i64 {
        self.counter = self.counter.wrapping_add(1);
        self.counter
    }

    /// Returns a nonce, while also advancing the counter as many as `cnt`
    /// steps.
    pub fn reserve(&mut self, cnt: usize) -> i64 {
        let res = self.get();
        self.counter = self.counter.wrapping_add(cnt as i64);
        res
    }
}
