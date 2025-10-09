{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./themes
    ./plugins
    ./keymaps.nix
    ./options.nix
    # ./spell.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
performance.byteCompileLua.enable = true;

    clipboard.providers.wl-copy.enable = true;
    plugins.web-devicons.enable = true;
  };
}
