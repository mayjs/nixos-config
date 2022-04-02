{pkgs, ...}:

{
  home.file = {
    ".zprofile".text = ''
      if [[ -z $WAYLAND_DISPLAY ]] && [[ $(tty) = /dev/tty1 ]] ; then
	startwayfire
      fi
    '';
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.gnome.gnome-themes-extra;
      name = "Adwaita";
    };
    iconTheme = {
      package = pkgs.gnome.gnome-themes-extra;
      name = "Adwaita";
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
          systemctl --user import-environment
          # then start the service
          exec systemctl --user start wayfire.service
        '';
      }
    )
    wlogout
    xorg.setxkbmap
  ]; 

  systemd.user.services.wayfire = {
    Unit = {
      Description = "Wayfire - Wayland Window Manager";
      Wants = [ "graphical-session-pre.target" ];
      After = [ "graphical-session-pre.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.dbus}/bin/dbus-run-session ${pkgs.wayfire}/bin/wayfire";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  xsession.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Original-Classic";
  };
}
