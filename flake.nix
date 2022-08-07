{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, home-manager, nixpkgs, ... }: let 
    mkSystem = import ./lib/mkSystem.nix;
    overlays = [];
    default-system = "x86_64-linux";
  in {
    nixosConfigurations.despair = mkSystem {
      inherit overlays nixpkgs home-manager;
      system-name = "despair";
      system = default-system;
      user = "may";
    };
    nixosConfigurations.bane = mkSystem {
      inherit overlays nixpkgs home-manager;
      system-name = "bane";
      system = default-system;
      user = "may";
    };

    hydraJobs.despair."x86_64-linux" = self.nixosConfigurations.despair.config.system.build.toplevel;
  };
}
