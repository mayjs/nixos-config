{pkgs, ...}: {
  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = with pkgs; [
    rocmPackages.clr
  ];
  hardware.graphics.enable32Bit = true;

  services.xserver.videoDrivers = ["amdgpu"];

  programs.corectrl.enable = true; # Attempt to workaround 7900XT issues
}
