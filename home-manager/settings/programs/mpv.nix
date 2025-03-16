{ pkgs, ... }: {
  package = pkgs.mpv-unwrapped;
  enable = true;
  bindings = {
    LEFT = "seek -5 exact";
    RIGHT = "seek 5 exact";

    WHEEL_UP = "ignore";
    WHEEL_DOWN = "ignore";
    WHEEL_LEFT = "ignore";
    WHEEL_RIGHT = "ignore";
  };
}
