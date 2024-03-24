{ nixpkgs, home-manager, system, user, system-name, agenix }:

let getHome = import ../hm/users/${user}/home.nix;
    hostname = import ./hostname.nix;
in
nixpkgs.lib.nixosSystem {
  inherit system;

  modules = [
    ../machines/hardware/${system-name}.nix
    ../machines/${system-name}.nix
    (hostname system-name)

    home-manager.nixosModules.home-manager {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.backupFileExtension = "hmbackup";
      home-manager.users.${user} = getHome system-name;
    }

    agenix.nixosModules.default
    {
      environment.systemPackages = [ agenix.packages.${system}.default ];
    }
  ];
}
