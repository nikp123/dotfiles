{
  accounts.email.accounts = {
    "Main" = let
      address  = "nikp123@e.email";
    in {
      primary = true;
      thunderbird = {
        enable = true;
        profiles = [ "nikp123" ];
      };
      inherit address;
      userName = address;
      imap = {
        host = "mail.ecloud.global";
        port = 993;
        tls = {
          enable = true;
        };
      };
      smtp = {
        host = "mail.ecloud.global";
        port = 587;
        tls = {
          enable      = true;
          useStartTls = true;
        };
      };
      realName = "nikp123";
    };

    "Faks" = let
      address = "pavlica.ee240.2021@uns.ac.rs";
    in {
      thunderbird = {
        enable = true;
        profiles = [ "nikp123" ];
      };
      inherit address;
      userName = address;
      imap = {
        host = "imap.uns.ac.rs";
        port = 993;
        tls = {
          enable = true;
        };
      };
      smtp = {
        host = "smtp.uns.ac.rs";
        port = 587;
        tls = {
          enable      = true;
          useStartTls = true;
        };
      };
      realName = "Nikola Pavlica";
    };

    "GMail" = let
      address = "pavlica.nikola@gmail.com";
    in {
      thunderbird = {
        enable = true;
        profiles = [ "nikp123" ];
      };
      inherit address;
      userName = address;
      flavor   = "gmail.com";
      realName = "Nikola Pavlica";
    };

    "Spam" = let
      address = "dankmemester3@gmail.com";
    in {
      thunderbird = {
        enable = true;
        profiles = [ "nikp123" ];
      };
      inherit address;
      userName = address;
      flavor   = "gmail.com";
      realName = "Dank Memester";
    };
  };
}
