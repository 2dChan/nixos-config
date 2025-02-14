{
  pkgs,
  ...
}:

{
  gtk = {
    iconTheme.name = "WhiteSur-dark";
    iconTheme.package = pkgs.whitesur-icon-theme;
  };
}
