{pkgs, ...}: {
  programs.helix = {
    enable = true;
    settings = {
      theme = "dark_plus";
    };
    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.alejandra}/bin/alejandra";
      }
    ];
  };
}
