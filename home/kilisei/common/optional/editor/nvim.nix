{ inputs, pkgs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    opts = {
      number = true;
      relativenumber = true;
      ignorecase = true;
      smartcase = true;
    };

    clipboard.providers.wl-copy.enable = true;
    colorschemes.gruvbox.enable = true;

    lsp.servers = {
      gopls.enable = true;
      rust_analyzer.enable = true;
      tailwindcss.enable = true;
      volar.enable = true;
      ts_ls.enable = true;
      templ.enable = true;
      nixd.enable = true;
      htmx.enable = true;
      eslint.enable = true;
      markdown_oxide.enable = true;
      sqls.enable = true;
      helm_ls.enable = true;
      yamlls.enable = true;
    };

    plugins = {
      treesitter = {
        enable = true;

        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          bash
          json
          lua
          make
          markdown
          nix
          regex
          toml
          vim
          vimdoc
          xml
          yaml
          vue
          typescript
          javascript
          go
          gomod
          gotmpl
          gosum
          json5
          dockerfile
          c
          c3
          rust
          css
          html
        ];
      };
      lualine.enable = true;
      cloak.enable = true;
    };
  };
}
