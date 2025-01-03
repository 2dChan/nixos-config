{
	pkgs,
	...
}:

{
	security = {
		polkit.enable = true;

		sudo = {
			enable = true;
		};
	};
}
