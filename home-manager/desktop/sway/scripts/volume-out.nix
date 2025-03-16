{ pkgs, ... }: let
  pactl       = "${pkgs.pulseaudio}/bin/pactl";
  cut         = "${pkgs.coreutils}/bin/cut";
  tr          = "${pkgs.coreutils}/bin/tr";
  awk         = "${pkgs.gawk}/bin/awk";
  notify-send = "${pkgs.libnotify}/bin/notify-send";

  script = pkgs.writeShellScript "volume-out" ''
    if [ "$#" -lt 1 ]; then
       exit
    fi
    
    if [ "$1" = "mute" ]; then
       ${pactl} set-sink-mute @DEFAULT_SINK@ toggle
    else
       ${pactl} set-sink-volume @DEFAULT_SINK@ $1
    fi
    
    volume=$(${pactl} get-sink-volume @DEFAULT_SINK@ | ${awk} -F/ '{print $2}' | ${tr} -d ' %')
    muted=$(${pactl} get-sink-mute @DEFAULT_SINK@ | ${cut} -d' ' -f2)
    mute_str=""
    icon_name=""
    
    if [ "$muted" = "yes" ]; then
      mute_str=" (Muted)"
      icon_name="audio-volume-muted"
    else
      if [ $volume -eq 0 ]; then
        icon_name="audio-volume-muted"
      elif [ $volume -lt 26 ]; then
        icon_name="audio-volume-low-zero"
      elif [ $volume -lt 51 ]; then
        icon_name="audio-volume-low"
      elif [ $volume -lt 76 ]; then
        icon_name="audio-volume-medium"
      elif [ $volume -lt 101 ]; then
        icon_name="audio-volume-high"
      else
        icon_name="audio-volume-overamplified-symbolic"
      fi
    fi
    
    ${notify-send} -t 10000 -e -r 5 -a volume -u low -i "$icon_name" -h int:value:$volume "Volume $volume% $mute_str"
  '';
in
  script
