{
  inputs,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.sops-nix.nixosModules.sops
    ./sops.nix
    ./i18n.nix
    ./nixos.nix
    ./networking.nix
  ];

  home-manager.useGlobalPkgs = true;

  hostSpec = {
    primaryUsername = "kilisei";
  };

  programs.git.enable = true;
  programs.zsh = {
    enable = true;
  };

  environment.enableAllTerminfo = true;
}
