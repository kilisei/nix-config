{ pkgs, ... }:
{
  home.packages = with pkgs; [
    difftastic
    diff-so-fancy
    git-lfs
    git-absorb
  ];

  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry-gnome3;
  };

  programs.gpg = {
    enable = true;
  };

  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    userName = "kilisei";
    userEmail = "git@kilisei.dev";

    extraConfig = {
      user.signingKey = "E5C78D48E7E2DD1D";

      init.defaultBranch = "main";

      core = {
        compression = 9;
        autocrlf = "input";
        whitespace = "error";
      };

      blame = {
        coloring = "highlightRecent";
        date = "relative";
      };

      # commit.gpgsign = true;

      push = {
        autoSetupRemote = true;
        default = "current";
      };

      pull.rebase = true;

      rebase.autoStash = true;
      rerere.enabled = true;

      diff-so-fancy.markEmptyLines = true;
      diff = {
        external = "difft";
        context = 3;
        interHunkContext = 10;
      };

      log.abbrevCommit = true;

      status = {
        branch = true;
        short = true;
        showStash = true;
        showUntrackedFiles = "all";
      };

      pager = {
        branch = false;
        diff = "diff-so-fancy | bat --style=plain";
      };
    };
  };
}
