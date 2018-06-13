#!/bin/sh
sudo cp /home/osmc/backup-sickrage/config.ini /opt/sickrage/
sudo cp /home/osmc/backup-sickrage/sickbeard.db /opt/sickrage/
sudo cp /home/osmc/backup-sickrage/cache.db /opt/sickrage/
sudo /home/osmc/backup-sickrage/failed.db /opt/sickrage/
sudo cp -r /home/osmc/backup-sickrage/cache/ /opt/sickrage/
sudo cp -r /home/osmc/backup-sickrage/Logs/ /opt/sickrage/
