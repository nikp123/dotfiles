{ config, pkgs, lib, ... }: {
  enable = true;
  package = pkgs.i3-gaps;
  config = {
    floating.criteria = [
      {
        class = "Evolution";
      }
      {
        class = "XAVA";
      }
      {
        title = "Microsoft Teams Notification";
      }
      {
        class = "origin.exe";
      }
      {
        title = "Brightness control";
      }
    ];
    window.commands = [
      {
        command = "kill";
        criteria.title = "Steam - News.*";
      }
      {
        command = "kill";
        criteria = {
          title = "Friends List";
          class = "Steam";
        };
      }
    ];

    modifier = "Mod4";

    bars = [
      {
        #colors = {
        #  activeWorkspace = { background = "#ffffff"; border = "#ffffff"; text = "#ffffff"; };
        #  focusedWorkspace = { background = "#ffffff"; border = "#ffffff"; text = "#ffffff"; };
        #  inactiveWorkspace = { background = "#ffffff"; border = "#ffffff"; text = "#ffffff"; };
        #  urgentWorkspace = { background = "#ffffff"; border = "#ffffff"; text = "#ffffff"; };
        #  background = "#000000";
        #  statusline = "#000000";
        #  separator = "#000000";
        #};
        statusCommand = "i3status";
        fonts.size = 11.0;
        mode = "dock";
        position = "bottom";
      }
    ];

    keybindings = let
      modifier = "Mod4";
    in lib.mkOptionDefault {
      # Programs
      "${modifier}+b" = "exec firefox";
      "${modifier}+n" = "exec caja --no-desktop --browser /home/nikp123";

      # Rofi
      "${modifier}+d" = ''
        exec --no-startup-id "rofi -show combi -show-icons -combi-modi drun#run#ssh"'';

      # Toggle compositor
      #"${modifier}+g" = ''exec --no-startup-id sh -c "pidof picom && killall -9 picom || picom &"'';
      "${modifier}+g" = ''exec --no-startup-id sh -c "systemctl --user status picom | grep running && systemctl --user stop picom || systemctl --user start picom"'';

      # Screenshots
      "${modifier}+Shift+s" = ''
        exec shotgun -g $(slop) - | xclip -t image/png -selection clipboard'';
      "${modifier}+Shift+Ctrl++s" = ''
        exec shotgun -g $(slop)'';
      "Print --release" = ''
        exec shotgun -g $(slop) - | xclip -t image/png -selection clipboard'';
      "Print+Shift --release" = ''
        exec shotgun -g $(slop)'';

      # Media control
      "XF86AudioPlay"       = "exec ~/.config/scripts/other/playerctl play-pause";
      "XF86AudioPrev"       = "exec ~/.config/scripts/other/playerctl previous";
      "XF86AudioNext"       = "exec ~/.config/scripts/other/playerctl next";
      "${modifier}+p"       = "exec ~/.config/scripts/other/playerctl play-pause";
      "${modifier}+Shift+u" = "exec ~/.config/scripts/other/playerctl previous";
      "${modifier}+Shift+i" = "exec ~/.config/scripts/other/playerctl next";
      "${modifier}+u"       = "exec ~/.config/scripts/other/playerctl position 10-";
      "${modifier}+i"       = "exec ~/.config/scripts/other/playerctl position 10+";

      # Volume control
      "XF86AudioRaiseVolume"       = ''
        exec --no-startup-id ~/.config/scripts/smol/vol_out +5%'';
      "XF86AudioLowerVolume"       = ''
        exec --no-startup-id ~/.config/scripts/smol/vol_out -5%'';
      "XF86AudioMute"              = ''
        exec --no-startup-id ~/.config/scripts/smol/vol_out mute'';
      "Shift+XF86AudioRaiseVolume" = ''
        exec --no-startup-id ~/.config/scripts/smol/vol_in +5%'';
      "Shift+XF86AudioLowerVolume" = ''
        exec --no-startup-id ~/.config/scripts/smol/vol_in -5%'';
      "Shift+XF86AudioMute"        = ''
        exec --no-startup-id ~/.config/scripts/smol/vol_in mute'';
      "XF86AudioMicMute"           = ''
        exec --no-startup-id ~/.config/scripts/smol/vol_in mute'';

      # Settings related
      "${modifier}+Shift+b" = "exec ${pkgs.rofi-bluetooth}/bin/rofi-bluetooth";

      # Password manager
      "${modifier}+Shift+P" = "exec ${config.default.commands.password_manager}";

      # Brightness control
      "XF86MonBrightnessUp"   = ''exec --no-startup-id ~/.config/scripts/smol/sun up'';
      "XF86MonBrightnessDown" = ''exec --no-startup-id ~/.config/scripts/smol/sun down'';
      "XF86Display"           = ''exec light -G|grep 0.00 && light -I || (light -O; light -S 0)'';

      # Exit menu
      "${modifier}+Shift+e" = ''exec --no-startup-id ~/.config/i3/scripts/exit'';
    };

    startup = [
      {
        command = "~/.config/i3/scripts/onetime-services";
        always = false;
        notification = false;
      }
    ];

    window.border = 3;
  };
}
