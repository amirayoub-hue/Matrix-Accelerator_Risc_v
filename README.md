# Matrix Multiplier Accelerator

A simple **N×N Matrix Multiplication Accelerator** in SystemVerilog.  
Because hardware is faster than software (and more fun to write).

## What it does

Computes `C = A × B` where:

```text
C[i][j] = Σ(k) A[i][k] × B[k][j]
```

## Features

-  **Parameterized** – Change matrix size & bit width easily
-  **FSM-controlled** – Clean state machine design
-  **Pipelined** – 1-cycle multiplier latency
-  **Self-checking testbench** – Compares results automatically
-  **VCD waveform** – Debug with GTKWave

## Quick Start

###  Prepare test data

Create `matrix.hex` with 8 hex values:

```
01 02 03 04 05 06 07 08
```
This means:  
`A = [[1,2],[3,4]]`  
`B = [[5,6],[7,8]]`  
`C = [[19,22],[43,50]]`



## File Structure

| File | What it does |
|------|--------------|
| `matrix_pkg.sv` | Parameters (`N`, `DATA_WIDTH`) |
| `registers.sv` | Memory for A, B, and C |
| `multiplier.sv` | 1-cycle multiplier |
| `accumulator.sv` | Sum-of-products |
| `matrix_controller.sv` | The FSM |
| `matrix_top.sv` | Top-level wrapper |

## Customization

Edit `matrix_pkg.sv`:

```systemverilog
parameter int N = 2;              // Matrix size (N×N)
parameter int DATA_WIDTH = 8;     // Bits per element
```
