{ pkgs, ... }: {
  enable  = false;
  package = pkgs.eww-wayland;
  configDir = ../../custom_files/xdg_config/eww;
}
