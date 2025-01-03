{
  pkgs,
  pkgs24_05,
  ...
}:

let
  image = ./disable.png; # Black 1px image, because option can't disable.
  base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-medium.yaml";

in
{
  stylix = {
    enable = true;

    fonts = {
      monospace = {
        package = pkgs.fira-code-nerdfont;
        name = "Fira Code Nerd Font";
      };

      sizes.terminal = 12;
      sizes.desktop = 12;
    };

    cursor = {
      size = 24;
      name = "macOS-Monterey";
      package = pkgs24_05.apple-cursor;

    };

    inherit image base16Scheme;
  };
}
