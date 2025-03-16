{ pkgs, lib, config, ... }:
with lib;
let
  name    = "swaync";
  package = pkgs.swaynotificationcenter;
  type    = "notification_daemon";
  cfg     = config.defaultapp."${type}";
in mkIf (cfg == "${name}") {
  services.swaync.enable = true;
}
