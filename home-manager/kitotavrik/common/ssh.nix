_:

{
  # Codeburg ssh keys.
  sops = {
		# TODO: On linux home on darwin Users.
    secrets = {
      "ssh/id/ed25519/public-key" = {
        path = "/Users/kitotavrik/.ssh/id_ed25519.pub";
      };
      "ssh/id/ed25519/private-key" = {
        path = "/Users/kitotavrik/.ssh/id_ed25519";
      };
    };
  };
}
