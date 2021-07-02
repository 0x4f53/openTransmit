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
        install_command = "pip install -r requirements.txt"
        install_deps_prompt = input ("Couldn't find some dependencies. Try to install them? (Y/n) ")
        if "y" in install_deps_prompt.lower():
            os.system(install_command)
            _ = subprocess.call('clear' if os.name =='posix' else 'cls')
            print("Done. Re-run SMBTransfer to continue!")
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

def startupMenu():
    print("\n**********************************")
    print  ("||        OpenTransmit          ||")
    print  ("----------------------------------")
    print  (" > Your local IP: "+localIP())
    print  ("----------------------------------\n")


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

def lastMenu():
    print("")


if __name__ == "__main__":
    from sys import platform
    import random
    if platform == "darwin" or platform == "win32": # Windows or macOS
        print ("OpenTransmit doesn't support Windows and macOS.")
        exit()

    import os, subprocess
    password = str(random.randint(1000, 9999))
    initialize()
    startupMenu()
    print("\nMake sure your computer and iPhone are on the same network.\nThis can be either WiFi, portable hotspot or USB tethering.\n")
    input("Press ENTER⏎ to continue\n")

    command = "cd lib/scripts/linux/ && chmod +x linux_setup.sh && ./linux_setup.sh " + password
    os.system(command)

    print("Scan the QR code below in your camera app")
    printQRCode(generateURL())
    print("Password: " + colors.WARNING + password + colors.ENDC)
    print("\nYou can also go to the Files app, tap the 3 dots \'•••\', then tap \'Connect to Server\' and enter " + generateURL() + " in the \'Server\' field.")
    
    print  ("----------------------------------")
    print  ("")
    pass