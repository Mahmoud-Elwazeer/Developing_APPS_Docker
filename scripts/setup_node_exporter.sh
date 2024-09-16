#!/bin/bash

sudo apt update -y

wget \
  https://github.com/prometheus/node_exporter/releases/download/v1.8.2/node_exporter-1.8.2.linux-amd64.tar.gz

sudo groupadd -f node_exporter
sudo useradd -g node_exporter --no-create-home --shell /bin/false node_exporter
sudo mkdir /etc/node_exporter
sudo chown node_exporter:node_exporter /etc/node_exporter


tar vxf node_exporter*.tar.gz
cd node_exporter*/

sudo mv node_exporter /usr/local/bin
sudo chmod +x /usr/local/bin/node_exporter
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter

echo '[Unit]
    Description=Node Exporter
    Documentation=https://prometheus.io/docs/guides/node-exporter/
    Wants=network-online.target
    After=network-online.target

    [Service]
    User=node_exporter
    Group=node_exporter
    Type=simple
    Restart=on-failure
    ExecStart=/usr/local/bin/node_exporter

    [Install]
    WantedBy=multi-user.target' | sudo tee /etc/systemd/system/node_exporter.service

sudo systemctl daemon-reload
sudo systemctl start node_exporter
sudo systemctl enable node_exporter
