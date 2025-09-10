{ lib, ... }:
{
  programs.nixvim = {
    plugins = {
      lsp-lines.enable = true;
      lsp-format.enable = true;
      lsp = {
        enable = true;
        inlayHints = true;
        servers = {
          nixd.enable = true;
          lua_ls.enable = true;
          gopls.enable = true;
          sqls.enable = true;
          html.enable = true;
          htmx.enable = true;
          ts_ls.enable = true;
          templ.enable = true;
          tailwindcss.enable = true;
          rust_analyzer.enable = true;
          eslint.enable = true;
          volar.enable = true;
          clangd.enable = true;
        };
        keymaps = {
          silent = true;
          lspBuf = {
            gd = {
              action = "definition";
              desc = "Goto Definition";
            };
            gr = {
              action = "references";
              desc = "Goto References";
            };
            gD = {
              action = "declaration";
              desc = "Goto Declaration";
            };
            gI = {
              action = "implementation";
              desc = "Goto Implementation";
            };
            gT = {
              action = "type_definition";
              desc = "Type Definition";
            };
            K = {
              action = "hover";
              desc = "Hover";
            };
            "<leader>cw" = {
              action = "workspace_symbol";
              desc = "Workspace Symbol";
            };
            "<leader>cr" = {
              action = "rename";
              desc = "Rename";
            };
          };
        };
      };
    };
  };
}
