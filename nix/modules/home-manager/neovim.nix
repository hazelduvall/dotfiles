{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs.neovim;

  wrappedNeovim = pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped {
    viAlias = true;
    vimAlias = true;
    withNodeJs = false;
    withPython3 = false;
    withRuby = false;
    wrapRc = false;
  };
in
{
  options.programs.neovim = {
    nonManagedEnable = lib.mkEnableOption "Whether to enable my custom non-managed Neovim configuration";

    lsp = {
      cspell = lib.mkEnableOption "Whether to enable building the cspell language server. Doesn't work if you have ipv6 lol";
    };
  };

  config = lib.mkIf cfg.nonManagedEnable (
    lib.mkMerge [
      {
        # I don't use this because I want to track these dotfiles directly from git instead.
        # programs.neovim.enable = true;

        home.sessionVariables = {
          EDITOR = "nvim";
        };

        home.shellAliases = {
          vimdiff = "nvim -d";
        };

        home.packages = [
          wrappedNeovim
        ]
        ++ (with pkgs; [
          # For viewing images with Snacks.nvim
          ffmpeg-full
          ghostscript_headless
          imagemagick
          # For treesitter
          tree-sitter
          # TODO: add more configuration options for language servers
          clang-tools
          nixd
          nixfmt
          vscode-js-debug
          vscode-langservers-extracted
        ]);
      }
      (lib.mkIf cfg.lsp.cspell {
        home.packages = [
          (pkgs.callPackage ../../packages/cspell-lsp { })
        ];
      })
    ]
  );
}
