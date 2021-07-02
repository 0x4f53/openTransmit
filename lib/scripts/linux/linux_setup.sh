#!/bin/bash

chmod +x linux_install.sh
chmod +x linux_stop.sh

# check if Samba daemon and NetBIOS daemon are installed
if ! command -v smbd !&> /dev/null
then
    echo "Couldn't find Samba daemon and / or NetBIOS daemon"
    chmod +x linux_install.sh
    ./linux_install
fi

# get current user
username=$USER

# back up local conf file
filename=smbtransfer.conf

cp $filename "${filename}.backup"

#check if smb and nmb are already running
sudo systemctl stop smb nmb
#

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

pin=$1

sudo cp smbtransfer.conf /etc/samba/
sudo rm /etc/samba/smb.conf
sudo mv /etc/samba/smbtransfer.conf /etc/samba/smb.conf
sudo chmod 644 /etc/samba/smb.conf
printf "${pin}\n${pin}\n" | sudo smbpasswd -a -s $username

#replace local conf file with backup
rm smbtransfer.conf
mv "${filename}.backup" $filename



# restart server
sudo systemctl unmask smb nmb
sudo systemctl start smb nmb
sudo systemctl restart smb nmb
