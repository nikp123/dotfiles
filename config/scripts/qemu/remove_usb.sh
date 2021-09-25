#!/bin/sh

device="$(lsusb|cut -d':' -f2,3|sed 's/ ID //'|rofi -i -dmenu)"

if [ -z "$device" ]; then 
	echo "invalid device!"
	exit -1;
fi

vendorid=$(echo $device|cut -c1-4)
productid=$(echo $device|cut -c6-9)
echo "device_del usb$productid$vendorid" | netcat -w 1 localhost 7101

