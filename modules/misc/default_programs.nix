{pkgs,...}:

{
  environment.systemPackages = with pkgs; [
     wget neovim htop git bash
     ecryptfs ecryptfs-helper
     borgbackup
  ];
}
