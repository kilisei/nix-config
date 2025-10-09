{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vesktop
    teams-for-linux
    chatterino7
  ];
}
