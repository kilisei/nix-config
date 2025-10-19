{ lib, ... }:
{
  programs.nixvim.plugins = {
    lsp-lines.enable = true;
    lsp = {
      enable = true;
      inlayHints = true;

      servers = {
        nixd.enable = true;

        html.enable = true;
        ts_ls.enable = true;
        vue_ls.enable = true;
        tailwindcss.enable = true;
        oxlint.enable = true;
        eslint.enable = true;
        cssls.enable = true;
        jsonls.enable = true;
        htmx.enable = true;

        clangd.enable = true;
        gopls.enable = true;
        templ.enable = true;
        # rust_analyzer.enable = true;
        sqls.enable = true;
        lua_ls.enable = true;

        dockerls.enable = true;
        # helmls.enable = true;
        yamlls.enable = true;

        harper_ls.enable = true;
      };

      keymaps = {
        lspBuf = {
          grn = "rename";
          gra = "code_action";
          gD = "declaration";
        };
        extra = [
          {
            key = "gr";
            action.__raw = "require('telescope.builtin').lsp_references";
          }
          {
            key = "gi";
            action.__raw = "require('telescope.builtin').lsp_implementations";
          }
          {
            key = "gd";
            action.__raw = "require('telescope.builtin').lsp_definitions";
          }
          {
            key = "gs";
            action.__raw = "require('telescope.builtin').lsp_document_symbols";
          }
          {
            key = "gws";
            action.__raw = "require('telescope.builtin').lsp_dynamic_workspace_symbols";
          }
          {
            key = "gt";
            action.__raw = "require('telescope.builtin').lsp_type_definitions";
          }
        ];
      };
    };
  };
}
