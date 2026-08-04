{ config, lib, ... }:

let
    cfg = config.settings.nixos.system.locale;
in
{
    options.settings.nixos.system.locale = {
        enable = lib.mkEnableOption "locale and timezone settings";

        timeZone = lib.mkOption {
            type = lib.types.str;
            default = "Asia/Shanghai";
            description = "System timezone.";
        };

        defaultLocale = lib.mkOption {
            type = lib.types.str;
            default = "zh_CN.UTF-8";
            description = "Default system locale.";
        };

        extraLocaleSettings = lib.mkOption {
            type = lib.types.attrsOf lib.types.str;
            default = {
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
            description = "Additional locale category settings.";
        };
    };

    config = lib.mkIf cfg.enable {
        time.timeZone = cfg.timeZone;
        i18n.defaultLocale = cfg.defaultLocale;
        i18n.extraLocaleSettings = cfg.extraLocaleSettings;
    };
}
