{
	pkgs,
	...
}:

{
	home.packages = with pkgs; [
		bluetuith
		brightnessctl
		pamixer
		p7zip
		swww
		telegram-desktop
		wget
		wl-clipboard
	];
}
