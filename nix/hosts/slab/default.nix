(import ../../modules/nix-darwin/mk-default.nix) {
  username = "hazelduvall";
  hostname = "slab";
  hostPlatform = "aarch64-darwin";
  configuration = ./nix-darwin.nix;
  home-manager-import = ./home.nix;
}
