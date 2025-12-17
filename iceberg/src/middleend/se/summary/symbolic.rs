//! Implements the symbolic descriptor, symbolic state, and everything
//! else that describes the concept of dependent states.

use super::{BuilderEvent, Scope, SummaryState};
use crate::middleend::se::memory_state::MemoryNode;
use crate::middleend::{se::*, *};
use crate::panic::*;
use crate::util::StringRef;
use itertools::Itertools;
use std::fmt;
use std::rc::Rc;

/// A `SymbolicDesc` is a descriptor of a state.
/// `SymbolicDesc` provides a unified way for referring to a dependent state
/// across the concept of memories, local values and summaries. `Exp::Symbolic`s
/// and `Summary`s communicates through it as an interface.
///
/// Instances of `SymbolicDesc`s are made with the `from_mdesc` and `from_vdesc` methods,
/// both of which require a `SummaryManager`. The manager thus has complete control over
/// dependent states.
///
/// `SymbolicDesc`s are hash-consed by corresponding `Summary` instances.
#[derive(Debug, Clone)]
pub enum SymbolicDesc {
    /// A state described by a (field of) `ValueDesc`.
    Value(IndexedValueDesc),
    /// A state described by a node in a global region.
    GlobalMemory(GlobalMemoryDesc),
    /// A state described by a node in a symbolic region.
    /// See `SymbolicRegionDesc` for more details.
    SymbolicMemory(SymbolicMemoryDesc),
}

impl PartialEq for SymbolicDesc {
    fn eq(&self, other: &Self) -> bool {
        match (self, other) {
            (SymbolicDesc::Value(lhs), SymbolicDesc::Value(rhs)) => {
                lhs.inner == rhs.inner && lhs.indices == rhs.indices
            }
            (SymbolicDesc::GlobalMemory(lhs), SymbolicDesc::GlobalMemory(rhs)) => {
                lhs.scope == rhs.scope && lhs.inner == rhs.inner
            }
            (SymbolicDesc::SymbolicMemory(lhs), SymbolicDesc::SymbolicMemory(rhs)) => {
                lhs.region == rhs.region && lhs.offset == rhs.offset
            }
            _ => false,
        }
    }
}

impl Eq for SymbolicDesc {}

impl std::hash::Hash for SymbolicDesc {
    fn hash<H: std::hash::Hasher>(&self, state: &mut H) {
        match self {
            SymbolicDesc::Value(desc) => {
                0.hash(state);
                desc.inner.hash(state);
                desc.indices.hash(state);
            }
            SymbolicDesc::GlobalMemory(desc) => {
                1.hash(state);
                desc.scope.hash(state);
                desc.inner.hash(state);
            }
            SymbolicDesc::SymbolicMemory(desc) => {
                2.hash(state);
                desc.region.hash(state);
                desc.offset.hash(state);
            }
        }
    }
}

/// A symbolic region conceptually represents a set of regions with the same
/// `Type`.
///
/// Notably, symbolic regions MUST NOT refer to global regions. Otherwise, load/storing
/// the global region via a `PointerLiteral` must trigger the specialization of all
/// referencing `SymbolicPtr`s, which is hard to implement.
///
/// The `MemoryState` internally treats symbolic regions as "view"s of existing
/// regions; the actual base region information is delegated to the `ValueState`.
#[derive(Debug, Clone)]
pub struct SymbolicRegionDesc {
    /// Scope of this symbolic region.
    scope: StringRef,
    /// Symbolic region ID.
    symbolic: u32,
}

impl PartialEq for SymbolicRegionDesc {
    fn eq(&self, other: &Self) -> bool {
        self.scope.eq(&other.scope) && self.symbolic == other.symbolic
    }
}

impl Eq for SymbolicRegionDesc {}

impl std::hash::Hash for SymbolicRegionDesc {
    fn hash<H: std::hash::Hasher>(&self, state: &mut H) {
        self.scope.hash(state);
        self.symbolic.hash(state);
    }
}

impl fmt::Display for SymbolicRegionDesc {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        // write!(f, "[{} # {}]", self.symbolic, self.scope)
        write!(f, "[{}]", self.symbolic)
    }
}

#[derive(Debug, Clone)]
pub struct SymbolicMemoryDesc {
    /// The symbolic region descriptor.
    region: SymbolicRegionDesc,
    /// Node offset within the region.
    offset: u32,
}

impl fmt::Display for SymbolicMemoryDesc {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{}::{}", self.region, self.offset)
    }
}

#[derive(Debug, Clone)]
pub struct GlobalMemoryDesc {
    /// The actual referenced memory.
    /// Must belong to a global memory region.
    inner: MemoryDesc,
    /// Scope of this dependency.
    scope: Scope,
}

impl fmt::Display for GlobalMemoryDesc {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        if self.scope.len() <= 32 {
            write!(f, "{}::{}", self.scope, self.inner)
        } else {
            write!(f, "{}..::{}", &self.scope[..32], self.inner)
        }
    }
}

#[derive(Debug, Clone)]
pub struct IndexedValueDesc {
    /// Actual value descriptor.
    inner: ValueDesc,
    /// Indices into `inner`, when the value is an aggregate.
    indices: Vec<usize>,
    /// Scope of this dependency.
    scope: Scope,
}

impl fmt::Display for IndexedValueDesc {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        if self.indices.is_empty() {
            write!(f, "{}", self.inner)
        } else {
            write!(f, "{}::{}", self.inner, self.indices.iter().join("::"))
        }
    }
}

impl SymbolicRegionDesc {
    pub fn scope(&self) -> &str {
        &self.scope
    }

    pub fn symbolic(&self) -> u32 {
        self.symbolic
    }

    /// Make a `SymbolicRegionDesc` that specializes to `actual`, with the current scope,
    /// and record it in `sman`, assuming the current scope is building.
    ///
    /// In the case that `actual` is already associated with a `SymbolicRegionDesc`, the
    /// existing one is returned.
    pub fn from_actual(
        sman: &mut SummaryManager,
        actual: Rc<RegionDesc>,
    ) -> Panicable<SymbolicRegionDesc> {
        if actual.is_global() {
            throw_panic!("attempting to make symbolic region from global region {actual}");
        }

        let builder = sman.current_builder()?;

        // Ensure symbolic regions have one-to-one mapping
        assert!(builder.symbolic_region_binding.len() == builder.reverse_region_map.len());

        // Already made one
        let sdesc = builder.reverse_region_map.get(&actual);
        if let Some(sdesc) = sdesc {
            return Ok(sdesc.clone());
        }

        // ..otherwise, associate a new symbolic region
        let new_sr_id = builder.symbolic_region_binding.len() as u32; /* Assign incrementally */
        builder.symbolic_region_binding.push(actual.clone());

        let sdesc = SymbolicRegionDesc {
            scope: builder.scope(),
            symbolic: new_sr_id,
        };
        let builder = sman.current_builder().unwrap();
        builder.reverse_region_map.insert(actual, sdesc.clone());
        builder.events.push(BuilderEvent::bind());
        Ok(sdesc)
    }

    /// Get the region descriptor that is bound on the symbolic region `symbolic`
    /// under scope `scope`.
    pub fn concretize(
        sman: &mut SummaryManager,
        scope: &str,
        symbolic: u32,
    ) -> Panicable<Rc<RegionDesc>> {
        match &sman.summary(scope).state {
            SummaryState::Empty => unreachable!(),
            SummaryState::Apply(states) => {
                let bindings = &states.last().unwrap().region_binding;
                bindings
                    .get(&symbolic)
                    .map(Counted::get)
                    .cloned()
                    .ok_or_else(|| {
                        make_panic!(
                            "[{symbolic} # {scope}] is not currently associated with a base region"
                        )
                    })
            }
            SummaryState::Build(state) => {
                let region = state
                    .builder
                    .symbolic_region_binding
                    .get(symbolic as usize)
                    .unwrap();
                Ok(region.clone())
            }
        }
    }
}

impl SummaryManager {
    /// Bind symbolic region `symbolic` to the region descriptor `actual` in the apply state
    /// of the appropriate `Summary` instance, according to `scope`.
    /// The binding must respect a one-to-one mapping between symbolic region descriptors
    /// and actual region descriptors. `actual` must also not be a global region.
    ///
    /// ### Return
    /// If binding `symbolic` to `actual` would violate any of the rules above, return false;
    /// otherwise, return true.
    #[must_use]
    pub fn bind_symbolic(&mut self, scope: &str, symbolic: u32, actual: Rc<RegionDesc>) -> bool {
        if actual.is_global() {
            return false;
        }

        let summary = self.summary_mut(scope);
        let SummaryState::Apply(states) = &mut summary.state else {
            unreachable!("{symbolic} is not in Apply state, when binding it to {actual}")
        };
        let apply_state = states.last_mut().unwrap();
        assert!(apply_state.region_binding.len() == apply_state.reverse_region_map.len());
        if let Some(existing) = apply_state.region_binding.get_mut(&symbolic) {
            if !actual.eq(existing.get()) {
                return false;
            } else {
                existing.inc();
            }
        } else {
            if apply_state.reverse_region_map.contains_key(&actual) {
                return false;
            } else {
                let mut obj = Counted::new(actual.clone());
                obj.inc();
                apply_state.region_binding.insert(symbolic, obj);
                apply_state.reverse_region_map.insert(actual, symbolic);
            }
        }
        true
    }

    /// Unbind symbolic region `symbolic` in the apply state of the appropriate `Summary`
    /// instance, according to `scope`.
    pub fn unbind_symbolic(&mut self, scope: &str, symbolic: u32) -> Panicable<()> {
        let summary = self.summary_mut(scope);
        let SummaryState::Apply(states) = &mut summary.state else {
            unreachable!()
        };
        let apply_state = states.last_mut().unwrap();
        assert!(apply_state.region_binding.len() == apply_state.reverse_region_map.len());

        let existing = apply_state
            .region_binding
            .get_mut(&symbolic)
            .ok_or_else(|| make_panic!("{symbolic} is not bound"))?;
        if existing.dec().count() == 0 {
            let actual = apply_state.region_binding.remove(&symbolic).unwrap();
            apply_state.reverse_region_map.remove(actual.get()).unwrap();
        }
        Ok(())
    }
}

impl SymbolicDesc {
    /// Get the current value represented by the symbolic descriptor `self`.
    pub fn concretize(&self, ty: Rc<Type>, see: &mut See) -> Rc<Exp> {
        match self {
            SymbolicDesc::Value(desc) => {
                let vdesc = &desc.inner;
                let indices = &desc.indices;
                let value = see.vstate.get(&vdesc).unwrap();
                Exp::index_into(value, &indices).get(see.traces())
            }
            SymbolicDesc::GlobalMemory(desc) => {
                let mdesc = desc.inner.clone();
                see.mstate.load(ty, &mdesc, Some(&mut see.sman)).unwrap()
            }
            SymbolicDesc::SymbolicMemory(desc) => {
                let actual = SymbolicRegionDesc::concretize(
                    &mut see.sman,
                    desc.region.scope(),
                    desc.region.symbolic(),
                );
                let actual = actual.get(see.traces());
                let mdesc = MemoryDesc::from_raw_parts(actual, desc.offset);
                see.mstate
                    .load(ty, &mdesc, Some(&mut see.sman))
                    .get(see.traces())
            }
        }
    }

    pub fn scope(&self) -> &str {
        match self {
            SymbolicDesc::Value(desc) => &desc.scope,
            SymbolicDesc::GlobalMemory(desc) => &desc.scope,
            SymbolicDesc::SymbolicMemory(desc) => desc.region.scope(),
        }
    }

    /// Recording `mdesc` in `sman`, as a dependent state (in the current scope),
    /// with `specializer` as the specializer, and returning an `Exp::Symbolic`.
    ///
    /// In the case that the memory location, in the current scope, is already modified or
    /// specialized, `specializer` is returned untouched.
    ///
    /// Further, should the `mdesc` refer to a non-global region, the `sman` (more precisely
    /// the current `SummaryBuilder`) is consulted to see which symbolic region should be
    /// used to hide the actual region of `mdesc`.
    pub fn from_mdesc(
        mstate: &MemoryState,
        sman: &mut SummaryManager,
        mdesc: &MemoryDesc,
        mnode: &MemoryNode,
        specializer: Rc<Exp>,
    ) -> Panicable<Rc<Exp>> {
        // Check type
        let ty = specializer.ty();
        match ty.as_ref() {
            Type::BitVec(_) | Type::Pointer(_) => {}
            _ => unreachable!(),
        }

        let summary = sman.current_summary()?;
        let scope = summary.scope.clone();

        // Locally allocated region, or constant?
        let rdesc = mstate.region_of(mdesc);
        if rdesc.is_constant()
            || mstate.epoch_of(rdesc.clone()) > summary.builder().unwrap().snapshot().epoch()
        {
            return Ok(specializer);
        }

        let desc = if rdesc.is_global() {
            // Global memory
            let desc = SymbolicDesc::GlobalMemory(GlobalMemoryDesc {
                inner: mdesc.clone(),
                scope: scope.clone(),
            });
            match summary.symbolic_descs.get(&desc) {
                Some(desc) => desc.clone(),
                None => {
                    let desc = Rc::new(desc);
                    summary.symbolic_descs.insert(desc.clone());
                    desc
                }
            }
        } else {
            // Symbolic memory
            let builder = summary.builder().unwrap();
            let sdesc = builder
                .reverse_region_map
                .get(&rdesc)
                .ok_or_else(|| {
                    make_panic!(
                        "non-global memory {mdesc} is not assoicated with a symbolic region"
                    )
                })?
                .clone();
            let desc = SymbolicDesc::SymbolicMemory(SymbolicMemoryDesc {
                region: sdesc,
                offset: mdesc.offset(),
            });
            match summary.symbolic_descs.get(&desc) {
                Some(desc) => desc.clone(),
                None => {
                    let desc = Rc::new(desc);
                    summary.symbolic_descs.insert(desc.clone());
                    desc
                }
            }
        };

        let builder = summary.builder().unwrap();
        Ok(if mstate.is_modified(&mdesc, mnode, builder.snapshot()) {
            // Modified?
            specializer
        } else if let Some(SymbolicState::Specialized(_, spec)) = builder.symbolic_states.get(&desc)
        {
            // ..or already specialized?
            // NOTE: the order of these checks is crucial:
            // when a `MemoryDesc` is both modified and specialized, the modification
            // takes precedence.
            spec.clone()
        } else {
            if !type_is_kind!(ty, Type::Pointer) {
                // Add specializer as-is
                let state = SymbolicState::Symbolic(specializer);
                builder.symbolic_states.insert(desc.clone(), state);
            } else {
                let specializer = match specializer.as_ref() {
                    Exp::SymbolicPtr(data) => {
                        let desc = {
                            let actual = SymbolicRegionDesc::concretize(
                                sman,
                                data.region.scope(),
                                data.region.symbolic(),
                            )?;
                            MemoryDesc::from_raw_parts(actual, data.offset)
                        };
                        Exp::pointer_literal(desc)
                    }
                    _ => specializer,
                };
                let state = SymbolicState::Symbolic(specializer);
                sman.current_builder()?
                    .symbolic_states
                    .insert(desc.clone(), state);
            }
            Exp::symbolic(ty, desc)
        })
    }

    /// Recording all atom-typed fields of `vdesc` in `see.sman`, as a dependent state (in the
    /// current scope), making and returning the symbolic values.
    ///
    /// `vdesc` should be either `Local` or `Global`,
    /// * If `Local`, the ValueState should contain a bound value, which is used as the specializer
    /// for the symbolic;
    /// * If `Global`, the ValueState MUST NOT contain a bound value (there is no point in making
    /// an actual global value, which is constant, symbolic). Instead, self-referential `Exp::Symbolic`s
    /// are created as specializers, and the ValueState is also populated with these values.
    /// This essentially creates globally referentiable, truly symbolic values.
    pub fn from_vdesc(see: &mut See, vdesc: &ValueDesc, ty: Rc<Type>) -> Panicable<Rc<Exp>> {
        // Check type
        let mut indices = Vec::new();
        match vdesc {
            ValueDesc::Local { .. } => {
                let value = see
                    .vstate
                    .get(vdesc)
                    .ok_or_else(|| make_panic!("no value for {vdesc}"))?;
                SymbolicDesc::from_vdesc_indexed(see, vdesc, &mut indices, ty, Some(value))
            }
            ValueDesc::Global { .. } => {
                assert_or_throw!(
                    see.vstate.get(vdesc).is_none(),
                    "{vdesc} must be unbound as it is global"
                );
                SymbolicDesc::from_vdesc_indexed(see, vdesc, &mut indices, ty, None)
            }
            _ => throw_panic!("{vdesc} must be either Local or Global"),
        }
    }

    fn from_vdesc_indexed(
        see: &mut See,
        vdesc: &ValueDesc,
        indices: &mut Vec<usize>,
        ty: Rc<Type>,
        value: Option<Rc<Exp>>,
    ) -> Panicable<Rc<Exp>> {
        match ty.as_ref() {
            Type::Array(kind) => {
                let elems = match value.as_deref() {
                    None => (0..kind.len)
                        .map(|idx| {
                            indices.push(idx);
                            let elem = SymbolicDesc::from_vdesc_indexed(
                                see,
                                vdesc,
                                indices,
                                kind.elem_ty.clone(),
                                None,
                            );
                            indices.pop();
                            elem
                        })
                        .collect::<Panicable<_>>(),
                    Some(Exp::Vector(data)) => data
                        .elems
                        .iter()
                        .enumerate()
                        .map(|(idx, elem)| {
                            indices.push(idx);
                            let elem = SymbolicDesc::from_vdesc_indexed(
                                see,
                                vdesc,
                                indices,
                                kind.elem_ty.clone(),
                                Some(elem.clone()),
                            );
                            indices.pop();
                            elem
                        })
                        .collect::<Panicable<_>>(),
                    Some(exp) => {
                        throw_panic!("cannot unwrap {exp}")
                    }
                }?;
                Exp::vector(ty.clone(), elems)
            }
            Type::Tuple(kind) => {
                let fields = match value.as_deref() {
                    None => kind
                        .fields
                        .iter()
                        .enumerate()
                        .map(|(idx, fty)| {
                            indices.push(idx);
                            let field = SymbolicDesc::from_vdesc_indexed(
                                see,
                                vdesc,
                                indices,
                                fty.clone(),
                                None,
                            );
                            indices.pop();
                            field
                        })
                        .collect::<Panicable<_>>(),
                    Some(Exp::Tuple(data)) => data
                        .fields
                        .iter()
                        .enumerate()
                        .map(|(idx, field)| {
                            indices.push(idx);
                            let field = SymbolicDesc::from_vdesc_indexed(
                                see,
                                vdesc,
                                indices,
                                field.ty(),
                                Some(field.clone()),
                            );
                            indices.pop();
                            field
                        })
                        .collect::<Panicable<_>>(),
                    Some(exp) => {
                        throw_panic!("cannot unwrap {exp}")
                    }
                }?;
                Ok(Exp::tuple(fields, kind.packed))
            }
            Type::BitVec(_) | Type::Enum(_) | Type::Int(_) | Type::Pointer(_) => {
                let global = matches!(vdesc, ValueDesc::Global { .. });

                if global {
                    assert!(value.is_none());
                    let desc = Rc::new(SymbolicDesc::Value(IndexedValueDesc {
                        inner: vdesc.clone(),
                        scope: StringRef::from(""),
                        indices: indices.clone(),
                    }));
                    let symbolic = Exp::symbolic(ty, desc.clone());
                    see.vstate.put(vdesc, symbolic.clone());
                    Ok(symbolic)
                } else {
                    let spec = value.unwrap();
                    let summary = see.sman.current_summary()?;
                    let desc = SymbolicDesc::Value(IndexedValueDesc {
                        inner: vdesc.clone(),
                        scope: summary.scope.clone(),
                        indices: indices.clone(),
                    });
                    let desc = match summary.symbolic_descs.get(&desc) {
                        Some(desc) => desc.clone(),
                        None => {
                            let desc = Rc::new(desc);
                            summary.symbolic_descs.insert(desc.clone());
                            desc
                        }
                    };

                    assert!(!see
                        .sman
                        .current_builder()?
                        .symbolic_states
                        .contains_key(&desc));
                    if !type_is_kind!(ty, Type::Pointer) {
                        // Add specializer as-is
                        let state = SymbolicState::Symbolic(spec);
                        see.sman
                            .current_builder()?
                            .symbolic_states
                            .insert(desc.clone(), state);
                    } else {
                        let spec = match spec.as_ref() {
                            Exp::SymbolicPtr(data) => {
                                let desc = {
                                    let actual = SymbolicRegionDesc::concretize(
                                        &mut see.sman,
                                        data.region.scope(),
                                        data.region.symbolic(),
                                    )?;
                                    MemoryDesc::from_raw_parts(actual, data.offset)
                                };
                                Exp::pointer_literal(desc)
                            }
                            _ => spec,
                        };
                        let state = SymbolicState::Symbolic(spec);
                        see.sman
                            .current_builder()?
                            .symbolic_states
                            .insert(desc.clone(), state);
                    }
                    Ok(Exp::symbolic(ty, desc))
                }
            }
            Type::Lambda(_) | Type::List(_) | Type::Unit(_) => {
                throw_panic!(
                    "descriptor {vdesc} contains type {ty}, which cannot be made symbolic"
                );
            }
        }
    }
}

impl std::fmt::Display for SymbolicDesc {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            SymbolicDesc::Value(desc) => write!(f, "{desc}"),
            SymbolicDesc::GlobalMemory(desc) => write!(f, "{desc}"),
            SymbolicDesc::SymbolicMemory(desc) => write!(f, "{desc}"),
        }
    }
}

/// How a symbolic state should be interpreted.
#[derive(Clone)]
pub enum SymbolicState<T: Clone> {
    /// Assuming to be symbolic, agnostic of the underlying value.
    Symbolic(T),
    /// Specialized to the underlying value.
    Specialized(T /* Symbolic */, T /* Specialized */),
    /// Currently out-of-scope; must be concretized.
    Referral,
}
