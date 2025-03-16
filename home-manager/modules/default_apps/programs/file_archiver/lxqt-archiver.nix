{ pkgs, lib, config, ... }:
with lib;
let
  name    = "lxqt-archiver";
  package = pkgs.lxqt.lxqt-archiver;
  type    = "file_archiver";
  xdg     = "${name}.desktop";
  cfg     = config.defaultapp."${type}";
in mkIf (cfg == "${name}") {
  # XDG
  xdg.defaultMimeGroup."${type}" = "${xdg}";

  home.packages = [ package ];
}
