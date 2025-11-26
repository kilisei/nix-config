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
    ../../common/optional/gaming.nix
    ../../common/optional/restic.nix
    ../../common/optional/audio.nix
    ../../common/optional/logitech.nix
    ../../common/optional/bluetooth.nix
    ../../common/optional/yubikey.nix
    ../../common/optional/desktop
    ../../common/optional/vitualisation

    ./hardware-configuration.nix
    ./networking.nix
    # ./services/minecraft-server
    inputs.nixos-hardware.nixosModules.common-cpu-intel
    inputs.nixos-hardware.nixosModules.common-gpu-amd
    inputs.nixos-hardware.nixosModules.common-pc-ssd
    inputs.sops-nix.nixosModules.sops
  ];

  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

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

  programs.nix-ld.enable = true;

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "amdgpu.dcdebugmask=0x400" # Allegedly might help with some crashes
      "split_lock_detect=off" # Alleged gaming perf increase
    ];
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        device = "nodev";
        configurationLimit = 3;
        efiSupport = true;
        useOSProber = true;
      };
    };
  };

  services.udev.extraRules = ''
    # Universal rule for all Vial-compatible keyboards
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
  '';

  services.upower = {
    enable = true;
  };

  system.stateVersion = "25.05";
}
