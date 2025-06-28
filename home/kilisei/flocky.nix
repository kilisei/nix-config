{
  nixpkgs.config.allowUnfree = true;

  imports = [
    # Core functions
    common/core

    # Optional components
    common/optional/browser
    common/optional/editor
    common/optional/kubernetes.nix
    common/optional/media.nix
    common/optional/office.nix
    common/optional/comms.nix
    common/optional/gtk.nix
    common/optional/dconf.nix
  ];

  home = {
    stateVersion = "24.11";
    username = "kilisei";
    homeDirectory = "/home/kilisei";
  };

  systemd.user.startServices = "sd-switch";
}
