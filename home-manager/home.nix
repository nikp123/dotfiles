{ config, pkgs, flakes, ... }: {
  imports = [
    # Modules go first
    ./modules

    ./system/environment.nix
    ./system/gtk
    # Is the order that fucks with this?
    system/font/default.nix
    ./system/nix
    ./system/qt
    ./system/xdg
    ./system/theme/arc-dark.nix
    ./system/font/terminus.nix
    ./system/icons/numix.nix

    # non-nixOS services or those that are handled badly by home-manager
    services/unison.nix
    #services/sunshine
    # ... or that are completely ignored by anyone using nixOS
    #services/gcr/prompter.nix

    # import configurations specific for a certain desktop
    #desktop/i3
    desktop/sway
    #desktop/xfce4

    ./settings
  ];

  programs.home-manager.enable = true;

  home = {
    username = "nikp123";
    homeDirectory = "/home/nikp123";
    enableNixpkgsReleaseCheck = true;
    stateVersion = "22.11";
    packages = [ pkgs.nixgl.nixGLIntel ];
  };

  nixGL.packages = pkgs.nixgl;

  defaultapp = {
    audio_player = "audacious";
    web_browser  = "firefox";
    office       = "onlyoffice";
    pdf_viewer   = "zathura";
    text_editor  = "neovim";
    torrent      = "transmission-gtk";
  };
 
  # Ya need this on non-nixos
  targets.genericLinux.enable = true;
}
