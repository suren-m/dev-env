#!/bin/bash

# Meant to be run just once right after creating a brand new Debian WSL2 install
# Last tested on buster

# Pre-requisites
sudo apt update -y && sudo apt upgrade -y
# python-apt needed for ansible --check
sudo apt install -y curl git python python-apt python3 python3-pip ansible 

# backup existing .bashrc
mkdir -p ~/backup;
cp ~/.bashrc ~/backup/.bashrc.orig

# backup /etc/profile
cp /etc/profile ~/backup/profile.orig
# copy profile into /etc/profile (fix code not found issue due to path)
sudo cp ./patched/profile /etc/profile

# backup /etc/sudoers
sudo cp /etc/sudoers ~/backup/sudoers.orig
# update sudoers file. (or use visudo) (-r--r-----)
sudo cp ./patched/sudoers /etc/sudoers

echo "done"