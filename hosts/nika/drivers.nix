_:

{
	boot.loader.efi.canTouchEfiVariables = false;

	services = {
		fstrim.enable = true;
	};

	hardware = {
		graphics.enable = true;
		
		asahi = {
			withRust = true;
			useExperimentalGPUDriver = true;
			experimentalGPUInstallMode = "replace";
		};

		bluetooth = {
			enable = true;
			powerOnBoot = true;
		};
	};
}
