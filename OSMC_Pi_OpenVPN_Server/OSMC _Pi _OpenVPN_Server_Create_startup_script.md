**OSMC Pi OpenVPN Server: Create a start up script**
Create a script that will run automatically when your Pi boots up. This script will run the commands needed to get your OpenVPN up and running and overcomes the timing issue where the OpenVPN server service fails to start after a reboot.

```bash
cd /usr/bin
sudo nano start-vpn
```
Enter the following in the `start-vpn` file:
```
\#!/bin/bash
sleep 5
sudo systemctl restart openvpn
exit 0
```

Then type the following command:

sudo chmod +x start-vpn

**To test the script**, reboot your pi (type *sudo reboot*), reconnect and then
type the following command:

start-vpn

Type the following commands to check of the OpenVPN services are running:

sudo systemctl status openvpn
sudo systemctl status openvpn\@server.service

… the response of each command should include the word *active* in green

**To make your start-vpn script run automatically**, type the following
commands:

sudo nano /etc/rc.local

… scroll down and enter the following line above the line *exit 0* (zero):

/usr/bin/start-vpn

Save the changes and exit the editor (type Ctrl+X, Y, then press Enter).

Now, reboot you Pi and run the two test commands above again; you should
see *active* in green for both.

Note, the *sleep 5* command in the *start-vpn* script creates a 5 second delay before OpenVPN is restarted allowing the network service to get up and running; if you remove the *sleep* command the service will not start when you set the start-vpn script to run automatically (in my experience).

