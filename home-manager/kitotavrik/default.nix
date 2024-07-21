{
	stateVersion,
	ylib,
	...
}:

{
	imports = ylib.umport { 
		paths = [ ./. ];
		exclude = [ ./default.nix ];
		recursive = true;
	};
	
	home = {
		username = "kitotavrik";
		homeDirectory = "/home/kitotavrik";

		inherit stateVersion;
	};

}
