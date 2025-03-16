{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.services.udiskie;
in {
  options.services.udiskie = {
    systemdTarget = mkOption {
      type = types.str;
      default = "graphical-session.target";
    };
  };

  config = mkIf cfg.enable {
    systemd.user.services.udiskie = {
      Unit.PartOf = [ "graphical-session.target" ];
      Install.WantedBy = [ cfg.systemdTarget ];
    };
  };

  meta.maintainers = with maintainers; [ nikp123 ];
}

