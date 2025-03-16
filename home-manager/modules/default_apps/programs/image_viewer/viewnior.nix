{ pkgs, lib, config, ... }:
with lib;
let
  name    = "viewnior";
  package = pkgs.viewnior;
  type    = "image_viewer";
  cfg     = config.defaultapp."${type}";
in mkIf (cfg == "${name}") {
  # XDG
  xdg.defaultMimeGroup."${type}" = "${name}.desktop";

  home.packages = [ package ];
}
