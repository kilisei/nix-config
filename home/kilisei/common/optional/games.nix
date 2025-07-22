{ pkgs, ... }:
{
  home.packages = with pkgs; [
    prismlauncher
    modrinth-app
  ];
  nixpkgs.overlays = [
    (final: prev: {
      jdk8 = final.openjdk8-bootstrap;
    })
  ];
}
