{ pkgs, lib, config, ... }:
with lib;
let
  name    = "rofi";
  package = config.programs.rofi.package;
  type    = "menu";
  xdg     = "${name}.desktop";
  cfg     = config.defaultapp."${type}";

  thing = pkgs.writeShellScript "rofi-wrapped" ''
    # Load environment variables first u bitch then load the program
    . "${config.xdg.stateHome}/nix/profile/etc/profile.d/hm-session-vars.sh"
    
    /usr/bin/rofi -show-icons -show combi
  ''; 
in mkIf (cfg == "${name}") {
  # Do this on NixOS and change the program paths
  #programs.rofi.enable = true;

  # On Home-Manager only you have to launch the launcher from the host OS
  # The nixpkgs rofi breaks flatpak apps for some weird reason

  default.commands.menu = toString thing;

  wayland.windowManager.sway.extraConfig = ''
    set $menu ${toString thing}
  '';
}
