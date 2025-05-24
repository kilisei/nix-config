{
  inputs,
  lib,
  config,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  options = {
    kilisei.editor.nvim.enable = lib.mkEnableOption "";
  };

  config = lib.mkIf config.kilisei.editor.nvim.enable {
    programs.nixvim = {
      enable = true;
      defaultEditor = true;
    };
  };
}
