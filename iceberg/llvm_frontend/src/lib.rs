pub mod ast;

type StringRef = std::rc::Rc<str>;

#[cfg(any(test, feature = "test"))]
fn get_test_file(path: &str) -> std::path::PathBuf {
    let mut file_path =
        std::env::current_dir().expect("[test_dir] Failed to get current directory");
    file_path.push(path);
    file_path
}