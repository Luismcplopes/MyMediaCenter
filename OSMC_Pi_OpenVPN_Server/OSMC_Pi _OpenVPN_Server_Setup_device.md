# OSMC Pi OpenVPN Server: Set up a device
Before you start, download and install the OpenVPN Connect app onto each of your devices which are going to access your OpenVPN server.

**Note the following must be repeated for each device/user combination** which you wish to access your OpenVPN server; you will need the **VPN client names** 


    PreparationNote
    - OSMC IP address:192.168.1.6 
    - Router address:192.168.1.1
    - DDNS domain name: use the External IP
    - VPN server name: OSMC
    - Phone VPN client name: myphone
    - VPN client name:

```bash
sudo su
cd /etc/openvpn/easy-rsa
source ./vars
./build-key-pass myphone
```
… you will be prompted for a *PEM Pass phrase* so enter a password (enter it asecond time when prompted to verify)

… you will be prompted for a series inputs but just hit enter to accept the default value for each.

**Note: make sure you don’t enter any text at the prompt A challenge password… just hit the Enter key.**

Enter **y** to the following prompts:

*Sign the certificate?*

*1 out of 1 certificate requests certified, commit?*

```bash
cd ./keys
openssl rsa -in myphone.key -des3 -out myphone.3des.key
```
… you will be prompted for the passphrase for the **PEM Pass phrase** as entered above.

… you will be prompted to enter and repeat another PEM pass phrase (this time for the des3 key). To keep things simple I used the same password as previously so it means you only have to remember one password for anything you do with your OpenVPN server.

Now type the following command:

./MakeOVPN.sh

… you will be prompted for the client name you are setting up (i.e. in my
case *myphone*)

… you should then see the line  *Done! myphone.ovpn Successfully Created*
`cp /etc/openvpn/easy-rsa/keys/myphone.ovpn /home/osmc/myhsare/`


On an Iphone you need to change the order of the ca certificate to the end of the file
```
client
dev tun
proto udp
remote 95.94.50.32 1194 ## CHANGE your-dns.dynamic-dns.net TO THE DOMAIN YOU CREATED IN YOUR CHANGEIP.COM ACCOUNT (DO NOT prefix with www.)
resolv-retry infinite
nobind
persist-key
persist-tun
mute-replay-warnings
ns-cert-type server
key-direction 1
cipher AES-128-CBC
comp-lzo
verb 1
mute 20
<cert>
-----BEGIN CERTIFICATE-----
-----END CERTIFICATE-----
</cert>
<key>
-----BEGIN RSA PRIVATE KEY-----
...
-----END RSA PRIVATE KEY-----
</key>
<tls-auth>
-----BEGIN OpenVPN Static key V1-----
...
-----END OpenVPN Static key V1-----
</tls-auth>
<ca>
-----BEGIN CERTIFICATE-----
...
-----END CERTIFICATE-----
</ca>
```