{pkgs, lib, ...}:

{
  systemd.user.services.wayfire_background = let swaybg_randomize = (
    pkgs.writeTextFile {
      name = "swaybg_randomize";
      destination = "/bin/swaybg_randomize";
      executable = true;
      text = ''
        #! ${pkgs.bash}/bin/bash
        
        WALLPAPER_PATH="$HOME/Pictures/wallpapers"
        # Only checking for extensions here, should do some kind of mimetype check as well.
        
        RANDOM_WALLPAPER=$(find "$WALLPAPER_PATH" -type f \( -name "*.jpg" -o -name "*.png" \) | shuf -n 1)
        if [ -n "$RANDOM_WALLPAPER" ]; then
          ${pkgs.swaybg}/bin/swaybg --mode fill --image "$RANDOM_WALLPAPER"
        else
          >&2 echo "No wallpapers found"
        fi
      '';
    }
    );
  in
  {  
    Unit = {
      Description = "Wayfire background image through swaybg";
      Requires = [ "graphical-session-pre.target" ];
      After = [ "graphical-session-pre.target" "tray.target" ];
      PartOf = [ "graphical-session.target" ];
    };

    Install = { WantedBy = [ "graphical-session.target" ]; };

    Service = {
      ExecStart = "${swaybg_randomize}/bin/swaybg_randomize";
    };
  };
}
