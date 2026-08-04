{ config, lib, pkgs, inputs, ... }:

{
    imports = [
        ./apps.nix
        ../../modules/home/default.nix
    ];

    settings.home.editors.nixvim.enable = true;
}
