{ pkgs, ... }: let
  hacksaw = "${pkgs.hacksaw}/bin/hacksaw";
  shotgun = "${pkgs.shotgun}/bin/shotgun";
  xclip   = "${pkgs.xclip}/bin/xclip";

  script = pkgs.writeShellScript "screenshot-whole" ''
    selection=$(${hacksaw} -f "-i %i -g %g")
    ${shotgun} $selection - | ${xclip} -t 'image/png' -selection clipboard
  '';
in
  script
