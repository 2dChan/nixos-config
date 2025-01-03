_:

{
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/d476aa47-5fe9-4333-bdd7-edac2163c08a";
      fsType = "ext4";
    };

    "/home" = {
      device = "/dev/disk/by-uuid/072d8696-9626-4cd3-9bdb-809e5b3ce382";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/256D-9FE3";
      fsType = "vfat";
      options = [
        "fmask=0022"
        "dmask=0022"
      ];
    };

    "/media/hdd" = {
      device = "/dev/disk/by-uuid/895ef5b9-cf7c-4669-98de-23c57aaebea7";
      fsType = "ext4";
    };
  };

  swapDevices = [
    {
      device = "/dev/disk/by-uuid/48af42cf-18b1-466b-abcf-42549505db83";
    }
  ];
}
