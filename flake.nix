{
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixvim,
      # disko,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      inherit (self) outputs;
    in
    {
      nixosConfigurations = {
        flocky = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/nixos/flocky/configuration.nix
          ];
        };
        water = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/nixos/water/configuration.nix
          ];
        };
      };

      homeConfigurations = {
        # Main desktop
        "kilisei@flocky" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          extraSpecialArgs = { inherit inputs outputs system; };
          modules = [
            ./home/kilisei/flocky.nix
          ];
        };
        "kilisei@water" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          extraSpecialArgs = { inherit inputs outputs system; };
          modules = [
            ./home/kilisei/water.nix
          ];
        };
      };
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable?shallow=true";

    home-manager = {
      url = "github:nix-community/home-manager?shallow=true";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim?shallow=true";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # disko = {
    #   url = "github:nix-community/disko?shallow=true";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

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
