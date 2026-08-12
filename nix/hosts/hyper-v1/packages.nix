{ pkgs, ... }:
{
  home.packages = with pkgs; [
    btop
    cmake
    clang
    gnumake
    htop
    ninja
  ];
}
