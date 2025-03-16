{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.wine;
in {
  options.programs.wine = {
    enable = mkEnableOption
      "Enable wine";

    package = mkOption {
      type = types.package;
      default = pkgs.wineWowPackages.full;
      description = ''
        Set the plank package
      '';
    };
  };

  config.programs.wine.package = mkIf (config.wayland.enable)
    pkgs.wineWowPackages.waylandFull;

  config.home.packages = with pkgs;
    mkIf (cfg.enable)
        ([ cfg.package ]);

  meta.maintainers = with maintainers; [ nikp123 ];
}

