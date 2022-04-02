{ ... }:

{
  imports = [
    ./bootloader.nix
    ./nix-cfg.nix
    ./timezone.nix
    ./i18n.nix
    ./default_programs.nix
    ./default_fonts.nix
  ];
}
