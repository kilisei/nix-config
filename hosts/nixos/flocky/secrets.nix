{
  inputs,
  config,
  ...
}:
{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  sops = {
    secrets = {
      "user/kilisei/password/login" = {
        owner = config.users.users.kilisei.name;
      };
      "user/kilisei/password/restic" = {
        owner = config.users.users.kilisei.name;
        mode = "0400";
      };
    };
  };
}
