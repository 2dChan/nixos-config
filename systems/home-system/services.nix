_:

{
	
	services = {
		dbus.enable = true;

		getty.autologinUser = "kitotavrik";

		pipewire = {
			enable = true;
			jack.enable = true;
			pulse.enable = true;
			
			alsa = {
				enable = true;
				support32Bit = true;
			};

			wireplumber.extraConfig = {
				"monitor.bluez.properties" = {
					"bluez5.enable-sbc-xq" = true;
					"bluez5.enable-msbc" = true;
					"bluez5.enable-hw-volume" = true;
					"bluez5.roles" = [ "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag" ];
				};
			};
		};
	};
}
