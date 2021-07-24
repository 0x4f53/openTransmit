#!/usr/bin/env python3
long_license = """
 openTransmit - Locally access your computer from iOS' Files App. 
    Copyright (C) 2020 Owais Shaikh

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
    GNU General Public License for more details.
"""

short_license = """openTransmit  Copyright (C) 2020 Owais Shaikh\n
This program comes with ABSOLUTELY NO WARRANTY.
This is free software, and you are welcome to redistribute it
under certain conditions; See the GNU General Public License for more details."""

class colors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'


def initialize():
    try:
        import os, subprocess
        from socket import socket
        import pyqrcode
        from sys import platform
        import random
    except:
        import os, subprocess
        install_pydeps_command = "pip install -r requirements.txt"
        install_sysdeps_command = "cd lib/ && chmod +x linux_install.sh &&  sh linux_install.sh"
        install_deps_prompt = input ("Couldn't find some dependencies. Try to install them? (Y/n) ")
        if "y" in install_deps_prompt.lower():
            os.system(install_pydeps_command)
            os.system(install_sysdeps_command)
            _ = subprocess.call('clear' if os.name =='posix' else 'cls')
            print("Done. Re-run OpenTransmit to continue!")
            exit()
        else:
            _ = subprocess.call('clear' if os.name =='posix' else 'cls')
            print("Exiting...")
            exit()

def localIP():
    import socket
    hostname = socket.gethostname()
    local_ip = socket.gethostbyname(hostname)
    return local_ip

def configureSMBServer():
    if platform == "linux" or platform == "linux2": # linux
        pass
    elif platform == "darwin": # macOS
        pass
    elif platform == "win32": # Windows...
        pass


def startSMBServer():
    import os, subprocess
    if os.name =='posix': #Linux / macOS
        pass
    else: #Windows
        pass

def startSplash():
    _ = subprocess.call('clear' if os.name =='posix' else 'cls')
    print("\n------------------------------------------------")
    print  ("|            o p e n T r a n s m i t           |")
    print  ("|  https://github.com/4f77616973/openTransmit  |")
    print  ("------------------------------------------------\n")

def printLicense():
    print (short_license)
    import time
    time.sleep(2)
    _ = subprocess.call('clear' if os.name =='posix' else 'cls')

def printQRCode(url):
    import pyqrcode
    qrcode = pyqrcode.create(url)
    print(qrcode.terminal(module_color=232, background=15, quiet_zone=1))

def generateURL():
    import os
    username = None
    if os.environ.get('USERNAME') == None:
        username = str (os.environ.get('USER'))
    else:
        username = str (os.environ.get('USERNAME'))

    url = "smb://" + username + "@" + str(localIP())
    return url

if __name__ == "__main__":
    from sys import platform
    import random
    if platform == "darwin" or platform == "win32": # Windows or macOS
        print ("openTransmit doesn't support Windows and macOS.")
        exit()

    import os, subprocess, sys
    password = ''
    if len(sys.argv) > 1:
        password = sys.argv[1]
    else:
        password = str(random.randint(1000, 9999))

    initialize()
    startSplash()
    printLicense()
    startSplash()
    print("Make sure your computer and iPhone are on the same network\n(WiFi, portable hotspot or USB tethering)\n")
    input("Press ENTER to continue")

    start_command = "cd lib/ && chmod +x linux_setup.sh && ./linux_setup.sh " + password
    os.system(start_command)

    print("Scan the QR code below in your camera app")
    printQRCode(generateURL())
    print(colors.WARNING + "Password: " + password + colors.ENDC)
    print("\nYou can also go to the Files app, tap the 3 dots \'...\',\nthen tap \'Connect to Server\' and enter " + generateURL() + "\nin the \'Server\' field. Make sure to enter the password above!")
    print("----------------------------------")
    input("Press ENTER to quit")
    stop_command = "cd lib/ && chmod +x linux_stop.sh &&  sh linux_stop.sh"
    os.system(stop_command)
    _ = subprocess.call('clear' if os.name =='posix' else 'cls')
    print("Bye!  :)")
    exit()
    pass