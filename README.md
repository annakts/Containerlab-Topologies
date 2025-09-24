# Containerlab-Topologies
Network topologies implemented in Containerlab for academic research and experimentation.

This repository contains a collection of network topologies implemented with [Containerlab](https://containerlab.dev).
It was developed as part of my diploma thesis at NTUA **Study and Evaluation of Containerlab for Network Topology Emulation**.

## 📂 Contents
- `topologies/` → YAML files for different network experiments (RIP, OSPF, BGP, VXLAN, EVPN, ECMP, LINUX BRIDGES, OVS SWITCH)
- `docs/` → diagrams and experimental results

## 🚀 Usage
1. Install [Containerlab](https://containerlab.dev/install/).
2. Deploy a topology:
   ```bash
   sudo containerlab deploy -t topologies/lab_rip.yml
