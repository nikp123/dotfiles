{ pkgs, ... }: {
  home.packages = with pkgs; [
    nixos-install-tools
    nixos-rebuild
  ];

  imports = [
    ./allow-unfree.nix
    #./optimizations.nix
  ];
}
