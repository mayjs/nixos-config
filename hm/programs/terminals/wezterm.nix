{ ... }:

{
  programs.wezterm = {
    enable = true;
    extraConfig = builtins.readFile ./wezterm_cfg.lua;
  };
}
