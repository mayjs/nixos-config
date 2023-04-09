{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    plugins = let
      customPlugins = {
        vim-openscad = pkgs.vimUtils.buildVimPlugin {
          name = "vim-openscad";
          src = pkgs.fetchFromGitHub {
            owner = "sirtaj";
            repo = "vim-openscad";
            rev = "81db508b1888fdbea994d43ccef1acd86c8af3f7";
            sha256 = "1wcdfayjpb9h0lzwdi5nda4c0ch263fdr0379l9k1gf47bgq9cx2";
          };
        };

        vim-code-dark = pkgs.vimUtils.buildVimPlugin {
          name = "vim-code-dark";
          src = pkgs.fetchFromGitHub {
            owner = "tomasiser";
            repo  = "vim-code-dark";
            rev = "670fed53a2ae67542a78ef7b642f4aca6b6326dc";
            sha256 = "0zdhhv3h8lzba8dpv0amc5abpkzayp6gbjw6qv712p638zyr99vw";
          };
        };

        smartyank = pkgs.vimUtils.buildVimPlugin {
          name = "smartyank";
          src = pkgs.fetchFromGitHub {
            owner = "ibhagwan";
            repo = "smartyank.nvim";
            rev = "e474bd74497ef968d4b9ea636e3f8237365e09a7";
            sha256 = "sha256-PTvh3duu6DW2Hy2Mye6V7lw/E0FfPLGRCQJjQl1SFag=";
          };
        };
      };
    in 
    with pkgs.vimPlugins; [
      customPlugins.vim-code-dark
      vim-airline
      vim-nix
      vim-floaterm
      customPlugins.vim-openscad
      nvim-lspconfig
      telescope-nvim
      vim-sleuth
      nvim-tree-lua
      nvim-web-devicons
      customPlugins.smartyank
      leap-nvim
      rust-tools-nvim
      symbols-outline-nvim
    ];
    extraConfig = builtins.readFile ./extra_init.vim;
    vimAlias = true;
    vimdiffAlias = true;
  };

  home.packages = [ pkgs.nil pkgs.nixpkgs-fmt ];
}
