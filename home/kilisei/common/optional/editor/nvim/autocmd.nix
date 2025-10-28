{
  programs.nixvim = {
    autoGroups = {
      "term-open" = {
        clear = true;
      };
    };

    autoCmd = [
      {
        group = "term-open";
        callback.__raw = ''
          function()
            vim.opt.number = false
            vim.opt.relativenumber = false
          end
        '';
      }
    ];
  };
}
