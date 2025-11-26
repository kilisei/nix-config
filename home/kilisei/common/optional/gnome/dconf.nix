{
  pkgs,
  lib,
  ...
}:
with lib.hm.gvariant;
rec {
  home.packages = with pkgs.gnomeExtensions; [
    blur-my-shell
    space-bar
    clipboard-history
    gsconnect
    user-themes
    just-perfection
    astra-monitor
    unmess
    zen
    fuzzy-app-search
    awesome-tiles
    bluetooth-battery-meter
    quick-settings-audio-panel
  ];

  dconf.enable = true;
  dconf.settings = {
    "org/gnome/shell".enabled-extensions = map (extension: extension.extensionUuid) home.packages;
    "org/gnome/shell/extensions/just-perfection" = {
      animation = 2;
    };
    "org/gnome/shell/extensions/Bluetooth-Battery-Meter" = {
      enable-battery-indicator-text = false;
      enable-battery-level-text = true;
      enable-upower-level-icon = true;
      sort-devices-by-history = true;
      swap-icon-text = true;
    };

    "org/gnome/desktop/background" = {
      picture-uri = "file://${../../../assets/green-ascii-art.png}";
      picture-uri-dark = "file://${../../../assets/green-ascii-art.png}";
      picture-options = "zoom";
    };
    "org/gnome/desktop/interface" = {
      accent-color = "slate";
      clock-format = "24h";
      clock-show-seconds = false;
      clock-show-weekday = true;
      color-scheme = "prefer-dark";
      monospace-font-name = "JetBrainsMono Nerd Font 11";
      document-font-name = "JetrainsMonoNL Nerd Font 11";
      font-name = "JetBrainsMonoNL Nerd Font 11";
    };
    "org/gnome/shell/extensions/user-theme" = {
      name = "Colloid-Dark";
    };
    "org/gnome/desktop/input-sources" = {
      sources = [
        (mkTuple [
          "xkb"
          "de+us"
        ])
      ];
      xkb-options = [ "terminate:ctrl_alt_bksp" ];
    };
    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
      natural-scroll = false;
    };
    "org/gnome/mutter" = {
      dynamic-workspaces = false;
    };
    "org/gnome/desktop/wm/keybindings" = {
      switch-to-workspace-1 = [ "<Super>1" ];
      switch-to-workspace-2 = [ "<Super>2" ];
      switch-to-workspace-3 = [ "<Super>3" ];
      switch-to-workspace-4 = [ "<Super>4" ];
    };
    "org/gnome/desktop/wm/preferences" = {
      action-middle-click-titlebar = "minimize";
      button-layout = "appmenu:minimize,maximize,close";
      num-workspaces = 4;
    };
  };
}
