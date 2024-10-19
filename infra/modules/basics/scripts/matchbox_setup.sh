#!/bin/bash

ip route replace default via 10.0.0.1 dev eth0

declare -r MATCHBOX_VERSION="v0.11.0"
declare -r ARCH=linux-amd64

wget -O - https://github.com/poseidon/matchbox/releases/download/$MATCHBOX_VERSION/matchbox-$MATCHBOX_VERSION-$ARCH.tar.gz | gunzip | tar x

test -d matchbox-$MATCHBOX_VERSION-$ARCH || exit 1

(
    cd  matchbox-$MATCHBOX_VERSION-$ARCH
    cp matchbox /usr/local/bin
    
    useradd -U matchbox
    mkdir -p /var/lib/matchbox/assets
    chown -R matchbox:matchbox /var/lib/matchbox
    chown -R matchbox:matchbox /etc/matchbox

    cp contrib/systemd/matchbox.service /etc/systemd/system/matchbox.service

    mkdir -p /etc/systemd/system/matchbox.service.d
    cat << EOF > /etc/systemd/system/matchbox.service.d/override.conf
[Service]
Environment="MATCHBOX_ADDRESS=0.0.0.0:8080"
Environment="MATCHBOX_RPC_ADDRESS=0.0.0.0:8081"
Environment="MATCHBOX_LOG_LEVEL=DEBUG"
EOF

    systemctl daemon-reload
    systemctl start matchbox
    systemctl enable matchbox
)