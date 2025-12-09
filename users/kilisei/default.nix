{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
let
  pubKeys = lib.filesystem.listFilesRecursive "../../../../secrets/keys";
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  sops.secrets."user/kilisei/password/login".neededForUsers = true;

  users.mutableUsers = false;
  users.users.kilisei = {
    isNormalUser = true;
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
    avatar = "${inputs.nix-assets}/images/avatars/kilisei-transperent.png";

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
