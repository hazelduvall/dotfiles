{ ... }:
{
  imports = [
    ./android.nix
  ];

  programs.zsh.profileExtra = builtins.readFile ../../../../.zprofile.extra-darwin-work;
  programs.zsh.initContent = builtins.readFile ../../../../.zshrc.extra-darwin-work;
}
