{ pkgs }: {
  gtk.cursorTheme = {
    name = "capitaine-cursors-white";
    package = pkgs.capitaine-cursors;
  };
  wayland.windowManager.sway.config.seat."seat0" = {
    xcursor_theme = "capitaine-cursors-white 24";
  };
}
