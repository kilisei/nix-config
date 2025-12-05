{
  inputs,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./sops.nix
    ./i18n.nix
    ./nixos.nix
    ./networking.nix
  ];

  home-manager.useGlobalPkgs = true;
  home-manager.backupFileExtension = "bk";

  hostSpec = {
    primaryUsername = "kilisei";
  };

  programs.git.enable = true;
  programs.zsh.enable = true;

  environment.enableAllTerminfo = true;
}
