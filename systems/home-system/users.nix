{ 
	pkgs,
	config,
	...
}:

{
	sops.secrets."users/kitotavrik/password".neededForUsers = true;
	
	users = {
		# TODO: Check: https://github.com/Mic92/sops-nix/issues/149 
		# mutableUsers = false;

		users = {
			kitotavrik = {
				extraGroups = [ "wheel" ];
				isNormalUser = true;
				shell = pkgs.fish;
				hashedPasswordFile = config.sops.secrets."users/kitotavrik/password".path;

				home = "/home/kitotavrik";
			};	
		};
	};
}

