#!/bin/bash
# Purpose: Displays all the devices currently on the network. Pair with `watch` for constant
# monitoring
# Usage: ./show_network_devices.sh

nmap -sn 192.168.1.0/24 | grep -e 'Nmap scan report for'
