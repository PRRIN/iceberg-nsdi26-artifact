//! Memory modeling for symbolic execution.
//!
//! The memory model is essentially a set of stacks, each
//! containing versioned `Exp`s (which is needed because the
//! SE requires DFS and thus backtracking), all bound to a
//! unique memory location, represented as a `MemoryDesc`
//! (memory descriptor).
//!
//! The main difference of `MemoryState` from `ValueState` is
//! the structured relationship between `MemoryDesc`s. Under
//! this view, `Exp::GetPtr` and `Exp::GetElemPtr` operate
//! on `MemoryDesc`s, transforming one into another; `Exp::Load`
//! and `Exp::Store` take effect on `MemoryDesc`s by reading and
//! writing the indexed `MemoryState`.
//!
//! Internally, `MemoryState` is implemented as a collection of `MemoryRegion`s.
//! See the documentation of `MemoryRegion` for more information.

use crate::middleend::{se::*, *};
use crate::panic::*;
use crate::util::StringRef;
use fxhash::FxHashMap;
use std::cell::RefCell;
use std::collections::{HashMap, HashSet};
use std::fmt;
use std::num::NonZeroU32;
use std::rc::Rc;

/// Manages all memory states and regions.
///
/// One notable design choice of the `MemoryState` is that all region allocations
/// are *permanent*, meaning they are never freed once requested, even if they
/// conceptually go out of scope, such as a local stack region after the
/// function returns.
/// This simplifies a bunch of things, including the encoding of memory in the backend
/// (a unique backend ID can be allocated and never changed), a robust way to refer
/// to `MemoryDesc`s in symbolic states, and the ability to represent leaking
/// a pointer out of its lifetime in a summary - a possible error case that must be
/// captured.
#[derive(Default)]
pub struct MemoryState {
    /// All region descriptors ever created.
    region_descs: HashSet<Rc<RegionDesc>>,

    /// Memory regions, indexed by region IDs.
    regions: Vec<MemoryRegion>,

    /// All memory layouts, with hash consing.
    layouts: HashSet<Rc<MemoryLayout>>,

    /// Heap allocations; a map from allocated type and flag to epochs when
    /// allocation is requested.
    mallocs: HashMap<(HashPtrType, u8), Vec<u32>>,

    /// Modification history, bookkeeping `push()`s and `store()`s that have not
    /// been popped.
    history: Vec<MemoryEvent>,

    /// Index of the last `Push` event in `history`.
    last_push: u32,

    /// Memory state epoch; equal to the total number of `push()`s.
    epoch: u32,
}

/// A `MemoryEvent` represents a modification event to a `MemoryState`.
/// `MemoryEvent`s form a singly-linked list in the `history` of a `MemoryState`.
/// The `Mod` variant is the data, while the `Push` variant plays the role of
/// the pointer, by storing the index of the previous `Push` in the `history`.
///
/// This structure is designed to be as compact as possible (8 bytes currently,
/// thanks to NonZero optimization).
#[derive(Debug)]
enum MemoryEvent {
    /// Corresponding memory is modified.
    ///
    /// Note that the `node_id` stored here is the index of the `MemoryNode`, rather
    /// than the offset in normal `MemoryDesc`s.
    /// This is so that accessing the node is as quick as possible.
    ///
    /// When `node_id` is `MemoryEvent::FREE`, this instead encodes a heap memory
    /// free.
    Mod { region_id: NonZeroU32, node_id: u32 },
    /// Memory state push.
    ///
    /// To save space, a `Push` in fact represents two variants: a single push,
    /// or multiple pushes without any `Mod`s in between. They are discriminated
    /// with the most significant bit (0 for the former, 1 for the latter).
    /// For the single push, the value represents the index of the previous push
    /// event; for the multi-push, the value becomes a counter of such successive
    /// pushes.
    ///
    /// The multi-push variant handles the case where branching happens much more
    /// frequently than memory modifications. Without it, each push would lead to
    /// a new `Push` event, introducing much memory overhead.
    Push { value: u32 },
}

impl MemoryEvent {
    /// Indicates that a `MemoryEvent::Mod` is a free.
    const FREE: u32 = u32::MAX;
}

/// A `MemorySnapshot` records the relevant states in a `MemoryState`
/// for future reference.
pub struct MemorySnapshot {
    /// Memory epoch.
    epoch: u32,

    /// All `MemoryDesc`s (that are backed by a `MemoryNode`) in *non-constant* regions,
    /// mapped into the number of values they hold.
    descs: FxHashMap<MemoryDesc, u32>,

    /// All freed heap regions, ordered by their region ID.
    freed: Vec<Rc<RegionDesc>>,
}

/// The region descriptor of a memory region.
#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub enum RegionDesc {
    /// Stack region.
    Stack(StackRegionDesc),
    /// Global static region.
    Global(GlobalRegionDesc),
    /// Heap region.
    Heap(HeapRegionDesc),
}

/// A stack region is associated with the function named `func_name`,
/// and further identified by `region_name`.
/// In the case of recursion, `rep` gives the number of repetitions
/// in the rest of the call stack.
#[derive(Debug, Clone)]
pub struct StackRegionDesc {
    func_name: StringRef,
    region_name: StringRef,
    rep: u32,
    region_id: u32,
}

/// A global region is identified with a global name only, and available for
/// the entirety of the SE process.
///
/// As for the `flags`:
/// * `constant` annotates the read-only property of this region.
#[derive(Debug, Clone)]
pub struct GlobalRegionDesc {
    global_name: StringRef,
    flags: u32,
    region_id: u32,
}
const GLOBAL_REGION_FLAG_CONSTANT: u32 = 1 << 0;
const GLOBAL_REGION_FLAG_UNWRITABLE: u32 = 1 << 1;

/// A heap region is identified with an allocated type, a property flags,
/// and the number of previous allocations requested of the very type and flag.
///
/// As for the `flags`:
/// * `zero_init` annotates if the region is zero initialized.
#[derive(Debug, Clone)]
pub struct HeapRegionDesc {
    allocated_ty: HashPtrType,
    rep: [u8; 3],
    flags: u8,
    region_id: u32,
}

const HEAP_REGION_FLAG_ZERO_INIT: u8 = 1 << 0;

impl PartialEq for StackRegionDesc {
    fn eq(&self, other: &Self) -> bool {
        self.func_name.eq(&other.func_name)
            && self.region_name.eq(&other.region_name)
            && self.rep == other.rep
    }
}

impl Eq for StackRegionDesc {}

impl std::hash::Hash for StackRegionDesc {
    fn hash<H: std::hash::Hasher>(&self, state: &mut H) {
        self.func_name.hash(state);
        self.region_name.hash(state);
        self.rep.hash(state);
    }
}

impl PartialEq for GlobalRegionDesc {
    fn eq(&self, other: &Self) -> bool {
        self.global_name.eq(&other.global_name) && self.flags | GLOBAL_REGION_FLAG_UNWRITABLE == other.flags | GLOBAL_REGION_FLAG_UNWRITABLE
    }
}

impl Eq for GlobalRegionDesc {}

impl std::hash::Hash for GlobalRegionDesc {
    fn hash<H: std::hash::Hasher>(&self, state: &mut H) {
        self.global_name.hash(state);
        (self.flags | GLOBAL_REGION_FLAG_UNWRITABLE).hash(state);
    }
}

impl PartialEq for HeapRegionDesc {
    fn eq(&self, other: &Self) -> bool {
        self.allocated_ty.eq(&other.allocated_ty)
            && self.flags == other.flags
            && self.rep == other.rep
    }
}

impl Eq for HeapRegionDesc {}

impl std::hash::Hash for HeapRegionDesc {
    fn hash<H: std::hash::Hasher>(&self, state: &mut H) {
        self.allocated_ty.hash(state);
        self.flags.hash(state);
        self.rep.hash(state);
    }
}

/// A memory region, with a flattened, lazily deduced layout.
///
/// The design of `MemoryRegion` caters to Iceberg's specific usages, which include
/// * Passing (lightweight) `MemoryDesc`s around;
/// * Computing `MemoryDesc`s with "Gep"s (with bound and type checks);
/// * Loading from and storing to `MemoryDesc`s (with layout coercions);
/// * Range operations based on raw byte offsets;
/// * and finally: efficient homomorphic mapping by replacing `MemoryRegion`s.
///
/// By flattening the conceptual tree hierarchy of aggregate structs in memory,
/// all above needs are satisfied with decent performance.
///
/// Internally, a `MemoryRegion` is mainly a list of `MemoryNode`s, corresponding to
/// the list of flattened fields in the `MemoryLayout` of the region's `Type`.
/// - The region is "flattened", in the sense that the hierarchy of the `Type` is completely
///   wiped - offsets, sizes and alignments are all we care about here.
/// - The region layout is "lazily deduced", as the layout is not necessarily decided
///   at the allocation site, but rather by how the region gets accessed later.
///   This removes the need to type-annotate each allocation.
///
/// Serving `load`/`store`/`gep` thus reduces to a simple `MemoryLayout` pattern match
/// using the provided `Type`s. Raw byte range operations are also solved by simply
/// counting off the offsets.
struct MemoryRegion {
    /// Memory nodes, ordered by their offset.
    nodes: Vec<MemoryNode>,
    /// Region descriptor.
    desc: Rc<RegionDesc>,
    /// Region type.
    ty: Rc<Type>,
    /// Region layout.
    layout: Rc<MemoryLayout>,
    /// Epoch at which this region is allocated.
    epoch: u32,

    /// Whether the region has been freed.
    /// This emulates dynamic heap memory allocation to capture
    /// use-after-free bugs.
    freed: bool,
}

/// A memory descriptor, that identifies a memory position.
/// It is used as a (public) handle into the memory state.
#[derive(Debug, Clone, PartialEq, Eq, Hash)]
pub struct MemoryDesc {
    region_id: NonZeroU32,
    offset: u32,
}

thread_local! {
    /// Unfortunately, memory descriptors are so compact that formatting them cannot
    /// be done without the help of a `MemoryState`, making it impossible to implement
    /// `std::fmt::Display` for `MemoryDesc` normally.
    /// Since many more formatting requires that `MemoryDesc` can be formatted, we take the
    /// easy route of caching the format strings of `MemoryDesc`s in a global state.
    ///
    /// Note that `MEMORY_DESC_REPR` is implicitly managed by a `MemoryState` (making it
    /// effectively singleton), and using it is still safe.
    ///
    /// XXX: currently only the region part is cached.
    static MEMORY_DESC_REPR: RefCell<HashMap<NonZeroU32, String>> = {
        RefCell::new(HashMap::new())
    };
}

/// A internal memory node representing a memory position, and forms memory regions.
///
/// To reduce memory overhead, the `MemoryNode` is designed to have a compact memory
/// layout.
pub struct MemoryNode {
    /// Raw byte offset within the region.
    ofs: u32,
    /// Size of the data stored in the node.
    size: u8,
    /// Whether the data stored should be interpreted as a pointer.
    is_ptr: bool,
    /// `Exp`s stored in this memory position.
    exps: Vec<Rc<Exp>>,
}

impl MemoryNode {
    // /// Indicates that a `MemoryDesc` is referring to the end of a `MemoryNode`.
    // ///
    // /// For example, in a region of type `{ i32, i64 }`, node `0` would be the first
    // /// field, and node `ID_IS_END | 0` would be the end of the first field (offset 4),
    // /// but not quite the start of the next field.
    // ///
    // /// Attemping to load or store through such a descriptor is always an error.
    // const ID_IS_END: u32 = 0x80000000;

    /// Get the byte offset of this node within its region.
    pub fn ofs(&self) -> u32 {
        self.ofs
    }

    /// Get the byte size of this node.
    pub fn size(&self) -> u32 {
        self.size as u32
    }

    /// Whether the data stored in this node is a pointer.
    pub fn is_ptr(&self) -> bool {
        self.is_ptr
    }
}

impl RegionDesc {
    /// Invalid region ID.
    const ID_NONE: u32 = u32::MAX;

    /// The first region ID.
    const ID_START: u32 = 1;

    /// Whether the region is stack.
    pub fn is_stack(&self) -> bool {
        matches!(self, RegionDesc::Stack(_))
    }

    /// Whether the region is global.
    pub fn is_global(&self) -> bool {
        matches!(self, RegionDesc::Global(_))
    }

    /// Whether the region is heap.
    pub fn is_heap(&self) -> bool {
        matches!(self, RegionDesc::Heap(_))
    }

    /// Whether the region is constant.
    pub fn is_constant(&self) -> bool {
        match self {
            RegionDesc::Global(alloc) => (alloc.flags & GLOBAL_REGION_FLAG_CONSTANT) > 0,
            _ => false,
        }
    }

    /// Whether the region is unwritable.
    pub fn is_unwritable(&self) -> bool {
        match self {
            RegionDesc::Global(alloc) => (alloc.flags & GLOBAL_REGION_FLAG_UNWRITABLE) > 0,
            _ => false,
        }
    }

    /// Whether the region is zero initialized.
    pub fn is_zero_init(&self) -> bool {
        match self {
            RegionDesc::Heap(alloc) => (alloc.flags & HEAP_REGION_FLAG_ZERO_INIT) > 0,
            _ => false,
        }
    }

    /// Get the region ID.
    pub fn id(&self) -> u32 {
        match self {
            RegionDesc::Stack(desc) => desc.region_id,
            RegionDesc::Global(desc) => desc.region_id,
            RegionDesc::Heap(desc) => desc.region_id,
        }
    }
}

/// A `MemoryLayout` describes the layout of a `Type` in the memory state model.
///
/// Iceberg assumes the standard C memory layout. Specifically:
/// * Bitvectors are aligned to the next power of two byte boundary.
/// * Pointers are aligned as an `TYPE_POINTER_WIDTH` bitvector.
/// * Structs and tuples are aligned to the maximal alignment of its fields.
/// which implies padding within and between aggregate types.
///
/// Zero-sized `Type`s are supported: they have a size of 0 and alignment of 1 on
/// their own, and are ignored as flattenend fields.
///
/// `MemoryLayout`s are managed by a `MemoryState`, which implements hash consing,
/// enabling easy comparison and compact representation.
#[derive(Debug, PartialEq, Eq, Hash)]
pub struct MemoryLayout {
    pub size: u32,
    pub align: u8,
    pub scalar: bool,
    /// Offsets and sizes of flattened fields.
    pub flattened: Vec<(u32, u32)>,
}

impl fmt::Display for MemoryLayout {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "[size={}, align={}]", self.size, self.align)?;
        for (ofs, size) in self.flattened.iter() {
            write!(f, "({}, {})", ofs, size)?;
        }
        Ok(())
    }
}

impl MemoryState {
    const MEMORY_EVENT_IS_MULTI_PUSH: u32 = 0x80000000;

    /// Create a new empty `MemoryState`.
    pub fn new() -> Self {
        _ = MEMORY_DESC_REPR.with(|repr| {
            let mut guard = repr.borrow_mut();
            guard.clear();
        });
        MemoryState {
            // this push can never be popped..
            history: vec![MemoryEvent::Push { value: 0 }],
            ..Default::default()
        }
    }

    // /// Reset the `MemoryState`, which have the following semantics:
    // /// * `region_descs` is NOT cleared as it caches all regions
    // /// * `regions` is NOT cleared as `MemoryRegion`s is intended to be reused;
    // ///   however the region
    // /// * `layouts` is NOT cleared for the same reason
    // /// * `mallocs` is cleared
    // /// * `history` and `last_push` are reset
    // /// * `epoch` is reset
    // pub fn reset(&mut self) {

    // }

    /// Get the current memory state epoch.
    pub fn epoch(&self) -> u32 {
        self.epoch
    }

    /// Increment current memory state epoch by one.
    pub fn push(&mut self) {
        self.epoch += 1;
        match self.history.last_mut().unwrap() {
            MemoryEvent::Push { value } if *value >= MemoryState::MEMORY_EVENT_IS_MULTI_PUSH => {
                // A successive multi-push
                *value += 1;
            }
            MemoryEvent::Push { .. } => {
                // An initial multi-push
                self.history.push(MemoryEvent::Push {
                    value: MemoryState::MEMORY_EVENT_IS_MULTI_PUSH,
                });
                self.last_push = self.history.len() as u32 - 1;
            }
            _ => {
                // A single push
                self.history.push(MemoryEvent::Push {
                    value: self.last_push,
                });
                self.last_push = self.history.len() as u32 - 1;
            }
        }
    }

    /// Decrement current memory state epoch by one, and revert all
    /// modifications until then.
    pub fn pop(&mut self) {
        self.epoch -= 1;

        // Pop heap allocations.
        self.mallocs.iter_mut().for_each(|(_, epochs)| {
            while let Some(epoch) = epochs.last() {
                if *epoch > self.epoch {
                    epochs.pop();
                } else {
                    break;
                }
            }
        });

        // Pop the history.
        if self.last_push == 0 {
            // the initial push will not be popped
            return;
        }
        let MemoryEvent::Push { value } = self.history.get_mut(self.last_push as usize).unwrap()
        else {
            panic!("[MemoryState::pop] latest push is not a Push")
        };

        let (prev_push, pop_start) = if *value > MemoryState::MEMORY_EVENT_IS_MULTI_PUSH {
            *value -= 1;
            (self.last_push, self.last_push + 1)
        } else if *value == MemoryState::MEMORY_EVENT_IS_MULTI_PUSH {
            (self.last_push - 1, self.last_push)
        } else {
            (*value, self.last_push)
        };

        let MemoryState {
            history, regions, ..
        } = self;
        let popped = history.drain(pop_start as usize..);
        for pop in popped {
            if let MemoryEvent::Mod { region_id, node_id } = pop {
                let region = regions
                    .get_mut((region_id.get() - RegionDesc::ID_START) as usize)
                    .unwrap();
                if node_id == MemoryEvent::FREE {
                    // a free
                    assert!(
                        region.freed && region.desc.is_heap(),
                        "[MemoryState::pop] inconsistent free history"
                    );
                    region.freed = false;
                } else {
                    // a normal store
                    let node = region.nodes.get_mut(node_id as usize).unwrap();
                    _ = node
                        .exps
                        .pop()
                        .expect("[MemoryState::pop] popped descriptor has no data");
                }
            };
        }
        self.last_push = prev_push;
    }

    /// Create a snapshot of the current state.
    pub fn snapshot(&self) -> MemorySnapshot {
        let mut descs = FxHashMap::default();
        let mut freed = Vec::new();
        self.regions
            .iter()
            .filter(|region| !region.desc.is_constant())
            .for_each(|region| {
                for node in region.nodes.iter() {
                    let cnt = node.exps.len() as u32;
                    let desc = MemoryDesc {
                        region_id: NonZeroU32::new(region.desc.id()).unwrap(),
                        offset: node.ofs,
                    };
                    _ = descs.insert(desc, cnt);
                }
                if region.freed {
                    freed.push(region.desc.clone());
                }
            });
        MemorySnapshot {
            epoch: self.epoch,
            descs,
            freed,
        }
    }

    /// Compute a simple scalar `MemoryLayout` with `size` and `align`, with hash consing.
    pub fn scalar_layout(&mut self, size: u32, align: u8) -> Rc<MemoryLayout> {
        let layout = Rc::new(MemoryLayout {
            size,
            align,
            scalar: true,
            flattened: vec![(0, size)],
        });
        if let Some(cons) = self.layouts.get(&layout) {
            cons.clone()
        } else {
            self.layouts.insert(layout.clone());
            layout
        }
    }

    /// Compute an array's `MemoryLayout` with its element's `MemoryLayout` and length, with
    /// hash consing.
    pub fn array_layout(&mut self, elem: Rc<MemoryLayout>, length: usize) -> Rc<MemoryLayout> {
        let size = elem.size * length as u32;
        let align = elem.align;
        let mut flattened = Vec::new();
        for i in 0..length {
            for (ofs, sz) in elem.flattened.iter() {
                flattened.push((i as u32 * elem.size + *ofs, *sz));
            }
        }
        let layout = Rc::new(MemoryLayout {
            size,
            align,
            scalar: false,
            flattened,
        });
        if let Some(cons) = self.layouts.get(&layout) {
            cons.clone()
        } else {
            self.layouts.insert(layout.clone());
            layout
        }
    }

    /// Compute a tuple's `MemoryLayout` by merging its fields' `MemoryLayout`s, with
    /// hash consing.
    /// Also returns the offsets of fields.
    pub fn tuple_layout(
        &mut self,
        layouts: Vec<Rc<MemoryLayout>>,
        packed: bool,
    ) -> (Rc<MemoryLayout>, Vec<u32>) {
        let mut size = 0u32;
        let mut align = 1u8;
        let mut fields = Vec::new();
        let mut flattened = Vec::new();
        for layout in layouts.into_iter() {
            if !packed {
                // packed tuples have no padding between fields
                size = size.next_multiple_of(layout.align as u32);
            }

            fields.push(size);
            for (ofs, sz) in layout.flattened.iter() {
                assert!(*sz > 0);
                flattened.push((*ofs + size, *sz));
            }
            assert!(
                layout.size % layout.align as u32 == 0,
                "size: {}, align: {}",
                layout.size,
                layout.align
            );
            size += layout.size;

            if !packed {
                // packed tuples always have an alignment of 1
                align = align.max(layout.align);
            }
        }
        size = size.next_multiple_of(align as u32);

        let layout = Rc::new(MemoryLayout {
            size,
            align,
            scalar: false,
            flattened,
        });

        if let Some(cons) = self.layouts.get(&layout) {
            (cons.clone(), fields)
        } else {
            self.layouts.insert(layout.clone());
            (layout, fields)
        }
    }

    /// Get the root global memory descriptor with `global_name` and the given property flag.
    pub fn get_global(&self, global_name: &str, constant: bool) -> Option<MemoryDesc> {
        let mut flags = 0;
        if constant {
            flags |= GLOBAL_REGION_FLAG_CONSTANT;
        }
        let rdesc = RegionDesc::Global(GlobalRegionDesc {
            global_name: global_name.into(),
            flags,
            region_id: RegionDesc::ID_NONE,
        });

        if let Some(old) = self.region_descs.get(&rdesc) {
            let region_id = NonZeroU32::new(old.id()).unwrap();
            let mdesc = MemoryDesc {
                region_id,
                offset: 0,
            };
            Some(mdesc)
        } else {
            None
        }
    }

    /// Allocate a new global memory region, and returning its memory descriptor.
    /// The memory region is populated with `exp`.
    ///
    /// If the region has been allocated already, the allocated one is returned.
    pub fn alloc_global(
        &mut self,
        exp: Rc<Exp>,
        global_name: StringRef,
        constant: bool,
    ) -> Panicable<MemoryDesc> {
        let mut flags = 0;
        if constant {
            flags |= GLOBAL_REGION_FLAG_CONSTANT;
        }
        let mut rdesc = RegionDesc::Global(GlobalRegionDesc {
            global_name,
            flags,
            region_id: RegionDesc::ID_NONE,
        });
        self.alloc_with_init(Initializer::Exp(exp), &mut rdesc)
    }

    /// Allocate a new global unwritable memory region, which means it's constant
    /// and it ignores any modification in iceberg runtime.
    ///
    /// If the region has been allocated already, the allocated one is returned.
    pub fn alloc_global_unwritable(
        &mut self,
        exp: Rc<Exp>,
        global_name: StringRef,
    ) -> Panicable<MemoryDesc> {
        let flags = GLOBAL_REGION_FLAG_CONSTANT | GLOBAL_REGION_FLAG_UNWRITABLE;
        let mut rdesc = RegionDesc::Global(GlobalRegionDesc {
            global_name,
            flags,
            region_id: RegionDesc::ID_NONE,
        });
        self.alloc_with_init(Initializer::Exp(exp), &mut rdesc)
    }

    /// Allocate a new stack memory region, and returning its memory descriptor.
    /// The memory region is populated with `Exp::Havoc` of type `ty`.
    ///
    /// If the region has been allocated already, the allocated one is returned.
    pub fn alloc_stack(
        &mut self,
        ty: Rc<Type>,
        func_name: StringRef,
        region_name: StringRef,
        rep: u32,
    ) -> Panicable<MemoryDesc> {
        let mut rdesc = RegionDesc::Stack(StackRegionDesc {
            func_name,
            region_name,
            rep,
            region_id: RegionDesc::ID_NONE,
        });
        self.alloc_with_init(Initializer::Havoc(ty), &mut rdesc)
    }

    /// Allocate a new heap memory region, and returning its memory descriptor.
    /// If `zero_init`, the region is initialized with zero values (`Null` for
    /// pointer types, and `IntLiteral(0)` for bitvector types); otherwise, the
    /// region is populated with an `Exp::Havoc` of type `ty`.
    ///
    /// The memory state internally decides the repetition count for the given
    /// allocation site. If the region has been allocated already, the allocated
    /// one is returned.
    ///
    /// Heap allocations are affected by `push` and `pop`. After an allocation is
    /// popped, a later call of `alloc_heap` may then return the same `MemoryDesc`.
    pub fn alloc_heap(&mut self, ty: Rc<Type>, zero_init: bool) -> Panicable<MemoryDesc> {
        let cur_epoch = self.epoch;
        let flags = 0 | if zero_init {
            HEAP_REGION_FLAG_ZERO_INIT
        } else {
            0
        };
        // Repetition count is the number of existing allocations
        // of the same alloc_site.
        let rep = self
            .mallocs
            .entry((HashPtrType::from(ty.clone()), flags))
            .and_modify(|epochs| epochs.push(cur_epoch))
            .or_insert_with(|| vec![cur_epoch])
            .len() as u32;
        assert_or_throw!(rep & 0xFF000000 == 0, "too many heap allocations");

        let mut rdesc = RegionDesc::Heap(HeapRegionDesc {
            allocated_ty: HashPtrType::from(ty.clone()),
            flags,
            rep: [
                rep as u8 & 0xFF,
                (rep >> 8) as u8 & 0xFF,
                (rep >> 16) as u8 & 0xFF,
            ],
            region_id: RegionDesc::ID_NONE,
        });
        self.alloc_with_init(
            if zero_init {
                Initializer::Zero(ty)
            } else {
                Initializer::Havoc(ty)
            },
            &mut rdesc,
        )
    }

    /// Free the heap memory region denoted by `rdesc`.
    ///
    /// Note that this only marks the corresponding region as freed, without actually
    /// freeing the `MemoryRegion`, nor the data it contains.
    /// `free_heap` is only meant to emulate dynamic heap memory allocation, in order
    /// to capture use-after-free bugs.
    ///
    /// Freeing a non-heap region produces `SeError::BadFree`; freeing an already freed
    /// heap region produces `SeError::UseAfterFree`.
    ///
    /// Heap freeing can be `pop`-ed.
    pub fn free_heap(&mut self, rdesc: Rc<RegionDesc>) -> Result<(), SeError> {
        let region_id = NonZeroU32::new(rdesc.id()).unwrap();
        let region = self.region_mut(region_id);
        if !region.desc.is_heap() {
            return Err(SeError::BadFree { region: rdesc });
        }
        if region.freed {
            return Err(SeError::UseAfterFree { region: rdesc });
        }
        region.freed = true;
        self.history.push(MemoryEvent::Mod {
            region_id,
            node_id: MemoryEvent::FREE,
        });

        Ok(())
    }

    /// Allocate (lazily) a new memory region with the initializer `init`, and returning
    /// its memory descriptor.
    fn alloc_with_init(
        &mut self,
        init: Initializer,
        rdesc: &mut RegionDesc,
    ) -> Panicable<MemoryDesc> {
        if let Some(old) = self.region_descs.get(rdesc) {
            let region_id = NonZeroU32::new(old.id()).unwrap();
            // Update epoch
            if !rdesc.is_global() {
                let epoch = self.epoch;
                self.region_mut(region_id).epoch = epoch;
            }
            // Reuse old region
            let mdesc = MemoryDesc {
                region_id,
                offset: 0,
            };
            return Ok(mdesc);
        }

        // Make a new region descriptor.
        assert!(self.region_descs.len() == self.regions.len());
        let region_id = self.regions.len() as u32 + RegionDesc::ID_START;
        match rdesc {
            RegionDesc::Global(alloc) => alloc.region_id = region_id,
            RegionDesc::Heap(alloc) => alloc.region_id = region_id,
            RegionDesc::Stack(alloc) => alloc.region_id = region_id,
        }
        let rdesc = Rc::new(rdesc.clone());
        self.region_descs.insert(rdesc.clone());

        // Allocate new region and initialize
        self.alloc(rdesc.clone(), self.epoch, init)?;

        Ok(MemoryDesc {
            region_id: NonZeroU32::new(rdesc.id()).unwrap(),
            offset: 0,
        })
    }

    /// Allocate a new memory region initialize with `init` at `epoch`.
    fn alloc(&mut self, rdesc: Rc<RegionDesc>, epoch: u32, init: Initializer) -> Panicable<()> {
        // Get the memory layout
        let ty = match &init {
            Initializer::Exp(exp) => exp.ty(),
            Initializer::Havoc(ty) | Initializer::Zero(ty) => ty.clone(),
        };
        let Some(layout) = ty.get_layout(self) else {
            throw_panic!("{init} does not have a memory layout");
        };
        // if layout.flattened.is_empty() {
        //     throw_panic!("cannot allocate zero-sized region");
        // }

        // Flatten the initializer
        let mut stack = Vec::new();
        let mut values = Vec::new();
        stack.push(init);
        while let Some(mut init) = stack.pop() {
            match &init {
                Initializer::Exp(exp) => {
                    if let Exp::Havoc(data) = exp.as_ref() {
                        init = Initializer::Havoc(data.ty.clone());
                    }
                }
                _ => {}
            }
            let is_havoc = matches!(init, Initializer::Havoc(_));

            match init {
                Initializer::Havoc(ty) | Initializer::Zero(ty) => {
                    if ty.get_layout(self).unwrap().size == 0 {
                        // zero-sized fields are skipped
                        continue;
                    }
                    match ty.as_ref() {
                        Type::Array(kind) => {
                            if is_havoc {
                                for _ in 0..kind.len {
                                    stack.push(Initializer::Havoc(kind.elem_ty.clone()));
                                }
                            } else {
                                for _ in 0..kind.len {
                                    stack.push(Initializer::Zero(kind.elem_ty.clone()));
                                }
                            }
                        }
                        Type::Tuple(kind) => {
                            if is_havoc {
                                for fty in kind.fields.iter().rev() {
                                    stack.push(Initializer::Havoc(fty.clone()));
                                }
                            } else {
                                for fty in kind.fields.iter().rev() {
                                    stack.push(Initializer::Zero(fty.clone()));
                                }
                            }
                        }
                        _ => {
                            if is_havoc {
                                values.push(Exp::havoc(ty));
                            } else {
                                values.push(Exp::zero_val(ty)?);
                            }
                        }
                    }
                }
                Initializer::Exp(exp) => {
                    if exp.ty().get_layout(self).unwrap().size == 0 {
                        // zero-sized fields are skipped
                        continue;
                    }
                    let ty = exp.ty();
                    match ty.as_ref() {
                        Type::Array(_) => {
                            let Exp::Vector(data) = exp.as_ref() else {
                                throw_panic!("cannot allocate verbosely for {exp} of type {}", ty)
                            };
                            for elem in data.elems.iter().rev() {
                                stack.push(Initializer::Exp(elem.clone()));
                            }
                        }
                        Type::Tuple(_) => {
                            let Exp::Tuple(data) = exp.as_ref() else {
                                throw_panic!("cannot allocate verbosely for {exp} of type {}", ty)
                            };
                            for field in data.fields.iter().rev() {
                                stack.push(Initializer::Exp(field.clone()));
                            }
                        }
                        _ => {
                            values.push(exp);
                        }
                    }
                }
            }
        }

        assert!(
            values.len() == layout.flattened.len(),
            "mismatch between flattened initializer and layout"
        );

        let nodes = layout
            .flattened
            .iter()
            .zip(values.into_iter())
            .map(|((ofs, size), exp)| MemoryNode {
                ofs: *ofs,
                size: *size as u8,
                is_ptr: type_is_kind!(exp.ty(), Type::Pointer),
                exps: vec![exp],
            })
            .collect();

        // Cache the string representation
        MEMORY_DESC_REPR.with(|repr| {
            let mut guard = repr.borrow_mut();
            assert!(guard
                .insert(NonZeroU32::new(rdesc.id()).unwrap(), rdesc.to_string())
                .is_none());
        });

        self.regions.push(MemoryRegion {
            nodes,
            desc: rdesc,
            ty,
            layout,
            epoch,
            freed: false,
        });
        Ok(())
    }

    /// Get the region descriptor of `desc`.
    pub fn region_of(&self, desc: &MemoryDesc) -> Rc<RegionDesc> {
        let region = self.region(desc.region_id);
        region.desc.clone()
    }

    /// Get the type of the `desc` region.
    pub fn type_of(&self, desc: Rc<RegionDesc>) -> Rc<Type> {
        let region = self.region(NonZeroU32::new(desc.id()).unwrap());
        region.ty.clone()
    }

    /// Get the type of the `desc` region.
    pub fn layout_of(&self, desc: Rc<RegionDesc>) -> Rc<MemoryLayout> {
        let region = self.region(NonZeroU32::new(desc.id()).unwrap());
        region.layout.clone()
    }

    // /// Get the size of the memory node under `desc` within its region.
    // pub fn size_of(&self, desc: &MemoryDesc) -> u32 {
    //     let region = self.region(desc.region_id);
    //     let node = region.node(desc.node);
    //     node.size as u32
    // }

    /// Get the allocation epoch of the region `desc`.
    pub fn epoch_of(&self, desc: Rc<RegionDesc>) -> u32 {
        let region = self.region(NonZeroU32::new(desc.id()).unwrap());
        region.epoch
    }

    fn region(&self, region_id: NonZeroU32) -> &MemoryRegion {
        self.regions
            .get((region_id.get() - RegionDesc::ID_START) as usize)
            .unwrap()
    }

    fn region_mut(&mut self, region_id: NonZeroU32) -> &mut MemoryRegion {
        self.regions
            .get_mut((region_id.get() - RegionDesc::ID_START) as usize)
            .unwrap()
    }

    /// Load the latest `Exp` at the given memory descriptor, using the
    /// memory layout of `ty`.
    ///
    /// When `sman` is `Some`, it is consulted to determine whether the loaded value
    /// should be wrapped in an `Exp::Symbolic`.
    ///
    /// It is guaranteed that the returned `Exp` has an equivalent `Type` as `ty`;
    /// however, the value may not be fully executed.
    pub fn load(
        &mut self,
        ty: Rc<Type>,
        desc: &MemoryDesc,
        mut sman: Option<&mut SummaryManager>,
    ) -> Result<Rc<Exp>, SeError> {
        let Some(layout) = ty.get_layout(self) else {
            throw_panic!("{ty} does not have a memory layout")
        };
        assert_or_throw!(!layout.flattened.is_empty(), "loading zero-sized type {ty}");

        let region = self.region(desc.region_id);
        if region.desc.is_heap() && region.freed {
            return Err(SeError::UseAfterFree {
                region: region.desc.clone(),
            });
        }

        let rsize = region.layout.size;
        let (node, node_id) = match region
            .nodes
            .binary_search_by(|node| node.ofs.cmp(&desc.offset))
        {
            Ok(idx) => (&region.nodes[idx], idx),
            Err(_) => {
                if desc.offset + layout.size > rsize {
                    // Out of bound
                    return Err(SeError::OutOfBound {
                        region: region.desc.clone(),
                        ofs: desc.offset + layout.size,
                    });
                } else {
                    throw_panic!("loading from non-aligned offset ({desc})");
                }
            }
        };

        // Optimize for loading a scalar
        if layout.scalar {
            let exp = node
                .exps
                .last()
                .cloned()
                .ok_or_else(|| make_panic!("no data in {desc}").into())?;

            let loaded = match layout.size.cmp(&node.size()) {
                std::cmp::Ordering::Equal => exp,
                std::cmp::Ordering::Less => {
                    match &*exp {
                        Exp::Havoc(_) => Exp::havoc(Type::mk_bitvec(8 * layout.size)),
                        Exp::Null(_) => Exp::int_literal(0, Some(8 * layout.size)).unwrap(),
                        Exp::BitCast(data) if exp_is_kind!(data.value, Exp::Havoc) => Exp::havoc(Type::mk_bitvec(8 * layout.size)),
                        _ => {
                            throw_panic!(
                                "layout mismatch (size); {desc}={exp}({}): {ty}, layout = {layout}",
                                node.size,
                            );
                        }
                    }
                }
                std::cmp::Ordering::Greater => {
                    let is_havoc = matches!(&*exp, Exp::Havoc(_));

                    let mut exps = Vec::new();
                    let mut sum = 0;
                    self.walk_range(&desc, layout.size, |_, node| {
                        let exp = node
                            .exps
                            .last()
                            .cloned()
                            .expect(format!("no data in {desc}").as_str());
                        
                        sum += node.size();
                        exps.push(exp);
                    }).unwrap();
                    
                    assert_or_throw!(
                        layout.size == sum,
                        "layout mismatch, expected size={}, found {:?}",
                        layout.size, exps
                    );

                    for (idx, exp) in exps.iter().enumerate() {
                        assert_or_throw!(
                            is_havoc == matches!(&**exp, Exp::Havoc(_)),
                            "Exp {:?} in index {idx} should be same as the first",
                            exps
                        );
                    }

                    if is_havoc {
                        Exp::havoc(Type::mk_bitvec(8 * layout.size))
                    } else {
                        let value = if exps.iter().all(|exp| exp_as_data!(&**exp, Exp::IntLiteral).value == 0) {
                            0
                        } else {
                            let mut bytes: [u8; 8] = [0, 0, 0, 0, 0, 0, 0, 0];
                            for (idx, exp) in exps.iter().enumerate() {
                                let data = exp_as_data!(&**exp, Exp::IntLiteral);
                                assert_or_throw!(
                                    data.width.unwrap() == 8,
                                    "Exp {:?} in index {idx} should be i8",
                                    exps
                                );
                                bytes[idx] = data.value as i8 as u8;
                            }
                            i64::from_le_bytes(bytes)
                        };
                        Exp::int_literal(value, Some(8 * layout.size)).unwrap()
                    }
                }
            };

            let region = self.region(desc.region_id);
            let node = &region.nodes[node_id];

            if let Some(sman) = sman {
                let exp = SymbolicDesc::from_mdesc(self, sman, desc, node, loaded)
                    .or_else(|panic| panic.into())?;
                if !type_eq!(exp.ty(), ty) {
                    // return Exp::bitcast(ty, exp).or_else(|panic| panic.into())
                    return Ok(Exp::bitcast(ty, exp).unwrap());
                } else {
                    return Ok(exp);
                }
            } else {
                if !type_eq!(loaded.ty(), ty) {
                    return Ok(Exp::bitcast(ty, loaded).unwrap());
                } else {
                    return Ok(loaded);
                }
            }
        }

        // Loading an aggregate
        let mut values = Vec::new();
        let start = node.ofs;
        let mut nodes = region.nodes.split_at(node_id).1.iter();

        // ..check layout and load values
        for (i, (ofs, size)) in layout.flattened.iter().enumerate() {
            let Some(node) = nodes.next() else {
                throw_panic!("layout mismatch (no field @{i}); {desc}: {ty}, layout = {layout}")
            };
            if node.size as u32 != *size {
                throw_panic!(
                    "layout mismatch (size @{i}); {desc}({}): {ty}, layout = {layout}",
                    node.size
                )
            }
            if node.ofs - start != *ofs {
                throw_panic!(
                    "layout mismatch (offset @{i}); {desc}({}): {ty}, layout = {layout}",
                    node.ofs
                )
            }
            let desc = MemoryDesc {
                region_id: desc.region_id,
                offset: node.ofs,
            };
            let mut value = node
                .exps
                .last()
                .cloned()
                .ok_or_else(|| make_panic!("no data in {desc}").into())?;

            if let Some(sman) = sman.as_deref_mut() {
                value = SymbolicDesc::from_mdesc(self, sman, &desc, node, value)
                    .or_else(|panic| panic.into())?;
            }
            values.push(value)
        }

        // ..collect into an aggregate
        Exp::collect(ty, &mut values.into_iter()).or_else(|panic| panic.into())
    }

    /// Store `exp` at memory descriptor `desc` as the latest value, using the
    /// memory layout of `exp`'s type.
    ///
    /// When `raw` is `true`, the `constant` flag of the target memory
    /// descriptor is ignored; otherwise, it is an `SeError` to do so.
    pub fn store(&mut self, desc: &MemoryDesc, exp: Rc<Exp>, raw: bool) -> Result<(), SeError> {
        let ty = exp.ty();
        let Some(layout) = ty.get_layout(self) else {
            throw_panic!("{exp} does not have a memory layout")
        };
        assert_or_throw!(
            !layout.flattened.is_empty(),
            "storing zero-sized value {exp}"
        );

        let region = self.region(desc.region_id);
        if region.desc.is_heap() && region.freed {
            return Err(SeError::UseAfterFree {
                region: region.desc.clone(),
            });
        }

        let MemoryState {
            regions, history, ..
        } = self;
        let region = regions
            .get_mut(desc.region_id.get() as usize - RegionDesc::ID_START as usize)
            .unwrap();

        if (!raw) && region.desc.is_unwritable() {
            return Ok(());
        }

        let constant = region.desc.is_constant();
        let rsize = region.layout.size;
        let (node, node_id) = match region
            .nodes
            .binary_search_by(|node| node.ofs.cmp(&desc.offset))
        {
            Ok(idx) => (&mut region.nodes[idx], idx),
            Err(_) => {
                if desc.offset + layout.size > rsize {
                    // Out of bound
                    return Err(SeError::OutOfBound {
                        region: region.desc.clone(),
                        ofs: desc.offset + layout.size,
                    });
                } else {
                    throw_panic!("storing to non-aligned offset ({desc})");
                }
            }
        };

        // Optimize for storing a scalar
        if layout.scalar {
            assert_or_throw!(
                layout.size == node.size as u32,
                "layout mismatch (size); {desc}({}): {ty}, layout = {layout}",
                node.size,
            );

            if !raw {
                // Constant?
                if constant {
                    return Err(SeError::PtrReadOnly {
                        desc: desc.clone(),
                        exp,
                    });
                }
            }
            node.exps.push(exp);
            self.history.push(MemoryEvent::Mod {
                region_id: desc.region_id,
                node_id: node_id as u32,
            });
            return Ok(());
        }

        // Storing an aggregate
        let values = Exp::flatten(exp).map_err(|err| err.into())?;

        let start = node.ofs;
        let mut nodes = region.nodes.split_at_mut(node_id).1.iter_mut();

        // ..check layout and store values
        for (i, ((ofs, size), exp)) in layout.flattened.iter().zip(values.into_iter()).enumerate() {
            let Some(node) = nodes.next() else {
                throw_panic!("layout mismatch (no field @{i}); {desc}: {ty}, layout = {layout}")
            };
            if node.size as u32 != *size {
                throw_panic!(
                    "layout mismatch (size @{i}); {desc}({}): {ty}, layout = {layout}",
                    node.size
                )
            }
            if node.ofs - start != *ofs {
                throw_panic!(
                    "layout mismatch (offset @{i}); {desc}({}): {ty}, layout = {layout}",
                    node.ofs
                )
            }

            if !raw {
                // Constant?
                if constant {
                    return Err(SeError::PtrReadOnly {
                        desc: desc.clone(),
                        exp,
                    });
                }
            }
            node.exps.push(exp);
            history.push(MemoryEvent::Mod {
                region_id: desc.region_id,
                node_id: (node_id + i) as u32,
            });
        }

        Ok(())
    }

    /// Evaluate the `GetPtr` operation, returning a new descriptor, using the memory
    /// layout of `ty`.
    ///
    /// This API enforces the LLVM `inbounds` semantic. For an unbounded counterpart, use
    /// `get_ptr_unbounded`.
    pub fn get_ptr(
        &mut self,
        ty: Rc<Type>,
        desc: &MemoryDesc,
        idx: isize,
    ) -> Result<MemoryDesc, SeError> {
        self.__get_ptr(ty, desc, idx, true)
    }

    /// Evaluate the `GetPtr` operation, returning a new descriptor, using the memory
    /// layout of `ty`.
    ///
    /// This API does not follow the LLVM `inbounds` semantic. For a bounded counterpart, use
    /// `get_ptr`.
    pub fn get_ptr_unbounded(
        &mut self,
        ty: Rc<Type>,
        desc: &MemoryDesc,
        idx: isize,
    ) -> Result<MemoryDesc, SeError> {
        self.__get_ptr(ty, desc, idx, false)
    }

    /// Evaluate the `GetPtr` operation, returning a new descriptor, using the memory
    /// layout of `ty`.
    ///
    /// ## Bound Checking
    /// If `inbounds` is true, the LLVM `inbounds` semantic is applied (out-of-bound pointers
    /// become poison values); otherwise an out-of-bound descriptor is produced.
    fn __get_ptr(
        &mut self,
        ty: Rc<Type>,
        desc: &MemoryDesc,
        idx: isize,
        inbounds: bool,
    ) -> Result<MemoryDesc, SeError> {
        let Some(layout) = ty.get_layout(self) else {
            throw_panic!("{ty} does not have a memory layout")
        };

        // Optimize for GetPtr(_, 0)
        if idx == 0 {
            return Ok(desc.clone());
        }

        let region = self.region(desc.region_id);
        let ofs = (desc.offset as isize + layout.size as isize * idx) as u32;
        let rsize = region.layout.size;
        if ofs > rsize && inbounds {
            // out-of-region
            Err(SeError::OutOfBound {
                region: region.desc.clone(),
                ofs,
            })
        } else {
            Ok(MemoryDesc {
                region_id: desc.region_id,
                offset: ofs,
            })
        }
    }

    /// Evaluate the `GetElemPtr` operation, returning a new descriptor, using the memory
    /// layout of `ty`.
    ///
    /// This API enforces the LLVM `inbounds` semantic. For an unbounded counterpart, use
    /// `get_elem_ptr_unbounded`.
    pub fn get_elem_ptr(
        &mut self,
        ty: Rc<Type>,
        desc: &MemoryDesc,
        idx: usize,
    ) -> Result<MemoryDesc, SeError> {
        self.__get_elem_ptr(ty, desc, idx, true)
    }

    /// Evaluate the `GetElemPtr` operation, returning a new descriptor, using the memory
    /// layout of `ty`.
    ///
    /// This API does not follow the LLVM `inbounds` semantic. For a bounded counterpart, use
    /// `get_elem_ptr`.
    pub fn get_elem_ptr_unbounded(
        &mut self,
        ty: Rc<Type>,
        desc: &MemoryDesc,
        idx: usize,
    ) -> Result<MemoryDesc, SeError> {
        self.__get_elem_ptr(ty, desc, idx, false)
    }

    /// Evaluate the `GetElemPtr` operation, returning a new descriptor, using the memory
    /// layout of `ty`.
    ///
    /// ## Bound Checking
    /// If `inbounds` is true, the LLVM `inbounds` semantic is applied (out-of-bound pointers
    /// become poison values); otherwise an out-of-bound descriptor is produced.
    fn __get_elem_ptr(
        &mut self,
        ty: Rc<Type>,
        desc: &MemoryDesc,
        idx: usize,
        inbounds: bool,
    ) -> Result<MemoryDesc, SeError> {
        let Some(_) = ty.get_layout(self) else {
            throw_panic!("{ty} does not have a memory layout")
        };

        // Optimize for GetElemPtr(_, 0)
        if idx == 0 {
            return Ok(desc.clone());
        }

        let Some(ofs) = ty.get_offset(self, idx) else {
            throw_panic!("index {idx} is invalid within type {ty}")
        };

        let region = self.region(desc.region_id);
        let target = desc.offset + ofs;
        let rsize = region.layout.size;
        if target > rsize && inbounds {
            // out-of-region
            Err(SeError::OutOfBound {
                region: region.desc.clone(),
                ofs: target,
            })
        } else {
            Ok(MemoryDesc {
                region_id: desc.region_id,
                offset: target,
            })
        }
    }

    /// Starting from `desc`, walk `range` bytes ahead, applying the callback `cb`
    /// on each node reached, and return the ending descriptor if walking ends
    /// exactly at the start of a `MemoryNode`.
    /// This can be used to implement a handful of memory operations that involves
    /// raw pointer (i8*) offsetting.
    ///
    /// This walking does not attempt to cast the walked memory node layout, nor does it
    /// allow any partial reference / out of bound reference. It is then a `Panic` if
    /// `ofs` ends halfway within a memory node's logical bitfield, or if it goes over the
    /// end of a memory region.
    pub fn walk_range<F>(
        &mut self,
        desc: &MemoryDesc,
        range: u32,
        mut cb: F,
    ) -> Panicable<Option<MemoryDesc>>
    where
        F: FnMut(MemoryDesc, &MemoryNode),
    {
        let ty = self.region(desc.region_id).ty.clone();
        let layout = ty.get_layout(self).unwrap();
        let region = self.region(desc.region_id);
        let (node, mut node_id) = match region
            .nodes
            .binary_search_by(|node| node.ofs.cmp(&desc.offset))
        {
            Ok(idx) => (&region.nodes[idx], idx),
            Err(idx) => {
                let node = region.nodes.get(idx);
                if let Some(node) = node {
                    (node, idx)
                } else {
                    throw_panic!("walking starts at non-aligned offset ({desc})")
                }
            }
        };

        let start = desc.offset;
        let end = start + range;
        let mut progress = node.ofs; // may be larger than `start`
        let mut no_ret = false;
        while progress < end {
            let node = &region.nodes[node_id];
            let cur = MemoryDesc {
                region_id: desc.region_id,
                offset: node.ofs,
            };
            // ...will we end within a node?
            assert_or_throw!(
                progress + node.size as u32 <= end,
                "layout mismatch (offset @{end}); {desc}: [i8 x {range}], layout = {layout}",
            );

            cb(cur, node);

            // ...next
            node_id += 1;
            if node_id < region.nodes.len() {
                progress = region.nodes[node_id].ofs;
            } else {
                progress = layout.size;
                no_ret = true;
                break;
            }
        }

        // ...will we go over the end of a memory region?
        assert_or_throw!(
            progress >= end,
            "layout mismatch (offset @{end}); {desc}: [i8 x {range}], layout = {layout}",
        );

        if progress == end && !no_ret {
            Ok(Some(MemoryDesc {
                region_id: desc.region_id,
                offset: region.nodes[node_id].ofs,
            }))
        } else {
            Ok(None)
        }
    }

    /// Walk all allocated memory regions in DFS order, applying the callback `cb` on
    /// all nodes.
    pub fn walk_all<F>(&self, cb: &mut F)
    where
        F: FnMut(MemoryDesc, &Vec<Rc<Exp>>),
    {
        for region in self.regions.iter() {
            region.walk_all(cb);
        }
    }

    /// Get all the heap allocations since epoch `since`.
    pub fn mallocs(&self, since: u32) -> Vec<Rc<RegionDesc>> {
        let mut mallocs = Vec::new();
        for ((allocated_ty, flags), epochs) in self.mallocs.iter() {
            for (rep, epoch) in epochs.iter().enumerate().rev() {
                let rep = (rep + 1) as u32;
                if *epoch > since {
                    let heap_region = RegionDesc::Heap(HeapRegionDesc {
                        allocated_ty: allocated_ty.clone(),
                        flags: *flags,
                        rep: [
                            rep as u8 & 0xFF,
                            (rep >> 8) as u8 & 0xFF,
                            (rep >> 16) as u8 & 0xFF,
                        ],
                        region_id: RegionDesc::ID_NONE,
                    });
                    mallocs.push(self.region_descs.get(&heap_region).unwrap().clone());
                } else {
                    break;
                }
            }
        }
        mallocs
    }

    /// Determine if the given memory descriptor is modified since the snapshot `since`
    /// was taken.
    pub fn is_modified(
        &self,
        mdesc: &MemoryDesc,
        mnode: &MemoryNode,
        since: &MemorySnapshot,
    ) -> bool {
        let region = self.region(mdesc.region_id);
        if region.desc.is_constant() {
            // constant region cannot be modified
            return false;
        }
        // each descriptor initially contains one value
        since.descs.get(mdesc).cloned().unwrap_or(1) < mnode.exps.len() as u32
    }

    /// Collect all modified memory descriptors since the snapshot `since` was taken.
    pub fn all_modified(&self, since: &MemorySnapshot) -> Vec<(MemoryDesc, Rc<Exp>)> {
        let mut modifications = Vec::new();
        for region in self.regions.iter() {
            if region.desc.is_constant() {
                // constant region cannot be modified
                continue;
            }
            for node in region.nodes.iter() {
                let desc = MemoryDesc {
                    region_id: NonZeroU32::new(region.desc.id()).unwrap(),
                    offset: node.ofs,
                };
                // each descriptor initially contains one value
                if since.descs.get(&desc).cloned().unwrap_or(1) < node.exps.len() as u32 {
                    modifications.push((desc, node.exps.last().unwrap().clone()))
                }
            }
        }
        modifications
    }

    /// Determine if the given region is heap and has been freed.
    pub fn is_freed(&self, rdesc: Rc<RegionDesc>) -> bool {
        let region = self.region(NonZeroU32::new(rdesc.id()).unwrap());
        rdesc.is_heap() && region.freed
    }

    /// Collect all freed heap regions since the snapshot `since` was taken.
    pub fn all_freed(&self, since: &MemorySnapshot) -> Vec<Rc<RegionDesc>> {
        let mut freed = Vec::new();
        let last = since.freed.last().map(|rdesc| rdesc.id()).unwrap_or(0);
        for region in self.regions.iter().skip(last as usize) {
            if region.freed {
                freed.push(region.desc.clone());
            }
        }
        freed
    }
}

impl MemorySnapshot {
    /// Get the epoch when the snapshot was taken.
    pub fn epoch(&self) -> u32 {
        self.epoch
    }
}

impl MemoryRegion {
    fn walk_all<F>(&self, cb: &mut F)
    where
        F: FnMut(MemoryDesc, &Vec<Rc<Exp>>),
    {
        for node in self.nodes.iter() {
            cb(
                MemoryDesc {
                    region_id: NonZeroU32::new(self.desc.id()).unwrap(),
                    offset: node.ofs,
                },
                &node.exps,
            );
        }
    }
}

impl MemoryDesc {
    /// Get the backend representation for this memory descriptor.
    pub fn backend_repr(&self, _mstate: &MemoryState) -> u64 {
        // ((self.region_id.get() as u64) << 32) + self.node as u64
        ((self.region_id.get() as u64) << 32) + self.offset as u64
    }

    /// Get the region ID of this memory descriptor.
    pub fn region_id(&self) -> NonZeroU32 {
        self.region_id
    }

    /// Get the offset of this memory descriptor within its region.
    pub fn offset(&self) -> u32 {
        self.offset
    }

    /// Obtain a `MemoryDesc` from `rdesc` and `offset`.
    pub fn from_raw_parts(rdesc: Rc<RegionDesc>, offset: u32) -> MemoryDesc {
        let region_id = NonZeroU32::new(rdesc.id()).unwrap();
        MemoryDesc { region_id, offset }
    }
}

impl fmt::Display for MemoryDesc {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(
            f,
            "{}::{}",
            MEMORY_DESC_REPR.with(|repr| {
                let guard = repr.borrow();
                guard
                    .get(&self.region_id)
                    .expect("[MemoryDesc::fmt] uncached region id")
                    .clone()
            }),
            self.offset
        )
    }
}

impl fmt::Display for RegionDesc {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            RegionDesc::Stack(desc) => write!(f, "{desc}"),
            RegionDesc::Global(desc) => write!(f, "{desc}"),
            RegionDesc::Heap(desc) => write!(f, "{desc}"),
        }
    }
}

impl fmt::Display for StackRegionDesc {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        if self.rep == 0 {
            write!(f, "{}::{}", self.func_name, self.region_name)
        } else {
            write!(f, "({}#{})::{}", self.func_name, self.rep, self.region_name)
        }
    }
}

impl fmt::Display for GlobalRegionDesc {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        if self.flags & GLOBAL_REGION_FLAG_CONSTANT > 0 {
            write!(f, "Const::{}", self.global_name)
        } else {
            write!(f, "Global::{}", self.global_name)
        }
    }
}

impl fmt::Display for HeapRegionDesc {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(
            f,
            "Heap::({}, {} #{})",
            self.allocated_ty.0,
            if self.flags & HEAP_REGION_FLAG_ZERO_INIT != 0 {
                "zero"
            } else {
                "havoc"
            },
            self.rep[0] as u32 + ((self.rep[1] as u32) << 8) + ((self.rep[2] as u32) << 16),
        )
    }
}

enum Initializer {
    Exp(Rc<Exp>),
    Zero(Rc<Type>),
    Havoc(Rc<Type>),
}

impl fmt::Display for Initializer {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Initializer::Exp(exp) => write!(f, "{exp}"),
            Initializer::Havoc(ty) => write!(f, "havoc({ty})"),
            Initializer::Zero(ty) => write!(f, "zero({ty})"),
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::panic::Panicable;

    // { i32, ptr, { i1 } }
    fn init() -> (MemoryState, Rc<Exp>) {
        let _ = env_logger::builder()
            .format_timestamp(None)
            .is_test(true)
            .try_init();

        let mstate = MemoryState::new();
        let exp = Exp::false_exp();
        let fields = vec![
            Exp::int_literal(123, Some(32)).unwrap(),
            Exp::null(),
            Exp::tuple(vec![exp], false),
        ];
        let tuple = Exp::tuple(fields, false);

        (mstate, tuple)
    }

    /// Test that the `MemoryModel` can allocate `MemoryNode`s.
    #[test]
    fn mstate_allocate() -> Panicable<()> {
        let (mut mstate, tuple) = init();

        let _ = mstate.alloc_stack(tuple.ty(), "Test".into(), "0".into(), 0)?;
        let _ = mstate.alloc_global(tuple, "Test::1".into(), false)?;

        /* Basic */
        assert_eq!(mstate.region_descs.len(), 2);
        assert_eq!(mstate.regions.len(), 2);
        /* Well-formedness */
        for region in mstate.regions.iter() {
            assert_eq!(region.nodes.len(), 3);
        }
        Ok(())
    }

    /// Test that the `MemoryModel` can calculate `MemoryLayout`s correctly.
    #[test]
    fn mstate_layout() -> Panicable<()> {
        let (mut mstate, tuple) = init();

        let desc = mstate.alloc_global(tuple, "Test::1".into(), false)?;
        let region = mstate.region_of(&desc);
        let layout = mstate.type_of(region).get_layout(&mut mstate).unwrap();

        assert_eq!(layout.size, 24);
        assert_eq!(layout.align, 8);
        // assert_eq!(layout.fields, vec![0, 8, 16]);
        assert_eq!(layout.flattened, vec![(0, 4), (8, 8), (16, 1)]);

        /* also test zero-sized types */
        let zst = typ!({ [i32; 0], i8, {}, i8, { [i64; 0] } });
        let layout = zst.get_layout(&mut mstate).unwrap();
        println!("{layout}");
        assert_eq!(layout.size, 8);
        assert_eq!(layout.align, 8);
        // assert_eq!(layout.fields, vec![0, 0, 1, 1, 8]);
        assert_eq!(layout.flattened, vec![(0, 1), (1, 1)]);
        Ok(())
    }

    /// Test that the `MemoryModel` can handle GetElemPtr.
    #[test]
    fn mstate_get_elem_ptr() -> Panicable<()> {
        let (mut mstate, tuple) = init();

        let desc1 = mstate.alloc_stack(tuple.ty(), "Test".into(), "0".into(), 0)?;
        let desc2 = mstate.alloc_global(tuple.clone(), "Test::1".into(), false)?;

        let gep1 = mstate.get_elem_ptr(tuple.ty(), &desc1, 2).unwrap();
        let gep2 = mstate.get_elem_ptr(tuple.ty(), &desc2, 2).unwrap();
        assert_eq!(gep1.offset, 16);
        assert_eq!(gep2.offset, 16);

        let ty = typ!({ i1 });
        let gep3 = mstate.get_elem_ptr(ty.clone(), &gep1, 0).unwrap();
        let gep4 = mstate.get_elem_ptr(ty.clone(), &gep2, 0).unwrap();
        assert_eq!(gep3.offset, 16);
        assert_eq!(gep4.offset, 16);

        Ok(())
    }

    /// Test that the `MemoryModel` can handle GetPtr.
    #[test]
    fn mstate_get_ptr() -> Panicable<()> {
        let (mut mstate, tuple) = init();
        let array_ty = Type::mk_array(4, tuple.ty());

        let arr_desc = mstate.alloc_stack(array_ty.clone(), "Test".into(), "0".into(), 0)?;
        let tuple_desc = mstate.alloc_global(tuple.clone(), "Test::1".into(), false)?;

        let gp1 = mstate.get_ptr(tuple.ty(), &tuple_desc, 0).unwrap();
        assert_eq!(tuple_desc, gp1);

        let gep1 = mstate.get_elem_ptr(array_ty.clone(), &arr_desc, 1).unwrap();
        let gep3 = mstate.get_elem_ptr(array_ty.clone(), &arr_desc, 3).unwrap();
        let gp2 = mstate.get_ptr(tuple.ty(), &gep1, 2).unwrap();
        assert_eq!(gep3, gp2);
        Ok(())
    }

    /// Test that the `MemoryModel` can handle loads.
    #[test]
    fn mstate_load() -> Panicable<()> {
        let (mut mstate, tuple) = init();
        let ty1 = typ!(i32);
        let ty3 = typ!({ i1 });
        let ty4 = typ!(i1);

        let desc1 = mstate.alloc_stack(tuple.ty(), "Test".into(), "0".into(), 0)?;
        let desc2 = mstate.alloc_global(tuple.clone(), "Test::1".into(), false)?;

        let desc3 = mstate.get_elem_ptr(tuple.ty(), &desc1, 2).unwrap();
        let desc4 = mstate.get_elem_ptr(tuple.ty(), &desc2, 0).unwrap();
        let desc5 = mstate.get_elem_ptr(tuple.ty(), &desc2, 2).unwrap();
        let desc6 = mstate.get_elem_ptr(ty3.clone(), &desc5, 0).unwrap();

        let load1 = mstate.load(ty1.clone(), &desc4, None).unwrap();
        let value = exp_as_data!(load1, Exp::IntLiteral).value;
        assert_eq!(value, 123);

        let load2 = mstate.load(ty3.clone(), &desc3, None).unwrap();
        let res = exec::exec(load2, &mut exec::ExecMode::Eval).unwrap();
        let ans = Exp::havoc(ty3.clone());
        assert_eq!(ans.eq(&res), ExpOrdering::Eq);

        let load3 = mstate.load(ty4.clone(), &desc6, None).unwrap();
        assert_eq!(exp_as_bool!(load3), Some(false));

        let load4 = mstate.load(tuple.ty(), &desc1, None).unwrap();
        let res = exec::exec(load4, &mut exec::ExecMode::Eval).unwrap();
        let ans = Exp::havoc(tuple.ty());
        assert_eq!(ans.eq(&res), ExpOrdering::Eq);

        let load5 = mstate.load(tuple.ty(), &desc2, None).unwrap();
        assert_eq!(load5.eq(&tuple), ExpOrdering::Eq);
        Ok(())
    }

    /// Test that the `MemoryModel` can handle stores.
    #[test]
    fn mstate_store() -> Panicable<()> {
        let (mut mstate, tuple) = init();

        let desc = mstate.alloc_stack(tuple.ty(), "Test".into(), "0".into(), 0)?;

        let gep0 = mstate.get_elem_ptr(tuple.ty(), &desc, 0).unwrap();
        let field1 = Exp::int_literal(123, Some(32))?;

        mstate.store(&gep0, field1.clone(), true).unwrap();
        mstate.store(&desc, tuple.clone(), true).unwrap();
        mstate.store(&gep0, field1.clone(), true).unwrap();

        let loaded = mstate.load(tuple.ty(), &desc, None).unwrap();
        assert_eq!(loaded.eq(&tuple), ExpOrdering::Eq);
        Ok(())
    }

    /// Test that the `MemoryModel` can handle simple push and pop.
    #[test]
    fn mstate_push_pop() -> Panicable<()> {
        let (mut mstate, tuple) = init();
        let exp = Exp::int_literal(-123, Some(32))?;
        let exp2 = Exp::int_literal(0, Some(32))?;

        let desc1 = mstate.alloc_stack(tuple.ty(), "Test".into(), "0".into(), 0)?;

        let gep1 = mstate.get_elem_ptr(tuple.ty(), &desc1, 0).unwrap();

        mstate.push(); // <1>
        let desc2 = mstate.alloc_global(tuple.clone(), "Test::1".into(), false)?;

        let gep2 = mstate.get_elem_ptr(tuple.ty(), &desc2, 0).unwrap();
        mstate.store(&gep1, exp.clone(), true).unwrap();
        mstate.store(&gep2, exp.clone(), true).unwrap();

        mstate.push(); // <2>
        mstate.store(&gep1, exp2.clone(), true).unwrap();
        mstate.store(&desc2, tuple.clone(), true).unwrap();
        mstate.pop(); // </2> the stores above is invalidated

        let load1 = mstate.load(tuple.ty(), &desc1, None).unwrap();
        let ans1 = {
            let havoc = Exp::havoc(tuple.ty());
            let indices = vec![Exp::int_literal(0, None)?];
            Exp::insert_value(havoc, exp.clone(), indices)?
        };
        assert_eq!(
            exec::exec(ans1, &mut exec::ExecMode::Eval)
                .unwrap()
                .eq(&exec::exec(load1, &mut exec::ExecMode::Eval).unwrap()),
            ExpOrdering::Eq
        );
        let load2 = mstate.load(tuple.ty(), &desc2, None).unwrap();
        let ans2 = {
            let indices = vec![Exp::int_literal(0, None)?];
            Exp::insert_value(tuple.clone(), exp.clone(), indices)?
        };
        assert_eq!(
            exec::exec(ans2, &mut exec::ExecMode::Eval)
                .unwrap()
                .eq(&exec::exec(load2, &mut exec::ExecMode::Eval).unwrap()),
            ExpOrdering::Eq
        );

        mstate.pop(); // </1> `desc1` goes back to Havoc; `desc2` is dropped
        let load3 = mstate.load(tuple.ty(), &desc1, None).unwrap();
        let ans3 = Exp::havoc(tuple.ty());
        assert_eq!(
            exec::exec(load3, &mut exec::ExecMode::Eval)
                .unwrap()
                .eq(&ans3),
            ExpOrdering::Eq
        );

        assert_eq!(mstate.region_descs.len(), 2); // no region is dropped
        Ok(())
    }

    /// Test that the `MemoryModel` can handle raw offsetting with `walk_range()`
    /// in the happy path.
    #[test]
    fn mstate_walk_range_ok() -> Panicable<()> {
        // { {i32, i8}, i8, [i32; 2], i8 } will take 24 bytes
        //         ^            ^
        //         start        end

        /* Prepare */
        let mut mstate = MemoryState::new();
        let ty = typ!({ {i32, i8}, i8, [i32; 2], i8 });
        let desc = mstate.alloc_stack(ty.clone(), "Test".into(), "0".into(), 0)?;
        let start = {
            let ty = typ!({i32, i8});
            mstate.get_elem_ptr(ty, &desc, 1).unwrap()
        };
        let end = {
            let desc = mstate.get_elem_ptr(ty.clone(), &desc, 2).unwrap();
            let ty = typ!([i32; 2]);
            mstate.get_elem_ptr(ty, &desc, 1).unwrap()
        };

        /* Test */
        let mut in_range = Vec::new();
        let res = mstate
            .walk_range(&start, 12, |desc, _| in_range.push(desc))
            .unwrap();

        {
            let region = mstate.region(desc.region_id);
            for (id, node) in region.nodes.iter().enumerate() {
                println!("{}: {}", id, node.ofs);
            }
        }
        for (i, x) in in_range.iter().enumerate() {
            println!("{i}: {x}");
        }
        assert!(in_range.len() == 3);
        assert!(in_range[0].offset == 4);
        assert!(in_range[1].offset == 8);
        assert!(in_range[2].offset == 12);
        assert_eq!(res, Some(end));

        let mut cnt = 0;
        let res = mstate
            .walk_range(&start, 19, |_, _| {
                cnt += 1;
            })
            .unwrap();
        assert!(cnt == 5);
        assert!(res.is_none());
        Ok(())
    }

    /// Test that the `MemoryModel` can handle raw offsetting with `walk_range()`
    /// in the error path.
    #[test]
    fn mstate_walk_range_err() -> Panicable<()> {
        // { {i32, i8}, i8, [i32; 2], i8 } will take 24 bytes
        //         ^
        //         start

        /* Prepare */
        let mut mstate = MemoryState::new();
        let ty = typ!({ {i32, i8}, i8, [i32; 2], i8 });
        let desc = mstate.alloc_stack(ty, "Test".into(), "0".into(), 0)?;

        let start = {
            let ty = typ!({i32, i8});
            mstate.get_elem_ptr(ty, &desc, 1).unwrap()
        };

        /* Test */
        assert!(mstate.walk_range(&start, 10, |_, _| {}).is_err());
        assert!(mstate.walk_range(&start, 22, |_, _| {}).is_err());
        Ok(())
    }
}
