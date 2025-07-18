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
    ./backup.nix
  ];

  sops.secrets."passwords/kilisei".neededForUsers = true;

  services.resticBackups = {
    enable = true;
    user = "kilisei";
    passwordFile = config.sops.secrets."passwords/restic".path;
  };

  users = {
    mutableUsers = false;
    users.kilisei = {
      isNormalUser = true;
      hashedPasswordFile = config.sops.secrets."passwords/kilisei".path;
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
