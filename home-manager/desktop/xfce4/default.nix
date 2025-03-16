{ pkgs, lib, config, ... }: {
  imports = [
    ./plank.nix
  ];

  defaultapp = {
    file_manager        = "thunar";
    file_archiver       = "engrampa";
    image_viewer        = "viewnior";
    menu                = "rofi";
    terminal            = "xfce4-terminal";
    notification_daemon = "";
    password_manager    = "rofi-rbw";
  };

  xfconf = {
    enable = true;
    settings = import ./settings.nix { inherit pkgs config; };
  };

  # Bitwarden
  programs = {
    rbw.enable = true;
  };

  services = {
    pasystray = {
      enable = true;
      extraOptions = [
        "--key-grabbing"
      ];
    };
  };

  xdg = {
    enable = true;
    configFile = {
      # Don't use the default volume indicator
      "autostart/xfce4-volumed-pulse.desktop" = {
        text = ''
          [Desktop Entry]
          Hidden=true
        '';
      };
      "scripts" = {
        recursive = true;
        source = ../../files/xdg_config/scripts;
        target = "scripts";
      };
    };
  };

  home.packages = with pkgs; [
    # keyboard (manual) control
    wmctrl        # X11 input scripting
    xorg.xkill    # Xkill

    # DConf/Gnomey stuff
    dconf
    dconf2nix
    dconf-editor
    glib

    # networkmanager
    networkmanagerapplet

    # notification daemon
    libnotify
    xorg.xprop
    xdg-utils
  ];
}
