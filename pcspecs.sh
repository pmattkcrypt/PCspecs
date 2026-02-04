#!/bin/bash
# filename:pcspecs.sh
# written by: pmattkcrypt (Makrovasilis Athanasios)
# date:1.2026
# O/S:ubuntu LTS
clear
echo "The Shell Script gives basic computer's specifications"
echo "******************************************************"
name=$(hostname | awk '{print $1}')
echo "C O M P U T E R  N A M E" > PCspecs_$name
hostname >> PCspecs_$name
echo "      " >> PCspecs_$name
echo "R A M " >> PCspecs_$name
free -m | grep Mem | awk '{print $1,$2}' >> PCspecs_$name
echo "      " >> PCspecs_$name
echo "C P U " >> PCspecs_$name
lscpu | grep Model | awk '{print $1,$2,$3,$4,$5,$6,$7}'  >> PCspecs_$name
echo "      " >> PCspecs_$name
echo "M O T H E R B O A R D" >> PCspecs_$name
sudo dmidecode -t 1 | grep Manufacturer >> PCspecs_$name
sudo dmidecode -t 1 | grep Product >> PCspecs_$name
echo "      " >> PCspecs_$name
echo "V G A " >> PCspecs_$name
lspci | grep -i vga >> PCspecs_$name
echo "      " >> PCspecs_$name
echo "H D D " >> PCspecs_$name
#gives the model and the serial number of 2 disks/devices on the system. Change the value of the tail command (tail -2) for more disks/devices (example tail -4) 
lsblk -d -o model,serial | tail -2 >> PCspecs_$name
echo "      " >> PCspecs_$name
echo "O / S " >> PCspecs_$name
lsb_release -a | tail -3 >> PCspecs_$name
echo "           " >> PCspecs_$name
echo "K E R N E L" >> PCspecs_$name
uname -r >> PCspecs_$name
echo "    " >> PCspecs_$name
echo "d a t e" >> PCspecs_$name
date "+%d-%m-%Y.%H:%M:%S" >> PCspecs_$name
cat PCspecs_$name
echo
echo "*********Written by pmattkcrypt*************************"
