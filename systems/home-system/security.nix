{
	pkgs,
	...
}:

{
	security = {
		polkit.enable = true;
		# rtkit using for pipewire optional but recommended.
		rtkit.enable = true; 

		sudo = {
			enable = true;
		};
	};
}
