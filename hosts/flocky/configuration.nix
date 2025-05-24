{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../common
    ../../modules/hosts/common/yubikey.nix
  ];

  kilisei.yubikey.enable = true;

  system.stateVersion = "24.11";

  services.udev.extraRules = ''
    # Universal rule for all Vial-compatible keyboards
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
  '';

  users.users.kilisei = {
    isNormalUser = true;
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    initialPassword = "kilisei";
  };
}
