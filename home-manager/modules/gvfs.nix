{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.services.gvfs;
in {
  options.services.gvfs = {
    enable = mkEnableOption
      "Enable GVFS support (via Home Manager)";

    # gvfs can be built with multiple configurations
    package = mkOption {
      type = types.package;
      default = pkgs.gnome.gvfs;
      defaultText = literalExpression "pkgs.gnome.gvfs";
      description = lib.mdDoc "Which GVfs package to use.";
    };
  };

  config = mkIf cfg.enable {
    systemd.user.services.gvfsd = {
      Unit = {
        Description = "GVFS service";
        After = [ "graphical-session-pre.target" ];
        PartOf = [ "graphical-session.target" ];
      };

      Service = {
        ExecStart = "${cfg.package}/libexec/gvfsd -r";
        Restart = "always";
      };

      Install.WantedBy = [ "graphical-session.target" ];
    };
    home.sessionVariables = {
      "GIO_EXTRA_MODULES" = "${cfg.package}/lib/gio/modules";
    };
  };


  meta.maintainers = with maintainers; [ nikp123 ];
}

