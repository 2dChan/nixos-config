{
  inputs,
  pkgs,
  ...
}:

{
  programs.ags = {
    enable = true;
    # configDir = ./source;

    extraPackages = with pkgs; [
      inputs.ags.packages.${pkgs.system}.wireplumber
      inputs.ags.packages.${pkgs.system}.bluetooth
    ];
  };
}
