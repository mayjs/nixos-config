{ nixpkgs, home-manager, system, user, overlays, system-name, hyprland }:

let getHome = import ../hm/users/${user}/home.nix;
    hostname = import ./hostname.nix;
in
nixpkgs.lib.nixosSystem {
  inherit system;

  modules = [
    { nixpkgs.overlays = overlays; }


    ../machines/hardware/${system-name}.nix
    ../machines/${system-name}.nix
    (hostname system-name)

    home-manager.nixosModules.home-manager {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.backupFileExtension = "hmbackup";
      home-manager.sharedModules = [ hyprland.homeManagerModules.default ];
      home-manager.users.${user} = getHome system-name;
    }
  ];
}
