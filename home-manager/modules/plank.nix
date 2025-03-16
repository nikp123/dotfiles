{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.services.plank;
in {
  options.services.plank = {
    enable = mkEnableOption
      "Enables the Plank dock";

    package = mkOption {
      type = types.package;
      default = pkgs.plank;
      description = ''
        Set the plank package
      '';
    };

    activation = mkOption {
      type = types.enum [
        "systemd"
        "xfce"
      ];
      default = "systemd";
      description = ''
        How the service gets activated, ie.
        either as a systemdTarget service or
        as a xfce4 login item
      '';
    };

    xfce = mkEnableOption
      "Enables the xfce service";

    systemdTarget = mkOption {
      type = types.str;
      default = "graphical-session.target";
      description = "Change systemd target of this service";
    };
  };

  config = mkIf cfg.enable {
    # This is an **ABSOLUTE** must otherwise bugs
    services.bamf.enable = true;

    systemd.user.services.plank = {
      Unit = {
        Description = "Plank dock";
        PartOf = [ "graphical-session.target" ];
        After = [ "bamf-daemon.service" ];
        Requires = [ "bamf-daemon.service" ];
      };
      Service = {
        ExecStart    = "${cfg.package}/bin/plank";
        Restart      = "always";
        RestartSec   = 1;
      };
      Install = mkIf (cfg.activation == "systemd") {
        WantedBy = [ cfg.systemdTarget ];
      };
    };
    xdg.configFile."autostart/plank.desktop" = mkIf (cfg.activation == "xfce") {
      text = ''
        [Desktop Entry]
        Encoding=UTF-8
        Version=0.9.4
        Type=Application
        Name=plank
        Comment=
        Exec=systemctl --user start plank
        OnlyShowIn=XFCE;
        RunHook=0
        StartupNotify=false
        Terminal=false
        Hidden=false
      '';
    };
  };

  meta.maintainers = with maintainers; [ nikp123 ];
}

