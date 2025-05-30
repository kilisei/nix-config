{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./features
    ./config
  ];

  home.packages = with pkgs; [
    go
    tinygo
    gdb
    gdbgui
    openocd

    gnome-boxes
    gnome-sound-recorder
    uutils-coreutils-noprefix
    vial

    obs-studio

    # Comms
    vesktop
    teams-for-linux

    # Utils
    usbimager

    # Kubernetes
    k0sctl
    helm-ls
    kubernetes-helm
    helmfile
    kubectl
    kustomize
    nixd

    onlyoffice-desktopeditors

    # Backups
    pika-backup
  ];

  programs.firefox.enable = true;
  programs.chromium.enable = true;

  kilisei.terminal = {
    ghostty.enable = true;
    zsh.enable = true;
  };
  kilisei.git.enable = true;

  kilisei.editor = {
    nvim.enable = true;
    zed.enable = true;
    vscode.enable = true;
  };

  home = {
    stateVersion = "24.11";
    username = "kilisei";
    homeDirectory = "/home/kilisei";
  };

  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";
}
