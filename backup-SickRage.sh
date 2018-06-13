#!/bin/sh
sudo cp /opt/sickrage/config.ini /home/osmc/backup-sickrage/
sudo cp /opt/sickrage/sickbeard.db /home/osmc/backup-sickrage/ 
sudo cp /opt/sickrage/cache.db /home/osmc/backup-sickrage/ 
sudo cp /opt/sickrage/failed.db /home/osmc/backup-sickrage/ 
sudo cp -r /opt/sickrage/cache/ /home/osmc/backup-sickrage/ 
sudo cp -r /opt/sickrage/Logs/ /home/osmc/backup-sickrage/
