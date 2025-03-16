{ pkgs, ... }: let
  pactl         = "${pkgs.pulseaudio}/bin/pactl";
  pavucontrol   = "${pkgs.pavucontrol}/bin/pavucontrol";
  swaymsg       = "${pkgs.sway}/bin/swaymsg";
  jq            = "${pkgs.jq}/bin/jq";
  cat           = "${pkgs.coreutils-full}/bin/cat";
  kanshictl     = "${pkgs.kanshi}/bin/kanshictl";
  swaync-client = "${pkgs.swaynotificationcenter}/bin/swaync-client";
  switch_displays = pkgs.writeShellScript "switch_displays" ''
    set -e

    check=$(${swaymsg} -t get_outputs -r | ${jq} -e -r 'map(select(.active == true)) | length')
    if [ $check -eq 1 ]; then
      ${kanshictl} switch full
    else
      ${kanshictl} switch single
    fi
  '';
  query_displays = pkgs.writeShellScript "query_displays" ''
    set -e

    # https://blog.dhampir.no/content/sleeping-without-a-subprocess-in-bash-and-how-to-sleep-forever
    snore() {
        local IFS
        [[ -n "''\${_snore_fd:-}" ]] || exec {_snore_fd}<> <(:)
        read -r ''\${1:+-t "$1"} -u $_snore_fd || :
    }

    DELAY=0.5
    
    while snore $DELAY; do
      count=$(${swaymsg} -t get_outputs -r | ${jq} -r 'map(select(.active == true)) | length')
      echo "{\"class\": \"$count\", \"alt\": \"$count\", \"text\": \"$count\", \"tooltip\": \"$count\"}"
    done
  '';

  cpufreq_script = pkgs.writeShellScript "cpufreq_script" ''
    set -e

    # https://blog.dhampir.no/content/sleeping-without-a-subprocess-in-bash-and-how-to-sleep-forever
    snore() {
        local IFS
        [[ -n "''\${_snore_fd:-}" ]] || exec {_snore_fd}<> <(:)
        read -r ''\${1:+-t "$1"} -u $_snore_fd || :
    }
    
    DELAY=0.5
    
    while snore $DELAY; do
      governor=$(cat /sys/devices/system/cpu/cpufreq/policy0/scaling_governor)
      echo "{\"class\": \"$governor\", \"alt\": \"$governor\", \"text\": \"$governor\", \"tooltip\": \"$governor\"}"
    done
  '';
  cpufreq_change_script = pkgs.writeShellScript "cpufreq_change_script" ''
    mode=$(${cat} /sys/devices/system/cpu/cpufreq/policy0/scaling_governor)
    if [ "$mode" == "conservative" ]; then
      /run/wrappers/bin/cpu-governor powersave
    elif [ "$mode" == "powersave" ]; then
      /run/wrappers/bin/cpu-governor performance
    else
      /run/wrappers/bin/cpu-governor conservative
    fi
  '';
in {
  layer     = "bottom";
  position  = "bottom";
  #"height"  = 30;
  #"width"   = 1280;
  spacing   = 0;


  modules-left = [
    "wlr/workspaces"
    "sway/workspaces"
  ];
  modules-center = [];
  modules-right = [
    "pulseaudio#out"
    "pulseaudio#in"
    "idle_inhibitor"
    "custom/cpufreq"
    "custom/display"
    "battery"
    "cpu"
    "memory"
    "sway/language"
    "clock"
    "tray"
    "custom/notification"
  ];

  cpu = {
    interval = 1;
    format   = "{usage:2}% ";
  };

  memory = {
    format    = "{percentage:2}% ";
    interval  = 5;
  };

  "wlr/workspaces" = {
    disable-scroll  = true;
    all-outputs     = false;
    sort-by-number  = true;
    format          = "{name}";
    on-click        = "activate";
    format-icons = {
      "urgent" = "ﭹ";
      "focused" = "ﭲ";
      "default" = "";
    };
  };

  idle_inhibitor = {
    format       = "{icon}";
    format-icons = {
      activated    = "";
      deactivated  = "";
    };
  };

  tray = {
    #"icon-size" = 8;
    spacing = 12;
  };

  clock = {
    #"timezone" = "America/New_York";
    #"tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
    format-alt  = "{:%Y-%m-%d  %H:%M}";
  };

  battery = {
    states = {
      good     = 70;
      warning  = 30;
      critical = 15;
    };
    format = "{capacity}% {time} {icon}";
    format-charging = "{capacity}% ";
    format-plugged = "NC ";
    format-time = "({H}:{m})";
    #"format-alt" = "{time} {icon}";
    #"format-good" = "";
    #"format-full" = "";
    format-icons = ["" "" "" "" ""];
  };

  "pulseaudio#out" = {
    format                  = "{icon}";
    format-muted            = "";
    format-bluetooth        = "{icon}";
    format-bluetooth-muted  = "";
    format-icons = {
      headphone     = "";
      #"hands-free" = "";
      headset       = "";
      phone         = "";
      portable      = "";
      car           = "";
      default       = [""];
    };
    on-click       = "${pactl} set-sink-mute @DEFAULT_SINK@ toggle";
    on-click-right = "${pavucontrol}";
    on-scroll-up   = "";
    on-scroll-down = "";
  };

  "pulseaudio#in" = {
    format                  = "{format_source}";
    format-bluetooth        = "{format_source}";
    format-bluetooth-muted  = "{format_source}";
    format-muted            = "{format_source}";
    format-source           = "";
    format-source-muted     = "";
    on-click                = "${pactl} set-source-mute @DEFAULT_SOURCE@ toggle";
    on-click-right          = "${pavucontrol}";
    on-scroll-up            = "";
    on-scroll-down          = "";
  };

  "custom/cpufreq" = {
    tooltip          = false;
    format           = "{icon}";
    return-type      = "json";
    format-icons  = {
      performance  = "🔥";
      conservative = "⚡︎";
      powersave    = "🐢";
    };
    exec-on-event  = true;
    exec           = "${cpufreq_script}";
    on-click       = "${cpufreq_change_script}";
  };

  "custom/display" = {
    tooltip = false;
    format = "{icon}";
    return-type      = "json";
    format-icons = {
      "2" = "";
      "1" = "";
    };
    exec-on-event  = true;
    exec = "${query_displays}";
    on-click  = "${switch_displays}";
  };

  "custom/notification" = {
    tooltip = false;
    format = "{icon}";
    format-icons = {
      #"notification"    = "";
      notification       = "";
      none               = "";
      #"dnd-notification" = "";
      dnd-notification   = "";
      dnd-none           = "";
    };
    return-type    = "json";
    exec-if        = "whereis ${swaync-client}";
    exec           = "${swaync-client} -swb";
    on-click       = "${swaync-client} -t -sw";
    on-click-right = "${swaync-client} -d -sw";
  };

  "sway/language" = {
    min-length = 2;
    yuuormat   = "{flag}";
    on-click   = "${swaymsg} input type:keyboard xkb_switch_layout next";
  };
}

