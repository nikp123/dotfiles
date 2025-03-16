{ pkgs, config, ... }: {

  home.packages = with pkgs; [
    fira
    fira-code
  ];

  gtk = {
    enable = true;
    font = {
      name = "Fira Sans";
      size = 10;
      package = pkgs.fira;
    };
    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
  };
  home.sessionVariables = {
    "GTK2_RC_FILES" = "${config.xdg.configHome}/gtk-2.0/gtkrc";
  };
}
