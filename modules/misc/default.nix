{ ... }:

{
  imports = [
    ./bootloader.nix
    ./nix-cfg.nix
    ./timezone.nix
    ./i18n.nix
    ./sound.nix
    ./default_programs.nix
    ./default_fonts.nix
  ];
}
