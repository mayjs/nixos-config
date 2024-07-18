{pkgs,...}:

{
  security.pam.services.login.startSession = true;
  security.pam.services.login.enableGnomeKeyring = true;
  services.dbus.packages = [pkgs.gnome-keyring pkgs.gcr];
  services.dbus.enable = true;
  programs.seahorse.enable = true;
}
