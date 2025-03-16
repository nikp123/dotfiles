{ config, ... }: {
  home.sessionVariables = {
    OCTAVE_HISTFILE = "${config.xdg.cacheHome}/octave-hsts";
    OCTAVE_SITE_INITFILE = "${config.xdg.configHome}/octave/octaverc";
  };
  xdg.configFile."octaverc" = {
    enable = true;
    target = "octave/octaverc";
    text = ''
      pkg load signal;
    '';
  };
}
