{ pkgs, ... }: {
  # This is due to it starting too early and crashing due to the lack of Xwayland
  systemd.user.services."pasystray".Service = {
    Restart      = "on-failure";
    RestartSec   = "1s";
  };
}
