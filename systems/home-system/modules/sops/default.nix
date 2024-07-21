_:

{
	sops = {
		defaultSopsFile = "${./secrets.yaml}";
		defaultSopsFormat = "yaml";
		age.keyFile = "/keys.txt";
		# home/kitotavrik/.config/sops/age/
	};
}
