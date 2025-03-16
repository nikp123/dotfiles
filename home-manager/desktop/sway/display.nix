{ ... }: let
  hosts = {
    Wall = {
      primary = "DVI-D-1";
      secondary = "HDMI-A-1";
    };
    NotThink.primary = "eDP-1";
  };

  hostname = "NotThink";
in {
  services.kanshi = {
    enable = true;
    settings = {
      "Wall" = [
        {
          profile = {
            name = "single";
            outputs = [
              { criteria = hosts.${hostname}.primary; position = "0,0"; scale = 1.0; mode = "1920x1080"; }
              { criteria = hosts.${hostname}.secondary; status = "disable"; }
            ];
          };
        }
        {
          profile = {
            name = "full";
            outputs = [
              { criteria = hosts.${hostname}.primary; position = "0,0"; scale = 1.0; mode = "1920x1080"; }
              { criteria = hosts.${hostname}.secondary; status = "enable"; position = "1920,217"; scale = 1.0; mode = "1366x768"; }
            ];
          };
        }
      ];
      "NotThink" = [];
    }."${hostname}";
  };

  wayland.windowManager.sway.config = {
    Wall.workspaceOutputAssign = [
      { workspace = "1"; output = hosts.${hostname}.primary; }
      { workspace = "2"; output = hosts.${hostname}.primary; }
      { workspace = "3"; output = hosts.${hostname}.primary; }
      { workspace = "4"; output = hosts.${hostname}.primary; }
      { workspace = "5"; output = hosts.${hostname}.primary; }
      { workspace = "6"; output = hosts.${hostname}.primary; }
      { workspace = "7"; output = hosts.${hostname}.secondary; }
      { workspace = "8"; output = hosts.${hostname}.secondary; }
      { workspace = "9"; output = hosts.${hostname}.secondary; }
    ];
    NotThink = {};
  }.${hostname} // {
    input = {
      "type:tablet_tool" = {
        map_to_output = hosts.${hostname}.primary;
      };
    }; 
  };
}
