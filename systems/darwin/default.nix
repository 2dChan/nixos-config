{ pkgs, ... }:
{
  imports = [
    ./modules/stylix
  ];
  environment.systemPackages = with pkgs; [
    git
  ];
  # environment.darwinConfig = "$HOME/Documents/nixos-config";

  nix.settings.experimental-features = "nix-command flakes";

  programs.fish.enable = true;
  environment.shells = [
    pkgs.fish
  ];

  users.users.kitotavrik.home = "/Users/kitotavrik";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
