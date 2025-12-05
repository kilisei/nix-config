{ pkgs, ... }:
{
  imports = [
    ./bat.nix
    ./eza.nix
    ./fonts.nix
    ./fzf.nix
    ./git.nix
    ./zoxide.nix
    ./zsh.nix
  ];

  programs.btop.enable = true;

  home.packages = with pkgs; [
    man-pages
    sl
    sops
    dust
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
    television
    fd
    act
    nodejs_latest
    clang
    rclone
    coreutils-full
    nix-tree
  ];

  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;
  systemd.user.startServices = "sd-switch";
}
