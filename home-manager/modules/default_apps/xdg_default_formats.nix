{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.xdg.defaultMimeGroup;
in {
  options.xdg.defaultMimeGroup = {
    audio_player = mkOption {
      type = types.str;
      default = "";
      description = "Sets default MimeTypes for audio playing tasks";
    };

    file_archiver = mkOption {
      type = types.str;
      default = "";
      description = "Sets default MimeTypes for file archiving tasks";
    };

    file_manager = mkOption {
      type = types.str;
      default = "";
      description = "Sets default MimeTypes for file managing tasks";
    };

    image_viewer = mkOption {
      type = types.str;
      default = "";
      description = "Sets default MimeTypes for image browsing tasks";
    };

    office = mkOption {
      type = types.str;
      default = "";
      description = "Sets default MimeTypes for office tasks";
    };

    pdf_viewer = mkOption {
      type = types.str;
      default = "";
      description = "Sets default MimeTypes for PDF viewing";
    };

    text_editor = mkOption {
      type = types.str;
      default = "";
      description = "Sets default MimeTypes for text editing";
    };

    torrent = mkOption {
      type = types.str;
      default = "";
      description = "Sets default MimeTypes for Totally Legit Downloads(TM) software";
    };

    web_browser = mkOption {
      type = types.str;
      default = "";
      description = "Sets default MimeTypes for web browser related tasks";
    };
  };

  config.xdg.mimeApps = let
    associations = {
      "audio/x-opus+ogg"            = "${cfg.audio_player}";
      "audio/mpeg"                  = "${cfg.audio_player}";
      "application/zip"             = "${cfg.file_archiver}";
      "application/x-7z-compressed" = "${cfg.file_archiver}";
      "application/x-xz"            = "${cfg.file_archiver}";
      "application/x-xar"           = "${cfg.file_archiver}";
      "application/x-tzo"           = "${cfg.file_archiver}";
      "application/x-tarz"          = "${cfg.file_archiver}";
      "application/x-rpm"           = "${cfg.file_archiver}";
      "application/vnd.rar"         = "${cfg.file_archiver}";
      "application/x-lzop"          = "${cfg.file_archiver}";
      "application/x-lzma"          = "${cfg.file_archiver}";
      "application/x-tar"           = "${cfg.file_archiver}";
      "application/x-cpio"          = "${cfg.file_archiver}";
      "application/x-compress"      = "${cfg.file_archiver}";
      "application/gzip"            = "${cfg.file_archiver}";
      "application/x-bzip"          = "${cfg.file_archiver}";
      "inode/directory"             = "${cfg.file_manager}";
      "x-directory/normal"          = "${cfg.file_manager}";
      "image/png"                   = "${cfg.image_viewer}";
      "image/gif"                   = "${cfg.image_viewer}";
      "image/jpeg"                  = "${cfg.image_viewer}";
      "image/jpx"                   = "${cfg.image_viewer}";
      "image/jp2"                   = "${cfg.image_viewer}";
      "image/tiff"                  = "${cfg.image_viewer}";
      "image/webp"                  = "${cfg.image_viewer}";
      "image/bmp"                   = "${cfg.image_viewer}";
      "image/x-portable-bitmap"     = "${cfg.image_viewer}";
      "image/x-portable-graymap"    = "${cfg.image_viewer}";
      "image/x-portable-pixmap"     = "${cfg.image_viewer}";
      "image/vnd.microsoft.icon"    = "${cfg.image_viewer}";
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document"   = "${cfg.office}";
      "application/vnd.oasis.opendocument.text"                                   = "${cfg.office}";
      "application/vnd.openxmlformats-officedocument.presentationml.presentation" = "${cfg.office}";
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"         = "${cfg.office}";
      "application/pdf"               = "${cfg.pdf_viewer}";
      "text/x-csrc"                   = "${cfg.text_editor}";
      "text/x-tex"                    = "${cfg.text_editor}";
      "text/x-makefile"               = "${cfg.text_editor}";
      "text/plain"                    = "${cfg.text_editor}";
      "application/x-shellscript"     = "${cfg.text_editor}";
      "application/xml"               = "${cfg.text_editor}";
      "application/x-bittorrent"      = "${cfg.torrent}";
      "text/html"                     = "${cfg.web_browser}";
      "x-scheme-handler/http"         = "${cfg.web_browser}";
      "x-scheme-handler/https"        = "${cfg.web_browser}";
      "x-scheme-handler/chrome"       = "${cfg.web_browser}";
      "x-scheme-handler/about"        = "${cfg.web_browser}";
      "x-scheme-handler/unknown"      = "${cfg.web_browser}";
      "application/x-extension-htm"   = "${cfg.web_browser}";
      "application/x-extension-html"  = "${cfg.web_browser}";
      "application/x-extension-shtml" = "${cfg.web_browser}";
      "application/xhtml+xml"         = "${cfg.web_browser}";
      "application/x-extension-xhtml" = "${cfg.web_browser}";
      "application/x-extension-xht"   = "${cfg.web_browser}";
    };
  in {
    defaultApplications = associations;
    associations.added  = associations;
  };

  meta.maintainers = with maintainers; [ nikp123 ];
}

