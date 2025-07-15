{ pkgs, config, ... }:
{
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

  services.restic.backups."${config.users.users.kilisei.name}@${config.networking.hostName}" = {
    initialize = true;
    user = "kilisei";
    passwordFile = config.sops.secrets."passwords/restic".path;
    repository = "/run/media/kilisei/WD_BLACK/backup/restic/${config.users.users.kilisei.name}@${config.networking.hostName}";
    timerConfig = {
      OnCalendar = "hourly";
      Persistent = true;
    };
    paths = [
      "/home/${config.users.users.kilisei.name}"
      "/var/lib"
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
}
