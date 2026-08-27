{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./fcitx5.nix
    ./git.nix
    ./gtk.nix
    ./niri.nix
    #./noctalia.nix
    ./dms.nix
    ./nixvim.nix
    ./zsh.nix
    ./starship.nix
    ./chromium.nix
    ./alacritty.nix
  ];
}
