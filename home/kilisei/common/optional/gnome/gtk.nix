{ pkgs, config, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "Colloid-Dark";
      package = pkgs.colloid-gtk-theme;
    };
    iconTheme = {
      name = "Colloid-Dark";
      package = pkgs.colloid-icon-theme;
    };
    gtk3 = {
      bookmarks = [
        "file://${config.xdg.userDirs.download}"
        "file://${config.xdg.userDirs.documents}"
        "file://${config.xdg.userDirs.pictures}"
        "file://${config.xdg.userDirs.music}"
        "file://${config.xdg.userDirs.videos}"
        "file://${config.home.homeDirectory}/nix-config"
        "file://${config.home.homeDirectory}/dev"
      ];
    };
  };
  home.packages = with pkgs; [
    gnome-tweaks
  ];
}
