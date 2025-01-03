_:

{
  sops = {
    defaultSopsFile = "${./secrets.yaml}";
    defaultSopsFormat = "yaml";
    age.keyFile = "/keys.txt";
  };
}
