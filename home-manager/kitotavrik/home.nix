{
  pkgs,
  ylib,
  ...
}:

{
  imports = ylib.umport {
    paths = [
      ./common
    ];
    recursive = true;
  };
  home =
    if pkgs.stdenv.isLinux then
      {
        username = "kitotavrik";
        homeDirectory = "/home/kitotavrik";
        stateVersion = "24.05";
      }
    else if pkgs.stdenv.isDarwin then
      {
        homeDirectory = "/Users/kitotavrik";
        stateVersion = "25.05";
      }
    else
      { };
}
