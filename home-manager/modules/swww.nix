{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.services.swww;

  pkg = pkgs.swww;
in {
  options.services.swww = {
    enable = mkEnableOption
      "Enables the SwayNC notification daemon";

    systemdTarget = mkOption {
      type = types.str;
      default = "sway-session.target";
      description = "Change systemd target of this service";
    };
  };

  config = mkIf cfg.enable {
    # Can't control without
    home.packages = [ pkg ];

    systemd.user.services.swww = {
      Unit = {
        Description = "A Solution to your Wayland Wallpaper Woes";
        PartOf = [ "graphical-session.target" ];
      };
      Install.WantedBy = [ cfg.systemdTarget ];
      Service = {
        ExecStartPre = ''
          ${pkgs.bash}/bin/bash -c "rm -f $XDG_RUNTIME_DIR/swww.socket"
        '';
        ExecStart    = "${pkg}/bin/swww-daemon";
        Restart      = "always";
        RestartSec   = 1;
      };
    };
  };

  meta.maintainers = with maintainers; [ nikp123 ];
}

