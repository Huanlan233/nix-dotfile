{ config, lib, pkgs, inputs, ... }:

let
    cfg = config.settings.nixos.services.homeManager;

    inherit (builtins) attrNames pathExists readDir;

    # User nix files under homes/ are the source of truth.
    userDirs = lib.filterAttrs (
        name: type:
            type == "directory"
            && name != "shared"
            && name != "users"
    ) (readDir ../../../homes);

    userNames = attrNames userDirs;

    homeModuleFor = name: {
        # Optional per-user config: homes/<name>/default.nix.
        imports = lib.optional
            (pathExists ../../../homes/${name}/default.nix)
            ../../../homes/${name}/default.nix;
    };
in
{
    options.settings.nixos.services.homeManager.enable =
        lib.mkEnableOption "Home Manager user profiles";

    imports = [
        inputs.home-manager.nixosModules.home-manager
    ];

    config = lib.mkIf cfg.enable {
        home-manager = {
            extraSpecialArgs = { inherit inputs; };
            useGlobalPkgs = true;
            useUserPackages = false;

            sharedModules = [
                ../../../homes/shared/home.nix
            ];

            users = lib.genAttrs userNames homeModuleFor;
        };
    };
}
