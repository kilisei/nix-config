{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    yubikey-manager
    yubioath-flutter
    pam_u2f
    yubikey-personalization
    yubikey-agent
    yubico-pam  
  ];

  programs.yubikey-touch-detector = {
    enable = true;
    libnotify = true;
  };

  services = {
    pcscd = {
      enable = true;
      plugins = [
        pkgs.yubikey-personalization
      ];
    };

    udev.packages = [ pkgs.yubikey-personalization ];
  };

  security.pam = {
    rssh.enable = true;
    u2f = {
      enable = true;
      settings.cue = true;
      control = "sufficient";
    };
    services = {
      login.u2fAuth = true;
      sudo = {
        rssh = true;
        u2fAuth = true;
      };
    };
    sshAgentAuth.enable = true;
  };
}
