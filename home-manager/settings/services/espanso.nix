pkgs: {
  enable = true;
  package = pkgs.espanso;
  settings = {
    matches = [
      { # Dates
        trigger = ":date";
        replace = "{{mydate}}";
        vars = [{
          name = "mydate";
          type = "date";
          params = { format = "%m/%d/%Y"; };
        }];
      }
      {
        trigger = ";pi";
        replace = "π";
      }
      {
        trigger = ";ne";
        replace = "≠";
      }
      {
        trigger = ";pog"; # o hek
        replace = "https://cdn.discordapp.com/emojis/962698355581009930.webp?size=48&quality=lossless";
      }
      {
        trigger = ";hek"; # o hek
        replace = "https://cdn.discordapp.com/emojis/962698355581009930.webp?size=48&quality=lossless";
      }
      {
        trigger = ";lo"; # longthink
        replace = "https://cdn.discordapp.com/emojis/785853937718657024.webp?size=48&quality=lossless";
      }
      {
        trigger = ";smi"; # sminking
        replace = "https://i.imgur.com/DLgDanh.png";
      }
      {
        trigger = ";ugh"; # ugh";
        replace = "https://i.imgur.com/9R6tK22.png";
      }
      {
        trigger = ";sad"; # pepposad";
        replace = "https://i.imgur.com/pYX7JkZ.png";
      }
      {
        trigger = ";fl"; # flunshed";
        replace = "https://i.imgur.com/w0EYHcu.png";
      }
      {
        trigger = ";cat"; # cat";
        replace = "https://i.imgur.com/Cn5OmWQ.png";
      }
      {
        trigger = ";sad"; #cry";
        replace = "https://i.imgur.com/6v3lj7Z.png";
      }
      {
        trigger = ";sw"; # sweating";
        replace = "https://i.imgur.com/33wZ2Tz.png";
      }
      {
        trigger = ";hapi"; # happy facj";
        replace = "https://i.imgur.com/qQCUSMX.png";
      }
      {
        trigger = ";hmm"; # close sus frog";
        replace = "https://i.imgur.com/JcnOC8k.png";
      }
      {
        trigger = ";sus";  # turtl sus";
        replace = "https://i.imgur.com/rH9pD3E.png";
      }
      {
        trigger = ";duk";
        replace = "https://cdn.discordapp.com/emojis/874648256938901565.gif";
      }
      {
        trigger = ";blursed";
        replace = "https://cdn.discordapp.com/emojis/703886041970638909.webp?size=48&quality=lossless";
      }
      {
        trigger = ";gnu";
        replace = "I’d just like to interject for a moment. What you’re refering to as Linux, is in fact, GNU/Linux, or as I’ve recently taken to calling it, GNU plus Linux. Linux is not an operating system unto itself, but rather another free component of a fully functioning GNU system made useful by the GNU corelibs, shell utilities and vital system components comprising a full OS as defined by POSIX.
  Many computer users run a modified version of the GNU system every day, without realizing it. Through a peculiar turn of events, the version of GNU which is widely used today is often called Linux, and many of its users are not aware that it is basically the GNU system, developed by the GNU Project.
  There really is a Linux, and these people are using it, but it is just a part of the system they use. Linux is the kernel: the program in the system that allocates the machine’s resources to the other programs that you run. The kernel is an essential part of an operating system, but useless by itself; it can only function in the context of a complete operating system. Linux is normally used in combination with the GNU operating system: the whole system is basically GNU with Linux added, or GNU/Linux. All the so-called Linux distributions are really distributions of GNU/Linux!";
      }
      {
        trigger = ";giorgio";
        replace = "When I was fifteen, sixteen\n
  When I started really to play guitar\n
  I definitely wanted to become a musician\n
  It was almost impossible because, it was\n
  The dream was so big\n
  That I didn't see any chance\n
  Because I was living in a little town, was studying\n
  And when I finally broke away from school\n
  And became a musician\n
  I thought \"well, now I may have a little bit of a chance\"\n
  Because all I really wanted to do is music\n
  And not only play music, but compose music\n
  At that time, in Germany, in '69, '70\n
  They had already discotheques\n
  So I would take my car, would go to a discotheque\n
  Sing maybe thirty minutes\n
  I think I had about seven, eight songs\n
  I would partially sleep in the car\n
  Because I didn't want to drive home\n
  And that helped me for about\n
  Almost two years to survive\n
  In the beginning\n
  I wanted to do an album with the sounds of the fifties\n
  The sounds of the sixties, of the seventies\n
  And then have a sound of the future\n
  And I thought \"Wait a second\n
  I know the synthesizer, why don't I use the synthesizer\n
  Which is the sound of the future\"\n
  And I didn't have any idea what to do but I knew I needed a click\n
  So we put a click on the 24-track\n
  Which then was synced to the Moog modular\n
  I knew that could be a sound of the future\n
  But I didn't realize how much the impact would be\n
  My name is Giovanni Giorgio, but everybody calls me Giorgio";
      }
    ];
    #backend = "Clipboard";
  };
}
