{ config, ... }:
{
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
