AddPackage tailscale # A mesh VPN that makes it easy to connect your devices, wherever they are.

CreateLink /etc/systemd/system/multi-user.target.wants/tailscaled.service /usr/lib/systemd/system/tailscaled.service

CreateDir /var/lib/tailscale 700
IgnorePath /var/lib/tailscale/derpmap.cached.json
IgnorePath /var/lib/tailscale/files
IgnorePath /var/lib/tailscale/tailscaled.log.conf
IgnorePath /var/lib/tailscale/tailscaled.log1.txt
IgnorePath /var/lib/tailscale/tailscaled.log2.txt 
# Yes, this should be in persistent, but tailscale keeps overwriting it,
# so no point in fighting with tailscale
IgnorePath /var/lib/tailscale/tailscaled.state

IgnorePath /etc/resolv.conf
IgnorePath /etc/resolv.pre-tailscale-backup.conf
