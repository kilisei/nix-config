{ config, ... }:
{
  services.grafana = {
    enable = true;

    settings = {
      server = {
        http_port = 2342;
        http_addr = "127.0.0.1";
      };
      security = {
        admin_user = "admin";
        admin_password = "admin";
        admin_email = "grafana.home.nixlab@kilisei.dev";
      };
    };
  };

  services.prometheus = {
    enable = true;
    scrapeConfigs = [
      {
        job_name = "traefik";
        static_configs = [
          {
            targets = [ "127.0.0.1:8080" ];
            labels = {
              service = "traefik";
            };
          }
        ];
        metrics_path = "/metrics";
      }
      {
        job_name = "gitea";
        static_configs = [
          {
            targets = [
              "${toString config.services.gitea.settings.server.HTTP_ADDR}:${toString config.services.gitea.settings.server.HTTP_PORT}"
            ];
            labels = {
              service = "gitea";
            };
          }
        ];
        metrics_path = "/metrics";
      }

    ];
  };

  services.traefik.dynamicConfigOptions.http = {
    routers = {
      "grafana-router" = {
        rule = "Host(`grafana.home.nixlab.kilisei.dev`)";
        entryPoints = [
          "websecure"
          "web"
        ];
        service = "grafana-service";
      };
    };
    services = {
      "grafana-service" = {
        loadBalancer = {
          servers = [
            {
              url = "http://${toString config.services.grafana.settings.server.http_addr}:${toString config.services.grafana.settings.server.http_port}";
            }
          ];
        };
      };
    };
  };

}
