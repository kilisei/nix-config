{ pkgs, ... }:
{
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
}
