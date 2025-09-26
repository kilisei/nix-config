{
  pkgs,
  inputs,
  config,
  ...
}:
let
  allowedKeys = [
    "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIKuKTaeCob15gCN8VA3zj4CkO65Zq2qK2bJmmLutkRbPAAAABHNzaDo= kilisei@nixos"
  ];
in
{
  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-pc-ssd

    ../../common/core
    ./hardware-configuration.nix
    ./boot.nix
    ./networking.nix
    ./secrets.nix
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
    openssh.authorizedKeys.keys = allowedKeys;
  };
  users.users.root.openssh.authorizedKeys.keys = allowedKeys;

  environment.systemPackages = with pkgs; [
    neovim
    git
  ];

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      AllowUsers = [
        config.users.users.kilisei.name
        "root"
      ];
    };
  };

  system.stateVersion = "24.11";
  system.name = "water";
}
