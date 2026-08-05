{ config, pkgs, lib, inputs, ... }:

{
    imports = [
        inputs.home-manager.nixosModules.home-manager
        inputs.agenix.nixosModules.default
    ];

    environment = {
        pathsToLink = [
            "/share/applications"
            "/share/xdg-desktop-portal"
        ];

        variables = {

        };

        sessionVariables = {
            XMODIFIERS = "@im=fcitx";
            SDL_IM_MODULE = "fcitx";
            XDG_DATA_DIRS = [ "/run/current-systen/sw/share" "/run/current-system/sw/share/icons" ];
            QT_QUICK_CONTROL_ICON_THEME = "Adwaita";
        };

        systemPackages = with pkgs; [
            agenix-cli
            adwaita-icon-theme
            git
        ];
    };

    time = {
        timeZone = "Asia/Shanghai";
    };

    i18n = {
        defaultLocale = "zh_CN.UTF-8";
        extraLocaleSettings = {
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

        inputMethod = {
            enable = true;
            type = "fcitx5";
            fcitx5 = {
                addons = with pkgs; [
                fcitx5-rime
                fcitx5-gtk
                qt6Packages.fcitx5-configtool
                ];
                waylandFrontend = fcitx5.waylandFrontend;
            };
        };
    };

    networking = {
        hostName = "Ocean";
        wireless.enable = true;
        networkmanager.enable = true;
        firewall.enable = true;
    };

    hardware = {
        bluetooth.enable = true;
    };

    services = {
        greetd = {
            enable = true;
            useTextGreeter = false;
            settings.default_session.command = "${lib.getExe pkgs.tuigreet} --asterisks";
        };
    };

    programs = {
        niri = {
            enable = true;
        };

        noctalia = {
            enable = true;
            recommendedServices.enable = true;
            systemd.enable = true;
        };
    };

    users.users = {
        "huan" = {
            isNormalUser = true;
            description = "Huan";
            extraGroups = [ "networkmanager" "wheel" ];
            openssh.authorizedKeys.keys = [ ];
        }
    };

    home-manager = {
        extraSpecialArgs = { inherit inputs; };
        useGlobalPkgs = true;
        useUserPackages = false;

        sharedModules = [
            ../homes/shared/home.nix
        ];

        users = {
            "huan" = import ../homes/default.nix
        };
    };

    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    stateVersion = "26.05";
}