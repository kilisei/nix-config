{
  nixpkgs.config = {
    allowUnfree = true;
  };

  systemd.user.startServices = "sd-switch";
}
