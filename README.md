# AES_encryption_withVHDL
AES altgorithm on basys 3 cpg236 artix7
I used Vivado as a compiler and at TEMPERATURE I set the value -1

# AES Encryption with VHDL

## Overview

This project implements the **Advanced Encryption Standard (AES)** algorithm using **VHDL**. It is designed for simulation and potential synthesis on FPGA platforms. AES is a symmetric encryption algorithm widely used in secure communication systems.

The implementation includes key expansion, the AES-128 encryption round structure (SubBytes, ShiftRows, MixColumns, AddRoundKey), and modular testing. The VHDL design targets educational use and experimentation with hardware-based cryptographic algorithms.

## Key Features

- Full implementation of AES-128 encryption in VHDL
- Modular architecture: SubBytes, ShiftRows, MixColumns, AddRoundKey, KeyExpansion
- Written for synthesis on FPGAs (e.g., Xilinx or Intel/Altera platforms)
- Ready for simulation with ModelSim or GHDL
- Easy to integrate into larger cryptographic or embedded systems

## Project Structure

```
/AES_encryption_withVHDL
├── rtl/
│   ├── aes_top.vhd           # Top-level AES encryption module
│   ├── subbytes.vhd          # SubBytes transformation
│   ├── shiftrows.vhd         # ShiftRows transformation
│   ├── mixcolumns.vhd        # MixColumns transformation
│   ├── addroundkey.vhd       # AddRoundKey transformation
│   ├── key_expansion.vhd     # Key schedule logic
├── sim/
│   ├── aes_tb.vhd            # AES testbench
│   ├── test_vectors.txt      # Input/output reference data
├── docs/
│   └── AES_specification.pdf # Design notes and reference
└── README.md
```

## How to Simulate

1. **Install a VHDL simulator**, such as:
   - ModelSim (recommended for full-featured debugging)
   - GHDL (open-source alternative)

2. **Compile the sources:**
   ```bash
   vcom rtl/*.vhd
   vcom sim/aes_tb.vhd
   ```

3. **Run the simulation:**
   ```bash
   vsim work.aes_tb
   ```

   Or for GHDL:
   ```bash
   ghdl -a rtl/*.vhd sim/aes_tb.vhd
   ghdl -e aes_tb
   ghdl -r aes_tb --vcd=aes.vcd
   ```

4. **View output:**
   - Use ModelSim waveform viewer
   - Or open `aes.vcd` in GTKWave if using GHDL

## Synthesis

This project is written to be synthesizable on FPGAs. It is recommended to:
- Create a Vivado or Quartus project
- Add the RTL files (`rtl/*.vhd`)
- Set `aes_top` as the top module
- Assign pins and constraints for your board

## Notes

- AES-128 is used (128-bit key, 128-bit block size)
- For simplicity, only encryption is implemented. Decryption can be added as an extension.
- All transformations follow NIST standard FIPS 197

## License

This project is provided for academic and educational purposes. Distribution and reuse allowed with proper attribution.
