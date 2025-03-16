{ pkgs, ... }: {
  imports = [
    ./general
    ./programs
    ./services
  ];
}
