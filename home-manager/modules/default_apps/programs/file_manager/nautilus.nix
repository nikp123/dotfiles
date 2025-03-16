{ pkgs, lib, config, ... }:
with lib;
let
  name    = "nautilus";
  package = pkgs.gnome.nautilus;
  type    = "file_manager";
  xdg     = "org.gnome.Nautilus.desktop";
  cfg     = config.defaultapp."${type}";
in mkIf (cfg == "${name}") {
  # XDG
  xdg.defaultMimeGroup."${type}" = "${xdg}";

  home.packages = [ package ];
  
  xsession.windowManager.i3.extraConfig = ''
    set $file_manager ${package}/bin/nautilus
  '';

  # swaywm
  wayland.windowManager.sway.extraConfigEarly = ''
    set $file_manager ${package}/bin/nautilus
  '';
}

