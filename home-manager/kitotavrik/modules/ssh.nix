_:

{
  # Codeburg ssh keys.
  sops = {
    secrets = {
      "ssh/id/ed25519/public-key" = {
        path = "/home/kitotavrik/.ssh/id_ed25519.pub";
      };
      "ssh/id/ed25519/private-key" = {
        path = "/home/kitotavrik/.ssh/id_ed25519";
      };
    };
  };
}
