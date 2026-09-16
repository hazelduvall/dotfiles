{ ... }:
{
  imports = [
    ../../modules/home-manager
    ../../modules/home-manager/darwin
  ];

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;

  xdg.enable = true;

  programs.claude.sandbox.enable = false;
  programs.claude.sandbox.nonManaged = false;
  programs.jujutsu.nonManagedEnable = true;
  programs.neovim.lsp.cspell = true;
}
