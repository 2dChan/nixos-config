{
	config,
	...
}:

{
	sops.secrets."wireless.env" = { };

	networking = {
		nameservers = [ "127.0.0.1" ]; # Blocky dns.

		wireless = {
			enable = true;
			userControlled.enable = true;
			
			environmentFile = config.sops.secrets."wireless.env".path;
			networks = {
				"@uuid1@" = {
					hidden = true;
					psk = "@psk1@";
				};

				"@uuid5@" = {
					priority = 1;
					psk = "@psk5@";
				};

				"@uuid7@" = {
					priority = 2;
					psk = "@psk7@";
				};

				"@uuid6@".priority = 3;
			};	
		};

		# Optimization boot.
		dhcpcd.wait = "background";
		dhcpcd.extraConfig = "noarp";
	};
}
