{
  pkgs,
  config,
  lib,
  ...
}:
let
  patches = pkgs.fetchFromGitea {
    domain = "codeberg.org";
    owner = "dwl";
    repo = "dwl-patches";
    rev = "main";
    sha256 = "sha256-Pl64ZZsnWtv1c+m83euJ9ukBeGxIvKGQHv5qPDp3qnc=";
  };

  dwl-custom = pkgs.dwl.overrideAttrs (_oldAttrs: {
    src = ./source;
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
    			while $do ||  [ -f /tmp/restart_dwl ]; do
    			    do=false
    			    rm -rf /tmp/restart_dwl > /dev/null 2>&1
    			    dwl -s "swww-daemon & ags run" 2> ~/.cache/dwl.txt 
    			done
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

          edp1_scale = 1.74;
        }
      );
    })

    dwl-start
  ];
}
