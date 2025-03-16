{ config, pkgs, ... }: let
  ssh_dir = "${ config.home.homeDirectory }/.ssh";
in {
  # Apparently not installed by default for some reason
  home.packages = with pkgs; [
    openssh
  ];

  programs.ssh = {
    enable = true;
    compression = true;
    forwardAgent = true;

    # Migrate keys to GNOME-keyring when available
    addKeysToAgent = "yes";
    extraOptionOverrides = {
      # Enable SSH-ing into old devices by default
      KexAlgorithms            = "+diffie-hellman-group1-sha1";
      PubkeyAcceptedAlgorithms = "+ssh-rsa";
      HostkeyAlgorithms        = "+ssh-rsa";
    };
    matchBlocks = {
      "GrazServer" = {
        identityFile = "${ssh_dir}/keys/home/id_ed25519";
        hostname = "graz.server.tailscale";
        user = "nikp123";
        port = 22000;
      };
      "NSServer" = {
        identityFile = "${ssh_dir}/keys/home/id_ed25519";
        hostname = "ns.server.tailscale";
        user = "nikp123";
        port = 22000;
      };
      "Povernetes" = {
        identityFile = "${ssh_dir}/keys/home/id_ed25519";
        hostname = "povernetes.server.tailscale";
        user = "nikp123";
        port = 22;
      };
      "SyncServer" = {
        identityFile = "${ssh_dir}/keys/sync/id_rsa";
        hostname = "ns.server.tailscale";
        user = "nikp123";
        port = 22001;
      };
      "HomeRouter" = {
        identityFile = "${ssh_dir}/keys/home/id_ed25519";
        hostname = "serverdoesnt.work";
        user = "root";
        port = 22200;
        extraOptions = {
          KexAlgorithms = "+diffie-hellman-group1-sha1";
          PubkeyAcceptedAlgorithms = "+ssh-rsa";
          HostkeyAlgorithms = "+ssh-rsa";
        };
      };
      "github.com" = {
        identityFile = "${ssh_dir}/keys/dev/id_ed25519";
        hostname = "github.com";
        user = "git";
      };

      "aur4.archlinux.org aur.archlinux.org" = {
        user = "aur";
        identitiesOnly = true;
        identityFile = "${ssh_dir}/keys/dev/id_ed25519";
      };
    };
  };
}
