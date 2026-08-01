# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, lib, ... }:

{
    imports = [ 
        ./hardware-configuration.nix
        ../default/configuration.nix
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
}
