{ config, ... }:
let
  mailerUser = builtins.readFile config.sops.secrets."homelab/nixlab/gitea/mailerUser".path;
  mailerFrom = builtins.readFile config.sops.secrets."homelab/nixlab/gitea/mailerFrom".path;
in
{
  services.gitea = {
    enable = true;
    database.type = "sqlite3";
    lfs.enable = true;
    mailerPasswordFile = config.sops.secrets."homelab/nixlab/gitea/mailerPassword".path;
    settings = {
      server = {
        DOMAIN = "gitea.home.nixlab.kilisei.dev";
        # ROOT_URL = "gitea.home.nixlab.kilisei.dev";
      };
      mailer = {
        ENABLED = true;
        PROTOCOL = "smtps";
        SMTP_ADDR = mailerFrom;
        SMTP_PORT = "587";
        USER = mailerUser;
        FROM = mailerFrom;
      };
    };
  };
}
