{
	pkgs,
	...
}:
let
	screenshot = pkgs.writeScriptBin "screenshot"
		(builtins.readFile ./screenshot.sh);

in {
	home.packages = with pkgs; [
		slurp
		grim

		screenshot
	];
}
