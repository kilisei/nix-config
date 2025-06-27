{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      flake-registry = "";
      nix-path = config.nix.nixPath;
    };
    channel.enable = false;
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  programs.nh = {
     enable = true;
     clean.enable = true;
     clean.extraArgs = "--keep-since 7d --keep 7";
     flake = "/home/kilisei/nixos-config";
   };

  environment.systemPackages = with pkgs; [
    alejandra
    nixd
  ];
}
