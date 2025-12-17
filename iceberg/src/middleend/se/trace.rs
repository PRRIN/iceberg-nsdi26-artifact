//! Implements tracing during the symbolic execution.
//!
//! This module internally defaults to no-op under release build,
//! so there's no need to mark its external usage with any conditional
//! compilation flags.

use crate::middleend::*;
use crate::panic::PanicInfo;
use std::fmt;

/// Traces for the symbolic execution engine.
///
/// The main difference from using a tracing logger is the trace size
/// (and arguably readability), especially because the SE process is
/// mainly DFS. Logging would display all previous explorations,
/// while `Traces` is meant to only capture the current path.
#[cfg(feature = "traces")]
#[derive(Default)]
pub struct Traces {
    traces: Vec<TraceEvent>,
}

/// A trace event.
#[cfg(feature = "traces")]
enum TraceEvent {
    /// Marks a trace push.
    Marker,
    /// Having visited a node on the current path.
    Node(CfgNodeRef),
    /// Summary-related information.
    SummaryInfo(String),
    /// Summary applier-related information because it is just so buggy...
    ApplierInfo(String),
    /// Arbitrary trace message.
    Msg(String),
}

#[cfg(feature = "traces")]
impl fmt::Display for TraceEvent {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            TraceEvent::Marker => Ok(()),
            TraceEvent::Node(node) => {
                let node = node.as_ref();
                write!(f, "<visit> {node}\n")
            }
            TraceEvent::SummaryInfo(info) => {
                write!(f, "<summary> {info}\n")
            }
            TraceEvent::ApplierInfo(info) => {
                write!(f, "<applier> {info}\n")
            }
            TraceEvent::Msg(msg) => write!(f, "<msg> {msg}\n"),
        }
    }
}

#[cfg(feature = "traces")]
impl Traces {
    pub fn new() -> Self {
        Default::default()
    }

    pub fn push(&mut self) {
        self.traces.push(TraceEvent::Marker);
    }

    pub fn pop(&mut self) {
        while let Some(event) = self.traces.pop() {
            if matches!(event, TraceEvent::Marker) {
                break;
            }
        }
    }

    /// Mark in trace that `node` has been visited.
    pub fn visit(&mut self, node: CfgNodeRef) {
        self.traces.push(TraceEvent::Node(node));
    }

    /// Add the summary information `info` in the traces.
    pub fn summary_info(&mut self, info: fmt::Arguments) {
        self.traces.push(TraceEvent::SummaryInfo(format!("{info}")));
    }

    /// Add the applier information `info` in the traces.
    pub fn applier_info(&mut self, info: fmt::Arguments) {
        self.traces.push(TraceEvent::ApplierInfo(format!("{info}")));
    }

    /// Add `msg` in the traces.
    pub fn msg(&mut self, msg: fmt::Arguments) {
        self.traces.push(TraceEvent::Msg(format!("{msg}")));
    }
}

#[cfg(feature = "traces")]
impl std::fmt::Display for Traces {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        for event in self.traces.iter() {
            write!(f, "{event}")?;
        }
        Ok(())
    }
}

impl PanicInfo for Traces {
    fn dump(&self) {
        eprintln!("{self}");
    }
}

/// Empty implementation for non-tracing builds, which should be optimized away.
#[cfg(not(feature = "traces"))]
pub struct Traces {}

#[cfg(not(feature = "traces"))]
impl fmt::Display for Traces {
    fn fmt(&self, _: &mut fmt::Formatter<'_>) -> fmt::Result {
        Ok(())
    }
}

#[cfg(not(feature = "traces"))]
impl Traces {
    pub fn new() -> Self {
        Traces {}
    }

    pub fn push(&mut self) {}

    pub fn pop(&mut self) {}

    pub fn visit(&mut self, _: CfgNodeRef) {}

    pub fn msg(&mut self, _: fmt::Arguments) {}

    pub fn summary_info(&mut self, _: fmt::Arguments) {}

    pub fn applier_info(&mut self, _: fmt::Arguments) {}
}
