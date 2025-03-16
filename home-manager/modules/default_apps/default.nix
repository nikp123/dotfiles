{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.defaultapp;
in {
  options.defaultapp = {
    audio_player = mkOption {
      type = types.enum [
        "audacious"
      ];
      description = "Sets default audio player";
    };

    file_archiver = mkOption {
      type = types.enum [
        "engrampa"
        "file-roller"
        "xarchiver"
        "lxqt-archiver"
      ];
      description = "Sets default file archiver";
    };

    file_manager = mkOption {
      type = types.enum [
        "caja"
        "nautilus"
        "pcmanfm"
        "thunar"
      ];
      description = "Sets default file manager";
    };

    image_viewer = mkOption {
      type = types.enum [
        "viewnior"
      ];
      default = "viewnior";
      description = "Sets default image viewer";
    };

    menu = mkOption {
      type = types.enum [
        "rofi"
        ""
      ];
      default = "";
      description = "Sets default menu application";
    };

    notification_daemon = mkOption {
      type = types.enum [
        "dunst"
        "swaync"
        ""
      ];
      default = "";
      description = "Sets the default notification daemon";
    };

    office = mkOption {
      type = types.enum [
        "onlyoffice"
      ];
      description = "Sets default office program";
    };

    password_manager = mkOption {
      type = types.enum [
        "rofi-rbw"
      ];
      description = "Sets default password manager";
    };

    pdf_viewer = mkOption {
      type = types.enum [
        "zathura"
      ];
      description = "Sets default pdf viewer";
    };

    terminal = mkOption {
      type = types.enum [
        # No, really, you need one.
        "alacritty"
        "foot"
        "xfce4-terminal"
      ];
      description = "Sets default terminal program";
    };

    text_editor = mkOption {
      type = types.enum [
        "neovim"
        "vscode"
      ];
      description = "Sets default text editor";
    };

    torrent = mkOption {
      type = types.enum [
        "transmission-gtk"
      ];
      description = "Sets default torrent program";
    };

    web_browser = mkOption {
      type = types.enum [
        "firefox"
      ];
      description = "Sets default web browser";
    };
  };

  imports = [
    ./xfce4-exo.nix
    ./xdg_default_formats.nix

    ./programs/audio_player/audacious.nix
    ./programs/file_archiver/engrampa.nix
    ./programs/file_archiver/file-roller.nix
    ./programs/file_archiver/lxqt-archiver.nix
    ./programs/file_archiver/xarchiver.nix
    ./programs/file_manager/caja.nix
    ./programs/file_manager/nautilus.nix
    ./programs/file_manager/pcmanfm.nix
    ./programs/file_manager/thunar.nix
    ./programs/image_viewer/viewnior.nix
    ./programs/menu/rofi.nix
    ./programs/notification_daemon/dunst.nix
    ./programs/notification_daemon/swaync.nix
    ./programs/office/onlyoffice.nix
    ./programs/password_manager/rofi-rbw.nix
    ./programs/pdf_viewer/zathura.nix
    ./programs/terminal/alacritty.nix
    ./programs/terminal/foot.nix
    ./programs/terminal/xfce4-terminal.nix
    ./programs/text_editor/neovim.nix
    ./programs/text_editor/vscode.nix
    ./programs/torrent/transmission-gtk.nix
    ./programs/web_browser/firefox.nix
  ];

  config.exo.defaultapp.enable = true;

  meta.maintainers = with maintainers; [ nikp123 ];
}

