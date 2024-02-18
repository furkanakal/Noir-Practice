use dep::std;

mod utils;

use utils::mod_exp;
use utils::mod_inverse;

fn main(public_key_n: u64, public_key_e: u64, message: u64, signature: u64) {
    let derived_message = mod_exp(signature, public_key_e, public_key_n);

    assert(message == derived_message);
}

fn sign(m: u64, d: u64, n: u64) -> u64 {
    mod_exp(m, d, n)
}

#[test]
fn test_main() {
    let p: u64 = 61;
    let q: u64 = 53;

    let n = p * q;
    let e = 65537;
    let d = 2753;

    let message = 42;
    let signature = sign(message, d, n);
    
    main(n, e, message, signature);
}
