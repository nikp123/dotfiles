{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.defaultapp.web_browser;
in mkIf (cfg == "firefox") {
  # XDG
  xdg.defaultMimeGroup.web_browser = "firefox.desktop";

  # SwayWM
  wayland.windowManager.sway.extraConfigEarly = ''
    set $web_browser ${pkgs.firefox}/bin/firefox
  '';
}
