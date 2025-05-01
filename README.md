# CNN Acceleration on FPGA

This repository contains the implementation of a Convolutional Neural Network (CNN) accelerator on FPGA hardware using High-Level Synthesis (HLS) and Register-Transfer Level (RTL) design methodologies.

## 🚀 Project Overview

This project implements a lightweight CNN for image classification using a Xilinx Zynq-7000 FPGA. The network is tailored for hardware acceleration with carefully balanced trade-offs between accuracy and resource utilization. The design successfully classifies images across 101 categories.

### Key Features

- **Custom Lightweight CNN Architecture**: Two convolutional layers followed by max-pooling, global average pooling, and a dense softmax classifier
- **Dual Implementation Approach**: Both HLS-based and manually-crafted Verilog RTL designs
- **Optimized Hardware Modules**:
  - Floating-point arithmetic units
  - Processing Element (PE) and PE_array for matrix operations
  - Asynchronous FIFO for cross-clock domain data transfer
  - ROM-based weight storage

## 📊 Performance Results

- **Model Accuracy**: 97.3% validation accuracy
- **Hardware Utilization**:
  - BRAM: 1060 (378% of available resources)
  - DSP: 557 (253% of available resources)
  - FF: 117,853 (110% of available resources)
  - LUT: 130,078 (244% of available resources)
- **Latency**: 1.994 ms total execution time

## 🔧 Implementation Details

### CNN Architecture
- **Input Layer**: 32×32 RGB images (reduced from original 224×224)
- **Conv Layer 1**: 32 filters, 3×3 kernel, ReLU activation, followed by 2×2 max-pooling
- **Conv Layer 2**: 64 filters, 3×3 kernel, ReLU activation, followed by 2×2 max-pooling
- **Global Average Pooling**: Reduces spatial dimensions without fully connected layers
- **Output Layer**: Dense softmax classifier with 101 classes

### Hardware Modules

#### Custom Verilog RTL Components:
- **ROM IP**: Efficient storage of CNN weights and biases
- **Floating Point Unit (FPU)**: IEEE-754 compliant operations
- **Processing Element (PE)**: Basic computational unit with multiply-accumulate capability
- **PE_array**: 3×3 grid of PEs for parallel matrix computations
- **Asynchronous FIFO**: Cross-clock domain data transfer

#### HLS-based Implementation:
- **Data Flow Optimization**: Pipeline and parallel execution
- **Memory Partitioning**: Cyclic and complete array partitioning for improved memory access
- **Resource Optimization**: Balance between performance and hardware utilization

## 🔍 Challenges and Solutions

### Synthesis Challenges
- **Initial Complexity Barriers**: Full network couldn't be synthesized due to excessive resource demands
- **Resolution**: Scaled down network complexity and input dimensions (32×32) to achieve successful synthesis
- **Parallel Development**: Concurrent RTL and HLS approaches to mitigate implementation risks

### Performance Optimization
- Implemented loop unrolling and pipelining techniques
- Applied array partitioning to optimize on-chip memory usage
- Designed efficient dataflow architecture

## 📁 Repository Structure

- **`/RTL`**: Verilog RTL source files for custom modules
- **`/HLS`**: C/C++ source for High-Level Synthesis
- **`/Model`**: CNN model training and validation Python code
- **`/Reports`**: Synthesis and implementation reports
- **`/Documentation`**: Project documentation and theory

## 🧪 Testing and Validation

- Functional simulation using testbenches for each module
- C/C++ simulation for algorithm verification
- Hardware co-simulation validating actual FPGA performance
- Comprehensive validation with image test datasets

## 🛠️ Development Tools

- **Vivado HLS**: Version 2024.2 for high-level synthesis
- **Vivado Design Suite**: For RTL design and implementation
- **Python/Keras**: For CNN model development and training
- **Vitis Unified Software Platform**: For software integration





