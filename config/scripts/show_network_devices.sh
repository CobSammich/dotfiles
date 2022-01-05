#!/bin/bash
# Purpose: Displays all the devices currently on the network. Pair with `watch` for constant
# monitoring
# Usage: ./show_network_devices.sh

# store nmap output in /tmp/devices
nmap -sn 192.168.1.0/24 | grep -e 'Nmap scan report for' > /tmp/devices
# read the file contents and count number of lines=number of devices
cat /tmp/devices
echo $(wc -l < /tmp/devices) "Devices found"

