{ pkgs, ... }: {
  enable = true;
  package = pkgs.vscode.fhsWithPackages (ps: with ps; [
    rustup
    clippy
    rust-analyzer
    zlib
    openssl.dev
    pkg-config
    cmake
  ]);
  extensions = with pkgs.vscode-extensions; [
    vscodevim.vim
    vadimcn.vscode-lldb
    matklad.rust-analyzer
    ms-vscode.cpptools
    ms-vscode.cmake-tools
  ];
}
