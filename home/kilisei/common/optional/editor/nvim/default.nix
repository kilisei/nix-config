{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./themes
    ./plugins
    ./keymaps.nix
    ./options.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    clipboard.providers.wl-copy.enable = true;
    plugins.web-devicons.enable = true;
  };
}
