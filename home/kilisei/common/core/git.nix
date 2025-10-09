{ pkgs, ... }:
{
  home.packages = with pkgs; [
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
      commit.gpgsign = true;
      user.signingKey = "7D119E8D79F51621";

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

      push = {
        autoSetupRemote = true;
        default = "current";
      };

      pull.rebase = true;

      rebase.autoStash = true;
      rerere.enabled = true;

      diff = {
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

      diff-so-fancy.markEmptyLines = true;
      pager = {
        branch = false;
        diff = "diff-so-fancy | bat --style=plain";
      };
    };
  };
}
