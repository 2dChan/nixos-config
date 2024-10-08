_:

{
	# Codeburg ssh keys.
	sops = let
		ssh_path = "/home/kitotavrik/.ssh/";
	in {
		secrets = {
			"ssh/id/ed25519/public-key" = {
				path = "/home/kitotavrik/.ssh/id_ed25519.pub";
			};
			"ssh/id/ed25519/private-key" = {
				path = "/home/kitotavrik/.ssh/id_ed25519";
			};
			"ssh/id/rsa/public-key" = {
				path = "/home/kitotavrik/.ssh/id_rsa.pub";
			};
			"ssh/id/rsa/private-key" = {
				path = "/home/kitotavrik/.ssh/id_rsa";
			};
		};
	};
}
