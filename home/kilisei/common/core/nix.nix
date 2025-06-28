{
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep 20d --keep-since 10d";
    };
    flake = "/home/user/nix-config";
  };
}
