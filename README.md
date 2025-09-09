# Concept Drift Detection on Tofino Switches

This project implements a concept drift detection mechanism directly on Intel Tofino programmable switches using P4 and the Barefoot Runtime Interface (BfRt). It leverages the high-speed packet processing capabilities of Tofino ASICs to identify changes in network traffic patterns in real-time, which can be crucial for network security, anomaly detection, and performance optimization.

## Technologies Used

*   **P4 (Programming Protocol-independent Packet Processors):** A domain-specific language for programming network data planes. This project uses P4 to define the packet parsing, matching, and action logic for concept drift detection.
*   **Intel Tofino:** A series of programmable Ethernet switch ASICs that allow for highly flexible and high-performance data plane programming using P4.
*   **Barefoot SDE (Software Development Environment):** The software suite provided by Intel (formerly Barefoot Networks) for developing, compiling, and deploying P4 programs on Tofino switches. This includes the P4 compiler, `bf_switchd` daemon, and BfRt API.
*   **BfRt (Barefoot Runtime Interface):** A programmatic interface (API) that allows control plane applications to interact with the Tofino data plane. It is used in this project to configure tables, meters, and other P4 constructs, including recirculation ports.
*   **Python:** Used for control plane applications that interact with the BfRt API to manage the P4 program running on the Tofino switch.

## Project Structure

The project is organized into the following main directories:

*   `p4src/`: Contains the core P4 source code for the concept drift detection logic.
    *   `main.p4`: The main P4 program file that orchestrates the packet processing pipeline.
    *   `include/`: Contains P4 include files defining headers, metadata, and control blocks.
        *   `headers.p4`: Defines custom and standard packet headers used in the P4 program.
        *   `metadata.p4`: Defines custom metadata structures used to carry state and information between different stages of the P4 pipeline.
        *   `cst.p4`: Likely contains constants or common structures.
        *   `ewma_stages.p4`: Suggests the use of Exponentially Weighted Moving Average (EWMA) for drift detection, implemented in P4.
        *   `ig_control.p4`: Defines the ingress control logic.
        *   `eg_control.p4`: Defines the egress control logic.
        *   `parser_hdr.p4`: Defines parser headers.
    *   `ports.py`: A Python script that uses the BfRt API to configure switch ports, including recirculation ports.
*   `rules/`: Contains Python scripts for configuring rules and tables on the switch via BfRt.
    *   `rules.py`, `rules2.py`, `rules3.py`: Likely contain different sets of rules or configurations for various scenarios.
*   `parse_tree/`: May contain scripts or definitions related to parsing or tree-like data structures for analysis.
    *   `parse_if.py`, `parse_mcc.py`: Potentially related to parsing specific packet fields or implementing multi-commodity flow logic.
*   `tools/`: Contains utility scripts and tools for interacting with the project.
    *   `pubsub_.py`, `send.py`, `recv.py`: Suggests a publish-subscribe mechanism for sending/receiving data or control messages.
    *   `dashboard.html`: Potentially a web-based dashboard for visualizing drift detection results or switch status.

## Core Concepts

### Concept Drift Detection

Concept drift refers to the phenomenon where the statistical properties of the target variable (which the model is trying to predict) change over time in unforeseen ways. In network monitoring, this could mean changes in traffic patterns, flow characteristics, or attack signatures. This project aims to detect such drifts directly in the data plane, enabling rapid response.

### P4 Programming on Tofino

The P4 program (`main.p4` and its includes) defines how packets are processed by the Tofino switch. It specifies:

*   **Parsers:** How to extract fields from incoming packets.
*   **Tables:** Data structures for matching packet fields against rules and performing actions.
*   **Actions:** Operations to be performed on packets (e.g., modifying headers, dropping packets, sending to CPU, recirculating).
*   **Controls:** The sequence of operations (tables and actions) applied to packets.


## Work in Progress & Contributions

This project is currently under active development. We welcome contributions from the community to improve its functionality, add new features, or enhance documentation. If you are interested in contributing, please feel free to open issues or submit pull requests.

Your feedback and contributions are highly valued as we continue to refine and expand this project.

