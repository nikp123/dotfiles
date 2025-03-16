{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.services.polkit-gnome;
in {
  options.services.polkit-gnome = {
    enable = mkEnableOption
      "Enables a polkit daemon";

    systemdTarget = mkOption {
      type = types.str;
      default = "graphical-session.target";
      description = "Change systemd target of this service";
    };
  };

  config = mkIf cfg.enable {
    systemd.user.services.polkit-gnome = {
      Unit = {
        Description = "GNOME Polkit authentication agent";
        Documentation = "https://gitlab.freedesktop.org/polkit/polkit/";
        After = [ "graphical-session-pre.target" ];
        PartOf = [ "graphical-session.target" ];
      };

      Service = {
        # In case you do not use NixOS
        #Environment = ''
        #  "LD_PRELOAD=/usr/lib/libpolkit-agent-1.so"
        #'';

        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "always";

        # Hangs the service when run, avoid it.
        #BusName = "org.freedesktop.PolicyKit1.Authority";
      };

      Install.WantedBy = [ cfg.systemdTarget ];
    };
  };

  meta.maintainers = with maintainers; [ nikp123 ];
}

