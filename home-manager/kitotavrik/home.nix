{
	stateVersion,
	ylib,
	...
}:

{
	imports = ylib.umport { 
		paths = [ ./. ];
		exclude = [ ./home.nix ];
		recursive = true;
	};
	
	home = {
		username = "kitotavrik";
		homeDirectory = "/home/kitotavrik";

		inherit stateVersion;
	};
}

