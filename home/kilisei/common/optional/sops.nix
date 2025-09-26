{ inputs, ... }:
{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    age.keyfile = "/home/kilisei/.config/sops/age/keys.txt";
    defaultSopsFile = "../../../../secrets/secrets.yaml";
    validateSopsFile = false;
  };
}
