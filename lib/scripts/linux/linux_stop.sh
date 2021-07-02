#!/bin/bash

# reset conf file
sudo rm /etc/samba/smb.conf
sudo mv /etc/samba/smb.conf.previous /etc/samba/smb.conf

# stop samba server
sudo systemctl stop smb nmb
