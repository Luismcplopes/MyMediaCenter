#!/bin/sh
#installation script for headphones
echo "updating and upgrading packages"
sudo apt-get update
sudo apt-get upgrade -y
echo "installing git-core"
sudo apt-get install git-core -y
echo "installing headphones"
sudo git clone https://github.com/rembo10/headphones.git /opt/headphones
echo "creating user headphones and adding to osmc group"
sudo useradd headphones
sudo usermod -a -G osmc headphones
echo "giving permission to headphones folder"
sudo chown -R headphones:headphones /opt/headphones
echo "fixing localhost from localhost to 0.0.0.0 in config.py "
sudo sed -i 's@localhost@0.0.0.0@g' /opt/headphones/headphones/config.py
echo "creating "config file"
sudo printf '%s\n' 'HP_USER=headphones' 'HP_HOME=/opt/headphones' 'HP_PORT=8181' >/etc/default/headphones
echo "creating startup script""
sudo cp /opt/headphones/init-scripts/init.ubuntu /etc/init.d/headphones
sudo chmod +x /etc/init.d/headphones
sudo update-rc.d headphones defaults
echo "starting headphones"
sudo service headphones start
echo "headphones started"
echo "adding nzbToMedia (I finded in howto guide, not sure why is this together.."
sudo git clone https://github.com/clinton-hall/nzbToMedia.git /opt/nzbToMedia
echo "headphones started"
echo "try in web browser your-ip-address-of-rpi:8181"
echo "enjoy"
