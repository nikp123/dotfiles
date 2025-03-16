{ pkgs, lib, config, ... }:
with lib;
let
  name    = "xarchiver";
  package = pkgs.xarchiver;
  type    = "file_archiver";
  xdg     = "${name}.desktop";
  cfg     = config.defaultapp."${type}";
in mkIf (cfg == "${name}") {
  # XDG
  xdg.defaultMimeGroup."${type}" = "${xdg}";

  home.packages = [ package ];
}
