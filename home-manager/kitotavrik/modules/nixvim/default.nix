_:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
  };

  xdg.desktopEntries.nvim = {
    name = "nvim";
    noDisplay = true;
  };
}
