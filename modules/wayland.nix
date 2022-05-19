{...}:

# Provides basic wayland infrastructure
{
  programs.light.enable = true; # For setting backlight, this is actually not depending on X or wayland at all, so it may as well be part of another module
  programs.xwayland.enable = true;
  environment.variables.GDK_BACKEND = "wayland";
  environment.variables.QT_QPA_PLATFORM = "wayland";
}
