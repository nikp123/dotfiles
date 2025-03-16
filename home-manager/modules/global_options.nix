{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.default.commands;
in {
  options.default.commands.terminal = mkOption {
    type = types.str;
    description = "Sets default terminal command needed to launch stuff";
  };
  options.default.commands.menu = mkOption {
    type = types.str;
    description = "Sets default menu command needed to launch stuff";
  };
  options.default.commands.password_manager = mkOption {
    type = types.str;
    description = "Sets default menu command needed to launch stuff";
  };
}
