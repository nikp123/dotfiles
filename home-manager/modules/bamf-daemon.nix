{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.services.bamf;

  pkg = pkgs.bamf;
in {
  options.services.bamf = {
    enable = mkEnableOption
      "Enables the BAMF daemon";
  };

  config = mkIf cfg.enable {
    systemd.user.services.bamf-daemon = {
      Unit = {
        Description = "BAMF daemon";
        PartOf = [ "graphical-session.target" ];
      };
      Install = {
        RequiredBy = [ "plank.service" ];
      };
      Service = {
        ExecStart    = "${pkg}/libexec/bamf/bamfdaemon";
        Restart      = "always";
        RestartSec   = 1;
      };
    };
  };

  meta.maintainers = with maintainers; [ nikp123 ];
}

