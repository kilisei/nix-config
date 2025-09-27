{
  config,
  ...
}:
{
  imports = [
    ./sops.nix
    ./i18n.nix
    ./nixos.nix
  ];

  environment.enableAllTerminfo = true;

  networking = {
    enableIPv6 = false;
    hostName = config.hostSpec.hostName;
    networkmanager.enable = true;
  };
  system.name = config.hostSpec.hostName;

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
}
