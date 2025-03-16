{ pkgs, ... }: let
  #vscode_skript = pkgs.writeScriptBin "kod" ''
  #  #!/usr/bin/env sh
  #  options=$(${pkgs.findutils}/bin/find /etc/nixos/shells/ -maxdepth 1 -type d)
  #  options=$(echo -e $options|${pkgs.gnused}/bin/sed -e 's/\/etc\/nixos\/shells\///g;s/.nix//g')
  #  selected=$(echo -e $options | ${pkgs.rofi}/bin/rofi -dmenu -i)

  #  ${pkgs.dev}/bin/dev $selected -c code
  #'';
in {
  #xdg = {
  #  desktopEntries = {
  #    code = {
  #      name = "Kod";
  #      icon = "vscode";
  #      genericName = "microshaft's code editor";
  #      exec = "${vscode_skript}/bin/kod %U";
  #      terminal = false;
  #      categories = [ "Development" ];
  #    };
  #  };
  #};

  programs.vscode = import ./settings.nix { pkgs = pkgs; };
}
