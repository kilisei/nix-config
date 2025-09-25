let
  giteaDomain = "gitea.home.nixlab.kilisei.dev";
  giteaPort = 3100;
in
{
  services.gitea = {
    enable = true;
    database.type = "sqlite3";
    lfs.enable = true;
    settings = {
      server = {
        HTTP_ADDR = "127.0.0.1";
        HTTP_PORT = giteaPort;
        DOMAIN = giteaDomain;
      };
      metrics = {
        ENABLED = true;
        ENABLED_ISSUE_BY_REPOSITORY = true;
        ENABLED_ISSUE_BY_LABEL = true;
      };
    };
  };

  services.traefik.dynamicConfigOptions.http = {
    services.gitea.loadBalancer.servers = [ { url = "http://127.0.0.1:${toString giteaPort}"; } ];

    routers = {
      "gitea-https" = {
        service = "gitea";
        rule = "Host(`${giteaDomain}`)";
        entryPoints = [
          "websecure"
        ];
        tls = {
          # certResolver = "cloudflare";
          domains = [ { main = giteaDomain; } ];
        };
      };
    };
  };
}
