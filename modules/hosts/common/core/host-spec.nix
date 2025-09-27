{
  config,
  lib,
  ...
}:
{
  options.hostSpec = lib.mkOption {
    type = lib.types.submodule {
      freeformType = with lib.types; attrsOf str;

      options = {
        # Data variables that don't dictate configuration settings
        primaryUsername = lib.mkOption {
          type = lib.types.str;
          description = "The primary username of the host";
        };
        hostName = lib.mkOption {
          type = lib.types.str;
          description = "The hostname of the host";
        };
        home = lib.mkOption {
          type = lib.types.str;
          description = "The home directory of the user";
          default = "/home/${config.hostSpec.primaryUsername}";
        };

        # Configuration Settings
        users = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          description = "An attribute set of all users on the host";
          default = [ config.hostSpec.primaryUsername ];
        };
      };
    };
  };
}
