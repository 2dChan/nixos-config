{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    bluetuith
    brightnessctl
    pamixer
    p7zip
    swww
    wget
    wl-clipboard
  ];
}
