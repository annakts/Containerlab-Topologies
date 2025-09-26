#!/bin/sh

clab deploy -t vxlan_dc_ospf.yml --reconfigure

./setup.sh
