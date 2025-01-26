_:

{
  programs.nixvim.plugins.floaterm = {
    enable = true;

		settings = {
			width = 0.7;
    	height = 0.7;

    	title = "Terminal";

    	keymap_toggle = "<leader>t";
		};
  };
}
