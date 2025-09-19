{
  programs.nixvim.opts = {
    updatetime = 100; # faster completion

    number = true;
    relativenumber = true;
    wrap = true;

    ignorecase = true;
    smartcase = true;
    incsearch = true;

    tabstop = 4;
    softtabstop = 4;
    autoindent = true;
    expandtab = true;
    smartindent = true;
    shiftwidth = 2;
    scrolloff = 8;

    mouse = "a";
    swapfile = false;
    linebreak = true;
    undofile = true;
  };
}
