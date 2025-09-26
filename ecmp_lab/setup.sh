#!/bin/bash

sudo docker exec -it clab-ecmp_lab-PC1 ip addr add 10.0.1.1/24 dev eth1
sudo docker exec -it clab-ecmp_lab-PC1 ip link set eth1 up
sudo docker exec -it clab-ecmp_lab-PC1 ip route add 10.0.2.0/24 via 10.0.1.254

sudo docker exec -it clab-ecmp_lab-PC2 ip addr add 10.0.2.1/24 dev eth1
sudo docker exec -it clab-ecmp_lab-PC2 ip link set eth1 up
sudo docker exec -it clab-ecmp_lab-PC2 ip route add 10.0.1.0/24 via 10.0.2.254 

sudo docker exec -it clab-ecmp_lab-router1 ip addr add 10.0.1.254/24 dev eth1
sudo docker exec -it clab-ecmp_lab-router1 ip addr add 192.168.1.1/30 dev eth2
sudo docker exec -it clab-ecmp_lab-router1 ip addr add 192.168.2.1/30 dev eth3
sudo docker exec -it clab-ecmp_lab-router1 ip link set eth1 up
sudo docker exec -it clab-ecmp_lab-router1 ip link set eth2 up
sudo docker exec -it clab-ecmp_lab-router1 ip link set eth3 up

sudo docker exec -it clab-ecmp_lab-router1 sysctl -w net.ipv4.ip_forward=1

sudo docker exec -it clab-ecmp_lab-router1 ip route add 10.0.2.0/24 nexthop via 192.168.1.2 dev eth2 nexthop via 192.168.2.2 dev eth3

sudo docker exec -it clab-ecmp_lab-router2 ip addr add 10.0.2.254/24 dev eth1
sudo docker exec -it clab-ecmp_lab-router2 ip addr add 192.168.1.2/30 dev eth2
sudo docker exec -it clab-ecmp_lab-router2 ip addr add 192.168.2.2/30 dev eth3
sudo docker exec -it clab-ecmp_lab-router2 ip link set eth1 up
sudo docker exec -it clab-ecmp_lab-router2 ip link set eth2 up
sudo docker exec -it clab-ecmp_lab-router2 ip link set eth3 up

sudo docker exec -it clab-ecmp_lab-router2 sysctl -w net.ipv4.ip_forward=1

sudo docker exec -it clab-ecmp_lab-router2 ip route add 10.0.1.0/24 nexthop via 192.168.1.1 dev eth2 nexthop via 192.168.2.1 dev eth3

