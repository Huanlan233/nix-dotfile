{ config, lib, inputs, ... }:

let
cfg = config.settings.home.editors.nixvim;
in
{
    options.settings.home.editors.nixvim = {
        enable = lib.mkEnableOption "nixvim editor";

        opts = lib.mkOption {
            type = lib.types.attrsOf lib.types.anything;
            default = {
                tabstop = 4;
                shiftwidth = 4;
                expandtab = true;
                smartindent = true;
            };
            description = "nixvim editor options.";
        };
    };

    imports = [
        inputs.nixvim.homeModules.nixvim
    ];

    config = lib.mkIf cfg.enable {
        programs.nixvim = {
            enable = true;
            nixpkgs.source = inputs.nixpkgs;
            opts = cfg.opts;
        };
    };
}
