{
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      inherit (self) outputs;
    in
    {
      nixosConfigurations = builtins.listToAttrs (
        map (host: {
          name = host;
          value = nixpkgs.lib.nixosSystem {
            specialArgs = {
              inherit inputs outputs;
            };
            modules = [ ./hosts/nixos/${host}/configuration.nix ];
          };
        }) (builtins.attrNames (builtins.readDir ./hosts/nixos))
      );

      homeConfigurations = {
        "kilisei@flocky" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          extraSpecialArgs = { inherit inputs outputs system; };
          modules = [ ./home/kilisei/flocky.nix ];
        };
      };
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable?shallow=true";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05?shallow=true";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05?shallow=true";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hardware.url = "github:nixos/nixos-hardware";

    disko = {
      url = "github:nix-community/disko?shallow=true";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim?shallow=true";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:mic92/sops-nix?shallow=true";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox = {
      url = "github:nix-community/flake-firefox-nightly?shallow=true";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
