_:

{
	programs.nixvim.plugins.indent-blankline = {
		enable = true;
		settings.scope = {
			enabled = true;
			show_start = false;
			exclude.language = [ "nix" ];
		};
	};
}
