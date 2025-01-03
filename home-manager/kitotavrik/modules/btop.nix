{
  lib,
  ...
}:

{
  programs.btop = {
    enable = true;
    settings = {
      # TODO: Delete mkForce when remove stylix.
      color_theme = lib.mkForce "Default";
    };
  };

  xdg.desktopEntries.btop = {
    name = "Btop";
    noDisplay = true;
  };
}
