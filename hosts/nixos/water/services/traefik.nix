{ pkgs, config, ... }:

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
        level = "DEBUG";
      };
    };

    dynamicConfigOptions = {
      http = {
        routers = {
          "gitea-router" = {
            rule = "Host(`gitea.home.nixlab.kilisei.dev`)";
            entryPoints = [ "websecure" ];
            service = "gitea-service";
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
  };
}
