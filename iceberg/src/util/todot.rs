//! Utility for dumping into the DOT file format (graph description language).
//!
//! This module exposes a `ToDot` trait that allows the implementors to be
//! dumped into DOT-formated text.

use crate::middleend::*;
use std::collections::HashMap;
use std::rc::Rc;

/// Trait for dumping into DOT text.
pub trait ToDot {
    fn todot(&self, root: &str);
}

/// Walks a `CfgNode` graph for a producing DOT representation.
struct CfgWalker {
    node_id: u64,
    visited: HashMap<CfgNodeId, u64>,
}

impl CfgWalker {
    fn new() -> Self {
        Self {
            node_id: 0,
            visited: HashMap::new(),
        }
    }

    fn dfs(&mut self, cur: &CfgNodeRef) {
        if self.visited.contains_key(&cur.node) {
            return;
        }
        let id = self.node_id;
        self.visited.entry(cur.node).or_insert(id);
        println!("\t{} [label=\"{}\"]", self.node_id, cur.func.name);
        self.node_id += 1;
        for succ in cur.as_ref().succ() {
            self.dfs(&CfgNodeRef { func: cur.func.clone(), node: *succ });
            println!(
                "\t{} -> {}",
                id,
                self.visited.get(succ).unwrap()
            );
        }
    }
}

/// `Function`s are dumped as CFG into DOT.
impl Function {
    pub fn todot(func: Rc<Function>, _root: &str) {
        let mut walker = CfgWalker::new();
        println!("digraph {{");
        let entry = CfgNodeRef { func: func.clone(), node: func.cfg.entry().unwrap() };
        walker.dfs(&entry);
        println!("}}");
    }
}