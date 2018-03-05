#!/bin/sh
# Installation script of Sickrage and CouchPotato
echo "Begining updating and installation of GIT..."
sudo apt-get --yes --force-yes update && sudo apt-get --yes --force-yes install git
echo "finished updating and instlaltion of GIT"
echo "Begining upgrading osmc..."
sudo apt-get --yes --force-yes upgrade
echo "finished upgrading"
echo "begining installing p7zip..."
sudo apt-get --yes --force-yes install p7zip-full
echo "installed p7zip"
echo "begining installing unrar..."
sudo wget http://sourceforge.net/projects/bananapi/files/unrar_5.2.6-1_armhf.deb
sudo dpkg -i unrar_5.2.6-1_armhf.deb
echo "successfully installed and removing temporary file of unrar"
sudo rm  unrar_5.2.6-1_armhf.deb
echo "removed temporary file of unrar"
echo "Begining installing CouchPotato..."
echo "adding couchpotato username and adding to group..."
sudo useradd couchpotato
sudo usermod -a -G osmc couchpotato
echo "creatint home folder in /home/couchpotato..."
sudo mkdir /home/couchpotato
echo "granting permissions..."
sudo chown -R couchpotato:couchpotato /home/couchpotato
echo "downloading couchpotato and installing..."
sudo git clone http://github.com/RuudBurger/CouchPotatoServer /opt/CouchPotatoServer
echo "granting permissions... "
sudo chown -R couchpotato:couchpotato /opt/CouchPotatoServer
echo "adding startup script...."
cd /opt/CouchPotatoServer
sudo cp /opt/CouchPotatoServer/init/couchpotato.service /etc/systemd/system/couchpotato.service
cd  /etc/systemd/system/
echo "fixing startup path..."
sudo sed -i 's@/var/lib/CouchPotatoServer/CouchPotato.py@/opt/CouchPotatoServer/CouchPotato.py@g' couchpotato.service
echo "enabling startup script..."
sudo systemctl enable couchpotato.service
echo "couchpotato service is starting..."
sudo systemctl start couchpotato.service
echo "couchpotato successfully installed, you can check at Raspberry_Pi_IP_Address:5050"
cd
echo "Begining to install SickRage"
echo "creating sickrage username and adding to group..."
sudo useradd sickrage
sudo usermod -a -G osmc sickrage
echo "downloading sickrage and installing..."
sudo git clone https://github.com/SiCKRAGE/SickRage.git /opt/sickrage
echo "creating startup script for sickrage..."
sudo cp /opt/sickrage/runscripts/init.systemd /etc/systemd/system/sickrage.service
echo "granting permissions to sickrage folder"
sudo chown -R sickrage:sickrage /opt/sickrage
sudo chmod +x /opt/sickrage
sudo chmod a-x /etc/systemd/system/sickrage.service
echo "fixing path at startup script..."
cd /etc/systemd/system
sudo sed -i 's@/usr/bin/python2.7 /opt/sickrage/SickBeard.py -q --daemon --nolaunch --datadir=/opt/sickrage@/opt/sickrage/SickBeard.py -q --daemon --nolaunch --datadir=/opt/sickrage@g' sickrage.service
echo "enabling startup script...."
sudo systemctl enable sickrage.service
echo "starting sickrage and waiting to create file config.ini ..."
sudo systemctl start sickrage.service
echo "created file config.ini and stopping sickrage..."
sudo service sickrage stop
cd /opt/sickrage/
echo "adding username and password to sickrage... this fixes freezing raspbeery pi when you try to login to sickrage..."
sudo sed -i 's@web_username = ""@web_username = "osmc"@g' config.ini
sudo sed -i 's@web_password = ""@web_password = "osmc"@g' config.ini
echo "Sickrage succesfully installed..."
sudo service sickrage start
echo "Sickrage service started!"
echo " "
echo "Successfully installed! more info bellow..."
echo " "
echo "couchpotato info:"
echo "webgui raspberry_ip:5050"
echo " "
echo "sickrage info:"
echo "webgui raspberry_ip:8081"
echo " "
echo "sickrage login info:"
echo " "
echo "username: osmc"
echo "password: osmc"
echo " "
echo "enjoy"
