{
  programs.nixvim = {
    plugins = {
      friendly-snippets.enable = true;
      blink-cmp = {
        enable = true;
        settings = {
          appearance = {
            nerd_font_variant = "normal";
            use_nvim_cmp_as_default = true;
          };

          signature.enabled = true;
          snippets.enabled = true;
          keymap.preset = "default";

          completion.accept = {
            documentation.auto_show = true;
            auto_brackets = {
              enabled = true;
              semantic_token_resolution.enabled = true;
            };
          };
        };
      };
    };
  };
}
