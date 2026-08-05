{ config, pkgs, lib, inputs, ... }:

{
    imports = [
        ./hardware-configuration.nix
        ../../system/configuration.nix
    ];

    boot = {
        loader.grub = {
            enable = true;
            device = "/dev/sda";
            useOSProber = true;
            fsIdentifier = "provided";
        };
        kernelPackages = pkgs.linuxPackages_latest;
    };

    virtualisation.vmware.guest.enable = true;
}
