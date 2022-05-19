
{pkgs, ...}:

{
  home.packages = with pkgs; [
    pcmanfm
    mate.engrampa
    pavucontrol
    zathura
    sxiv
    nomacs
    vlc

    # Screenshots
    slurp
    grim

    # Display locking
    swaylock
    swayidle

    # wayland notifications
    mako
  ];
}
