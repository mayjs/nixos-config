{pkgs, ...}: let
  compress-pdf = pkgs.fetchzip {
    url = "https://launchpad.net/compress-pdf/1.x/1.5/+download/Compress-PDF-1.5.zip";
    hash = "sha256-glS+R1QbQVSsxIUQraQ7yW9dYgSFGR2n1U3pYZF3S0M=";
    stripRoot = false;
  };
  compress-pdf-wrapped = pkgs.writeShellApplication {
    name = "compress-pdf";
    runtimeInputs = [pkgs.ghostscript pkgs.zenity pkgs.file];
    text = ''
      ${pkgs.bash}/bin/bash "${compress-pdf}/Compress PDF" "$@"
    '';
  };
in {
  home.file.".local/share/nautilus/scripts/Compress PDF" = {
    source = "${compress-pdf-wrapped}/bin/compress-pdf";
    executable = true;
  };
}
