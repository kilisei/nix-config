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

    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    services = {
      pcscd = {
        enable = true;
        plugins = [
          pkgs.yubikey-personalization
        ];
      };

      udev.packages = [pkgs.yubikey-personalization];
    };

    # run `pamu2fcfg > ~/.config/Yubico/u2f_keys`
    # if sudo or login is broken should fix login issues
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
