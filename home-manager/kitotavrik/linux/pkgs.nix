{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    bluetuith
    brightnessctl
    kotatogram-desktop
    pamixer
    swww
    wl-clipboard
  ];
}
