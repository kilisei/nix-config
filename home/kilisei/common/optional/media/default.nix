{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vlc
    obs-studio
  ];

  imports = [
    ./music.nix
  ];
}
