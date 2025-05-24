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
      ];
      userSettings = {
        theme = "GitHub Dark Default";
        icon_theme = "Catppuccin Mocha";
        soft_wrap = "editor_width";
        base_keymap = "JetBrains";
        vim_mode = true;
        relative_line_numbers = true;
        ui_font_family = "JetBrainsMono NF";
        ui_font_size = 16;
        buffer_font_family = "JetBrainsMono NF";
        buffer_font_size = 16;
        buffer_font_features = {
          calt = false;
        };
        autosave = "on_focus_change";
        features = {
          edit_prediction_provider = "zed";
        };
        assistant = {
          default_model = {
            provider = "copilot_chat";
            model = "gpt-4o";
          };
          version = "2";
        };
      };
    };
  };
}
