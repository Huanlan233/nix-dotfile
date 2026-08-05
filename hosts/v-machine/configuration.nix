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
                XDG_DATA_DIRS = [ "/run/current-systen/sw/share" "/run/current-system/sw/share/icons" ];
                QT_QUICK_CONTROL_ICON_THEME = "Adwaita";
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
                type = "noctalia";
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

    virtualisation.vmware.guest.enable = true;
}
