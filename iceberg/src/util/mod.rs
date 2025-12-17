//! This module provides the common utilities across Iceberg.

pub mod counted;
pub mod nonce;
pub mod timed;
pub mod todot;
pub mod union_find;

pub use counted::Counted;
pub use nonce::Nonce;
pub use timed::Timed;
pub use todot::ToDot;
pub use union_find::UnionFind;

pub type StringRef = std::rc::Rc<str>;
