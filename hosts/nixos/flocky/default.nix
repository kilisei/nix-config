{
  pkgs,
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
    ./networking.nix
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
    };
  };

  hostSpec = {
    hostName = "flocky";
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_6_17;
    kernelParams = [
      "amdgpu.dcdebugmask=0x400" # Allegedly might help with some crashes
      "split_lock_detect=off" # Alleged gaming perf increase
    ];
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        efiSupport = true;
        useOSProber = true;
        device = "nodev";
        configurationLimit = 3;
      };
    };
  };

  services.udev.extraRules = ''
    # Universal rule for all Vial-compatible keyboards
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
  '';

  system.stateVersion = "25.11";
}
