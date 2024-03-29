{ pkgs, ... }:

{
  xdg.mimeApps = {
    # This will create ~/.config/mimeapps.list (see https://wiki.archlinux.org/title/XDG_MIME_Applications)
    # Other modules can then just set xdg.mimeApps.defaultApplications."<mimetype>" = [ "<application>.desktop" ]
    # to register an application as default
    enable = false; # Disable for now due to ongoing Gnome conflicts
  };

  home.packages = [
    pkgs.xdg-utils
  ];
}
