Optimized 33-bit RSA Implementation
Overview

This project is an RSA encryption and decryption code written using a 33-bit key designed for the ARM64 / AArch64 Cortex-A57 architecture.

The optimization here focuses on the Montgomery Modular Multiplication (MMM) algorithm which plays an essential role in RSA modular exponentiation.

The optimized code eliminates any data dependent control flow and instead uses bit-masking, shifting, addition, and subtraction.

Main Features
33-bit RSA modulus
64-bit unsigned integer storage
4-byte plaintext chunking
RSA encryption and decryption
Montgomery modular exponentiation
Optimized Montgomery multiplication
Branchless data-dependent selections using bit masks
Fixed-count Montgomery loop
ARM64 assembly inspection
Correctness testing using encryption/decryption round trips
RSA Parameters
P = 80021
Q = 90001
N = 7201970021
E = 65537
D = 5940273473

The public key is:

(N, E)

The private key is:

(N, D)
Important Functions
pack_chunk()

Converts up to 4 plaintext bytes into a single integer that can be processed by RSA.

unpack_chunk()

Converts a decrypted plaintext integer back into its original bytes.

mod_exp_montgomery()

Performs RSA modular exponentiation using Montgomery multiplication.

Encryption:

C = T^E mod N

Decryption:

T = C^D mod N
MMM()

Performs Montgomery modular multiplication and is the main optimized computational kernel.

In the optimized code, data dependent conditions are replaced with bit-mask operations.

For instance:

Y & (0 - Xi)

chooses Y or 0 depending on whether Xi is true or false without making use of any data dependent condition.

Compilation

Compiling using GCC with -O2 flag:

gcc -O2 rsa_33bit_opt.c -o rsa_opt

To get ARM64 assembly:

gcc -O2 -S rsa_33bit_opt.c -o rsa_33bit_opt.s

For profiling using gprof:

gcc -O2 -pg -fno-inline rsa_33bit_opt.c -o rsa_opt
./rsa_opt
gprof rsa_opt gmon.out
Running the Program

Executing the code using:

./rsa_opt

Encryption and decryption of plaintext will be done and the message will be verified.

Correct execution fulfills the criterion:

decrypt(encrypt(message)) = message
Target Environment
Architecture: ARM64 / AArch64
Processor: ARM Cortex-A57
Emulator: QEMU
Operating System: Debian GNU/Linux 13
Compiler: GCC
Optimization Summary

Profiling identified Montgomery multiplication as the primary performance bottleneck.

The optimized version focuses on:

Data-dependent branch removal
Reusing conditionally multiplied operations with bit masks
Omitting division in the Montgomery reduction process
Using registers to hold intermediate values
Minimizing the number of ARM64 instructions produced
Correct RSA encryption and decryption

The -O2 compiler optimization level was selected because it produced an efficient Montgomery kernel without requiring more aggressive compiler optimization.

Correctness

Correctness is verified by testing that each encrypted message can be successfully decrypted back to the original plaintext.

Several message lengths are tested, including:

A
ABCD
ABCDE
HELLO
Hello world

These tests cover single-byte inputs, exact 4-byte chunks, multi-chunk messages, and longer strings.
