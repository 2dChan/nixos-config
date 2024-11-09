{
	pkgs,
	lib,
	...
}:

{
	programs.firefox = {
		enable = true;
		package = pkgs.librewolf-wayland;
		
		nativeMessagingHosts = [ pkgs.keepassxc ];
		
		# TODO: Refactor.
		policies = let installExtension = shortId: uuid: {
			name = uuid;
			value = {
				install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
				installation_mode = "normal_installed";
			};
		}; 
		
		in {
			ExtensionSettings = lib.listToAttrs [
				(installExtension "ublock-origin" "uBlock0@raymondhill.net")
				(installExtension "keepassxc-browser" "keepassxc-browser@keepassxc.org")
				(installExtension "sponsorblock" "sponsorBlocker@ajay.app")
			];
		};
	};
	# TODO: https://github.com/nix-community/home-manager/pull/3339
	home.file.".librewolf/native-messaging-hosts".source = /home/kitotavrik/.mozilla/native-messaging-hosts;
}

