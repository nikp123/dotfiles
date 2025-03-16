{ pkgs, lib, config, ... }:
with lib;
let
  name    = "zathura";
  package = pkgs.zathura;
  type    = "pdf_viewer";
  xdg     = "org.pwmt.zathura-pdf-mupdf.desktop";
  cfg     = config.defaultapp."${type}";
in mkIf (cfg == "${name}") {
  # XDG
  xdg.defaultMimeGroup."${type}" = "${xdg}";

  programs.zathura.enable = true;
}

