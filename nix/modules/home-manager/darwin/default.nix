{ ... }:
{
  programs.zsh.profileExtra = builtins.readFile ../../../../.zprofile.extra-darwin;
  programs.zsh.initContent = builtins.readFile ../../../../.zshrc.extra-darwin;
}
