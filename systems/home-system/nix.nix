{
	lib,
	stateVersion,
	...
}:

{
	nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
		"nvidia-x11"
	];

	nix = {
		settings.experimental-features = [ "nix-command" "flakes" ];
		optimise.automatic = true;
		gc = {
			automatic = true;
			dates = "weekly";
			options = "--delete-older-than 1w";
		};
	};

	documentation.nixos.enable = false;	

	system.stateVersion = stateVersion;
}
