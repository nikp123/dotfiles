{ pkgs, lib, config, ... }: let
  screenshot-grab-area   = (import ./scripts/screenshot-grab-area.nix   { inherit pkgs; });
  screenshot-grab-window = (import ./scripts/screenshot-grab-window.nix { inherit pkgs; });
  screenshot-whole       = (import ./scripts/screenshot-whole.nix       { inherit pkgs; });
  screenshot-notify      = (import ./scripts/screenshot-notify.nix      { inherit pkgs; });

  backlight              = (import ./scripts/backlight.nix              { inherit pkgs; });
  volume-out             = (import ./scripts/volume-out.nix             { inherit pkgs; });

  rofi-powermenu         = (import ./scripts/rofi-powermenu.nix         { inherit pkgs config; });

  rofi-sink-select   = "${pkgs.rofi-pulse-select}/bin/rofi-pulse-select sink";
  rofi-source-select = "${pkgs.rofi-pulse-select}/bin/rofi-pulse-select source";
in {
  enable = true;
  package = (config.lib.nixGL.wrap pkgs.sway);
  systemd.enable = true;
  wrapperFeatures = {
    base = true;
    gtk = true;
  };

  extraConfig = ''
    include config.d/*

    exec ${pkgs.networkmanagerapplet}/bin/nm-applet --indicator

    exec_always dbus-update-activation-environment --systemd --all
    exec_always ${pkgs.systemd}/bin/systemctl --user restart sway-session.target
  '';
  config = {
    input = {
      "*" = {
        xkb_layout  = "us,hr,rs,de,eu";
        #xkb_options = "grp:alt_shift_toggle,caps:escape";
        xkb_options = "caps:escape";
      };
      #"1386:828:Wacom_Intuos_PT_S_2_Pen" = {
      #  map_to_output = "HDMI-A-1";
      #};
      "type:touchpad" = {
          dwt              = "disabled";
          tap              = "enabled";
          natural_scroll   = "enabled";
          middle_emulation = "enabled";
      };
    };

    # Key binds
    modifier = "Mod4";

    bindkeysToCode = true;
    keybindings =
      let modifier = config.wayland.windowManager.sway.config.modifier;
    in lib.mkOptionDefault {
      # Basics
      "${modifier}+Shift+q" = "kill";
      "${modifier}+Shift+r" = "reload";
      "${modifier}+Shift+e" = "exec ${rofi-powermenu}";

      # Common shortcuts
      "${modifier}+b"       = "exec $web_browser";
      "${modifier}+n"       = "exec $file_manager";
      "${modifier}+Return"  = "exec $terminal";
      "${modifier}+m"       = "exec ${pkgs.bemoji}/bin/bemoji";

      # Settings related
      "${modifier}+Shift+b" = "exec ${pkgs.rofi-bluetooth}/bin/rofi-bluetooth";

      # Notification history
      "${modifier}+slash"   = "exec ~/.config/scripts/other/notification_history";

      # Menu
      "${modifier}+d"       = "exec ${config.default.commands.menu}";

      # Screenshots
      "${modifier}+s" = ''
        exec "${screenshot-whole} && ${screenshot-notify}"
      '';
      "${modifier}+Shift+s"      = ''
        exec "${screenshot-grab-area} && ${screenshot-notify}"
      '';
      "${modifier}+Shift+w" = ''
        exec "${screenshot-grab-window} && ${screenshot-notify}"
      '';

      # Media control
      "XF86AudioPlay"       = "exec ~/.config/scripts/other/playerctl play-pause";
      "XF86AudioPrev"       = "exec ~/.config/scripts/other/playerctl previous";
      "XF86AudioNext"       = "exec ~/.config/scripts/other/playerctl next";
      #"${modifier}+p"       = "exec ~/.config/scripts/other/playerctl play-pause";
      #"${modifier}+Shift+o" = "exec ~/.config/scripts/other/playerctl previous";
      #"${modifier}+Shift+i" = "exec ~/.config/scripts/other/playerctl next";
      #"${modifier}+u"       = "exec ~/.config/scripts/other/playerctl position 10-";
      #"${modifier}+i"       = "exec ~/.config/scripts/other/playerctl position 10+";

      # Password manager
      "${modifier}+Shift+P" = "exec ${config.default.commands.password_manager}";

      # Volume control
      "XF86AudioRaiseVolume"       = ''
        exec --no-startup-id ${volume-out} +1%'';
      "XF86AudioLowerVolume"       = ''
        exec --no-startup-id ${volume-out} -1%'';
      "XF86AudioMute"              = ''
        exec --no-startup-id ${volume-out} mute'';
      "Shift+XF86AudioRaiseVolume" = ''
        exec --no-startup-id ~/.config/scripts/smol/vol_in +5%'';
      "Shift+XF86AudioLowerVolume" = ''
        exec --no-startup-id ~/.config/scripts/smol/vol_in -5%'';
      "Shift+XF86AudioMute"        = ''
        exec --no-startup-id ~/.config/scripts/smol/vol_in mute'';
      "XF86AudioMicMute"           = ''
        exec --no-startup-id ~/.config/scripts/smol/vol_in mute'';

      # Audio device control
      "${modifier}+Shift+i" = "exec --no-startup-id ${rofi-source-select}";
      "${modifier}+Shift+o" = "exec --no-startup-id ${rofi-sink-select}";


      # Brightness control
      "XF86MonBrightnessUp"   = ''exec --no-startup-id ${backlight} up'';
      "XF86MonBrightnessDown" = ''exec --no-startup-id ${backlight} down'';
      "XF86Display"           = ''exec light -G|grep 0.00 && light -I || (light -O; light -S 0)'';

      # Additional Window controls
      #"${modifier}+0"        = ''workspace number 10'';
      #"${modifier}+Shift+0"  = ''move container to workspace number 10'';
    };

    bars = [];

    focus = {
      followMouse  = true; # breaks bitwarden, breaks my brain as well, turn it back!
      mouseWarping = true;  # wrap mouse
    };

    startup = [
      # unfuck gnome-keyring on nixOS
      #{ command = "configure-gtk"; }
      #{ command = "${pkgs.gnome.gnome-keyring}/bin/gnome-keyring-daemon --replace -d --components=pkcs11,secrets,ssh"; }
      #{ command = "lxsession"; }
    ];
  };
  extraConfigEarly = ''
    exec ${pkgs.systemd}/bin/systemctl --user import-environment
    #exec dbus-sway-environment
    exec ${pkgs.xorg.xhost}/bin/xhost +
  '';
  extraSessionCommands = ''
    [ -f "${config.home.profileDirectory}/etc/profile.d/hm-session-vars.sh" ] && . "${config.home.profileDirectory}/etc/profile.d/hm-session-vars.sh"
  '';
}
