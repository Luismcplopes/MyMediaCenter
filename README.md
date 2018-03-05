# MyMediaCenter
Raspeberry Pi with  OSMC( + SSH + Samba + Transmissio + Sickrage + CouchPotato)
 
## Download OSMC
 - https://osmc.tv/download/

## Install on SD card
 - https://computers.tutsplus.com/articles/how-to-flash-an-sd-card-for-raspberry-pi--mac-53600

## How to activate SSH, Samba, Transmissio inside the OSMC 

### Samba - how to config extra shares
-Add custom shares in smb-shares.conf instead of editing smb.conf so they will not be overwritten by samba updates. You can only add new shares to smb-shares.conf, not change the default shares or global options. If you need full control see smb-local.conf above.
```bash
sudo cp smb-shares.conf /etc/samba/smb-shares.conf
```

### Transmission - change the default settings  

"rpc-whitelist": "192.168.*.* ",
If you want it to be more secure. However, if you want to be able to access transmission outside your local network then it should be *.*.*.* 

May as well disable the whitelist if you are allowing all IPs
"rpc-whitelist-enabled": false,

Change the remote access username and password to your liking
"rpc-password": "password",
"rpc-username": "username",


#### Make Transmission Automatically Stop Seeding
- Check Stop seeding at ratio and enter 0
- Click the Speed tab and check Upload (kB/s):, enter 0 or your maximum desired upload rate.


```bash
# Stop service
sudo systemctl stop transmission
# Change settings from command-line, for example, to configure the downloads directory or port:
/home/osmc/.config/transmission-daemon/settings.json
# Start service
$ sudo systemctl start transmission
```

## Install Couchpotato and Sickrage
Copy file `install-couchpotato-sickrage.sh` to osmc home folder and run command:
```bash
sudo sh install-couchpotato-sickrage.sh
```
Base on `https://discourse.osmc.tv/t/how-to-install-couchpotato-and-sickrage-on-raspberry-pi/10788`
 
### How to Config Sickrage
 - https://www.htpcguides.com/configure-sickrage-usenet-torrent-tv/

### How to Config couchpotat
 - https://www.htpcguides.com/configure-couchpotato-torrent-movies/

#### How to manage CouchPotato and Sickrage from OSMC 
 - https://discourse.osmc.tv/t/sickrage-and-couchpotato-managed-from-osmc-services/36914
```bash
sudo cp sickrage-app-osmc /etc/osmc/apps.d/sickrage-app-osmc
sudo cp couchpotato-app-osmc /etc/osmc/apps.d/couchpotato-app-osmc
```

## Clonar Cartão SD
 - https://computers.tutsplus.com/articles/how-to-clone-your-raspberry-pi-sd-cards-with-windows--mac-59294


## next step
https://github.com/rembo10/headphones

https://discourse.osmc.tv/c/how-to

https://discourse.osmc.tv/t/howto-retropie-and-osmc-retrosmc-retrogaming-on-osmc/6671
https://discourse.osmc.tv/t/howto-installing-retropie-alongside-osmc-rc-the-easy-way/1921


https://discourse.osmc.tv/t/howto-setup-two-way-authentication-to-ssh/16885

https://discourse.osmc.tv/t/howto-ddns-mega-thread/16412

https://discourse.osmc.tv/t/howto-ssh-tunneling-remote-access-webuis-like-syncthing-transmission-without-portforwards-the-safest-way/11473
