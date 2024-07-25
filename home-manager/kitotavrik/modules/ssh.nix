_:

{
	# Codeburg ssh keys.
	sops = {
		secrets = {
			"ssh/git/public-key" = {
				path = "/home/kitotavrik/.ssh/id_ed25519.pub";
			};
			"ssh/git/private-key" = {
				path = "/home/kitotavrik/.ssh/id_ed25519";
			};
		};
	};
}
