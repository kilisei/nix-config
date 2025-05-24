{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    kilisei.yubikey.enable = lib.mkEnableOption "";
  };

  config = lib.mkIf config.kilisei.yubikey.enable {
    environment.systemPackages = with pkgs; [
      yubikey-manager
      yubioath-flutter
    ];

    services = {
      pcscd = {
        enable = true;
        plugins = [
          pkgs.yubikey-personalization
        ];
      };

      udev.packages = [pkgs.yubikey-personalization];
    };

    security.pam = {
      u2f = {
        enable = true;
        settings.cue = true;
        control = "sufficient";
      };
      services = {
        login.u2fAuth = true;
        sudo.u2fAuth = true;
      };
      sshAgentAuth.enable = true;
    };
  };
}
