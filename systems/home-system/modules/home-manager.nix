{
  ylib,
  inputs,
  pkgs23_11,
  ...
}:

{
  home-manager = {
    extraSpecialArgs = {
      inherit inputs ylib pkgs23_11;
    };
    useGlobalPkgs = true;
    useUserPackages = true;
    sharedModules = [
      inputs.ags.homeManagerModules.default
      inputs.nixvim.homeManagerModules.nixvim
      inputs.sops-nix.homeManagerModules.sops
    ];

    users.kitotavrik = import ../../../home-manager/kitotavrik/home.nix;
  };
}
