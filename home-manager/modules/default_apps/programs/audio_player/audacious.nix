{ pkgs, lib, config, ... }:
with lib;
let
  name    = "audacious";
  package = pkgs.audacious;
  type    = "audio_player";
  xdg     = "${name}.desktop";
  cfg     = config.defaultapp."${type}";
in mkIf (cfg == "${name}") {
  # XDG
  xdg.defaultMimeGroup."${type}" = "${xdg}";

  home.packages = [ package ];
}
