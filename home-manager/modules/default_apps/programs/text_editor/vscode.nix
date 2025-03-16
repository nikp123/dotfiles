{ pkgs, lib, config, ... }:
with lib;
let
  name    = "vscode";
  package = pkgs.vscode;
  type    = "text_editor";
  xdg     = "${name}.desktop";  # FIXME
  cfg     = config.defaultapp."${type}";
in mkIf (cfg == "${name}") {
  # XDG
  xdg.defaultMimeGroup."${type}" = "${xdg}";

  home.packages = [ package ];
}
