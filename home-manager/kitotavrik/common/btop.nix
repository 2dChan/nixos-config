{
  lib,
  ...
}:

{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = lib.mkForce "Default";
    };
  };
}
