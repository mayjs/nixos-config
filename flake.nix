{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix.url = "github:ryantm/agenix";
  };

  outputs = { self, home-manager, nixpkgs, agenix, ... }: let
    mkSystem = import ./lib/mkSystem.nix;
    default-system = "x86_64-linux";
  in {
    nixosConfigurations.despair = mkSystem {
      inherit nixpkgs home-manager agenix;
      system-name = "despair";
      system = default-system;
      user = "may";
    };
    nixosConfigurations.bane = mkSystem {
      inherit nixpkgs home-manager agenix;
      system-name = "bane";
      system = default-system;
      user = "may";
    };

    hydraJobs.despair."x86_64-linux" = self.nixosConfigurations.despair.config.system.build.toplevel;
  };
}
