{ pkgs, lib, config, ... }:
with lib;
let
  name    = "rofi-rbw";
  package = pkgs.rofi-rbw;
  type    = "password_manager";
  cfg     = config.defaultapp."${type}";
in mkIf (cfg == "${name}") {
  programs.rofi.enable = true;

  # Needed to make rofi-rbw work
  home.packages = with pkgs; [
    # For clipboard management
    xsel
    xclip
    wl-clipboard

    # For typing
    xdotool

    package
  ];

  default.commands.password_manager = ''
    ${package}/bin/rofi-rbw
  '';
}
