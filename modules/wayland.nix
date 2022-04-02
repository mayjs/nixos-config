{...}:

# Provides basic wayland infrastructure
{
  programs.xwayland.enable = true;
  environment.variables.GDK_BACKEND = "wayland";
  environment.variables.QT_QPA_PLATFORM = "wayland";
}
