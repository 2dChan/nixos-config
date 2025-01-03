{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    kotatogram-desktop
  ];

  xdg.desktopEntries."io.github.kotatogram" = {
    name = "Telegram";
    exec = "kotatogram-desktop -- %u";
  };
}
