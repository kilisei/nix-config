{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      extensions = {
        file-browser.enable = true;
        fzf-native.enable = true;
      };
      keymaps = {
        "<leader><space>" = {
          action = "find_files";
          options = {
            desc = "Find project files";
          };
        };
        "<leader>fb" = {
          action = "file_browser";
          options = {
            desc = "File browser";
          };
        };
        "<leader>/" = {
          action = "live_grep";
          options = {
            desc = "Find in files";
          };
        };
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>fe";
        action = "<cmd>Telescope file_browser<cr>";
        options = {
          desc = "File browser";
        };
      }
    ];
  };
}
