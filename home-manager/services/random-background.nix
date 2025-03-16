{ pkgs, ... }: let
  wallpaper_dir = "~/Pictures/Wallpaper";
  swaybg = pkgs.swaybg;
  find   = pkgs.findutils;
  utils  = pkgs.coreutils-full;
  script = pkgs.writeScript "background-script" ''
    #!${pkgs.stdenv.shell}
    set -m
    image="$(${find}/bin/find ${wallpaper_dir} -type f | ${utils}/bin/shuf -n 1)"
    echo $image
    ${swaybg}/bin/swaybg -o \* -i "$image" -m fill &
  '';
in {
  systemd.user = {
    services.random-background = {
      Unit = {
        Description = "Selects random background for SwayBG";
        After = [ "sway-session.target" ];

        # stfu process
        StartLimitBurst       = "0";
      };
      Install.WantedBy = [ "sway-session.target" ];
      Service = {
        ExecStart           = "${script}";
        IOSchedulingClass   = "idle";
        Type                = "forking";
        Restart             = "on-failure";
        RestartSec          = 1;
        RuntimeMaxSec       = "1h";
      };
    };
  };
}
