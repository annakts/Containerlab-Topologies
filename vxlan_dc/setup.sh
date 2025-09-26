#!/bin/bash

sudo docker exec -it clab-vxlan_dc-PC1 ip addr add 192.168.1.1/24 dev eth1
sudo docker exec -it clab-vxlan_dc-PC1 ip route change default via 192.168.1.100 dev eth1

sudo docker exec -it clab-vxlan_dc-PC2 ip addr add 192.168.1.2/24 dev eth1
sudo docker exec -it clab-vxlan_dc-PC2 ip route change default via 192.168.1.100 dev eth1

sudo docker exec -it clab-vxlan_dc-PC3 ip addr add 192.168.2.1/24 dev eth1
sudo docker exec -it clab-vxlan_dc-PC3 ip route change default via 192.168.2.100 dev eth1

sudo docker exec -it clab-vxlan_dc-PC4 ip addr add 192.168.2.2/24 dev eth1
sudo docker exec -it clab-vxlan_dc-PC4 ip route change default via 192.168.2.100 dev eth1

sudo docker exec -it clab-vxlan_dc-leaf1 ip link add vxlan100 type vxlan id 100 dstport 4789 local 172.22.22.3 nolearning ttl 5
sudo docker exec -it clab-vxlan_dc-leaf1 brctl addbr br100
sudo docker exec -it clab-vxlan_dc-leaf1 brctl addif br100 vxlan100
sudo docker exec -it clab-vxlan_dc-leaf1 brctl stp br100 off
sudo docker exec -it clab-vxlan_dc-leaf1 ip link set up dev br100
sudo docker exec -it clab-vxlan_dc-leaf1 ip link set up dev vxlan100
sudo docker exec -it clab-vxlan_dc-leaf1 brctl addif br100 eth3
sudo docker exec -it clab-vxlan_dc-leaf1 ip addr add 192.168.1.100/24 dev br100

sudo docker exec -it clab-vxlan_dc-leaf2 ip link add vxlan100 type vxlan id 100 dstport 4789 local 172.22.22.4 nolearning ttl 5
sudo docker exec -it clab-vxlan_dc-leaf2 brctl addbr br100
sudo docker exec -it clab-vxlan_dc-leaf2 brctl addif br100 vxlan100
sudo docker exec -it clab-vxlan_dc-leaf2 brctl stp br100 off
sudo docker exec -it clab-vxlan_dc-leaf2 ip link set up dev br100
sudo docker exec -it clab-vxlan_dc-leaf2 ip link set up dev vxlan100
sudo docker exec -it clab-vxlan_dc-leaf2 brctl addif br100 eth3
sudo docker exec -it clab-vxlan_dc-leaf2 ip link add vxlan200 type vxlan id 200 dstport 4789 local 172.22.22.4 nolearning ttl 5
sudo docker exec -it clab-vxlan_dc-leaf2 brctl addbr br200
sudo docker exec -it clab-vxlan_dc-leaf2 brctl addif br200 vxlan200
sudo docker exec -it clab-vxlan_dc-leaf2 brctl stp br200 off
sudo docker exec -it clab-vxlan_dc-leaf2 ip link set up dev br200
sudo docker exec -it clab-vxlan_dc-leaf2 ip link set up dev vxlan200
sudo docker exec -it clab-vxlan_dc-leaf2 brctl addif br200 eth4


sudo docker exec -it clab-vxlan_dc-leaf3 ip link add vxlan200 type vxlan id 200 dstport 4789 local 172.22.22.5 nolearning ttl 5
sudo docker exec -it clab-vxlan_dc-leaf3 brctl addbr br200
sudo docker exec -it clab-vxlan_dc-leaf3 brctl addif br200 vxlan200
sudo docker exec -it clab-vxlan_dc-leaf3 brctl stp br200 off
sudo docker exec -it clab-vxlan_dc-leaf3 ip link set up dev br200
sudo docker exec -it clab-vxlan_dc-leaf3 ip link set up dev vxlan200
sudo docker exec -it clab-vxlan_dc-leaf3 brctl addif br200 eth3
sudo docker exec -it clab-vxlan_dc-leaf3 ip addr add 192.168.2.100/24 dev br200
