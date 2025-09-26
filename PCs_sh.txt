#!/bin/sh
sudo docker exec clab-lab1-PC1 ip link set eth1 up
sudo docker exec clab-lab1-PC1 ip addr add 192.168.1.2/24 dev eth1
sudo docker exec clab-lab1-PC1 ip route change 0.0.0.0/0 192.168.1.1 dev eth1
sudo docker exec clab-lab1-PC1 ip route add 192.168.2.2 via 192.168.1.1 dev eth1
sudo docker exec clab-lab1-PC1 ip route add 172.20.20.0/24 via 0.0.0.0 dev eth0
sudo docker exec clab-lab1-PC1 ip route add 172.17.17.0/30 via 192.168.1.1 dev eth1
sudo docker exec clab-lab1-PC1 ip route add 192.168.1.0/24 via 0.0.0.0 dev eth1

sudo docker exec clab-lab1-PC2 ip link set eth1 up
sudo docker exec clab-lab1-PC2 ip addr add 192.168.2.2/24 dev eth1
sudo docker exec clab-lab1-PC2 ip route change 0.0.0.0/0 192.168.2.1 dev eth1
sudo docker exec clab-lab1-PC2 ip route add 192.168.1.2 via 192.168.2.1 dev eth1
sudo docker exec clab-lab1-PC2 ip route add 172.20.20.0/24 via 0.0.0.0 dev eth0
sudo docker exec clab-lab1-PC2 ip route add 172.17.17.0/30 via 192.168.2.1 dev eth1
sudo docker exec clab-lab1-PC2 ip route add 192.168.2.0/24 via 0.0.0.0 dev eth1
