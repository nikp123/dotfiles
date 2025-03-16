{ ... }: {
  nix = {
    # Save some disk space
    settings.auto-optimise-store = true;

    # Again, clean up in order to save space.
    gc = {
      automatic = true;
      frequency = "weekly";
      options = "--delete-older-than 14d";
    };

    # Keep built packages
    extraOptions = ''
      keep-outputs = true
    '';
  };
}
