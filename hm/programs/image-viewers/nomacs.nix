{ pkgs, ... }:

let apply-to-all-image-types = import ./apply-to-all-image-types.nix;
in
{
  xdg.mimeApps.defaultApplications = apply-to-all-image-types { inherit pkgs; desktop-file = "org.nomacs.ImageLounge.desktop"; };
  home.packages = [
    pkgs.nomacs
  ];
}
