{ pkgs, ... }:

{
  home.packages = with pkgs; [
    inkscape
    darktable
    geeqie
  ];
}
