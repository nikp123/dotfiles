{ pkgs, ... }: {
  imports = [
    ./swaync
    ./swayidle.nix
  ];
  services = {
    dunst         = import ./dunst.nix;
    gnome-keyring = import ./gnome-keyring.nix;
    gpg-agent     = import ./gpg-agent.nix { inherit pkgs; };
    gvfs.enable   = true;
    picom         = import ./picom.nix;
    udiskie       = import ./udiskie.nix;
    wlsunset      = import ./wlsunset.nix;
  };
}
