{
  programs.nixvim = {
    plugins.oil = {
      enable = true;
      settings = {
        win_options = {
          signcolumn = "yes:2";
        };
      };
    };
    plugins.oil-git-status.enable = true;
    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>Oil<cr>";
        options = {
          desc = "Oil File browser";
        };
      }
    ];
  };
}
