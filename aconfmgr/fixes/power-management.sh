AddPackage tlp

CreateLink /etc/systemd/system/multi-user.target.wants/tlp.service /usr/lib/systemd/system/tlp.service

CopyFile /etc/tlp.conf
