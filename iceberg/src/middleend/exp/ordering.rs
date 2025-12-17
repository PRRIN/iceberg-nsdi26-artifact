//! Implements evaluation (and equivalence) for `Exp`s.

use crate::middleend::*;

/// Ordering for comparison between `Exp`s.
///
/// `Exp` comparisons are more subtle than `PartialEq`,
/// because of the ambiguity between comparing `Exp`s
/// as-is (field-by-field), and comparing their evaluated
/// values.
///
/// By using `ExpOrdering`, we avoid the awkward case, where
/// two `Exp`s are not equal as raw values, but evaluates to
/// the same `Exp` value; i.e., where:
/// ```no_run
/// let lhs: Rc<Exp>;
/// let rhs: Rc<Exp>;
/// assert_ne!(lhs, rhs);
/// assert_eq!(lhs.eval(), rhs.eval());
/// ```
///
/// Instead, `lhs` and `rhs` would orginally be `ExpOrdering::Unsure`.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum ExpOrdering {
    Eq,
    Unsure,
    Neq,
    Incomparable,
}

impl ExpOrdering {
    pub fn and(&self, other: &ExpOrdering) -> ExpOrdering {
        match (self, other) {
            (_, ExpOrdering::Incomparable) => ExpOrdering::Incomparable,
            (ExpOrdering::Incomparable, _) => ExpOrdering::Incomparable,
            (ExpOrdering::Neq, _) => ExpOrdering::Neq,
            (_, ExpOrdering::Neq) => ExpOrdering::Neq,
            (ExpOrdering::Unsure, _) => ExpOrdering::Unsure,
            (_, ExpOrdering::Unsure) => ExpOrdering::Unsure,
            (ExpOrdering::Eq, ExpOrdering::Eq) => ExpOrdering::Eq,
        }
    }
}

impl From<bool> for ExpOrdering {
    fn from(value: bool) -> Self {
        if value {
            ExpOrdering::Eq
        } else {
            ExpOrdering::Neq
        }
    }
}

impl Into<bool> for ExpOrdering {
    fn into(self) -> bool {
        match self {
            ExpOrdering::Eq => true,
            _ => false,
        }
    }
}

/// Trait for comparison using `ExpOrdering`.
pub trait ExpEq {
    fn eq(&self, other: &Self) -> ExpOrdering;

    fn ne(&self, other: &Self) -> ExpOrdering {
        let ord = self.eq(other);
        match ord {
            ExpOrdering::Eq => ExpOrdering::Neq,
            ExpOrdering::Neq => ExpOrdering::Eq,
            _ => ord,
        }
    }
}

impl ExpEq for Exp {
    fn eq(&self, other: &Self) -> ExpOrdering {
        if !type_eq!(self.ty(), other.ty()) {
            return ExpOrdering::Neq;
        }

        match (self, other) {
            (Exp::Arith(data1), Exp::Arith(data2)) => <ExpOrdering>::from(data1.op == data2.op)
                .and(&data1.lhs.eq(&data2.lhs))
                .and(&data1.rhs.eq(&data2.rhs)),
            (Exp::BitCast(data1), Exp::BitCast(data2)) => data1.value.eq(&data2.value),
            (Exp::Boolean(data1), Exp::Boolean(data2)) => <ExpOrdering>::from(data1.op == data2.op)
                .and(&data1.lhs.eq(&data2.lhs))
                .and(&data1.rhs.eq(&data2.rhs)),
            (Exp::Compare(data1), Exp::Compare(data2)) => <ExpOrdering>::from(data1.op == data2.op)
                .and(&data1.lhs.eq(&data2.lhs))
                .and(&data1.rhs.eq(&data2.rhs)),
            (Exp::Concat(data1), Exp::Concat(data2)) => {
                data1.lhs.eq(&data2.lhs).and(&data1.rhs.eq(&data2.rhs))
            }
            (Exp::EnumLiteral(data1), Exp::EnumLiteral(data2)) => {
                <ExpOrdering>::from(data1.discriminant == data2.discriminant)
            }
            (Exp::Ext(data1), Exp::Ext(data2)) => {
                <ExpOrdering>::from(data1.op == data2.op).and(&data1.value.eq(&data2.value))
            }
            (Exp::ExtractValue(data1), Exp::ExtractValue(data2)) => {
                let init = data1.agg.eq(&data2.agg).and(&<ExpOrdering>::from(
                    data1.indices.len() == data2.indices.len(),
                ));
                data1
                    .indices
                    .iter()
                    .zip(data2.indices.iter())
                    .fold(init, |acc, (l, r)| acc.and(&l.eq(r)))
            }
            (Exp::GetPtr(data1), Exp::GetPtr(data2)) => {
                data1.ptr.eq(&data2.ptr).and(&data1.index.eq(&data2.index))
            }
            (Exp::GetElemPtr(data1), Exp::GetElemPtr(data2)) => {
                data1.ptr.eq(&data2.ptr).and(&data1.index.eq(&data2.index))
            }
            (Exp::Havoc(_), Exp::Havoc(_)) => ExpOrdering::Eq,
            (Exp::Ident(data1), Exp::Ident(data2)) => {
                <ExpOrdering>::from(data1.ident == data2.ident)
            }
            (Exp::Index(data1), Exp::Index(data2)) => data1
                .vector
                .eq(&data2.vector)
                .and(&data1.index.eq(&data2.index)),
            (Exp::InsertValue(data1), Exp::InsertValue(data2)) => {
                let init = data1
                    .agg
                    .eq(&data2.agg)
                    .and(&<ExpOrdering>::from(
                        data1.indices.len() == data2.indices.len(),
                    ))
                    .and(&data1.value.eq(&data2.value));
                data1
                    .indices
                    .iter()
                    .zip(data2.indices.iter())
                    .fold(init, |acc, (l, r)| acc.and(&l.eq(r)))
            }
            (Exp::IntLiteral(data1), Exp::IntLiteral(data2)) => {
                <ExpOrdering>::from(data1.value == data2.value)
            }
            (Exp::None(_), Exp::None(_)) => ExpOrdering::Eq,
            (Exp::Not(data1), Exp::Not(data2)) => data1.value.eq(&data2.value),
            (Exp::Null(_), Exp::Null(_)) => ExpOrdering::Eq,
            (Exp::PointerLiteral(data1), Exp::PointerLiteral(data2)) => {
                <ExpOrdering>::from(data1.desc == data2.desc)
            }
            (Exp::Range(data1), Exp::Range(data2)) => data1
                .vector
                .eq(&data2.vector)
                .and(&match (data1.start.as_ref(), data2.start.as_ref()) {
                    (Some(start1), Some(start2)) => start1.eq(start2),
                    (None, None) => ExpOrdering::Eq,
                    _ => ExpOrdering::Unsure,
                })
                .and(&match (data1.end.as_ref(), data2.end.as_ref()) {
                    (Some(end1), Some(end2)) => end1.eq(end2),
                    (None, None) => ExpOrdering::Eq,
                    _ => ExpOrdering::Unsure,
                }),
            (Exp::Tuple(data1), Exp::Tuple(data2)) => data1
                .fields
                .iter()
                .zip(data2.fields.iter())
                .fold(ExpOrdering::Eq, |acc, (l, r)| acc.and(&l.eq(r))),
            (Exp::Symbolic(data1), Exp::Symbolic(data2)) => {
                <ExpOrdering>::from(data1.desc == data2.desc)
            }
            (Exp::SymbolicPtr(data1), Exp::SymbolicPtr(data2)) => <ExpOrdering>::from(
                std::ptr::eq(&*data1.layout, &*data2.layout)
                    && data1.offset == data2.offset
                    && data1.region == data2.region,
            ),
            (Exp::Vector(data1), Exp::Vector(data2)) => data1
                .elems
                .iter()
                .zip(data2.elems.iter())
                .fold(ExpOrdering::Eq, |acc, (l, r)| acc.and(&l.eq(r))),

            // `Exp`s concerning `ValueState` and `MemoryState` are Unsure
            (Exp::Load(_), _) | (_, Exp::Load(_)) | (Exp::Var(_), _) | (_, Exp::Var(_)) => {
                ExpOrdering::Unsure
            }

            // `Exp`s with side-effects are not comparable
            (Exp::Alloca(_), _) | (_, Exp::Alloca(_)) | (Exp::Store(_), _) | (_, Exp::Store(_)) => {
                ExpOrdering::Incomparable
            }

            _ => match (exp_is_atom!(self), exp_is_atom!(other)) {
                // Atom `Exp`s with different kind must be `Neq`
                (true, true) => ExpOrdering::Neq,
                // Otherwise, one may evaluate to another
                _ => ExpOrdering::Unsure,
            },
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::panic::*;

    fn init_log() {
        let _ = env_logger::builder()
            .format_timestamp(None)
            .is_test(true)
            .try_init();
    }

    /// Test the correctness of `ExpOrdering`.
    #[test]
    fn exp_ordering() -> Panicable<()> {
        init_log();

        let exp1 = Exp::int_literal(0, Some(32))?;
        let exp2 = Exp::int_literal(0, Some(32))?;
        assert_eq!(exp1.eq(&exp2), ExpOrdering::Eq);

        let exp3 = Exp::tuple(vec![exp1.clone()], false);
        let exp4 = Exp::tuple(vec![exp2.clone(), exp2.clone()], false);
        assert_eq!(exp3.eq(&exp4), ExpOrdering::Neq);

        let ty = Type::mk_bool();
        let exp5 = Exp::compare(op::CompareOp::Uge, exp1.clone(), exp2.clone())?;
        let exp6 = Exp::ext(op::ExtOp::Trunc, ty.clone(), exp1.clone())?;
        assert_eq!(exp5.eq(&exp6), ExpOrdering::Unsure);

        let exp7 = Exp::alloca(ty.clone(), "Test".into(), "0".into());
        let exp8 = Exp::alloca(ty.clone(), "Test".into(), "1".into());
        assert_eq!(exp7.eq(&exp8), ExpOrdering::Incomparable);

        let s1 = Exp::tuple(vec![exp1.clone()], false);
        let s2 = Exp::tuple(vec![exp2.clone()], false);
        assert_eq!(s1.eq(&s2), ExpOrdering::Eq);

        let s1 = Exp::tuple(vec![exp1.clone(), exp5.clone()], false);
        let s2 = Exp::tuple(vec![exp2.clone(), exp6.clone()], false);
        assert_eq!(s1.eq(&s2), ExpOrdering::Unsure);

        let s1 = Exp::tuple(vec![exp1.clone(), exp5.clone(), exp3.clone()], false);
        let s2 = Exp::tuple(vec![exp2.clone(), exp6.clone(), exp4.clone()], false);
        assert_eq!(s1.eq(&s2), ExpOrdering::Neq);

        let s1 = Exp::tuple(vec![exp1.clone(), exp5.clone(), exp7.clone()], false);
        let s2 = Exp::tuple(vec![exp2.clone(), exp6.clone(), exp8.clone()], false);
        assert_eq!(s1.eq(&s2), ExpOrdering::Incomparable);
        Ok(())
    }
}
