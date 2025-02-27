{
  ...
}:

{
  imports = [
    ./drivers.nix
    ./hardware-configuration.nix
  ];

  system.stateVersion = "24.05";
  home-manager.users.kitotavrik.home.stateVersion = "24.05";
}
