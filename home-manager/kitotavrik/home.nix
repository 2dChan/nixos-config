{
  osConfig,
  ...
}:

{
  home = {
    # username = "kitotavrik"; TODO: Only nixos, maybe not needed?
    homeDirectory = "${osConfig.users.users.kitotavrik.home}";
  };
}
