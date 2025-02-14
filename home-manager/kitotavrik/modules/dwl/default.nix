{
  pkgs,
  osConfig,
  config,
  lib,
  ...
}:
let
  patches = pkgs.fetchFromGitea {
    domain = "codeberg.org";
    owner = "dwl";
    repo = "dwl-patches";
    rev = "32a21e22613b6cb2a79bad587b4b2b182b2e55f5";
    sha256 = "sha256-8M7FiFXhcdRfYusqdlKQyy/bcaB4EInYiqnM0K+I4n0=";
  };

  dwl-custom = pkgs.dwl.overrideAttrs (_oldAttrs: {
    src = pkgs.fetchFromGitea {
      domain = "codeberg.org";
      owner = "dwl";
      repo = "dwl";
      rev = "0.7";
      sha256 = "sha256-eh5dJ6rnwjqiUXzffhAN5pQ8JUxZEJuJS4G2Dod+wgk=";
    };
    patches = [
      "${patches}/patches/simpleborders/simpleborders-v0.7.patch"
      "${patches}/patches/modes/modes.patch"
      "${patches}/patches/pertag/pertag.patch"
      "${patches}/patches/restore-monitor/restore-monitor.patch"
      "${patches}/patches/naturalscrolltrackpad/naturalscrolltrackpad.patch"
      "${patches}/patches/switchtotag/switchtotag.patch"
      "${patches}/patches/monitorconfig/monitorconfig.patch"
      ./patches/notch.patch
    ];
  });

  dwl-start = pkgs.writeScriptBin "dwl-start" ''
    					do=true
    					while $do ||	[ -f /tmp/restart_dwl ]; do
    							do=false
    							rm -rf /tmp/restart_dwl > /dev/null 2>&1
    							dwl -s "swww-daemon & ags run" 2> ~/.cache/dwl.txt 
    					done
    				'';

  wrapMonitor =
    monitor: with builtins; ''
      		{
      			"${monitor.name}",
      			${toString monitor.mfact},
      			1,
      			${toString monitor.scale},
      			&layouts[0],
      			WL_OUTPUT_TRANSFORM_NORMAL,
      			${toString monitor.position.x},
      			${toString monitor.position.y},
      			${toString monitor.resolution.x},
      			${toString monitor.resolution.y},
      			${toString monitor.rate},
      			${toString monitor.mode},
      			${toString monitor.adaptive}
      		},
      	'';

in
{
  home.packages = with pkgs; [
    (dwl-custom.override {
      configH = builtins.readFile (
        pkgs.substituteAll {
          src = ./config.h;
          root_color = config.lib.stylix.colors.base00;
          border_color = config.lib.stylix.colors.base03;
          focus_color = config.lib.stylix.colors.base0D;
          urgent_color = config.lib.stylix.colors.base08;
          monitors = map wrapMonitor osConfig.monitors;
        }
      );
    })

    dwl-start
  ];
}
