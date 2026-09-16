{ ... }:
{
  imports = [
    ../../modules/nix-darwin
  ];

  ids.gids.nixbld = 350;

  homebrew.enable = true;
}
