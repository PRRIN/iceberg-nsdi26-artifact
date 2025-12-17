//! Implements constructs that relate to a middle-end AST,
//! which represents all information about the code that is
//! being analyzed.

use crate::middleend::*;
use crate::util::StringRef;
use std::collections::HashMap;
use std::rc::Rc;

/// A `Function` represents a function in the middleend.
pub struct Function {
    /// Function name.
    pub name: StringRef,
    /// Return type.
    pub ret_ty: Rc<Type>,
    /// Arguments, in the form of `(ValueDesc::Local, type)`.
    pub args: Vec<(ValueDesc, Rc<Type>)>, 
    /// Control flow graph.
    pub cfg: Cfg,

    // --- Cached special value descriptors ---
    v_retval: ValueDesc,
    v_throwval: ValueDesc,
    v_ex_flag: ValueDesc,
    v_ex_stk: ValueDesc,
    v_ex_stk_top: ValueDesc,
}

impl Function {

    pub fn new(
        name: StringRef, 
        ret_ty: Rc<Type>, 
        args: Vec<(ValueDesc, Rc<Type>)>,
        cfg: Cfg,
        vstate: &mut ValueState,
    ) -> Function {
        Function {
            name: name.clone(),
            ret_ty,
            args,
            cfg,

            v_retval: vstate.local(&name, ValueDesc::RET_VAL),
            v_throwval: vstate.local(&name, ValueDesc::THROW_VAL),
            v_ex_flag: vstate.local(&name, ValueDesc::EX_FLG),
            v_ex_stk: vstate.local(&name, ValueDesc::EX_STK),
            v_ex_stk_top: vstate.local(&name, ValueDesc::EX_STK_TOP),
        }
    }

    pub fn retval(&self) -> &ValueDesc {
        &self.v_retval
    }

    pub fn throwval(&self) -> &ValueDesc {
        &self.v_throwval
    }

    pub fn ex_flag(&self) -> &ValueDesc {
        &self.v_ex_flag
    }

    pub fn ex_stk(&self) -> &ValueDesc {
        &self.v_ex_stk
    }

    pub fn ex_stk_top(&self) -> &ValueDesc {
        &self.v_ex_stk_top
    }
}

/// An `Initializer` describes how a value should be initialized,
/// specifically when the symbolic execution engine is initialized
/// with an `Ast`.
pub enum Initializer {
    /// Initialize as an immutable global value as-is.
    ByValue(Rc<Exp>),
    /// Make an memory region storing the value, then binding the pointer to
    /// a global value.
    InMemory(Rc<Exp>, bool),
    /// Placeholder for declaration only values.
    Undef(Rc<Type>),
}

/// `Ast` includes all necessary information for doing symbolic
/// execution.
pub struct Ast {
    /// All functions in the AST indexed by function names.
    pub functions: HashMap<StringRef, Rc<Function>>,

    /// Initializers for global values in the AST.
    pub global_inits: Vec<(StringRef, Initializer)>,

    /// Extra type annotations.
    ///
    /// Since Iceberg's type system contains no named type references or typed
    /// pointers, there can be loss of type information when parsing the type
    /// definitions in LLVM IR.
    /// This exist to store such information.
    ///
    /// `eta` maps type definition names into a vector of annotations for its
    /// direct fields. When the annotation is `Some(_)`, it annotates the
    /// element type of an array / the base type of a pointer / the name of
    /// a tuple, based on the actual `Type` of the field.
    ///
    /// Note that such information is only available if the target LLVM IR is
    /// not produced using opaque pointers. The annotated types here are also
    /// not canonical.
    /// Currently, the `ddump` binary makes use of this information to simplify
    /// the generation of dumping code.
    pub eta: HashMap<StringRef, Vec<Option<Rc<TypeExt>>>>,
}
