{ pkgs, ... }: let
  #light       = "light";
  light       = "${pkgs.light}/bin/light";
  cut         = "${pkgs.coreutils}/bin/cut";
  notify-send = "${pkgs.libnotify}/bin/notify-send";

  script = pkgs.writeShellScript "backlight" ''
    case "$1" in
      "up")
        ${light} -T 1.1
        ;;
      "down")
        ${light} -T 0.9
        ;;
      *)
        exit 1
        ;;
    esac
    
    brightness=$(${light} -G | ${cut} -d'.' -f1)
    
    icon="notification-display-brightness"
    
    case $(( $brightness / 25 )) in
      0) icon="$icon-off";;
      1) icon="$icon-low";;
      2) icon="$icon-medium";;
      3) icon="$icon-high";;
      4) icon="$icon-full";;
    esac
    
    ${notify-send} -t 10000 -e -r 7 -a brightness -u low -i "$icon" -h int:value:$brightness "Brightness $brightness%"
  '';
in
  script
