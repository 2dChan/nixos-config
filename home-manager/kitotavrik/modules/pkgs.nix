{
	pkgs,
	...
}:

{
	home.packages = with pkgs; [
		btop
		keepassxc
		overskride
		pamixer
		p7zip
		swww
		telegram-desktop
		wget
		wl-clipboard
	];
}
