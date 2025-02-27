{
  inputs,
  pkgs23_11,
  pkgs,
  ylib,
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

    users.kitotavrik =
      if pkgs.stdenv.isLinux then
        import ./kitotavrik/linux.nix
      else if pkgs.stdenv.isDarwin then
        import ./kitotavrik/darwin.nix
      else
        null;
  };
}
