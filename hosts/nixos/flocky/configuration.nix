{
  pkgs,
  config,
  inputs,
  ...
}:
{
  imports = [
    inputs.nixos-hardware.nixosModules.common-cpu-intel
    inputs.nixos-hardware.nixosModules.common-gpu-amd
    inputs.nixos-hardware.nixosModules.common-pc-ssd
    ./hardware-configuration.nix
    ../../common
    ./udev.nix
    ./networking.nix
    ./steam.nix
    ./boot.nix
    ./gnome.nix
    ./display.nix
    ./secrets.nix
  ];

  sops.secrets."user/kilisei/password/login".neededForUsers = true;
  users = {
    mutableUsers = false;
    users.kilisei = {
      isNormalUser = true;
      shell = pkgs.zsh;
      ignoreShellProgramCheck = true;

      hashedPasswordFile = config.sops.secrets."user/kilisei/password/login".path;
      extraGroups = [
        "wheel"
        "networkmanager"
      ];
    };
  };

  system.stateVersion = "24.11";
  system.name = "flocky";

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
