pub fn mod_inverse(e: u64, phi: u64) -> u64 {
    let mut a = phi;
    let mut b = e;
    let mut x0: u64 = 0;
    let mut x1: u64 = 1;
    let max_iterations = 1000; // Arbitrary choice to ensure termination

    for _ in 0..max_iterations {
        if b != 0 {
            let q = a / b;
            let temp = a % b;
            a = b;
            b = temp;

            // Perform modular subtraction manually to avoid underflow
            let temp_x1 = if x0 > q * x1 { x0 - q * x1 } else { phi - ((q * x1 - x0) % phi) };
            x0 = x1;
            x1 = temp_x1;
        }
    }

    if a != 1 {
        0 // Indicate failure (e.g., a and phi are not coprime)
    } else {
        // Adjust x0 to be positive within the modulus' bounds
        (x0 + phi) % phi
    }
}

pub fn mod_exp(mut base: u64, mut exp: u64, modulus: u64) -> u64 {
    let mut result: u64 = 1;
    base %= modulus;

    for _ in 0..64 { // Assuming 64-bit unsigned integers
        if exp > 0 {
            if exp % 2 == 1 {
                result = (result * base) % modulus;
            }
            exp >>= 1;
            base = (base * base) % modulus;
        }
    }
    result
}
