{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
let
  pubKeys = lib.filesystem.listFilesRecursive "${inputs.nix-secrets}/keys";
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  sops.secrets."user/kilisei/password/login".neededForUsers = true;

  users.mutableUsers = false;
  users.users.kilisei = {
    isNormalUser = true;
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;

    hashedPasswordFile = config.sops.secrets."user/kilisei/password/login".path;
    extraGroups = ifTheyExist [
      "wheel"
      "networkmanager"
      "git"
      "audio"
      "video"
      "docker"
    ];
    openssh.authorizedKeys.keys = lib.lists.forEach pubKeys (key: builtins.readFile key);
  };
}
