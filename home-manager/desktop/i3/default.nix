{ config, pkgs, lib, ... }: {
  services = {
    dunst.enable = true;
    picom.enable = true;
    #espanso           = import ../settings/services/espanso.nix;
    #random-background = import ../settings/services/random-background.nix;
  };

  defaultapp = {
    file_manager        = "caja";
    file_archiver       = "engrampa";
    image_viewer        = "viewnior";
    menu                = "rofi";
    terminal            = "alacritty";
    notification_daemon = "swaync";
    password_manager    = "rofi-rbw";
  };

  programs = {
    rbw.enable = true; # Bitwarden
    i3status.enable  = true;
  };

  # copy the i3 config files over
  xdg = {
    enable = true;
    configFile = {
      "i3/scripts" = {
        recursive = true;
        source = ./files/scripts;
        target = "i3/scripts";
      };
    };

    desktopEntries = {
      "caja" = {
        exec = "caja --no-desktop %U";
        icon = "folder-open";
        mimeType = [ "inode/directory" "x-directory/normal" ];
        name = "Caja";
        noDisplay = true;
      };
    };
  };

  dconf.settings = {
    "org/mate" = {
      applications-terminal = "alacritty";
    };
    "org/mate/desktop/media-handling" = {
      automount-open = false;
    };
    "org/mate/desktop/preferences" = {
      use-iec-units = true;
    };
    "org/mate/caja-open-terminal" = {
      desktop-opens-home-dir = false;
    };
  };

  home.packages = with pkgs; [
    # keyboard (manual) control
    wmctrl
    xorg.xkill

    # screenshots
    slop
    hacksaw
    shotgun
    xclip

    # le file management
    mate.caja-with-extensions

    # DConf/Gnomey stuff
    dconf
    dconf2nix
    dconf-editor
    glib

    # UPower
    mate.mate-power-manager

    # networkmanager
    networkmanagerapplet

    # display
    autorandr
    arandr

    # notification daemon
    libnotify
  ];

  xsession.windowManager.i3 = import ./settings.nix { inherit pkgs lib config; };
}
