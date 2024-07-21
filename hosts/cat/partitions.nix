_:

{	
	fileSystems = {
		"/" = {
			device = "/dev/disk/by-uuid/990f49a1-63d8-4d1d-af4a-5cd6318a7604";
			fsType = "ext4";
		};
		
		"/home" = {
			device = "/dev/disk/by-uuid/4c43237f-b9f7-4742-9f8f-5cf84a6aa3d5";
			fsType = "ext4";
		};
		
		"/boot" = {
			device = "/dev/disk/by-uuid/002F-30D5";
			fsType = "vfat";
			options = [ "fmask=0022" "dmask=0022" ];
		};
		
		"/media/hdd" = {
			device = "/dev/disk/by-uuid/895ef5b9-cf7c-4669-98de-23c57aaebea7";
			fsType = "ext4";
		};
	};
	
	swapDevices =[{
		device = "/dev/disk/by-uuid/4fe38bc1-adf6-47bf-81e5-89407b1a3f54";
	}];	
}
