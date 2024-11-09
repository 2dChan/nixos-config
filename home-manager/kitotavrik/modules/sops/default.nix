_:

{
	sops = {
		age.keyFile = "/keys.txt";
		defaultSopsFile = ./secrets.yaml;
		defaultSopsFormat = "yaml";
	};
}
