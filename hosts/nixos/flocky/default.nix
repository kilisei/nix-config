{
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../common/core
    ./networking.nix
    ./steam.nix
    ./gnome.nix
    ./secrets.nix
  ];

  hostSpec = {
    hostName = "flocky";
  };

  boot.kernelModules = pkgs.linuxPackages_latest;

  services = {
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
    xserver.videoDrivers = [ "amdgpu" ];
  };

  services.udev.extraRules = ''
    # Universal rule for all Vial-compatible keyboards
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
  '';

  system.stateVersion = "24.11";
}
