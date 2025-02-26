_:

{
  sops = {
    age.keyFile = "/Users/kitotavrik/.config/sops/age/keys.txt";
    defaultSopsFile = ./secrets.yaml;
    defaultSopsFormat = "yaml";
  };
}
