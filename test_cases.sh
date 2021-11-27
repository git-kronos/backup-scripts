#!/bin/bash


function set_bluetooth()
{
    sudo cp ./config/BCM43142A0-0a5c-21d7.hcd /lib/firmware/brcm/BCM43142A0-0a5c-21d7.hcd
    sudo modprobe -r btusb
    sudo modprobe btusb
}

function gnome_setup()
{
    cp ./config/gtk.css ~/.config/gtk-3.0/
}

function export_all()
{
    mkdir ubuntu
    dpkg --get-selections > ./ubuntu/dpkg_list.txt
    sudo cp -R /etc/apt/sources.list* ./ubuntu/
    sudo apt-key exportall > ./ubuntu/repo.keys
    snap list > ./ubuntu/snap_repo.txt
    apt list > ./ubuntu/apt_repo.txt
}

function import_all()
{
    sudo apt-key add ~/Repo.keys
    sudo cp -R ~/sources.list* /etc/apt/
    sudo apt-get update
    sudo apt-get install dselect
    sudo dselect update
    sudo dpkg --set-selections < ~/Package.list
    sudo apt-get dselect-upgrade -y
}

# sudo add-apt-repository universe -y
# sudo apt install software-properties-common
# sudo add-apt-repository ppa:deadsnakes/ppa -y
# sudo apt install python3.7 python3.8

# rm -r ubuntu
# export_all
# import_all