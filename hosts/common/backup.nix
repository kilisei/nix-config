{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.services.resticBackups;
  backupId = "${cfg.user}@${config.networking.hostName}";
in
{
  options.services.resticBackups = {
    enable = mkEnableOption "Enable restic backup with sensible defaults";

    user = mkOption {
      type = types.str;
      description = "User whose home and permissions are backed up with restic.";
    };

    passwordFile = mkOption {
      type = types.path;
      description = "Path to the restic repository password file.";
    };

    repositoryBasePath = mkOption {
      type = types.path;
      description = "Base directory where backup repositories are stored.";
      default = "/home/${cfg.user}/backups/";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      restic
      restic-browser
    ];

    users.users.restic = {
      isNormalUser = true;
      extraGroups = [
        "storage"
        "plugdev"
      ];
    };

    security.wrappers.restic = {
      source = "${pkgs.restic.out}/bin/restic";
      owner = "restic";
      group = "users";
      permissions = "u=rwx,g=,o=";
      capabilities = "cap_dac_read_search=+ep";
    };

    services.restic.backups."${backupId}" = {
      initialize = true;
      user = cfg.user;
      passwordFile = cfg.passwordFile;
      repository = "${cfg.repositoryBasePath}/${backupId}";
      timerConfig = {
        OnCalendar = "hourly";
        Persistent = true;
      };
      paths = [
        "/home/${cfg.user}"
      ];
      pruneOpts = [
        "--keep-hourly 24"
        "--keep-daily 7"
        "--keep-weekly 4"
        "--keep-monthly 12"
        "--keep-yearly 10"
      ];
      extraOptions = [ "--verbose" ];
    };
  };
}
