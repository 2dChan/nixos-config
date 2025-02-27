{
  config,
  ...
}:

let
  home = "${config.home.homeDirectory}";

in
{
  sops = {
    secrets = {
      "ssh/id/ed25519/public-key" = {
        path = "${home}/.ssh/id_ed25519.pub";
      };
      "ssh/id/ed25519/private-key" = {
        path = "${home}/.ssh/id_ed25519";
      };
    };
  };
}
