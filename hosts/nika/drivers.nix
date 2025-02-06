_:

{
  boot = {
    loader.efi.canTouchEfiVariables = false;
    kernelParams = [
      "apple_dcp.show_notch=1"
    ];
  };

  networking.hostName = "nika";

  services = {
    fstrim.enable = true;
    udev.extraRules = ''
      		SUBSYSTEM=="power_supply", KERNEL=="macsmc-battery", ATTR{charge_control_end_threshold}="80"
      	'';
  };

  hardware = {
    graphics.enable = true;

    asahi = {
      peripheralFirmwareDirectory = ./firmware;
      withRust = true;
      useExperimentalGPUDriver = true;
      setupAsahiSound = true;
    };

    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  system.stateVersion = "24.05";
}
