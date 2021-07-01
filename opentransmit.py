def initialize():
    try:
        import os, subprocess
        from socket import socket
        import pyqrcode
        from sys import platform
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
    from sys import platform
    if platform == "linux" or platform == "linux2": # linux
        pass
    elif platform == "darwin": # macOS
        pass
    elif platform == "win32": # Windows...
        pass


def startSMBServer():
    if os.name =='posix': #Linux / macOS
        pass
    else: #Windows
        pass

def userMenu():
    print("\n****************************")
    print("*       SMBTRANSFER        *")
    print("****************************\n")
    print("Your local IP: "+localIP())
    print("*")
    print("*")
    print("*")
    print("*")
    print("*")
    print("*")
    print("*")
    print("*")

if __name__ == "__main__":
    initialize()
    userMenu()
    pass