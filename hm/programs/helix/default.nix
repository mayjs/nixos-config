{ pkgs, ... }:

let tomlFormat = pkgs.formats.toml {};
in
{
  programs.helix = {
    enable = true;
    settings = {
      theme = "dark_plus";
    };
  };
}
