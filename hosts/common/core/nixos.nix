{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    nixd
    nixfmt-tree
  ];

  nix =
    let
      flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
    in
    {
      optimise.automatic = true;
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
      };

      settings = {
        auto-optimise-store = true;

        experimental-features = [
          "nix-command"
          "flakes"
        ];

        min-free = 128 * 1024 * 1024; # 128MiB
        max-free = 1000 * 1024 * 1024; # 1GiB

        keep-outputs = true;

        flake-registry = "";
        nix-path = config.nix.nixPath;
        substituters = [
          "https://cache.nixos.org" # Official global cache
          "https://nix-community.cachix.org" # Community packages
        ];
        connect-timeout = 5;
      };

      channel.enable = false;
      registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
      nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
    };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };
}
