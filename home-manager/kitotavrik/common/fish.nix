{
  pkgs,
	lib,
  ...
}:

{
  programs = {
    fish = {
      enable = true;

      interactiveShellInit = ''
        				set fish_greeting
        			'';

      shellAliases = {
        nd = "nix develop -c fish";
        nr = if pkgs.stdenv.isLinux then "sudo nixos-rebuild" else if pkgs.stdenv.isDarwin then "darwin-rebuild --flake $HOME/Documents/nixos-config/" else null;
        bat = lib.mkIf pkgs.stdenv.isLinux "cat /sys/class/power_supply/macsmc-battery/capacity";
      };

      plugins = [
        {
          name = "sponge";
          inherit (pkgs.fishPlugins.sponge) src;
        }
        {
          name = "autopair";
          inherit (pkgs.fishPlugins.autopair) src;
        }
        {
          name = "tide";
          inherit (pkgs.fishPlugins.tide) src;
        }
        {
          name = "z";
          inherit (pkgs.fishPlugins.z) src;
        }
      ];
    };
  };
}
