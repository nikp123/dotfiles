{ pkgs, config, systemd-target, ... }: {
  enable = true;
  settings = {
    mainBar = import ./bars/mainBar.nix { inherit pkgs; };
  };
  #style = "./style.css";  # don't use, it's managed manually
  systemd.enable = true;
  systemd.target = systemd-target;
}
