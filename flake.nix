{
  description = "System configuration.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    apple-silicon-support = {
      url = "github:tpwrules/nixos-apple-silicon";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nika-firmware = {
      url = "/home/kitotavrik/documents/programming/nixos-config/hosts/nika/firmware";
      flake = false;
    };

    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nypkgs = {
      url = "github:yunfachi/nypkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Devops.
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      systems,
      nixpkgs,
      home-manager,
      treefmt-nix,
      ...
    }@inputs:
    let
      eachSystem = f: nixpkgs.lib.genAttrs (import systems) (system: f nixpkgs.legacyPackages.${system});

      treefmtEval = eachSystem (pkgs: treefmt-nix.lib.evalModule pkgs ./devops/treefmt.nix);

      makeHomeSystem =
        name: cfg:
        let
          ylib = inputs.nypkgs.lib.${cfg.system};
          stateVersion = "24.05";

        in
        nixpkgs.lib.nixosSystem {
          inherit (cfg) system;

          modules =
            [
              inputs.stylix.nixosModules.stylix
              inputs.sops-nix.nixosModules.sops

              { networking.hostName = "${name}"; }

              home-manager.nixosModules.home-manager
              {
                home-manager = {
                  extraSpecialArgs = {
                    inherit inputs ylib stateVersion;
                  };

                  useGlobalPkgs = true;
                  useUserPackages = true;
                  sharedModules = [
                    inputs.ags.homeManagerModules.default
                    inputs.nixvim.homeManagerModules.nixvim
                    inputs.sops-nix.homeManagerModules.sops
                  ];

                  users.kitotavrik = import ./home-manager/kitotavrik/home.nix;
                };
              }
            ]
            ++ ylib.umport {
              paths = [
                ./systems/home-system
                ./hosts/${name}
              ];
              recursive = true;
            }
            ++ (cfg.externalModules or [ ]);

          specialArgs = {
            inherit ylib stateVersion inputs;
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

            { hardware.asahi.peripheralFirmwareDirectory = inputs.nika-firmware; }
          ];
        };
      };

    in
    {
      nixosConfigurations = nixpkgs.lib.mapAttrs makeHomeSystem homeSystems;

      formatter = eachSystem (pkgs: treefmtEval.${pkgs.system}.config.build.wrapper);
      checks = eachSystem (pkgs: {
        formatting = treefmtEval.${pkgs.system}.config.build.check self;
      });
    };
}
