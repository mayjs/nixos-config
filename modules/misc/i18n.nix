{...}:

{
  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };
  # Configure keymap in X11
  services.xserver.xkb.layout = "de,us";
  services.xserver.xkb.variant = "us";
} 
