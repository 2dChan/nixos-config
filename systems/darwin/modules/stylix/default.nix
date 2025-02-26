{
  pkgs,
  ...
}:

let
  image = ./disable.png; # Black 1px image, because option can't disable.
  base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

in
{
  stylix = {
    enable = true;

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.fira-code;
        name = "Fira Code Nerd Font";
      };

      sizes.terminal = 14;
      sizes.desktop = 12;
    };

    inherit image base16Scheme;
  };
}
