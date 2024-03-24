{ ... }:

{
  services.davfs2.enable = true;

  age.secrets.davfs_may = {
    file = ../secrets/davfs_mayjs.age;
    owner = "may";
  };

  fileSystems."/home/may/Pictures/Originals" = {
    device = "https://photoprism.i.may.tf/originals/";
    fsType = "davfs";
    options = [
      "rw"
      "user"
      "uid=may"
      "noauto"
    ];
  };
}
