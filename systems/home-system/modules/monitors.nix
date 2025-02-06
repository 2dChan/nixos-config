{
	lib,
	...
}:

{
	options.edp1_scale = lib.mkOption {
		type = lib.types.float;
		default = 1.0;
	};
}
