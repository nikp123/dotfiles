{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.services.swaync;

  pkg = pkgs.swaynotificationcenter;
in {
  options.services.swaync = {
    enable = mkEnableOption
      "Enables the SwayNC notification daemon";

    systemdTarget = mkOption {
      type = types.str;
      default = "graphical-session.target";
      description = "Change systemd target of this service";
    };
  };

  config = mkIf cfg.enable {
    # Doesn't work without
    home.packages = [ pkg ];

    systemd.user.services.swaync = {
      Unit = {
        Description = "Sway Notification Center";
        PartOf = [ "graphical-session.target" ];
      };
      Install.WantedBy = [ cfg.systemdTarget ];
      Service = {
        ExecStartPre = "${pkgs.coreutils}/bin/sleep 2";
        ExecStart    = "${pkg}/bin/swaync -c ~/.config/swaync/config.json -s ~/.config/swaync/style.css";
        Restart      = "always";
        RestartSec   = 1;
      };
    };
  };

  meta.maintainers = with maintainers; [ nikp123 ];
}

