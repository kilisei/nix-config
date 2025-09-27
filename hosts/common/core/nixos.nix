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
      optimise = {
        automatic = true;
        dates = [ "daily" ];
      };

      settings = {
        experimental-features = [
          "nix-command"
          "flakes"
        ];
        connect-timeout = 5;
        min-free = 128000000;
        max-free = 1000000000;

        keep-outputs = true;

        flake-registry = "";
        nix-path = config.nix.nixPath;
        substituters = [
          "https://cache.nixos.org" # Official global cache
          "https://nix-community.cachix.org" # Community packages
        ];
      };

      channel.enable = false;
      registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
      nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
    };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--delete-older-than 20d";
    flake = "/home/user/${config.hostSpec.home}/nix-config";
  };
}
