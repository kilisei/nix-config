{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./features
    ./config
  ];

  home.packages = with pkgs; [
    prismlauncher

    corepack
    nodejs
    sqlite

    go
    tinygo

    vial

    # Comms
    vesktop
    teams-for-linux
    obs-studio

    # Utils
    usbimager

    # Kubernetes/Docker
    docker-compose
    k0sctl
    helm-ls
    kubernetes-helm
    helmfile
    kubectl
    kustomize
    lens

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
