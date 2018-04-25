
#!/bin/sh
# Installation script of CouchPotato
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