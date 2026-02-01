#!/bin/bash
# filename:pcspecs.sh
# written by: pmattkcrypt (Makrovasilis Athanasios)
# date:1.2026
# O/S:ubuntu
clear
echo "The Shell Script gives basic computer's specifications"
echo "*******************************************************"
name=$(users | awk '{print $1}')
echo "C O M P U T E R  N A M E" > PCspecs_$name
users | awk '{print $1}' >> PCspecs_$name
echo "      " >> PCspecs_$name
echo "R A M " >> PCspecs_$name
free | grep Mem | awk '{print $1,$2}' >> PCspecs_$name
echo "      " >> PCspecs_$name
echo "C P U " >> PCspecs_$name
lscpu > 0.txt; sed '8!d' 0.txt  >> PCspecs_$name; rm 0.txt
echo "      " >> PCspecs_$name
echo "M O T H E R B O A R D" >> PCspecs_$name
sudo dmidecode -t 1 > 0.txt; sed '10!d' 0.txt >> PCspecs_$name; rm 0.txt
sudo dmidecode -t 1 > 0.txt; sed '13!d' 0.txt >> PCspecs_$name; rm 0.txt
echo "      " >> PCspecs_$name
echo "H D D " >> PCspecs_$name
sudo hdparm -i /dev/sda > 0.txt; sed '4!d' 0.txt | awk '{print $1,$3}' >> PCspecs_$name; rm 0.txt
sudo hdparm -i /dev/sdb > 0.txt; sed '4!d' 0.txt | awk '{print $1,$3}' >> PCspecs_$name; rm 0.txt
echo "      " >> PCspecs_$name
echo "O / S " >> PCspecs_$name
lsb_release -a >> PCspecs_$name
echo "           " >> PCspecs_$name
echo "K E R N E L" >> PCspecs_$name
uname -r >> PCspecs_$name
echo "    " >> PCspecs_$name
echo "d a t e" >> PCspecs_$name
date "+%d-%m-%Y.%H:%M:%S" >> PCspecs_$name
cat PCspecs_$name
echo
echo "*********Written by pmattkcrypt*************************"
