{
  ylib,
  ...
}:

{
  # TODO: Add linux import is pkgs.stdenv.isLinux == true.
  imports = ylib.umport {
    paths = [
      ./common
    ];
    include = [
      ./home.nix
    ];
    recursive = true;
  };
}
