{ pkgs, ... }:
{
  imports = [
    ./bat.nix
    ./eza.nix
    ./fonts.nix
    ./fzf.nix
    ./git.nix
    ./tv.nix
    ./zoxide.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    sl
    sops
    du-dust
    btop
    wrk
    fastfetch
    direnv
    gnumake
    ripgrep
    jq
    cpu-x
    dig
    tree
    imagemagick
  ];

  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;
  systemd.user.startServices = "sd-switch";
}
