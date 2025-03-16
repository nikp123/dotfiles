CopyFile /etc/systemd/journald.conf.d/limit-size.conf

CreateLink /etc/systemd/system/sockets.target.wants/systemd-journald-audit.socket /usr/lib/systemd/system/systemd-journald-audit.socket
CreateLink /etc/systemd/system/systemd-journald.service.wants/systemd-journald-audit.socket /usr/lib/systemd/system/systemd-journald-audit.socket

CreateDir /var/lib/lastlog
IgnorePath /var/log

SetFileProperty /var/log/journal group systemd-journal
