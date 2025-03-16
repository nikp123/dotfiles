{ config, pkgs, ... }: let
  screenshot-grab-area   = (import ./scripts/screenshot-grab-area.nix    { inherit pkgs; });
  
  rofi-sink-select   = "${pkgs.rofi-pulse-select}/bin/rofi-pulse-select sink";
  rofi-source-select = "${pkgs.rofi-pulse-select}/bin/rofi-pulse-select source";
in {
  xfce4-panel = {
    "configver" = 2;
    "panels"                           = [ 1 ];
    "panels/dark-mode" = true;
    "panels/panel-1/position"          = "p=6;x=683;y=13";
    "panels/panel-1/length"            = 100;
    "panels/panel-1/position-locked"   = true;
    "panels/panel-1/icon-size"         = 16;
    "panels/panel-1/size"              = 26;
    "panels/panel-1/plugin-ids"        = [ 7 3 1 4 5 9 10 6 13 12 ];

    "plugins/plugin-7"                 = "whiskermenu";

    "plugins/plugin-3"                 = "separator";
    "plugins/plugin-3/expand"          = true;
    "plugins/plugin-3/style"           = 0;

    "plugins/plugin-1"                 = "systemload";
    "plugins/plugin-1/swap/enabled"    = true;
    "plugins/plugin-1/uptime/enabled"  = false;

    "plugins/plugin-4"                 = "pager";

    "plugins/plugin-5"                 = "separator";
    "plugins/plugin-5/style"           = 0;

    "plugins/plugin-9"                 = "power-manager-plugin";

    "plugins/plugin-10"                = "notification-plugin";

    "plugins/plugin-6"                     = "xkb";
    "plugins/plugin-6/caps-lock-indicator" = true;
    "plugins/plugin-6/display-type"        = 2;

    "plugins/plugin-13"                = "systray";

    "plugins/plugin-12"                     = "clock";
    "plugins/plugin-12/digital-format"      = "%I:%M %p";
    "plugins/plugin-12/digital-layout"      = 3;
    "plugins/plugin-12/digital-time-format" = "%I:%M %p";
  };

  xfce4-keyboard-shortcuts = {
    # unset defaults because they suck
    "xfwm4/custom/<Primary><Alt>KP_1" = "";
    "xfwm4/custom/<Primary><Alt>KP_2" = "";
    "xfwm4/custom/<Primary><Alt>KP_3" = "";
    "xfwm4/custom/<Primary><Alt>KP_4" = "";
    "xfwm4/custom/<Primary><Alt>KP_5" = "";
    "xfwm4/custom/<Primary><Alt>KP_6" = "";
    "xfwm4/custom/<Primary><Alt>KP_7" = "";
    "xfwm4/custom/<Primary><Alt>KP_8" = "";
    "xfwm4/custom/<Primary><Alt>KP_9" = "";

    "xfwm4/custom/<Primary>F1" = "";
    "xfwm4/custom/<Primary>F2" = "";
    "xfwm4/custom/<Primary>F3" = "";
    "xfwm4/custom/<Primary>F4" = "";
    "xfwm4/custom/<Primary>F5" = "";
    "xfwm4/custom/<Primary>F6" = "";
    "xfwm4/custom/<Primary>F7" = "";
    "xfwm4/custom/<Primary>F8" = "";
    "xfwm4/custom/<Primary>F9" = "";
    "xfwm4/custom/<Primary>F10" = "";

    "xfwm4/custom/<Super>KP_Home" = "";
    "xfwm4/custom/<Super>KP_End" = "";
    "xfwm4/custom/<Super>KP_Left" = "";
    "xfwm4/custom/<Super>KP_Right" = "";
    "xfwm4/custom/<Super>KP_Next" = "";
    "xfwm4/custom/<Super>KP_Page_Up" = "";
    "xfwm4/custom/<Super>KP_Up" = "";
    "xfwm4/custom/<Super>KP_Down" = "";

    # Tiling stuff
    "xfwm4/custom/<Super>1" = "workspace_1_key";
    "xfwm4/custom/<Super>2" = "workspace_2_key";
    "xfwm4/custom/<Super>3" = "workspace_3_key";
    "xfwm4/custom/<Super>4" = "workspace_4_key";
    "xfwm4/custom/<Super>5" = "workspace_5_key";
    "xfwm4/custom/<Super>6" = "workspace_6_key";
    "xfwm4/custom/<Super>7" = "workspace_7_key";
    "xfwm4/custom/<Super>8" = "workspace_8_key";
    "xfwm4/custom/<Super>9" = "workspace_9_key";
    "xfwm4/custom/<Super>0" = "workspace_10_key";

    "xfwm4/custom/<Shift><Super>!" = "move_window_workspace_1_key";
    "xfwm4/custom/<Shift><Super>@" = "move_window_workspace_2_key";
    "xfwm4/custom/<Shift><Super>#" = "move_window_workspace_3_key";
    "xfwm4/custom/<Shift><Super>$" = "move_window_workspace_4_key";
    "xfwm4/custom/<Shift><Super>%" = "move_window_workspace_5_key";
    "xfwm4/custom/<Shift><Super>^" = "move_window_workspace_6_key";
    "xfwm4/custom/<Shift><Super>&" = "move_window_workspace_7_key";
    "xfwm4/custom/<Shift><Super>*" = "move_window_workspace_8_key";
    "xfwm4/custom/<Shift><Super>(" = "move_window_workspace_9_key";
    "xfwm4/custom/<Shift><Super>)" = "move_window_workspace_10_key";

    # Directions
    "xfwm4/custom/<Super>Left"     = "tile_left_key";
    "xfwm4/custom/<Super>Right"    = "tile_right_key";
    "xfwm4/custom/<Super>Up"       = "maximize_window_key";
    "xfwm4/custom/<Super>Down"     = "hide_window_key";

    # Corners
    "xfwm4/custom/<Shift><Super>Left"    = "tile_up_left_key";
    "xfwm4/custom/<Shift><Super>Right"   = "tile_up_right_key";
    "xfwm4/custom/<Primary><Super>Left"  = "tile_down_left_key";
    "xfwm4/custom/<Primary><Super>Right" = "tile_down_right_key";

    # Menu command
    "commands/custom/<Super>d"        = config.default.commands.menu;

    # File Manager
    "commands/custom/<Super>n"        = "exo-open --launch FileManager";

    # Terminal emulator
    "commands/custom/<Super>Return"   = "exo-open --launch TerminalEmulator";

    # Screenshot
    "commands/custom/<Shift><Super>s" = "${screenshot-grab-area}";

    # Password manager
    "commands/custom/<Shift><Super>p" = config.default.commands.password_manager;

    # Bluetooth thing
    "commands/custom/<Shift><Super>b" = "${pkgs.rofi-bluetooth}/bin/rofi-bluetooth";

    # Media control
    "commands/custom/<Super>p"        = "${config.xdg.configHome}/scripts/other/playerctl play-pause";
    #"commands/custom/<Shift><Super>u" = "${config.xdg.configHome}/scripts/other/playerctl previous";
    #"commands/custom/<Shift><Super>i" = "${config.xdg.configHome}/scripts/other/playerctl next";
    #"commands/custom/<Super>u"        = "${config.xdg.configHome}/scripts/other/playerctl position 10-";
    #"commands/custom/<Super>i"        = "${config.xdg.configHome}/scripts/other/playerctl position 10+";

    # Audio device control
    "commands/custom/<Shift><Super>i" = "${rofi-source-select}";
    "commands/custom/<Shift><Super>o" = "${rofi-sink-select}";
  };

  xfwm4 = {
    "general/show_dock_shadow" = false;

    # For a sane tiling experience
    "general/snap_to_border"   = true;
    "general/snap_width"       = 20;
    "general/tile_on_move"     = true;

    # Click and grab/resize window key
    "general/easy_click"    = "Super";

    # Zoom feature
    "general/zoom_desktop"  = true;
    "general/zoom_pointer"  = true;

    # Default is something low, like 4
    "general/workspace_count" = 9;
  };
}
