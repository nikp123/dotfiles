{ pkgs, ... }: let 
  
in {
  systemd.user = {
    services.gcr-ssh-agent = {
      Unit = {
        Description = "GCR ssh-agent wrapper";
        Requires    = "gcr-ssh-agent.socket";
      };
      Service = {
        Type                = "simple";
        StandardError       = "jorunal";
        Environment         = "SSH_AUTH_SOCK=%t/gcr/ssh";
        ExecStart           = "${pkgs.gcr}/libexec/gcr-ssh-askpass";
        Restart             = "on-failure";
      };
      Install = {
        WantedBy = [ "default.target" ];
        Also     = [ "gcr-ssh-agent.socket" ];
      };
    };
    sockets.gcr-ssh-agent = {
      Unit = {
        Description = "GCR ssh-agent wrapper";
      };
      Socket = {
        Priority = 6;
        Backlog = 5;
        ListenStream = "%t/gcr/ssh";
        DirectoryMode = "0700";
      };
      Install = {
        WantedBy = [ "sockets.target" ];
      };
    };
  };
}
