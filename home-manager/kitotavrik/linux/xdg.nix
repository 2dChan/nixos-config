_:

{
  xdg = {
    enable = true;

    userDirs = {
      enable = true;

      desktop = "$HOME";
      download = "$HOME/downloads";
      documents = "$HOME/documents";
      templates = "$HOME/templates";
      music = "$HOME/music";
      videos = "$HOME/videos";
      pictures = "$HOME/pictures";
      publicShare = "$HOME/share/public";
    };
  };

  xdg.desktopEntries = {
    btop = {
      name = "Btop";
      noDisplay = true;
    };
    fish = {
      name = "fish";
      noDisplay = true;
    };
    kitty = {
      name = "kitty";
      noDisplay = true;
    };
    "io.github.kotatogram" = {
      name = "Telegram";
      exec = "kotatogram-desktop -- %u";
    };
    nvim = {
      name = "nvim";
      noDisplay = true;
    };
  };
}
