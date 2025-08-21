{ pkgs, ... }:
{
  home.packages = with pkgs; [
    modrinth-app
    prismlauncher
    lunar-client
  ];
  nixpkgs.overlays = [
    (final: prev: {
      jdk8 = final.openjdk8-bootstrap;
    })
  ];
}
