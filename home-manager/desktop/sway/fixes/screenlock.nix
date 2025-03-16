{ pkgs, ... }: let
  swaylock-fancy-exe       = "${pkgs.swaylock-fancy}/bin/swaylock-fancy";
  systemd-lock-handler-exe = "${pkgs.nikpkgs.systemd-lock-handler}/bin/systemd-lock-handler";
in {
  systemd.user.services = {
    systemd-lock-handler = {
      Unit = {
        Description = "Lock handler for systemd";
        After = [ "graphical-session.target" ];

        # stfu process
        StartLimitBurst       = "0";
      };
      Install.WantedBy = [ "graphical-session.target" ];
      Service = {
        ExecStart           = systemd-lock-handler-exe;
        IOSchedulingClass   = "idle";
        Restart             = "on-failure";
        RestartSec          = 1;
      };
    };
    swaylock-fancy = {
      Unit = {
        Description = "Screen locker for Sway";
        After       = [ "lock.target" ];
        PartOf      = [ "lock.target" ];
        OnSuccess   = [ "unlock.target" ];
      };
      Service = {
        ExecStart           = "${swaylock-fancy-exe} --daemonize -d";
        Type                = "forking";
        Restart             = "on-failure";
        RestartSec          = 0;
      };
      Install.WantedBy = [
        "lock.target"
        "sleep.target"
      ];
    };
  };
}
