# UART-transmitter-and-receiver-
UART Transmitter and Receiver – Verilog

Description

A Verilog-based UART (Universal Asynchronous Receiver/Transmitter) design that transmits and receives serial data asynchronously using a configurable baud rate.

Features

- UART transmitter
- UART receiver
- 8-bit data transmission
- Start and stop bit handling
- Serial TX and RX communication
- Verilog testbench for simulation

Files

- "uart_tx.v" – UART transmitter module
- "uart_rx.v" – UART receiver module
- "uart_tb.v" – Testbench for simulation

UART Frame

Each transmitted byte consists of:

- 1 Start bit
- 8 Data bits
- 1 Stop bit

Simulation

The testbench provides input data to the transmitter and verifies the serial data reception through the UART receiver.

Tools

- Verilog HDL
- Icarus Verilog / ModelSim / Vivado
- GTKWave (optional)

Applications

UART communication is commonly used in microcontrollers, embedded systems, FPGA designs, and serial communication interfaces.
author: Harshitha 
