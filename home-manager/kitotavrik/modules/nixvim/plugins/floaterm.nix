_:

{
  programs.nixvim.plugins.floaterm = {
    enable = true;

    width = 0.7;
    height = 0.7;

    title = "Terminal";

    keymaps.toggle = "<leader>t";
  };
}
