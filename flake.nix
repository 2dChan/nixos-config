{
	description = "System configuration.";
	
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
		
		home-manager = {
			url = "github:nix-community/home-manager/release-24.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		

		stylix.url = "github:danth/stylix";
		
		sops-nix = {
			url = "github:Mic92/sops-nix";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		
		nixvim = {
			url = "github:nix-community/nixvim/nixos-24.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nypkgs = {
			url = "github:yunfachi/nypkgs";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		apple-silicon-support.url = "github:tpwrules/nixos-apple-silicon";
	};
	
	outputs = {
		nixpkgs,
		home-manager,
		nypkgs,
		... 
	}@inputs:
	let
		makeHomeSystem = name: cfg: let
			ylib = nypkgs.lib.${cfg.system};
			stateVersion = "24.05";
		
		in nixpkgs.lib.nixosSystem {
			inherit (cfg) system;

			modules = [
				inputs.stylix.nixosModules.stylix
				inputs.sops-nix.nixosModules.sops

				home-manager.nixosModules.home-manager {
					home-manager = {
						extraSpecialArgs = { inherit ylib stateVersion; };
						
						useGlobalPkgs = true;
						useUserPackages = true;
						sharedModules = [
							inputs.nixvim.homeManagerModules.nixvim
							inputs.sops-nix.homeManagerModules.sops
						];
						
						users.kitotavrik = import ./home-manager/kitotavrik/home.nix;	
					};
				}
			] 
			++ ylib.umport {
				paths = [ ./systems/home-system ./hosts/${name} ];
				recursive = true;
			} 
			++ (cfg.externalModules or []);
			
			specialArgs = {
				inherit ylib stateVersion;
			};
		};

		homeSystems = {
			cat = {
				system = "x86_64-linux";
			};

			nika = {
				system = "aarch64-linux";
				externalModules = [
					inputs.apple-silicon-support.nixosModules.apple-silicon-support
				];
			};
		};
	
	in {
		nixosConfigurations = nixpkgs.lib.mapAttrs makeHomeSystem homeSystems;
	};
}

