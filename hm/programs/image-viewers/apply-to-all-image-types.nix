{ pkgs, desktop-file }:

let image-mimetypes = pkgs.lib.forEach [
  "jpeg"
  "bmp"
  "png"
  "svg+xml"
  "svg"
  "tiff"
] (t: "image/" + t);
in 
(pkgs.lib.genAttrs image-mimetypes (mimetype: desktop-file))
