# Full Adder SystemVerilog Verification Environment

This project implements a complete constrained-random verification environment for a 1-bit Full Adder using SystemVerilog classes and interfaces.

## Project Structure

- **design.sv**: The RTL implementation of the 1-bit full adder.
- **interface.sv**: SystemVerilog interface to connect the DUT and the testbench components.
- **transaction.sv**: Defines the data object (transaction) used for stimulus and monitoring.
- **generator.sv**: Generates random stimulus transactions and sends them to the driver.
- **driver.sv**: Receives transactions and drives the signals on the interface.
- **monitor.sv**: Observes the interface signals and captures transactions.
- **scoreboard.sv**: Compares the monitored output against the expected golden model.
- **environment.sv**: Orchestrates the generator, driver, monitor, and scoreboard.
- **testbench.sv**: The top-level testbench module that instantiates the DUT and the environment.

## Overview

The environment uses a `mailbox` based communication mechanism between components and employs a layered architecture (Generator -> Driver -> Monitor -> Scoreboard). It is designed to be scalable and follows standard UVM-like principles implemented in pure SystemVerilog.
