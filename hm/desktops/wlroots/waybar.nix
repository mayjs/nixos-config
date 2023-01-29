{pkgs, ...}:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    # Use the hyprland waybar override
    package = pkgs.waybar-hyprland;

    settings = {
      mainBar = {
        modules-left = [ "wlr/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [  "pulseuadio" "cpu" "memory" "network" "tray" "clock" ];

        "wlr/workspaces" = {
          on-click = "activate";
        };
      };
    };

  };
}
