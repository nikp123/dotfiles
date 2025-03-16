# Change to the directory of the script
cd ~/.config/aconfmgr

# ...yes, HOST SPECIFIC CONFIGS
# The author sure as fuck didn't predict I'd be abusing the shit out of this
HOST=$(cat /etc/hostname)
cd ./devices/${HOST}
source ./default.sh
cd ../..

source ./fixes/default.sh
source ./system/default.sh
