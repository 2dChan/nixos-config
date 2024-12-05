{
	lib,
	...
}:

{
	# TODO: setup boot setings.
	
	boot.loader = {
		timeout = 0;	
		
		systemd-boot = {
			enable = true;
			consoleMode = lib.mkForce "auto";
			configurationLimit = 10;
		};
	};
}
