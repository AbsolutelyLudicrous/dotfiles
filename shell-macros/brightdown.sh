#!/bin/bash
#Decrease brightness via command line
echo $(</root/assworld) | sudo -S bash -c '
light -U 10
light -G'
