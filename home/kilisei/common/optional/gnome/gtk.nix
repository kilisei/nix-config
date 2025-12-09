{ pkgs, config, ... }:
{
  nixpkgs.overlays = [
    (self: prev: {
      colloid-icon-theme = prev.colloid-icon-theme.overrideAttrs (old: rec {
        src = prev.fetchFromGitHub {
          owner = "vinceliuice";
          repo = "colloid-icon-theme";
          rev = "2025-07-19";
          hash = "sha256-CzFEMY3oJE3sHdIMQQi9qizG8jKo72gR8FlVK0w0p74=";
        };

        nativeBuildInputs = (old.nativeBuildInputs or [ ]) ++ [ prev.rmlint ];

        installPhase = ''
          runHook preInstall
          args=""

          ${prev.lib.optionalString (old.schemeVariants or [ ] != [ ]) ''
            args+=" --scheme ${toString (old.schemeVariants or [ ])}"
          ''}

          ${prev.lib.optionalString (old.colorVariants or [ ] != [ ]) ''
            args+=" --theme ${toString (old.colorVariants or [ ])}"
          ''}

          ./install.sh --dest $out/share/icons $args

          # Deduplicate files and remove broken symlinks
          rmlint --types="duplicates,badlinks" \
                 --config=sh:handler=symlink \
                 --output=sh:$TMPDIR/rmlint.sh \
                 $out/share
          if [ -f "$TMPDIR/rmlint.sh" ]; then
            sh $TMPDIR/rmlint.sh -d -q
          fi

          runHook postInstall
        '';
      });
    })
  ];

  gtk = {
    enable = true;
    theme = {
      name = "Colloid-Dark";
      package = pkgs.colloid-gtk-theme;
    };
    iconTheme = {
      name = "colloid-icon-theme-2025-02-09-Light";
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
    mission-center
  ];
}
