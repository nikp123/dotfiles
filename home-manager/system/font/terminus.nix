{ pkgs, ... }: {
  home.packages = with pkgs; [
    terminus_font
    font-awesome
    fira
    fira-code
  ];

  xsession.windowManager.i3.config = {
    fonts = {
      names = [ "Terminus" "FontAwesome" ];
      size  = 12.0;
    };
  };
  wayland.windowManager.sway.config = {
    fonts = {
      names = [ "Terminus" "FontAwesome" ];
      size = 12.0;
    };
  };
  programs.alacritty.settings.font = {
    normal.family = "Terminus";
    size = 10.0;
  };
  programs.foot.settings.main.font = "Terminus:size=11";
  services.dunst.settings.global.font = "Terminus, FontAwesome 11";
  programs.rofi.font = "Terminus 11";

  xdg.configFile."swaync-style-css".text = ''
    * {
      font-family: Terminus;
    }
  '';
  xdg.configFile."waybar-style-css".text = ''
    * {
        font-family: "Terminus", "Font Awesome 6 Free";
        font-size: 14px;
    }
  '';
}
