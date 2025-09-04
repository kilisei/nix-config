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
    sl
  ];

  programs.home-manager.enable = true;
}
