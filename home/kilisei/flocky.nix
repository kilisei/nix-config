{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ../common/core
    common/core

    common/optional/browser
    common/optional/editor
    common/optional/gnome

    common/optional/kubernetes.nix
    common/optional/media.nix
    common/optional/office.nix
    common/optional/fonts.nix
    common/optional/comms.nix
    common/optional/backups.nix
    common/optional/nix-helper.nix
    common/optional/games.nix
    common/optional/3d.nix
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "libsoup-2.74.3"
  ];
  home = rec {
    stateVersion = "24.11";
    username = "kilisei";
    homeDirectory = "/home/${username}";
  };
}
