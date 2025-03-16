{ pkgs, lib, config, ... }:
with lib;
let
  name    = "pcmanfm";
  package = pkgs.pcmanfm;
  type    = "file_manager";
  xdg     = "${name}.desktop";
  cfg     = config.defaultapp."${type}";
in mkIf (cfg == "${name}") {
  # XDG
  xdg.defaultMimeGroup."${type}" = "${xdg}";

  home.packages = [ package ];
  
  # i3
  xsession.windowManager.i3.extraConfig = ''
    set $file_manager ${package}/bin/pcmanfm --no-desktop --new-win
  '';

  # swaywm
  wayland.windowManager.sway.extraConfigEarly = ''
    set $file_manager ${package}/bin/pcmanfm --no-desktop --new-win
  '';
}
