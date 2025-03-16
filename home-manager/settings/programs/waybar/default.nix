{ pkgs, ... }: {
  programs.waybar = {
    settings = {
      mainBar = import ./bars/mainBar.nix { inherit pkgs; };
    };
    #style = "./style.css";  # don't use, it's managed manually
    systemd.enable = true;
  };

  xdg.configFile."waybar-colours" = {
    source = ./colours;
    target = "waybar/colours";
    recursive = true;
  };

  xdg.configFile."waybar-style-css" = {
    text = (builtins.readFile ./style.css);
    target = "waybar/style.css";
  };
}
