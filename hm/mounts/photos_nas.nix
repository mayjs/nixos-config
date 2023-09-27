{ ... }:

{
  systemd.user.mounts.home-may-Pictures-Photos = {
    Unit = {
      Description = "the photo directory on the NAS";
    };

    Mount = {
      What = "may@beira.fritz.box:/storage/private/may/photos";
      Where = "/home/may/Pictures/Photos";
      Type = "fuse.sshfs";
      Options = "_netdev,reconnect,ServerAliveInterval=30,ServerAliveCountMax=5";
      TimeoutSec = 60;
    };
  };
}
