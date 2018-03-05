#!/bin/sh
# uninstaller for couchpotato, sickrage, zip and unrar 
sudo service sickrage stop
sudo service couchpotato stop
sudo userdel sickrage
sudo userdel couchpotato
sudo systemctl disable couchpotato.service
sudo systemctl disable sickrage.service
sudo rm /etc/systemd/system/couchpotato.service
sudo rm /etc/systemd/system/sickrage.service
sudo rm -R /home/couchpotato
sudo rm -R /opt/CouchPotatoServer
sudo rm -R /opt/sickrage
sudo dpkg -r unrar
sudo apt-get --yes --force-yes remove p7zip-full
sudo apt-get --yes --force-yes autoremove
#successfully uninstalled!
