{ nixpkgs, home-manager, system, user, overlays, system-name }:

let getHome = import ../hm/users/${user}/home.nix;
in
nixpkgs.lib.nixosSystem rec {
  inherit system;

  modules = [
    { nixpkgs.overlays = overlays; }

    ../machines/hardware/${system-name}.nix
    ../machines/${system-name}.nix

    home-manager.nixosModules.home-manager {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${user} = getHome system-name;
    }
  ];

  extraArgs = {
    currentSystem = system;
  };
}
