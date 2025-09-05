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
    defaultSopsFile = ../../secrets.yaml;
    defaultSopsFormat = "yaml";
    age = {
      sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
      keyFile = "/var/lib/sops-nix/key.txt";
      generateKey = true;
    };
    secrets = {
      "user/kilisei/password/login" = {
        owner = config.users.users.kilisei.name;
      };
      "user/kilisei/password/restic" = {
        owner = config.users.users.kilisei.name;
        mode = "0400";
      };
      "homelab/nixlab/gitea/mailerPassword" = { };
    };
  };
}
