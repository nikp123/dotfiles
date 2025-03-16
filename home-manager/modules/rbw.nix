{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.programs.rbw;
in {
  config = mkIf cfg.enable {
    home.packages = [ pkgs.wtype ];  # fixes a bug
  };

  meta.maintainers = with maintainers; [ nikp123 ];
}

