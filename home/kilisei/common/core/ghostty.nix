{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;

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
}
