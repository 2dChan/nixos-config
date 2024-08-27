{
	config,
	...
}:

{
	sops.secrets."wireless.env" = { };

	networking = { 	
		wireless = {
			enable = true;
			
			environmentFile = config.sops.secrets."wireless.env".path;
			networks = {
				"@uuid1@" = {
					hidden = true;
					psk = "@psk1@";
				};
			};
		};

		# Optimization boot.
		dhcpcd.wait = "background";
		dhcpcd.extraConfig = "noarp";
	};
}
