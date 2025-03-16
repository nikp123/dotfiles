{
  enable = true;
  commandLineArgs = [
    "--enable-features=VaapiVideoEncoder"
    "--ignore-gpu-blocklist"
    "--enable-zero-copy"
  ];
  extensions = [
    # Bitwarden
    { id = "nngceckbapebfimnlniiiahkandclblb"; }

    # Dark reader
    { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; }

    # Enhanced H264ify
    { id = "omkfmpieigblcllmkgbflkikinpkodlk"; }

    # I still don't care about cookies
    { id = "edibdbjcniadpccecjdfdjjppcpchdlm"; }

    # UBlock Origin
    { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; }
  ];
}
