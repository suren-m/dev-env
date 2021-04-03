#!/bin/bash

# Meant to be run just once right after creating a brand new Debian WSL2 install
# Last tested on buster

# Pre-requisites
sudo apt update -y && sudo apt upgrade -y
# python-apt needed for ansible --check
sudo apt install -y openssh-client curl git wget python python-apt python3 python3-pip ansible 

backup_dir="$HOME/.config/backup";
# backup existing .bashrc
mkdir -p $backup_dir;
cp ~/.bashrc $backup_dir/.bashrc.orig

# backup /etc/profile
cp /etc/profile $backup_dir/profile.orig
# copy profile into /etc/profile (fix code not found issue due to path)
sudo cp ./patched/profile /etc/profile

# backup /etc/sudoers
sudo cp /etc/sudoers $backup_dir/sudoers.orig
# update sudoers file. (or use visudo) (-r--r-----)
sudo cp ./patched/sudoers /etc/sudoers

echo 'Installed pre-requisites'
echo '........................'
echo "NOTE: make sure to install Rust using \"curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh\""
echo '........................'
echo 'done'
