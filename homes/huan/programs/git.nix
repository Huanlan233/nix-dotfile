{ config, lib, pkgs, ... }:

{
    programs.git = {
        enable = true;
        settings = {
            user.name = "Huanlan233";
            user.email = "huanlan233@outlook.com";
            init.defaultBranch = "main";
        };
    };
}
