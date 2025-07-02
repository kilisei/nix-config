{ pkgs, ... }:
{
  imports = [
    ./zsh.nix
    ./ghostty.nix
    ./zoxide.nix
    ./git.nix
  ];

  home.packages = with pkgs; [
    vial
    gnome-sound-recorder
  ];

  programs.home-manager.enable = true;
}
