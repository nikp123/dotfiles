{
  enable = true;

  settings = {
    assume_yes = true;
    set_title = false;
    cleanup = true;
    commands = {
      "Run garbage collection on Nix store" = "nix-collect-garbage";
    };
  };
}
