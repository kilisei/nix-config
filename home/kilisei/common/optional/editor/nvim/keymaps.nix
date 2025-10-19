{
  programs.nixvim = {
    globals.mapleader = " ";
    keymaps = [
      {
        mode = "n";
        key = "<leader>l";
        action.__raw = "require('lsp_lines').toggle";
      }
      {
        mode = "n";
        key = "<C-q>";
        action = "<cmd>cclose<CR>";
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<cmd>cnext<CR>";
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<cmd>cprev<CR>";
      }
    ];
  };
}
