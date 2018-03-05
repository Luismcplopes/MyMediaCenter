#!/bin/sh
#uninstallation of headphones
echo "uninstalling headphones..."
sudo service headphones stop
sudo rm -R /opt/nzbToMedia
sudo update-rc.d headphones remove
sudp rm /etc/init.d/headphones
sudo rm -R /opt/headphones
echo "deleting user headphones.." 
sudo deluser headphones osmc
sudo apt-get --yes --force-yes  autoremove
echo "headphones is removes"
