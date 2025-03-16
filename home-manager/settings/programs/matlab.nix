{ ... }: {
  programs.fish.shellInit = ''
    export MATLAB_LOG_DIR="$XDG_CACHE_HOME/matlab/logs"
  '';
}
