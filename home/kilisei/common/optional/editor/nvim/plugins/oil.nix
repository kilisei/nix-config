{
  programs.nixvim = {
    plugins.oil = {
      enable = true;
    };
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
