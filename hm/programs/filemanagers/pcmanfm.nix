{ pkgs, ... }:

{
  xdg.mimeApps.defaultApplications."inode/directory" = [ "pcmanfm.desktop" ];
  home.packages = [
    pkgs.pcmanfm
  ];
}
