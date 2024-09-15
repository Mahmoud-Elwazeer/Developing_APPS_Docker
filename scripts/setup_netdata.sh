#!/bin/bash

sudo apt update -y
sudo apt install netdata -y
# change ip in /etc/netdata/netdata.conf
# 127.0.0.1 -> 0.0.0.0

# https://wiki.crowncloud.net/?how_to_Install_netdata_monitoring_tool_ubuntu_22_04

sudo ufw allow 19999