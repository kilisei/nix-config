{ pkgs, config, ... }:
{
  imports = [
    ../../common
    ./hardware-configuration.nix
    ./boot.nix
    ./networking.nix
    ./services
  ];

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  users.users.kilisei = {
    isNormalUser = true;
    description = "kilisei";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    openssh.authorizedKeys.keys = [
      "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIKuKTaeCob15gCN8VA3zj4CkO65Zq2qK2bJmmLutkRbPAAAABHNzaDo= kilisei@nixos"
    ];
  };
  users.users.root.openssh.authorizedKeys.keys = [
    "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIKuKTaeCob15gCN8VA3zj4CkO65Zq2qK2bJmmLutkRbPAAAABHNzaDo= kilisei@nixos"
  ];

  environment.systemPackages = with pkgs; [
    neovim
    home-manager
    git
  ];

  services.openssh.enable = true;

  system.stateVersion = "25.05";
}
