{pkgs,...}:

{
  # This does not work properly right now with nixos; gnome keyring never gets unlocked...
  security.pam.services.login.enableGnomeKeyring = true;
  services.dbus.packages = [pkgs.gnome.gnome-keyring pkgs.gcr];
  services.dbus.enable = true;
  programs.seahorse.enable = true;
}
