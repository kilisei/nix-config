{ pkgs, config, ... }:

let
  cfToken = builtins.readFile config.sops.secrets."homelab/nixlab/traefik/cfToken".path;
in
{
  services.traefik = {
    enable = true;
    package = pkgs.traefik;

    staticConfigOptions = {
      entryPoints = {
        web = {
          address = ":80";
        };
        websecure = {
          address = ":443";
        };
      };
      log = {
        level = "INFO";
      };
    };

    dynamicConfigOptions = {
      http = {
        routers = {
          "gitea-router" = {
            rule = "Host(`gitea.home.nixlab.kilisei.dev`)";
            entryPoints = [ "websecure" ];
            service = "gitea-service";
            tls = {
              certResolver = "le";
            };
          };
        };
        services = {
          "gitea-service" = {
            loadBalancer = {
              servers = [ { url = "http://127.0.0.1:3000"; } ];
            };
          };
        };
      };
    };

    letsencrypt = {
      email = "you@example.com";
      storage = "/var/lib/traefik/acme.json";
      certResolver = {
        le = {
          dnsChallenge = {
            provider = "cloudflare";
            delayBeforeCheck = 0;
          };
        };
      };
    };

    environment = {
      TRAEFIK_DNSCLOUDFLARE_API_TOKEN = cfToken;
    };
  };
}
