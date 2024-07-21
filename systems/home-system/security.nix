_:

{
	security = {
		polkit.enable = true;
		# rtkit using for pipewire optional but recommended.
		rtkit.enable = true; 

		sudo.enable = false;
		doas = {
			enable = true;
			
			extraRules = [{
				groups = [ "wheel" ];
				keepEnv = true;
				persist = true;
			}];
		};
	};
}
