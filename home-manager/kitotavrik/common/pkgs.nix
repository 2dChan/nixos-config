{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    keepassxc
    p7zip
    wget
  ];
}
