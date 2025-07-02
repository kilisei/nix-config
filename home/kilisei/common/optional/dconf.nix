{ pkgs, ... }:
rec {
  home.packages = with pkgs.gnomeExtensions; [
    blur-my-shell
    space-bar
    just-perfection
    emoji-copy
    clipboard-history
    gsconnect
  ];

  dconf.enable = true;
  dconf.settings = {
    "org/gnome/shell".enabled-extensions = map (extension: extension.extensionUuid) home.packages;
    "org/gnome/desktop/background" = {
      picture-uri = "file://${../../assets/wallpaper3.jpg}";
      picture-uri-dark = "file://${../../assets/wallpaper4.jpg}";
      picture-options = "zoom";
    };
    "org/gnome/desktop/interface" = {
      accent-color = "slate";
      color-scheme = "prefer-dark";
    };
    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
    };
    "org/gnome/mutter" = {
      dynamic-workspaces = false;
    };
    "org/gnome/desktop/wm/preferences" = {
      action-middle-click-titlebar = "minimize";
      button-layout = "appmenu:minimize,maximize,close";
      num-workspaces = 4;
    };
    "org/gnome/desktop/wm/keybindings" = {
      switch-to-workspace-1 = [ "<Super>1" ];
      switch-to-workspace-2 = [ "<Super>2" ];
      switch-to-workspace-3 = [ "<Super>3" ];
      switch-to-workspace-4 = [ "<Super>4" ];
    };
  };
}
