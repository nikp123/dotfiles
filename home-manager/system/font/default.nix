{ pkgs, ... }: {
  # will allow home.packages fonts to be recognized by the system
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    roboto
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    jetbrains-mono
    fira
    fira-code
  ];
}
