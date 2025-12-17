//! This module declares control flow nodes which
//! form a (c)ontrol (f)low (g)raph. These nodes encode the
//! imperative semantics of frontend programs.

use crate::middleend::*;
use crate::panic::*;
use crate::util::StringRef;
use itertools::Itertools;
use std::fmt;
use std::rc::Rc;

/// Control flow graph nodes.
#[derive(Clone)]
pub enum CfgNode {
    /// `Assume` node enforces path conditions.
    Assume(AssumeNode),
    /// `FuncCall` node encodes calling a function.
    /// Since handling function calling requires careful manipulation of
    /// `Summary`s, and since a function essentially represents a whole
    /// sub-CFG, it has a CFG node of its own.
    FuncCall(FuncCallNode),
    /// `Label` is a marker node for basic block labels.
    /// It is effectively a `Noop` node; we keep it separately
    /// because it might be useful to retain the basic block
    /// information.
    Label(LabelNode),
    /// `Let` encodes binding of `Exp`s to names (`Exp::Var`).
    Let(LetNode),
    /// `Noop` is a placeholder node. It is used to help with
    /// building the CFG, especially when encoding intra-block
    /// branches.
    Noop(NoopNode),
    /// `Panic` represents generic runtime panics.
    Panic(PanicNode),
    /// `Return` node is the exit point of a CFG.
    /// It can be either a normal return or an exception being thrown.
    Return(ReturnNode),
}

/// Identifier for any `CfgNode` within its `Cfg`.
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub struct CfgNodeId(u32);

const CFG_NODE_ID_NONE: u32 = u32::MAX;

impl Default for CfgNodeId {
    fn default() -> Self {
        CfgNodeId(CFG_NODE_ID_NONE)
    }
}

/// Reference to a `CfgNode` within a `Function`'s control flow graph.
#[derive(Clone)]
pub struct CfgNodeRef {
    pub func: Rc<Function>,
    pub node: CfgNodeId,
}

impl PartialEq for CfgNodeRef {
    fn eq(&self, other: &Self) -> bool {
        Rc::ptr_eq(&self.func, &other.func) && self.node == other.node
    }
}

impl Eq for CfgNodeRef {}

impl std::hash::Hash for CfgNodeRef {
    fn hash<H: std::hash::Hasher>(&self, state: &mut H) {
        (self.func.as_ref() as *const Function).hash(state);
        self.node.hash(state);
    }
}

impl AsRef<CfgNode> for CfgNodeRef {
    fn as_ref(&self) -> &CfgNode {
        &self.func.cfg.nodes[self.node.0 as usize]
    }
}

/// Control flow graph.
/// 
/// `Cfg` manages all the `CfgNode`s and the entry point. 
/// It also provides methods to construct nodes and edges in the graph.
#[derive(Default)]
pub struct Cfg {
    entry: Option<CfgNodeId>,
    nodes: Vec<CfgNode>,
}

impl Cfg {
    pub fn new() -> Self {
        Default::default()
    }

    /// Get the entry node of the CFG.
    pub fn entry(&self) -> Option<CfgNodeId> {
        self.entry
    }

    /// Set the entry node of the CFG.
    pub fn set_entry(&mut self, entry: CfgNodeId) {
        assert!(entry.0 < self.nodes.len() as u32);
        self.entry = Some(entry);
    }

    /// Get a reference to a `CfgNode` in the graph.
    pub fn at(&self, id: CfgNodeId) -> &CfgNode {
        assert!(id.0 < self.nodes.len() as u32);
        &self.nodes[id.0 as usize]
    }

    /// Construct an `Assume` node in the graph, returning its `CfgNodeId`.
    pub fn assume_node(&mut self, condition: Rc<Exp>) -> Panicable<CfgNodeId> {
        let cond_ty: Rc<Type> = condition.ty();
        if !type_is_bool!(cond_ty) {
            throw_panic!("condition {condition} has type {cond_ty}, not Bool");
        }

        self.nodes.push(CfgNode::Assume(AssumeNode {
            condition,
            successors: Default::default(),
        }));
        Ok(CfgNodeId((self.nodes.len() - 1) as u32))
    }

    /// Construct a `FuncCall` node in the graph, returning its `CfgNodeId`.
    pub fn func_call_node(
        &mut self, 
        assign: Rc<Exp>,
        funct: Rc<Exp>,
        args: Vec<Rc<Exp>>,
    ) -> Panicable<CfgNodeId> {
        self.nodes.push(CfgNode::FuncCall(FuncCallNode {
            assign,
            funct,
            args: args.into_boxed_slice(),
            successors: Default::default(),
        }));
        Ok(CfgNodeId((self.nodes.len() - 1) as u32))
    }

    /// Construct a `Label` node in the graph, returning its `CfgNodeId`.
    pub fn label_node(&mut self, label: StringRef) -> CfgNodeId {
        self.nodes.push(CfgNode::Label(LabelNode {
            label,
            successors: Default::default(),
        }));
        CfgNodeId((self.nodes.len() - 1) as u32)
    }

    /// Construct a `Let` node in the graph, returning its `CfgNodeId`.
    pub fn let_node(&mut self, lexp: Rc<Exp>, rexp: Rc<Exp>) -> Panicable<CfgNodeId> {
        let lty = lexp.ty();
        let rty = rexp.ty();

        if !type_eq!(lty, rty) {
            throw_panic!("mismatch of type {lty} of lvalue {lexp} and {rty} of {rexp}");
        }
        if !matches!(lexp.as_ref(), Exp::Var { .. }) {
            throw_panic!("lvalue {lexp} must be Exp::Var");
        }

        self.nodes.push(CfgNode::Let(LetNode {
            lexp,
            rexp,
            successors: Default::default(),
        }));
        Ok(CfgNodeId((self.nodes.len() - 1) as u32))
    }

    /// Construct a `Noop` node in the graph, returning its `CfgNodeId`.
    pub fn noop_node(&mut self) -> CfgNodeId {
        self.nodes.push(CfgNode::Noop(NoopNode {
            successors: Default::default(),
        }));
        CfgNodeId((self.nodes.len() - 1) as u32)
    }

    /// Construct a `Panic` node in the graph, returning its `CfgNodeId`.
    pub fn panic_node(&mut self, message: Option<String>) -> CfgNodeId {
        self.nodes.push(CfgNode::Panic(PanicNode { message }));
        CfgNodeId((self.nodes.len() - 1) as u32)
    }

    /// Construct a `Return` node in the graph, returning its `CfgNodeId`.
    pub fn return_node(&mut self, exception: bool) -> CfgNodeId {
        self.nodes.push(CfgNode::Return(ReturnNode { exception }));
        CfgNodeId((self.nodes.len() - 1) as u32)
    }

    /// Connect two nodes in the graph, identified by their `CfgNodeId`s.
    pub fn connect(&mut self, from: CfgNodeId, to: CfgNodeId) -> Panicable<()> {
        assert!(from.0 < self.nodes.len() as u32 && to.0 < self.nodes.len() as u32);
        self.nodes[from.0 as usize].add_succ(to)
    }
}

impl CfgNode {

    /// Get the successors of a `CfgNode`.
    pub fn succ(&self) -> &[CfgNodeId] {
        match self {
            CfgNode::Assume(AssumeNode { successors, .. })
            | CfgNode::FuncCall(FuncCallNode { successors, .. }) 
            | CfgNode::Label(LabelNode { successors, .. }) 
            | CfgNode::Let(LetNode { successors, .. }) 
            | CfgNode::Noop(NoopNode { successors, .. }) => {
                match (successors[0].0, successors[1].0) {
                    (CFG_NODE_ID_NONE, _) => &[],
                    (_, CFG_NODE_ID_NONE) => &successors[..1],
                    (_, _) => successors,
                }
            },
            _ => &[],
        }
    }

    fn add_succ(&mut self, succ: CfgNodeId) -> Panicable<()> {
        match self {
            CfgNode::Assume(AssumeNode { successors, .. })
            | CfgNode::FuncCall(FuncCallNode { successors, .. }) 
            | CfgNode::Label(LabelNode { successors, .. }) 
            | CfgNode::Let(LetNode { successors, .. }) 
            | CfgNode::Noop(NoopNode { successors, .. }) => {
                if successors[0].0 == CFG_NODE_ID_NONE {
                    successors[0] = succ;
                } else if successors[1].0 == CFG_NODE_ID_NONE {
                    successors[1] = succ;
                } else {
                    throw_panic!("node {} already has two successors", self);
                }
            },
            _ => throw_panic!("adding successor to {}, which cannot have successors", self),
        }
        Ok(())
    }
}

#[derive(Debug, Clone)]
pub struct AssumeNode {
    pub condition: Rc<Exp>,
    successors: [CfgNodeId; 2],
}

#[derive(Debug, Clone)]
pub struct FuncCallNode {
    pub assign: Rc<Exp>,
    pub funct: Rc<Exp>,
    pub args: Box<[Rc<Exp>]>,
    successors: [CfgNodeId; 2],
}

#[derive(Debug, Clone)]
pub struct LabelNode {
    pub label: StringRef,
    successors: [CfgNodeId; 2],
}

#[derive(Debug, Clone)]
pub struct LetNode {
    pub lexp: Rc<Exp>,
    pub rexp: Rc<Exp>,
    successors: [CfgNodeId; 2],
}

#[derive(Debug, Clone)]
pub struct NoopNode {
    successors: [CfgNodeId; 2],
}

#[derive(Debug, Clone)]
pub struct PanicNode {
    pub message: Option<String>,
}

#[derive(Debug, Clone)]
pub struct ReturnNode {
    pub exception: bool,
}

impl fmt::Display for AssumeNode {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "[Assume| {} ]", self.condition)
    }
}

impl fmt::Display for FuncCallNode {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let args = self.args.iter().map(ToString::to_string).join(", ");
        write!(
            f,
            "[FuncCall| {} := {}({}) ]",
            self.assign, self.funct, args
        )
    }
}

impl fmt::Display for LabelNode {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "[Label| {} ]", self.label)
    }
}

impl fmt::Display for LetNode {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "[Let| {} := {} ]", self.lexp, self.rexp)
    }
}

impl fmt::Display for NoopNode {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "[Noop]")
    }
}

impl fmt::Display for PanicNode {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        if let Some(msg) = self.message.as_ref() {
            write!(f, "[Panic| {msg} ]")
        } else {
            write!(f, "[Panic| (no msg) ]")
        }
    }
}

impl fmt::Display for ReturnNode {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        if self.exception {
            write!(f, "[Throw]")
        } else {
            write!(f, "[Return]")
        }
    }
}

impl fmt::Display for CfgNode {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            CfgNode::Assume(node) => node.fmt(f),
            CfgNode::FuncCall(node) => node.fmt(f),
            CfgNode::Label(node) => node.fmt(f),
            CfgNode::Let(node) => node.fmt(f),
            CfgNode::Noop(node) => node.fmt(f),
            CfgNode::Panic(node) => node.fmt(f),
            CfgNode::Return(node) => node.fmt(f),
        }
    }
}
