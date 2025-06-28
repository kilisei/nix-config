{pkgs, ...}: {
  imports = [
    ./zsh.nix
    ./ghostty.nix
    ./zoxide.nix
    ./backups.nix
    ./git.nix
    ./nix.nix
  ];

  home.packages = with pkgs; [
    prismlauncher
    vial
    gnome-sound-recorder
  ];

  programs.home-manager.enable = true;
}
