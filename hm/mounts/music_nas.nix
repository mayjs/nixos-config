{ ... }:

{
  systemd.user.mounts.home-may-Music-NAS = {
    Unit = {
      Description = "the photo directory on the NAS";
      After = "graphical-session-pre.target";
      Wants = "graphical-session-pre.target";
    };

    Mount = {
      What = "may@beira.fritz.box:/storage/media/music";
      Where = "/home/may/Music/NAS";
      Type = "fuse.sshfs";
      Options = "_netdev,reconnect,ServerAliveInterval=30,ServerAliveCountMax=5";
      TimeoutSec = 60;
    };
  };
}
