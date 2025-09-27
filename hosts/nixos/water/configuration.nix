{
  pkgs,
  inputs,
  config,
  ...
}:
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
}
