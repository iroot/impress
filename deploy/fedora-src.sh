#!/bin/bash
dnf -y update
dnf -y install wget mc gcc-c++
dnf -y install psmisc
dnf -y install smartmontools
dnf -y groupinstall "Development Tools"
dnf -y install certbot
cd /usr/src
wget https://nodejs.org/dist/v12.0.0/node-v12.0.0.tar.gz
tar zxf node-v12.0.0.tar.gz
rm -f ./node-v12.0.0.tar.gz
cd node-v12.0.0
./configure
make
make install
cd ~
rm -rf /usr/src/node-v12.0.0
ln -s /usr/local/bin/node /bin
ln -s /usr/local/bin/npm /bin
sudo mkdir /ias
cd /ias
sudo npm install nodemailer websocket geoip-lite
sudo npm install impress --unsafe-perm
echo 'To generate certificates run "certbot certonly" under root'
