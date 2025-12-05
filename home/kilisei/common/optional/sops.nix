{
  pkgs,
  inputs,
  config,
  ...
}:
# let
#   uid =
#     let
#       uidScript = pkgs.writeScript "get-uid" ''
#         #!${pkgs.runtimeShell}
#         id -u
#       '';
#     in
#     pkgs.lib.strings.toIntBase10 (
#       builtins.readFile (
#         pkgs.runCommand "get-uid-result" { } ''
#           ${uidScript} >$out
#         ''
#       )
#     );
# in
{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";

    defaultSopsFile = ../../../../secrets/secrets.yaml;
    # defaultSymlinkPath = "/run/user/${builtins.toString uid}/secrets";
    # defaultSecretsMountPoint = "/run/user/${builtins.toString uid}/secrets.d";

    secrets = {
      "private_keys/id_flocky" = {
        path = "/home/kilisei/.ssh/id_flocky";
      };
    };
  };
}
