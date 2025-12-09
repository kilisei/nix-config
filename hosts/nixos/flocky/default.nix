{
  inputs,
  config,
  ...
}:
{
  imports = [
    ../../../users/kilisei

    ../../../modules/hosts/common/core

    ../../common/core
    ../../common/optional/desktop

    ../../common/optional/gaming.nix
    ../../common/optional/restic.nix
    ../../common/optional/audio.nix
    ../../common/optional/bluetooth.nix
    ../../common/optional/yubikey.nix
    ../../common/optional/ollama.nix

    ./hardware-configuration.nix
    ./boot.nix
    ./networking.nix

    ./disko.nix
    # inputs.disko.nixosModules.disko

    inputs.sops-nix.nixosModules.sops

    inputs.nixos-hardware.nixosModules.common-cpu-intel
    inputs.nixos-hardware.nixosModules.common-gpu-amd
    inputs.nixos-hardware.nixosModules.common-pc-ssd
  ];

  sops.secrets = {
    "user/kilisei/password/login" = {
      owner = config.users.users.kilisei.name;
    };
    "user/kilisei/password/restic" = {
      owner = config.users.users.kilisei.name;
    };
  };

  hostSpec = {
    hostName = "flocky";
  };

  services.udev.extraRules = ''
    # Universal rule for all Vial-compatible keyboards
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
  '';

  system.stateVersion = "25.11";
}
