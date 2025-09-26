#!/bin/bash

docker exec clab-lab_bgp-PC1 ip addr add 192.168.1.2/24 dev eth1
docker exec clab-lab_bgp-PC1 ip link set eth1 up
docker exec clab-lab_bgp-PC1 ip route change 0.0.0.0/0 via 192.168.1.1 dev eth1

docker exec clab-lab_bgp-PC2 ip addr add 192.168.2.2/24 dev eth1
docker exec clab-lab_bgp-PC2 ip link set eth1 up
docker exec clab-lab_bgp-PC2 ip route change 0.0.0.0/0 via 192.168.2.1 dev eth1
