🚀 Asynchronous FIFO using Verilog HDL
<p align="center">
<img src="https://readme-typing-svg.demolab.com?font=Poppins&weight=700&size=28&pause=1000&color=00E5FF&center=true&vCenter=true&width=900&lines=Asynchronous+FIFO;Clock+Domain+Crossing+(CDC);Gray+Code+Pointer+Synchronization;RTL+Verified;Simulation+Passed"/>
</p>
<p align="center">
<img src="https://img.shields.io/badge/Language-Verilog-blue?style=for-the-badge">
<img src="https://img.shields.io/badge/EDA-ModelSim-success?style=for-the-badge">
<img src="https://img.shields.io/badge/Quartus-Prime-orange?style=for-the-badge">
<img src="https://img.shields.io/badge/RTL-Verified-brightgreen?style=for-the-badge">
<img src="https://img.shields.io/badge/Simulation-Passed-blueviolet?style=for-the-badge">
</p>
---
📖 Overview
This project implements an Asynchronous FIFO in Verilog HDL for reliable data transfer between two independent clock domains using Gray Code Pointer Synchronization.
✨ Features
Independent Read & Write Clock
Gray Code Pointer Synchronization
Dual Flip-Flop Synchronizer
Full / Empty Flag Detection
Parameterized FIFO
RTL Verified
Simulation Verified
Synthesizable Design
📂 Project Structure
```text
Async-FIFO-Verilog-HDL
├── RTL/
│   └── async_fifo.v
├── Testbench/
│   └── async_fifo_tb.v
├── assets/
│   ├── banner.png
│   ├── architecture.png
│   ├── async_fifo_wave.png
│   └── rtl_viewer.png
├── RTL-Viewer/
│   └── async_fifo_rtll.pdf
├── README.md
└── LICENSE
```
🏗 Architecture
<p align="center">
<img src="assets/architecture.png" width="85%">
</p>
⚙️ Design Flow
```text
Write Clock
    │
Binary Pointer
    │
Gray Encoder
    │
2-FF Synchronizer
    │
FIFO Memory
    │
2-FF Synchronizer
    │
Gray Decoder
    │
Read Pointer
```
📸 Simulation
<p align="center">
<img src="assets/async_fifo_wave.png" width="100%">
</p>
🖥 RTL Viewer
<p align="center">
<img src="assets/rtl_viewer.png" width="90%">
</p>
📊 Specifications
Parameter	Value
Data Width	8-bit
Address Width	4
FIFO Depth	16
Pointer Width	5
Reset	Asynchronous
🧪 Verification
✅ FIFO Write
✅ FIFO Read
✅ Full Flag
✅ Empty Flag
✅ Clock Domain Crossing
✅ Data Integrity
🚀 Applications
UART
SPI
DMA
AXI Bridge
FPGA Systems
ASIC Designs
🛣 Roadmap
[x] RTL Design
[x] Functional Simulation
[ ] FPGA Implementation
[ ] UVM Verification
[ ] SVA
---
<div align="center">
👨‍💻 Author
Tamil Kumaran
RTL Design • Design Verification • Verilog HDL • FPGA
⭐ If you found this project useful, please give it a Star.
</div>
