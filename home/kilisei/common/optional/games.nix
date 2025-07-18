{ pkgs, ... }:
{
  home.packages = with pkgs; [
    prismlauncher
  ];
  nixpkgs.overlays = [
    (final: prev: {
      jdk8 = final.openjdk8-bootstrap;
    })
  ];
}
