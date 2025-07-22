{
  pkgs,
  config,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../common
    ./udev.nix
    ./networking.nix
    ./steam.nix
  ];

  fileSystems."/run/media/restic/WD_BLACK" = {
    device = "/dev/disk/by-uuid/54A9-64A8";
    fsType = "exfat";
    options = [
      "nofail"
      "x-systemd.automount"
      "x-systemd.idle-timeout=10min"
    ];
  };

  services.resticBackups = {
    enable = true;
    user = "kilisei";
    repositoryBasePath = "/run/media/restic/WD_BLACK/backup/restic";
    passwordFile = config.sops.secrets."user/kilisei/password/restic".path;
  };

  sops.secrets."user/kilisei/password/login".neededForUsers = true;
  users = {
    mutableUsers = false;
    users.kilisei = {
      isNormalUser = true;
      hashedPasswordFile = config.sops.secrets."user/kilisei/password/login".path;
      shell = pkgs.zsh;
      ignoreShellProgramCheck = true;
      extraGroups = [
        "wheel"
        "networkmanager"
      ];
      packages = with pkgs; [
        home-manager
      ];
    };
  };

  system.stateVersion = "24.11";
}
