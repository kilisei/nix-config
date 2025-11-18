{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    diff-so-fancy
    git-lfs
    git-absorb
  ];

  programs.git = {
    enable = true;

    settings.user = {
      name = "kilisei";
      email = "git@kilisei.dev";
      signingKey = "${config.home.homeDirectory}/.ssh/id_flocky";
    };

    settings = {
      gpg = {
        format = "ssh";
      };

      core = {
        compression = 9;
        autocrlf = "input";
        whitespace = "error";
        editor = "nvim";
      };

      init = {
        defaultBranch = "main";
      };

      commit = {
        gpgsign = true;
      };

      blame = {
        coloring = "highlightRecent";
        date = "relative";
      };

      push = {
        autoSetupRemote = true;
        default = "current";
      };

      pull = {
        rebase = true;
      };

      rebase = {
        autoStash = true;
      };
      rerere.enabled = true;

      diff = {
        context = 3;
        interHunkContext = 10;
        renames = "copies";
      };
      diff-so-fancy.markEmptyLines = true;

      pager = {
        branch = false;
        diff = "diff-so-fancy | $PAGER";
      };

      log.abbrevCommit = true;

      status = {
        branch = true;
        short = true;
        showStash = true;
        showUntrackedFiles = "all";
      };
    };
  };
}
