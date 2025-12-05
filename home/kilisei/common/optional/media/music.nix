{ pkgs, ... }:
{
  nixpkgs.overlays = [
    (self: prev: {
      euphonica = prev.euphonica.overrideAttrs (old: rec {
        src = prev.fetchFromGitHub {
          owner = "htkhiem";
          repo = "euphonica";
          tag = "v0.98.0-beta";
          sha256 = "sha256-pLs8aLm2CyT8eVtbB8UQj9xSqnjViRxKjuH3A6RErjA=";
          fetchSubmodules = true;
        };

        cargoDeps = prev.rustPlatform.fetchCargoVendor {
          inherit src;
          hash = "sha256-w6xZQP8QTTPKQgPCX20IvoWErrgWVisEIJKkxwtQHho=";
        };
        buildInputs = (old.buildInputs or [ ]) ++ [ prev.libsecret ];
      });
    })
  ];

  home.packages = with pkgs; [ euphonica ];

  services.mpd = {
    enable = true;
    network.startWhenNeeded = true;
  };
}
