#!/bin/bash

if command -v apt &> /dev/null
then
    echo "System contains apt"
    sudo apt update
    sudo apt install samba
    if [ $? -eq 0 ]; then
        clear
        echo "Installed Samba and NetBIOS name servers successfully"
        exit
    else
        clear
        echo "ERROR! Couldn't install some dependencies."
        exit
    fi
fi

if command -v pacman &> /dev/null
then
    echo "System contains pacman"
    sudo pacman -Sy
    sudo pacman -S samba
    if [ $? -eq 0 ]; then
        clear
        echo "Installed Samba and NetBIOS name servers successfully"
        exit
    else
        clear
        echo "ERROR! Couldn't install some dependencies."
        exit
    fi
fi

if command -v yum &> /dev/null
then
    echo "System contains yum"
    yum install samba
    if [ $? -eq 0 ]; then
        clear
        echo "Installed Samba and NetBIOS name servers successfully"
        exit
    else
        clear
        echo "ERROR! Couldn't install some dependencies."
        exit
    fi
fi