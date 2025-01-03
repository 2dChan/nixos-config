_:

{

  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      settings.indent.enable = true;
    };
    web-devicons.enable = true;
  };
}
