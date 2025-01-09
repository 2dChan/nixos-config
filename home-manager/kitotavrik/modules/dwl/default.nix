{
  pkgs,
  config,
  lib,
  ...
}:
let
  dwl-custom = pkgs.dwl.overrideAttrs (_oldAttrs: {
    # src = ./source;
    patches = [
      (pkgs.fetchpatch2 {
        url = "https://codeberg.org/dwl/dwl-patches/raw/branch/main/patches/simpleborders/simpleborders-v0.7.patch";
        hash = "sha256-uHwZkrwm/PjngMUng52FBWU7RrMjwM0o1jqAwZyrjBM=";
      })
      (pkgs.fetchpatch2 {
        url = "https://codeberg.org/dwl/dwl-patches/raw/branch/main/patches/modes/modes.patch";
        hash = "sha256-EWJVJ5kZ22kK1RJtYdVbvVUoTPa24YS4L29tj1WxDBc=";
      })
      (pkgs.fetchpatch2 {
        url = "https://codeberg.org/dwl/dwl-patches/raw/commit/65ea99519bbf7a52f48932aea7385f81f8b30867/patches/pertag/pertag.patch";
        hash = "sha256-3pmvwSiBvPu/mnaineHJOUcmgtKr9xB4yWYvVSlXtrs=";
      })
      (pkgs.fetchpatch2 {
        url = "https://codeberg.org/dwl/dwl-patches/raw/branch/main/patches/restore-monitor/restore-monitor.patch";
        hash = "sha256-ORtLm+y01wzrs/Hw9qZ08iBfcVQH/G6ZdsX5fJ4DQEc=";
      })
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
