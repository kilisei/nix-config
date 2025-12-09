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
    imagemagick
    television
    fd
    act
    clang
    coreutils-full
    nix-tree
    duf
    btop-rocm
  ];

  programs.nh.enable = true;
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;
  systemd.user.startServices = "sd-switch";
}
