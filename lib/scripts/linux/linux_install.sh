# OpenTransmit - Locally access your computer from iOS' Files App. 
#     Copyright (C) 2020 Owais Shaikh
# 
#     This program is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
# 
#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.

#!/bin/bash

if [ -x "$(command -v apt)" ]; then
    echo "System contains apt"
    sudo apt-get update
    sudo apt-get install -y samba samba-common python-glade2 system-config-samba
    if [ $? -eq 0 ]; then
        clear
        echo "Installed Samba and NetBIOS name servers successfully"
        exit
    else
        clear
        echo "ERROR! Couldn't install dependencies via apt."
        exit
    fi
elif [ -x "$(command -v pacman)" ]; then
    echo "System contains pacman"
    sudo pacman -Sy
    sudo pacman -S samba
    if [ $? -eq 0 ]; then
        clear
        echo "Installed Samba and NetBIOS name servers successfully"
        exit
    else
        clear
        echo "ERROR! Couldn't install dependencies via pacman."
        exit
    fi
elif [ -x "$(command -v yum)" ]; then
    echo "System contains yum"
    yum groupinstall RH-Gluster-Samba-Server
    yum groupinstall RH-Gluster-AD-Integration
    yum install samba
    yum install samba-winbind
    yum install samba-winbind-clients
    yum install samba-winbind-krb5-locator
    if [ $? -eq 0 ]; then
        clear
        echo "Installed Samba and NetBIOS name servers successfully"
        exit
    else
        clear
        echo "ERROR! Couldn't install dependencies via yum."
        exit
    fi
fi
