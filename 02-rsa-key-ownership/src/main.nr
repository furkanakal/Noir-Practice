use dep::std;

mod utils;

use utils::mod_exp;
use utils::mod_inverse;

fn main(ciphertext: u64, decrypted_message: u64) {
    let p: u64 = 61;
    let q: u64 = 53;
    let (n, d) = generate_keys(p, q);

    let decrypted = decrypt(ciphertext, d, n);

    assert(decrypted == decrypted_message);
}

fn decrypt(ciphertext: u64, d: u64, n: u64) -> u64 {
    mod_exp(ciphertext, d, n)
}

fn generate_keys(p: u64, q: u64) -> (u64, u64) {
    let n = p * q;
    let phi = (p - 1) * (q - 1);
    let e = 65537;
    let d = mod_inverse(e, phi);

    (n, d)
}

#[test]
fn test_main() {
    main(2557, 42);
}
