{ pkgs, home, ... }: let
  script = pkgs.writeShellScript "session-variables" ''
    ${home.profileDirectory}/etc/profile.d/hm-session-vars.sh
  '';
in
  script
