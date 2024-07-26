{
	config,
	pkgs,
	...
}:

{
	boot.loader.efi.canTouchEfiVariables = true;

	services = {
		fstrim.enable = true;
		xserver.videoDrivers = [ "nvidia" ];
	};

	hardware = {
		bluetooth = {
			enable = true;
			powerOnBoot = true;
		};

		opengl = {
			enable = true;
			driSupport = true;

			extraPackages = with pkgs; [
				intel-media-sdk
			];
		};
		
		nvidia = {
			open = false;
			nvidiaSettings = false;
			package = config.boot.kernelPackages.nvidiaPackages.stable;

			modesetting.enable = true;

			powerManagement = {
				enable = false;
				finegrained = false;
			};
			
			prime = {
				sync.enable = true; # TODO: May be not work or crash system.
				intelBusId = "PCI:0:2:0";
				nvidiaBusId = "PCI:1:0:0";
			};
		};
	};
}
