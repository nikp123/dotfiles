{ pkgs, config, ... }: let
  cut         = "${pkgs.coreutils}/bin/cut";

  colors = pkgs.writeText "rofi-colors"
    config.programs.rofi.powermenu.colors;

  theme = pkgs.writeText "rofi-theme" ''
    configuration {
       show-icons: false;
       drun-display-format: "{name}";
       disable-history: true;
       click-to-exit: true;
       location: 0;
    }

    @import "${colors}"
    * {
       font: "Font Awesome 6 Free 16";
    }

    window {
       transparency: "real";
       background-color: @base;
       text-color: @text;
       border: 3px;
       border-color: @mauve;
       border-radius: 11px;
       width: 480px;
    }

    listview {
       background-color: @base;
       columns: 6;
       lines: 1;
       spacing: 16px;
       cycle: false;
       dynamic: true;
       layout: vertical;
    }

    mainbox {
       background-color: @base;
       children: [ listview ];
       spacing: 16px;
       padding: 16px;
    }

    element {
       background-color: @base;
       text-color: @text;
       orientation: horizontal;
       border-radius: 8px;
       padding: 16px;
    }

    element-icon {
       background-color: inherit;
       text-color: inherit;
       horizontal-align: 0.5;
       vertical-align: 0.5;
    }

    element-text {
       background-color: inherit;
       text-color: inherit;
       expand: true;
       horizontal-align: 0.5;
       vertical-align: 0.5;
    }

    element selected {
       background-color: @mauve;
       text-color: @base;
    }
  '';

  rofi = "${config.programs.rofi.package}/bin/rofi -theme ${theme}";

  script = pkgs.writeShellScript "rofi-powermenu" ''
    shutdown=""
    reboot=""
    lock=""
    hibernate=""
    suspend=""
    logout=""

    options="$lock\n$suspend\n$logout\n$hibernate\n$reboot\n$shutdown"

    case "$(echo -e "$options" | ${rofi} -dmenu -selected-row 0)" in
      $shutdown)
        systemctl poweroff
        ;;
      $reboot)
        systemctl reboot
        ;;
      $hibernate)
        systemctl hibernate
        ;;
      $lock)
        loginctl lock-session
        ;;
      $suspend)
        systemctl suspend-then-hibernate
        if [ $? -ne 0 ]; then
          # if the system doenst support hybridsleep then dont
          systemctl suspend
        fi
        ;;
      $logout)
        #hyprctl dispatch exit
        swaymsg exit
        ;;
    esac
  '';
in
  script
