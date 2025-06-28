{pkgs, ...}: {
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
    fzf
    gnumake
    ripgrep
    jq
    wget2
    cpu-x
  ];

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    shellAliases = {
      nix-shell = "nix-shell --command zsh";
      nix-dev = "nix develop --command zsh";
      wget = "wget2";
      cat = "bat";
      ls = "eza";
      ga = "git add";
      gb = "git --patch";
      gba = "gb --all";
      gc = "git commit";
      gco = "git checkout";
      gl = "git log --graph --all --pretty=format:'%C(magenta)%h %C(white)%an  %ar%C(blue)  %D%n%s%n'";
      gd = "git diff --output-indicator-new=' ' --output-indicator-old=' '";
      gds = "gd --staged";
      gi = "git init";
      gp = "git push";
      gr = "git reset";
      gs = "git status --short";
      gu = "git pull";
      vim = "nvim";
    };

    initContent = ''
      nurse() {
        sudo nixos-rebuild switch --flake ".#$1"
      }
      horse() {
        home-manager switch --flake ".#$1"
      }
    '';

    oh-my-zsh = {
      enable = true;
      plugins = ["git" "sudo"];
      theme = "robbyrussell";
    };
  };
}
