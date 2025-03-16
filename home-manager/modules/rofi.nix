{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.rofi;
in {
  options.programs.rofi = {
    powermenu.colors = mkOption {
      type = types.lines;
    };
  };

  config.programs.rofi.package  = mkIf (cfg.enable && config.wayland.enable) pkgs.rofi-wayland;

  meta.maintainers = with maintainers; [ nikp123 ];
}

