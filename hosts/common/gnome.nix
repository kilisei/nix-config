{ pkgs, ... }:
{
  environment.gnome.excludePackages = with pkgs; [
    gnome-terminal
    gnome-console
    gnome-tour
    yelp
    epiphany
    geary
    gnome-contacts
    gnome-connections
    gnome-music
    totem
    simple-scan
    evince
    file-roller
    gnome-characters
    gnome-font-viewer
    gnome-maps
    gnome-weather
    gnome-logs
  ];
}
