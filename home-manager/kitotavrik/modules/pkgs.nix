{
	pkgs,
	...
}:

{
	home.packages = with pkgs; [
		bluetuith
		brightnessctl
		btop
		keepassxc
		pamixer
		p7zip
		swww
		telegram-desktop
		wget
		wl-clipboard
	];
}
