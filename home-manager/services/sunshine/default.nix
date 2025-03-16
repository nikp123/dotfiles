{ pkgs, ... }: {
  systemd.user = {
    services.sunshine = {
      Unit = {
        Description           = "Sunshine remote gaming thing";
        StartLimitIntervalSec = 500;
        StartLimitBurst       = 5;
      };
      Install.WantedBy = [ "graphical-session.target" ];
      Service = {
        ExecStart           = "${pkgs.flatpak}/bin/flatpak run --command=sunshine dev.lizardbyte.app.Sunshine";
        Restart             = "on-failure";
        RestartSec          = 5;
      };
    };
  };
}
