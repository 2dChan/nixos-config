_:

{
	services = {
		dbus.enable = true;
		blocky = {
		  enable = true;
  	  settings = {
  	    ports.dns = 53;
				ports.http = 4000;
  	    upstreams.groups.default = [
  	      "192.168.8.1"
  	    ];
  	    bootstrapDns = {
  	      upstream = "https://one.one.one.one/dns-query";
  	      ips = [ "1.1.1.1" "1.0.0.1" ];
  	    };
  	    blocking = {
  	      blackLists = {
  	        ads = [ "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts" ];
  	        adult = [
							"https://blocklistproject.github.io/Lists/porn.txt"
							"https://raw.githubusercontent.com/Bon-Appetit/porn-domains/refs/heads/master/block.txt"
						];
						slack = [ ''|
							www.youtube.com
							youtube.com
							m.youtube.com

							www.vk.com
							vk.com
							www.vk.ru
							vk.ru
							
							live.vkvideo.ru
							vkvideo.ru

							rutube.ru

							my.mail.ru
							ok.ru
						''
						];
  	      };
  	      clientGroupsBlock = {
  	        default = [ "ads" "adult" "slack" ];
  	      };
  	    };
  	  };
  	};
	};
}
