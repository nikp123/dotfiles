{ pkgs, lib, config, ... }:
with lib;
let
  name    = "file-roller";
  package = pkgs.gnome.file-roller;
  type    = "file_archiver";
  xdg     = "org.gnome.FileRoller.desktop";
  cfg     = config.defaultapp."${type}";
in mkIf (cfg == "${name}") {
  # XDG
  xdg.defaultMimeGroup."${type}" = "${xdg}";

  home.packages = [ package ];
}
