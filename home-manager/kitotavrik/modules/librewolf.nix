{
  pkgs,
  lib,
  ...
}:

{
  programs.firefox = {
    enable = true;
    package = pkgs.librewolf-wayland;

    nativeMessagingHosts = [ pkgs.keepassxc ];

    # TODO: Refactor.
    policies =
      let
        installExtension = shortId: uuid: {
          name = uuid;
          value = {
            install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
            installation_mode = "normal_installed";
          };
        };

      in
      {
        ExtensionSettings = lib.listToAttrs [
          (installExtension "ublock-origin" "uBlock0@raymondhill.net")
          (installExtension "keepassxc-browser" "keepassxc-browser@keepassxc.org")

          # TODO: https://github.com/NixOS/nixpkgs/issues/344417
          (installExtension "duckduckgo-for-firefox" "jid1-ZAdIEUB7XOzOJw@jetpack")
        ];

        # TODO: https://github.com/NixOS/nixpkgs/issues/344417
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        Preferences = {
          "cookiebanners.service.mode.privateBrowsing" = 2; # Block cookie banners in private browsing
          "cookiebanners.service.mode" = 2; # Block cookie banners
          "privacy.donottrackheader.enabled" = true;
          "privacy.fingerprintingProtection" = true;
          "privacy.resistFingerprinting" = true;
          "privacy.trackingprotection.emailtracking.enabled" = true;
          "privacy.trackingprotection.enabled" = true;
          "privacy.trackingprotection.fingerprinting.enabled" = true;
          "privacy.trackingprotection.socialtracking.enabled" = true;
        };
      };
  };
  # TODO: https://github.com/nix-community/home-manager/pull/3339
  # home.file.".librewolf/native-messaging-hosts".source = /home/kitotavrik/.mozilla/native-messaging-hosts;
  # (installExtension "sponsorblock" "sponsorBlocker@ajay.app")
}
