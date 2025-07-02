{
  nixpkgs.config.allowUnfree = true;

  imports = [
    common/core

    common/optional/browser
    common/optional/editor

    common/optional/kubernetes.nix
    common/optional/media.nix
    common/optional/office.nix
    common/optional/comms.nix
    common/optional/gtk.nix
    common/optional/dconf.nix
    common/optional/backups.nix
    common/optional/nix-helper.nix
    common/optional/games.nix
  ];

  home = rec {
    stateVersion = "24.11";
    username = "kilisei";
    homeDirectory = "/home/${username}";
  };
}
