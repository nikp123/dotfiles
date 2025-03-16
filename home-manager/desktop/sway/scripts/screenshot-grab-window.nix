{ pkgs, ... }: let
  swaymsg = "${pkgs.sway}/bin/swaymsg";
  jq      = "${pkgs.jq}/bin/jq";
  slurp   = "${pkgs.slurp}/bin/slurp";
  grim    = "${pkgs.grim}/bin/grim";
  wl-copy = "${pkgs.wl-clipboard}/bin/wl-copy";
  magick  = "${pkgs.imagemagick}/bin/magick";
  imv       = "${pkgs.imv}/bin/imv";
  imv-msg   = "${pkgs.imv}/bin/imv-msg";

  script = pkgs.writeShellScript "screenshot-grab-window" ''
    # Make IMV fullscreen by default
    ${swaymsg} -- for_window '[title="^frz$"]' fullscreen toggle global

    # Create a temporary path to store screenshot
    sc="$(mktemp)"

    # Grab screenshot and display it over the entire screen
    ${grim} -l 0 "$sc"
    ${imv} -w frz "$sc" &
    # Keep note of the IMV processes's PID so we can kill it when we need to
    pid="$!"

    # Grab a list of windows in the current workspace and return the list of 
    # said windows (positions and sizes) to slurp so we can select the ones we
    # want
    slurp_output=$(${swaymsg} -t get_tree | ${jq} -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' | ${slurp})

    # Change the formatting to work with Imagemagick
    size=$(echo $slurp_output | cut -d' ' -f2)
    xoff=$(echo $slurp_output | cut -d',' -f1 | cut -d' ' -f1)
    yoff=$(echo $slurp_output | cut -d',' -f2 | cut -d' ' -f1)
    magick_crop="$size+$xoff+$yoff"

    # Kill the process
    ${imv-msg} $pid quit

    # Crop the temporary image and put it in the paste buffer
    ${magick} "$sc" -crop $size+$xoff+$yoff +repage PNG:- | ${wl-copy} -t image/png

    # Remove the temporary screenshot
    rm -f "$sc"
  '';
in
  script
