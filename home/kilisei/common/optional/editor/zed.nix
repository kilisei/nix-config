{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "vue"
      "html"
      "env"
      "catppuccin-icons"
      "log"
      "sql"
      "docker"
      "templ"
      "dockerfile"
      "docker-compose"
      "oxlint"
      "go-snippets"
      "vue-snippets"
      "sqlc-snippets"
    ];
    userSettings = {
      theme = "GitHub Dark Default";
      icon_theme = "Catppuccin Mocha";

      soft_wrap = "editor_width";

      base_keymap = "JetBrains";
      vim_mode = true;
      ui_font_family = "JetBrainsMonoNL Nerd Font Regular";
      ui_font_size = 16;
      buffer_font_family = "JetBrainsMono Nerd Font Regular";
      buffer_font_size = 16;
      terminal_font_family = "JetBrainsMono Nerd Font Regular";
      terminal_font_size = 16;
      buffer_font_features = {
        calt = false;
      };

      autosave = "on_focus_change";

      languages = {
        "TypeScript" = {
          "formatter" = {
            "external" = {
              "command" = "pnpm";
              "arguments" = [
                "exec"
                "eslint"
                "--stdin-filepath"
                "{buffer_path}"
              ];
            };
          };
          "code_actions_on_format" = {
            "source.fixAll.eslint" = true;
          };
          "format_on_save" = "on";
        };
        "Vue.js" = {
          "formatter" = {
            "external" = {
              "command" = "pnpm";
              "arguments" = [
                "exec"
                "eslint"
                "--stdin-filepath"
                "{buffer_path}"
              ];
            };
          };
          "code_actions_on_format" = {
            "source.fixAll.eslint" = true;
          };
          "format_on_save" = "on";
        };
      };
    };
    userKeymaps = [
      {
        context = "Workspace";
        bindings = {
          alt-p = [
            "task::Spawn"
            {
              task_name = "FF";
              reveal_target = "center";
            }
          ];
          alt-f = [
            "task::Spawn"
            {
              task_name = "FT";
              reveal_target = "center";
            }
          ];
        };
      }
    ];
  };
}
