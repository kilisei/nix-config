{
  pkgs,
  config,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../common
    ./insecure.nix
    ./udev.nix
    ./networking.nix
    ./steam.nix
  ];
  boot.kernelPackages = pkgs.linuxPackages_latest;

  programs.nix-ld.enable = true;
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
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
        "docker"
      ];
      packages = with pkgs; [
        home-manager
      ];
    };
  };

  system.stateVersion = "24.11";

  services.restic.backups = {
    "kilisei@flocky" = {
      initialize = true;
      user = "kilisei";
      passwordFile = config.sops.secrets."user/kilisei/password/restic".path;
      repository = "/run/media/kilisei/WD_BLACK/backup/backups/restic/kilisei@flocky";
      paths = [
        "/home/kilisei"
      ];
      exclude = [
        ".git"
        "/var/cache"
        "/home/*/.cache"
        "*/target"
        "*/node_modules"
        ".local/share/pnpm/store"
      ];
      timerConfig = {
        Persistent = true;
        OnCalendar = "hourly";
      };
      pruneOpts = [
        "--keep-hourly 24"
        "--keep-daily 14"
        "--keep-weekly 4"
        "--keep-monthly 12"
        "--keep-yearly 10"
      ];
    };
  };
}
