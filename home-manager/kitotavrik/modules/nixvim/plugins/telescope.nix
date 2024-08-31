_:

{
	programs.nixvim.plugins.telescope = {
		enable = true;

		keymaps = {
			"<leader>ff" = "find_files";
			"<leader>gs" = "grep_string";
			"<leader>b" = "buffers";
			"<leader>of" = "oldfiles";
		};
	};
}
