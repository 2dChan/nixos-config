{
	pkgs,
	...
}:

{
	home.packages = with pkgs; [
		ripgrep      # Need for telescope live grep.
	];
}
