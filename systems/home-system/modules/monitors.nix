{
	lib,
	...
}:

{
	options.eDP-1 = {
		adaptive = lib.mkOption {
			type = lib.types.bool;
			default = false;
		};
		rate = lib.mkOption {
			type = lib.types.float;
			default = 60.0;
		};
		scale = lib.mkOption {
			type = lib.types.float;
			default = 1.0;
		};

		position = {
			x = lib.mkOption {
				type = lib.types.int;
				default = 0;
			};
			y = lib.mkOption {
				type = lib.types.int;
				default = 0;
			};
		};
		resolution = {
			x = lib.mkOption {
				type = lib.types.int;
				default = 1920;
			};
			y = lib.mkOption {
				type = lib.types.int;
				default = 1080;
			};
		};
	};
}
