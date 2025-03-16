{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.wayland;
in {
  options.wayland.enable = mkEnableOption "Enable wayland optimizations";

  config.home.sessionVariables = mkIf cfg.enable {
    #MOZ_ENABLE_WAYLAND   = mkIf config.programs.firefox.enable "1";
    NIXOS_OZONE_WL       = "1";
    CLUTTER_BACKEND      = "wayland";
    # Overriding this causes shit to break, SOTP
    #QT_QPA_PLATFORM      = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    _JAVA_AWT_WM_NONREPARENTING  = "1";
  };

  meta.maintainers = with maintainers; [ nikp123 ];
}

