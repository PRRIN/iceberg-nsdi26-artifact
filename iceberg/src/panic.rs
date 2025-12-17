//! Generic panicking for Iceberg.
//!
//! Notably, the panicking mechanism implemented here is only meant for the
//! unrecoverakble, `panic!` level errors. Most of these errors showcase
//! state inconsistencies, unsupported features, or simply flaws in current
//! implementation.
//!
//! On the other hand, recoverable errors, especially the `se::SeError` in the
//! middleend, which can occur during execution of an `Exp`, is not part of this
//! module. Those errors are simply an another possible result, and would not
//! lead to panicking.

/// Get the full-path function name of the current function.
#[macro_export]
macro_rules! function {
    () => {{
        fn f() {}
        fn type_name_of<T>(_: T) -> &'static str {
            std::any::type_name::<T>()
        }
        let name = type_name_of(f);
        &name[..name.len() - 3]
    }};
}

/// Make a panic with the given formatting arguments as description.
#[macro_export]
macro_rules! make_panic {
    ($($t:tt)*) => {{
        let desc = format!($($t)*);
        PanicSite::with(
            desc,
            function!(),
            std::file!(),
            std::line!(),
        )
    }};
}

/// Make a panic in the type mismatch format.
#[macro_export]
macro_rules! make_type_mismatch {
    ($found: expr, $expected: expr) => {{
        let desc = format!("mismatched types; found {}, expected {}", $found, $expected);
        PanicSite::with(desc, function!(), std::file!(), std::line!())
    }};
}

/// Early stop and throw the given panic, with the given formatting arguments
/// as description.
#[macro_export]
macro_rules! throw_panic {
    ($($t:tt)*) => {{
        return make_panic!($($t)*).into();
    }};
}

/// Early stop and throw a type mismatch panic.
#[macro_export]
macro_rules! throw_type_mismatch {
    ($found: expr, $expected: expr) => {{
        return make_type_mismatch!($found, $expected).into();
    }};
}

/// Early stop and throw a panic, if assertion fails.
#[macro_export]
macro_rules! assert_or_throw {
    ($assert:expr, $($t:tt)*) => {{
        if !$assert {
            throw_panic!($($t)*);
        }
    }};
}

/// Generic error object. Contains description of the error, and also where it
/// occurred.
pub struct PanicSite {
    desc: String,
    function: &'static str,
    file: &'static str,
    line: u32,
}

/// Trait for the `Panic` object to dump additional information at panics.
pub trait PanicInfo {
    fn dump(&self);
}

impl std::fmt::Debug for PanicSite {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{}:{}\n", self.file, self.line)?;
        write!(f, "[{}] {}\n", self.function, self.desc)
    }
}

impl PanicSite {
    /// Make a `Panic` with the given description.
    pub fn with(desc: String, function: &'static str, file: &'static str, line: u32) -> PanicSite {
        PanicSite {
            desc,
            function,
            file,
            line,
        }
    }

    /// Ignite the `Panic`.
    pub fn panic(&self, info: &impl PanicInfo) -> ! {
        info.dump();
        panic!("{:?}", self)
    }
}

impl<T> Into<Panicable<T>> for PanicSite {
    fn into(self) -> Panicable<T> {
        Err(self)
    }
}

/// Panicable result with `Panic`.
pub type Panicable<T> = std::result::Result<T, PanicSite>;

/// A trait that makes working with `Panic` results easier.
pub trait Panic<T> {
    fn get(self, info: &impl PanicInfo) -> T;
}

impl<T> Panic<T> for Panicable<T> {
    fn get(self, info: &impl PanicInfo) -> T {
        self.unwrap_or_else(|p| p.panic(info))
    }
}

pub use assert_or_throw;
pub use function;
pub use make_panic;
pub use make_type_mismatch;
pub use throw_panic;
pub use throw_type_mismatch;
