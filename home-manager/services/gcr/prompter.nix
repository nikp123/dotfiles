{ pkgs, ... }: {
  systemd.user = {
    services.gcr = {
      Unit.Description = "Activates GNOME's keyring auth dialog";
      Install.WantedBy = [ "graphical-session.target" ];
      Service = {
        ExecStart           = "${pkgs.gcr}/libexec/gcr-prompter";
        Restart             = "always";
        RestartSec          = 1;
      };
    };
  };
}
