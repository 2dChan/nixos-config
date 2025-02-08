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

  monitors = [
    {
      name = "eDP-1";
      mfact = 0.55;
      scale = 1.74;
      position.x = 2560;
    }
    {
      name = "HDMI-A-1";
      mfact = 0.65;
      rate = 144.0;
    }
  ];

  system.stateVersion = "24.05";
}
