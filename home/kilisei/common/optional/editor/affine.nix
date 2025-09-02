{ pkgs, ... }:
{
  home.packages = with pkgs; [
    affine
  ];
}
