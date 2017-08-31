#!/bin/bash
#Increase brightness via command line
echo $(</root/assworld) | sudo -S bash -c '
light -A 10
light -G'
