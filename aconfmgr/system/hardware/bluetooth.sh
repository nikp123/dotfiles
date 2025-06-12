AddPackage blueman
AddPackage bluez
AddPackage bluez-tools
AddPackage bluez-utils

CreateLink /etc/systemd/system/bluetooth.target.wants/bluetooth.service /usr/lib/systemd/system/bluetooth.service
CreateLink /etc/systemd/system/dbus-org.bluez.service /usr/lib/systemd/system/bluetooth.service

IgnorePath '/var/lib/bluetooth/*'
