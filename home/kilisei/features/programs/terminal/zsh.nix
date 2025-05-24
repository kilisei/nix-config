{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    kilisei.terminal.zsh.enable = lib.mkEnableOption "";
  };

  config = lib.mkIf config.kilisei.terminal.zsh.enable {
    home.packages = with pkgs; [
      uutils-coreutils-noprefix
      eza
      xh
      du-dust
      btop
      wrk
      fastfetch
      direnv
      bat
      btop
      fastfetch
      fzf
      gnumake
      ripgrep
      jq
      wget2
    ];

    programs.zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      enableCompletion = true;
      shellAliases = {
        wget = "wget2";
        cat = "bat";
        grep = "rg";
        ls = "eza";
        ga = "git add";
        gb = "git --patch";
        gba = "gb --all";
        gc = "git commit";
        gco = "git checkout";
        gl = "git log --graph --all --pretty=format:'%C(magenta)%h %C(white) %an  %ar%C(blue)  %D%n%s%n'";
        gd = "git diff --output-indicator-new=' ' --output-indicator-old=' '";
        gds = "gd --staged";
        gi = "git init";
        gp = "git push";
        gr = "git reset";
        gs = "git status --short";
        gu = "git pull";
      };
      oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";
      };
    };
  };
}
