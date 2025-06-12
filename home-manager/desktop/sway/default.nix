{ pkgs, lib, config, ... }: let
  systemd-target = "sway-session.target";
in {
  wayland.enable = true;

  imports = [
    ./display.nix
    ./fixes
    ../../services/random-background.nix
    #../../services/tailscale-systray.nix
  ];

  defaultapp = {
    file_manager        = "thunar";
    file_archiver       = "lxqt-archiver";
    image_viewer        = "viewnior";
    menu                = "rofi";
    terminal            = "foot";
    notification_daemon = "";
    password_manager    = "rofi-rbw";
  };

  programs = {
    rbw.enable = true; # Bitwarden
    waybar = {
      enable = true;
      systemd.target = systemd-target;
    };
  };

  services = {
    wlsunset = {
      enable = false;
      systemdTarget = systemd-target;
    };
    swayidle = {
      enable = true;
      systemdTarget = systemd-target;
    };
    swww.enable = true;
    polkit-gnome.enable = true;
    pasystray.enable = false;
    swaync.enable = true;
    udiskie.systemdTarget = systemd-target;
  };

  wayland.windowManager.sway = import ./settings.nix
    { inherit pkgs lib config; };

  # copy the i3 config files over
  xdg = {
    enable = true;
    configFile = {
      "sway" = {
        recursive = true;
        source = ./files;
        target = "sway";
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

    # screenshots
    grim          # cropping tool
    slurp         # screenshot tool
    wl-clipboard  # clipboard tool

    # DConf/Gnomey stuff
    dconf
    dconf2nix
    dconf-editor
    glib

    # UPower
    mate.mate-power-manager

    # networkmanager
    networkmanagerapplet

    # notification daemon
    libnotify
    xorg.xprop
    swaybg
    xdg-utils

    wdisplays  # display managment

    swww
  ];

  home.sessionVariables.XDG_CURRENT_DESKTOP = "sway";
}
