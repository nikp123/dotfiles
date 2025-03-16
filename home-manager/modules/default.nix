{ ... }: {
  imports = [
    ./bamf-daemon.nix
    ./default_apps
    ./global_options.nix
    ./gvfs.nix
    ./rbw.nix
    ./polkit.nix # really streching it here
    ./plank.nix
    ./rofi.nix
    ./swww.nix
    ./udiskie.nix
    ./wayland.nix
    ./wine.nix
  ];
}
