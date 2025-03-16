{ pkgs, ... }: let
  grim    = "${pkgs.grim}/bin/grim";
  wl-copy = "${pkgs.wl-clipboard}/bin/wl-copy";

  script = pkgs.writeShellScript "screenshot-grab-area" ''
    ${grim} - | ${wl-copy} -t image/png
  '';
in
  script
