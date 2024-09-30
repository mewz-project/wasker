include!(concat!(
    env!("CARGO_MANIFEST_DIR"),
    "/target/spectest/spectest.rs"
));

#[test]
fn test_dummy() {
    assert_eq!(1, 1);
}
