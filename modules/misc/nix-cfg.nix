{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nix = { package = pkgs.nixVersions.latest;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
   };
}
