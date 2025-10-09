{
  programs.nixvim = {
    globals.mapleader = " ";
    keymaps = [
      {
        mode = "n";
        key = "<leader>l";
        action.__raw = "require('lsp_lines').toggle";
      }
    ];
  };
}
