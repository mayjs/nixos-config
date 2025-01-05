{pkgs, ...}: {
  hardware.graphics.enable32Bit = true;
  hardware.graphics.extraPackages32 = with pkgs.pkgsi686Linux; [libva];

  environment.systemPackages = with pkgs; [
    steam
    lutris
    vulkan-tools
    vulkan-loader
  ];
}
