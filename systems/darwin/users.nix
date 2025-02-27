{
  pkgs,
  ...
}:

{
  users.users = {
    kitotavrik = {
      # TODO: https://github.com/LnL7/nix-darwin/issues/1237
      shell = pkgs.fish;
      home = "/Users/kitotavrik";
    };
  };
}
