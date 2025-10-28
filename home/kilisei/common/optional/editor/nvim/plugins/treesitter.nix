{ pkgs, ... }:
{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      settings = {
        text-objects = {
          enable = true;
        };
        highlight = {
          enable = true;
        };
        indent = {
          enable = true;
        };
        autopairs = {
          enable = true;
        };
        folding = {
          enable = true;
        };
      };
      nixvimInjections = true;
      grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
    };
    ts-autotag = {
      enable = true;
    };

    treesitter-context = {
      enable = true;
    };

    ts-context-commentstring = {
      enable = true;
      disableAutoInitialization = false;
    };
  };
}
