# Assembly Code Bug: Potential Memory Access Violation

This repository demonstrates a potential memory access violation in a short assembly code snippet. The code calculates a memory address using registers `ebx` and `ecx`, but lacks crucial bounds checking. This can lead to crashes if the calculated address is invalid.

The `bug.asm` file contains the erroneous code, and `bugSolution.asm` provides a corrected version with added checks to prevent memory access violations.

## Bug Description:
The main issue lies in the `mov eax, [ebx + ecx*4 + 0x10]` instruction. This line calculates the memory address by adding `ebx`, `ecx*4`, and `0x10`. Without bounds checking,  `ecx` could exceed safe limits or `ebx` could point to an invalid memory region, causing a segmentation fault or other memory access violations.

## Solution:
The `bugSolution.asm` file includes additional code to perform range checks on `ecx` and `ebx` before accessing memory. It ensures the calculated address is within the valid memory bounds, preventing the potential crash.