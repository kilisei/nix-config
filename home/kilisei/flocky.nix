{
  nixpkgs.config.permittedInsecurePackages = [
    "libsoup-2.74.3"
  ];

  imports = [
    common/core

    common/optional/browser
    common/optional/editor
    common/optional/gnome

    common/optional/kubernetes.nix
    common/optional/media.nix
    common/optional/office.nix
    common/optional/comms.nix
    common/optional/backups.nix
    common/optional/games.nix
    common/optional/3d.nix
    common/optional/vial.nix
    common/optional/ghostty.nix
  ];

  home = rec {
    stateVersion = "25.05";
    username = "kilisei";
    homeDirectory = "/home/${username}";
  };
}
