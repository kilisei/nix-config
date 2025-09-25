{ config, ... }:
{
  sops.secrets."homelab/nixlab/traefik/env" = {
    owner = config.users.users.kilisei.name;
    inherit (config.users.users.kilisei) group;
  };

  services.traefik = {
    enable = true;
    environmentFiles = [ config.sops.secrets."homelab/nixlab/traefik/env".path ];

    staticConfigOptions = {
      global = {
        checkNewVersion = false;
        sendAnonymousUsage = false;
      };

      metrics.prometheus = {
        addRoutersLabels = true;
        addEntryPointsLabels = true;
      };

      entryPoints = {
        web = {
          address = ":80";
          asDefault = true;
          http.redirections.entrypoint = {
            to = "websecure";
            scheme = "https";
            permanent = true;
          };
        };

        websecure = {
          address = ":443";
          asDefault = true;
          http.tls.certResolver = "cloudflare";
        };
      };

      log = {
        level = "DEBUG";
        filePath = "${config.services.traefik.dataDir}/traefik.log";
        format = "json";
      };

      certificatesResolvers.cloudflare.acme = {
        email = "letsencrypt.homelab@kilisei.dev";
        storage = "/var/traefik/certs/cloudflare-acme.json";
        caServer = "https://acme-v02.api.letsencrypt.org/directory";
        dnsChallenge = {
          provider = "cloudflare";
          resolvers = [
            "1.1.1.1:53"
            "1.0.0.1:53"
          ];
        };
      };
    };

    dynamicConfigOptions = {
      http = {
        routers = {
          "traefik-metrics" = {
            rule = "Host(`traefik.home.nixlab.kilisei.dev`)";
            entryPoints = [
              "web"
              "websecure"
            ];
            service = "traefik@internal";
          };

          "gitea-router" = {
            rule = "Host(`gitea.home.nixlab.kilisei.dev`)";
            entryPoints = [
              "websecure"
              "web"
            ];
            service = "gitea";
          };
        };

        services = {
          gitea = {
            loadBalancer = {
              servers = [ { url = "http://127.0.0.1:3000"; } ];
            };
          };
        };
      };
    };
  };
}
