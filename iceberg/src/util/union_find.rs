/// An implementation of generic union-find algorithm,
/// providing the `find()` (with path compression) and `merge()` function.
use std::collections::HashMap;

pub struct UnionFind<T> {
    parents: HashMap<T, T>,
}

impl<T: PartialEq + Eq + std::hash::Hash + Clone> UnionFind<T> {
    pub fn new(items: &[T]) -> Self {
        let mut parents = HashMap::new();
        for item in items.iter() {
            _ = parents.insert(item.clone(), item.clone());
        }
        UnionFind { parents }
    }

    pub fn find(&mut self, this: T) -> T {
        let parent = self.parents.entry(this.clone()).or_insert(this.clone());

        if this.eq(parent) {
            parent.clone()
        } else {
            let parent = parent.clone();
            let true_parent = self.find(parent);
            _ = self.parents.insert(this, true_parent.clone());
            true_parent
        }
    }

    pub fn merge(&mut self, this: T, that: T) {
        let parent_that = self.find(that);
        let parent_this = self.find(this);
        _ = self.parents.insert(parent_that, parent_this);
    }
}
