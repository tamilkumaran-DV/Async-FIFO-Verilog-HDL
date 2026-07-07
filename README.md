<div align="center">

# 🚀 Asynchronous FIFO using Verilog HDL

### Reliable Clock Domain Crossing (CDC) Design with Gray Code Synchronization

<p>

<img src="https://img.shields.io/badge/Language-Verilog-blue?style=for-the-badge">
<img src="https://img.shields.io/badge/EDA-ModelSim-success?style=for-the-badge">
<img src="https://img.shields.io/badge/FPGA-Quartus-orange?style=for-the-badge">
<img src="https://img.shields.io/badge/RTL-Verified-brightgreen?style=for-the-badge">
<img src="https://img.shields.io/badge/Simulation-Passed-blueviolet?style=for-the-badge">

</p>

---

<img src="assets/banner.png" width="100%">

### ⭐ High-Speed • Dual Clock • Gray Code • Fully Synthesizable ⭐

</div>

---

# 📖 Overview

Asynchronous FIFO enables **safe and reliable data transfer** between two independent clock domains.

Unlike synchronous FIFOs, the read and write clocks operate independently, making the design suitable for Clock Domain Crossing (CDC) applications.

The design uses **Gray Code Pointer Synchronization** to minimize metastability and ensure accurate **Full** and **Empty** flag generation.

---

# ✨ Key Features

| Feature | Status |
|:------------------------------|:------:|
| Independent Read Clock | ✅ |
| Independent Write Clock | ✅ |
| Gray Code Pointer | ✅ |
| Binary Pointer | ✅ |
| Dual Flip-Flop Synchronizer | ✅ |
| Full Flag Detection | ✅ |
| Empty Flag Detection | ✅ |
| RTL Verified | ✅ |
| Functional Simulation | ✅ |
| Synthesizable Design | ✅ |

---

# ⚙️ Design Flow

```text
Write Clock
     │
     ▼
Binary Counter
     │
     ▼
Gray Encoder
     │
     ▼
2FF Synchronizer
     │
     ▼
FIFO Memory
     │
     ▼
2FF Synchronizer
     │
     ▼
Gray Decoder
     │
     ▼
Binary Counter
     │
     ▼
Read Clock

---

# 📊 Design Specifications

| Parameter | Value |
|-----------|-------|
| Data Width | 8-bit |
| Address Width | 4-bit |
| FIFO Depth | 16 |
| Pointer Width | 5-bit |
| Write Clock | Independent |
| Read Clock | Independent |
| Reset | Asynchronous |

---

# 🧪 Verification

✔ FIFO Write

✔ FIFO Read

✔ Full Flag Detection

✔ Empty Flag Detection

✔ Pointer Synchronization

✔ Data Integrity

✔ Independent Clock Operation

---

# 🚀 Applications

| Application |
|-------------|
| UART |
| SPI |
| AXI Bridge |
| DMA Controller |
| Ethernet MAC |
| FPGA Systems |
| ASIC Designs |
| Clock Domain Crossing |

---

# 📈 Future Enhancements

- Almost Full Flag
- Almost Empty Flag
- Overflow Detection
- Underflow Detection
- UVM Testbench
- SystemVerilog Assertions
- Functional Coverage
- FPGA Hardware Validation

---

# 📜 License

This project is released under the MIT License.

---

<div align="center">

## 👨‍💻 Author

# Tamil Kumaran

### RTL Design • Digital Design • Verilog HDL • VLSI Engineer

⭐ If you like this project, consider giving it a Star!

</div>
innu konjam better ha premimum ha kudu
