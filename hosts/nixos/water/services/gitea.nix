{ config, ... }:
let
  mailerUser = "no-reply@kilisei.dev";
  mailerFrom = "no-reply@kilisei.dev";
in
{
  services.gitea = {
    enable = true;
    database.type = "sqlite3";
    lfs.enable = true;
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
