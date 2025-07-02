{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pika-backup
  ];
}
