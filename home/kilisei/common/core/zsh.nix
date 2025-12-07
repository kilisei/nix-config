{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history.size = 1000000;

    shellAliases = {
      cat = "bat";
      man = "batman";
      top = "btop";
      df = "duf";

      l = "ls -lah";
      ls = "eza";
      tree = "ls --tree";
      mdc = "(){mkdir $1; cd $1}";

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
