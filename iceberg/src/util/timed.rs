/// A `Timed` object is the object plus a timestamp.
#[derive(Debug, Clone, Default)]
pub struct Timed<T> {
    obj: T,
    timestamp: usize,
}

impl<T> Timed<T> {
    pub fn new(obj: T, timestamp: usize) -> Timed<T> {
        Timed { obj, timestamp }
    }

    pub fn get(&self) -> &T {
        &self.obj
    }

    pub fn get_mut(&mut self) -> &mut T {
        &mut self.obj
    }

    /// NOTE: `perf` shows that this may not be automatically inlined.
    #[inline(always)]
    pub fn timestamp(&self) -> usize {
        self.timestamp
    }

    pub fn into(self) -> T {
        self.obj
    }
}
