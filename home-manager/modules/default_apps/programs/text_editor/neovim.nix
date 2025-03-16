{ pkgs, lib, config, ... }:
with lib;
let
  name    = "neovim";
  package = pkgs.neovim;
  type    = "text_editor";
  xdg     = "${name}.desktop";
  cfg     = config.defaultapp."${type}";

  neovim_script = pkgs.writeShellScript "neovim_script" ''
    ${pkgs.xfce.exo}/bin/exo-open --launch TerminalEmulator ${package}/bin/nvim $@
  '';
in mkIf (cfg == "${name}") {
  # XDG
  xdg.defaultMimeGroup."${type}" = "${xdg}";

  exo.defaultapp.enable = true;
  #programs.neovim.enable = true;

  xdg.desktopEntries.neovim = {
    name = "NeoVim";
    icon = "neovim";
    genericName = "neovim";
    exec = ''
      ${neovim_script} %U
    '';
    terminal = false;
    categories = [ "Development" ];
  };
}
