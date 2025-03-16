{ pkgs, ... }: {
  settings = {
    email = "nikp123@e.email";
    base_url = "https://password.serverdoesnt.work:444";
    lock_timeout = 300;
    pinentry = pkgs.pinentry-gnome3;
  };
}
