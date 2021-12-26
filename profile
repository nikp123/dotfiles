#!/bin/sh

# Config directories
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# Per-application configurations
#export VIMINIT=":source "$XDG_CONFIG_HOME/vim/vimrc
export BASH_COMPLETION_USER_FILE="$XDG_CONFIG_HOME"/bash-completion/bash_completion
export HISTFILE="$XDG_CONFIG_HOME"/bash/history
export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority
export SQLITE_HISTORY=$XDG_DATA_HOME/sqlite_history
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME"/android
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export CCACHE_CONFIGPATH="$XDG_CONFIG_HOME"/ccache.config
export CCACHE_DIR="$XDG_CACHE_HOME"/ccache
export GTK_RC_FILES="$XDG_CONFIG_HOME"/gtk-1.0/gtkrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-1.0/gtkrc
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CONFIG_HOME"/less/history
export ELINKS_CONFDIR="$XDG_CONFIG_HOME"/elinks
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export ELINKS_CONFDIR="$XDG_CONFIG_HOME"/elinks
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
#export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
#export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc
#export XAUTHORITY="$XDG_CACHE_HOME"/Xauthority

export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export GTK_RC_FILES="$XDG_CONFIG_HOME"/gtk-1.0/gtkrc

export RANDFILE="$XDG_CACHE_HOME/openssl-rand"

alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'
alias bash='bash --init-file "$XDG_CONFIG_HOME/bash/config"'

# Completions
#if [ -f /usr/lib/python3.7/site-packages/habitica/shell_completion.sh ]; then
#    /usr/lib/python3.7/site-packages/habitica/shell_completion.sh
#fi

# CHLohr build system
export NDK=/opt/android-ndk/
export ANDROIDSDK=/opt/android-sdk/

# General system variables
export EDITOR=/usr/bin/vim

if [ "$XDG_CURRENT_DESKTOP" = "KDE" ]; then
    exec /etc/profile.d/flatpak.sh
else
    export QT_QPA_PLATFORMTHEME=qt5ct
fi

#export MOZ_ENABLE_WAYLAND=1
#export XDG_SESSION_TYPE=wayland
#export XDG_CURRENT_DESKTOP=sway
#export XDG_CURRENT_DESKTOP=sway:GNOME
#export CLUTTER_BACKEND=wayland
#export QT_QPA_PLATFORM=xcb #wayland-egl
# wait for a another 10 years so this shit is actually stable
#export SDL_VIDEODRIVER=wayland

# KDE stuff
#export DESKTOP_SESSION=kde
#export XDG_CURRENT_DESKTOP=KDE
#export QT_PLUGIN_PATH=$HOME/.kde4/lib/kde4/plugins/:/usr/lib/kde4/plugins/
#export QT_QPA_PLATFORMTHEME="qt5ct"

# Fix Vibers bullshit
#export QT_AUTO_SCREEN_SCALE_FACTOR=0

#export QT_QPA_PLATFORMTHEME="gtk2"
#export QT_STYLE_OVERRIDE=kvantum

# Reddit Terminal Viewer editor
export RTV_EDITOR=vim

# Fixes chromium's pink,red,yellow mess
#export allow_rgb10_configs=false

# some wine boostifier stuff
#export WINEDEBUG=-all
#export DXVK_LOG_LEVEL=none
export WINEESYNC=1
export WINEARCH=win64

# Import my account keys into the environment
#export GOOGLE_API_KEY=$(cat ~/.config/keys)

export GOPATH=/media/DATA/Programs/go

# fixes Java (somehow) on Wayland
export _JAVA_AWT_WM_NONREPARENTING=1

# Vulkan override for nvidia gpus
#if lsmod | grep nvidia &> /dev/null; then
#	export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/nvidia_icd.json
#fi

# Intel Gayming on Binux
#export MESA_LOADER_DRIVER_OVERRIDE=iris

#export QT_QPA_PLATFORM=wayland

#eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
#export SSH_AUTH_SOCK

# GNU's a bunch-o-boomers
export CC=clang

# Rust is also in the annoying as fuck gang
export RUSTUP_HOME=$HOME/.local/share/rustup
export CARGO_HOME=$HOME/.local/share/cargo
# Left disabled because Rust likes to consider this directory for ONLY ONE project
# at a time, effectivelly reseting all your other builds if you compile a new project
# which sucks, I know
#export CARGO_TARGET_DIR=$HOME/.cache/cargo
#export RUSTC_WRAPPER=$HOME/.local/share/cargo/bin/sccache

# Load SSH garbage in
eval $(ssh-agent) &> /dev/null



# Fix yet another fucking GTK issue
#export GTK_USE_PORTAL=0

