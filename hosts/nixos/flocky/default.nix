{
  pkgs,
  inputs,
  config,
  ...
}:
{
  imports = [
    ../../../modules/hosts/common/core

    ../../common/users/kilisei
    ../../common/core
    ../../common/optional/gaming.nix
    ../../common/optional/restic.nix
    ../../common/optional/audio.nix
    ../../common/optional/yubikey.nix

    ./hardware-configuration.nix
    ./networking.nix
    ./gnome.nix
    inputs.nixos-hardware.nixosModules.common-cpu-intel
    inputs.nixos-hardware.nixosModules.common-gpu-amd
    inputs.nixos-hardware.nixosModules.common-pc-ssd
    inputs.sops-nix.nixosModules.sops
  ];

  sops.secrets = {
    "user/kilisei/password/login" = {
      owner = config.users.users.kilisei.name;
    };
    "user/kilisei/password/restic" = {
      owner = config.users.users.kilisei.name;
      # mode = "0400";
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      device = "nodev";
      configurationLimit = 3;
      efiSupport = true;
      useOSProber = true;
    };
  };

  services.udev.extraRules = ''
    # Universal rule for all Vial-compatible keyboards
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
  '';

  system.stateVersion = "24.11";
}
