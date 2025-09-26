sudo docker exec clab-lab_ovs-pc3 ip addr add 192.168.1.1/24 dev eth1
sudo docker exec clab-lab_ovs-pc4 ip addr add 192.168.1.2/24 dev eth1
sudo docker exec clab-lab_ovs-pc3 ip link set eth1 up
sudo docker exec clab-lab_ovs-pc4 ip link set eth1 up
