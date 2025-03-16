{ pkgs, lib, config, ... }:
with lib;
let
  name    = "foot";
  package = pkgs.foot;
  type    = "terminal";
  xdg     = "org.codeberg.dnkl.foot.desktop";
  cfg     = config.defaultapp."${type}";
in mkIf (cfg == "${name}") {
  programs.foot.enable = true;

  default.commands.terminal = "${package}/bin/foot";

  # swaywm
  wayland.windowManager.sway.extraConfigEarly = ''
    set $terminal ${package}/bin/foot
  '';
}
