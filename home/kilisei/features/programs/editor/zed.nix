{
  lib,
  config,
  ...
}: {
  options = {
    kilisei.editor.zed.enable = lib.mkEnableOption "";
  };

  config = lib.mkIf config.kilisei.editor.zed.enable {
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
      ];
      userSettings = {
        theme = "GitHub Dark Default";
        icon_theme = "Catppuccin Mocha";
        soft_wrap = "editor_width";
        base_keymap = "JetBrains";
        vim_mode = true;
        ui_font_family = "JetBrainsMono NF";
        ui_font_size = 16;
        buffer_font_family = "JetBrainsMono NF";
        buffer_font_size = 16;
        autosave = "on_focus_change";
        languages = {
          "TypeScript" = {
            "formatter" = {
              "external" = {
                "command" = "pnpm";
                "arguments" = ["exec" "eslint" "--stdin-filepath" "{buffer_path}"];
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
                "arguments" = ["exec" "eslint" "--stdin-filepath" "{buffer_path}"];
              };
            };
            "code_actions_on_format" = {
              "source.fixAll.eslint" = true;
            };
            "format_on_save" = "on";
          };
        };
      };
    };
  };
}
