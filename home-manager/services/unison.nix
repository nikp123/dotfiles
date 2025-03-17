{ pkgs, xdg, config, ... }: let
  unison = pkgs.unison;
  sshcmd = pkgs.openssh;
  unison_store = "${config.xdg.dataHome}/unison";
  config_name = "HomeServer";
  config_text = ''
    # Unison preferences
    root = /home/nikp123
    root = ssh://SyncServer
    sshargs = -C

    batch  = true
    auto   = true
    repeat = watch
    prefer = newer

    path = .ssh
    path = .local/share/gnupg
    path = Documents
    path = Sandbox/Faks
    path = Sandbox/Gaming
    path = Music
    path = Pictures
    path = Projects

    # Ignore directories that mostly hold junk
    ignore = Path Sandbox/Gaming/Linux/.steampid
    ignore = Path Sandbox/Gaming/Linux/.steampath
    ignore = Path Sandbox/Gaming/Linux/.steam
    ignore = Path Sandbox/Gaming/Linux/.local/share/Steam
    ignore = Path Sandbox/Gaming/Linux/.wine/drive_c/Program Files
    ignore = Path Sandbox/Gaming/Linux/.wine/drive_c/Program Files (x86)
    ignore = Path Sandbox/Gaming/Linux/.wine/drive_c/windows
    ignore = Path Sandbox/Gaming/Linux/.wine/dosdevices
    ignore = Path Sandbox/Gaming/Linux/.wine/user.reg
    ignore = Path Sandbox/Gaming/Linux/.wine/userdef.reg
    ignore = Path Sandbox/Gaming/Linux/.wine/system.reg
    ignore = Path Sandbox/Gaming/Linux/.wine/system.reg
    ignore = Path Sandbox/Gaming/Linux/.cache
    ignore = Path Sandbox/Gaming/Linux/.local/share/lutris/runtime
    ignore = Path Sandbox/Gaming/Linux/.local/share/lutris/runners

    # Ignore known bloat directories
    ignore = Path Sandbox/Faks/.MathWorks
    ignore = Path Sandbox/Faks/.local/share/applications
    ignore = Path Sandbox/ArchLinux/.cache
    ignore = Path Sandbox/ArchLinux/.MathWorks
    ignore = Path Sandbox/ArchLinux/.local/share/applications

    ignore = Path .local/share/gnupg/gpg-agent.conf
    ignore = Path .local/share/gnupg/gpg.conf
    ignore = Path .local/share/gnupg/scdaemon.conf

    ignore = Path Documents/ViberDownloads

    ignore = Path .ssh/authorized_keys
    ignore = Path .ssh/config
    ignore = Path .ssh/known_hosts.old

    # Vim cache files
    ignore = Name {*.swp}

    #
    # Typical macOS/Windows metadata
    #

    ignore = Name {._}*
    ignore = Name .#*
    ignore = Name .DS_Store
    ignore = Name .localized

    ignore = Path {.TemporaryItems}
    ignore = Path {._.TemporaryItems}
    ignore = Path {System Volume Information}
    ignore = Path {Recycled}
    ignore = Path {$RECYCLE.BIN}
    ignore = Path {RECYCLER}
    ignore = Path {._.Trashes}
    ignore = Path {.Trashes}
    ignore = Path {.Trashes}

    # Thumbnails and whatnot
    ignore = Name Thumbs.db
    ignore = Name {,.}*{.ithmb}

    # Programmer moment
    ignore = Name build
    ignore = Name target
  '';
in {
  systemd.user.services."unison-${config_name}" = {
    Unit = {
      Description = "File synchronization via Unison";
      After       = [
        "suspend.target"
        "suspend-then-hibernate.target"
        "network-online.target"
      ];
    };
    Install.WantedBy = [ "graphical-session.target" ];
    Service = {
      ExecStart           = "${unison}/bin/unison '-log=false' '-ui=text' '-sshcmd=${sshcmd}/bin/ssh' ${config_name}";
      Restart             = "always";
      RestartSec          = 60;
      IOSchedulingClass   = "idle";
      CPUSchedulingPolicy = "idle";
      Environment         = [
        "UNISON=${unison_store}"
        "SSH_AUTH_SOCK=/run/user/1000/gcr/ssh"
      ];
    };
  };

  xdg.dataFile."unison-${config_name}" = {
    target = "unison/${config_name}.prf";
    text = "${config_text}";
  };
}
