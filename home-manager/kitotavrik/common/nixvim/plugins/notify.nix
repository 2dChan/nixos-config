_:

{
  programs.nixvim.plugins.notify = {
    enable = true;
    settings = {
      stages = "slide";
      fps = 120;
      minimum_width = 30;
    };
  };
}
