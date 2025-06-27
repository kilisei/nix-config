{
  lib,
  config,
  ...
}: {
  options = {
    kilisei.editor.vscode.enable = lib.mkEnableOption "";
  };

  config = lib.mkIf config.kilisei.editor.vscode.enable {
    programs.vscode.enable = true;
  };
}
