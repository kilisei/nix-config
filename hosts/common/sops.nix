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
    age = {
      sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
      keyFile = "/var/lib/sops-nix/key.txt";
      generateKey = true;
    };
    secrets = {
      "passwords/kilisei" = {
        owner = config.users.users.kilisei.name;
      };
      "passwords/restic" = {
        owner = config.users.users.kilisei.name;
        mode = "0400";
      };
    };
  };
}
