{
	pkgs,
	...
}:

{
	programs = {
		fish = {
			enable = true;

			interactiveShellInit = ''
				set fish_greeting
				set -g fish_key_bindings fish_vi_key_bindings
			'';

			plugins = [
				{ name = "sponge";     inherit (pkgs.fishPlugins.sponge) src;    }
				{ name = "autopair";   inherit (pkgs.fishPlugins.autopair) src;  }
				{ name = "tide";       inherit (pkgs.fishPlugins.tide) src;      }
				{ name = "z";          inherit (pkgs.fishPlugins.z) src;         }
			];
		};
	};
}

