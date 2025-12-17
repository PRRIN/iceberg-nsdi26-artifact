//! This module implements the type data of values that the symbolic execution engine
//! works with.

use crate::middleend::{Exp, MemoryLayout, MemoryState};
use crate::panic::*;
use crate::util;
use crate::util::StringRef;
use by_address::ByAddress;
use fxhash::FxHashMap;
use std::cell::RefCell;
use std::fmt;
use std::rc::Rc;

/// The intended bit-width of a pointer type.
/// This is relevant in pointer type related operations.
pub const TYPE_POINTER_WIDTH: u32 = 64;

/// `Type` expresses type information that is necessary for
/// specifying the semantics of `Exp`s, and also acts as a
/// redundant sanity check.
///
/// To reduce memory footprint (and due to the immutable nature
/// of types), `Type`s refer to each other through `Rc`s, and
/// should in general be wrapped in a `Rc` outside the `types`
/// module.
/// Ultimately, a `HashMap` of `Rc<Type>`s owns the raw type
/// declarations; clones of these `Rc<Type>`s are then used
/// everywhere else, implementing hash-consing on `Type`s.
pub enum Type {
    /// A bounded array of the same `Type`.
    Array(ArrayKind),

    /// A bitvector type. This models the `iN` type
    /// from LLVM. Not to be confused with the `Int` type.
    BitVec(BitVecKind),

    /// An enum type.
    Enum(EnumKind),

    /// An **unbounded** integer type. This models the mathmatical
    /// concept of an integer, but never real program integers.
    /// It is intended that summary / SPEC uses this without relaxing
    /// necessary bounds, since the backend SMT solver is likely to
    /// handle unbounded integer better.
    Int(IntKind),

    /// A lambda function type.
    Lambda(LambdaKind),

    /// An unbounded list of the same `Type`.
    List(ListKind),

    /// A pointer type.
    Pointer(PointerKind),

    /// A tuple type.
    Tuple(TupleKind),

    /// A unit type (with only one value).
    Unit(UnitKind),
}

impl fmt::Debug for Type {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        self.fmt(f)
    }
}

impl fmt::Display for Type {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        self.fmt(f)
    }
}

/// `Typed` is implemented by things that should have a `Type`.
pub trait Typed {
    fn ty(&self) -> Rc<Type>;
}

type Layout = RefCell<Option<Option<Rc<MemoryLayout>>>>;
//                    ^ Cached?   ^ Has one?
// By default, all `Layout` fields starts as `None`, meaning
// it is uncached.

pub struct ArrayKind {
    pub len: usize,
    pub elem_ty: Rc<Type>,
    layout: Layout,
}

pub struct BitVecKind {
    pub width: u32,
    layout: Layout,
}

pub struct EnumKind {
    pub name: StringRef,
    pub discriminants: Vec<StringRef>,
    /// A globally unique ID.
    /// Used to derive the ID for `Exp::EnumLiteral`s of this type.
    pub id: i64,
}

pub struct IntKind {}

pub struct LambdaKind {
    pub ret_ty: Rc<Type>,
    pub arg_ty: Vec<Rc<Type>>,
    pub va_args: bool,
}

pub struct ListKind {
    pub elem_ty: Rc<Type>,
}

pub struct PointerKind {
    layout: Layout,
}

pub struct TupleKind {
    pub fields: Box<[Rc<Type>]>,
    pub packed: bool,
    layout: Layout,
    offsets: RefCell<Option<Option<Vec<u32>>>>, // field offsets
}

pub struct UnitKind {}

// --- Formatters ---

impl fmt::Debug for ArrayKind {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        self.fmt(f)
    }
}
impl fmt::Display for ArrayKind {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        self.fmt(f)
    }
}
impl ArrayKind {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "[{}; {}]", self.elem_ty, self.len)
    }
}

impl fmt::Debug for BitVecKind {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        self.fmt(f)
    }
}
impl fmt::Display for BitVecKind {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        self.fmt(f)
    }
}
impl BitVecKind {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "i{}", self.width)
    }
}

impl fmt::Debug for EnumKind {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        self.fmt(f)
    }
}
impl fmt::Display for EnumKind {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        self.fmt(f)
    }
}
impl EnumKind {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "Enum({})", self.name)
    }
}

impl fmt::Debug for IntKind {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        self.fmt(f)
    }
}
impl fmt::Display for IntKind {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        self.fmt(f)
    }
}
impl IntKind {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "int")
    }
}

impl fmt::Debug for LambdaKind {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        self.fmt(f)
    }
}
impl fmt::Display for LambdaKind {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        self.fmt(f)
    }
}
impl LambdaKind {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "|")?;
        if let Some((e, v)) = self.arg_ty.split_first() {
            write!(f, "{}", e)?;
            v.iter().for_each(|ty| write!(f, ", {}", ty).unwrap());
        }
        if self.va_args {
            write!(f, "...")?;
        }
        write!(f, "| -> {}", self.ret_ty)
    }
}

impl fmt::Debug for ListKind {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        self.fmt(f)
    }
}
impl fmt::Display for ListKind {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        self.fmt(f)
    }
}
impl ListKind {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "List<{}>", self.elem_ty)
    }
}

impl fmt::Debug for PointerKind {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        self.fmt(f)
    }
}
impl fmt::Display for PointerKind {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        self.fmt(f)
    }
}
impl PointerKind {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "ptr")
    }
}

impl fmt::Debug for TupleKind {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        self.fmt(f)
    }
}
impl fmt::Display for TupleKind {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        self.fmt(f)
    }
}
impl TupleKind {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        if self.packed {
            write!(f, "<{{ ")?;
        } else {
            write!(f, "{{ ")?;
        }
        if let Some((e, v)) = self.fields.split_first() {
            write!(f, "{}", e)?;
            v.iter().for_each(|e| write!(f, ", {}", e).unwrap());
        }
        if self.packed {
            write!(f, " }}>")
        } else {
            write!(f, " }}")
        }
    }
}

impl fmt::Debug for UnitKind {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        self.fmt(f)
    }
}
impl fmt::Display for UnitKind {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        self.fmt(f)
    }
}
impl UnitKind {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "()")
    }
}

/// Helper macro to make a `Type`.
#[macro_export]
macro_rules! typ {
    (i1) => {
        Type::mk_bitvec(1)
    };
    (bool) => {
        Type::mk_bool()
    };
    (i8) => {
        Type::mk_bitvec(8)
    };
    (i16) => {
        Type::mk_bitvec(16)
    };
    (i32) => {
        Type::mk_bitvec(32)
    };
    (i64) => {
        Type::mk_bitvec(64)
    };
    (ptr) => {
        Type::mk_pointer()
    };
    ($l:literal) => {
        Type::resolve($l).unwrap()
    };
    ([$t:tt; $len:expr]) => {
        {
            Type::mk_array($len, typ!($t))
        }
    };
    ({$($ts:tt),*}) => {
        {
            Type::mk_tuple(__typs!($($ts),*))
        }
    };
}

#[macro_export]
macro_rules! __typs {
    () => {
        vec![]
    };

    ($t:tt) => {
        vec![typ!($t)]
    };

    ($t:tt, $($ts:tt),*) => {
        {
            [vec![typ!($t)], __typs!($($ts),*)].concat()
        }
    };
}

/// Helper macro to cast a type into its inner data (`Kind`s),
/// with runtime panics if discriminants mismatch.
#[macro_export]
macro_rules! type_as_kind {
    ($ty: expr, $pat: path) => {
        match &*$ty {
            $pat(kind) => kind,
            _ => panic!(
                "[type_as_kind] type {} does not have kind {}",
                $ty,
                stringify!($pat),
            ),
        }
    };
}

/// Helper macro to determine if a type is the given kind.
#[macro_export]
macro_rules! type_is_kind {
    ($ty: expr, $pat: path) => {
        match &*$ty {
            $pat(_) => true,
            _ => false,
        }
    };
}

/// Helper macro to determine if two types are identical.
///
/// Caveat: both arguments must be `Rc<Type>`.
#[macro_export]
macro_rules! type_eq {
    ($ty1: expr, $ty2: expr) => {
        std::ptr::eq(&*$ty1, &*$ty2)
    };
}

/// Helper macro to determine if a type is Bool (BitVec with width 1)
#[macro_export]
macro_rules! type_is_bool {
    ($ty: expr) => {
        match &*$ty {
            Type::BitVec(kind) => {
                if kind.width == 1 {
                    true
                } else {
                    false
                }
            }
            _ => false,
        }
    };
}

pub use __typs;
pub use typ;
pub use type_as_kind;
pub use type_eq;
pub use type_is_bool;
pub use type_is_kind;

/// `TypeManager` owns all `Type` instances.
/// It also resolves named type bindings, sets up type aliases properly,
/// and manages identical types as singletons with hash-consing.
///
/// Since there is no point maintaining multiple separate type systems, the `TypeManager`
/// is effectively singleton, with a global lifetime.
/// (Currently it is implemented as a thread-local.)
///
/// ### Making `Type`s
///
/// One way to obtain `Type` instances (in the form of `Rc<Type>`) is to use the factory pattern,
/// as in:
/// ```no_run
/// let field1 = Type::mk_tuple(vec![Type::mk_bitvec(32)]);
/// let field2 = Type::mk_array(5, Type::mk_bitvec(64));
/// let field3 = Type::mk_pointer(Type::mk_bool());
/// let ty = Type::mk_tuple(vec![field1, field2, field3]);
/// ```
/// where `ty` translates to `{ { i32 }, [i64; 5], ptr }`.
///
/// This can get tedious at times. Luckily, there is also a special macro `typ!` that
/// makes it a one-liner:
/// ```no_run
/// let ty = typ!({ { i32 }, [i64; 5], ptr });
/// ````
#[derive(Debug)]
struct TypeManager {
    /* Hash tables */
    // `Type`s that are unique simply by their names.
    // These include `BitVec`, `Enum`, `Int`, `Pointer`, and `Unit`.
    bitvec_types: Vec<Rc<Type>>, // only 1~128 is allowed
    int_type: Rc<Type>,
    unit_type: Rc<Type>,
    pointer_type: Rc<Type>,
    enum_types: FxHashMap<StringRef, Rc<Type>>,

    // Composite `Types`.
    array_types: FxHashMap<(usize, HashPtrType), Rc<Type>>,
    lambda_types: FxHashMap<(Vec<HashPtrType>, bool), Rc<Type>>,
    list_types: FxHashMap<HashPtrType, Rc<Type>>,
    tuple_types: FxHashMap<(Vec<HashPtrType>, bool), Rc<Type>>,

    /* Name binding */
    bindings: FxHashMap<StringRef, Rc<Type>>,

    /* Utils */
    nonce: util::Nonce,
}

thread_local! {
    static TMAN: RefCell<TypeManager> = {
        RefCell::new(TypeManager::new())
    }
}

impl Type {
    /// Bind type `ty` to the name `name`.
    ///
    /// Rebinding a name causes a panic.
    pub fn bind(name: StringRef, ty: Rc<Type>) -> Panicable<()> {
        TMAN.with(|tman| tman.borrow_mut().bind(name, ty))
    }

    /// Resolve a named binding, if it is registered, into a more verbose
    /// type.
    pub fn resolve(name: &str) -> Panicable<Rc<Type>> {
        TMAN.with(|tman| tman.borrow().resolve(name))
    }

    /// Make a `Type::Array` type.
    pub fn mk_array(len: usize, elem_ty: Rc<Type>) -> Rc<Type> {
        TMAN.with(|tman| tman.borrow_mut().mk_array(len, elem_ty))
    }

    /// Make a `Type::BitVec` type.
    pub fn mk_bitvec(width: u32) -> Rc<Type> {
        TMAN.with(|tman| tman.borrow_mut().mk_bitvec(width))
    }

    /// AliasPointer to `mk_bitvec(1)`.
    pub fn mk_bool() -> Rc<Type> {
        TMAN.with(|tman| tman.borrow_mut().mk_bool())
    }

    /// Make a `Type::Enum` type.
    pub fn mk_enum(name: StringRef, discriminants: Vec<StringRef>) -> Rc<Type> {
        TMAN.with(|tman| tman.borrow_mut().mk_enum(name, discriminants))
    }

    /// Make a `Type::Int` type.
    pub fn mk_int() -> Rc<Type> {
        TMAN.with(|tman| tman.borrow().mk_int())
    }

    /// Make a `Type::Lambda` type.
    pub fn mk_lambda(
        ret_ty: Rc<Type>,
        arg_ty: impl Into<Vec<Rc<Type>>>,
        va_args: bool,
    ) -> Rc<Type> {
        TMAN.with(|tman| tman.borrow_mut().mk_lambda(ret_ty, arg_ty, va_args))
    }

    /// Make a `Type::List` type.
    pub fn mk_list(elem_ty: Rc<Type>) -> Rc<Type> {
        TMAN.with(|tman| tman.borrow_mut().mk_list(elem_ty))
    }

    /// Make a `Type::Pointer` type.
    pub fn mk_pointer() -> Rc<Type> {
        TMAN.with(|tman| tman.borrow_mut().mk_pointer())
    }

    /// Make a `Type::Tuple` type.
    pub fn mk_tuple(fields: impl AsRef<[Rc<Type>]>) -> Rc<Type> {
        TMAN.with(|tman| tman.borrow_mut().mk_tuple(fields, false))
    }

    /// Make a `Type::Tuple` type, with packed memory layout.
    pub fn mk_tuple_packed(fields: impl AsRef<[Rc<Type>]>) -> Rc<Type> {
        TMAN.with(|tman| tman.borrow_mut().mk_tuple(fields, true))
    }

    /// Make a `Type::Unit` type.
    pub fn mk_unit() -> Rc<Type> {
        TMAN.with(|tman| tman.borrow().mk_unit())
    }

    /// Get the memory layout of `self`, if there is one.
    pub fn get_layout(&self, mstate: &mut MemoryState) -> Option<Rc<MemoryLayout>> {
        match self {
            Type::Array(kind) => {
                let guard = kind.layout.borrow();
                if let Some(layout) = guard.as_ref() {
                    layout.clone()
                } else {
                    drop(guard);
                    if let Some(layout) = kind.elem_ty.get_layout(mstate) {
                        let layout = mstate.array_layout(layout, kind.len);
                        _ = kind.layout.borrow_mut().insert(Some(layout.clone()));
                        Some(layout)
                    } else {
                        _ = kind.layout.borrow_mut().insert(None);
                        None
                    }
                }
            }
            Type::BitVec(kind) => {
                let guard = kind.layout.borrow();
                if let Some(layout) = guard.as_ref() {
                    layout.clone()
                } else {
                    drop(guard);
                    let align = if kind.width < 8 {
                        1
                    } else {
                        u32::next_power_of_two(kind.width as u32) / 8
                    };
                    let layout = mstate.scalar_layout(align, align as u8);
                    _ = kind.layout.borrow_mut().insert(Some(layout.clone()));
                    Some(layout)
                }
            }
            Type::Enum(_) | Type::Int(_) | Type::Lambda(_) | Type::List(_) | Type::Unit(_) => None,
            Type::Pointer(kind) => {
                let guard = kind.layout.borrow();
                if let Some(layout) = guard.as_ref() {
                    layout.clone()
                } else {
                    drop(guard);
                    let align = TYPE_POINTER_WIDTH / 8;
                    let layout = mstate.scalar_layout(align, align as u8);
                    _ = kind.layout.borrow_mut().insert(Some(layout.clone()));
                    Some(layout)
                }
            }
            Type::Tuple(kind) => {
                let guard = kind.layout.borrow();
                if let Some(layout) = guard.as_ref() {
                    layout.clone()
                } else {
                    drop(guard);
                    if let Some(layouts) = kind
                        .fields
                        .iter()
                        .map(|fty| fty.get_layout(mstate))
                        .collect::<Option<Vec<_>>>()
                    {
                        let (layout, offsets) = mstate.tuple_layout(layouts, kind.packed);
                        _ = kind.layout.borrow_mut().insert(Some(layout.clone()));
                        _ = kind.offsets.borrow_mut().insert(Some(offsets));
                        Some(layout)
                    } else {
                        _ = kind.layout.borrow_mut().insert(None);
                        _ = kind.offsets.borrow_mut().insert(None);
                        None
                    }
                }
            }
        }
    }

    /// Get the offset of the `index`-th field within `self`, as per the
    /// memory layout.
    pub fn get_offset(&self, mstate: &mut MemoryState, index: usize) -> Option<u32> {
        let _ = self.get_layout(mstate)?; // must have a layout
        match self {
            Type::Array(kind) => Some(kind.elem_ty.get_layout(mstate)?.size * index as u32),
            Type::Tuple(kind) => {
                let offsets = kind.offsets.borrow();
                offsets
                    .as_ref()
                    .unwrap()
                    .as_ref()
                    .unwrap()
                    .get(index)
                    .cloned()
            }
            _ => None,
        }
    }

    /// Unwrap the given aggregate type `agg_ty` with given index `index`,
    /// returning the sub-type.
    pub fn sub_type(agg_ty: Rc<Type>, index: Rc<Exp>) -> Panicable<Rc<Type>> {
        let index_ty = index.ty();
        if !type_is_kind!(index_ty, Type::BitVec) && !type_is_kind!(index_ty, Type::Int) {
            throw_panic!("index {index} is neither BitVec nor Int");
        }
        match &*agg_ty {
            Type::Array(kind) => Ok(kind.elem_ty.clone()),
            Type::List(kind) => Ok(kind.elem_ty.clone()),
            Type::Tuple(kind) => match &*index {
                Exp::IntLiteral(data) => {
                    let ty = kind.fields.get(data.value as usize).cloned();
                    match ty {
                        None => throw_panic!("index {index} out of bound for {agg_ty}"),
                        Some(ty) => Ok(ty),
                    }
                }
                _ => {
                    throw_panic!("index {index} must be IntLiteral for struct type {agg_ty}");
                }
            },
            _ => {
                throw_panic!("type {agg_ty} is not an aggregate type");
            }
        }
    }

    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Type::Array(kind) => kind.fmt(f),
            Type::BitVec(kind) => kind.fmt(f),
            Type::Enum(kind) => kind.fmt(f),
            Type::Int(kind) => kind.fmt(f),
            Type::Lambda(kind) => kind.fmt(f),
            Type::List(kind) => kind.fmt(f),
            Type::Pointer(kind) => kind.fmt(f),
            Type::Tuple(kind) => kind.fmt(f),
            Type::Unit(kind) => kind.fmt(f),
        }
    }
}

impl TypeManager {
    /// Creates a fresh `TypeManager`, with only `Int` and `Unit` pre-allocated.
    fn new() -> Self {
        TypeManager {
            bitvec_types: (1..=128)
                .map(|width| {
                    Rc::new(Type::BitVec(BitVecKind {
                        width,
                        layout: RefCell::new(None),
                    }))
                })
                .collect(),
            int_type: Rc::new(Type::Int(IntKind {})),
            unit_type: Rc::new(Type::Unit(UnitKind {})),
            pointer_type: Rc::new(Type::Pointer(PointerKind {
                layout: RefCell::new(None),
            })),

            enum_types: FxHashMap::default(),
            array_types: FxHashMap::default(),
            lambda_types: FxHashMap::default(),
            list_types: FxHashMap::default(),
            tuple_types: FxHashMap::default(),

            bindings: FxHashMap::default(),
            nonce: util::Nonce::new(),
        }
    }

    #[inline(always)]
    fn bind(&mut self, name: StringRef, ty: Rc<Type>) -> Panicable<()> {
        assert_or_throw!(
            self.bindings.insert(name.clone(), ty).is_none(),
            "{name} is already bound",
        );
        Ok(())
    }

    #[inline(always)]
    fn resolve(&self, name: &str) -> Panicable<Rc<Type>> {
        match self.bindings.get(name) {
            Some(ty) => Ok(ty.clone()),
            None => throw_panic!("unbound type name: {}", name),
        }
    }

    #[inline(always)]
    fn mk_array(&mut self, len: usize, elem_ty: Rc<Type>) -> Rc<Type> {
        let key = (len, ByAddress(elem_ty.clone()));
        if let Some(ty) = self.array_types.get(&key) {
            // Hashed
            ty.clone()
        } else {
            let ty = Rc::new(Type::Array(ArrayKind {
                len,
                elem_ty: elem_ty.clone(),
                layout: RefCell::new(None),
            }));
            self.array_types.insert(key, ty.clone());
            ty
        }
    }

    #[inline(always)]
    fn mk_bitvec(&mut self, width: u32) -> Rc<Type> {
        if width <= 0 {
            panic!("bitvector width should be positive");
        }
        if width > 128 {
            panic!("bitvector width greater than 128 is not supported");
        }
        self.bitvec_types[(width - 1) as usize].clone()
    }

    #[inline(always)]
    fn mk_bool(&mut self) -> Rc<Type> {
        self.mk_bitvec(1)
    }

    #[inline(always)]
    fn mk_enum(&mut self, name: StringRef, discriminants: Vec<StringRef>) -> Rc<Type> {
        if let Some(ty) = self.enum_types.get(&name) {
            // Hashed
            ty.clone()
        } else {
            let key = name.clone();
            let n_discriminants = discriminants.len();
            let ty: Rc<Type> = Rc::new(Type::Enum(EnumKind {
                name,
                discriminants,
                id: self.nonce.reserve(n_discriminants),
            }));
            self.enum_types.insert(key, ty.clone());
            ty
        }
    }

    #[inline(always)]
    fn mk_int(&self) -> Rc<Type> {
        self.int_type.clone()
    }

    #[inline(always)]
    fn mk_lambda(
        &mut self,
        ret_ty: Rc<Type>,
        arg_ty: impl Into<Vec<Rc<Type>>>,
        va_args: bool,
    ) -> Rc<Type> {
        let arg_ty = arg_ty.into();
        let mut key = vec![HashPtrType::from(ret_ty.clone())];
        key.extend(arg_ty.iter().map(|ty| HashPtrType::from(ty.clone())));
        let key = (key, va_args);
        if let Some(ty) = self.lambda_types.get(&key) {
            // Hashed
            ty.clone()
        } else {
            let ty = Rc::new(Type::Lambda(LambdaKind {
                ret_ty,
                arg_ty,
                va_args,
            }));
            self.lambda_types.insert(key, ty.clone());
            ty
        }
    }

    #[inline(always)]
    fn mk_list(&mut self, elem_ty: Rc<Type>) -> Rc<Type> {
        let key = HashPtrType::from(elem_ty.clone());
        if let Some(ty) = self.list_types.get(&key) {
            // Hashed
            ty.clone()
        } else {
            let ty = Rc::new(Type::List(ListKind { elem_ty }));
            self.list_types.insert(key, ty.clone());
            ty
        }
    }

    #[inline(always)]
    fn mk_pointer(&mut self) -> Rc<Type> {
        self.pointer_type.clone()
    }

    #[inline(always)]
    fn mk_tuple(&mut self, fields: impl AsRef<[Rc<Type>]>, packed: bool) -> Rc<Type> {
        let fields = fields.as_ref();
        let key = (
            fields
                .iter()
                .map(|field| HashPtrType::from(field.clone()))
                .collect::<Vec<_>>(),
            packed,
        );

        if let Some(ty) = self.tuple_types.get(&key) {
            // Hashed
            ty.clone()
        } else {
            let ty = Rc::new(Type::Tuple(TupleKind {
                fields: fields.into(),
                packed,
                layout: RefCell::new(None),
                offsets: RefCell::new(None),
            }));
            self.tuple_types.insert(key, ty.clone());
            ty
        }
    }

    #[inline(always)]
    fn mk_unit(&self) -> Rc<Type> {
        self.unit_type.clone()
    }
}

/// Hashable `Type`s by using the pointer value of a `Type` as the hash key.
///
/// Since `Type`s implement hash consing, this is a valid way to test if two `Type`s
/// are equal.
pub type HashPtrType = ByAddress<Rc<Type>>;

/// Type extensions, which include named type references and typed pointers.
///
/// `TypeExt`s are reminiscent of how the old type system in Iceberg worked,
/// except that the aliasing and type equivalence checks are not implemented.
/// These are meant to be used only as a sort of metadata.
///
/// `TypeExt`s are not hash-consed.
pub enum TypeExt {
    /// A native `Type`.
    Type(Rc<Type>),
    /// A named type reference.
    Named(StringRef),
    /// A typed pointer.
    TypedPtr(Rc<TypeExt>),
}

impl TypeExt {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            TypeExt::Type(ty) => write!(f, "Type({})", ty),
            TypeExt::Named(name) => write!(f, "Named({})", name),
            TypeExt::TypedPtr(ptr) => write!(f, "TypedPtr({})", ptr),
        }
    }
}

impl fmt::Debug for TypeExt {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        self.fmt(f)
    }
}

impl fmt::Display for TypeExt {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        self.fmt(f)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Test that the type manager can make simple types.
    #[test]
    #[allow(unused_variables)]
    fn type_manager_make_simple() -> Panicable<()> {
        let bv_ty = Type::mk_bitvec(32);
        let bool_ty = Type::mk_bool();
        let enum_ty = Type::mk_enum(
            "Color".into(),
            vec!["Red".into(), "Green".into(), "Blue".into()],
        );
        let int_ty = Type::mk_int();
        let unit_ty = Type::mk_unit();

        assert_eq!(type_as_kind!(bv_ty, Type::BitVec).width, 32);
        assert_eq!(type_as_kind!(enum_ty, Type::Enum).name, "Color".into());
        Ok(())
    }

    /// Test that the type manager can make array types.
    #[test]
    fn type_manager_make_array() -> Panicable<()> {
        let elem_ty = Type::mk_bool();

        let aty1 = Type::mk_array(3, elem_ty.clone());
        let aty2 = Type::mk_array(5, elem_ty);
        let aty3 = Type::mk_array(15, aty1.clone());

        TMAN.with_borrow(|tman| assert_eq!(tman.array_types.len(), 3));
        assert_eq!(type_as_kind!(aty2, Type::Array).len, 5);
        assert!(type_is_kind!(
            type_as_kind!(aty3, Type::Array).elem_ty,
            Type::Array
        ));
        Ok(())
    }

    /// Test that the type manager can make list types.
    #[test]
    fn type_manager_make_list() -> Panicable<()> {
        let elem_ty = Type::mk_bitvec(15);

        let lty1 = Type::mk_list(elem_ty);
        let lty2 = Type::mk_list(lty1.clone());

        TMAN.with_borrow(|tman| assert_eq!(tman.list_types.len(), 2));
        assert!(type_is_kind!(
            type_as_kind!(type_as_kind!(lty2, Type::List).elem_ty, Type::List).elem_ty,
            Type::BitVec
        ));
        Ok(())
    }

    /// Test that the type manager can make pointer types.
    #[test]
    fn type_manager_make_pointer() {
        let pty1 = Type::mk_pointer();
        let pty2 = Type::mk_pointer();

        assert!(type_eq!(pty1, pty2));
    }

    /// Test that the type manager can make struct types.
    #[test]
    #[allow(unused_variables)]
    fn type_manager_make_struct() -> Panicable<()> {
        let ty1 = Type::mk_bitvec(63);
        let ty2 = Type::mk_bitvec(62);
        let ty3 = Type::mk_int();

        let sty1 = Type::mk_tuple(vec![]);
        let sty2 = Type::mk_tuple(vec![ty1.clone()]);
        let sty3 = Type::mk_tuple(vec![ty2.clone()]);
        let sty4 = Type::mk_tuple(vec![ty1.clone(), ty2.clone(), ty3.clone()]);
        let sty5 = Type::mk_tuple(vec![ty2.clone(), ty1.clone(), ty3.clone()]);
        let sty6 = Type::mk_tuple(vec![ty3.clone(), ty3.clone(), ty3.clone()]);
        let sty7 = Type::mk_tuple(vec![sty2.clone()]);
        let sty8 = Type::mk_tuple(vec![sty3.clone()]);
        let sty9 = Type::mk_tuple(vec![sty4.clone(), sty8.clone(), ty3.clone()]);

        TMAN.with_borrow(|tman| assert_eq!(tman.tuple_types.len(), 9));
        Ok(())
    }

    /// Test that the type manager correctly achieves runtime singleton
    /// for equal types.
    #[test]
    fn type_manager_singleton_correctness() -> Panicable<()> {
        /* Test simple types */
        {
            let ty1 = Type::mk_bitvec(16);
            let ty2 = Type::mk_bitvec(16);
            let ty3 = Type::mk_unit();
            let ty4 = Type::mk_int();
            let ty5 = Type::mk_int();

            assert!(type_eq!(ty1, ty2));
            assert!(type_eq!(ty4, ty5));
            assert!(!type_eq!(ty2, ty3));
            assert!(!type_eq!(ty1, ty4));
        }

        /* Test composite types */
        {
            let aty1 = typ!([i32; 3]);
            let aty2 = typ!([i32; 3]);
            let aty3 = typ!([i32; 5]);
            let aty4 = typ!([[i32; 3]; 15]);
            let aty5 = typ!([[i32; 3]; 15]);

            assert!(type_eq!(aty1, aty2));
            assert!(type_eq!(aty4, aty5));
            assert!(!type_eq!(aty1, aty3));
            TMAN.with_borrow(|tman| assert_eq!(tman.array_types.len(), 3));

            let sty1 = {
                let field = Type::mk_bitvec(32);
                Type::mk_tuple([field])
            };
            let sty2 = typ!({ i32 });
            let sty3 = Type::mk_tuple([sty1.clone(), aty1.clone(), aty5.clone()]);
            let sty4 = typ!({ { i32 }, [i32; 3], [[i32; 3]; 15] });

            assert!(type_eq!(sty1, sty2));
            assert!(type_eq!(sty3, sty4));
            TMAN.with_borrow(|tman| assert_eq!(tman.tuple_types.len(), 2));
        }
        Ok(())
    }

    #[test]
    fn type_layout_basic() -> Panicable<()> {
        let mut mstate = MemoryState::new();

        {
            let ty = Type::mk_bitvec(1);
            assert!(ty
                .get_layout(&mut mstate)
                .is_some_and(|layout| layout.size == 1));
        }
        {
            let ty = Type::mk_bitvec(7);
            assert!(ty
                .get_layout(&mut mstate)
                .is_some_and(|layout| layout.size == 1));
        }
        {
            let ty = Type::mk_bitvec(8);
            assert!(ty
                .get_layout(&mut mstate)
                .is_some_and(|layout| layout.size == 1));
        }
        {
            let ty = Type::mk_bitvec(16);
            assert!(ty
                .get_layout(&mut mstate)
                .is_some_and(|layout| layout.size == 2));
        }
        {
            let ty = Type::mk_bitvec(32);
            assert!(ty
                .get_layout(&mut mstate)
                .is_some_and(|layout| layout.size == 4));
        }
        {
            let ty = Type::mk_bitvec(64);
            assert!(ty
                .get_layout(&mut mstate)
                .is_some_and(|layout| layout.size == 8));
        }
        {
            let ty = Type::mk_bitvec(40);
            assert!(ty
                .get_layout(&mut mstate)
                .is_some_and(|layout| layout.size == 8));
        }
        {
            let ty = Type::mk_pointer();
            assert!(ty
                .get_layout(&mut mstate)
                .is_some_and(|layout| layout.size == TYPE_POINTER_WIDTH / 8));
        }
        {
            let ty = typ!({ { i16, i32 }, [i64; 4] });
            assert!(ty
                .get_layout(&mut mstate)
                .is_some_and(|layout| layout.align == 8));
        }
        Ok(())
    }
}
