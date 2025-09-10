{
  programs.nixvim.opts = {
    number = true;
    relativenumber = true;
    ignorecase = true;
    smartcase = true;

    tabstop = 2;
    softtabstop = 2;
    expandtab = true;

    smartindent = true;
    shiftwidth = 2;
    cursorline = true;

    scrolloff = 8;

    mouse = "a";

    swapfile = false;

    linebreak = true;

    wrap = true;
  };
}
