{
  description = "System configuration";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs23_11.url = "github:NixOS/nixpkgs/nixos-23.11";

    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    apple-silicon-support = {
      url = "github:tpwrules/nixos-apple-silicon";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nypkgs = {
      url = "github:yunfachi/nypkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix/36c39ff014a8abbc682a073b2c5ba6cea77cf41e";
      #  inputs.nixpkgs.follows = "nixpkgs";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.treefmt-nix.flakeModule
      ];
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];
      perSystem = _: {
        treefmt = {
          projectRootFile = "flake.nix";

          programs.deadnix.enable = true;
          programs.statix.enable = true;
          programs.nixfmt.enable = true;
          programs.shfmt.enable = true;
          programs.prettier.enable = true;

          settings.excludes = [
            "*.lock"
            ".patch"
            "*/dwl/source/*"
          ];
        };
      };
      flake =
        let
          makeHomeSystem =
            name: cfg:
            inputs.nixpkgs.lib.nixosSystem {
              inherit (cfg) system;

              modules = [
                inputs.sops-nix.nixosModules.sops
                inputs.stylix.nixosModules.stylix
                inputs.home-manager.nixosModules.home-manager
                ./hosts/${name}
                ./systems/home-system
              ] ++ (cfg.modules or [ ]);

              specialArgs = {
                pkgs23_11 = import inputs.nixpkgs23_11 {
                  inherit (cfg) system;
                };
                ylib = inputs.nypkgs.lib.${cfg.system};
                inherit inputs;
              };
            };
        in
        {
          nixosConfigurations = inputs.nixpkgs.lib.mapAttrs makeHomeSystem {
            cat = {
              system = "x86_64-linux";
            };

            nika = {
              system = "aarch64-linux";
              modules = [
                inputs.apple-silicon-support.nixosModules.apple-silicon-support
              ];
            };
          };
        };
    };
}
