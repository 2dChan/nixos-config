{
  inputs,
  ...
}:

{
  boot.loader.efi.canTouchEfiVariables = false;
  #	boot.kernelParams = [
  #		"apple_dcp.show_notch=1"
  #	];

  services = {
    fstrim.enable = true;
  };

  hardware = {
    graphics.enable = true;

    asahi = {
      # TODO: https://github.com/tpwrules/nixos-apple-silicon/issues/59
      peripheralFirmwareDirectory = inputs.nika-firmware;
      withRust = true;
      useExperimentalGPUDriver = true;
      experimentalGPUInstallMode = "replace";
      setupAsahiSound = true;
    };

    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  services.udev.extraRules = ''
    		SUBSYSTEM=="power_supply", KERNEL=="macsmc-battery", ATTR{charge_control_end_threshold}="80"
    	'';
}
