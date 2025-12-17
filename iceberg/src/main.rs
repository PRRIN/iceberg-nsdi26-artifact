use iceberg::verify::verify;

// TODO: `clap` it up, and a fancy profiling page!

fn main() {
    // Get command line arguments
    let args: Vec<String> = std::env::args().collect();

    // Check if enough arguments are provided
    if args.len() < 4 {
        panic!("Not enough arguments provided. Usage: cargo run <target> <test_suite> <start_test_id> <end_test_id>");
    }

    // Extract command line arguments
    let target = &args[1];
    let test_suite = &args[2];
    let start_test_id: u32 = args[3].parse().expect("Invalid start_test_id");
    let end_test_id: u32 = args[4].parse().expect("Invalid end_test_id");

    for test_id in start_test_id..end_test_id {
        let test_id = test_id.to_string();
        verify(target, test_suite, &test_id);
    }
}
