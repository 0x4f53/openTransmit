#!/bin/sh
sudo cp -r ../openTransmit /opt/
sudo mv /opt/openTransmit/opentransmit.py /opt/openTransmit/opentransmit
sudo chmod +x /opt/openTransmit/opentransmit
sudo ln -s /opt/openTransmit/opentransmit /usr/bin/opentransmit
