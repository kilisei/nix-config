{ config, ... }:
let
  host = config.hostSpec.hostName;
  user = config.hostSpec.primaryUsername;
  home = "/home/${user}";
  passwordFile = config.sops.secrets."user/${user}/password/restic".path;
  backupName = "${user}@${host}";
in
{
  services.restic.backups = {
    "${backupName}" = {
      initialize = true;
      user = user;
      passwordFile = passwordFile;
      repository = "/run/media/kilisei/WD_BLACK/backup/backups/restic/${backupName}";
      paths = [
        home
      ];
      exclude = [
        "*/node_modules"
        "*/target"
        ".git"
        ".local/share/Steam/steamapps/common"
        ".local/share/pnpm/store"
        "/home/*/.cache"
        "/var/cache"
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
