_:

{
	boot.loader.efi.canTouchVariables = false;

	services = {
		fstrim.enable = true;
	};

	hardware = {
		asahi.peripheralFirmwareDirectory = ./firmware;

		bluetooth = {
			enable = true;
			powerOnBoot = true;
		};
		
		opengl = {
			enable = true; # TODO: fix to new comand.
			driSupport = true;
		};
	};
}
