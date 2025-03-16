{ pkgs, config, ... }: {
  programs.rofi = {
    enable = true;
    terminal = "alacritty";
    xoffset = 0;
    yoffset = 0;
    extraConfig = {
      modi = "combi";
      width = 50;
      lines = 15;
      columns = 1;
      bw = 5;
      location = 0;
      padding = 5;
      fixed-num-lines = true;
      ssh-client = "ssh-hacky-bullshit-with-rofi";
      ssh-command = "{terminal} -e {ssh-client} {host}";
      run-command = "{cmd}";
      case-sensitive = false;
      parse-hosts = true;
      combi-modi = "drun,run,ssh";
      matching = "normal";
      separator-style = "none";
      scrollbar-width = 0;
      kb-mode-next = "Shift+Right,Control+Tab,Alt+l";
      kb-mode-previous = "Shift+Left,Control+Shift+Tab,Alt+h";
      kb-row-up = "Up,Control+p,Shift+Tab,Shift+ISO_Left_Tab,Alt+k";
      kb-row-down = "Down,Control+n,Alt+j";
    };
  };
}
