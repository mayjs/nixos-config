{ ... }:

let range=(builtins.genList (x: x+1)); 
  workspaces=9; # Max 9 workspaces supported right now
in
{
  wayland.windowManager.hyprland.extraConfig = ''
    $mod = SUPER

    general {
      layout = master
    }

    input {
      kb_layout = de
    }

    decoration {
      blur = false
      rounding = 4
      drop_shadow = 1
      shadow_range = 4
    }

    # Master layout stuff
    master {
      orientation = right;
    }
    bind=$mod,J,layoutmsg,cyclenext
    bind=$mod,K,layoutmsg,cycleprev
    bind=$mod,M,layoutmsg,swapwithmaster
    bind=$mod SHIFT,J,layoutmsg,swapnext
    bind=$mod SHIFT,K,layoutmsg,swapprev

    # Move & resize windows
    bindm = $mod, mouse:272, movewindow
    bindm = $mod, mouse:273, resizewindow
    bindm = $mod ALT, mouse:272, resizewindow

    # Basic compositor commands
    bind = $mod,Q,killactive
    bind = $mod,F,fullscreen
    bind = $mod SHIFT,F,togglefloating

    # Basic applications
    bind=$mod,Return,exec,alacritty
    bind=$mod SHIFT,Return,exec,wofi --show=run
    bind=$mod,Escape,exec,wlogout

    # Workspaces ($mod + number => switch to workspace, $mod SHIFT + number => Move window to workspace)
    ${builtins.concatStringsSep "\n" (builtins.map (ws: "bind = $mod,${ws},workspace,${ws}\nbind = $mod SHIFT,${ws},movetoworkspace,${ws}") (builtins.map (ws: builtins.toString ws) (range workspaces)))}

    # Special workspace / overlayable workspace for an always-open terminal
    bind=$mod,T,togglespecialworkspace
    bind=$mod SHIFT,T,movetoworkspace,special
  '';
}
