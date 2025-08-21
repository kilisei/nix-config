{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      shell-integration = "zsh";
      theme = "GitHub-Dark-Default";
      font-family = "JetBrainsMono Nerd Font Regular";
      maximize = true;
      keybind = [
        "ctrl+`=new_tab"
        "ctrl+left=next_tab"
        "ctrl+right=previous_tab"
      ];
    };
  };
}
