{
	lib,
	...
}:

{
	options.eDP-1 = {
		scale = lib.mkOption {
			type = lib.types.float;
			default = 1.0;
		};
		position = {
			x = lib.mkOption {
				type = lib.types.int;
				default = 2560;
			};
			y = lib.mkOption {
				type = lib.types.int;
				default = 0;
			};
		};
		rate = lib.mkOption {
			type = lib.types.float;
			default = 60.0;
		};
	};
}
