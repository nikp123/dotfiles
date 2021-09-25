#!/bin/sh

echo "device_add usb-mouse" | netcat -w 1 localhost 7101

