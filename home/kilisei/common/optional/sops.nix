{
  inputs,
  config,
  ...
}:
{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";

    defaultSopsFile = "${inputs.nix-secrets}/secrets.yaml";

    secrets = {
      "private_keys/id_flocky" = {
        path = "/home/kilisei/.ssh/id_flocky";
      };
    };
  };
}
