{ config, pkgs, ... }: {
  services.plank = {
    enable = true;
    activation = "xfce";
    package = with pkgs; (buildEnv {
      name = "plank-with-themes";
      paths = with pkgs; [
        plank
        nikpkgs.plank-themes
      ];
    });
  };

  # Configure the theme
  home.file."plank-themes" = {
    source    = ./programs/plank/themes;
    target    = "${config.xdg.dataHome}/plank/themes";
  };
  # Apply it automatically
  dconf.settings."net/launchpad/plank/docks/dock1".theme = "Capeos";
}
