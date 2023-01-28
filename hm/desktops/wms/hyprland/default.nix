{pkgs, lib, ...}:

{
  imports = [
    ../../wlroots/mako.nix
    ./config.nix
  ];

  wayland.windowManager.hyprland.enable = true;

  # TODO: Find a nice way to make this shell-independent
  programs.bash.initExtra = ''
    if [[ -z $WAYLAND_DISPLAY ]] && [[ $(tty) = /dev/tty1 ]] ; then
      Hyprland
    fi
  '';

  home.packages = with pkgs; [
    wlogout
    alacritty
    wofi
  ];

  # Prefer the SNI protocol for tray icons
  xsession.preferStatusNotifierItems = true;

  gtk = {
    enable = true;
    theme = {
      package = pkgs.gnome.gnome-themes-extra;
      name = "Adwaita-dark";
    };
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus";
    };
  };
  qt.enable = true;

  home.pointerCursor = {
    package = pkgs.gnome.adwaita-icon-theme;
    name = "Adwaita";
    x11.enable = true;
  };

  services.gammastep = {
    enable = true;
    latitude = 47.4;
    longitude = 9.3;
    tray = true;
  };
}
