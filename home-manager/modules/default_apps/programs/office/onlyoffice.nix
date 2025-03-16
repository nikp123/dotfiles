{ pkgs, lib, config, ... }:
with lib;
let
  name    = "onlyoffice";
  package = pkgs.onlyoffice-bin;
  type    = "office";
  xdg     = "onlyoffice-desktopeditors.desktop";
  cfg     = config.defaultapp."${type}";
in mkIf (cfg == "${name}") {
  # XDG
  xdg.defaultMimeGroup."${type}" = "${xdg}";

  home.packages = [ package ];
}
