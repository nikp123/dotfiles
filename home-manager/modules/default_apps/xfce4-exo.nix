{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.exo.defaultapp;
in {
  options.exo.defaultapp = {
    enable = mkEnableOption "Enable exo app management";
    TerminalEmulator = mkOption {
      type = types.str;
      default = "xfce4-terminal";
      description = "Sets default terminal emulator for use by xfce4";
    };
  };

  config.xdg.configFile."xfce4/helpers.rc" = mkIf cfg.enable {
    text = ''
      TerminalEmulator=${cfg.TerminalEmulator}
    '';
  };
}
