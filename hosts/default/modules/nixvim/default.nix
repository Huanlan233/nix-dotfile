{ config, pkgs, inputs, ...}:

{
    imports = [
        inputs.nixvim.nixosModules.nixvim
    ];

    programs.nixvim = {
        enable = true;
        opts = {
            tabstop = 4;
            shiftwidth = 4;
            expandtab = true;
            smartindent = true;
        };
    };
}
