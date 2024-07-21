{
	pkgs,
	...
}:

{
	programs.nixvim = {
		extraPlugins = [
			(pkgs.vimUtils.buildVimPlugin {
				name = "fine-cmdline";
				src = pkgs.fetchFromGitHub {
					owner = "VonHeikemen";
					repo = "fine-cmdline.nvim";
					rev = "dd676584145d62b30d7e8dbdd011796a8f0a065f";
					hash = "sha256-w9wwjClkOWk3wCgEiZIFLZRJ/gAfX38x2LnVRaelKD8=";
				};
			})
			
			# Dependencies.
			pkgs.vimPlugins.nui-nvim
		];
		
		opts.cmdheight = 0;

		keymaps = [
			{
				action = "<cmd>FineCmdline<CR>";
				key = ":";
				options = {
					silent = true;
					noremap = true;
				};
			}
		];
	};
}
