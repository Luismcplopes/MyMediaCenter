#!/bin/sh
# uninstaller for couchpotato
sudo service couchpotato stop
sudo userdel couchpotato
sudo systemctl disable couchpotato.service

sudo rm /etc/systemd/system/couchpotato.service
sudo rm /etc/systemd/system/sickrage.service
sudo rm -R /home/couchpotato
sudo rm -R /opt/CouchPotatoServer

#successfully uninstalled!
