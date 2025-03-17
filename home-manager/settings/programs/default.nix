{ pkgs, ... }: {
  imports = [
    ./dotnet.nix
    ./fish.nix
    ./gnupg.nix
    ./matlab.nix
    ./octave.nix
    ./ssh.nix
    ./rofi.nix
    #./vscode
    ./waybar
    ./wine.nix
  ];
  programs = {
    # Gaming
    mangohud            = import ./mangohud.nix;
    obs-studio.enable   = true;

    direnv    = {
      enable = true;
      nix-direnv.enable = true;
    };

    nix-index.enable = false;

    # Mail
    thunderbird = import ./thunderbird.nix;

    # Documents
    zathura   = import ./zathura.nix;

    # Bitwarden
    rbw       = import ./rbw.nix { inherit pkgs; };

    # shell
    #atuin     = import ./atuin.nix;
    #htop      = import ./htop.nix; # dont manage, nixOS aint good for this

    # dev
    git       = import ./git.nix;
    helix     = import ./helix.nix { inherit pkgs; };

    # other
    mpv       = import ./mpv.nix { inherit pkgs; };
    topgrade  = import ./topgrade.nix;

    # Terminal emulator
    foot      = import ./foot.nix;
  };
}

