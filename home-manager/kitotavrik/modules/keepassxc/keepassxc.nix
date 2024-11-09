{
	pkgs,
	...
}:

{
	home.packages = with pkgs; [
		keepassxc
	];

	home.file.".config/keepassxc/keepassxc.ini".source = ./keepassxc.ini;
}
