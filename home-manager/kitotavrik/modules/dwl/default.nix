{
	pkgs,
	...
}:

{
	home.packages = with pkgs; [(
		pkgs.dwl.overrideAttrs (oldAttrs: {
			src = ./source;
		})

	)
	];
}
