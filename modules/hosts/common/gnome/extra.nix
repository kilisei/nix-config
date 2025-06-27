{pkgs,...}:{
  environment.systemPackages = with pkgs; [
    gnome-sound-recorder
  ];
}
