
{pkgs, ...}:

{
  home.packages = with pkgs; [
    pcmanfm
    mate.engrampa
    pavucontrol
    zathura
    sxiv
    nomacs
  ];
}
