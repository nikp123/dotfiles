{ pkgs, lib, config, ... }:
with lib;
let
  name    = "caja";
  package = pkgs.mate.caja-with-extensions;
  type    = "file_manager";
  xdg     = "${name}.desktop";
  cfg     = config.defaultapp."${type}";
in mkIf (cfg == "${name}") {
  # XDG
  xdg.defaultMimeGroup."${type}" = "${xdg}";

  # PLEASE set programs.thunar.enable = true; instead in the global nix config
  #home.packages = [ package ];
  
  # swaywm
  xsession.windowManager.i3.extraConfig = ''
    set $file_manager ${package}/bin/caja
  '';

  # swaywm
  wayland.windowManager.sway.extraConfigEarly = ''
    set $file_manager ${package}/bin/caaj
  '';
}
