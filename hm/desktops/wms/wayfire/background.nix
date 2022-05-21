{pkgs, lib, ...}:

{
  xdg.configFile."wf-shell.ini".text = lib.generators.toINI {} {
    background = {
      image = "/home/may/Pictures/wallpapers"; # Wallpaper file or directory
      preserve_aspect = 1; # Keep aspect ratio on images that don't match the displays resolution
      cycle_timeout = 150; # Wallpaper changing timeout in seconds
      randomize = 1; # Randomize wallpaper order
    };
  };

  systemd.user.services.wfbackground = {
    Unit = {
      Description = "Wayfire background image";
      Requires = [ "graphical-session-pre.target" ];
      After = [ "graphical-session-pre.target" "tray.target" ];
      PartOf = [ "graphical-session.target" ];
    };

    Install = { WantedBy = [ "graphical-session.target" ]; };

    Service = {
      ExecStart = "${pkgs.wayfirePlugins.wf-shell}/bin/wf-background";
    };
  };
}
