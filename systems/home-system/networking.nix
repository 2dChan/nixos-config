{
  config,
  ...
}:

{
  sops.secrets."wireless.env" = { };

  networking = {
    wireless = {
      enable = true;
      userControlled.enable = true;

      secretsFile = config.sops.secrets."wireless.env".path;
      networks = {
        "Dark_Moon5G" = {
          hidden = true;
          pskRaw = "ext:Dark_Moon5G";
        };
      };
    };

    # Optimization boot.
    dhcpcd.wait = "background";
    dhcpcd.extraConfig = "noarp";
  };
}

# TODO: Refactor.
#	"@uuid1@" = {
#		hidden = true;
#		psk = "@psk1@";
#	};

#	"@uuid5@" = {
#		priority = 1;
#		psk = "@psk5@";
#	};

#	"@uuid7@" = {
#		priority = 2;
#		psk = "@psk7@";
#	};

#	"@uuid6@".priority = 3;
