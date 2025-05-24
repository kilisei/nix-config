{
  lib,
  config,
  ...
}: {
  options = {
    kilisei.terminal.ghostty.enable = lib.mkEnableOption "";
  };

  config = lib.mkIf config.kilisei.terminal.ghostty.enable {
    programs.ghostty = {
      enable = true;
      enableZshIntegration = lib.mkIf config.kilisei.terminal.zsh.enable true;
      settings = {
        theme = "GitHub-Dark-Default";
        font-family = "JetBrainsMono NF";
        keybind = [
          "ctrl+`=new_tab"
          "ctrl+left=next_tab"
          "ctrl+right=previous_tab"
        ];
      };
    };
  };
}
