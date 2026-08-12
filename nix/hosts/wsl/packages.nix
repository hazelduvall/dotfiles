{ pkgs, ... }:
{
  home.packages = with pkgs; [
    age
    btop
    clang
    cmake
    htop
    nix-output-monitor
    nodejs_22
    pnpm_10
    sops
    usbutils
  ];
}
