{ pkgs, config, ... }: {
  services.swaync = {
    settings = {
      "$schema" = "/etc/xdg/swaync/configSchema.json";

      positionX = "right";
      positionY = "top";
      layer = "overlay";
      cssPriority = "user";
      control-center-margin-top = 0;
      control-center-margin-bottom = 0;
      control-center-margin-right = 0;
      control-center-margin-left = 0;
      notification-icon-size = 64;
      notification-body-image-height = 100;
      notification-body-image-width = 200;
      timeout = 10;
      timeout-low = 5;
      timeout-critical = 0;
      fit-to-screen = true;
      control-center-width = 500;
      control-center-height = 600;
      notification-window-width = 500;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200;
      hide-on-clear = false;
      hide-on-action = true;
      script-fail-notify = true;
      scripts = {};
      notification-visibility = {
        "spotify-rule" = {
          state = "muted";
          urgency = "Low";
          app-name = "Spotify";
        };
        "nm-applet-1" = {
          state = "ignored";
          urgency = "Low";
          app-name = "NetworkManager Applet";
        };
        "nm-applet-2" = {
          state = "ignored";
          urgency = "Normal";
          app-name = "NetworkManager Applet";
        };
        "nm-applet-3" = {
          state = "ignored";
          urgency = "Critical";
          app-name = "NetworkManager Applet";
        };
      };
      widgets = [
        "title"
        "dnd"
        "mpris"
        "notifications"
      ];
      widget-config = {
        title = {
          text = "Notifications";
          clear-all-button = true;
          button-text = "Clear All";
        };
        dnd = {
          text = "Do Not Disturb";
        };
        label = {
          max-lines = 5;
          text = "Label Text";
        };
        mpris = {
          image-size = 96;
          image-radius = 0;
        };
      };
    };
    style = ./style.css;
  };

  # Copy colours file
  xdg.configFile."swaync-colours" = {
    source = ./colours;
    target = "swaync/colours";
    recursive = true;
  };
}
