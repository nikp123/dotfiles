{ config, ... }: {
  # Without this (EVEN ON WAYLAND SESSIONS) the home-manager variables won't be
  # set. Creates a ~/.xprofile file that will be loaded by certain display
  # managers allowing many applications to work on said home-manager variables
  # Yes, if there's a smarter way to do this, please fix.
  # Thread: https://github.com/nix-community/home-manager/issues/2659
  xsession.enable = true;

  home.sessionVariables = {
    # Filthy hack, I love it.
    "SSH_AUTH_SOCK"     = "$XDG_RUNTIME_DIR/gcr/ssh";

    # Android
    "ANDROID_USER_HOME" = "${config.xdg.dataHome}/android";
    "ANDROID_HOME"      = "${config.xdg.dataHome}/android";

    # Bash
    "HISTFILE"          = "${config.xdg.stateHome}/bash/history";

    # C#
    NUGET_PACKAGES      = "${config.xdg.cacheHome}/NuGetPackages";

    # Elinks
    "ELINKS_CONFDIR"    = "${config.xdg.configHome}/elinks";

    # Embedded
    "PLATFORMIO_CORE_DIR" = "${config.xdg.dataHome}/platformio";

    # Docker
    "DOCKER_CONFIG"       = "${config.xdg.configHome}/docker";

    # Java
    "_JAVA_OPTIONS"     = "-Djava.util.prefs.userRoot=${config.xdg.configHome}/java";

    # OpenSSL
    "RANDFILE"          = "${config.xdg.cacheHome}/openssl-randfile";

    # Python
    "PYTHONPYCACHEPREFIX" = "${config.xdg.cacheHome}/python";
    "PYTHONUSERBASE"      = "${config.xdg.dataHome}/python";

    # Rust
    "CARGO_HOME"        = "${config.xdg.dataHome}/cargo";
    "RUSTUP_HOME"       = "${config.xdg.dataHome}/rustup";

    # X11
    "XCOMPOSEFILE"      = "${config.xdg.configHome}/X11/xcompose";
    "XCOMPOSECACHE"     = "${config.xdg.cacheHome}/X11/xcompose";
    "USERXSESSION"      = "${config.xdg.cacheHome}/X11/xsession";
    "USERXSESSIONRC"    = "${config.xdg.cacheHome}/X11/xsessionrc";
    "ALTUSERXSESSION"   = "${config.xdg.cacheHome}/X11/Xsession";
    "ERRFILE"           = "${config.xdg.cacheHome}/X11/xsession-errors";


    # No fucking idea honestly
    ICEAUTHORITY        = "${config.xdg.cacheHome}/ICEauthority";
  };

}
