# 01-Hash-Preimage

## Overview

This ZK (Zero-Knowledge) circuit example demonstrates the verification process for the correct preimage of a given hash using Noir, a domain-specific language for writing privacy-preserving applications. The circuit showcases two fundamental cryptographic hash functions: SHA-256 and Pedersen hash. It validates that a user possesses the preimage (`preimage` and `preimage2`) corresponding to a given hash (`hash` and `hash2`) without revealing the preimage itself.

## Cryptographic Hash Functions

**SHA-256:** A cryptographic hash function that generates a 256-bit (32-byte) hash value, widely used for data integrity verification.

**Pedersen Hash:** A cryptographic hash function that provides collision resistance and is commonly used in ZK proofs for its efficient commitment properties.

## Prerequisites
**Noir Programming Environment:** Ensure you have the Noir programming language environment set up. Visit the Noir official documentation for installation instructions.
**Aztec Protocol's Standard Library:** This example uses the `std` library from Aztec Protocol for cryptographic operations.

## Circuit Description

The circuit contains two main sections:

### SHA-256 Hash Verification

**Inputs:** `preimage` (a 3-byte array) and `hash` (a 32-byte array).
**Operation:** Computes the SHA-256 hash of `preimage` and verifies it against `hash`.

### Pedersen Hash Verification

**Inputs:** `preimage2` (an array of 3 Field elements) and `hash2` (a Field element).
**Operation:** Computes the Pedersen hash of `preimage2` and verifies it against `hash2`.