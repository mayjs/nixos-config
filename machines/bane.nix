{config, pkgs,...}:

{
  imports = [
    ../modules/misc 
    ../modules/hardware/amdgpu.nix
    ../modules/wayland.nix
    ../modules/gnome-keyring.nix
    ../modules/printing.nix
    ../modules/sshd.nix
    ../modules/gaming.nix
    ../modules/default-users.nix
    ../modules/caps2esc.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.kernelModules = [ "amdgpu" ];
  virtualisation.docker.enable = true;

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp0s31f6.useDHCP = true;
  networking.interfaces.wlp6s0.useDHCP = true;
  networking.networkmanager.enable = true;

  programs.dconf.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     # The lines below should be either separated into their own file or install using something like home-manager
     tdesktop # Telegram Desktop
     firefox-wayland thunderbird-wayland
     # firefox thunderbird
     keepassxc
     sshfs

     wayfire
     wf-config
     grim wofi
     waybar
  ];

  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # setings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

  # Enable crypto
  security.pam.enableEcryptfs = true;
}
