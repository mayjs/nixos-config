{pkgs, lib, ...}:

{
  imports = [
    ../../wlroots/mako.nix
    ./background.nix
  ];

  # TODO: Find a nice way to make this shell-independent
  programs.bash.initExtra = ''
    if [[ -z $WAYLAND_DISPLAY ]] && [[ $(tty) = /dev/tty1 ]] ; then
      startwayfire
    fi
  '';

  xdg.configFile = {
    "wayfire.ini".source = ./wayfire.ini;
    "waybar/config".source = ./waybar.json;
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.gnome.gnome-themes-extra;
      name = "Adwaita";
    };
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus";
    };
  };
  qt.enable = true;

  home.packages = with pkgs; [ 
   (
      pkgs.writeTextFile {
        name = "startwayfire";
        destination = "/bin/startwayfire";
        executable = true;
        text = ''
          #! ${pkgs.bash}/bin/bash
	  . "/etc/profiles/per-user/may/etc/profile.d/hm-session-vars.sh"


          # Stop any old services that may be running
          systemctl --user stop graphical-session.target graphical-session-pre.target
          # first import environment variables from the login manager
          dbus-update-activation-environment --systemd --all
          # then start the service
          exec systemctl --user start wayfire.service
        '';
      }
    )
    wlogout
    xorg.setxkbmap
    papirus-icon-theme
    pamixer # For volume setting
  ]; 

  systemd.user.services.wayfire = {
    Unit = {
      Description = "Wayfire - Wayland Window Manager";
      Wants = [ "graphical-session-pre.target" ];
      After = [ "graphical-session-pre.target" ];
    };
    Service = {
      Type = "simple";
      # This is assuming we already got a dbus session from the system, otherwise we should use dbus-run-session here
      ExecStart = "${pkgs.wayfire}/bin/wayfire";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Original-Classic";
    x11.enable = true;
  };

  # Prefer the SNI protocol for tray icons; this is the REQUIRED protocol for wayfire / waybar
  xsession.preferStatusNotifierItems = true;

  services.gammastep = {
    enable = true;
    latitude = 47.4;
    longitude = 9.3;
    tray = true;
  };
}
