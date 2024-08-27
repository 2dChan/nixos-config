{
	pkgs,
	lib,
	config,
	...
}:

let
	tofi-launcher = pkgs.writeScriptBin "tofi-launcher"
		(builtins.readFile ./scripts/tofi-launcher.sh);

in {
	home.packages = [
		tofi-launcher
	];

	programs.tofi = {
		enable = true;
		settings = {
			# Text layout.
			prompt-text = "run:";
			prompt-padding = 5;
			result-spacing = 15;
			
			# Window theming.
			width = 1000;
			height = 40;
			outline-width = 0;
			border-width = 2;
			corner-radius = 2;
			padding-top = 8;
			padding-left = 10;

			# Whindow position.
			anchor = "top";
			margin-top = "20%";
			horizontal = true;
			
			# Behavior.
			auto-accept-single = true;
			hide-input = true;
			terminal = "kitty";
			ascii-input = true;
		};
	};

	home.activation = {
		removeTofiCache = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
			tofi_cache=${config.xdg.cacheHome}/tofi-drun
			[[ -f "$tofi_cache" ]] && rm "$tofi_cache"
		'';
	};
}
