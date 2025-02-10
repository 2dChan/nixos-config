{
  config,
  pkgs,
  ...
}:

{
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "cat";

  security = {
    # rtkit using for pipewire optional but recommended.
    rtkit.enable = true;
  };

  services = {
    fstrim.enable = true;
    xserver.videoDrivers = [ "nvidia" ];

    pipewire = {
      enable = true;
      jack.enable = true;
      pulse.enable = true;

      alsa = {
        enable = true;
        support32Bit = true;
      };

      wireplumber.extraConfig = {
        "monitor.bluez.properties" = {
          "bluez5.enable-sbc-xq" = true;
          "bluez5.enable-msbc" = true;
          "bluez5.enable-hw-volume" = true;
          "bluez5.roles" = [
            "hsp_hs"
            "hsp_ag"
            "hfp_hf"
            "hfp_ag"
          ];
        };
      };
    };
  };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    graphics = {
      enable = true;

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

  monitors = [
    {
      name = "eDP-1";
      mfact = 0.55;
      position.x = 2560;
    }
    {
      name = "HDMI-A-1";
      mfact = 0.65;
      rate = 60.0;
    }
  ];

  system.stateVersion = "24.05";
}
