{
  imports = [
    ./yubikey.nix
    ./i18n.nix
    ./nixpkgs.nix
    ./sops.nix
    ./gnome.nix
  ];

  services = {
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
    xserver.videoDrivers = [ "amdgpu" ];

    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };
  };

  security.rtkit.enable = true;

  systemd.services = {
    "getty@tty1".enable = false;
    "autovt@tty1".enable = false;
  };
}
