{
	pkgs,
	...
}:

{
	programs.fish = {
		enable = true;

		interactiveShellInit = ''
			set fish_greeting
		'';

		plugins = [
			{ name = "sponge";     inherit (pkgs.fishPlugins.sponge) src;    }
			{ name = "autopair";   inherit (pkgs.fishPlugins.autopair) src;  }
			{ name = "tide";       inherit (pkgs.fishPlugins.tide) src;      }
		];
	};
}

