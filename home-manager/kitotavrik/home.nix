{
  osConfig,
  ylib,
  ...
}:

{
  # TODO: ADD linux import is pkgs.stdenv.isLinux == true.
  imports = ylib.umport {
    paths = [
      ./common
    ];
    exclude = [
      ./home.nix
    ];
    recursive = true;
  };

  home = {
    # username = "kitotavrik"; TODO: Only nixos, maybe not needed?
    homeDirectory = "${osConfig.users.users.kitotavrik.home}";
  };
}
