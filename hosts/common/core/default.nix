{
  config,
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.sops-nix.nixosModules.sops
    ./sops.nix
    ./i18n.nix
    ./nixos.nix
  ];

  home-manager.useGlobalPkgs = true;

  hostSpec = {
    primaryUsername = "kilisei";
  };

  networking = {
    networkmanager.enable = true;
    hostName = config.hostSpec.hostName;
    enableIPv6 = false;
  };
  system.name = config.hostSpec.hostName;

  programs.git.enable = true;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    promptInit = "source ''${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
  };

  environment.enableAllTerminfo = true;
}
