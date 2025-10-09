{
  programs.nixvim = {
    opts = {
      updatetime = 300;
      timeoutlen = 500;

      number = true;
      relativenumber = true;
      wrap = false;
      linebreak = true;
      scrolloff = 8;
      sidescrolloff = 8;
      signcolumn = "yes";
      cursorline = true;
      cursorlineopt = "number";
      inccommand = "split";

      ignorecase = true;
      smartcase = true;
      incsearch = true;

      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      autoindent = true;
      smartindent = true;
      breakindent = true;
      clipboard = "unnamedplus";

      mouse = "a";
      termguicolors = true;
      showmatch = true;
      lazyredraw = true;

      backup = false;
      writebackup = false;
      swapfile = false;
      undofile = true;
      autoread = true;
      autowrite = false;
    };
  };
}
