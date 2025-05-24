{pkgs, ...}: {
  environment.gnome.excludePackages = with pkgs; [
    epiphany # Web browser
    evince # PDF viewer
    geary # Email client
    gnome-characters # Character map tool
    gnome-music # Music player
    gnome-terminal # Terminal emulator
    gnome-tour # GNOME introduction/tour
    gnome-contacts # Contact manager
    totem # Video player
    gnome-maps # Maps application
    file-roller # Archive manager
    gnome-connections # Remote desktop client
  ];
}
