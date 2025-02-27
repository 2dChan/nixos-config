_: {
  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    optimise.automatic = true;
    gc = {
      automatic = true;
      interval = {
        Hour = 0;
        Minute = 0;
        Weekday = 7;
      };
      options = "--delete-older-than 1w";
    };
  };

  nixpkgs.hostPlatform = "aarch64-darwin";

  documentation.enable = false;
}
