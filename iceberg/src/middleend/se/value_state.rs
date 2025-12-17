//! Manages variables during symbolic execution.
//!
//! `ValueState` is conceptually a collection mapping `ValueDesc`s into a stack of timed
//! `Exp`s. The most obvious use case is to implement the mapping from an `Exp::Var`
//! (its name) into the latest bound value. However, other types of `ValueDesc` exists
//! to facilitate different bindings that need such timed bookkeeping, such as the
//! previous block label.

use crate::middleend::*;
use crate::panic::*;
use crate::util::StringRef;
use fxhash::FxHashMap;
use std::cell::RefCell;
use std::collections::HashMap;
use std::fmt;
use std::rc::Rc;
use std::vec::Vec;

/// A `ValueState` is the manager of values during symbolic execution.
///
/// On top of using `epoch` to track the latest values, it also maintains a stashing
/// system, allowing for stashing all the values produced later than a given epoch.
/// The stashing system is used to implement inline walking.
#[derive(Default)]
pub struct ValueState {
    // --- Hash-consing for `ValueDesc`s ---
    local_descs: FxHashMap<StringRef, u32>,
    global_descs: FxHashMap<StringRef, u32>,

    /// All non-global values as stacks of timed `Exp`s.
    locals: Vec<Vec<Rc<Exp>>>,
    /// Global values. These are separated from local values as they do not
    /// involve push/pop operations.
    globals: Vec<Option<Rc<Exp>>>,

    /// All stashes.
    stash: Vec<ValueStash>,
    /// Modification history, bookkeeping `push()`s and `put()`s that have not
    /// been popped.
    history: Vec<ValueEvent>,

    /// Abstract maps are named maps of `Exp`s.
    /// It is used to implement builtin support for hashmaps.
    abstract_maps: HashMap<String, AbstractMap>,
    /// Index of the last `Push` event in `history`.
    last_push: u32,
}

type AbstractMap = Rc<RefCell<HashMap<String, Rc<Exp>>>>;

/// A `ValueDesc` is a verbose handle that indexes `ValueState`.
///
/// `ValueDesc`s have two characteristics: (1) it is at the core of symbolic execution,
/// and thus frequently accessed; (2) it is static during symbolic execution - (almost)
/// all `ValueDesc`s can be constructed before `See` starts running.
/// As such, we aim to shift as much overhead as possible to the construction sites, by
/// performing potentially expensive hash-consing at creation.
#[derive(Clone)]
pub enum ValueDesc {
    Local(StringRef, u32),
    Global(StringRef, u32),
    Temporary,
}

impl PartialEq for ValueDesc {
    fn eq(&self, other: &Self) -> bool {
        match (self, other) {
            (ValueDesc::Local(_, id1), ValueDesc::Local(_, id2)) => id1 == id2,
            (ValueDesc::Global(_, id1), ValueDesc::Global(_, id2)) => id1 == id2,
            (ValueDesc::Temporary, ValueDesc::Temporary) => true,
            _ => false,
        }
    }
}

impl Eq for ValueDesc {}

impl std::hash::Hash for ValueDesc {
    fn hash<H: std::hash::Hasher>(&self, state: &mut H) {
        match self {
            ValueDesc::Local(_, id) => {
                0u8.hash(state);
                id.hash(state);
            }
            ValueDesc::Global(_, id) => {
                1u8.hash(state);
                id.hash(state);
            }
            ValueDesc::Temporary => {
                2u8.hash(state);
            }
        }
    }
}

impl ValueDesc {

    // --- Reserved local names for special `ValueDesc`s ---

    /// Identifier for the previous label.
    pub const PREV_LABEL: &'static str = "PrevLabel";
    /// Identifier for the return value.
    pub const RET_VAL: &'static str = "RetVal";
    /// Identifier for the thrown value.
    pub const THROW_VAL: &'static str = "ThrowVal";

    /// Identifier for the exception flag.
    pub const EX_FLG: &'static str = "ExFlag";
    /// Identifier for the exception stack pointer.
    pub const EX_STK: &'static str = "ExStk";
    /// Identifier for the exception stack top.
    pub const EX_STK_TOP: &'static str = "ExStkTop";

    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            ValueDesc::Local(repr, _) => {
                if repr.len() > 48 {
                    write!(f, "{}..{}", &repr[..32], &repr[repr.len() - 16..])
                } else {
                    write!(f, "{repr}")
                }
            }
            ValueDesc::Global(repr, _) => write!(f, "{repr}"),
            ValueDesc::Temporary => write!(f, "_"),
        }
    }
}

impl fmt::Debug for ValueDesc {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        self.fmt(f)
    }
}

impl fmt::Display for ValueDesc {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        self.fmt(f)
    }
}

/// A `ValueStash` manages a section of `ValueState`'s history,
/// that can be saved and replayed later.
#[derive(Debug)]
struct ValueStash {
    /// Stash point, for alignment checks when unshatshing.
    index: u32,
    /// Saved last push point before stashing.
    last_push: u32,
    /// Stashed history.
    history: Vec<ValueEvent>,
    /// Stashed values.
    values: HashMap<u32, Vec<Rc<Exp>>>,
}

/// A `ValueEvent` represents a modification event to a `ValueState`.
///
/// `ValueEvent` is basically a simpler version of `MemoryEvent` (see `memory_state`),
/// where the multi-push variant is removed, thanks to the fact that `ValueState::push`
/// calls are almost always interleaved with `ValueState::put` calls.
///
/// For the most compact representation, `ValueEvent` is implemented as a wrapper struct
/// for `u32`, rather than an enum.
#[derive(Debug, Clone)]
struct ValueEvent {
    e: u32,
}

impl ValueEvent {
    /// Make a `ValueEvent::Push`
    fn push(prev_push: u32) -> Self {
        ValueEvent {
            e: 0x80000000 | prev_push,
        }
    }

    /// Make a `ValueEvent::Put`
    fn put(idx: u32) -> Self {
        ValueEvent { e: idx }
    }

    /// Interpret `self` as a `ValueEvent::Push`.
    fn as_push(&self) -> Option<u32> {
        (self.e & 0x80000000 != 0).then_some(self.e & 0x7FFFFFFF)
    }

    /// Interpret `self` as a `ValueEvent::Put`.
    fn as_put(&self) -> Option<u32> {
        (self.e & 0x80000000 == 0).then_some(self.e)
    }
}

impl ValueState {
    /// Initialize the `ValueState`.
    pub fn new() -> Self {
        ValueState {
            // this push can never be popped..
            history: vec![ValueEvent::push(0)],
            ..Default::default()
        }
    }

    /// Construct a `ValueDesc::Local` with the given `scope` and `name`.
    pub fn local(&mut self, scope: &str, name: &str) -> ValueDesc {
        let id = self.local_descs.len() as u32;
        let repr = StringRef::from(format!("{scope}::{name}"));
        let id = self.local_descs.entry(repr.clone()).or_insert_with(|| {
            self.locals.push(vec![]);
            id
        });
        ValueDesc::Local(repr, *id)
    }

    /// Construct a `ValueDesc::Global` with the given `name`.
    pub fn global(&mut self, name: &str) -> ValueDesc {
        let id = self.global_descs.len() as u32;
        let repr = StringRef::from(format!("Global::{name}"));
        let id = self.global_descs.entry(repr.clone()).or_insert_with(|| {
            self.globals.push(None);
            id
        });
        ValueDesc::Global(repr, *id)
    }


    // /// Construct a `ValueDesc::Local` with the given `scope`,
    // /// referring to the previous label.
    // pub fn prev_label(&mut self, scope: StringRef) -> ValueDesc {
    //     let id = self.local_descs.len() as u32;
    //     let repr = StringRef::from(format!("{scope}::PrevLabel"));
    //     let id = self.local_descs.entry(repr.clone()).or_insert_with(|| {
    //         self.locals.push(vec![]);
    //         id
    //     });
    //     ValueDesc::Local(repr, *id)
    // }

    // /// Construct a `ValueDesc::Local` with the given `scope`,
    // /// referring to the return value.
    // pub fn ret_val(&mut self, scope: StringRef) -> ValueDesc {
    //     let id = self.local_descs.len() as u32;
    //     let repr = StringRef::from(format!("{scope}::RetVal"));
    //     let id = self.local_descs.entry(repr.clone()).or_insert_with(|| {
    //         self.locals.push(vec![]);
    //         id
    //     });
    //     ValueDesc::Local(repr, *id)
    // }

    // /// Construct a `ValueDesc::Local` with the given `scope`,
    // /// referring to the thrown value.
    // pub fn throw_val(&mut self, scope: StringRef) -> ValueDesc {
    //     let id = self.local_descs.len() as u32;
    //     let repr = StringRef::from(format!("{scope}::ThrowVal"));
    //     let id = self.local_descs.entry(repr.clone()).or_insert_with(|| {
    //         self.locals.push(vec![]);
    //         id
    //     });
    //     ValueDesc::Local(repr, *id)
    // }

    // /// Construct a `ValueDesc::Local` with the given `scope`,
    // /// referring to the exception value.
    // pub fn exception_val(&mut self, scope: StringRef) -> ValueDesc {
    //     let id = self.local_descs.len() as u32;
    //     let repr = StringRef::from(format!("{scope}::ExceptionVal"));
    //     let id = self.local_descs.entry(repr.clone()).or_insert_with(|| {
    //         self.locals.push(vec![]);
    //         id
    //     });
    //     ValueDesc::Local(repr, *id)
    // }

    // /// Construct a `ValueDesc::Local` with the given `scope`,
    // /// referring to the exception tag.
    // pub fn exception_tag(&mut self, scope: StringRef) -> ValueDesc {
    //     let id = self.local_descs.len() as u32;
    //     let repr = StringRef::from(format!("{scope}::ExceptionTag"));
    //     let id = self.local_descs.entry(repr.clone()).or_insert_with(|| {
    //         self.locals.push(vec![]);
    //         id
    //     });
    //     ValueDesc::Local(repr, *id)
    // }

    /// Construct a `ValueDesc::Temporary`.
    pub fn temporary(&mut self) -> ValueDesc {
        ValueDesc::Temporary
    }

    /// Get the current epoch of `self`, which internally is just the
    /// index of the latest push in `history`.
    pub fn epoch(&self) -> usize {
        self.last_push as usize
    }

    /// Stash all values that are fresher than epoch `since`.
    pub fn stash(&mut self, since: usize) {
        assert!(self
            .history
            .get(since)
            .and_then(ValueEvent::as_push)
            .is_some());
        let saved_last_push = self.last_push;

        // Save the history
        let history = self.history.split_off(since + 1);
        self.last_push = self.history.len() as u32 - 1;

        // Also save the actual values (note that they are in reverse order)
        let mut values: HashMap<u32, Vec<Rc<Exp>>> = HashMap::new();
        for event in history.iter() {
            if let Some(idx) = event.as_put() {
                let exp = self.locals.get_mut(idx as usize).unwrap().pop().unwrap();
                values
                    .entry(idx)
                    .and_modify(|exps| exps.push(exp.clone()))
                    .or_insert_with(|| vec![exp]);
            }
        }

        self.stash.push(ValueStash {
            index: self.history.len() as u32,
            last_push: saved_last_push,
            history,
            values,
        });
    }

    /// Undo the latest stash.
    pub fn unstash(&mut self) -> Panicable<()> {
        let ValueStash {
            index,
            last_push,
            history,
            values,
        } = self
            .stash
            .pop()
            .ok_or_else(|| make_panic!("no stash to unstash"))?;

        // Check we are right at where we made the stash..
        assert_or_throw!(
            index as usize == self.history.len(),
            "changes detected between stash and unstash"
        );

        self.history.extend(history.into_iter());
        self.last_push = last_push;

        for (idx, exps) in values.into_iter() {
            let old = self.locals.get_mut(idx as usize).unwrap(); // stashed entries must exist..
            old.extend(exps.into_iter().rev());
        }
        Ok(())
    }

    /// Marks a new epoch for this `ValueState`.
    pub fn push(&mut self) {
        self.history.push(ValueEvent::push(self.last_push));
        self.last_push = self.history.len() as u32 - 1;
    }

    /// Exits the latest epoch introduced by `push()`; undo all modifications
    /// after the latest push.
    pub fn pop(&mut self) {
        // Pop the history.
        if self.last_push == 0 {
            // the initial push will not be popped
            return;
        }
        let Some(prev_push) = self.history.get(self.last_push as usize).unwrap().as_push() else {
            panic!("[ValueState::pop] latest push is not a Push")
        };
        let pop_start = self.last_push as usize;
        let ValueState {
            history, locals, ..
        } = self;
        let popped = history.drain(pop_start..);

        for pop in popped {
            if let Some(idx) = pop.as_put() {
                locals.get_mut(idx as usize).unwrap().pop().unwrap();
                // It is ok that the entries, if emptied after `pop()`, are
                // not deleted, since because the names of `Exp::Var`s are
                // fixed throughout the SE process.
            };
        }
        self.last_push = prev_push;
    }

    /// Binds `exp` as the latest value to the descriptor `desc`.
    pub fn put(&mut self, desc: &ValueDesc, exp: Rc<Exp>) {
        match desc {
            ValueDesc::Global(_, id) => {
                _ = self.globals.get_mut(*id as usize).unwrap().insert(exp);
            }
            ValueDesc::Local(_, id) => {
                let entry = self.locals.get_mut(*id as usize).unwrap();
                entry.push(exp);
                self.history.push(ValueEvent::put(*id));
            }
            ValueDesc::Temporary => {}
        }
    }

    /// Gets the latest local value bound to the descriptor `desc`.
    pub fn get(&self, desc: &ValueDesc) -> Option<Rc<Exp>> {
        match desc {
            ValueDesc::Global(_, id) => self.globals.get(*id as usize).unwrap().clone(),
            ValueDesc::Local(_, id) => self.locals.get(*id as usize).unwrap().last().cloned(),
            ValueDesc::Temporary => None,
        }
    }

    /// Insert `key` and `map` into the abstract maps collection.
    pub fn put_abstract_map(&mut self, key: String, map: HashMap<String, Rc<Exp>>) -> AbstractMap {
        let map = Rc::new(RefCell::new(map));
        _ = self.abstract_maps.insert(key, map.clone());
        map
    }

    /// Gets the abstract map asscociated with `key`.
    pub fn get_abstract_map(&mut self, key: &str) -> Option<AbstractMap> {
        self.abstract_maps.get(key).cloned()
    }

    /// Insert (k, v) pair into the abstract map of 'key'.
    pub fn insert_abstract_map(&mut self, key: &str, pair: (String, Rc<Exp>)) {
        // if no map exists, create one
        let map = if let Some(map) = self.get_abstract_map(key) {
            map
        } else {
            self.put_abstract_map(key.to_string(), HashMap::new())
        };

        let (k, v) = pair;
        _ = map.borrow_mut().insert(k, v);
    }
}
