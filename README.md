[![Open Source](https://img.shields.io/badge/Open%20Source-Yes-blue?style=flat&logo=github)](https://opensource.org/)
[![License](https://img.shields.io/badge/License-GPLv3-purple?style=flat&logo=libreoffice)](LICENSE)
[![Maintenance](https://img.shields.io/badge/Maintained-Yes-green.svg?style=flat&logo=symantec)](https://github.com/4f77616973/GetPerms/graphs/commit-activity)
<!--[![Build Status](https://github.com/4f77616973/openTransmit/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/4f77616973/openTransmit/actions)-->
<!--[![PyPI](https://jitpack.io/v/com.github.4f77616973/GetPerms.svg)](https://jitpack.io/#com.github.4f77616973/GetPerms)-->

# openTransmit

<img src = "openTransmit-icon.png" alt = "openTransmit logo" width = "75dp">

A quick-and-dirty Linux Python script to setup a local SMB server and display its QR Code to use with iOS's Files.app.

## HOW TO

<!--### Via PyPI / pip
Make sure you have Python and pip installed, then open a terminal and type `pip install opentransmit`.-->

### Download via clone

Make sure you have Git, Python and pip installed, then open a terminal and type `git clone https://github.com/4f77616973/openTransmit`.

### Usage

<img src = "preview.png" alt = "openTransmit preview">

1. Run the script by changing to its directory and typing `python opentransmit.py`. _**Note:** you can also specify a custom password via a flag. To do this, run `python opentransmit.py asdf` where `asdf` is the password._
2. Open the camera app on your iPhone / iPad / iPod Touch running iOS 11+
3. Scan the QR code displayed on the terminal and tap on the 'Files' notification that appears
4. Tap 'Connect' on the top right corner, then enter the password displayed below the QR Code
5. Once done, hit enter on your computer to stop the script

## LICENSE

[Copyright © 2021 Owais Shaikh](LICENSE)

This project is licensed under the GNU General Public License Version 3 (GPL v3).

GitLab: [ThomasCat](https://gitlab.com/ThomasCat) | GitHub: [4f77616973](https://github.com/4f77616973) | Contact: [Email](mailto://0x4f@tuta.io)
