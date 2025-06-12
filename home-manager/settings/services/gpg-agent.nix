{ pkgs, ... }: {
  enable = true;
  pinentry.package = pkgs.pinentry-gnome3;
}
