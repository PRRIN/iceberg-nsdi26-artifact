//! Configuration for the symbolic execution engine.

use figment::{
    providers::{Format, Toml},
    Figment,
};
use serde::Deserialize;
use std::collections::{HashMap, HashSet};

/// The config object.
#[derive(Deserialize)]
pub struct Config {
    #[allow(unused)]
    action: Option<String>, // TODO: repurpose this

    builtin: BuiltinConfig,

    summary: SummaryConfig,
}

/// Config for builtins.
#[derive(Deserialize)]
struct BuiltinConfig {
    /// The target language model.
    pub target: String,

    /// Functions that are treated as nop.
    pub nop: Vec<String>,

    /// Functions that are treated as panics.
    pub panic: Vec<String>,

    /// Type hints of values.
    pub type_hint: HashMap<String, (String, String)>,
}

/// Config for summary-related stuff.
#[derive(Deserialize)]
struct SummaryConfig {
    /// Functions that are inlined (and thus not summarized).
    pub inlined: HashSet<String>,

    /// Path to the SPEC file.
    ///
    /// If empty, no SPEC file is loaded.
    pub spec_file: String,

    /// Preconditions (SPEC function names) for certain functions.
    ///
    /// Requires `spec_file` to be non-empty.
    pub preconds: HashMap<String, String>,

    /// Oracles (SPEC function names) for certain functions.
    ///
    /// Requires `spec_file` to be non-empty.
    pub oracles: HashMap<String, String>,
}

impl Config {
    /// Make a default configuration.
    pub fn default() -> Config {
        Config {
            action: None,
            builtin: BuiltinConfig {
                target: String::new(),
                nop: vec![],
                panic: vec![],
                type_hint: HashMap::new(),
            },
            summary: SummaryConfig {
                inlined: HashSet::new(),
                spec_file: String::new(),
                preconds: HashMap::new(),
                oracles: HashMap::new(),
            },
        }
    }

    /// Load a TOML configuration file with the given path.
    pub fn toml(path: &str) -> Config {
        let mut file_path =
            std::env::current_dir().expect("[Config::toml] Failed to get current directory");
        file_path.push(path);
        let config: Config = Figment::new()
            .merge(Toml::file(file_path))
            .extract()
            .unwrap();

        if config.summary_spec_file().is_none() {
            assert!(
                config.summary_preconds().is_empty(),
                "[Config::toml] `preconds` requires `spec_file` to be non-empty"
            );
            assert!(
                config.summary_oracles().is_empty(),
                "[Config::toml] `oracles` requires `spec_file` to be non-empty"
            );
        }

        // // Preconditions are always inlined..
        // config.summary.inlined.extend(config.summary.preconds.values().cloned());

        config
    }

    /// Get the functions that are inlined.
    pub fn summary_inlined(&self) -> &HashSet<String> {
        &self.summary.inlined
    }

    /// Get the SPEC file path.
    pub fn summary_spec_file(&self) -> Option<&str> {
        if self.summary.spec_file.is_empty() {
            None
        } else {
            Some(&self.summary.spec_file)
        }
    }

    /// Get the precondtions.
    pub fn summary_preconds(&self) -> &HashMap<String, String> {
        &self.summary.preconds
    }

    /// Get the oracles.
    pub fn summary_oracles(&self) -> &HashMap<String, String> {
        &self.summary.oracles
    }

    /// Get the builtin language targets.
    pub fn builtin_target(&self) -> &str {
        &self.builtin.target
    }

    /// Get the functions that are treated as nop.
    pub fn builtin_nop(&self) -> &[String] {
        &self.builtin.nop
    }

    /// Get the functions that are treated as panic.
    pub fn builtin_panic(&self) -> &[String] {
        &self.builtin.panic
    }

    /// Get the type hints.
    pub fn builtin_type_hint(&self) -> &HashMap<String, (String, String)> {
        &self.builtin.type_hint
    }
}
