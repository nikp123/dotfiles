{ ... }: {
  programs.fish.shellInit = ''
    export DOTNET_INSTALL_DIR="$XDG_DATA_HOME/dotnet"
  '';
}
