{
  pkgs,
  ...
}:
let
  fetchurl = pkgs.fetchurl;
in
{
  services.minecraft-servers = {
    enable = true;
    eula = true;

    servers.fabric = {
      enable = true;


      serverProperties = {
        difficulty = "hard";
        max-players = 5;
        level-type = "large_biomes";
        white-list = true;
      };

      jvmOpts = "-Xms4096M -Xmx4096M";

      whitelist = {
        Kilisei = "7ac2aa3e-6d26-4066-853f-b78aea193aab";
      };

      operators = {
        Kilisei = {
          uuid = "7ac2aa3e-6d26-4066-853f-b78aea193aab";
          bypassesPlayerLimit = true;
        };
      };

      package = pkgs.fabricServers.fabric-1_21_10.override {
        loaderVersion = "0.17.3";
      };

      symlinks = {
        mods = pkgs.linkFarmFromDrvs "mods" (
          builtins.attrValues {
            Fabric-API = fetchurl {
              url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/dQ3p80zK/fabric-api-0.138.3%2B1.21.10.jar";
              hash = "sha256-rCB1kEGet1BZqpn+FjliQEHB1v0Ii6Fudi5dfs9jOVM=";
            };
            CrashExploitFixer = fetchurl {
              url = "https://cdn.modrinth.com/data/Z5GdSH3X/versions/ibSODuZ1/crashexploitfixer-fabric-1.2.0%2B1.21.5.jar";
              hash = "sha256-vs69lgEZj1/bEEaJvcbO5+468Q8xYrqq902yU9D/fhM=";
            };
            FerriteCore = fetchurl {
              url = "https://cdn.modrinth.com/data/uXXizFIs/versions/MGoveONm/ferritecore-8.0.2-fabric.jar";
              hash = "sha256-LGn9gXMEu2l1zUti/TK/IaXVyPDDUj6sxzTAwlB+2nc=";
            };
            Lithium = fetchurl {
              url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/oGKQMdyZ/lithium-fabric-0.20.0%2Bmc1.21.10.jar";
              hash = "sha256-567yN1D2eJgsAMQhjWIFljqZRVRFfCoWvZgY41IQAEs=";
            };
            Packet-Fixer = fetchurl {
              url = "https://cdn.modrinth.com/data/c7m1mi73/versions/exD7ItOk/packetfixer-fabric-3.3.2-1.21.10.jar";
              hash = "sha256-qmZx8WKyf+KgWNUL5d9w/F/c2LtKQGEEM5vQQ3Vtq2E=";
            };
            Krypton = fetchurl {
              url = "https://cdn.modrinth.com/data/fQEb0iXm/versions/O9LmWYR7/krypton-0.2.10.jar";
              hash = "sha256-lCkdVpCgztf+fafzgP29y+A82sitQiegN4Zrp0Ve/4s=";
            };
            C2ME = fetchurl {
              url = "https://cdn.modrinth.com/data/VSNURh3q/versions/uNick7oj/c2me-fabric-mc1.21.10-0.3.5.1.0.jar";
              hash = "sha256-pqUSN/OqZOF7p3g/iKO71c2830/eDg7OsFkhZ0AR9GQ=";
            };
            Spark = fetchurl {
              url = "https://cdn.modrinth.com/data/l6YH9Als/versions/eqIoLvsF/spark-1.10.152-fabric.jar";
              hash = "sha256-Ul2oR/N2zraVvPGxWs8YbHWQu1fiBt+a9CEIUnpP/Z4=";
            };
            Chunky = fetchurl {
              url = "https://cdn.modrinth.com/data/fALzjamp/versions/kkEljQ4R/Chunky-Fabric-1.4.51.jar";
              hash = "sha256-wFffzmrHsL3hOFBu9sjX9r5Qg6EHsmCAoEw895tYXtI=";
            };
            "Fuji-(Essentials)" = fetchurl {
              url = "https://cdn.modrinth.com/data/1TowMm2v/versions/zDOpWKBZ/fuji-fabric-12.73.2-80388f7064-mc1.21.10.jar";
              hash = "sha256-n+nO3tLOWnyt7himhCVOsptNDb0vBriNCiZTceulg4g=";
            };
            FixMCStats = fetchurl {
              url = "https://cdn.modrinth.com/data/SQKipbkd/versions/nzp5EPh8/fix-mc-stats-2.0.1.jar";
              hash = "sha256-jtX9xK9CK3vcXCmXSaZDfbG6S7U8EbCW6Uaf9L8Z6d4=";
            };
            LuckyPerms = fetchurl {
              url = "https://cdn.modrinth.com/data/Vebnzrzj/versions/rGOrpVtr/LuckPerms-Fabric-5.5.17.jar";
              hash = "sha256-Uy+GwtiTKz4DIYoGd2hgCXy85bGt25Qnb0GEhSiIfbo=";
            };
            # FastBackup = fetchurl {
            #   url = "https://cdn.modrinth.com/data/ZHKrK8Rp/versions/yw6bD7A8/fastback-0.28.0%2B1.21.9-fabric.jar";
            #   hash = "";
            # };
          }
        );
      };
    };
  };
}
