{ ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;
    shellAliases = import ./aliases.nix {};
  };
}
