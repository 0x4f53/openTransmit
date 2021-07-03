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

# reset conf file

previous_file=/etc/samba/smb.conf.previous

if test -f "$previous_file"; then
    sudo rm /etc/samba/smb.conf
    sudo mv /etc/samba/smb.conf.previous /etc/samba/smb.conf
fi

# stop samba server
sudo systemctl stop smb nmb
