{ pkgs, lib, config, ... }:
with lib;
let
  name    = "alacritty";
  package = pkgs.alacritty;
  type    = "terminal";
  xdg     = "alacritty.desktop";
  cfg     = config.defaultapp."${type}";
in mkIf (cfg == "${name}") {
  default.commands.terminal = "${package}/bin/alacritty";

  programs.alacritty.enable = true;

  # i3
  xsession.windowManager.i3.config.terminal =
    "${package}/bin/alacritty";

  # swaywm
  wayland.windowManager.sway.extraConfigEarly = ''
    set $terminal ${package}/bin/alacritty
  '';
}

