{ pkgs, xdg, config, ... }: {
  systemd.user.services."tailscale-systray" = {
    Unit = {
      Description = "System tray for tailscale";
      After       = [
        "graphical-session.target"
      ];
    };
    Install.WantedBy = [ "graphical-session.target" ];
    Service = {
      ExecStart           = "${pkgs.nikpkgs.tailscale-systray}/bin/tailscale-systray";
      Restart             = "always";
      RestartSec          = 60;
    };
  };
}
