_:

{
	boot.loader.efi.canTouchEfiVariables = false;

	services = {
		fstrim.enable = true;
	};

	hardware = {
		opengl.enable = true;
		
		asahi = {
			# TODO: https://github.com/tpwrules/nixos-apple-silicon/issues/59
			#peripheralFirmwareDirectory = ./firmware;
			withRust = true;
			useExperimentalGPUDriver = true;
			experimentalGPUInstallMode = "replace";
			setupAsahiSound = true;
		};

		bluetooth = {
			enable = true;
			powerOnBoot = false;
		};
	};
	
	services.udev.extraRules = ''
		SUBSYSTEM=="power_supply", KERNEL=="macsmc-battery", ATTR{charge_control_end_threshold}="80"
	'';
}
