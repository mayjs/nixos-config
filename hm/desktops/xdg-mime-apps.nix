{ pkgs, ... }:

{
  xdg.mimeApps = {
    enable = true;
    # This will create ~/.config/mimeapps.list (see https://wiki.archlinux.org/title/XDG_MIME_Applications)
    defaultApplications = {
      "inode/directory" = [ "pcmanfm.desktop" ];
    };
  };

  home.packages = [
    pkgs.xdg-utils
  ];
}
