#!/bin/bash

sudo docker exec -it clab-lab2_rip-PC1 ip addr add 192.168.1.2/24 dev eth1
sudo docker exec -it clab-lab2_rip-PC1 ip link set eth1 up
sudo docker exec -it clab-lab2_rip-PC1 ip route change default via 192.168.1.1 dev eth1

sudo docker exec -it clab-lab2_rip-PC2 ip addr add 192.168.2.2/24 dev eth1
sudo docker exec -it clab-lab2_rip-PC2 ip link set eth1 up
sudo docker exec -it clab-lab2_rip-PC2 ip route change default via 192.168.2.1 dev eth1
