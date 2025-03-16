{ pkgs, lib, config, ... }:
with lib;
let
  name    = "engrampa";
  package = pkgs.mate.engrampa;
  type    = "file_archiver";
  xdg     = "engrampa.desktop";
  cfg     = config.defaultapp."${type}";
in mkIf (cfg == "${name}") {
  # XDG
  xdg.defaultMimeGroup."${type}" = "${xdg}";

  home.packages = [ package ];
}
