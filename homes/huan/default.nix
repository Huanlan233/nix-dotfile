{ config, pkgs, inputs, ... }:

{
    imports = [
        inputs.nixvim.homeModules.nixvim
    ];

    home.username = "huan";
    home.homeDirectory = "/home/huan";

    home.packages = with pkgs; [
        firefox
    ];

    programs = {
        nixvim = {
            opts = {
                shiftwidth = 4;
                tabstop = 4;
                expandtab = true;
                smartindent = true;
            };
        };
        git = {
            enable = true;
            userName = "Huanlan233";
            userEmail = "huanlan233@outlook.com";
            extraConfig = {
                init.defaultBranch = "main";
            };
        };
    };
}
