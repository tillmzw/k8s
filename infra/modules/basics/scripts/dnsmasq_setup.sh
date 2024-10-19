#!/bin/bash

ip route replace default via 10.0.0.1 dev eth0

apt update && apt install dnsmasq -y

cat << EOF > /etc/dnsmasq.conf
# ref:
# https://github.com/imp/dnsmasq/blob/master/dnsmasq.conf.example

interface=eth1
local=/pve.local/
domain=pve.local

dhcp-range=10.0.1.10,10.0.1.250,12h

dhcp-option=option:router,10.0.1.1

dhcp-boot=undionly.kpxe
dhcp-match=set:ipxe,175 # iPXE sends a 175 option.
dhcp-boot=tag:ipxe,http://matchbox.pve.local:8080/boot.ipxe

log-queries
log-dhcp
log-facility=/var/log/dnsmasq.log
EOF