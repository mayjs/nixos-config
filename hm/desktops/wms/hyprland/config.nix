{ ... }:

let range=(builtins.genList (x: x+1)); 
  workspaces=9; # Max 9 workspaces supported right now
in
{
  wayland.windowManager.hyprland.extraConfig = ''
    $mod = SUPER

    exec-once = bash -c "systemctl --user import-environment; systemctl --user start graphical-session.target"
    exec-once = gnome-keyring-daemon -s

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

    binds {
      workspace_back_and_forth = true
      allow_workspace_cycles = true
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
    bind=$mod CONTROL,Right,workspace,e+1
    bind=$mod CONTROL,Left,workspace,e-1
    bind=$mod CONTROL SHIFT,Right,movetoworkspace,+1
    bind=$mod CONTROL SHIFT,Left,movetoworkspace,-1

    # Special workspace / overlayable workspace for an always-open terminal
    bind=$mod,T,togglespecialworkspace
    bind=$mod SHIFT,T,movetoworkspace,special
  '';
}
