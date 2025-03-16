{ pkgs, ... }: {
  programs.atuin.enableFishIntegration = true;
  programs.fish = {
    enable = true;
    #shellAliases = {
    #  "sudo\ vim" = "sudovim";
    #};
    interactiveShellInit = ''
      set SSH_AUTH_SOCK "/run/user/$(id -u)/keyring/ssh"
    '';
    shellInit = ''
      # Unfuck XDG paths for containers
      set XDG_CACHE_HOME "$HOME/.cache"
      set XDG_CONFIG_HOME "$HOME/.config"
      set XDG_STATE_HOME "$HOME/.local/state"
      set XDG_DATA_HOME "$HOME/.local/share"
    '';
    functions = {
      swap = ''
        mv $argv[1] $argv[1].temp
        mv $argv[2] $argv[1]
        mv $argv[1].temp $argv[2]
      '';

      # Required shell functions to wrap nix commands so that they work
      # inside of containers (For example: ssh doesn't like nix permissions)
      git   = "${pkgs.git}/bin/git $argv";
      ssh   = "${pkgs.openssh}/bin/ssh $argv";

      rebuild = "sudo nixos-rebuild switch --impure $argv";
      fish_prompt = ''
        set -l last_pipestatus $pipestatus
        set -lx __fish_last_status $status # Export for __fish_print_pipestatus.
        set -l normal (set_color normal)
        set -q fish_color_status
        or set -g fish_color_status --background=red white

        # Color the prompt differently when we're root
        set -l color_cwd $fish_color_cwd
        set -l suffix '>'
        if functions -q fish_is_root_user; and fish_is_root_user
            if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
            end
            set suffix '#'
        end

        # Write pipestatus
        # If the status was carried over (if no command is issued or if `set` leaves the status untouched), don't bold it.
        set -l bold_flag --bold
        set -q __fish_prompt_status_generation; or set -g __fish_prompt_status_generation $status_generation
        if test $__fish_prompt_status_generation = $status_generation
            set bold_flag
        end
        set __fish_prompt_status_generation $status_generation
        set -l status_color (set_color $fish_color_status)
        set -l statusb_color (set_color $bold_flag $fish_color_status)
        set -l prompt_status (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)

        # Display a shell prompt name (used for nix-shells)
        if test $SHELL_PROMPT
          echo -n "$SHELL_PROMPT "
        end

        # Display a prompt name for docker/podman containers
        # (for distrobox)
        if test $CONTAINER_ID
          echo -n "$CONTAINER_ID "
        end

        echo -n -s (prompt_login)' ' (set_color $color_cwd) (prompt_pwd) $normal (fish_vcs_prompt) $normal " "$prompt_status $suffix " "
      '';

      #
      # Functions that are not OS related
      #
      sort_by_filename_YYYYMM = ''
        for i in *.jpg *.mp4 *.png *.jpeg *.gif
          set year (string sub --length=4 (echo $i | cut -d'_' -f2))
          set month (string sub --length=2 -s 5 (echo $i | cut -d'_' -f2))
          mkdir -p $year/$month
          mv $i $year/$month/$i
        end
      '';
      sort_by_metadata = ''
        for i in *.jpg *.mp4 *.png *.jpeg *.gif
          set year (string sub --length=4 (stat -c %y $i))
          set month (string sub --length=2 -s 6 (stat -c %y $i))
          mkdir -p $year/$month
          mv $i $year/$month/$i
        end
      '';
    };
  };
}
