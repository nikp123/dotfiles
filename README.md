le meine not-so никсОС конфигурација (i.e. dotfiles)
-----

### Warning: This is rage-bait. Enjoy.

Yes I will keep this up as long as I feel like NixOS ppl like to ignore these issues entirely instead of being honest about them.


## Који курац ово беше?

After witnessing the horror of NixOS I have decided to distrohop (once again).

Since I like the workflow of centrally managing your system, I'll try to replicate that model as close as possible.

The fact I'm losing immutability is a *good thing*. I am no longer tethered to the fucking internet just to temporarily change my DNS/Proxy settings or some shit.


## What was so wrong with NixOS?

Try installing a matlab and it's language server in your very fancy centrally managed nixvim configuration without sacrificing a soul to the devil.

Try. Please do.

OH AND ON top of that try to do FPGA workflows... Without investing 5.6 trillion eons into your configuration.

Or something like iOS jailbreaking. Or binary reverse engineering. Or anything that breaks because of "the perfect NixOSs' /nix/store format".

Buuuut to a bit reasonable, it does make for a very good server OS. You get to document and save all the janky shit you had to work around to get X thing to work without having to remember or write it all down. Good for laziness, bad for productivity but I don't care.


## But FHS is an archaic thing we should be supporting!

How about you take that statement and fucking choke on it.

I'll be back on NixOS when it becomes usable to non-programmer people (aka non-douchebags).


## Bbbbut distrobox, systemd-nspawn, docker containers, buildFHSEnv ...

no. every single one of those tools is annoying AS FUCK to work with and break with every other update. I am sick of this shit.


# Ok, enough with the rage bait, how does this work?

There are two directories:

 - aconfmgr - attempt to declaratively track every single system file on my arch install. this way i dont have to reinvest 5 trillion years finding that one obscure forum post documenting how something has to be set up the way I like it
 - home-manager - i cannot be fucking bothered to convert my configuration back into dotfiles so home-manager stays as it's not as cancerous as NixOS when working on it.

In theory I shouldn't have any sensitive info on here, but you never know. I just may be commiting my personal info here one day on accident.

The aconfmgr structure and naming convetion follows that of nix because, honestly, it just works:tm:.

Home-manager in theory should be portable but I know that it isn't because of janky XDG, env var and portal crap that each OS likes to fight over. State of the fucking Linux Desktop everyone.

And this configuration should be portable in the sense that multiple machines should *just work* with this. But this is yet to be seen.


# I am very shocked by the presence of vulgarity in this config.

ok and? go away.


# License??

bruh.

idfk

WTFPL i guess, lol

