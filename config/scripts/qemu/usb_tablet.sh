#!/bin/sh

echo "device_add usb-tablet" | netcat -w 1 localhost 7101

