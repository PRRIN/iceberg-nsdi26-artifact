/// A `Counted` object is the object plus a counter.
#[derive(Debug, Default)]
pub struct Counted<T> {
    obj: T,
    counter: usize,
}

impl<T> Counted<T> {
    pub fn new(obj: T) -> Counted<T> {
        Counted { obj, counter: 0 }
    }

    pub fn get(&self) -> &T {
        &self.obj
    }

    pub fn get_mut(&mut self) -> &mut T {
        &mut self.obj
    }

    pub fn count(&self) -> usize {
        self.counter
    }

    pub fn inc(&mut self) -> &mut Counted<T> {
        self.counter += 1;
        self
    }

    pub fn dec(&mut self) -> &mut Counted<T> {
        self.counter -= 1;
        self
    }

    pub fn into(self) -> T {
        self.obj
    }
}
