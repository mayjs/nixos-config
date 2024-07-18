{pkgs,...}:

{
  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = with pkgs; [
    rocm-opencl-icd
    rocm-opencl-runtime
    amdvlk
  ];

  services.xserver.videoDrivers = [ "amdgpu" ];

  programs.corectrl.enable = true; # Attempt to workaround 7900XT issues
}
