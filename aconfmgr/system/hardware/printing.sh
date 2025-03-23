IgnorePath /etc/cups
IgnorePath /etc/cups/*
IgnorePath /etc/printcap

AddPackage cups
AddPackage foomatic-db
AddPackage foomatic-db-ppds
AddPackage foomatic-db-nonfree
AddPackage foomatic-db-nonfree-ppds

CreateLink /etc/systemd/system/multi-user.target.wants/cups.path /usr/lib/systemd/system/cups.path
CreateLink /etc/systemd/system/multi-user.target.wants/cups.service /usr/lib/systemd/system/cups.service
CreateLink /etc/systemd/system/printer.target.wants/cups.service /usr/lib/systemd/system/cups.service
CreateLink /etc/systemd/system/sockets.target.wants/cups.socket /usr/lib/systemd/system/cups.socket
