{ pkgs, ... }: {
  home.packages = with pkgs; [
    numix-icon-theme
  ];

  services.dunst = {
    iconTheme = {
      name = "Numix";
      package = pkgs.numix-icon-theme;
    };
    settings.global.icon_theme = "Numix";
  };

  gtk.iconTheme = {
    name = "Numix-Circle";
    package = pkgs.numix-icon-theme-circle;
  };
}
