# Set up sudo
CopyFile /etc/sudoers
IgnorePath /var/db/sudo/lectured

# Arch makes this SUID on boot so we don't have to keep track of that
IgnorePath /usr/bin/groupmems
