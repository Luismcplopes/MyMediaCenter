# MyMediaCenter
Raspeberry Pi with  OSMC( + SSH + Samba + Transmissio + Sickrage + CouchPotato)
 
## Install on SD card
 - https://computers.tutsplus.com/articles/how-to-flash-an-sd-card-for-raspberry-pi--mac-53600

## activar
### SSH
Active SSH inside the OSMC 
### Samba
Active Samba inside the OSMC 
-Add custom shares in smb-shares.conf instead of editing smb.conf so they will not be overwritten by samba updates. You can only add new shares to smb-shares.conf, not change the default shares or global options. If you need full control see smb-local.conf above.
´´´
sudo cp smb-shares.conf /etc/samba/smb-shares.conf
´´´


### Transmission
Active Transmission inside the OSMC 

ecxhenge the defaut settings   
```bash
# Stop service
sudo systemctl stop transmission
# Change settings from command-line, for example, to configure the downloads directory or port:
/home/osmc/.config/transmission-daemon/settings.json
# Start service
$ sudo systemctl start transmission
```

## Sickrage
 - https://discourse.osmc.tv/t/how-to-install-couchpotato-and-sickrage-on-raspberry-pi/10788
 - https://www.htpcguides.com/install-sickrage-raspberry-pi-usenet-torrent-tv/



### Configurar 
 - https://www.htpcguides.com/configure-sickrage-usenet-torrent-tv/
### adicionar Sickrage aos serviços do OSMC
 - https://discourse.osmc.tv/t/sickrage-and-couchpotato-managed-from-osmc-services/36914
´´´
sudo cp sickrage-app-osmc /etc/osmc/apps.d/sickrage-app-osmc
´´´


## CouchPotato
 https://discourse.osmc.tv/t/how-to-install-couchpotato-and-sickrage-on-raspberry-pi/10788

### adicionar CouchPotato aos serviços do OSMC
 - https://discourse.osmc.tv/t/sickrage-and-couchpotato-managed-from-osmc-services/36914

 ´´´
sudo cp couchpotato-app-osmc /etc/osmc/apps.d/couchpotato-app-osmc
´´´

## Clonar Cartão SD
 - https://computers.tutsplus.com/articles/how-to-clone-your-raspberry-pi-sd-cards-with-windows--mac-59294


next
https://github.com/rembo10/headphones
