#!/bin/bash

#check if smb and nmb are already running
sudo systemctl stop smb nmb
#

# get current user
username=$USER
filename=smbtransfer.conf

if ! grep -q "force" "$filename"; then
    echo "Generating samba config with username."
    echo "force user = $username" >> $filename
    echo "valid users = $username" >> $filename
    echo "write list = $username" >> $filename
fi

# move config over
filename_to_replace=/etc/samba/smb.conf
if test -f "$filename_to_replace"; then
    echo "$filename_to_replace exists. Backing up old conf file and replacing in /etc/samba/ directory."
    sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.previous
else
    echo "No config in /etc/samba/. Placing generated config in directory."
fi

sudo cp smbtransfer.conf /etc/samba/
sudo rm /etc/samba/smb.conf
sudo mv /etc/samba/smbtransfer.conf /etc/samba/smb.conf
sudo chmod 644 /etc/samba/smb.conf
ls -a /etc/samba
printf "1234\n1234\n" | sudo smbpasswd -a -s $username

# restart server
sudo systemctl unmask smb nmb
sudo systemctl start smb nmb
sudo systemctl restart smb nmb

# reset conf file
#sudo mv /etc/samba/smb.conf.previous /etc/samba/smb.conf