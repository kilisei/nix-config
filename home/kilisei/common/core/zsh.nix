{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history.size = 1000000;

    shellAliases = {
      nix-shell = "nix-shell --command zsh";
      nix-dev = "nix develop --command zsh";

      cat = "bat";
      man = "batman";
      top= "btop";
      df = "duf";

      l = "ls -lah";
      ls = "eza";
      tree = "ls --tree";

      ga = "git add";
      gc = "git commit";
      gco = "git checkout";
      gl = "git log --graph --all --pretty=format:'%C(magenta)%h %C(white)%an  %ar%C(blue)  %D%n%s%n'";
      gd = "git diff --output-indicator-new=' ' --output-indicator-old=' '";
      gp = "git push";
      gr = "git reset";
      gs = "git status";
      gu = "git pull";

      k = "kubectl";
      v = "nvim";
      c = "clear";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
      ];
      theme = "robbyrussell";
    };
  };
}
