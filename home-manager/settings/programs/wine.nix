{ config, ... }: let
  wineprefix_root = "${config.xdg.dataHome}/wineprefixes";
in {
  #home.sessionVariables = {
  #  WINEPREFIX = "${wineprefix_root}/default";
  #};

  #programs.wine.enable = false;

  #xdg.mimeApps.defaultApplications = {
  #  "application/x-ms-dos-executable" = "wine.desktop";
  #};
}
