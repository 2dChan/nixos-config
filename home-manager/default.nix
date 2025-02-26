{
  ylib,
  inputs,
  pkgs23_11,
  pkgs,
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
      (pkgs.lib.mkIf pkgs.stdenv.isLinux inputs.ags.homeManagerModules.default)
      inputs.nixvim.homeManagerModules.nixvim
      inputs.sops-nix.homeManagerModules.sops
    ];

    users.kitotavrik = import ./kitotavrik/home.nix;
  };
}
