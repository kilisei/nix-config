{ pkgs, ... }:
{
  home.packages = with pkgs; [
    modrinth-app
    prismlauncher
    lunar-client
    mesa
    vulkan-tools
      ];
  nixpkgs.overlays = [
    (final: prev: {
      jdk8 = final.openjdk8-bootstrap;
    })
  ];

  programs.lutris = {
    enable = true;
    extraPackages = with pkgs; [
      mangohud
      winetricks
      gamescope
      gamemode
      umu-launcher
      vulkan-tools
    ];
    winePackages = [ pkgs.wineWow64Packages.full ];
    runners = {
      wine.package = pkgs.wine-wayland;
    };
  };
}
