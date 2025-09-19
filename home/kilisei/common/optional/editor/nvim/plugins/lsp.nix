{
  programs.nixvim = {
    plugins = {
      lsp-lines.enable = true;
      lsp-format.enable = true;
      lsp-status.enable = true;
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
          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };
          eslint.enable = true;
          volar.enable = true;
          clangd.enable = true;
        };
        keymaps = {
          silent = true;
          lspBuf = {
            "grn" = {
              action = "rename";
              desc = "LSP: [R]e[n]ame";
            };
            "gra" = {
              action = "code_action";
              desc = "LSP: [G]oto Code [A]ction";
            };
            "grD" = {
              action = "declaration";
              desc = "LSP: [G]oto [D]eclaration";
            };
          };
          # Telescope-based LSP functions
          extra = [
            {
              key = "grr";
              action.__raw = "require('telescope.builtin').lsp_references";
              options.desc = "LSP: [G]oto [R]eferences";
            }
            {
              key = "gri";
              action.__raw = "require('telescope.builtin').lsp_implementations";
              options.desc = "LSP: [G]oto [I]mplementation";
            }
            {
              key = "grd";
              action.__raw = "require('telescope.builtin').lsp_definitions";
              options.desc = "LSP: [G]oto [D]efinition";
            }
            {
              key = "gO";
              action.__raw = "require('telescope.builtin').lsp_document_symbols";
              options.desc = "LSP: Open Document Symbols";
            }
            {
              key = "gW";
              action.__raw = "require('telescope.builtin').lsp_dynamic_workspace_symbols";
              options.desc = "LSP: Open Workspace Symbols";
            }
            {
              key = "grt";
              action.__raw = "require('telescope.builtin').lsp_type_definitions";
              options.desc = "LSP: [G]oto [T]ype Definition";
            }
          ];
        };
      };
    };
  };
}
