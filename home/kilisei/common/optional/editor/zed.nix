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
    userKeymaps = [
    ];
    userSettings = {
      theme = "GitHub Dark Default";
      icon_theme = "Catppuccin Mocha";

      soft_wrap = "editor_width";

      base_keymap = "JetBrains";
      hide_mouse = "on_typing";

      vim_mode = true;
      relative_line_numbers = true;
      indent_guides = {
        enabled = true;
        coloring = "indent_aware";
      };

      format_on_save = "off";

      ui_font_family = "JetBrainsMonoNL Nerd Font Regular";
      ui_font_size = 16;
      buffer_font_family = "JetBrainsMono Nerd Font Regular";
      buffer_font_size = 16;
      terminal_font_family = "JetBrainsMono Nerd Font Regular";
      terminal_font_size = 16;

      buffer_font_features = {
        calt = false;
      };
      ui_font_features = {
        calt = false;
      };

      file_types = {
        "Dockerfile" = [
          "Dockerfile"
          "Dockerfile.*"
        ];
        "JSON" = [
          "json"
          "jsonc"
          "*.code-snippets"
        ];
      };

      file_scan_exclusions = [
        "**/.git"
        "**/.svn"
        "**/.hg"
        "**/CVS"
        "**/.DS_Store"
        "**/Thumbs.db"
        "**/.classpath"
        "**/.settings"
        # above is default from Zed
        "**/out"
        "**/dist"
        "**/.husky"
        "**/.turbo"
        "**/.vscode-test"
        "**/.vscode"
        "**/.next"
        "**/.storybook"
        "**/.tap"
        "**/.nyc_output"
        "**/report"
        "**/node_modules"
      ];

      telemetry = {
        diagnostics = false;
        metrics = false;
      };
    };
  };
}
