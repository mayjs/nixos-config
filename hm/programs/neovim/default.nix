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
      };
    in
     with pkgs.vimPlugins; [customPlugins.vim-code-dark vim-airline vim-nix vim-floaterm customPlugins.vim-openscad nvim-lspconfig telescope-nvim vim-sleuth];
    extraConfig = builtins.readFile ./extra_init.vim;
    vimAlias = true;
    vimdiffAlias = true;
  };
}
