#!/usr/bin/env sh
#provide OSX-style file opening
nautilus $1 & disown
echo #newline needed
