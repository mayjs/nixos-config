{pkgs, ...}:

{
  programs.mako = {
    enable = true;
    defaultTimeout = 10000;
  };
  systemd.user.services.mako = {
    Unit = {
      Description = "Mako notification daemon";
      Requires = [ "tray.target" ];
      After = [ "graphical-session-pre.target" "tray.target" ];
      PartOf = [ "graphical-session.target" ];
    };

    Install = { WantedBy = [ "graphical-session.target" ]; };

    Service = {
      ExecStart = "${pkgs.mako}/bin/mako";
    };
  };
}
