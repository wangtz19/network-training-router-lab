#!/bin/bash

set -exo pipefail
# If docker is not started, start it.
if ! docker info > /dev/null 2>&1; then
    sudo service docker start
fi

# You need to tune the iptable rules of WSL2 to enable the datapath packet forwarding.
sudo iptables -P INPUT ACCEPT
sudo ip6tables -P INPUT ACCEPT
