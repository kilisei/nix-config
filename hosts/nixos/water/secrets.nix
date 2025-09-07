{
  inputs,
  ...
}:
{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  sops = {
    secrets = {
      "homelab/nixlab/gitea/mailerPassword" = { };
    };
  };
}
