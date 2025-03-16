{ pkgs, lib, config, ... }:
with lib;
let
  name    = "dunst";
  package = pkgs.dunst;
  type    = "notification_daemon";
  cfg     = config.defaultapp."${type}";
in mkIf (cfg == "${name}") {
  services.dunst.enable = true;
}
