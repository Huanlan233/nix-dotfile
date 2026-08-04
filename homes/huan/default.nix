{ config, lib, pkgs, inputs, ... }:

{
    imports = [
        ./programs/fcitx5.nix
        ./programs/git.nix
        ./programs/niri.nix
        ./apps.nix
        ../../modules/home/default.nix
    ];

    settings.home.editors.nixvim.enable = true;
}
