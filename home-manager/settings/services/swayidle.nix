{ pkgs, lib, ... }: let
  awk       = "${pkgs.gawk}/bin/awk";
  cat       = "${pkgs.coreutils-full}/bin/cat";
  dbus-send = "${pkgs.dbus}/bin/dbus-send";
  dm-tool-patched = pkgs.writeScript "dm-tool-check-for-lock" ''
    #is_locked=$(${dbus-send} --print-reply=literal \
    #             --system \
    #             --dest=org.freedesktop.login1 \
    #             --print-reply \
    #             /org/freedesktop/login1/session/self \
    #             org.freedesktop.DBus.Properties.Get \
    #             string:"org.freedesktop.login1.Session" \
    #             string:"LockedHint" | ${awk} '{ print $3 }')

    # "true" or "false"
  
    # Instead of reinventing the moon, we will go for the tried and true method
    # of just not giving a fuck
    is_locked=$(${cat} /sys/class/tty/tty0/active)

    if [ "$is_locked" = "tty8" ]; then
      ${pkgs.lightdm}/bin/dm-tool lock
    fi
  '';

  lol = pkgs.writeScript "aaaaaaaaaaaa" ''
    #export PATH=/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin
    export XDG_CURRENT_DESKTOP=sway
    /usr/bin/swaylock-fancy
  '';
in {
  services.swayidle = {
    events = [
      {
        event         = "after-resume";
        command       = "${pkgs.sway}/bin/swaymsg output \\* dpms on";
      }
      #{
      #  event         = "lock";
      #  command       = "${dm-tool-patched}";
      #}
      {
        event         = "lock";
        command       = "${lol}";
      }
      {
        event         = "before-sleep";
        command       = "${pkgs.systemd}/bin/loginctl lock-session";
      }
    ];
    timeouts = [
      {
        timeout       = 300;
        command       = "${pkgs.sway}/bin/swaymsg output \\* dpms disable";
        resumeCommand = "${pkgs.sway}/bin/swaymsg output \\* dpms enable";
      }
    ];
  };

  # Required because of scripts
  systemd.user.services."swayidle" = {
    Install.WantedBy = lib.mkForce [];
  };
}
