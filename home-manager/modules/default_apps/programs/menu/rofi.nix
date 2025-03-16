{ pkgs, lib, config, ... }:
with lib;
let
  name    = "rofi";
  package = config.programs.rofi.package;
  type    = "menu";
  xdg     = "${name}.desktop";
  cfg     = config.defaultapp."${type}";
in mkIf (cfg == "${name}") {
  programs.rofi.enable = true;

  default.commands.menu = ''
    ${package}/bin/rofi -show-icons -show combi
  '';
  wayland.windowManager.sway.extraConfig = ''
    set $menu ${package}/bin/rofi -show-icons -show combi
  '';
}
