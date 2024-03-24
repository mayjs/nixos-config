{osConfig, lib, ... }:

{
  # TODO: This is broken, davfs2 refuses to mount without fstab and this conflicts the fstab cfg.
  #       Can we just have a mount unit that mounts using fstab?
  systemd.user.mounts.home-may-Pictures-Originals = {
    Unit = {
      Description = "the originals directory on the NAS";
      After = "graphical-session-pre.target";
      Wants = "graphical-session-pre.target";
    };

    Install = {
      WantedBy = ["graphical-session.target"];
    };

    Mount = {
      What = "https://photoprism.i.may.tf/originals/";
      Where = "/home/may/Pictures/Originals";
      Type = "davfs";
      TimeoutSec = 60;
    };
  };

  # Symlink the decrypted davfs2 secret file into the home directory
  home.activation.symLinkSecret = lib.hm.dag.entryAfter ["writeBoundary"] ''
    $DRY_RUN_CMD mkdir -p $HOME/.davfs2
    $DRY_RUN_CMD ln -sf $VERBOSE_ARG \
        ${builtins.toPath osConfig.age.secrets.davfs_may.path} $HOME/.davfs2/secrets
  '';
}
