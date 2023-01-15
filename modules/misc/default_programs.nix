{pkgs,...}:

{
  environment.systemPackages = with pkgs; [
     wget neovim htop git bash
     ecryptfs
     # ecryptfs-helper # FIXME: Broken as of 23/01/15 due to Python 2.7 dependency
     borgbackup
  ];
}
