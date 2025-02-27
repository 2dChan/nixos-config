{
  pkgs,
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
        nr = "sudo nixos-rebuild";
        # TODO: Refactor.
        dr = "darwin-rebuild --flake $HOME/Documents/nixos-config/";
        bat = "cat /sys/class/power_supply/macsmc-battery/capacity";
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
