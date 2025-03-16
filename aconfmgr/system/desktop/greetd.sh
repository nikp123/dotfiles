AddPackage cage
AddPackage greetd
AddPackage greetd-gtkgreet

CopyFile /etc/greetd/config.toml
CopyFile /etc/greetd/environments

CreateLink /etc/systemd/system/display-manager.service /usr/lib/systemd/system/greetd.service
