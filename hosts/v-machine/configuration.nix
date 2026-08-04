{ config, pkgs, lib, inputs, ... }:

{
    imports = [
        ./hardware-configuration.nix
        ../shared/configuration.nix
    ];

    settings.nixos = {
        system.version = {
            stateVersion = "26.05";
        };

        system.env = {
            pathsToLink = [
                "/share/applications"
                "/share/xdg-desktop-portal"
            ];

            sessionVars = {
                XMODIFIERS = "@im=fcitx";
                SDL_IM_MODULE = "fcitx";
            };

            vars = {

            };

            sysPkgs = with pkgs; [

            ];
        };

        services = {
            homeManager.enable = true;
            agenix.enable = true;
        };

        system.locale = {
            enable = true;
            timeZone = "Asia/Shanghai";
            defaultLocale = "zh_CN.UTF-8";
        };

        system.network = {
            enable = true;
            hostName = "huan";
            wireless = true;
            networkmanager = true;
            firewall = true;
        };

        system.nix = {
            enable = true;
            allowUnfree.enable = true;
            experimentalFeatures = [];
        };

        system.users = {
            enable = true;
        };

        hardware = {
            bluetooth.enable = true;
        };

        desktop = {
            displayManager = {
                enable = true;
                type = "greetd";
            };

            greeter = {
                enable = true;
                type = "dankgreeter"; # or "tuigreet"
            };

            compositor = {
                enable = true;
                type = "niri";
            };

            shell = {
                enable = true;
                type = "dms";
            };

            inputMethod = {
                enable = true;
                type = "fcitx5"; # or "ibus"
            };
        };
        };

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
