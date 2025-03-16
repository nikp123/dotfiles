{ pkgs, lib, config, ... }:
with lib;
let
  name    = "thunar";
  package = pkgs.xfce.thunar;
  type    = "file_manager";
  xdg     = "${name}.desktop";
  cfg     = config.defaultapp."${type}";
in mkIf (cfg == "${name}") {
  # XDG
  xdg.defaultMimeGroup."${type}" = "${xdg}";

  # PLEASE set programs.thunar.enable = true; instead in the global nix config
  #home.packages = [ package ];
  
  # i3
  xsession.windowManager.i3.extraConfig = ''
    set $file_manager ${package}/bin/Thunar
  '';

  # swaywm
  wayland.windowManager.sway.extraConfigEarly = ''
    set $file_manager ${package}/bin/Thunar
  '';
}
