{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    kilisei.editor.vscode.enable = lib.mkEnableOption "";
  };

  config = lib.mkIf config.kilisei.editor.vscode.enable {
    home.packages = with pkgs; [
      vscode
    ];
  };
}
