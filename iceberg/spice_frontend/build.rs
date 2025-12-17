extern crate cargo_emit;
extern crate lalrpop;

fn main() {
    // LALRPOP's default lane table algorithm takes a century to run...
    std::env::set_var("LALRPOP_LANE_TABLE", "disabled");
    //println!("cargo:rustc-link-arg=-Wl,-stack_size,0x10000000"); // change stack size

    lalrpop::Configuration::new()
        .emit_rerun_directives(true)
        .process_current_dir()
        .unwrap();
}
