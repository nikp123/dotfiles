{ pkgs, lib, config, ... }: {
  xdg = {
    enable = true;

    userDirs = {
      enable = true;
      templates = "${config.home.homeDirectory}/Documents/Templates";
      # get that ugly shite out of my sight
      publicShare = "${config.home.homeDirectory}/Downloads";
      desktop     = "$HOME";
    };

    # Literally too much of a hassle to deal with
    mimeApps.enable = false;
  };
}
