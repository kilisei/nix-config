{
  programs.nixvim = {
    plugins.oil = {
      enable = true;
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>pv";
        action = "<cmd>Oil<cr>";
        options = {
          desc = "Oil File browser";
        };
      }
    ];
  };
}
