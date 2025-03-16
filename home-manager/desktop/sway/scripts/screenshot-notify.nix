{ pkgs, ... }: let
  swappy       = "${pkgs.swappy}/bin/swappy";
  pngquant     = "${pkgs.pngquant}/bin/pngquant";
  wl-copy      = "${pkgs.wl-clipboard}/bin/wl-copy";
  wl-paste     = "${pkgs.wl-clipboard}/bin/wl-paste";
  xdg-user-dir = "${pkgs.xdg-user-dirs}/bin/xdg-user-dir";
  notify-send  = "${pkgs.libnotify}/bin/notify-send";

  script = pkgs.writeShellScript "screenshot-grab-window" ''
    # Add later
    #pw-play $(dirname $(readlink -f $(command -v $0)))/../data/cap.oga &

    function notify {
       action="$(${notify-send} -e -i camera-photo -A edit=Edit -A save=Save -t 5000 "Screenshot taken" 2>/dev/null)"
       case "$action" in
       edit)
          ${wl-paste} -t image/png | ${swappy} -f - -o - | ${pngquant} - | ${wl-copy} -t image/png
          ;;
       save)
          ${wl-paste} -t image/png >$(${xdg-user-dir} DESKTOP)/Screenshot_$(date +%Y-%m-%d_%H:%M:%S).png
          ;;
       esac
    }
    notify &
  '';
in script
