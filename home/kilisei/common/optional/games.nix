{ pkgs, ... }:
{
  home.packages = with pkgs; [
    modrinth-app
  ];
  nixpkgs.overlays = [
    (final: prev: {
      jdk8 = final.openjdk8-bootstrap;
    })
  ];
}
