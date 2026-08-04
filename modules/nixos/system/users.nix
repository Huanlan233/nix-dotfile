{ config, lib, ... }:

let
    inherit (builtins) attrNames pathExists readDir;

    userDirs = lib.filterAttrs (
        name: type:
          type == "directory"
          && name != "shared"
          && name != "users"
    ) (readDir ../../../homes);

    userNames = attrNames userDirs;

    accountFor = name:
        if pathExists ../../../homes/${name}/user.nix then
            import ../../../homes/${name}/user.nix
        else {
            isNormalUser = true;
        };

    cfg = config.settings.nixos.system.users;
in
{
    options.settings.nixos.system.users = {
        enable = lib.mkEnableOption "automatic user definitions from homes/";

        include = lib.mkOption {
            type = lib.types.listOf lib.types.str;
            default = userNames;
            description = "User names to define from homes/<name>/user.nix.";
        };
    };

    config = lib.mkIf cfg.enable {
        users.users = lib.mkMerge (
            map (name: { ${name} = accountFor name; }) cfg.include
        );
    };
}
