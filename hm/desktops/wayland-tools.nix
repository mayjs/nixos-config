{pkgs, ...}:

{
  imports = [
    ../programs/filemanagers/pcmanfm.nix
    ../programs/image-viewers/nomacs.nix
  ];

  home.packages = with pkgs; [
    # Archive management
    mate.engrampa
    unzip zip

    pavucontrol
    zathura
    sxiv
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
