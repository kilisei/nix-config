{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../common
  ];

  system.stateVersion = "24.11";

  networking.firewall = rec {
    allowedTCPPortRanges = [
      # gsconnect/kdeconnect
      {
        from = 1714;
        to = 1764;
      }
    ];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };

  services.udev.extraRules = ''
    # Universal rule for all Vial-compatible keyboards
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
  '';

  sops.secrets."passwords/kilisei".neededForUsers = true;
  users.mutableUsers = false;

  users.users.kilisei = {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets."passwords/kilisei".path;
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
    extraGroups = [
      "wheel"
      # "networkmanager"
    ];
    packages = with pkgs; [
      home-manager
    ];
  };
}
