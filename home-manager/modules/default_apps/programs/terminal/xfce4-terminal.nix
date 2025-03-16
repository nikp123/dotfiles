{ pkgs, lib, config, ... }:
with lib;
let
  name    = "xfce4-terminal";
  package = pkgs.xfce.xfce4-terminal;
  type    = "terminal";
  xdg     = "xfce4-terminal.desktop";
  cfg     = config.defaultapp."${type}";
in mkIf (cfg == "${name}") {
  default.commands.terminal = "${package}/bin/xfce4-terminal";

  # i3
  xsession.windowManager.i3.config.terminal =
    "${package}/bin/xfce4-terminal";

  # swaywm
  wayland.windowManager.sway.extraConfigEarly = ''
    set $terminal ${package}/bin/xfce4-terminal
  '';
}
