{ pkgs, lib, config, ... }:
with lib;
let
  name    = "transmission-gtk";
  package = pkgs.transmission_4-gtk;
  type    = "torrent";
  xdg     = "${name}.desktop";
  cfg     = config.defaultapp."${type}";
in mkIf (cfg == "${name}") {
  # XDG
  xdg.defaultMimeGroup."${type}" = "${xdg}";

  home.packages = [ package ];
}
