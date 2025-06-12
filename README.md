le meine dotfiles
-------------------

## What are these?

My personal dotfiles. This is currently my setup:

 - ``aconfmgr`` for managing my system level configuration on ArchLinux (I
 ***need**** the FHS stuff, tried and failed maining NixOS on my laptop, it
 wasn't pretty)
 - ``home-manager`` to manage my user-level software on top of Nix and Arch,
 these are the remains of what used to be my NixOS machine before I switched
 back to Arch again

Combined with these two I kinda wish I had the declarative NixOS stuff but
without the insane build times and the breaking once I'm not on the internet.

## Personal philosophy when it comes to *this*

I just feel like declarative is the right approach but you should be still
allowed to use it WITHOUT internet access (as Nix just gives up if you don't
have it, I know there are ways around this but I **CANNOT** be bothered).

But sometimes, you should also be able to hack about to get certain things
working, like MatLab and propriatery MCU tools like MPLAB-X which *can* be done
under NixOS but is a MASSIVE PITA to do. So that's why I'm on Arch.

And using two opposing ideas is kinda counterproductive, I guess.

## License??

Juse use the terms of whatever you read under the WTFPL

