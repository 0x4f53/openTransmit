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

if [ -d "/opt/openTransmit" ]; then # make accessible if installed
    sudo chmod 755 /opt/openTransmit
fi

chmod +x linux_install.sh
chmod +x linux_stop.sh

#check if Samba daemon and NetBIOS daemon are installed

if ! [ -x "$(command -v smbd)" ]; then
    echo "Couldn't find Samba daemon and / or NetBIOS daemon"
    sh linux_install.sh
fi

#get current user
username=$USER

#back up local conf file
filename=smbtransfer.conf

cp $filename "${filename}.backup"

#check if smb and nmb are already running
sudo systemctl stop smb nmb

if ! grep -q "force" "$filename"; then
    echo "Generating samba config with username."
    echo "force user = $username" >> $filename
    echo "valid users = $username" >> $filename
    echo "write list = $username" >> $filename
fi

#backup default config if any
filename_to_replace=/etc/samba/smb.conf
if [ -d "${filename_to_replace}" ]; then
    echo "${filename_to_replace} exists. Backing up old conf file and replacing."
    sudo cp "${filename_to_replace}" "${filename_to_replace}.previous"
else
    echo "No config in /etc/samba/. Placing generated config in directory."
fi

pin=$1

#place file
sudo cp smbtransfer.conf /etc/samba/
sudo mv /etc/samba/smbtransfer.conf /etc/samba/smb.conf
sudo chmod 644 /etc/samba/smb.conf

#put in credentials
printf "${pin}\n${pin}\n" | sudo smbpasswd -a -s $username

#replace local conf file with backup
rm smbtransfer.conf
mv "${filename}.backup" $filename

#restart server
sudo systemctl unmask smb nmb
sudo systemctl start smb nmb
