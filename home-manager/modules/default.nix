{ ... }: {
  imports = [
    ./bamf-daemon.nix
    ./default_apps
    ./global_options.nix
    ./gvfs.nix
    ./rbw.nix
    ./plank.nix
    ./rofi.nix
    ./udiskie.nix
    ./wayland.nix
    ./wine.nix
  ];
}
