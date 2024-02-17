use dep::std;

fn main(preimage: [u8; 3], hash: [u8; 32], preimage2: [Field; 3], hash2: Field) {
    let h = std::hash::sha256(preimage);
    assert(h == hash);

    let h2 = std::hash::pedersen_hash(preimage2);
    assert(h2 == hash2);
}

#[test]
fn test_main() {
    let preimage = [4, 2, 0];
    let hash = [
        24, 67, 78, 52, 81, 51, 75, 186,
        149, 43, 134, 15, 156, 169, 194,
        248, 218, 249, 157, 110, 163, 98,
        225, 167, 127, 9, 3, 173, 165, 249,
        3, 51
    ];

    let preimage2: [Field; 3] = [4, 2, 0];
    let hash2: Field = 0x0be9d13af05bb19edc275e18a60acca265f4301b6247bf392cec86b8afbaace7;

    main(preimage, hash, preimage2, hash2);
}
