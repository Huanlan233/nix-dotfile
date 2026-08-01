# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, lib, ... }:

{
    imports = [
        ./modules/home-manager/default.nix
        ./modules/niri/default.nix
        ./modules/nixvim/default.nix
        ./modules/noctalia/default.nix
        ./modules/agenix/default.nix
    ];

    hardware = {
        bluetooth.enable = true;
    };

    networking = {
        hostName = "huan";
        wireless.enable = true;
        networkmanager.enable = true;

        #proxy.default = "http://user:password@proxy:port/";
        #proxy.noProxy = "127.0.0.1,localhost,internal.domain";
        
        firewall.enable = true;
        #firewall.allowedTCPPorts = [ ... ];
        #firewall.allowedUDPPorts = [ ... ];
    };

    time = {
        timeZone = "Asia/Shanghai";
    };

    i18n.defaultLocale = "zh_CN.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "zh_CN.UTF-8";
        LC_IDENTIFICATION = "zh_CN.UTF-8";
        LC_MEASUREMENT = "zh_CN.UTF-8";
        LC_MONETARY = "zh_CN.UTF-8";
        LC_NAME = "zh_CN.UTF-8";
        LC_NUMERIC = "zh_CN.UTF-8";
        LC_PAPER = "zh_CN.UTF-8";
        LC_TELEPHONE = "zh_CN.UTF-8";
        LC_TIME = "zh_CN.UTF-8";
    };

    services = {
        greetd = {
            enable = true;
            settings.default_session = {
                user = "greeter";
                command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd niri-session --asterisks";
            };
        };
    };

    users.users."huan" = {
        isNormalUser = true;
        description = "Huan";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [
        ];

        openssh.authorizedKeys.keys = [
        ];
    };

    nixpkgs.config.allowUnfree = true;

    environment = {
        pathsToLink = [ 
            "/share/applications"
            "/share/xdg-desktop-portal"
        ]; 

        systemPackages = with pkgs; [
            tuigreet
            wget
            git
            alacritty
            kdePackages.dolphin
            kdePackages.qtsvg
            kdePackages.kio
            kdePackages.kio-fuse
            kdePackages.kio-extras
            agenix-cli
        ];
    };
    
    system = {
        stateVersion = "26.05"; # Did you read the comment?
    };
    
    nix = {
        settings = {
            experimental-features = ["nix-command" "flakes"];
        };
    };
}
